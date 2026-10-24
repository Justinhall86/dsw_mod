"""Step 05 - repaint the albedo with a house / faction colour design.

    python 05_recolour.py -- <albedo.png> <metallic_gloss_ao.png> <normal.png> \
        <region_ids.npy> <out_dir> --palette <palette.json> [--prefix Name]

THE METHOD (the same idea the game uses for its faction tints): the base
texture already carries the painted shading, so the recolour REPLACES HUE +
SATURATION and keeps VALUE.  Every crease, shadow and highlight survives for
free.

Three corrections make the result look right rather than like a flat sticker:

1. VALUE COMPRESSION.  The base's value range inside one region is far wider
   than the target colour allows - a cream plate at 250 would turn plum into
   pink.  So the region's robust value range (3rd..97th percentile) is
   COMPRESSED onto a band around the target brightness.  Shading survives;
   the hue stays.

2. RESIDUAL HUE SNAP.  The base texture has mottled camo-ish patches.  Any
   pixel further than `residual_snap` degrees from its target hue is snapped
   onto the target, so no green patch survives in a plum region.

3. METALLIC OVERRIDE.  The new colours must still read as the right material,
   so each region gets its own metallic multiplier (and the metal trim gets
   an additive push).

The palette file is JSON:
  {
    "palette": {"plum": [104, 54, 66], "gold": [196, 154, 78]},
    "recipe":  {"1": ["skin", 0.0], "4": ["plum", 0.0]},
    "metallic": {"4": [0.30, 0.0], "6": [1.0, 60.0]}
  }

Outputs (into <out_dir>)
  <prefix>_Albedo.png, <prefix>_MetallicGlossAO.png, <prefix>_Normal.png
"""
import json
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import recolour_regions, script_args

argv = script_args()
if len(argv) < 5:
    raise SystemExit("usage: 05_recolour.py -- <albedo.png> <mg.png> <normal.png> "
                     "<region_ids.npy> <out_dir> --palette <palette.json> "
                     "[--prefix Name]")

albedo_p = os.path.abspath(argv[0])
mg_p = os.path.abspath(argv[1])
normal_p = os.path.abspath(argv[2])
regions_p = os.path.abspath(argv[3])
out_dir = os.path.abspath(argv[4])
palette_p = argv[argv.index("--palette") + 1] if "--palette" in argv else None
prefix = argv[argv.index("--prefix") + 1] if "--prefix" in argv else "Recoloured"
residual = 18.0
if "--residual" in argv:
    residual = float(argv[argv.index("--residual") + 1])
os.makedirs(out_dir, exist_ok=True)

with open(palette_p, "r", encoding="utf-8") as f:
    spec = json.load(f)
PALETTE = {k: tuple(v) for k, v in spec["palette"].items()}
RECIPE = {int(k): (v[0], float(v[1])) for k, v in spec["recipe"].items()}
METALLIC = {int(k): (float(v[0]), float(v[1])) for k, v in spec.get("metallic", {}).items()}

base = np.array(Image.open(albedo_p).convert("RGBA")).astype(np.float32)
mg = np.array(Image.open(mg_p).convert("RGBA")).astype(np.float32)
reg = np.load(regions_p)

rgb = base[..., :3] / 255.0
met = mg[..., 0] / 255.0
gloss = mg[..., 1] / 255.0
ao = mg[..., 2] / 255.0

new_rgb, _ = recolour_regions(rgb, reg, RECIPE, PALETTE, residual_snap=residual)

# ---- metallic overrides -------------------------------------------------
for rid, (mul, add) in METALLIC.items():
    m = reg == rid
    if m.any():
        met[m] = np.clip(met[m] * mul + add, 0.0, 1.0)
# metal trim gets a warmer, brighter gloss so it catches light
for rid, (mul, add) in METALLIC.items():
    if add > 0:
        gloss[reg == rid] = np.clip(gloss[reg == rid] * 1.05, 0.0, 1.0)

out = np.zeros_like(base)
out[..., :3] = new_rgb * 255.0
out[..., 3] = 255.0
albedo_out = os.path.join(out_dir, prefix + "_Albedo.png")
Image.fromarray(out.astype(np.uint8), "RGBA").save(albedo_out)

mg_out = np.zeros_like(mg)
mg_out[..., 0] = met * 255.0
mg_out[..., 1] = gloss * 255.0
mg_out[..., 2] = ao * 255.0
mg_out[..., 3] = 255.0
mg_out_path = os.path.join(out_dir, prefix + "_MetallicGlossAO.png")
Image.fromarray(mg_out.astype(np.uint8), "RGBA").save(mg_out_path)

normal_out = os.path.join(out_dir, prefix + "_Normal.png")
Image.open(normal_p).convert("RGBA").save(normal_out)

# keep the numbers used, for the record
with open(os.path.join(out_dir, prefix.lower() + "_palette_used.json"), "w",
          encoding="utf-8") as f:
    json.dump({"palette": {k: list(v) for k, v in PALETTE.items()},
               "recipe": {str(k): list(v) for k, v in RECIPE.items()},
               "metallic": {str(k): list(v) for k, v in METALLIC.items()},
               "residual_snap": residual}, f, indent=1)

print("RECOLOURED with", len(PALETTE), "palette colours over", len(RECIPE), "regions")
print("SAVED", albedo_out)
print("SAVED", mg_out_path)
print("SAVED", normal_out)
for rid, (name, _) in sorted(RECIPE.items()):
    m = reg == rid
    if not m.any():
        print("  region %d (%s): NOT PRESENT" % (rid, name))
        continue
    px = new_rgb[m]
    print("  region %d  %-12s %6d px   mean rgb %3d %3d %3d"
          % (rid, name, int(m.sum()), px[:, 0].mean() * 255,
             px[:, 1].mean() * 255, px[:, 2].mean() * 255))
