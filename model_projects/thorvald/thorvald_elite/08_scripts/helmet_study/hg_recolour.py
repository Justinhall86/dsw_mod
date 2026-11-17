import os as _os, sys as _sys
_sys.path.insert(0, _os.path.dirname(_os.path.abspath(__file__)))
import paths as P
import json, sys
import numpy as np
from PIL import Image, ImageDraw, ImageFilter
sys.path.insert(0, P.REPO + "/model_projects/thorvald/thorvald_recolours/08_scripts")
import ground_recolour as gr
SRC = P.HG_DIR + "HouseGuard_Albedo.png"
a = np.asarray(Image.open(SRC).convert("RGB")); W = a.shape[0]
cats = json.load(open(P.WORK + "/house_guard/" + "cats.json"))
def mask(*ks, grow=3):
    m = Image.new("L", (W, W), 0); d = ImageDraw.Draw(m)
    for k in ks:
        for poly in cats[k]: d.polygon([(u * W, (1 - v) * W) for u, v in poly], fill=255)
    return np.asarray(m.filter(ImageFilter.MaxFilter(grow))) > 127
M = {k: mask(k) for k in cats}
v = a.astype(float).max(-1) / 255
HX = gr.hx
def cu_shade(sel, out, deep=gr.CU_DEEP, hi=gr.CU):
    t = np.clip((v - 0.10) / 0.5, 0, 1)[..., None]
    c = (deep * (1 - t) + hi * t) * np.clip(0.55 + 1.2 * v, 0.55, 1.15)[..., None]
    out[sel] = np.clip(c[sel], 0, 255)
def tone(out, sel, mul, add=0):
    out[sel] = np.clip(out[sel] * mul + add, 0, 255)
def base():
    o = gr.ramp(v, gr.GREY); return o
def mk(name):
    o = base()
    dark = M["shell"] | M["collar"] | M["dome"]; light = M["plate"] | M["chin"]
    tone(o, dark, 0.78); tone(o, light, 1.12, 2)
    return o
CD, CH = HX("#8A4F34"), HX("#B87333")
def cu(sel, o): cu_shade(sel, o, CD, CH)
out = {}
o = mk(""); out["H1_gunmetal_two_tone"] = o
o = mk(""); cu(M["plate"], o); cu(M["chin"], o); out["H2_copper_faceplate"] = o
o = mk(""); cu(M["collar"], o); out["H3_copper_collar"] = o
o = mk(""); cu(M["dome"], o); cu(M["chin"], o); out["H4_copper_crown_and_chin"] = o
o = mk(""); cu(M["dome"], o); cu(M["chin"], o); cu(M["collar"], o); tone(o, M["plate"], 0.8); out["H5_copper_crown_chin_collar"] = o
o = mk("")
NI, BR = np.array([110, 118, 124.]), np.array([168, 140, 62.])
sh = np.clip(v / 0.5, 0.6, 1.3)[..., None]
o[M["plate"]] = (NI * sh)[M["plate"]]; o[M["chin"] | M["dome"]] = (BR * sh)[M["chin"] | M["dome"]]
tone(o, M["shell"] | M["collar"], 0.7); out["H6_nickel_plate_brass_crown"] = o
for k, o in out.items():
    Image.fromarray(np.clip(o, 0, 255).astype(np.uint8)).save(P.WORK + "/house_guard/" + "%s.png" % k)
print(list(out))
