"""Step 04 - classify every albedo pixel into a material region.

    python 04_classify_regions.py -- <albedo.png> <metallic_gloss_ao.png> \
        <out_dir> [--tint <tint_mask.npy>] [--trim-max 420]

Region ids
  0  outside / unknown
  1  skin              (face, hands)            -> keep
  2  dark fabric       (scarf, bodysuit)         -> dark accent
  3  leather / straps  (brown vest, belt)       -> leather
  4  accent plate      (the game's tint mask)   -> hero colour
  5  large armour      (forearm / knee pads)    -> armour colour
  6  small trim        (fan vents, buckles)     -> metal trim

WHY COLOUR AND NOT UV ISLAND: a UV-space rasteriser only covers part of the
atlas, so an island-based classifier leaves large unclassified areas.  This
classifies the whole texture by colour and then floods the leftovers, so the
result has ZERO unknown pixels.

WHY SIZE MATTERS: the big cream/steel plates and the small bright trim are
the SAME colour in the base texture.  They are separated by CONNECTED
COMPONENT SIZE - a large blob is armour, a small one is trim.  Gold must
stay a thin accent, otherwise the model turns into a gold statue.

Outputs
  <out_dir>/region_ids.npy     uint8 region map
  <out_dir>/region_preview.png colour-coded preview
"""
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_core import PRESETS, classify_regions, script_args

REGION_COLORS = {
    0: (0, 0, 0),
    1: (240, 200, 170),     # skin
    2: (60, 60, 90),        # dark fabric
    3: (140, 90, 60),       # leather
    4: (200, 40, 40),       # accent plate
    5: (40, 160, 220),      # armour plate
    6: (250, 220, 40),      # small trim
}

argv = script_args()
if len(argv) < 3:
    raise SystemExit("usage: 04_classify_regions.py -- <albedo.png> "
                     "<metallic_gloss_ao.png> <out_dir> [--tint mask.npy] "
                     "[--trim-max 420] [--preset humanoid]")

albedo_path = os.path.abspath(argv[0])
mg_path = os.path.abspath(argv[1])
out_dir = os.path.abspath(argv[2])
tint = None
if "--tint" in argv:
    tint = np.load(argv[argv.index("--tint") + 1])
trim_max = 420
if "--trim-max" in argv:
    trim_max = int(argv[argv.index("--trim-max") + 1])
preset = "humanoid"
if "--preset" in argv:
    preset = argv[argv.index("--preset") + 1]
if preset not in PRESETS:
    raise SystemExit("unknown preset %r - choose from: %s"
                     % (preset, ", ".join(sorted(PRESETS))))
os.makedirs(out_dir, exist_ok=True)

albedo = np.array(Image.open(albedo_path).convert("RGBA")).astype(np.float32)
mg = np.array(Image.open(mg_path).convert("RGBA")).astype(np.float32)

reg = classify_regions(albedo, mg, tint_mask=tint, trim_max_px=trim_max,
                       preset=preset)

np.save(os.path.join(out_dir, "region_ids.npy"), reg)

preview = np.zeros(albedo.shape[:2] + (3,), dtype=np.uint8)
for rid, col in REGION_COLORS.items():
    preview[reg == rid] = col
Image.fromarray(preview, "RGB").save(os.path.join(out_dir, "region_preview.png"))

print("CLASSIFIED %s" % albedo_path)
print("  preset: %s - %s" % (preset, PRESETS[preset]["description"]))
for rid in sorted(REGION_COLORS):
    n = int((reg == rid).sum())
    pct = 100.0 * n / reg.size
    name = {0: "unknown", 1: "skin", 2: "dark fabric", 3: "leather",
            4: "accent plate", 5: "armour plate", 6: "small trim"}[rid]
    print("  region %d  %-14s %7d px  %5.1f%%" % (rid, name, n, pct))
print("SAVED", os.path.join(out_dir, "region_ids.npy"))
