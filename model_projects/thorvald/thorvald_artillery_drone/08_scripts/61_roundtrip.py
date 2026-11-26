"""Round trip of the written game files: read them back with the HMD toolkit, play the vanilla DroneC clips, compare with vanilla.

    blender -b --factory-startup --python 61_roundtrip.py -- [--name ThorvaldDrone] [--gif]

 1. numbers (HMD space, engine maths, no Blender): skin the barrel-tip vertices with the decoded Opening / AttackRange
    frames and measure where the prefab's MuzzleA/B points land (bone-local z on B_Canon*_Shoot). Vanilla and ours must
    put the muzzle the same small distance behind the barrel mouth. Bounds of both drones per pose (level, same facing).
 2. pictures: the toolkit's hmdanim2fbx bakes each clip onto OUR .hmd files (the reader path the game data takes), the
    textures come from the game folder; rendered beside the vanilla drone baked the same way, flying and deployed.
    --gif adds the deploy animation (Opening, every 2nd frame) side by side.
Output: 09_roundtrip/anim_fbx (regenerable) and 02_progress_photos/06_roundtrip/.
"""
import json
import os
import sys

import bpy  # noqa: F401  (before PIL users that need bpy's environment)
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import drone_scene as ds  # noqa: E402
import hmd_writer as HW  # noqa: E402

