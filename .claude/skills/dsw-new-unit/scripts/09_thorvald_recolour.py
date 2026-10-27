"""House Thorvald recolour of every texture a variant uses, PER BODY REGION (from 08_uvdump.py).

    python 09_ginaz_recolour.py <uv_regions.json> <out_dir>

Same method as commando_house: replace hue + saturation, KEEP the painted value (shading), compress each class's
value range onto a band around the target brightness.  Region masks come from the faces' UV polygons, so parts that
share a colour but not a role (mantle vs boots) get different targets.  Palette = house_thorvald/art_direction.md.
"""
import colorsys
import json
import os
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

PAL = {  # House Thorvald, read from house_thorvald/images/art_combat_units_sheet.jpg
    "black": (30, 27, 24),         # lacquered black cloth / undersuit
    "gunmetal": (50, 46, 42),      # armour plates
    "rust": (112, 52, 30),         # skirt, sleeve wraps, belt leather
    "rust_dark": (84, 40, 26),
    "copper": (178, 110, 60),      # emblem, studs, buckles
    "ember": (232, 112, 36),       # hot trim: stripes, pinstripe
    "skin_dark": (44, 34, 30),     # face under the mask
    "skin_shade": (112, 78, 62),   # the eye band in the hood's shadow
}

# region -> rules, first match wins: (hue range deg | None, sat range, val range) -> (palette key | "keep", value band)
RULES = {
    "upper": [((180, 260), (0.12, 1), (0.2, 1), "gunmetal", (0.10, 0.24)),    # blue-grey shoulder pads -> gunmetal
              ((0, 45), (0.40, 1), (0.25, 1), "rust_dark", (0.22, 0.45)),    # true brown leather straps -> rust (not speckle)
              ((330, 360), (0.40, 1), (0.25, 1), "rust_dark", (0.22, 0.45)),
              (None, (0, 0.2), (0.45, 1), "gunmetal", (0.05, 0.15)),          # white/cream plates -> dark gunmetal (the big back plate read light grey)
              (None, (0, 1), (0, 1), "black", (0.06, 0.16))],                 # suit, scarf
    "belt": [((0, 50), (0.2, 1), (0, 1), "rust", (0.22, 0.48)),               # belt leather -> rust
             (None, (0, 0.2), (0.45, 1), "gunmetal", (0.10, 0.24)),            # buckle plates
             (None, (0, 1), (0, 1), "black", (0.06, 0.16))],
    "legs": [((0, 50), (0.2, 1), (0, 1), "black", (0.05, 0.14)),              # boots -> black leather
             (None, (0, 0.2), (0.45, 1), "gunmetal", (0.06, 0.15)),            # hip + boot plates
             (None, (0, 1), (0, 1), "black", (0.06, 0.16))],                  # trousers
    "hands": [(None, (0, 0.2), (0.55, 1), "gunmetal", (0.10, 0.24)),            # white glove cuffs
              (None, (0, 1), (0, 1), "black", (0.06, 0.18))],                  # gloves
    "emblem": [((30, 70), (0.4, 1), (0.4, 1), "copper", (0.55, 0.80)),         # gear + star texel (Duncan gold) -> copper
               (None, (0, 1), (0, 1), "black", (0.05, 0.12))],                 # dark centre texel (Commando black)
    "skirt": [((35, 70), (0.4, 1), (0.4, 1), "copper", (0.5, 0.8)),            # Duncan's gold buckle -> copper
              ((80, 200), (0.06, 1), (0.3, 1), "rust", (0.18, 0.36)),         # pale green sash panel + re-pointed tabard texel -> rust cloth
              ((0, 35), (0.3, 1), (0, 1), "rust", (0.22, 0.46)),              # brown belt -> rust leather
              (None, (0, 0.2), (0.5, 1), "gunmetal", (0.10, 0.24)),           # silver trim
              (None, (0, 1), (0, 0.5), "rust_dark", (0.20, 0.40)),            # near-neutral dark tabard cloth -> dark rust skirt
              (None, (0, 1), (0, 1), "black", (0.06, 0.16))],
    "arm_up": [((0, 60), (0.2, 1), (0, 1), "gunmetal", (0.10, 0.26)),         # Mercenary terracotta pauldrons -> gunmetal plate
               ((330, 360), (0.2, 1), (0, 1), "gunmetal", (0.10, 0.26)),
               ((180, 260), (0.2, 1), (0, 1), "gunmetal", (0.10, 0.24)),      # blue scarf lining -> dark
               (None, (0, 0.2), (0.55, 1), "gunmetal", (0.10, 0.24)),         # white/silver studs and plates
               (None, (0, 1), (0, 1), "black", (0.06, 0.16))],                # grey sleeve cloth
    "arm_low": [((0, 60), (0.2, 1), (0, 1), "rust", (0.20, 0.42)),            # forearm guards -> rust wraps (reference sleeves)
                ((330, 360), (0.2, 1), (0, 1), "rust", (0.20, 0.42)),
                ((180, 260), (0.2, 1), (0, 1), "copper", (0.42, 0.70)),
                (None, (0, 0.2), (0.55, 1), "gunmetal", (0.10, 0.24)),        # elbow/wrist studs
                (None, (0, 1), (0, 1), "black", (0.06, 0.16))],               # grey sleeve cloth
    # Gurney (T5): grey plates + green bands + gold gems + brown straps over a dark suit
    "g_upper": [((35, 70), (0.35, 1), (0.45, 1), "gunmetal", (0.16, 0.34)),   # gold insignia plates -> raised gunmetal (copper is kept for the chest emblem)
                ((70, 200), (0.15, 1), (0, 1), "gunmetal", (0.07, 0.17)),     # green bands -> dark gunmetal (a step under the plates)
                ((0, 35), (0.30, 1), (0.15, 1), "rust_dark", (0.20, 0.42)),   # brown straps -> rust leather
                ((330, 360), (0.30, 1), (0.15, 1), "rust_dark", (0.20, 0.42)),
                (None, (0, 0.25), (0.40, 1), "gunmetal", (0.10, 0.27)),       # light grey plates -> gunmetal (clearly lighter than the suit)
                (None, (0, 1), (0, 1), "black", (0.035, 0.10))],               # undersuit
    "g_collar": [((35, 70), (0.35, 1), (0.45, 1), "gunmetal", (0.16, 0.34)),
                 (None, (0, 1), (0, 1), "gunmetal", (0.09, 0.22))],
    "g_arm_up": [((35, 70), (0.35, 1), (0.45, 1), "gunmetal", (0.16, 0.34)),
                 ((70, 200), (0.15, 1), (0, 1), "gunmetal", (0.07, 0.17)),
                 (None, (0, 0.25), (0.40, 1), "gunmetal", (0.10, 0.27)),
                 (None, (0, 1), (0, 1), "rust", (0.16, 0.34))],                # sleeve cloth -> the rust upper-arm wrap of the reference
    "g_arm_low": [((35, 70), (0.35, 1), (0.45, 1), "gunmetal", (0.16, 0.34)),
                  ((70, 200), (0.15, 1), (0, 1), "gunmetal", (0.07, 0.17)),
                  ((0, 35), (0.30, 1), (0.15, 1), "rust_dark", (0.20, 0.42)),
                  (None, (0, 0.25), (0.40, 1), "gunmetal", (0.10, 0.26)),     # bracers
                  (None, (0, 1), (0, 1), "black", (0.05, 0.14))],
    "g_head": [(None, (0, 0.2), (0.82, 1), "keep", (0, 1)),                   # eye whites
               ((0, 50), (0.12, 1), (0.25, 1), "skin_shade", (0.22, 0.42)),     # skin seen through the slit: in shadow
               (None, (0, 1), (0, 1), "black", (0.04, 0.12))],                 # brows, lashes
    "hat": [((30, 70), (0.4, 1), (0.4, 1), "copper", (0.55, 0.80)),            # pinstripe texel (Duncan gold, same as the emblem) -> copper
            (None, (0, 1), (0, 1), "black", (0.05, 0.12))],                    # cone texel (Commando black)
    "head": [(None, (0, 0.2), (0.82, 1), "keep", (0, 1)),                      # eye whites stay
             ((0, 11), (0.35, 1), (0.3, 1), "black", (0.05, 0.14)),           # red half-mask cloth -> black cloth (incl. pink edge pixels)
             ((340, 360), (0.35, 1), (0.3, 1), "black", (0.05, 0.14)),
             ((180, 270), (0.25, 1), (0.2, 1), "skin_dark", (0.10, 0.22)),    # glowing blue irises -> dark
             (None, (0, 0.28), (0, 1), "black", (0.05, 0.14))],               # hair and dark trim; skin is left as it is
}


