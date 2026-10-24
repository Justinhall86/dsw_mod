"""Find small, clean spots on a body's OWN texture to map newly modelled geometry onto (system python).

  python pick_uv_patches.py --albedo Body_Albedo.png --normal Body_Normal.png --uv-json uv_tris.json
                            --keys guard_17 guard_18 guard_11 guard_12 --out uv_patches.json

Searches inside the given UV islands for a 9x9 window that is (a) all inside the islands, (b) nearly uniform in
colour, (c) close to the region's median brightness, (d) flat in the normal map. Returns one "armour" spot and one
"gold" spot -> {"armour": [u, v], "gold": [u, v], "radius_uv": r} for dsw_parts.build_shell.
"""
import argparse
import json
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from recolour_parts import hsv, is_gold, mask_for  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--albedo", required=True)
ap.add_argument("--normal", required=True)
ap.add_argument("--uv-json", required=True)
ap.add_argument("--keys", nargs="+", required=True)
ap.add_argument("--out", required=True)
ap.add_argument("--radius", type=int, default=4)
a = ap.parse_args()

alb = np.array(Image.open(a.albedo).convert("RGB")).astype(float)
nrm = np.array(Image.open(a.normal).convert("RGB")).astype(float)
H, W = alb.shape[:2]
m = mask_for(json.load(open(a.uv_json)), a.keys, (W, H))
h, s, v = hsv(alb)
gold = is_gold(h, s, v) & m
R = a.radius
out = {}
for name, mask in (("armour", m & ~gold), ("gold", gold)):
    med = np.median(v[mask])
    best, xy = 1e9, None
    ys, xs = np.nonzero(mask)
    for y, x in zip(ys[::3], xs[::3]):
        if y < R or x < R or y >= H - R or x >= W - R or not mask[y - R:y + R + 1, x - R:x + R + 1].all():
            continue
        win, nwin = alb[y - R:y + R + 1, x - R:x + R + 1], nrm[y - R:y + R + 1, x - R:x + R + 1]
        score = (win.std(axis=(0, 1)).sum() / 255 + abs(v[y, x] - med) * 2
                 + (np.abs(nwin[..., 0] - 128).mean() + np.abs(nwin[..., 1] - 128).mean()) / 255)
        if score < best:
            best, xy = score, (x, y)
    if xy is None:
        raise SystemExit("no clean %s patch found - add more islands with --keys" % name)
    out[name] = [float((xy[0] + 0.5) / W), float(1 - (xy[1] + 0.5) / H)]
    print(name, "pixel", xy, "uv", out[name], "rgb", alb[xy[1], xy[0]], "score %.3f" % best)
out["radius_uv"] = (R - 1) / W
json.dump(out, open(a.out, "w"), indent=1)