H = HW.H
sys.path.insert(0, os.path.join(ds.REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmd_anim as HA  # noqa: E402
import hmdanim2fbx  # noqa: E402
from hmd2fbx import pos_to_mat4  # noqa: E402

from PIL import Image, ImageDraw, ImageFont  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
NAME = argv[argv.index("--name") + 1] if "--name" in argv else "ThorvaldDrone"
GAME = os.path.join(ds.PROJ, "06_game_ready", "VehMOD", NAME)
RT = os.path.join(ds.PROJ, "09_roundtrip", "anim_fbx")
PHOTO = os.path.join(ds.PROJ, "02_progress_photos", "06_roundtrip")
ANIM = os.path.join(ds.REPO, "model_inputs", "Anim", "DroneC")
VAN = {"Base": os.path.join(ds.DRONE_DIR, "ImperiumDroneBase.fbx"), "Canon": os.path.join(ds.DRONE_DIR, "ImperiumDroneCanon.fbx")}
OURS = {p: os.path.join(GAME, "%s%s.hmd" % (NAME, p)) for p in ("Base", "Canon")}
os.makedirs(RT, exist_ok=True)
os.makedirs(PHOTO, exist_ok=True)


# ---------------------------------------------------------------- 1. numbers
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


def muzzle_report(hmd, prefab_z, clip, frame):
    d = HW.load(hmd)
    sk = d.models[0].skin
    vs = H.decode_vertices(d, d.geometries[0])
    _, _, tracks = HA.load_animation(os.path.join(ANIM, "Anim_DroneC_%s.fbx" % clip))
    G = globals_at(sk, tracks, frame)
    slot = {j.bind: i for i, j in enumerate(sk.joints) if j.bind >= 0}
    out = {}
    for side, mz in prefab_z.items():
        ji = next(i for i, j in enumerate(sk.joints) if j.name == "B_Canon%s_Shoot" % side)
        j = sk.joints[ji]
        skin_m = pos_to_mat4(j.transpos) @ G[ji]
        pts = np.array([np.array(v["position"] + (1.0,)) @ skin_m for v in vs
                        if v["weights"][0] > 0.5 and slot[v["indexes"][0]] == ji])[:, :3]
        loc = np.array([np.array(v["position"] + (1.0,)) @ pos_to_mat4(j.transpos) for v in vs
                        if v["weights"][0] > 0.5 and slot[v["indexes"][0]] == ji])[:, :3]
        tip = pts[loc[:, 2] > loc[:, 2].max() - 0.03].mean(0)          # centre of the barrel mouth
        muzzle = (np.array([0, 0, mz, 1.0]) @ G[ji])[:3]
        axis = (np.array([0, 0, 1.0, 0]) @ G[ji])[:3]
        out[side] = (float(np.linalg.norm(tip - muzzle)), float(np.dot(tip - muzzle, axis)), muzzle, tip)
    return out


def prefab_muzzles(path):
    pre = json.load(open(path))
    return {("R" if c["name"] == "MuzzleA" else "L"): c.get("z", 0.0) for c in pre["children"] if c.get("name") in ("MuzzleA", "MuzzleB")}


def bounds_at(paths, clip, frame):
    lo, hi = np.full(3, 1e9), np.full(3, -1e9)
    _, _, tracks = HA.load_animation(os.path.join(ANIM, "Anim_DroneC_%s.fbx" % clip))
    for p in paths:
        d = HW.load(p)
        sk = d.models[0].skin
        G = globals_at(sk, tracks, frame)
        slot = {j.bind: i for i, j in enumerate(sk.joints) if j.bind >= 0}
        for v in H.decode_vertices(d, d.geometries[0]):
            q = np.zeros(3)
            for w, ix in zip(v["weights"], v["indexes"]):
                if w > 0:
                    ji = slot[ix]
                    q += w * (np.array(v["position"] + (1.0,)) @ pos_to_mat4(sk.joints[ji].transpos) @ G[ji])[:3]
            lo, hi = np.minimum(lo, q), np.maximum(hi, q)
    return lo, hi


report = {}
for label, parts, prefab in (("vanilla", VAN, os.path.join(ds.DRONE_DIR, "Prefab_DroneC.prefab")),
                             ("ours", OURS, os.path.join(GAME, "Prefab_%s.prefab" % NAME))):
    mz = prefab_muzzles(prefab)
    for clip, f in (("Opening", 44), ("AttackRange", 0), ("AttackRange", 20)):
        r = muzzle_report(parts["Canon"], mz, clip, f)
        for side, (dist, along, m, t) in r.items():
            print("MUZZLE %-7s %-11s f%-2d %s: muzzle %.3f from the barrel mouth (%.3f behind it along the barrel)" % (
                label, clip, f, side, dist, along))
            report["%s %s %d %s" % (label, clip, f, side)] = round(dist, 3)
    for clip, f in (("Idle", 0), ("Opening", 44)):
        lo, hi = bounds_at([parts["Base"], parts["Canon"]], clip, f)
        print("BOUNDS %-7s %-8s f%-2d min %s max %s" % (label, clip, f, lo.round(3), hi.round(3)))
        report["bounds %s %s" % (label, clip)] = [lo.round(3).tolist(), hi.round(3).tolist()]
json.dump(report, open(os.path.join(PHOTO, "roundtrip_numbers.json"), "w"), indent=1)


# ---------------------------------------------------------------- 2. pictures
def bake(clip):
    out = []
    for p in ("Base", "Canon"):
        dst = os.path.join(RT, "%s%s__%s.fbx" % (NAME, p, clip))
        hmdanim2fbx.export(OURS[p], os.path.join(ANIM, "Anim_DroneC_%s.fbx" % clip), dst)
        out.append(dst)
    return out


CLIPS = {c: bake(c) for c in ("Idle", "Opening")}
mats = ds.game_folder_materials(GAME)
STATES = {"fly": ("Idle", 0), "dep": ("Opening", 44)}
VIEWS = {"tq": (-125, 24, 6.0, 0.9), "side": (180, 4, 6.0, 0.9), "front": (-90, 4, 6.0, 0.9), "back": (55, 24, 6.0, 0.9)}
PX = 460


def single(which, clip, frame, view, path):
    """One drone alone (vanilla or ours) at clip/frame from `view`; each tile is its own scene, so views never overlap."""
    ds.reset()
    cam = ds.stage(px=(PX, PX), samples=16)
    if which == "vanilla":
        ds.load_vanilla_drone(clip, frame)
    else:
        ds.load_drone_fbx(CLIPS[clip], frame, materials=mats, tag=NAME)
    ds.gamelike_all()
    az, el, ortho, tz = VIEWS[view]
    ds.aim(cam, (0.0, 0.0, tz), az, el, ortho)
    ds.render(path)
    return Image.open(path).convert("RGB")


def pair(clip, frame, view, tag):
    a = single("vanilla", clip, frame, view, os.path.join(PHOTO, "_v_%s.png" % tag))
    b = single("ours", clip, frame, view, os.path.join(PHOTO, "_o_%s.png" % tag))
    im = Image.new("RGB", (PX * 2, PX))
    im.paste(a, (0, 0))
    im.paste(b, (PX, 0))
    return im


try:
    font = ImageFont.truetype("DejaVuSans-Bold.ttf", 22)
except OSError:
    font = ImageFont.load_default()
rows = []
for st, view in (("fly", "tq"), ("dep", "tq"), ("dep", "side"), ("dep", "front"), ("fly", "side")):
    clip, f = STATES[st]
    rows.append(("%s %s" % ({"fly": "flying", "dep": "deployed"}[st], view), pair(clip, f, view, "%s_%s" % (st, view))))
W = PX * 2
sheet = Image.new("RGB", (W, 40 + PX * len(rows)), (30, 30, 32))
dr = ImageDraw.Draw(sheet)
dr.text((10, 8), "Vanilla Corrino drone", fill=(235, 235, 235), font=font)
dr.text((PX + 10, 8), "%s (our HMDs, read back)" % NAME, fill=(235, 235, 235), font=font)
for i, (lab, im) in enumerate(rows):
    sheet.paste(im, (0, 40 + i * PX))
    dr.text((10, 40 + i * PX + 8), lab, fill=(40, 40, 40), font=font)
sheet.save(os.path.join(PHOTO, "roundtrip_sheet.png"))
print("SHEET", os.path.join(PHOTO, "roundtrip_sheet.png"))

if "--gif" in argv:
    frames = []
    for f in list(range(0, 45, 2)) + [44] * 6:
        frames.append(pair("Opening", f, "tq", "gif"))
    pal = frames[-1].quantize(colors=255, method=Image.MEDIANCUT)
    q = [fr.quantize(palette=pal, dither=Image.NONE) for fr in frames]
    gp = os.path.join(PHOTO, "deploy_roundtrip.gif")
    q[0].save(gp, save_all=True, append_images=q[1:], duration=70, loop=0)
    print("GIF", gp, len(q), "frames")
for f in os.listdir(PHOTO):
    if f.startswith("_"):
        os.remove(os.path.join(PHOTO, f))
