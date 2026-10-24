"""v5 step 1: render every upper-body component of the donor bodies ALONE (front, ortho) so the
shoulder / collar / chest parts can be chosen by eye.

  blender -b --python 08_scripts/v5_02_part_gallery.py -- [donor ...]

Writes 02_progress_photos/12_part_gallery/<donor>/part_<id>_<verts>v_<bone>.png ; the id is the
component's rank by vertex count (same ids as v5_01_graft_prototype.py).
"""
import os
import sys
from collections import defaultdict

import bmesh
import bpy
from mathutils import Vector

MP = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects"
OUT = os.path.join(MP, "landsraad_elite", "02_progress_photos", "12_part_gallery")
DONORS = {
    "guard_vanilla": "landsraad_guard/03_blender/landsraad_guard_halberd_preview.blend",
    "houseguard": "imperial_houseguard/03_blender/Imperial_HouseGuard.blend",
    "sardaukar": "imperial_sardaukar/03_blender/Imperial_Sardaukar.blend",
    "aramsham": "imperial_aramsham/03_blender/Imperial_Aramsham.blend",
    "trooper": "imperial_trooper/03_blender/Imperial_Trooper.blend",
    "gurney": "gurney/03_blender/Male01_AtreidesGurney.blend",
    "flamethrower": "imperial_flamethrower/03_blender/Imperial_FlameThrower.blend",
}


def components(obj):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack, comp = [v], []
        seen.add(v.index)
        while stack:
            x = stack.pop()
            comp.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(comp)
    bm.free()
    return sorted(comps, key=len, reverse=True)


def keep_only(obj, keep):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if v.index not in keep], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()


args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else list(DONORS)
for tag in args:
    bpy.ops.wm.open_mainfile(filepath=os.path.join(MP, DONORS[tag]))
    sc = bpy.context.scene
    for o in [o for o in bpy.data.objects if o.type in ("CAMERA", "LIGHT")]:
        bpy.data.objects.remove(o, do_unlink=True)
    for o in bpy.data.objects:
        if o.type == "ARMATURE":
            o.data.pose_position = "REST"
            if o.animation_data:
                o.animation_data.action = None
    body = max([o for o in bpy.data.objects if o.type == "MESH" and len(o.data.vertices) > 500],
               key=lambda o: len(o.data.polygons))
    for o in bpy.data.objects:
        if o.type == "MESH" and o is not body:
            o.hide_render = True
    gname = {g.index: g.name for g in body.vertex_groups}
    comps = components(body)
    world = bpy.data.worlds.new("W")
    sc.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    for nm, kind, en, loc, rot, size in (("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35), None),
                                         ("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), 3.0),
                                         ("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), 2.0)):
        import math
        ld = bpy.data.lights.new(nm, kind)
        ld.energy = en
        if size:
            ld.size = size
        o = bpy.data.objects.new(nm, ld)
        bpy.context.collection.objects.link(o)
        o.location = loc
        o.rotation_euler = [math.radians(a) for a in rot]
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = sc.render.resolution_y = 360
    sc.view_settings.view_transform = "Standard"
    cd = bpy.data.cameras.new("c")
    cam = bpy.data.objects.new("c", cd)
    bpy.context.collection.objects.link(cam)
    centre = Vector((0, 0, 1.5))
    cam.location = centre + Vector((0, -4, 0))
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    cd.type, cd.ortho_scale = "ORTHO", 1.25
    sc.camera = cam
    os.makedirs(os.path.join(OUT, tag), exist_ok=True)
    body.hide_render = True
    n = 0
    for ci, comp in enumerate(comps):
        if len(comp) < 50:
            continue
        pts = [body.matrix_world @ body.data.vertices[i].co for i in comp]
        zc = sum(p.z for p in pts) / len(pts)
        if zc < 1.3:
            continue
        w = defaultdict(float)
        for i in comp:
            for g in body.data.vertices[i].groups:
                w[gname[g.group]] += g.weight
        top = max(w.items(), key=lambda kv: kv[1])[0].replace("B_", "").replace("J", "") if w else "none"
        if top.startswith(("l", "r")) and top[1:3] in ("Wr", "Fi", "Th"):
            continue  # hands
        part = body.copy()
        part.data = body.data.copy()
        bpy.context.collection.objects.link(part)
        keep_only(part, set(comp))
        part.hide_render = False
        sc.render.filepath = os.path.join(OUT, tag, "part_%02d_%03dv_%s.png" % (ci, len(comp), top))
        bpy.ops.render.render(write_still=True)
        bpy.data.objects.remove(part, do_unlink=True)
        n += 1
    print("G", tag, n, "parts rendered")
