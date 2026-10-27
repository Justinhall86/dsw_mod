"""Game-style matte close-ups of the waist + apron (same cameras for before / after comparisons).

    blender -b <file.blend> --python shot_waist.py -- <out_dir> <tag> [px]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "08_scripts"))
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
px = int(a[2]) if len(a) > 2 else 700
os.makedirs(out, exist_ok=True)
PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
shots = [
    ("waist_front", (0, 0, 1.08), 0.95, (0, -1, 0.02), (px, int(px * 1.2))),
    ("waist_tq", (0, 0, 1.08), 1.0, (0.75, -0.75, 0.05), (px, int(px * 1.2))),
    ("apron_low", (0, 0, 0.88), 1.15, (0.3, -1, -0.12), (px, int(px * 1.2))),
    ("apron_back", (0, 0, 1.0), 1.15, (-0.3, 1, -0.08), (px, int(px * 1.2))),
]
for name, tgt, sc, d, res in shots:
    bs.setup_render(int(res[0]), int(res[1]))
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc, direction=d, distance=5)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("WAISTSHOT done", tag)
