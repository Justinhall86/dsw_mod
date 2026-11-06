"""B-only katana colour: the library katana's gold guard/pommel rendered as pale yellow-beige on B (read like the old
beige forearm bands), so for B they become the house copper. System Python (Pillow + numpy).

  python 25_recolour_katana.py

Reads model_projects/weapons/thorvald_katana/textures/Katana_Albedo.png (unchanged - the Trooper uses it) and writes
04_textures/B_katana/Katana_Albedo_B.png, which 22_mount_two_swords.py puts on B's two katanas.
Gold = warm, saturated, bright texels (r > 140, r - b > 70, g > 0.45 r); the painted shading is kept.
"""
import os

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
SRC = os.path.join(PROJ, os.pardir, os.pardir, "weapons", "thorvald_katana", "textures", "Katana_Albedo.png")
OUT = os.path.join(PROJ, "04_textures", "B_katana", "Katana_Albedo_B.png")
COPPER = np.array((178, 104, 52), dtype=np.float64)

img = Image.open(SRC).convert("RGBA")
a = np.asarray(img).astype(np.float64)
r, g, b = a[..., 0], a[..., 1], a[..., 2]
gold = (r > 140) & (r - b > 70) & (g > 0.45 * r)
lum = a[..., :3].sum(-1)
rel = np.clip(lum / max(lum[gold].mean(), 1.0), 0.6, 1.15)[..., None]
out = a.copy()
out[..., :3][gold] = np.clip(COPPER * rel, 0, 255)[gold]
os.makedirs(os.path.dirname(OUT), exist_ok=True)
Image.fromarray(out.astype(np.uint8), "RGBA").save(OUT)
print("gold texels -> copper: %d; saved %s" % (gold.sum(), OUT))
