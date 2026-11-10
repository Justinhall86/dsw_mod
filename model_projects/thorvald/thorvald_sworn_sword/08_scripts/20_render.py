"""Game-like matte renders of a Sworn Sword build: full body front / three-quarter / side / back (A pose), head and
waist close-ups, assembled into one sheet.

    blender -b <SwornSword_TAG.blend> --python 20_render.py -- <out_dir> <tag> [--katana]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG = os.path.abspath(args[0]), args[1]
os.makedirs(OUT, exist_ok=True)
PW.apply_all()
if "--katana" not in args and "Thorvald_Katana" in bpy.data.objects:
    bpy.data.objects["Thorvald_Katana"].hide_render = True
rig = bpy.data.objects["Armature"]
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
shots = []
VIEWS = (("front", (0, -1, 0.04)), ("tq", (0.7, -0.7, 0.08)), ("side", (1, 0, 0.04)), ("back", (0, 1, 0.06)))
for group, tgt, scale, w, h in (("body", (0, 0, 1.06), 2.30, 600, 840), ("head", (0, 0.03, 1.86), 0.62, 600, 600),
                                ("waist", (0, 0, 1.02), 0.85, 600, 600)):
    for name, d in VIEWS:
        if group == "waist" and name == "back":
            continue
        bs.setup_render(w, h)
        cam = bs.setup_camera(target=Vector(tgt), ortho_scale=scale, direction=d, distance=4)
        p = os.path.join(OUT, "%s_%s_%s.png" % (TAG, group, name))
        bs.render_to(p, cam)
        bpy.data.objects.remove(cam, do_unlink=True)
        shots.append(p)
print("RENDERED", len(shots))
