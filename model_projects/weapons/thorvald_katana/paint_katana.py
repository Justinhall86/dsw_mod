"""Paint the katana's blade black (blackened steel), leaving the hilt as it is.

    python paint_katana.py            (system Python, PIL + numpy; run make_katana.py first so blade_uv.json exists)

Inside the blade's UV polygons the albedo becomes near-black: the painted shading of the source (edge highlight, fuller line) is kept as a
narrow value range (0.05 - 0.17) so the blade still reads as a sharpened steel shape, not a flat silhouette.  Output: textures/Katana_Albedo.png.
Checks that no hilt texel was changed (the hilt's UV polygons must not overlap the blade's).
"""
import json
import os

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
src = Image.open(os.path.join(HERE, "textures", "MetalSword_Albedo.png")).convert("RGBA")
W, H = src.size
uvs = json.load(open(os.path.join(HERE, "blade_uv.json")))


def raster(polys, grow):
    m = Image.new("L", (W, H), 0)
    d = ImageDraw.Draw(m)
    for poly in polys:
        d.polygon([(u % 1.0 * W, (1 - v % 1.0) * H) for u, v in poly], fill=255)
    if grow:
        m = m.filter(ImageFilter.MaxFilter(grow))
    return np.asarray(m) > 0


blade = raster(uvs["blade"], 3)
hilt = raster(uvs["hilt"], 0)
shared = blade & hilt
print("CHECK texels shared by blade and hilt: %d" % shared.sum())
mask = blade & ~hilt                                             # never repaint a texel the hilt also uses
a = np.asarray(src).astype(np.float32) / 255.0
rgb = a[..., :3]
v = rgb.max(-1)
sel = v[mask]
lo, hi = np.percentile(sel, [3, 97])
tv = 0.05 + 0.12 * np.clip((v - lo) / max(hi - lo, 1e-6), 0, 1)
black = np.stack([tv * 0.96, tv * 0.98, tv * 1.04], -1)          # blackened steel, a hair cool
out = rgb.copy()
out[mask] = black[mask]
res = np.concatenate([out, a[..., 3:]], -1)
Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(os.path.join(HERE, "textures", "Katana_Albedo.png"))
print("BLADE texels painted black: %d (%.1f%% of the map)" % (mask.sum(), 100.0 * mask.sum() / mask.size))
