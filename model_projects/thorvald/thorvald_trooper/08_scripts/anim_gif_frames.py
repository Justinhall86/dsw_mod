"""(GIF frames: every frame, hero + back only.) Render a unit mid-animation from several cameras (hero 3/4, side, back, high RTS camera) in the game-style matte preview, back-face culling ON.

    blender -b <unit.blend> --python anim_shots.py -- <out_dir> <tag> [clip ...] [--frames N] [--px N]

Clips are FBX files in <project>/05_fbx_export/anim/ (made by hmdanim2fbx.py).  N frames are taken evenly through each clip.
Output: <out_dir>/<tag>_<clip>_f<frame>_<view>.png  with views hero, side, back, rts (and rts128: the 128 px squint test).
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

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
nfr = int(a[a.index("--frames") + 1]) if "--frames" in a else 5
px = int(a[a.index("--px") + 1]) if "--px" in a else 520
focus = (float(a[a.index("--focus") + 1]), float(a[a.index("--focus") + 2])) if "--focus" in a else None   # target height, ortho scale
clips = [x for x in a[2:] if not x.startswith("--") and not x.replace(".", "").isdigit()]
os.makedirs(out, exist_ok=True)
PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
sc = bpy.context.scene
VIEWS = {
    "hero": ((0.65, -0.75, 0.12), 2.2, px),
    "back": ((-0.55, 0.85, 0.15), 2.2, px),
}
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
    frames = list(range(f0, f1 + 1))   # every frame
    for f in frames:
        sc.frame_set(f)
        pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
        tgt = Vector((pel.x, pel.y, focus[0] if focus else 1.0))
        for vname, (d, scale, res) in VIEWS.items():
            bs.setup_render(res, res)
            cam = bs.setup_camera(target=tgt, ortho_scale=(focus[1] if focus else scale), direction=d, distance=6)
            bs.render_to(os.path.join(out, "%s_%s_f%03d_%s.png" % (tag, clip, f, vname)), cam)
            bpy.data.objects.remove(cam, do_unlink=True)
    print("ANIMSHOTS", clip, frames)
