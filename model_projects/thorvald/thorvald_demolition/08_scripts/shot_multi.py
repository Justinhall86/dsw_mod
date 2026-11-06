"""Several culled close-ups of one spot, from six sides.

    blender -b <file.blend> --python shot_multi.py -- <out_dir> <tag> <tx> <ty> <tz> <ortho_scale> [px]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
t = Vector([float(x) for x in a[2:5]])
scale = float(a[5])
px = int(a[6]) if len(a) > 6 else 600
os.makedirs(out, exist_ok=True)
for m in bpy.data.materials:
    m.use_backface_culling = True
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(px, px)
for name, d in {"front": (0, -1, 0.1), "back": (0, 1, 0.1), "side": (1, 0, 0.1), "inner": (-1, 0, 0.1), "top": (0, -0.05, 1), "under": (0.1, -0.1, -1)}.items():
    cam = bs.setup_camera(target=t, ortho_scale=scale, direction=d, distance=5)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("MULTI done", tag)
