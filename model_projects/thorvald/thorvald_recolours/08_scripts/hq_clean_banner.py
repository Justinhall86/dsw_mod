"""Paint the Atreides banner out of the HQ tower-wall texture -> 04_textures/hq_outpost/clean/<same names>.

    python hq_clean_banner.py

The banner cloth is geometry (deleted at render time), but the same pennant shape and emblem are also painted into the wall area of
the atlas (albedo, normal, MetallicGlossAO and emissive), found by projecting the banner quads onto the wall (hq_banner_uv.py).
Inside the pennant mask each row is refilled by a linear blend between the plain wall just left and just right of it, which matches
the smooth wall: no outline in the normal map, no emblem in the colour.
"""
import os
import sys

import numpy as np
from PIL import Image, ImageDraw

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from assets import ASSETS, PROJ, input_dir  # noqa: E402

A = ASSETS["hq_outpost"]
# pennant on the 1024 atlas: under the trim band, flat top, pointed bottom; 3 px margin for the bevel in the normal map
POLY = [(130, 791), (204, 791), (204, 897), (167, 918), (130, 897)]
X0, X1 = 127, 207                   # wall samples left / right of the pennant
OUT = os.path.join(PROJ, "04_textures", "hq_outpost", "clean")


def clean(path, dst):
    im = Image.open(path).convert("RGBA")
    W, H = im.size
    s = W / 1024.0
    mask = Image.new("L", im.size, 0)
    ImageDraw.Draw(mask).polygon([(x * s, y * s) for x, y in POLY], fill=255)
    m = np.asarray(mask) > 0
    a = np.asarray(im).astype(np.float32)
    x0, x1 = int(X0 * s), int(X1 * s)
    t = (np.arange(W) - x0) / float(x1 - x0)
    for y in np.nonzero(m.any(1))[0]:
        row = m[y]
        left = a[y, max(x0 - 2, 0):x0 + 1].mean(0)      # small average: no single noisy pixel
        right = a[y, x1:x1 + 3].mean(0)
        a[y, row] = left[None] * (1 - t[row, None]) + right[None] * t[row, None]
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    Image.fromarray(np.clip(a + 0.5, 0, 255).astype(np.uint8), "RGBA").save(dst)
    return int(m.sum())


for key in ("source", "before", "normal", "mgao", "emissive"):
    n = clean(os.path.join(input_dir("hq_outpost"), A[key]), os.path.join(OUT, A[key]))
    print("CLEANED", A[key], n, "px")
