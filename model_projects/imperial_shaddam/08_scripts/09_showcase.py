"""Step 09 - render showcase angles straight from a saved .blend.

    blender -b --python 09_showcase.py -- <blend> <out_dir> [tag]

The .blend already contains a camera, lights and a world, so the cleanest way
to show "the finished product" is to open the .blend and point the camera at
the model from a few angles.  Nothing is modified and nothing is re-saved.

Renders: front, three-quarter, side, back, back close-up.
"""
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import script_args

argv = script_args()
blend = os.path.abspath(argv[0]) if argv else ""
out_dir = os.path.abspath(argv[1]) if len(argv) > 1 else ""
tag = argv[2] if len(argv) > 2 else "model"
if not blend or not out_dir:
    raise SystemExit("usage: 09_showcase.py -- <blend> <out_dir> [tag]")

os.makedirs(out_dir, exist_ok=True)
bpy.ops.wm.open_mainfile(filepath=blend)
print("OPENED", blend)

sc = bpy.context.scene
cam = sc.camera
if cam is None:
    raise SystemExit("no camera in the blend")

body = max((o for o in bpy.data.objects if o.type == "MESH"),
            key=lambda o: len(o.data.polygons), default=None)
if body is None:
    raise SystemExit("no mesh in the blend")

sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1200
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"

bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = max(hi.z - lo.z, 0.2)
width = max(hi.x - lo.x, hi.y - lo.y, 0.2)
scale = max(height, width) * 1.12

# (name, azimuth deg, elevation deg, distance, target height)
ANGLES = [
    ("front", 0.0, 4.0, 4.6, 1.05),
    ("three_quarter", 35.0, 4.0, 4.6, 1.05),
    ("side", 90.0, 4.0, 4.6, 1.05),
    ("back", 180.0, 4.0, 4.6, 1.05),
    ("back_closeup", 180.0, 2.0, 2.4, 1.25),
]

import math
for name, az, el, dist, tz in ANGLES:
    a = math.radians(az)
    e = math.radians(el)
    target = Vector((centre.x, centre.y, tz))
    pos = target + Vector((math.sin(a) * math.cos(e),
                           -math.cos(a) * math.cos(e),
                           math.sin(e))) * dist
    cam.location = pos
    cam.rotation_euler = (target - pos).to_track_quat("-Z", "Y").to_euler()
    out = os.path.join(out_dir, "%s_%s.png" % (tag, name))
    sc.render.filepath = out
    bpy.ops.render.render(write_still=True)
    print("RENDERED", out, os.path.getsize(out), "bytes")
