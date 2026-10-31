"""Render a .blend from many angles with BACK-FACE CULLING ON (what the game shows), to spot see-through slots, jagged seams and holes.

    blender -b <file.blend> --python audit_views.py -- <out_dir> <tag> [target_z] [ortho_scale] [px]

Views: front, back, left, right, top, bottom, and four high / low three-quarters.  Saves <out_dir>/<tag>_<view>.png.
"""
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
tz = float(a[2]) if len(a) > 2 else 1.0
scale = float(a[3]) if len(a) > 3 else 2.3
px = int(a[4]) if len(a) > 4 else 600
os.makedirs(out, exist_ok=True)
for m in bpy.data.materials:
    m.use_backface_culling = True
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(px, px)
views = {
    "front": (0, -1, 0.0), "back": (0, 1, 0.0), "left": (-1, 0, 0.0), "right": (1, 0, 0.0),
    "top": (0.0, -0.05, 1), "bottom": (0.0, -0.05, -1),
    "hi_fr": (0.7, -0.7, 0.55), "hi_bk": (-0.7, 0.7, 0.55), "lo_fr": (-0.7, -0.7, -0.45), "lo_bk": (0.7, 0.7, -0.45),
}
for name, d in views.items():
    cam = bs.setup_camera(target=Vector((0, 0, tz)), ortho_scale=scale, direction=d, distance=6)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("AUDIT done", tag)
