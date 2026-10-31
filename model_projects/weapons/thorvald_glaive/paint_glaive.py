"""Paint the House Thorvald glaive's albedo (textures/Glaive_Albedo.png, 1024) from the layout make_glaive.py wrote (glaive_uv.json).

    python paint_glaive.py

  - top-left: the vanilla Landsraad halberd albedo, brass fittings -> worn copper, the grey shaft -> matte black;
  - top-right: the blade, dark forged steel with a lighter honed edge and scratches (the sheet's glaive);
  - bottom-right: the rust cloth grip wrap, spiral bands.
"""
import colorsys
import json
import os

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
L = json.load(open(os.path.join(HERE, "glaive_uv.json")))
S = 1024
rng = np.random.default_rng(11)
P = lambda uv: (uv[0] * S, (1.0 - uv[1]) * S)

canvas = np.zeros((S, S, 3), float) + 30.0
# --- vanilla halberd, recoloured ---
src = np.asarray(Image.open(os.path.join(HERE, "textures", "Halberd.png")).convert("RGB").resize((S // 2, S // 2), Image.LANCZOS), float) / 255.0
hsv = np.apply_along_axis(lambda p: colorsys.rgb_to_hsv(*p), 2, src)
h, s, v = hsv[..., 0], hsv[..., 1], hsv[..., 2]
brass = (s > 0.28) & (h > 0.04) & (h < 0.17)
h2 = np.where(brass, 0.05, h)
s2 = np.where(brass, np.clip(s * 1.05, 0, 0.75), s * 0.25)
v2 = np.where(brass, v * 0.72, v * 0.42)
rgb = np.stack(np.vectorize(colorsys.hsv_to_rgb)(h2, s2, v2), -1) * 255.0
canvas[: S // 2, : S // 2] = rgb

# --- blade ---
q = np.zeros((S, S, 3), float) + (52, 52, 56)
q += (np.asarray(Image.fromarray((rng.random((S // 16, S // 16)) * 255).astype(np.uint8)).resize((S, S), Image.BICUBIC), float)[..., None] / 255.0 - 0.5) * 16
canvas[: S // 2, S // 2:] = q[: S // 2, S // 2:]
pil = Image.fromarray(np.clip(canvas, 0, 255).astype(np.uint8))
edge = Image.new("L", (S, S), 0)
de = ImageDraw.Draw(edge)
de.line([P(p) for p in L["edge"]] + [P(L["tip"])], fill=255, width=44)
edge = edge.filter(ImageFilter.GaussianBlur(5))
blade_mask = Image.new("L", (S, S), 0)
ImageDraw.Draw(blade_mask).polygon([P(p) for p in L["contour"]], fill=255)
ImageDraw.Draw(blade_mask).polygon([P(p) for p in L["hook"]], fill=255)
e = np.asarray(edge, float) / 255.0 * (np.asarray(blade_mask, float) / 255.0)   # only the half of the line inside the blade
arr = np.asarray(pil, float)
arr = arr * (1 - 0.8 * e[..., None]) + np.array((150, 152, 158), float) * 0.8 * e[..., None]
pil = Image.fromarray(np.clip(arr, 0, 255).astype(np.uint8))
d = ImageDraw.Draw(pil)
for _ in range(70):
    x, y = rng.uniform(S * 0.52, S * 0.98), rng.uniform(0, S * 0.48)
    dx, dy = rng.normal(0, 14), rng.normal(0, 14)
    c = int(rng.uniform(80, 115))
    d.line([(x, y), (x + dx, y + dy)], fill=(c, c, c + 4), width=1)

# --- grip wrap ---
u0, u1 = L["wrap"]["u"]
v0, v1 = L["wrap"]["v"]
x0, x1 = int(u0 * S), int(u1 * S)
y0, y1 = int((1 - v1) * S), int((1 - v0) * S)
yy, xx = np.mgrid[y0:y1, x0:x1]
band = ((xx - x0) * 0.6 + (yy - y0)) % 46
wrap = np.zeros(band.shape + (3,), float) + (112, 52, 30)
wrap[band < 7] = (66, 30, 17)
wrap[(band >= 7) & (band < 10)] = (135, 66, 38)
wrap += rng.normal(0, 6, wrap.shape)
arr = np.asarray(pil, float).copy()
arr[y0:y1, x0:x1] = wrap
pil = Image.fromarray(np.clip(arr, 0, 255).astype(np.uint8))
pil.save(os.path.join(HERE, "textures", "Glaive_Albedo.png"))
print("SAVED textures/Glaive_Albedo.png", pil.size)
