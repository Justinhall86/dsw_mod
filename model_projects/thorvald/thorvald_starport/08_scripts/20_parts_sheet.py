"""Part-colour sheets of vanilla buildings, so parts can be picked by letter for the Consignment Terminal kitbash.

    py -3.14 20_parts_sheet.py [Name ...]

Per building: textured front/back, then the same views + top with each part group in a flat colour and a letter.
Output: ../02_progress_photos/10_kitbash_donors/<Name>_parts.png and ALL_parts.png; the split .blend per building
stays in the scratch folder printed at the end (group letter = material index, bounds in groups.json).
"""
import json
import os

def _repo(p=os.path.abspath(__file__)):
    while not os.path.exists(os.path.join(p, "CLAUDE.md")): p = os.path.dirname(p)
    return p

import subprocess
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFont

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
for exe in (os.environ.get("BLENDER_EXE"), r"D:\Blender Foundation\Blender 5.2\blender.exe",
            r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"):
    if exe and os.path.exists(exe):
        os.environ["BLENDER_EXE"] = exe
        break
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
_argv, sys.argv = sys.argv, sys.argv[:1]
import build_previews as B  # noqa: E402

S = os.path.join(REPO, "model_inputs", "Structure")
OUT = os.path.join(_repo(), "gallery", "buildings", "starport_kitbash_donors")
SCR = os.path.join(PROJ, "03_blender", "kitbash_donors")
os.makedirs(OUT, exist_ok=True)
PALETTE = [(230, 60, 60), (60, 120, 235), (60, 190, 90), (240, 200, 40), (190, 80, 220), (40, 200, 210),
           (245, 135, 40), (240, 120, 180), (140, 100, 60), (150, 210, 60), (110, 110, 235), (235, 235, 235)]
PNAMES = ["red", "blue", "green", "yellow", "purple", "cyan", "orange", "pink", "brown", "lime", "indigo", "white"]
BUILDINGS = {
    "PropagandaOffice": dict(dir="Buildings/PropagandaOffice", models=["PropagandaOffice.fbx"], albedo="PropagandaOffice_Albedo.png"),
    "SpacingGuildBranch": dict(dir="Buildings/SpacingGuildBranch", models=["SpacingGuildBranch.fbx"], albedo="SpacingGuildBranch_Corrino_Albedo.png"),
    "Airfield": dict(dir="Buildings/Airfield", models=["Airfield.fbx"], albedo="AirField_Corrino_Albedo.png"),
    "ImperialStation": dict(dir="ImperialStation", models=["ImperialStation.fbx"], albedo=None),
    "SupplyDepot": dict(dir="Buildings/SupplyDepot", models=["SupplyDepot.fbx"], albedo="SupplyDepot_Corrino_Albedo.png"),
    "MilitaryBase": dict(dir="Buildings/MilitaryBase", models=["MilitaryBase.fbx"], albedo="MilitaryBase_Corrino_Albedo.png"),
    "Ambassade": dict(dir="Buildings/Ambassade", models=["Ambassade.fbx"], albedo="Ambassade_Albedo.png"),
}


def font(sz):
    try:
        return ImageFont.truetype("arialbd.ttf", sz)
    except OSError:
        return ImageFont.load_default()


def on_grey(p):
    im = Image.open(p).convert("RGBA")
    bg = Image.new("RGBA", im.size, (46, 46, 50, 255))
    return Image.alpha_composite(bg, im).convert("RGB")


def label(shaded, idp, groups):
    im = on_grey(shaded)
    ida = np.asarray(Image.open(idp).convert("RGBA")).astype(np.int32)
    dr = ImageDraw.Draw(im)
    f = font(30)
    for g in groups:
        c = np.array(g["colour"])
        mask = (np.abs(ida[:, :, :3] - c).sum(axis=2) < 40) & (ida[:, :, 3] > 200)
        ys, xs = np.nonzero(mask)
        if len(xs) < 150:
            continue
        cx, cy = xs.mean(), ys.mean()
        k = np.argmin((xs - cx) ** 2 + (ys - cy) ** 2)
        x, y = int(xs[k]), int(ys[k])
        dr.ellipse((x - 19, y - 19, x + 19, y + 19), fill=(15, 15, 15), outline=tuple(g["colour"]), width=3)
        dr.text((x, y), g["letter"], fill=(255, 255, 255), font=f, anchor="mm")
    return im


def build(name):
    e = BUILDINGS[name]
    d = os.path.join(S, *e["dir"].split("/"))
    td = os.path.join(SCR, name)
    os.makedirs(td, exist_ok=True)
    fbx = []
    for m in e["models"]:
        hmd = os.path.join(d, m)
        data = B.REAL_LOAD(hmd)
        idx = [i for i, mm in enumerate(data.models) if mm.geometry >= 0]
        if len(idx) == 1 and len(data.models) == 1:
            fbx.append(B.convert_model(hmd, os.path.join(td, os.path.splitext(m)[0] + "_real.fbx")))
            continue
        for i in idx:                              # multi-mesh HMD (Airfield): one FBX per mesh; the root must be an identity
            def one(_p, i=i):
                dd = B.REAL_LOAD(hmd)
                dd.models = [dd.models[i]]
                dd.models[0].parent = -1
                return dd
            B.H.load = one
            try:
                out = os.path.join(td, "%s_m%d_real.fbx" % (os.path.splitext(m)[0], i))
                B.hmd2fbx.convert(hmd, out, verbose=False)
                fbx.append(out)
            finally:
                B.H.load = B.REAL_LOAD
    alb = B.dds_as_png(os.path.join(d, e["albedo"]), os.path.join(td, "albedo.png")) if e["albedo"] else None
    cfg = dict(fbx=fbx, albedo=alb, out=td, palette=PALETTE, res=720)
    cp = os.path.join(td, "cfg.json")
    json.dump(cfg, open(cp, "w"))
    for attempt in range(4):                       # Blender sometimes hangs at its first EEVEE render here: time out and retry
        try:
            with open(os.path.join(td, "render.log"), "w") as lg:
                subprocess.run([os.environ["BLENDER_EXE"], "--background", "--factory-startup", "--python",
                                os.path.join(HERE, "21_parts_blender.py"), "--", cp], stdout=lg, stderr=subprocess.STDOUT,
                               check=True, timeout=150)
            break
        except subprocess.TimeoutExpired:
            print("  timeout, retry", attempt + 1, flush=True)
    else:
        raise RuntimeError("Blender timed out 4 times")
    groups = json.load(open(os.path.join(td, "groups.json")))
    tiles = [on_grey(os.path.join(td, "tex_front.png")), on_grey(os.path.join(td, "tex_back.png"))]
    tiles += [label(os.path.join(td, "flat_%s.png" % v), os.path.join(td, "id_%s.png" % v), groups) for v in ("front", "back", "top")]
    w, h = tiles[0].size
    sheet = Image.new("RGB", (w * 5, h + 110), (30, 30, 34))
    dr = ImageDraw.Draw(sheet)
    dr.text((14, 8), name, fill=(255, 255, 255), font=font(34))
    for i, (t, cap) in enumerate(zip(tiles, ("textured, front", "textured, back", "parts, front", "parts, back", "parts, top"))):
        sheet.paste(t, (i * w, 50))
        dr.text((i * w + 14, 56), cap, fill=(210, 210, 210), font=font(20))
    x = 560
    for g in groups:
        dr.rectangle((x, 14, x + 26, 40), fill=tuple(g["colour"]))
        dr.text((x + 32, 12), "%s %s" % (g["letter"], PNAMES[PALETTE.index(tuple(g["colour"]))]), fill=(235, 235, 235), font=font(22))
        x += 150
    p = os.path.join(OUT, name + "_parts.png")
    sheet.save(p)
    print("OK", p, len(groups), "groups")
    return p


names = [a for a in _argv[1:] if a in BUILDINGS] or list(BUILDINGS)
done = []
for n in names:
    try:
        done.append(build(n))
    except Exception as exc:
        print("FAIL", n, exc)
if len(done) > 1:
    ims = [Image.open(p) for p in done]
    sc = 0.5
    ims = [i.resize((int(i.width * sc), int(i.height * sc)), Image.LANCZOS) for i in ims]
    allp = Image.new("RGB", (ims[0].width, sum(i.height for i in ims)), (30, 30, 34))
    y = 0
    for i in ims:
        allp.paste(i, (0, y)); y += i.height
    allp.save(os.path.join(OUT, "ALL_parts.png"))
    print("ALL", os.path.join(OUT, "ALL_parts.png"))
print("scratch", SCR)
