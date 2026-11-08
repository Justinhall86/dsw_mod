"""Cleaned donor albedos for the Lancer: no green anywhere, no Atreides sigil.
Writes 04_textures/clean/<Name>_Albedo.png; 20_build_variant.texture_paths() prefers these.

- every donor: green-hue pixels -> neutral grey of the same luminance (Atreides house colour)
- Kraken: the green hexagon emblem plate AND the white hawk sigil on it -> one flat plate tone
"""
import os
import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
VEH = os.path.join(R, "model_inputs", "Vehicle")
OUT = os.path.join(PROJ, "04_textures", "clean")
os.makedirs(OUT, exist_ok=True)

DONORS = ["Atreide/CarryAll/CarryAll", "Atreide/Kraken/Kraken", "Smuggler/Banshee/Banshee",
          "Fremen/KulonTurret/KulonTurret"]


def hsv(a):
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    mx, mn = a.max(-1), a.min(-1)
    d = mx - mn + 1e-6
    h = np.where(mx == r, ((g - b) / d) % 6, np.where(mx == g, (b - r) / d + 2, (r - g) / d + 4)) * 60
    s = np.where(mx > 0, (mx - mn) / (mx + 1e-6), 0)
    return h, s, mx


for stem in DONORS:
    src = os.path.join(VEH, stem.replace("/", os.sep) + "_Albedo.png")
    im = Image.open(src)
    alpha = im.getchannel("A") if im.mode == "RGBA" else None
    a = np.asarray(im.convert("RGB")).astype(np.float32) / 255
    h, s, v = hsv(a)
    lum = (0.2126 * a[..., 0] + 0.7152 * a[..., 1] + 0.0722 * a[..., 2])
    green = (h > 75) & (h < 170) & (s > 0.22) & (v > 0.12)
    out = a.copy()
    out[green] = lum[green][:, None] * np.array([1.0, 1.0, 1.04])     # cool neutral, same value
    n_sigil = 0
    if stem.endswith("Kraken"):
        H, W = lum.shape
        y0, y1, x0, x1 = 0, int(0.19 * H), int(0.10 * W), int(0.60 * W)   # emblem hexagon region
        reg = np.zeros_like(green); reg[y0:y1, x0:x1] = True
        # the hexagon = per row, everything between the leftmost and rightmost green pixel
        # (the sigil's white strokes sit inside that span); nothing outside the hexagon is touched
        plate = np.zeros_like(green)
        for y in range(y0, y1):
            xs = np.nonzero(green[y, x0:x1])[0]
            if len(xs) > 4:
                plate[y, x0 + xs.min():x0 + xs.max() + 1] = True
        tone = np.median(lum[reg & green]) if (reg & green).any() else 0.35
        out[plate] = np.array([tone, tone, tone * 1.04])
        n_sigil = int(plate.sum())
    res = Image.fromarray((np.clip(out, 0, 1) * 255).astype(np.uint8), "RGB")
    if alpha is not None:
        res.putalpha(alpha)
    name = os.path.basename(stem)
    res.save(os.path.join(OUT, name + "_Albedo.png"))
    print("%-12s green px %6d  sigil/plate px %6d" % (name, int(green.sum()), n_sigil))
