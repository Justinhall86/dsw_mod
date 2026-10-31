"""Render real game animation clips on a variant (no weapon mounted).

    blender -b <variant.blend> --python 22_anim_clips.py -- <out_dir> <clip> [<clip> ...] [--step 2]

Clips are FBX files in <project>/05_fbx_export/anim/ made by hmdanim2fbx.py.  Blender 5 layered actions need the action slot
assigned, otherwise every frame stays in rest pose.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(args[0])
step = int(args[args.index("--step") + 1]) if "--step" in args else 2
clips = [a for a in args[1:] if not a.startswith("--") and a != str(step)]
rig = bpy.data.objects["Armature"]
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
sc = bpy.context.scene
bs.setup_render(480, 480)
cd = bpy.data.cameras.new("anim_cam")
cam = bpy.data.objects.new("anim_cam", cd)
bpy.context.collection.objects.link(cam)
cd.type, cd.ortho_scale = "ORTHO", 3.0
sc.camera = cam
for clip in clips:
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
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    d = os.path.join(out, clip)
    os.makedirs(d, exist_ok=True)
    for f in range(f0, f1 + 1, step):
        sc.frame_set(f)
        pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
        cam.location = Vector((pel.x - 4, pel.y - 3.6, pel.z + 0.55))
        cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.25)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(d, "f%03d.png" % f)
        bpy.ops.render.render(write_still=True)
    print("CLIP", clip, f0, f1)
