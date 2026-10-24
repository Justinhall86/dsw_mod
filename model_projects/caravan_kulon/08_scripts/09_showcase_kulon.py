"""Showcase the saved CaravanKulon.blend from several angles (landscape).

    blender -b --python 09_showcase_kulon.py -- <blend> <out_dir> [tag]

Both Kulon variants sit side by side, so the frame is computed from the union of
their bounds and rendered 1600x1000 (portrait would crop the pair).
"""
import math
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import script_args

argv = script_args()
blend = os.path.abspath(argv[0])
out_dir = os.path.abspath(argv[1])
tag = argv[2] if len(argv) > 2 else "caravan_kulon"
os.makedirs(out_dir, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=blend)
sc = bpy.context.scene
cam = sc.camera
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 1600
sc.render.resolution_y = 1000
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
bb = [o.matrix_world @ Vector(c) for o in meshes for c in o.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
scale = max(hi.z - lo.z, hi.x - lo.x, hi.y - lo.y) * 1.16
cam.data.type = "ORTHO"
cam.data.ortho_scale = scale

ANGLES = [
    ("front", 0.0, 6.0, 1.05),
    ("three_quarter", 30.0, 8.0, 1.0),
    ("three_quarter_other", -30.0, 8.0, 1.0),
    ("high_three_quarter", 35.0, 28.0, 1.0),
]

for name, az, el, tz in ANGLES:
    a = math.radians(az)
    e = math.radians(el)
    target = Vector((centre.x, centre.y, tz))
    pos = target + Vector((math.sin(a) * math.cos(e),
                           -math.cos(a) * math.cos(e),
                           math.sin(e))) * scale * 3.0
    cam.location = pos
    cam.rotation_euler = (target - pos).to_track_quat("-Z", "Y").to_euler()
    out = os.path.join(out_dir, "%s_%s.png" % (tag, name))
    sc.render.filepath = out
    bpy.ops.render.render(write_still=True)
    print("RENDERED", out, os.path.getsize(out), "bytes")

# close-ups, one per variant
for name, tz in (("Kulon01_Caravan", 1.0), ("Kulon02_TurretCarrier", 1.0)):
    body = bpy.data.objects[name]
    bbb = [body.matrix_world @ Vector(c) for c in body.bound_box]
    blo = Vector((min(v.x for v in bbb), min(v.y for v in bbb), min(v.z for v in bbb)))
    bhi = Vector((max(v.x for v in bbb), max(v.y for v in bbb), max(v.z for v in bbb)))
    bc = (blo + bhi) / 2
    s = max(bhi.x - blo.x, bhi.y - blo.y, bhi.z - blo.z) * 1.18
    cam.data.ortho_scale = s
    target = Vector((bc.x, bc.y, tz * 0.62))
    pos = target + Vector((0.45, -1.0, 0.10)).normalized() * s * 3.0
    cam.location = pos
    cam.rotation_euler = (target - pos).to_track_quat("-Z", "Y").to_euler()
    out = os.path.join(out_dir, "%s_closeup_%s.png" % (tag, name))
    sc.render.filepath = out
    bpy.ops.render.render(write_still=True)
    print("RENDERED", out, os.path.getsize(out), "bytes")
