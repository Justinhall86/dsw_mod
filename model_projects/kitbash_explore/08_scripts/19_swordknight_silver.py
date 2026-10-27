"""Sword Knight with a plain, serious hilt: dark grey and silver instead of gold and pink.

    python -I 19_swordknight_silver.py

Texture (04_textures/melee/SwordKnight_Silver/, built from the ORIGINAL SwordKnight atlas, 256 px):
  * blade strips (x < 80)          -> steel blue (same as 18_recolour_swordknight.py)
  * gold guard / pommel (hue gold)  -> silver
  * pink jewels                     -> dark gunmetal
  * rope grip (grey patch x 80..165, y < 100, and the pale disc below it) -> dark grey
Hue/saturation are replaced and value is compressed per region, so the baked shading survives.

Manifest entries added to melee_weapons.json (14_melee_textures.py rebuilds it, so re-run 18 and this script after it):
  SwordKnight_Silver  recolour only
  SwordKnight_Simple  recolour + the flower guard dropped (loose parts above y 0.04 wider than 0.15 m)
                      + the grip moved onto the rope grip (y 0.30) so the hand holds the grip, not the guard
"""
import json
import os

import numpy as np
from PIL import Image

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(PROJ, "04_textures", "melee", "SwordKnight")
DST = os.path.join(PROJ, "04_textures", "melee", "SwordKnight_Silver")
MANIFEST = os.path.join(PROJ, "05_fbx_export", "melee", "melee_weapons.json")
STEEL = (165, 35, 40, 150)        # PIL HSV 0-255: hue, sat, value low, value high
SILVER = (165, 18, 55, 150)
GUNMETAL = (165, 25, 35, 105)
DARK_GREY = (165, 12, 14, 55)

os.makedirs(DST, exist_ok=True)
albedo = Image.open(os.path.join(SRC, "SwordKnight_Albedo.png")).convert("RGB")
hsv = np.array(albedo.convert("HSV")).astype(np.float32)
h, s, v = hsv[..., 0], hsv[..., 1], hsv[..., 2]
xs = np.tile(np.arange(h.shape[1]), (h.shape[0], 1))
ys = np.tile(np.arange(h.shape[0])[:, None], (1, h.shape[1]))

pink = ((h > 215) | (h < 10)) & (s > 40)
gold = (h >= 15) & (h <= 45) & (s > 70)
blade = (xs < 80) & (s < 60)
grip = (xs >= 62) & (xs <= 175) & (ys < 100) & (s < 60) & ~pink & ~gold
rope = (xs >= 70) & (xs <= 165) & (ys >= 165) & (ys <= 222) & (s < 60)   # the pale disc the rope grip maps to
for name, m in (("pink", pink), ("gold", gold), ("blade", blade), ("grip", grip), ("rope", rope)):
    print("%-6s %.1f%% of the atlas" % (name, 100 * m.mean()))


def repaint(mask, hue, sat, v_low, v_high):
    lo, hi = np.percentile(v[mask], 3), np.percentile(v[mask], 97)
    vn = np.clip((v - lo) / max(hi - lo, 1.0), 0.0, 1.0)
    new_v = v_low + vn * (v_high - v_low)
    h[mask], s[mask], v[mask] = hue, sat, new_v[mask]


# Region masks were taken from the original colours before any repaint, so the order does not matter.
repaint(blade, *STEEL)
repaint(gold, *SILVER)
repaint(pink, *GUNMETAL)
repaint(grip, *DARK_GREY)
repaint(rope, *DARK_GREY)

out = Image.fromarray(np.stack([h, s, v], axis=-1).astype(np.uint8), "HSV").convert("RGB").convert("RGBA")
out.save(os.path.join(DST, "SwordKnight_Albedo.png"))
Image.open(os.path.join(SRC, "SwordKnight_MetallicGlossAO.png")).save(os.path.join(DST, "SwordKnight_MetallicGlossAO.png"))

manifest = json.load(open(MANIFEST))
entry = dict(manifest["SwordKnight"])
entry["Albedo"] = os.path.join(DST, "SwordKnight_Albedo.png").replace("\\", "/")
entry["MetallicGlossAO"] = os.path.join(DST, "SwordKnight_MetallicGlossAO.png").replace("\\", "/")
manifest["SwordKnight_Silver"] = entry
manifest["SwordKnight_Simple"] = dict(entry, drop_flourish={"above_y": 0.04, "wider_than": 0.15}, grip=[0.0, 0.30, 0.0])
json.dump(manifest, open(MANIFEST, "w"), indent=2)
print("WROTE", DST, "and manifest entries SwordKnight_Silver, SwordKnight_Simple")
