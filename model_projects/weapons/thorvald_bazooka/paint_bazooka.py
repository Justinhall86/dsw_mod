"""Thorvald colours for the bazooka, by hue on the vanilla Fremen albedo (value kept, so all painted shading survives):
grey tube / metal -> matte black-gunmetal, copper-brown tube sections + grip -> rust, orange stripe + yellow lamp -> copper.

    python paint_bazooka.py   -> textures/Thorvald_Bazooka_Albedo.png
"""
import os

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
a = np.asarray(Image.open(os.path.join(HERE, "textures", "Bazooka_Albedo.png")).convert("RGBA")).astype(np.float32) / 255.0
rgb = a[..., :3]
mx, mn = rgb.max(-1), rgb.min(-1)
sat = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0.0)
r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
d = np.maximum(mx - mn, 1e-6)
hue = np.where(mx == r, ((g - b) / d) % 6, np.where(mx == g, (b - r) / d + 2, (r - g) / d + 4)) * 60.0


def tint(col, lo, hi, m):
    c = np.array(col, np.float32) / 255.0
    return (c / c.max())[None, :] * (lo + mx[m] * (hi - lo))[:, None]


out = rgb.copy()
bright = (sat > 0.60) & (hue >= 18) & (hue < 70) & (mx > 0.60)          # orange stripe, yellow lamp
warm = (sat > 0.42) & ((hue < 40) | (hue > 340)) & ~bright             # copper / brown tube sections, grip (saturation is bimodal:
#                                                                         the warm-grey tube sits at 0.25-0.30, the copper at 0.50-0.55)
metal = ~(bright | warm)
out[metal] = tint((50, 46, 42), 0.05, 0.30, metal)                        # black-gunmetal tube (clean paint, not corrosion)
out[warm] = tint((112, 52, 30), 0.14, 0.46, warm)                         # rust bands
out[bright] = tint((178, 110, 60), 0.45, 0.75, bright)                    # copper
res = np.concatenate([out, np.ones_like(a[..., 3:])], -1)
Image.fromarray((res.clip(0, 1) * 255 + 0.5).astype(np.uint8)).save(os.path.join(HERE, "textures", "Thorvald_Bazooka_Albedo.png"))
print("PAINT metal %d  rust %d  copper %d px" % (metal.sum(), warm.sum(), bright.sum()))
