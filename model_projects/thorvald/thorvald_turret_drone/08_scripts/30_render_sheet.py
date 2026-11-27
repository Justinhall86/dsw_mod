"""Comparison sheet of turret-gunship variants (Renegade drone rig) at in-game scale (3.1), idle / firing / moving, close and at RTS distance.

    blender -b --factory-startup --python 30_render_sheet.py -- <out.png> <variant>[,<variant>...] [options]
      variant  = a name under 03_blender/variants/ (<name>.blend if painted, else <name>_geo.blend), "vanilla" (the Renegade
                 drone, this rig's own model) or "artillery" (the previous Thorvald artillery-drone pick, deployed / flying)
      --rows   tq_idle,back_idle,side_fire,rts_idle,front_run ...   (view_state; default tq_idle,back_idle,side_fire,rts_idle)
      --squad  three Thorvald troopers beside every drone (scale 1.0 vs the drone's 2.1)
      --labels "A: ...|B: ..."   column captions (default: the variant names)
      --tank-clips  pose the variants with 50_clips.py's level clips (baked by 10_bake_clips.py --tank)
      --px 520 tile size; RTS tiles are rendered at 1/3 size and blown up (nearest), so detail that vanishes in game vanishes here

States: idle = DroneR Idle frame 0; fire = AttackRange frame 12 (right cannon rolled, recoil); run = Run frame 30.
Every tile uses the same ortho size, so the drones compare 1:1 with each other and with the infantry.
"""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gun_scene as gs  # noqa: E402  (puts the artillery drone's 08_scripts on the path)
import drone_scene as ds  # noqa: E402

from PIL import Image, ImageDraw, ImageFont  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(argv[0])
VARS = argv[1].split(",")


def opt(name, default=None):
    return argv[argv.index(name) + 1] if name in argv else default


if "--tank-clips" in argv:               # pose variants with our level tank clips (vanilla rig model keeps the hover clips)
    TANK = os.path.join(gs.PROJ, "01_input", "anim_fbx_tank")
else:
    TANK = None
ROWS = opt("--rows", "tq_idle,back_idle,side_fire,rts_idle").split(",")
PX = int(opt("--px", "520"))
LABELS = opt("--labels")
LABELS = LABELS.split("|") if LABELS else VARS
SQUAD = "--squad" in argv
STATES = gs.STATES
ART = os.path.join(ds.PROJ, "03_blender", "thorvald_artillery_drone_final.blend")
VIEWS = {  # azimuth (0 = from -Y; drone front is -X so -90 = head-on), elevation, ortho (m), target z
    "tq": (-125, 24, 6.0, 0.9),
    "side": (180, 4, 6.0, 0.9),
    "front": (-90, 6, 6.0, 0.9),
    "back": (55, 24, 6.0, 0.9),
    "top": (-90, 89, 6.0, 0.5),
    "rts": (-140, 52, 16.0, 1.0),
}
VDIR = os.path.join(gs.PROJ, "03_blender", "variants")
TMP = os.path.join(os.path.dirname(OUT), "_tiles")
os.makedirs(TMP, exist_ok=True)


def scene_for(var, state):
    ds.reset()
    cam = ds.stage(px=(PX, PX), samples=16)
    clip, frame = STATES[state]
    if var == "vanilla":
        meshes, arms, root = gs.load_vanilla(clip, frame)
    elif var == "artillery":
        meshes, arms, root = ds.load_variant(ART, *(("Opening", 44) if state == "fire" else ("Idle", 0)), tag="art")
    else:
        p = os.path.join(VDIR, var + ".blend")
        if not os.path.exists(p):
            p = os.path.join(VDIR, var + "_geo.blend")
        meshes, arms, root = gs.load_variant(p, clip, frame, tag=var, anim_dir=TANK)
    if SQUAD:
        ds.load_squad([(1.2, 3.6, 0), (2.4, 3.0, 0), (0.0, 3.2, 0)], rotz=3.0)
    ds.gamelike_all()
    return cam


tiles = {}
for var in VARS:
    for row in ROWS:
        view, state = row.split("_")
        cam = scene_for(var, state)
        az, el, ortho, tz = VIEWS[view]
        rts = view == "rts"
        if rts:
            bpy.context.scene.render.resolution_x = bpy.context.scene.render.resolution_y = PX // 3
        ds.aim(cam, (0.3, 1.2 if SQUAD else 0.0, tz), az, el, ortho + (1.4 if SQUAD and not rts else 0))
        p = os.path.join(TMP, "%s_%s.png" % (var, row))
        ds.render(p)
        im = Image.open(p).convert("RGB")
        if rts:
            im = im.resize((PX, PX), Image.NEAREST)
        tiles[(var, row)] = im
        print("TILE", var, row)

# ---- compose
try:
    font = ImageFont.truetype("DejaVuSans-Bold.ttf", 22)
    small = ImageFont.truetype("DejaVuSans.ttf", 17)
except OSError:
    font = small = ImageFont.load_default()
HEAD, LEFT = 44, 120
W, H = LEFT + PX * len(VARS), HEAD + PX * len(ROWS)
sheet = Image.new("RGB", (W, H), (30, 30, 32))
d = ImageDraw.Draw(sheet)
for i, var in enumerate(VARS):
    d.text((LEFT + i * PX + 10, 10), LABELS[i] if i < len(LABELS) else var, fill=(235, 235, 235), font=font)
    for j, row in enumerate(ROWS):
        sheet.paste(tiles[(var, row)], (LEFT + i * PX, HEAD + j * PX))
for j, row in enumerate(ROWS):
    view, state = row.split("_")
    txt = "%s\n%s" % ({"tq": "close 3/4", "rts": "RTS zoom", "side": "side", "front": "front", "back": "rear 3/4",
                       "top": "top"}[view], {"idle": "idle", "fire": "firing", "run": "moving"}[state])
    d.multiline_text((10, HEAD + j * PX + PX // 2 - 20), txt, fill=(235, 235, 235), font=small)
os.makedirs(os.path.dirname(OUT), exist_ok=True)
sheet.save(OUT)
print("SHEET", OUT, sheet.size)
