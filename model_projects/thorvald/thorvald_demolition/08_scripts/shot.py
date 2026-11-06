"""Render one close-up of a saved .blend from an orthographic camera.

    blender -b <file.blend> --python shot.py -- <out.png> <tx> <ty> <tz> <dx> <dy> <dz> <ortho_scale> [px]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(a[0])
tx, ty, tz, dx, dy, dz, sc = [float(x) for x in a[1:8]]
px = int(a[8]) if len(a) > 8 else 700
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(px, px)
cam = bs.setup_camera(target=Vector((tx, ty, tz)), ortho_scale=sc, direction=(dx, dy, dz), distance=4)
bs.render_to(out, cam)
