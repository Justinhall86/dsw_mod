"""Find a clean, even-coloured square on an albedo texture - the UV patch a hand-modelled part samples so it
takes that exact colour (e.g. the collar: a patch of mantle -> wine, a patch of blue scarf -> gold after recolour).

    python find_uv_patch.py <albedo.png> --hue 0 40 [--sat 0.3] [--val 0.3] [--win 16]
                            [--regions uv_regions.json --region upper]

Prints the patch as (u0, u1, v0, v1) in UV space (v up), ready to paste into the COLLAR dict of 03_variants.py.
--regions/--region restrict the search to one body region from 08_uvdump.py (so the patch really belongs to the
part you mean, not to some other island with a similar colour).  Lower std = more even = better.
"""
import argparse
import json

import numpy as np
from PIL import Image

ap = argparse.ArgumentParser()
ap.add_argument("albedo")
ap.add_argument("--hue", nargs=2, type=float, default=[0, 360], metavar=("LO", "HI"))
ap.add_argument("--sat", type=float, default=0.3, help="minimum saturation")
ap.add_argument("--val", type=float, default=0.25, help="minimum value")
ap.add_argument("--win", type=int, default=16, help="square size in pixels")
ap.add_argument("--regions")
ap.add_argument("--region")
a = ap.parse_args()

im = Image.open(a.albedo).convert("RGB")
W, H = im.size
rgb = np.asarray(im).astype(np.float32) / 255.0
mx, mn = rgb.max(-1), rgb.min(-1)
d = np.maximum(mx - mn, 1e-6)
r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
h = np.where(mx == r, (60 * ((g - b) / d)) % 360, np.where(mx == g, 60 * ((b - r) / d) + 120, 60 * ((r - g) / d) + 240))
s = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
ok = (h >= a.hue[0]) & (h < a.hue[1]) & (s >= a.sat) & (mx >= a.val)

if a.regions:
    from PIL import ImageDraw, ImageFilter
    data = json.load(open(a.regions))
    key = next(k for k in data if a.albedo.replace("\\", "/").split("/")[-1].lower() in k.replace("\\", "/").lower())
    m = Image.new("L", (W, H), 0)
    dr = ImageDraw.Draw(m)
    for poly in data[key][a.region]:
        dr.polygon([(u % 1.0 * W, (1 - v % 1.0) * H) for u, v in poly], fill=255)
    ok &= np.asarray(m.filter(ImageFilter.MinFilter(3))) > 0

best = None
step = max(2, a.win // 4)
for y in range(0, H - a.win, step):
    for x in range(0, W - a.win, step):
        if ok[y:y + a.win, x:x + a.win].all():
            sd = float(rgb[y:y + a.win, x:x + a.win].std())
            if best is None or sd < best[0]:
                best = (sd, x, y)
if best is None:
    raise SystemExit("no even patch found - loosen --sat/--val, shrink --win or widen --hue")
sd, x, y = best
print("patch std %.3f at pixel (%d,%d) size %d" % (sd, x, y, a.win))
print("UV box (u0, u1, v0, v1) = (%.4f, %.4f, %.4f, %.4f)" % (x / W, (x + a.win) / W, 1 - (y + a.win) / H, 1 - y / H))
