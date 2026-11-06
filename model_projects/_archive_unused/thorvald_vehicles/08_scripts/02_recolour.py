"""Thorvald recolour of the four vehicle/ship albedos.

    python 02_recolour.py <unit> [<unit> ...]        # fighter drone claw carryall
    python 02_recolour.py all

Same method as commando_house / ginaz: replace hue and saturation, KEEP the
painted value (so every crease, panel line and highlight survives), then either
compress the selection's robust value range onto a band around the target
brightness ("compress") or, where the source is already the right material,
scale it.

Two extra moves, both borrowed from commando_house:
  * **island split** - a large coloured region is a panel (rust) but the small
    islands of the same colour are detail, and detail becomes the ember accent.
  * **catch-all metal** - every neutral pixel is forced onto the gunmetal hue,
    so no vanilla grey survives to break the house identity.

Palette = the Thorvald identity already used by thorvald_trooper:
near-black cloth, gunmetal plates, rust cloth, copper metal, ember trim.
"""
import colorsys
import os
import sys

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
MI = os.path.join(os.path.dirname(os.path.dirname(PROJ)), "model_inputs")

PAL = {
    "cloth":    (0x1E, 0x1B, 0x18),
    "gunmetal": (0x32, 0x2E, 0x2A),
    "rust":     (0x70, 0x34, 0x1E),
    "copper":   (0xB2, 0x6E, 0x3C),
    "ember":    (0xE8, 0x70, 0x24),
}

ISLAND_PX_LO = 60        # blue islands smaller than this are anti-alias noise
ISLAND_PX_HI = 600       # ... bigger than this are panels, not accents
GLOW_ISLAND_PX = 400     # white islands under this size are lamps, larger are panels

# (name, hue_lo, hue_hi, sat_lo, sat_hi, val_lo, val_hi, palette key, mode, arg)
# first match wins; a hue range with lo > hi wraps (lo..360 and 0..hi)
RULES = [
    ("glow",    None, None, 0.00, 0.16, 0.90, 1.01, "gunmetal", "compress", (0.24, 0.58)),
    ("lamp",     16,   54, 0.45, 1.01, 0.50, 1.01, "ember",    "compress", (0.58, 0.95)),
    ("brass",    26,   70, 0.18, 0.62, 0.26, 1.01, "copper",   "compress", (0.35, 0.70)),
    ("green",    70,  172, 0.16, 1.01, 0.00, 1.01, "rust",     "compress", (0.20, 0.50)),
    ("blue",    184,  270, 0.16, 1.01, 0.00, 1.01, "rust",     "compress", (0.20, 0.50)),
    ("warm",    330,   18, 0.20, 1.01, 0.00, 1.01, "rust",     "compress", (0.20, 0.50)),
    ("metal",   None, None, 0.00, 1.01, 0.00, 1.01, "gunmetal", "compress", (0.12, 0.62)),
]

UNIT_TEX = {
    "fighter": ["Vehicle/Smuggler/Wraith/Wraith_Albedo.png"],
    "drone": ["Vehicle/Smuggler/DroneS/CombatDrone_Smuggler_Albedo.png"],
    "claw": ["Vehicle/Atreide/Harvester/Harvester_Albedo.png",
             "Vehicle/Atreide/Harvester/Harvester_chenil_Albedo.png"],
    "carryall": ["Vehicle/Atreide/CarryAll/CarryAll_Albedo.png"],
}


def hsv_arrays(rgb):
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    mx = rgb.max(-1)
    mn = rgb.min(-1)
    d = mx - mn
    sd = np.where(d > 1e-6, d, 1.0)
    h = np.zeros_like(mx)
    h = np.where(mx == r, (60.0 * ((g - b) / sd)) % 360.0, h)
    h = np.where(mx == g, 60.0 * ((b - r) / sd) + 120.0, h)
    h = np.where(mx == b, 60.0 * ((r - g) / sd) + 240.0, h)
    h = np.where(d > 1e-6, h, 0.0)
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0.0)
    return h, s, mx


def hue_in(h, lo, hi):
    if lo is None:
        return np.ones_like(h, bool)
    return ((h >= lo) & (h < hi)) if lo <= hi else ((h >= lo) | (h < hi))


def hsv_to_rgb_scalar(h, s, v):
    c = v * s
    x = c * (1.0 - np.abs((h / 60.0) % 2.0 - 1.0))
    m = v - c
    i = (h / 60.0).astype(np.int32) % 6
    r = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [c, x, 0, 0, x, c])
    g = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [x, c, c, x, 0, 0])
    b = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [0, 0, x, c, c, x])
    return np.stack([r + m, g + m, b + m], -1)