MIN_SIZE = 1024


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
    if src.size[0] < MIN_SIZE:   # classify on a smooth upscale: class edges follow the painted shapes instead of 512 px stair-steps
        src = src.resize((MIN_SIZE, MIN_SIZE * src.size[1] // src.size[0]), Image.LANCZOS)
    a = np.asarray(src).astype(np.float32) / 255.0
    rgb = a[..., :3].copy()
    h, s, v = hsv_arrays(rgb)
    done = np.zeros(h.shape, bool)
    out = rgb.copy()
    stats = {}
    edge_regions = {"g_upper", "g_arm_low", "g_arm_up"}
    platem = np.zeros(h.shape, bool)
    cls = np.zeros(h.shape, np.int32)
    cid = 1
    suitm = np.zeros(h.shape, bool)
    for reg, polys in sorted(regions.items(), key=lambda kv: {"hat": 0, "emblem": 0, "skirt": 1}.get(kv[0], 2)):  # the hat's flat texels claim their pixels first
        if reg not in RULES:
            continue
        mask = region_mask(polys, src.size) & ~done
        for hr, sr, vr, key, band in RULES[reg]:
            sel = mask & (s >= sr[0]) & (s <= sr[1]) & (v >= vr[0]) & (v <= vr[1])
            if hr is not None:
                sel &= (h >= hr[0]) & (h < hr[1])
            if not sel.any():
                continue
            if key == "keep":
                mask &= ~sel
                done |= sel
                continue
            lo, hi = np.percentile(v[sel], [3, 97])
            vn = np.clip((v[sel] - lo) / max(hi - lo, 1e-6), 0, 1)
            tv = band[0] + (band[1] - band[0]) * vn
            th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in PAL[key]])
            col = np.array([colorsys.hsv_to_rgb(th, ts, x) for x in tv], dtype=np.float32)
            out[sel] = col
            cls[sel] = cid
            cid += 1
            if reg in edge_regions:
                if key == "gunmetal":
                    platem |= sel
                elif key == "black":
                    suitm |= sel
            mask &= ~sel
            done |= sel
            stats["%s/%s" % (reg, key)] = int(sel.sum())
    if platem.any() and suitm.any():   # copper edge where a gunmetal plate meets the black suit (only inside the given regions)
        px_w = max(1, src.size[0] // 1000)
        op = 3                     # opening: painted crevice lines inside a plate are thin and do not count as suit
        sm = Image.fromarray((suitm * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(op)).filter(ImageFilter.MaxFilter(op))
        pm = Image.fromarray((platem * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(op)).filter(ImageFilter.MaxFilter(op))
        platem = np.asarray(pm) > 0
        suit_d = np.asarray(sm.filter(ImageFilter.MaxFilter(2 * px_w + 1))) > 0
        edge = platem & suit_d
        ev = v[edge]
        tv = 0.24 + 0.18 * np.clip((ev - ev.min()) / max(np.ptp(ev), 1e-6), 0, 1) if edge.any() else ev
        th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in PAL["copper"]])
        if edge.any():
            out[edge] = np.array([colorsys.hsv_to_rgb(th, ts * 0.9, x) for x in tv], dtype=np.float32)
            stats["copper_edge"] = int(edge.sum())
    # anti-alias: where the colour class changes, use a softened colour (only along those boundaries)
    bd = np.zeros(h.shape, bool)
    for dy, dx in ((0, 1), (1, 0)):
        d = cls != np.roll(np.roll(cls, dy, 0), dx, 1)
        bd |= d | np.roll(np.roll(d, -dy, 0), -dx, 1)
    bd &= cls > 0
    soft = np.asarray(Image.fromarray((np.clip(out, 0, 1) * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(1.1))).astype(np.float32) / 255.0
    out[bd] = soft[bd]
    stats["aa_px"] = int(bd.sum())
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
        dst = os.path.join(out_dir, stem.replace("_Albedo", "") + "_Thorvald_Albedo.png")
        recolour(tex, regions, dst)
        mapping[tex] = dst
    json.dump(mapping, open(os.path.join(out_dir, "thorvald_texture_map.json"), "w"), indent=1)
