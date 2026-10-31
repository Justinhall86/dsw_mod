"""v5 study: (a) HouseGuard shoulders close-up (how its pauldron/neck is built), (b) the guard's hood
(components 17/18) alone with height bands, to pick where the hood flare can be clipped.

  blender -b --python 08_scripts/v5_07_shoulder_study.py
"""
import math
import os

import bmesh
import bpy
from mathutils import Vector

MP = r"C:\Users\justi\Python\dsw_mod\model_projects"
OUT = os.path.join(MP, "landsraad_elite", "02_progress_photos", "15_shoulder_study")
os.makedirs(OUT, exist_ok=True)


def components(obj):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack, c = [v], []
        seen.add(v.index)
        while stack:
            x = stack.pop()
            c.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(c)
    bm.free()
    return sorted(comps, key=len, reverse=True)


def setup(sc):
    for o in [o for o in bpy.data.objects if o.type in ("CAMERA", "LIGHT")]:
        bpy.data.objects.remove(o, do_unlink=True)
    for o in bpy.data.objects:
        if o.type == "ARMATURE":
            o.data.pose_position = "REST"
    w = bpy.data.worlds.new("W")
    sc.world = w
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    w.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    for nm, kind, en, loc, rot, size in (("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35), None),
                                         ("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), 3.0),
                                         ("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), 2.0)):
        ld = bpy.data.lights.new(nm, kind)
        ld.energy = en
        if size:
            ld.size = size
        o = bpy.data.objects.new(nm, ld)
        bpy.context.collection.objects.link(o)
        o.location = loc
        o.rotation_euler = [math.radians(a) for a in rot]
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = sc.render.resolution_y = 600
    sc.view_settings.view_transform = "Standard"


def shoot(sc, prefix, centre, scale, views=(("front", (0, -1, 0)), ("tq", (-0.9, -1, 0)), ("side", (-1, 0, 0)), ("back", (0, 1, 0)))):
    for tag, d in views:
        cd = bpy.data.cameras.new(tag)
        cam = bpy.data.objects.new(tag, cd)
        bpy.context.collection.objects.link(cam)
        cam.location = Vector(centre) + Vector(d).normalized() * 4
        cam.rotation_euler = (Vector(centre) - cam.location).to_track_quat("-Z", "Y").to_euler()
        cd.type, cd.ortho_scale = "ORTHO", scale
        sc.camera = cam
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (prefix, tag))
        bpy.ops.render.render(write_still=True)


# (a) HouseGuard
bpy.ops.wm.open_mainfile(filepath=os.path.join(MP, "imperial_houseguard", "03_blender", "Imperial_HouseGuard.blend"))
sc = bpy.context.scene
setup(sc)
for o in bpy.data.objects:
    if o.type == "MESH" and o.name != "Imperial":
        o.hide_render = True
shoot(sc, "houseguard", (0, 0, 1.6), 0.95)

# (b) guard hood alone, with a z-band overlay so cut heights can be read
bpy.ops.wm.open_mainfile(filepath=os.path.join(MP, "landsraad_guard", "03_blender", "landsraad_guard_halberd_preview.blend"))
sc = bpy.context.scene
setup(sc)
for o in bpy.data.objects:
    if o.type == "ARMATURE" and o.animation_data:
        o.animation_data.action = None
guard = bpy.data.objects["LandsraadGuard"]
for o in bpy.data.objects:
    if o.type == "MESH" and o is not guard:
        o.hide_render = True
cs = components(guard)
hood = set(cs[17]) | set(cs[18])
zs = [guard.data.vertices[i].co.z for i in hood]
xs = [abs(guard.data.vertices[i].co.x) for i in hood]
print("H hood verts", len(hood), "z %.3f..%.3f  |x| max %.3f" % (min(zs), max(zs), max(xs)))
for zc in (1.55, 1.60, 1.65, 1.70, 1.75, 1.80):
    print("H   below z=%.2f: %d verts, |x|max above %.3f" % (
        zc, sum(1 for z in zs if z < zc), max(x for x, z in zip(xs, zs) if z >= zc)))
shoot(sc, "guard_full", (0, 0, 1.6), 0.95)
# thin z-lines at 1.60 / 1.70 / 1.80 so the cut heights are readable
for z, col in ((1.60, (1, 0, 0, 1)), (1.70, (0, 0.8, 0, 1)), (1.80, (0, 0, 1, 1))):
    bpy.ops.mesh.primitive_cube_add(size=1, location=(0, -0.25, z))
    ln = bpy.context.active_object
    ln.scale = (1.2, 0.002, 0.003)
    m = bpy.data.materials.new("z%.2f" % z)
    m.use_nodes = True
    m.node_tree.nodes["Principled BSDF"].inputs["Emission Color"].default_value = col
    m.node_tree.nodes["Principled BSDF"].inputs["Emission Strength"].default_value = 5
    ln.data.materials.append(m)
bm = bmesh.new()
bm.from_mesh(guard.data)
bm.verts.ensure_lookup_table()
bmesh.ops.delete(bm, geom=[v for v in bm.verts if v.index not in hood], context="VERTS")
bm.to_mesh(guard.data)
bm.free()
shoot(sc, "guard_hood", (0, 0, 1.65), 0.8, views=(("front", (0, -1, 0)), ("tq", (-0.9, -1, 0)), ("side", (-1, 0, 0))))
