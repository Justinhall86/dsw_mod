"""v5 hand-built pauldron, step 1 (system python): find small, clean texture patches on the guard's OWN
texture to map a newly modelled pauldron onto - one lavender-armour patch and one gold-trim patch.

  python 08_scripts/v5_12_pick_uv_patches.py

A patch is good when, over a 9x9 pixel window inside the hood's armour (or gold) UV islands, the albedo barely
varies, its brightness is near that region's median, and the normal map is flat (no painted dents).
Writes intermediate_data/v5_uv_patches.json  {"armour": [u, v], "gold": [u, v], "radius_uv": r}.
"""
import json
import os

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
ns = {}
exec(open(os.path.join(HERE, "v5_05_recolour.py"), encoding="utf-8").read().split("src = np.array")[0], ns)
MP, mask_for, hsv, classify = ns["MP"], ns["mask_for"], ns["hsv"], ns["classify"]
TEX = os.path.join(MP, "landsraad_guard", "04_textures")
alb = np.array(Image.open(os.path.join(TEX, "LandsraadGuard_Albedo.png")).convert("RGB")).astype(float)
nrm = np.array(Image.open(os.path.join(TEX, "LandsraadGuard_Normal.png")).convert("RGB")).astype(float)
H, W = alb.shape[:2]
m = mask_for(["guard_17", "guard_18", "guard_11", "guard_12"], (W, H))
h, s, v = hsv(alb.astype(np.uint8))
gold = classify(h, s, v) & m
body = m & ~gold
R = 4
out = {}
for name, mask in (("armour", body), ("gold", gold)):
    med = np.median(v[mask])
    best, best_xy = 1e9, None
    ys, xs = np.nonzero(mask)
    for y, x in zip(ys[::3], xs[::3]):
        if y < R or x < R or y >= H - R or x >= W - R:
            continue
        if not mask[y - R:y + R + 1, x - R:x + R + 1].all():
            continue
        win = alb[y - R:y + R + 1, x - R:x + R + 1]
        nwin = nrm[y - R:y + R + 1, x - R:x + R + 1]
        score = (win.std(axis=(0, 1)).sum() / 255 + abs(v[y, x] - med) * 2
                 + (np.abs(nwin[..., 0] - 128).mean() + np.abs(nwin[..., 1] - 128).mean()) / 255)
        if score < best:
            best, best_xy = score, (x, y)
    x, y = best_xy
    out[name] = [(x + 0.5) / W, 1 - (y + 0.5) / H]
    print(name, "pixel", best_xy, "uv", out[name], "rgb", alb[y, x], "score %.3f" % best)
out["radius_uv"] = (R - 1) / W
json.dump(out, open(os.path.join(HERE, "intermediate_data", "v5_uv_patches.json"), "w"))
