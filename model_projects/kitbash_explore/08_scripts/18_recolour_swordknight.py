"""Recolour the Ecaz SwordKnight: pink hilt jewels -> deep wine (matches the Ginaz coat), pale blade -> steel blue.

    python -I 18_recolour_swordknight.py

Hue/saturation are replaced and the value range is compressed per region (base shading survives).  The gold guard,
grey grip and dark discs are untouched.  Writes 04_textures/melee/SwordKnight_Ginaz/ and adds a "SwordKnight_Ginaz" entry
to melee_weapons.json (14_melee_textures.py rebuilds that manifest, so re-run this script after it).
The SwordKnight has no normal map in the game files.
"""
import json
import os

import numpy as np
from PIL import Image

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(PROJ, "04_textures", "melee", "SwordKnight")
DST = os.path.join(PROJ, "04_textures", "melee", "SwordKnight_Ginaz")
MANIFEST = os.path.join(PROJ, "05_fbx_export", "melee", "melee_weapons.json")
BLADE_X = 80                      # blade strips in the 256 px atlas
WINE = (243, 165, 45, 125)        # PIL HSV 0-255: hue ~340 deg, sat, value low/high
STEEL = (165, 35, 40, 150)        # hue ~233 deg steel blue

os.makedirs(DST, exist_ok=True)
albedo = Image.open(os.path.join(SRC, "SwordKnight_Albedo.png")).convert("RGB")
hsv = np.array(albedo.convert("HSV")).astype(np.float32)
h, s, v = hsv[..., 0], hsv[..., 1], hsv[..., 2]
xs = np.tile(np.arange(h.shape[1]), (h.shape[0], 1))

pink = ((h > 215) | (h < 10)) & (s > 40)
blade = (xs < BLADE_X) & (s < 60)
print("pink %.1f%%  blade %.1f%% of the atlas" % (100 * pink.mean(), 100 * blade.mean()))


def repaint(mask, hue, sat, v_low, v_high):
    lo, hi = np.percentile(v[mask], 3), np.percentile(v[mask], 97)
    vn = np.clip((v - lo) / max(hi - lo, 1.0), 0.0, 1.0)
    new_v = v_low + vn * (v_high - v_low)
    h[mask], s[mask], v[mask] = hue, sat, new_v[mask]


repaint(pink, *WINE)
repaint(blade, *STEEL)

out = Image.fromarray(np.stack([h, s, v], axis=-1).astype(np.uint8), "HSV").convert("RGB").convert("RGBA")
out.save(os.path.join(DST, "SwordKnight_Albedo.png"))
Image.open(os.path.join(SRC, "SwordKnight_MetallicGlossAO.png")).save(os.path.join(DST, "SwordKnight_MetallicGlossAO.png"))

manifest = json.load(open(MANIFEST))
entry = dict(manifest["SwordKnight"])
entry["Albedo"] = os.path.join(DST, "SwordKnight_Albedo.png").replace("\\", "/")
entry["MetallicGlossAO"] = os.path.join(DST, "SwordKnight_MetallicGlossAO.png").replace("\\", "/")
manifest["SwordKnight_Ginaz"] = entry
manifest["SwordKnight_Blade"] = dict(entry, blade_only=True)   # same texture, hilt removed by 15_melee_gallery.py
json.dump(manifest, open(MANIFEST, "w"), indent=2)
print("WROTE", DST, "and manifest entries SwordKnight_Ginaz, SwordKnight_Blade")
