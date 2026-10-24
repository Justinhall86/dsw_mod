"""Recolour Gurney's green cloth/armour to black, keeping all painted shading.

    python 10_recolour_gurney_black.py <Gurney_Albedo.png> <out Albedo.png>

Only pixels whose hue is green (and that are saturated enough to read as
green) are touched; skin, hair, leather belt, silver plate, gold gems and the
dark base all keep their original pixels.  Value is compressed onto a near-black
band so creases and highlights survive; the mint stripe becomes a dark-grey
accent instead of vanishing.
"""
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import rgb_to_hsv, hsv_to_rgb  # noqa: E402

src, dst = sys.argv[1], sys.argv[2]
img = Image.open(src).convert("RGBA")
rgba = np.asarray(img).astype(np.float32) / 255.0
rgb = rgba[..., :3]

h, s, v = rgb_to_hsv(rgb)          # hue in degrees
green = (h > 75) & (h < 195) & (s > 0.22) & (v > 0.12)

# soft edge so the recolour does not leave a bright green fringe
from PIL import ImageFilter  # noqa: E402
mask = Image.fromarray((green * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(3))
mask = np.asarray(mask.filter(ImageFilter.GaussianBlur(0.8))).astype(np.float32) / 255.0

lo, hi = np.percentile(v[green], [3, 97])
vn = np.clip((v - lo) / max(hi - lo, 1e-6), 0, 1)
new_v = 0.035 + 0.17 * vn            # near-black, shading kept
new_s = np.full_like(s, 0.06)        # neutral black, faint cool tint
new_h = np.full_like(h, 220.0)
out_rgb = hsv_to_rgb(new_h, new_s, new_v)
res = rgb * (1 - mask[..., None]) + out_rgb * mask[..., None]
res = np.concatenate([res, rgba[..., 3:]], axis=-1)
Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(dst)
print("green px %d (%.1f%%)  v-range %.2f..%.2f -> %s"
      % (green.sum(), 100 * green.mean(), lo, hi, dst))
