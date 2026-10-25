"""Repaint the Commando vest's back shell (vanilla hid it under the backpack, so it samples a pale strip).

    python 08_paint_vest_back.py [--v 0.16 0.30] [--rgb 70 66 70]

Only pixels inside comp1's back-facing UV triangles (04_textures/commando_back_uv.json) change.
Hue/sat become the target charcoal; the original value is compressed into the --v band so the painted
creases survive.  Writes 04_textures/Commando_NoPack_Albedo.png.
"""
import json, os, sys
import numpy as np
from PIL import Image, ImageDraw, ImageFilter
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from dsw_core import rgb_to_hsv, hsv_to_rgb

a = sys.argv[1:]
vlo, vhi = (float(a[a.index("--v") + 1]), float(a[a.index("--v") + 2])) if "--v" in a else (0.16, 0.30)
rgb_t = [int(a[a.index("--rgb") + i]) for i in (1, 2, 3)] if "--rgb" in a else [70, 66, 70]
PROJ = os.path.dirname(HERE)
src = os.path.join(PROJ, "..", "..", "model_inputs", "Common", "Commando", "Commando_Albedo.png")
img = Image.open(src).convert("RGBA")
W, H = img.size
mask = Image.new("L", (W, H), 0)
dr = ImageDraw.Draw(mask)
for t in json.load(open(os.path.join(PROJ, "04_textures", "commando_back_uv.json")))["comp1"]:
    dr.polygon([(u * W, (1 - v) * H) for u, v in t], fill=255)
mask = mask.filter(ImageFilter.MaxFilter(5)).filter(ImageFilter.GaussianBlur(1.0))
m = np.asarray(mask).astype(np.float32)[..., None] / 255.0
px = np.asarray(img).astype(np.float32) / 255.0
rgb = px[..., :3]
h, s, v = rgb_to_hsv(rgb)
th, ts, _ = rgb_to_hsv(np.array(rgb_t, np.float32) / 255.0)
sel = m[..., 0] > 0.5
lo, hi = np.percentile(v[sel], [3, 97])
nv = vlo + (vhi - vlo) * np.clip((v - lo) / max(hi - lo, 1e-6), 0, 1)
new = hsv_to_rgb(np.full_like(h, float(th)), np.full_like(s, float(ts)), nv)
out = rgb * (1 - m) + new * m
res = np.concatenate([out, px[..., 3:]], -1)
dst = os.path.join(PROJ, "04_textures", "Commando_NoPack_Albedo.png")
Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(dst)
print("painted %d px  v %.2f..%.2f -> %s" % (sel.sum(), lo, hi, dst))
