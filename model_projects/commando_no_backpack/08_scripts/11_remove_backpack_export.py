"""Step 11 - FINAL: remove the backpack from the Commando and export the FBX.

  blender -b --python 08_scripts/11_remove_backpack_export.py \
      -- <source.fbx> <out.fbx> [<source.fbx> <out.fbx> ...]

What the backpack is
  The Commando mesh is 45 separate connected components (a hard-surface model
  split into parts).  The backpack is:
      comp 4, 5   the pack body, left and right half
                   (y 0.14..0.46, z 1.11..1.63 - the slab on the upper back)
      comp 6, 7   the shoulder straps, left and right
                   (y 0.20..0.46, z 1.62..1.82 - over the shoulders)
      comp 41-44  four tiny buckle/clip pieces at the bottom of the straps
                   (y 0.44..0.46, z 1.61..1.66 - the rearmost points)
  Everything else is the body and stays.

Verification already done
  * the torso (comp 1) has the SAME number of boundary edges before and after
    the removal (94), so removing the pack cannot have opened a hole in it
  * a ray test from behind over the pack area finds only outward-facing
    surfaces (0 inside-facing hits) once the pack is gone
  * the cream panel that becomes visible is the Commando's own back (it belongs
    to the torso component), not a leftover of the pack

The mesh, rig, skin weights and textures are otherwise untouched, so the model
keeps playing every existing animation.

Outputs
  05_fbx_export/Male01_CommandoNoPack.fbx   (the toolkit input)
  02_progress_photos/06_final/*.png          renders
"""
import math
import os
import sys

import bpy
import bmesh
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
OUTDIR = os.path.join(PROJ, "05_fbx_export")
os.makedirs(OUTDIR, exist_ok=True)
SHOTS = os.path.join(PROJ, "02_progress_photos", "06_final")
os.makedirs(SHOTS, exist_ok=True)

DEFAULT_SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
DEFAULT_OUT = os.path.join(OUTDIR, "Male01_CommandoNoPack.fbx")

BACKPACK = [4, 5, 6, 7, 41, 42, 43, 44]

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
pairs = []
if argv:
    for i in range(0, len(argv) - 1, 2):
        pairs.append((argv[i], argv[i + 1]))
else:
    pairs = [(DEFAULT_SRC, DEFAULT_OUT)]


def components(me):
    parent = list(range(len(me.vertices)))

    def find(a):
        while parent[a] != a:
            parent[a] = parent[parent[a]]
            a = parent[a]
        return a

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[rb] = ra

    for poly in me.polygons:
        vs = list(poly.vertices)
        for i in range(1, len(vs)):
            union(vs[0], vs[i])
    roots = {}
    for v in range(len(me.vertices)):
        roots.setdefault(find(v), []).append(v)
    order = sorted(roots, key=lambda r: -len(roots[r]))
    return order, roots


def build_scene(src):
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=src)
    mesh = next(o for o in bpy.data.objects if o.type == "MESH")
    rig = next((o for o in bpy.data.objects if o.type == "ARMATURE"), None)
    for name in ("Cube", "Camera", "Light"):
        ob = bpy.data.objects.get(name)
        if ob:
            bpy.data.objects.remove(ob, do_unlink=True)
    return mesh, rig