def label_components(mask, max_labels=4096):
    """4-connected labelling of a boolean mask, pure numpy/Python (no scipy)."""
    h, w = mask.shape
    labels = np.zeros((h, w), np.int32)
    seen = np.zeros((h, w), bool)
    n = 0
    for start in np.flatnonzero(mask.ravel()):
        if seen.flat[start]:
            continue
        n += 1
        if n > max_labels:
            break
        stack = [int(start)]
        seen.flat[start] = True
        while stack:
            p = stack.pop()
            y, x = divmod(p, w)
            labels.flat[p] = n
            if y and mask[y - 1, x] and not seen[y - 1, x]:
                seen[y - 1, x] = True
                stack.append(p - w)
            if y + 1 < h and mask[y + 1, x] and not seen[y + 1, x]:
                seen[y + 1, x] = True
                stack.append(p + w)
            if x and mask[y, x - 1] and not seen[y, x - 1]:
                seen[y, x - 1] = True
                stack.append(p - 1)
            if x + 1 < w and mask[y, x + 1] and not seen[y, x + 1]:
                seen[y, x + 1] = True
                stack.append(p + 1)
    return labels, n


def paint(out, sel, h, s, v, key, mode, arg):
    """Write the target colour into `sel`, preserving painted value."""
    n = int(sel.sum())
    if not n:
        return 0
    th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in PAL[key]])
    th *= 360.0
    if mode == "scale":
        nv = np.clip(v[sel] * arg, 0.0, 1.0)
    else:
        lo, hi = np.percentile(v[sel], [3, 97])
        vn = np.clip((v[sel] - lo) / max(hi - lo, 1e-6), 0.0, 1.0)
        nv = arg[0] + (arg[1] - arg[0]) * vn
    out[sel] = hsv_to_rgb_scalar(np.full(n, th, np.float32),
                                 np.full(n, ts, np.float32),
                                 nv.astype(np.float32))
    return n


def recolour(path, out_path):
    src = Image.open(path).convert("RGBA")
    a = np.asarray(src).astype(np.float32) / 255.0
    rgb = a[..., :3].copy()
    h, s, v = hsv_arrays(rgb)
    out = rgb.copy()
    done = np.zeros(h.shape, bool)
    stats = {}
    for name, hlo, hhi, slo, shi, vlo, vhi, key, mode, arg in RULES:
        sel = (~done) & hue_in(h, hlo, hhi) & (s >= slo) & (s <= shi) & (v >= vlo) & (v <= vhi)
        if not sel.any():
            continue
        if name == "blue":
            labels, nlab = label_components(sel)
            if nlab:
                sizes = np.bincount(labels.ravel(), minlength=nlab + 1)
                accent = sel & (sizes[labels] >= ISLAND_PX_LO) & (sizes[labels] < ISLAND_PX_HI)
                big = sel & ~accent
                stats["blue_panel"] = paint(out, big, h, s, v, "rust", mode, arg)
                stats["blue_accent"] = paint(out, accent, h, s, v, "ember", "compress", (0.62, 0.96))
                done |= sel
                continue
        if name == "glow":
            labels, nlab = label_components(sel)
            if nlab:
                sizes = np.bincount(labels.ravel(), minlength=nlab + 1)
                lamp = sel & (sizes[labels] < GLOW_ISLAND_PX) & (labels > 0)
                big = sel & ~lamp
                stats["glow_panel"] = paint(out, big, h, s, v, "gunmetal", mode, arg)
                stats["glow_lamp"] = paint(out, lamp, h, s, v, "ember", "compress", (0.65, 1.00))
                done |= sel
                continue
        stats[name] = paint(out, sel, h, s, v, key, mode, arg)
        done |= sel
    res = np.concatenate([out, a[..., 3:]], -1)
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(out_path)
    return stats


if __name__ == "__main__":
    which = sys.argv[1:] or ["all"]
    if "all" in which:
        which = list(UNIT_TEX)
    for unit in which:
        for rel in UNIT_TEX[unit]:
            src = os.path.join(MI, rel.replace("/", os.sep))
            dst = os.path.join(PROJ, "04_textures", unit, os.path.basename(rel))
            st = recolour(src, dst)
            print("RECOLOUR %-9s %-34s -> %s" % (unit, os.path.basename(rel), st))
