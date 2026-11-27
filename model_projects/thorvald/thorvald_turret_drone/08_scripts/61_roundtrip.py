"""Round trip of the turret gunship's game files: numbers in HMD space with our clips, then pictures and GIFs.

    blender -b --factory-startup --python 61_roundtrip.py -- [--name ThorvaldGunDrone] [--gif]

1. Engine maths (no Blender): skin every vertex with each of OUR clips (06_game_ready/.../Anim) frame by frame:
   ground contact and tilt per clip (tracks must stay on the ground and level), and MuzzleA/B (prefab, bone-local on
   B_CanonR/L) vs the barrel mouths through the whole AttackRange clip.
2. Pictures: hmdanim2fbx bakes our clips onto OUR .hmd, textures from the game folder, rendered beside the vanilla Renegade
   drone (its own hover clips): idle, firing, moving. --gif: turntable (idle) and the firing loop (AttackRange) side view.
Output: 02_progress_photos/06_roundtrip/, baked FBX in 09_roundtrip/anim_fbx (regenerable).
"""
import json
import math
import os
import sys

import bpy  # noqa: F401
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gun_scene as gs  # noqa: E402
import drone_scene as ds  # noqa: E402
import hmd_writer as HW  # noqa: E402

H = HW.H
sys.path.insert(0, os.path.join(gs.REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmd_anim as HA  # noqa: E402
import hmdanim2fbx  # noqa: E402
from hmd2fbx import pos_to_mat4  # noqa: E402

from PIL import Image, ImageDraw, ImageFont  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
NAME = argv[argv.index("--name") + 1] if "--name" in argv else "ThorvaldGunDrone"
GAME = os.path.join(gs.PROJ, "06_game_ready", "VehMOD", NAME)
ANIM = os.path.join(GAME, "Anim")
HMD = os.path.join(GAME, NAME + ".hmd")
RT = os.path.join(gs.PROJ, "09_roundtrip", "anim_fbx")
PHOTO = os.path.join(gs.PROJ, "02_progress_photos", "06_roundtrip")
os.makedirs(RT, exist_ok=True)
os.makedirs(PHOTO, exist_ok=True)


def globals_at(skin, tracks, f):
    G = []
    for j in skin.joints:
        t = tracks.get(j.name)
        p = j.position
        if t is not None:
            k = 0 if t.single else min(f, t.frame_count - 1)
            pos = t.position[k] if t.position is not None else (p.x, p.y, p.z)
            rot = t.rotation[k] if t.rotation is not None else (p.qx, p.qy, p.qz, p.qw)
            p = H.Position(pos[0], pos[1], pos[2], rot[0], rot[1], rot[2])
        L = pos_to_mat4(p)
        G.append(L if j.parent < 0 else L @ G[j.parent])
    return G


d = HW.load(HMD)
sk = d.models[0].skin
vs = H.decode_vertices(d, d.geometries[0])
slot = {j.bind: i for i, j in enumerate(sk.joints) if j.bind >= 0}
V = np.array([v["position"] + (1.0,) for v in vs])
W = np.array([v["weights"] for v in vs])
IX = np.array([[slot[i] for i in v["indexes"][:3]] for v in vs])
INV = [pos_to_mat4(j.transpos) if j.bind >= 0 else None for j in sk.joints]


def skinned(G):
    out = np.zeros((len(V), 3))
    for k in range(3):
        for ji in np.unique(IX[:, k]):
            sel = (IX[:, k] == ji) & (W[:, k] > 0)
            if sel.any():
                out[sel] += W[sel, k:k + 1] * (V[sel] @ INV[ji] @ G[ji])[:, :3]
    return out


pre = json.load(open(os.path.join(GAME, "Prefab_%s.prefab" % NAME)))
muz = {c["name"]: c for c in pre["children"] if c.get("name") in ("MuzzleA", "MuzzleB")}
report = {}
# the up axis of the posed frame: the axis along which the skinned mesh is thinnest relative to the vanilla footprint
_, _, tr0 = HA.load_animation(os.path.join(ANIM, "Anim_DroneR_Idle.fbx"))
P0 = skinned(globals_at(sk, tr0, 0))
print("idle extents per axis (posed frame)", np.round(np.ptp(P0, 0), 3))
for clip in ("Idle", "FightIdle", "Run", "AttackRange", "Death"):
    _, a, tr = HA.load_animation(os.path.join(ANIM, "Anim_DroneR_%s.fbx" % clip))
    lows, highs, dists = [], [], []
    for f in range(0, a.frames, 2):
        G = globals_at(sk, tr, f)
        P = skinned(G)
        lows.append(P.min(0))
        highs.append(P.max(0))
        for mname, side in (("MuzzleA", "R"), ("MuzzleB", "L")):
            ji = next(i for i, j in enumerate(sk.joints) if j.name == "B_Canon%s" % side)
            c = muz[mname]
            m = (np.array([c.get("x", 0.0), c.get("y", 0.0), c.get("z", 0.0), 1.0]) @ G[ji])[:3]
            bar = P[(IX[:, 0] == ji) & (W[:, 0] > 0.5)]
            ax = (np.array([0, 0, 1.0, 0]) @ G[ji])[:3]
            s = (bar - bar.mean(0)) @ ax
            mouth = bar[s > s.max() - 0.03].mean(0)
            dists.append(float(np.linalg.norm(mouth - m)))
    lows, highs = np.array(lows), np.array(highs)
    print("CLIP %-11s frames %3d  min per axis: range %s .. %s   max range %s .. %s   muzzle-mouth %.3f..%.3f" % (
        clip, a.frames, np.round(lows.min(0), 3), np.round(lows.max(0), 3), np.round(highs.min(0), 3), np.round(highs.max(0), 3),
        min(dists), max(dists)))
    report[clip] = {"min_lo": lows.min(0).round(3).tolist(), "min_hi": lows.max(0).round(3).tolist(),
                    "max_lo": highs.min(0).round(3).tolist(), "max_hi": highs.max(0).round(3).tolist(),
                    "muzzle_to_mouth": [round(min(dists), 3), round(max(dists), 3)]}
json.dump(report, open(os.path.join(PHOTO, "roundtrip_numbers.json"), "w"), indent=1)

# ---------------------------------------------------------------- pictures
CLIPS = {}
for clip in ("Idle", "AttackRange", "Run"):
    dst = os.path.join(RT, "%s__%s.fbx" % (NAME, clip))
    hmdanim2fbx.export(HMD, os.path.join(ANIM, "Anim_DroneR_%s.fbx" % clip), dst)
    CLIPS[clip] = dst
mats = ds.game_folder_materials(GAME)
PX = 460
VIEWS = {"tq": (-125, 24, 6.4, 0.9), "side": (180, 4, 6.4, 0.9), "front": (-90, 4, 6.4, 0.9), "back": (55, 24, 6.4, 0.9)}


def single(which, clip, frame, view, path, rotz=0.0):
    ds.reset()
    cam = ds.stage(px=(PX, PX), samples=16)
    if which == "vanilla":
        gs.load_vanilla(clip, frame)
    else:
        _, _, root = ds.load_drone_fbx([CLIPS[clip]], frame, scale=gs.GUN_SCALE, materials=mats, tag=NAME)
        root.rotation_euler = (0, 0, rotz)
    ds.gamelike_all()
    az, el, ortho, tz = VIEWS[view]
    ds.aim(cam, (0.0, 0.0, tz), az, el, ortho)
    ds.render(path)
    return Image.open(path).convert("RGB")


try:
    font = ImageFont.truetype("DejaVuSans-Bold.ttf", 20)
except OSError:
    font = ImageFont.load_default()
rows = [("idle 3/4", "Idle", 0, "tq"), ("firing side", "AttackRange", 12, "side"), ("moving front", "Run", 30, "front"),
        ("idle rear", "Idle", 0, "back")]
sheet = Image.new("RGB", (PX * 2, 40 + PX * len(rows)), (30, 30, 32))
dr = ImageDraw.Draw(sheet)
dr.text((10, 8), "Vanilla Renegade drone (hover clips)", fill=(235, 235, 235), font=font)
dr.text((PX + 10, 8), "%s (our HMD + our clips, read back)" % NAME, fill=(235, 235, 235), font=font)
for i, (lab, clip, f, view) in enumerate(rows):
    sheet.paste(single("vanilla", clip, f, view, os.path.join(PHOTO, "_v.png")), (0, 40 + i * PX))
    sheet.paste(single("ours", clip, f, view, os.path.join(PHOTO, "_o.png")), (PX, 40 + i * PX))
    dr.text((10, 40 + i * PX + 8), lab, fill=(40, 40, 40), font=font)
sheet.save(os.path.join(PHOTO, "roundtrip_sheet.png"))
print("SHEET", os.path.join(PHOTO, "roundtrip_sheet.png"))


def gif(frames, path, ms):
    strip = Image.new("RGB", (frames[0].width * 4, frames[0].height))
    for k, i in enumerate(np.linspace(0, len(frames) - 1, 4).astype(int)):
        strip.paste(frames[i], (k * frames[0].width, 0))
    pal = strip.quantize(colors=255, method=Image.MEDIANCUT)
    q = [f.quantize(palette=pal, dither=Image.NONE) for f in frames]
    q[0].save(path, save_all=True, append_images=q[1:], duration=ms, loop=0)
    print("GIF", path, len(q))


if "--gif" in argv:
    os.makedirs(os.path.join(gs.PROJ, "02_progress_photos", "05_final"), exist_ok=True)
    fr = [single("ours", "Idle", 0, "front", os.path.join(PHOTO, "_t.png"), rotz=math.radians(10 * i)) for i in range(36)]
    gif(fr, os.path.join(gs.PROJ, "02_progress_photos", "05_final", "%s_turntable.gif" % NAME), 60)
    fr = [single("ours", "AttackRange", f, "tq", os.path.join(PHOTO, "_f.png")) for f in range(0, 33)]
    gif(fr, os.path.join(gs.PROJ, "02_progress_photos", "05_final", "%s_firing.gif" % NAME), 40)
for f in os.listdir(PHOTO):
    if f.startswith("_"):
        os.remove(os.path.join(PHOTO, f))
