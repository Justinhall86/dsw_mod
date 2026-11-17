"""2.1 helmet atlas (owner 2026-11-13): the S9 kit atlas with the 16 painted brow-band rivets removed from all three maps.
    python 14_helm_tex_v21.py  -> 04_textures/v2/2.1/SwornHelm_{Albedo,MetallicGlossAO,Normal}.png
Rivet rows = rows inside the helmet region (u .36-1, v .55-1 of S9's REG) where copper covers 2-35 % of the row; every copper
pixel there (dilated 2 px) takes the pixel half a rivet period (1/32 of the region width) to the side - the plain band."""
import os
import numpy as np
from PIL import Image, ImageFilter
P = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC, DST = os.path.join(P, "04_textures", "S9"), os.path.join(P, "04_textures", "v2", "2.1")
maps = {k: np.asarray(Image.open(os.path.join(SRC, "SwornKit_%s.png" % k)).convert("RGBA")).copy() for k in ("Albedo", "MetallicGlossAO", "Normal")}
A = maps["Albedo"].astype(int); H, W = A.shape[:2]
x0, y1 = int(0.36 * W), int(0.45 * H)                       # helmet region: x >= x0, y < y1 (v > .55)
r, g, b = A[..., 0], A[..., 1], A[..., 2]
cu = (r > g + 30) & (g > b) & (r > 120)
reg = np.zeros_like(cu); reg[:y1, x0:] = True
frac = (cu & reg)[:, x0:].mean(1)
rows = (frac > 0.02) & (frac < 0.35); rows[y1:] = False
riv = cu & reg & rows[:, None]
riv = np.asarray(Image.fromarray((riv * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(5))) > 0
riv &= reg & rows[:, None] | (riv & reg & np.roll(rows, 2)[:, None]) | (riv & reg & np.roll(rows, -2)[:, None])
half = (W - x0) // 32
ys, xs = np.nonzero(riv)
xs2 = np.where(xs + half < W, xs + half, xs - half)
for k, m in maps.items():
    m[ys, xs] = m[ys, xs2]
    Image.fromarray(m, "RGBA").save(os.path.join(DST, "SwornHelm_%s.png" % k))
print("RIVETS removed: %d px in rows %s" % (len(ys), np.nonzero(rows)[0][[0, -1]] if rows.any() else "none"))
