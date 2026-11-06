"""Showcase GIFs of Karlin (current look) in the three DualSwords clips, framed for the whole figure (antennae and sword
reach included), camera following the root on the ground plane, 30 fps (the clips' own rate).

  blender -b --factory-startup --python 70_showcase_gifs.py -- [--stem B_foundry_warlord_hero_H1_two_swords] [--name Karlin]
  python 70_showcase_gifs.py --assemble [--name Karlin]

Output: showcase/<name>_{Run,Attack,FightIdle}.gif (frames in showcase/_frames/<name>/<clip>/).
H1 (Warden helmet) = Karlin_*, H2 (Imperial Trooper helmet) = Karlin_H2_*.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
OUT = os.path.join(PROJ, "showcase")
CLIPS = {"Run": "DualSwords_Run", "Attack": "DualSwords_AttackMelee01", "FightIdle": "DualSwords_FightIdle"}
BG = (226, 229, 235)

NAME = sys.argv[sys.argv.index("--name") + 1] if "--name" in sys.argv else "Karlin"
FRAMES = os.path.join(OUT, "_frames") if NAME == "Karlin" else os.path.join(OUT, "_frames", NAME)

if "--assemble" in sys.argv:
    from PIL import Image
    for name in CLIPS:
        d = os.path.join(FRAMES, name)
        fs = sorted(f for f in os.listdir(d) if f.endswith(".png"))
        frames = []
        for f in fs:
            im = Image.open(os.path.join(d, f)).convert("RGBA")
            bg = Image.new("RGB", im.size, BG)
            bg.paste(im, mask=im.split()[3])
            frames.append(bg)
        path = os.path.join(OUT, "%s_%s.gif" % (NAME, name))
        frames[0].save(path, save_all=True, append_images=frames[1:], duration=round(1000 / 30), loop=0, optimize=True)
        print("GIF %s: %d frames, %.2f MB" % (path, len(frames), os.path.getsize(path) / 1e6))
    raise SystemExit

import bpy  # noqa: E402
from mathutils import Vector  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
stem = a[a.index("--stem") + 1] if "--stem" in a else "B_foundry_warlord_hero_H1_two_swords"
bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "weapons", stem + ".blend"))
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 600, 760
sc.render.film_transparent = True
sc.view_settings.view_transform = "Standard"
cam = bpy.data.objects.new("ShowcaseCam", bpy.data.cameras.new("ShowcaseCam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = 3.3
sc.collection.objects.link(cam)
sc.camera = cam
look = Vector((0.0, 0.0, 1.25))                       # mid-figure, with room above for the antennae
for name, act_name in CLIPS.items():
    act = bpy.data.actions[act_name]
    rig.animation_data.action = act
    d = os.path.join(FRAMES, name)
    os.makedirs(d, exist_ok=True)
    for old in os.listdir(d):
        if old.endswith(".png"):
            os.remove(os.path.join(d, old))           # our own frames from a previous run
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
    sc.frame_set(f0)
    root0 = (rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head).copy()
    # face the camera at the way HE faces in this clip (the DualSwords clips turn the body; a fixed -Y camera showed
    # his back): forward = from the head bone to the centre of his face, flattened
    dg = bpy.context.evaluated_depsgraph_get()
    fo = bpy.data.objects["Kit_face"].evaluated_get(dg)
    fm = fo.to_mesh()
    fc = sum((fo.matrix_world @ v.co for v in fm.vertices), Vector()) / len(fm.vertices)
    fo.to_mesh_clear()
    head = rig.matrix_world @ rig.pose.bones["B_HeadJ"].head
    fwd = Vector((fc.x - head.x, fc.y - head.y, 0.0)).normalized()
    right = Vector((fwd.y, -fwd.x, 0.0))
    direction = (fwd * 0.62 + right * 0.75 + Vector((0, 0, 0.22))).normalized()
    for f in range(f0, f1 + 1):
        sc.frame_set(f)
        r = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head - root0
        c = look + Vector((r.x, r.y, 0.0))
        cam.location = c + direction * 6
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(d, "f%03d.png" % f)
        bpy.ops.render.render(write_still=True)
    print("RENDERED %s: %d frames" % (name, f1 - f0 + 1))
