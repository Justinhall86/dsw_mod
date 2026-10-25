"""v6: render every game clip of the Landsraad Elite (G1 armour + TallSword) to frame PNGs for GIFs.

  blender -b --python 08_scripts/v6_05_gif_frames.py

Each clip's action is borrowed from a Trooper-rig FBX in 05_fbx_export/anim_tests (same bone names for all Male01 units).
Frames -> 02_progress_photos/21_gifs/<clip>/f%03d.png ; the GIF step is gif_from_frames.py.
"""
import os

import bpy
from mathutils import Vector

LE = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
BLEND = os.path.join(LE, "03_blender", "landsraad_elite_v6_G1_tallsword_preview.blend")
CLIPS_DIR = os.path.join(LE, "05_fbx_export", "anim_tests")
OUT = os.path.join(LE, "02_progress_photos", "21_gifs")
CLIPS = ["Idle", "FightIdle", "Run", "AttackMelee01", "AttackMelee02", "AttackMelee03"]

bpy.ops.wm.open_mainfile(filepath=BLEND)
sc = bpy.context.scene
rig = bpy.data.objects["Male01_LandsraadGuard"]
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
sc.render.resolution_x, sc.render.resolution_y = 420, 560
cd = bpy.data.cameras.new("gif")
cam = bpy.data.objects.new("gif", cd)
bpy.context.collection.objects.link(cam)
cd.type, cd.ortho_scale = "ORTHO", 2.8
sc.camera = cam

for clip in CLIPS:
    fbx = os.path.join(CLIPS_DIR, "Trooper_%s.fbx" % clip)
    if not os.path.exists(fbx):
        fbx = os.path.join(CLIPS_DIR, "%s.fbx" % clip)
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o not in before]
    act = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data.action = act
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
    d = os.path.join(OUT, clip)
    os.makedirs(d, exist_ok=True)
    for f in range(f0, f1):
        sc.frame_set(f)
        pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
        cam.location = Vector((pel.x - 4.2, pel.y - 3.4, pel.z + 0.45))
        cam.rotation_euler = (Vector((pel.x + 0.1, pel.y, pel.z + 0.1)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(d, "f%03d.png" % (f - f0))
        bpy.ops.render.render(write_still=True)
    print("GIFFRAMES", clip, f1 - f0)
