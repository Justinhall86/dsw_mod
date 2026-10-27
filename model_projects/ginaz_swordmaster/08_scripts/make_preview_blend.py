"""Build a ready-to-open PREVIEW blend: matte game-style material wiring, softer neutral world, the FightIdle clip assigned (so the weapon is in the hand), camera + lights.

    blender -b <source blend (with sword for armed units)> --python make_preview_blend.py -- <out.blend> [--clip Common_FightIdle] [--frame 12]

Why a separate file: the export blends keep the FBX-importer wiring (the HMD toolkit extracts textures by that wiring); that wiring + the old bluish world strength 1.8
makes every surface look veiled ("film").  Preview blends are for LOOKING only - never export from them.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(args[0])
clip = args[args.index("--clip") + 1] if "--clip" in args else "Common_FightIdle"
frame = int(args[args.index("--frame") + 1]) if "--frame" in args else 12

PW.apply_all()
rig = bpy.data.objects["Armature"]
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
new = [o for o in bpy.data.objects if o not in before]
action = next(o for o in new if o.type == "ARMATURE").animation_data.action
for o in new:
    bpy.data.objects.remove(o, do_unlink=True)
rig.animation_data_create()
rig.animation_data.action = action
if getattr(action, "slots", None):
    rig.animation_data.action_slot = action.slots[0]
sc = bpy.context.scene
sc.frame_start, sc.frame_end = int(action.frame_range[0]), int(action.frame_range[1])
sc.frame_set(frame)
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
cam = bs.setup_camera(target=Vector((pel.x, pel.y, 1.0)), ortho_scale=2.4, direction=(0.55, -0.8, 0.12), distance=6)
bs.pack_all_images()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("PREVIEW SAVED", out)
