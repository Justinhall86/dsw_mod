"""Stress-test a built variant in real game clips: swap in each clip's action, render a few frames (3/4 view,
camera follows the pelvis). Catches tearing, parts winging out on raised arms, collar/pauldron intersections.

  1) make clip FBXs with the HMD toolkit (system python, in HMD_toolkit/HMD_toolkit/Animations):
       python hmdanim2fbx.py <body.hmd> <extr/Anim/Male01/<Set>/Anim_Male01_<Set>_Run.fbx> <out>/Run.fbx
  2) blender -b --python anim_stress.py -- --blend variant.blend --rig <rig name> --clips <out>/Run.fbx <out>/AttackMelee01.fbx
                                           --out <dir> [--tag G1_] [--frames 0 0.3 0.55 0.8]

Bone names match across every Male01 clip, so any clip's action drives any Male01 variant.
"""
import argparse
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
ap.add_argument("--rig", required=True)
ap.add_argument("--clips", nargs="+", required=True)
ap.add_argument("--out", required=True)
ap.add_argument("--tag", default="")
ap.add_argument("--frames", type=float, nargs="+", default=[0.0, 0.3, 0.55, 0.8])
a = ap.parse_args(P.script_args())
a.out = os.path.abspath(a.out)   # Blender resolves relative render paths against the drive root
os.makedirs(a.out, exist_ok=True)

for clip in a.clips:
    bpy.ops.wm.open_mainfile(filepath=a.blend)
    sc = bpy.context.scene
    rig = bpy.data.objects[a.rig]
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=clip)
    new = [o for o in bpy.data.objects if o not in before]
    action = next(o for o in new if o.type == "ARMATURE").animation_data.action
    rig.animation_data_create()
    rig.animation_data.action = action
    if getattr(action, "slots", None):  # Blender 5 layered actions: without a slot the rig stays in rest pose
        rig.animation_data.action_slot = action.slots[0]
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    P.setup_scene(sc, res=600)
    cd = bpy.data.cameras.new("stress")
    cam = bpy.data.objects.new("stress", cd)
    bpy.context.collection.objects.link(cam)
    cd.type, cd.ortho_scale = "ORTHO", 2.4
    sc.camera = cam
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    name = os.path.splitext(os.path.basename(clip))[0]
    for t in a.frames:
        f = f0 + round((f1 - f0) * t)
        sc.frame_set(f)
        pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
        cam.location = Vector((pel.x - 4, pel.y - 3.6, pel.z + 0.35))
        cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.3)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(a.out, "%s%s_f%03d.png" % (a.tag, name, f))
        bpy.ops.render.render(write_still=True)
    print("STRESS", name, f0, f1)