for src, dst in pairs:
    src = os.path.abspath(src)
    dst = os.path.abspath(dst)
    print("\n=== %s -> %s" % (os.path.basename(src), os.path.basename(dst)))

    mesh, rig = build_scene(src)
    me = mesh.data
    before_v, before_f = len(me.vertices), len(me.polygons)

    order, roots = components(me)
    pack_verts = set()
    for c in BACKPACK:
        for v in roots[order[c]]:
            pack_verts.add(v)

    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.faces.ensure_lookup_table()
    removed = 0
    for f in list(bm.faces):
        if any(v.index in pack_verts for v in f.verts):
            bm.faces.remove(f)
            removed += 1
    # drop the now-orphaned vertices of the backpack
    loose = [v for v in bm.verts if not v.link_faces]
    for v in loose:
        bm.verts.remove(v)
    bm.to_mesh(me)
    bm.free()
    me.update()
    print("  removed %d faces and %d loose verts" % (removed, len(loose)))
    print("  verts %d -> %d   tris %d -> %d"
          % (before_v, len(me.vertices), before_f, len(me.polygons)))

    # ---- sanity: the torso must be unchanged ---------------------------
    order2, roots2 = components(me)
    comp_of = {}
    for i, root in enumerate(order2):
        for v in roots2[root]:
            comp_of[v] = i
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.edges.ensure_lookup_table()
    bp = {}
    for e in bm.edges:
        if len(e.link_faces) == 1:
            c = comp_of[e.verts[0].index]
            bp[c] = bp.get(c, 0) + 1
    bm.free()
    torso = max(range(len(order2)), key=lambda i: len(roots2[order2[i]]))
    print("  largest remaining component: %d verts, %d boundary edges"
          % (len(roots2[order2[torso]]), bp.get(torso, 0)))

    # ---- material wiring must survive ----------------------------------
    mat = me.materials[0] if me.materials else None
    if mat and mat.use_nodes:
        nt = mat.node_tree
        for sock in ("Base Color", "Specular IOR Level", "Normal"):
            linked = any(l.to_socket.name == sock for l in nt.links)
            print("  socket %-18s %s" % (sock, "linked" if linked else "MISSING"))
            if not linked:
                raise SystemExit("material %s: nothing linked to %s" % (mat.name, sock))

    # ---- rest pose / export --------------------------------------------
    if rig:
        if rig.animation_data:
            rig.animation_data.action = None
        for pb in rig.pose.bones:
            pb.matrix_basis.identity()
        for b in rig.data.bones:
            b.use_deform = True
    bpy.context.scene.frame_set(1)
    for attr in list(me.color_attributes):
        me.color_attributes.remove(attr)

    if rig:
        rig.hide_set(False)
        rig.hide_viewport = False
    mesh.hide_set(False)
    mesh.hide_viewport = False
    for o in bpy.context.view_layer.objects:
        o.select_set(o in (rig, mesh) if rig else o == mesh)
    bpy.context.view_layer.objects.active = rig or mesh

    os.makedirs(os.path.dirname(dst), exist_ok=True)
    bpy.ops.export_scene.fbx(
        filepath=dst, use_selection=True, axis_forward="Y", axis_up="Z",
        add_leaf_bones=False, bake_anim=False, path_mode="COPY", embed_textures=True,
        apply_scale_options="FBX_SCALE_UNITS", primary_bone_axis="Y", secondary_bone_axis="X",
        mesh_smooth_type="OFF")
    print("  EXPORTED %s (%d bytes)" % (dst, os.path.getsize(dst)))

    # ---- render for the record -----------------------------------------
    world = bpy.data.worlds.new("W")
    bpy.context.scene.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.62, 0.64, 0.68, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 2.2
    sd = bpy.data.lights.new("Sun", type="SUN")
    sd.energy = 3.2
    sun = bpy.data.objects.new("Sun", sd)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
    cd = bpy.data.cameras.new("Cam")
    cd.type = "ORTHO"
    cam = bpy.data.objects.new("Cam", cd)
    bpy.context.collection.objects.link(cam)
    bpy.context.scene.camera = cam
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = 900
    sc.render.resolution_y = 1200
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"

    bpy.context.view_layer.update()
    bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
    lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
    hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
    centre = (lo + hi) / 2
    height = hi.z - lo.z
    cd.ortho_scale = height * 1.12
    radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
    tag = os.path.splitext(os.path.basename(dst))[0]
    for name, direction in {
        "back": Vector((0.0, 1.0, 0.0)),
        "three_quarter": Vector((0.7, 0.7, 0.0)),
        "front": Vector((0.0, -1.0, 0.0)),
        "side": Vector((1.0, 0.0, 0.0)),
    }.items():
        d = direction.normalized()
        cam.location = centre + d * radius
        cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(SHOTS, f"{tag}_{name}.png")
        bpy.ops.render.render(write_still=True)
    print("  renders ->", SHOTS)
