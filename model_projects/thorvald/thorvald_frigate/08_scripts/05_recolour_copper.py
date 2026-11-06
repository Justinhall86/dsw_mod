"""Recolour the Renegade Frigate's blue accent decals to Thorvald copper.

Keeps every painted highlight/shade (value is remapped, not flattened), so panel
detail inside the decals survives.  Anti-aliased fringe pixels get a partial
blend so no blue halo is left behind.

    python 05_recolour_copper.py [--hue 28.5] [--sat 0.62]
"""
import argparse
import os

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
SRC = os.path.join(PROJ, "01_input", "Renegade_Frigate_Albedo.png")
OUT = os.path.join(PROJ, "04_textures", "Renegade_Frigate_Thorvald_Albedo.png")

# Thorvald palette copper / ember (matches thorvald_vehicles/02_recolour.py)
COPPER = (0xB2, 0x6E, 0x3C)


def hsv_arrays(rgb):
    mx = rgb.max(-1)
    mn = rgb.min(-1)
    d = mx - mn
    sd = np.where(d > 1e-6, d, 1.0)
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    h = np.where(mx == r, (60.0 * ((g - b) / sd)) % 360.0, 0.0)
    h = np.where(mx == g, 60.0 * ((b - r) / sd) + 120.0, h)
    h = np.where(mx == b, 60.0 * ((r - g) / sd) + 240.0, h)
    h = np.where(d > 1e-6, h, 0.0)
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0.0)
    return h, s, mx


def hsv_to_rgb(h, s, v):
    h = np.asarray(h, np.float32)
    s = np.asarray(s, np.float32)
    v = np.asarray(v, np.float32)
    c = v * s
    x = c * (1.0 - np.abs((h / 60.0) % 2.0 - 1.0))
    m = v - c
    i = (h / 60.0).astype(np.int32) % 6
    r = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [c, x, 0, 0, x, c])
    g = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [x, c, c, x, 0, 0])
    b = np.select([i == 0, i == 1, i == 2, i == 3, i == 4, i == 5], [0, 0, x, c, c, x])
    return np.stack([r + m, g + m, b + m], -1)


def dilate(mask, n=1):
    out = mask.copy()
    for _ in range(n):
        m = out.copy()
        m[1:, :] |= out[:-1, :]
        m[:-1, :] |= out[1:, :]
        m[:, 1:] |= out[:, :-1]
        m[:, :-1] |= out[:, 1:]
        out = m
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--hue", type=float, default=28.5)
    ap.add_argument("--sat", type=float, default=0.62)
    ap.add_argument("--val-lo", type=float, default=0.42)
    ap.add_argument("--val-hi", type=float, default=0.86)
    args = ap.parse_args()

    src = Image.open(SRC).convert("RGBA")
    a = np.asarray(src).astype(np.float32) / 255.0
    rgb = a[..., :3]
    h, s, v = hsv_arrays(rgb)

    core = ((h >= 190) & (h < 235) & (s > 0.18) & (v > 0.04))
    fringe = dilate(core, 2) & ~core
    fringe &= (h > 170) & (h < 260)          # only blue-ish neighbours
    fringe &= s > 0.06

    weight = np.zeros(core.shape, np.float32)
    weight[core] = 1.0
    weight[fringe] = 0.65

    lo, hi = np.percentile(v[core], [2, 98]) if core.any() else (0.0, 1.0)
    vn = np.clip((v - lo) / max(hi - lo, 1e-6), 0.0, 1.0)
    nv = args.val_lo + (args.val_hi - args.val_lo) * vn

    tint = hsv_to_rgb(np.full(h.shape, args.hue, np.float32),
                      np.full(h.shape, args.sat, np.float32),
                      nv.astype(np.float32))
    out = rgb * (1.0 - weight[..., None]) + tint * weight[..., None]

    res = np.concatenate([np.clip(out, 0, 1), a[..., 3:]], -1)
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    Image.fromarray((res * 255 + 0.5).astype(np.uint8), "RGBA").save(OUT)

    # side-by-side crop of the accent areas for review
    crop = Image.new("RGB", (512 * 2, 512))
    crop.paste(src.convert("RGB"), (0, 0))
    crop.paste(Image.fromarray(res[..., :3].repeat(0, -1) if False else
                               (np.clip(out, 0, 1) * 255).astype(np.uint8)), (512, 0))
    crop.save(os.path.join(PROJ, "02_progress_photos", "copper_texture_compare.png"))

    print("core px", int(core.sum()), "fringe px", int(fringe.sum()))
    print("WROTE", OUT)
    ys, xs = np.nonzero(core)
    print("accent bbox uv", xs.min(), xs.max(), ys.min(), ys.max())
    cols = out[core]
    print("mean recoloured rgb", [round(float(c), 3) for c in cols.mean(0)])


if __name__ == "__main__":
    main()
