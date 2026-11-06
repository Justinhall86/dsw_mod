"""Game-style matte preview close-ups of fixed spots (same cameras for before / after comparisons).

    blender -b <file.blend> --python shot_game.py -- <out_dir> <tag> [px]

Wiring: preview_wiring.apply_all (R metallic, G gloss, B AO read the way the game reads them, neutral soft world), back-face culling ON.
Shots: full (3/4 and front), chest + pauldron, back plate, forearm guard, boots, head.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
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
    ("full_tq", (0, 0, 1.0), 2.35, (0.7, -0.7, 0.08), (0.62 * px, px)),
    ("full_front", (0, 0, 1.0), 2.35, (0, -1, 0.05), (0.62 * px, px)),
    ("chest", (0.16, 0, 1.46), 0.85, (0.25, -1, 0.15), (px, px)),
    ("back", (0.0, 0, 1.45), 0.85, (0.0, 1, 0.2), (px, px)),
    ("arm", (0.5, 0, 1.25), 0.7, (0.4, -1, 0.2), (px, px)),
    ("boots", (0.0, 0, 0.3), 0.8, (0.3, -1, 0.15), (px, px)),
    ("head", (0.0, -0.02, 1.8), 0.6, (0.35, -1, 0.1), (px, px)),
]
for name, tgt, sc, d, res in shots:
    bs.setup_render(int(res[0]), int(res[1]))
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc, direction=d, distance=5)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("GAMESHOT done", tag)
