"""House Ginaz recolour of every texture a variant uses, PER BODY REGION (from 08_uvdump.py).

    python 09_ginaz_recolour.py <uv_regions.json> <out_dir>

Same method as commando_house: replace hue + saturation, KEEP the painted value (shading), compress each class's
value range onto a band around the target brightness.  Region masks come from the faces' UV polygons, so parts that
share a colour but not a role (mantle vs boots) get different targets.  Palette = model_projects/commando_house.
"""
import colorsys
import json
import os
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HAIR_BAND = tuple(float(x) for x in os.environ.get("GINAZ_HAIR_BAND", "0.07,0.22").split(","))   # Captain: black; Master: 0.06,0.52 (silver-streaked)

PAL = {  # House Ginaz, sampled from house_ginaz_roster.jpg (commando_house/04_textures/house_palette.json)
    "plum": (104, 54, 66),
    "wine": (92, 32, 52),          # deeper coat colour of ginaz_swordmaster_purple.jpg
    "wine_dark": (52, 20, 32),
    "plum_plate": (72, 42, 52),
    "plum_dark": (42, 26, 33),
    "gold": (196, 154, 78),
    "leather": (70, 40, 34),
    "hair": (34, 27, 25),
}

# region -> rules, first match wins: (hue range deg | None, sat range, val range) -> (palette key, value band)
RULES = {
    "upper": [((180, 260), (0.25, 1), (0.2, 1), "gold", (0.55, 0.85)),       # blue scarf remnants / accents
              ((0, 45), (0.22, 1), (0.25, 1), "wine", (0.17, 0.40)),         # terracotta mantle -> wine coat
              ((330, 360), (0.22, 1), (0.25, 1), "wine", (0.17, 0.40)),
              (None, (0, 0.22), (0, 1), "plum_dark", (0.10, 0.26))],          # grey sleeves / undersuit
    "belt": [((180, 260), (0.25, 1), (0.2, 1), "gold", (0.55, 0.85)),
             ((0, 50), (0.2, 1), (0, 1), "leather", (0.14, 0.36)),
             (None, (0, 0.2), (0, 1), "plum_dark", (0.10, 0.26))],
    "legs": [((180, 260), (0.25, 1), (0.2, 1), "gold", (0.55, 0.85)),         # blue boot cuffs -> gold bands
             ((0, 50), (0.2, 1), (0, 1), "leather", (0.12, 0.32)),            # boots: dark leather
             (None, (0, 0.2), (0, 1), "plum_dark", (0.10, 0.26))],            # trousers
    "hands": [((0, 50), (0.2, 1), (0, 1), "plum_plate", (0.14, 0.34)),         # gloves -> plum (reference)
              ((180, 260), (0.25, 1), (0.2, 1), "gold", (0.55, 0.85)),
              (None, (0, 0.2), (0, 1), "plum_dark", (0.10, 0.26))],
    "tunic": [((20, 55), (0.22, 1), (0.45, 1), "gold", (0.55, 0.85)),         # tan trim stripes -> gold
              (None, (0, 1), (0, 1), "wine_dark", (0.05, 0.16))],            # tunic body -> deep wine (sheen lifts it)
    "coat": [((40, 70), (0.5, 1), (0.75, 1), "gold", (0.6, 0.9)),             # bright yellow studs only -> gold
             ((80, 200), (0.2, 1), (0.82, 1), "gold", (0.55, 0.85)),          # bright mint stripe only -> gold
             ((80, 200), (0.2, 1), (0, 1), "wine", (0.16, 0.38)),             # green panels -> wine
             (None, (0, 1), (0, 1), "plum_dark", (0.08, 0.22))],              # lining
    "cape": [((180, 260), (0.2, 1), (0, 1), "wine", (0.14, 0.40)),
             (None, (0, 1), (0, 1), "wine_dark", (0.08, 0.26))],
    "head": [(None, (0, 0.38), (0.42, 1), "hair", HAIR_BAND),
             (None, (0, 0.30), (0.30, 0.42), "hair", (0.05, 0.18))],  # greyer hair at the nape            # white hair (+ tinted crown), beard -> black
}


def hsv_arrays(rgb):
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    mx = rgb.max(-1)
    mn = rgb.min(-1)
    d = mx - mn
    h = np.zeros_like(mx)
    m = d > 1e-6
    sd = np.where(m, d, 1)
    h = np.where(mx == r, (60 * ((g - b) / sd)) % 360, h)
    h = np.where(mx == g, 60 * ((b - r) / sd) + 120, h)
    h = np.where(mx == b, 60 * ((r - g) / sd) + 240, h)
    h = np.where(m, h, 0)
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0)
    return h, s, mx


def region_mask(polys, size):
    w, h = size
    im = Image.new("L", size, 0)
    dr = ImageDraw.Draw(im)
    for poly in polys:
        pts = [(u % 1.0 * w, (1 - v % 1.0) * h) for u, v in poly]
        dr.polygon(pts, fill=255)
    im = im.filter(ImageFilter.MaxFilter(5))  # cover UV-seam bleed
    return np.asarray(im) > 0


def recolour(path, regions, out_path):
    src = Image.open(path).convert("RGBA")
    a = np.asarray(src).astype(np.float32) / 255.0
    rgb = a[..., :3].copy()
    h, s, v = hsv_arrays(rgb)
    done = np.zeros(h.shape, bool)
    out = rgb.copy()
    stats = {}
    for reg, polys in regions.items():
        if reg not in RULES:
            continue
        mask = region_mask(polys, src.size) & ~done
        for hr, sr, vr, key, band in RULES[reg]:
            sel = mask & (s >= sr[0]) & (s <= sr[1]) & (v >= vr[0]) & (v <= vr[1])
            if hr is not None:
                sel &= (h >= hr[0]) & (h < hr[1])
            if not sel.any():
                continue
            lo, hi = np.percentile(v[sel], [3, 97])
            vn = np.clip((v[sel] - lo) / max(hi - lo, 1e-6), 0, 1)
            tv = band[0] + (band[1] - band[0]) * vn
            th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in PAL[key]])
            col = np.array([colorsys.hsv_to_rgb(th, ts, x) for x in tv], dtype=np.float32)
            out[sel] = col
            mask &= ~sel
            done |= sel
            stats["%s/%s" % (reg, key)] = int(sel.sum())
    res = np.concatenate([out, a[..., 3:]], -1)
    Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(out_path)
    print("RECOLOUR", os.path.basename(path), "->", os.path.basename(out_path), stats)


if __name__ == "__main__":
    data = json.load(open(sys.argv[1]))
    out_dir = os.path.abspath(sys.argv[2])
    os.makedirs(out_dir, exist_ok=True)
    mapping = {}
    for tex, regions in data.items():
        stem = os.path.splitext(os.path.basename(tex))[0]
        dst = os.path.join(out_dir, stem.replace("_Albedo", "") + "_Ginaz_Albedo.png")
        recolour(tex, regions, dst)
        mapping[tex] = dst
    json.dump(mapping, open(os.path.join(out_dir, "ginaz_texture_map.json"), "w"), indent=1)
