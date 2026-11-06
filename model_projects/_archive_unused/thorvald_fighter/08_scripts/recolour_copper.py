"""Recolour the Renegade's cool/blue accent pixels to the House Thorvald copper.

    python recolour_copper.py -- <albedo.png> <mgao.png> <out_dir> [--prefix Thorvald_Renegade]

METHOD (same idea as the unit recolours): keep every pixel's VALUE, replace hue + saturation, so all painted
shading, panel lines and weathering survive.  Selection is by hue band, weighted smoothly so anti-aliased edges
between an accent and the hull blend instead of leaving a fringe:

  coolness  = 1 - |hue - 205| / 80          (1 on the blue accents, 0 outside 125..285)
  strength  = smoothstep on saturation 0.05..0.20   (near-neutral hull pixels barely move)
  w         = coolness * strength

  hue  -> lerp(hue, 25, w)            (25 deg = copper #B26E3C)
  sat  -> lerp(sat, clip(sat*1.1 + 0.18, 0.25, 0.75), w)
  value -> unchanged

Pixels treated as accent (w > 0.5) get their metallic/gloss raised to copper in the MGAO map:
R (metallic) 0.85, G (gloss) 0.70.

Outputs into <out_dir>:
  <prefix>_Albedo.png, <prefix>_MetallicGlossAO.png, copper_mask.png (diagnostic), copper_report.txt
"""
import os
import sys

import numpy as np
from PIL import Image


def script_args(argv):
    return argv[argv.index("--") + 1:] if "--" in argv else argv[1:]


a = script_args(sys.argv)
if len(a) < 3:
    raise SystemExit(__doc__)
albedo_p, mg_p, out_dir = os.path.abspath(a[0]), os.path.abspath(a[1]), os.path.abspath(a[2])
prefix = a[a.index("--prefix") + 1] if "--prefix" in a else "Thorvald_Renegade"
os.makedirs(out_dir, exist_ok=True)

TARGET_HUE = 25.0
RAMP_LO, RAMP_HI = 0.05, 0.20
HALF_BAND = 80.0

rgb = np.array(Image.open(albedo_p).convert("RGB")).astype(np.float32) / 255.0
mg = np.array(Image.open(mg_p).convert("RGB")).astype(np.float32) / 255.0

r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
mx = rgb.max(-1)
mn = rgb.min(-1)
val = mx
sat = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1e-6), 0.0)
d = np.maximum(mx - mn, 1e-6)
hue = np.where(mx == r, ((g - b) / d) % 6, np.where(mx == g, (b - r) / d + 2, (r - g) / d + 4)) * 60.0

dist = np.abs((hue - 205.0 + 180.0) % 360.0 - 180.0)
cool = np.clip(1.0 - dist / HALF_BAND, 0.0, 1.0)
t = np.clip((sat - RAMP_LO) / (RAMP_HI - RAMP_LO), 0.0, 1.0)
strength = t * t * (3.0 - 2.0 * t)                 # smoothstep
w = cool * strength

new_h = (hue + (TARGET_HUE - hue) * w) % 360.0
sat_target = np.clip(sat * 1.1 + 0.18, 0.25, 0.75)
new_s = sat + (sat_target - sat) * w
new_v = val                                           # value untouched: all shading survives

# HSV -> RGB
hh = new_h / 60.0
i = np.floor(hh).astype(np.int32) % 6
f = hh - np.floor(hh)
p = new_v * (1.0 - new_s)
q = new_v * (1.0 - new_s * f)
tt = new_v * (1.0 - new_s * (1.0 - f))
out = np.zeros_like(rgb)
for k, (rr, gg, bb) in enumerate([(new_v, tt, p), (q, new_v, p), (p, new_v, tt),
                                  (p, q, new_v), (tt, p, new_v), (new_v, p, q)]):
    m = i == k
    out[..., 0][m] = rr[m]
    out[..., 1][m] = gg[m]
    out[..., 2][m] = bb[m]

# ---- MGAO: accents read as copper metal ------------------------------------
acc = w > 0.5
mg_out = mg.copy()
met, glo = mg_out[..., 0], mg_out[..., 1]
met[acc] = np.maximum(met[acc], 0.85)
glo[acc] = np.maximum(glo[acc], 0.70)
mg_out[..., 0], mg_out[..., 1] = met, glo

Image.fromarray((np.clip(out, 0, 1) * 255).astype(np.uint8)).save(
    os.path.join(out_dir, prefix + "_Albedo.png"))
Image.fromarray((np.clip(mg_out, 0, 1) * 255).astype(np.uint8)).save(
    os.path.join(out_dir, prefix + "_MetallicGlossAO.png"))

mask = np.zeros(rgb.shape[:2] + (3,), np.uint8)
mask[..., 0] = (np.clip(w, 0, 1) * 255).astype(np.uint8)
mask[..., 1] = ((rgb.mean(-1)) * 255).astype(np.uint8)
mask[..., 2] = ((rgb.mean(-1)) * 255).astype(np.uint8)
Image.fromarray(mask).resize((1024, 1024), Image.NEAREST).save(os.path.join(out_dir, "copper_mask.png"))
Image.fromarray((np.clip(out, 0, 1) * 255).astype(np.uint8)).resize((1024, 1024), Image.NEAREST).save(
    os.path.join(out_dir, "albedo_2x_copper.png"))

mean_before = (rgb.reshape(-1, 3).mean(0) * 255).round(1)
mean_after = (np.clip(out, 0, 1).reshape(-1, 3).mean(0) * 255).round(1)
rep = [
    "source %s" % albedo_p,
    "pixels changed (w>0.05): %d / %d (%.1f%%)" % (int((w > 0.05).sum()), w.size, 100 * (w > 0.05).mean()),
    "accent pixels (w>0.5):   %d (%.2f%%)" % (int(acc.sum()), 100 * acc.mean()),
    "mean rgb before %s  after %s" % (mean_before, mean_after),
    "target hue %.1f deg (copper #B26E3C), value preserved per pixel" % TARGET_HUE,
]
open(os.path.join(out_dir, "copper_report.txt"), "w", encoding="utf-8").write("\n".join(rep) + "\n")
print("\n".join(rep))
print("SAVED", os.path.join(out_dir, prefix + "_Albedo.png"))
