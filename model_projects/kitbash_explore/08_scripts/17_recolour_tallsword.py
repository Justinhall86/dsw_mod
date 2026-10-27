"""Recolour the Ecaz TallSword: the pale pink-white blade becomes dark gunmetal with a steel-blue cast.

    python -I 17_recolour_tallsword.py

The vanilla blade is near-white, so it washes out against light backgrounds.  Hue and saturation are replaced and the
value range is compressed onto a darker band (the base shading survives).  Only the pale blade pixels (left of x 205, above y 400 in the
512 px atlas) are touched; the gold crescents, grey guard and dark grip are kept.
Writes 04_textures/melee/TallSword_Ginaz/ and adds a "TallSword_Ginaz" entry to melee_weapons.json
(14_melee_textures.py rebuilds that manifest, so re-run this script after it).
"""
import json
import os

import numpy as np
from PIL import Image

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(PROJ, "04_textures", "melee", "TallSword")
DST = os.path.join(PROJ, "04_textures", "melee", "TallSword_Ginaz")
MANIFEST = os.path.join(PROJ, "05_fbx_export", "melee", "melee_weapons.json")
BLADE_X, BLADE_Y, STRIP_X = 205, 400, 118   # blade strips in the atlas (the guard plates sit right of / below this)
HUE, SAT = 165, 35            # PIL HSV scale 0-255: ~233 deg steel blue, S 0.14
V_LOW, V_HIGH = 40, 150       # compressed value band

os.makedirs(DST, exist_ok=True)
albedo = Image.open(os.path.join(SRC, "WeaponFencer_Albedo.png")).convert("RGBA")
hsv = np.array(albedo.convert("RGB").convert("HSV")).astype(np.float32)
h, s, v = hsv[..., 0], hsv[..., 1], hsv[..., 2]
h_px, w_px = h.shape
xs = np.tile(np.arange(w_px), (h_px, 1))

ys = np.tile(np.arange(h_px)[:, None], (1, w_px))
blade = ((xs < BLADE_X) & (ys < BLADE_Y)) | (xs < STRIP_X)      # the far-left strips run to the atlas bottom
mask = blade & (v > 150)                                          # only the pale blade pixels; dark grey bands stay
print("recoloured pixels: %.1f%% of the atlas" % (100.0 * mask.mean()))

lo, hi = np.percentile(v[mask], 3), np.percentile(v[mask], 97)
vn = np.clip((v - lo) / max(hi - lo, 1.0), 0.0, 1.0)
h[mask] = HUE
s[mask] = SAT
v[mask] = V_LOW + vn[mask] * (V_HIGH - V_LOW)

out = Image.fromarray(np.stack([h, s, v], axis=-1).astype(np.uint8), "HSV").convert("RGB").convert("RGBA")
out.save(os.path.join(DST, "WeaponFencer_Albedo.png"))
for name in ("WeaponFencer_MetallicGlossAO.png", "WeaponFencer_Normal.png"):
    Image.open(os.path.join(SRC, name)).save(os.path.join(DST, name))

manifest = json.load(open(MANIFEST))
entry = dict(manifest["TallSword"])
entry["Albedo"] = os.path.join(DST, "WeaponFencer_Albedo.png").replace("\\", "/")
entry["MetallicGlossAO"] = os.path.join(DST, "WeaponFencer_MetallicGlossAO.png").replace("\\", "/")
entry["Normal"] = os.path.join(DST, "WeaponFencer_Normal.png").replace("\\", "/")
manifest["TallSword_Ginaz"] = entry
json.dump(manifest, open(MANIFEST, "w"), indent=2)
print("WROTE", DST, "and manifest entry TallSword_Ginaz")
