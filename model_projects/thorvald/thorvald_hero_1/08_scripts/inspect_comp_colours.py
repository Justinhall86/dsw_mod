"""Render chosen components of one object in flat colours (rest pose), everything else grey - to identify parts.

  blender -b --factory-startup --python inspect_comp_colours.py -- <blend> <object> <out.png> <view> <cx,cy,cz> <ortho> <comp> ...
"""
import colorsys
import math
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.open_mainfile(filepath=a[0])
obj = bpy.data.objects[a[1]]
out, view, c, ortho = a[2], a[3], Vector([float(v) for v in a[4].split(",")]), float(a[5])
ids = [int(v) for v in a[6:]]
sc = bpy.context.scene
for o in bpy.data.objects:
    if o.type == "ARMATURE":
        o.data.pose_position = "REST"
    if o.type == "MESH" and o is not obj:
        o.hide_render = True
comps = P.components(obj)
grey = bpy.data.materials.new("grey")
grey.diffuse_color = (0.5, 0.5, 0.5, 1)
mats = [grey]
for k, cid in enumerate(ids):
    m = bpy.data.materials.new("c%d" % cid)
    m.diffuse_color = (*colorsys.hsv_to_rgb(k / max(len(ids), 1), 0.9, 1.0), 1)
    mats.append(m)
obj.data.materials.clear()
for m in mats:
    obj.data.materials.append(m)
vmat = {}
for k, cid in enumerate(ids):
    for i in comps[cid]:
        vmat[i] = k + 1
for p in obj.data.polygons:
    p.material_index = vmat.get(p.vertices[0], 0)
for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
sc.render.engine = "BLENDER_WORKBENCH"
sc.display.shading.color_type = "MATERIAL"
sc.render.resolution_x = sc.render.resolution_y = 600
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = ortho
sc.collection.objects.link(cam)
sc.camera = cam
D = {"front": (0, -1, 0), "back": (0, 1, 0), "side": (1, 0, 0), "tq": (0.7, -0.7, 0.2), "top": (0.1, -0.3, 1)}
cam.location = c + Vector(D[view]).normalized() * 4
cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
sc.render.filepath = out
bpy.ops.render.render(write_still=True)
print("COMPS", [(cid, len(comps[cid])) for cid in ids])
