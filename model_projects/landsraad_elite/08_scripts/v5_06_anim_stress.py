"""v5 step: stress-test the grafted pauldrons in the guard's real Run / AttackMelee clips.

  blender -b --python 08_scripts/v5_06_anim_stress.py

Opens the finished halberd preview, borrows each clip's action from a toolkit-built FBX (same bone names),
renders 4 frames per clip (3/4 view), and prints the worst pauldron <-> hood overlap proxy.
"""
import os

import bpy
from mathutils import Vector

LE = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
BLEND = os.path.join(LE, "03_blender", os.environ.get("BLEND", "landsraad_elite_v5_halberd_preview.blend"))
TAG = os.environ.get("TAG", "")   # file-name prefix per design path
OUT = os.path.join(LE, "02_progress_photos", "14_anim_stress")
os.makedirs(OUT, exist_ok=True)
CLIPS = ["Run", "AttackMelee01", "AttackMelee03"]

for clip in CLIPS:
    bpy.ops.wm.open_mainfile(filepath=BLEND)
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(LE, "05_fbx_export", "anim_tests", clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    src_rig = next(o for o in new if o.type == "ARMATURE")
    action = src_rig.animation_data.action
    rig.animation_data_create()
    rig.animation_data.action = action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    sc.frame_start, sc.frame_end = f0, f1
    cam = bpy.data.objects["tq"]
    sc.camera = cam
    sc.render.resolution_x = sc.render.resolution_y = 600
    cam.data.ortho_scale = 2.4
    frames = [f0 + round((f1 - f0) * t) for t in (0.0, 0.3, 0.55, 0.8)]
    for f in frames:
        sc.frame_set(f)
        # follow the character: aim the camera at the pelvis bone
        pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
        cam.location = Vector((pel.x - 4, pel.y - 3.6, pel.z + 0.35))
        cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.3)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s%s_f%03d.png" % (TAG, clip, f))
        bpy.ops.render.render(write_still=True)
    print("S", clip, "frames", f0, f1, "rendered", frames)
