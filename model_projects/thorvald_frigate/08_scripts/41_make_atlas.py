"""Build the Thorvald Frigate texture atlas (albedo, MetallicGlossAO, normal) from the donor textures.

    python 41_make_atlas.py            (needs 04_textures/_geo.npz from 40_dump_geo.py)

2x2 atlas of 512 px cells (1024^2), cell = (col, row from the top):
    0 Renegade hull/nozzles (0,0)   1 Wraith drum (1,0)   2 Wraith dome (0,1)   3 Space Shuttle stack (1,1)

Palette from the concept sheet: charcoal hull, copper trim/drums, oxblood stripes, weathered bone plate.
Stripes and plates are placed in 3D, not per UV island: each cell is first "baked" with the 3D position and
normal of every texel (barycentric over the UV triangles), so a band at a given length along the ship is a
clean band whatever the low-poly face layout is.  Only texels covered by geometry get position rules.
"""
import os

import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
VEH = os.path.join(os.path.dirname(os.path.dirname(PROJ)), "model_inputs", "Vehicle")
TEX = os.path.join(PROJ, "04_textures")
H = 512

COPPER = np.array([0.70, 0.40, 0.20])
BONE = np.array([0.66, 0.60, 0.50])
OX = np.array([0.23, 0.075, 0.075])
RUST = np.array([0.44, 0.20, 0.10])
CELLS = {0: (0, 0), 1: (1, 0), 2: (0, 1), 3: (1, 1)}


# ---------------------------------------------------------------- helpers
def rgb2hsv(c):
    r, g, b = c[..., 0], c[..., 1], c[..., 2]
    mx, mn = c.max(-1), c.min(-1)
    d = mx - mn
    h = np.zeros_like(mx)
    nz = d > 1e-6
    rr = nz & (mx == r)
    gg = nz & (mx == g) & ~rr
    bb = nz & ~rr & ~gg
    h[rr] = ((g - b)[rr] / d[rr]) % 6
    h[gg] = (b - r)[gg] / d[gg] + 2
    h[bb] = (r - g)[bb] / d[bb] + 4
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0)
    return h * 60.0, s, mx


def hsv2rgb(h, s, v):
    h = (h % 360.0) / 60.0
    i = np.floor(h).astype(int) % 6
    f = h - np.floor(h)
    p, q, t = v * (1 - s), v * (1 - s * f), v * (1 - s * (1 - f))
    r = np.choose(i, [v, q, p, p, t, v])
    g = np.choose(i, [t, v, v, q, p, p])
    b = np.choose(i, [p, p, t, v, v, q])
    return np.stack([r, g, b], -1)


def lum(c):
    return c @ np.array([0.2126, 0.7152, 0.0722])


def smooth(a, lo, hi):
    t = np.clip((a - lo) / (hi - lo), 0, 1)
    return t * t * (3 - 2 * t)


def fbm(seed):
    rng = np.random.default_rng(seed)
    tot, wsum = np.zeros((H, H)), 0.0
    for n, w in ((5, 1.0), (10, 0.55), (20, 0.3), (40, 0.18), (80, 0.1)):
        a = Image.fromarray((rng.random((n, n)) * 255).astype(np.uint8))
        tot += w * np.asarray(a.resize((H, H), Image.BICUBIC), np.float64) / 255.0
        wsum += w
    t = tot / wsum
    return (t - t.min()) / (t.max() - t.min())


def blur(a, r):
    im = Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8))
    return np.asarray(im.filter(ImageFilter.GaussianBlur(r)), np.float64) / 255.0


def load(rel, size=H):
    im = Image.open(os.path.join(VEH, rel)).convert("RGBA")
    if im.size != (size, size):
        im = im.resize((size, size), Image.LANCZOS)
    return np.asarray(im, np.float64) / 255.0


# ---------------------------------------------------------------- bake 3D position per texel
def bake(g, cell):
    P = np.zeros((H, H, 3), np.float32)
    N = np.zeros((H, H, 3), np.float32)
    cov = np.zeros((H, H), bool)
    for i in np.where(g["cell"] == cell)[0]:
        uv = g["uv"][i].astype(np.float64).copy()
        uv[:, 0] -= np.floor(uv[:, 0].min() + 1e-4)          # tiled (u > 1) triangles wrap into 0..1
        uv[:, 1] -= np.floor(uv[:, 1].min() + 1e-4)
        xs, ys = uv[:, 0] * H, (1 - uv[:, 1]) * H
        x0, x1 = int(max(0, np.floor(xs.min() - 1))), int(min(H - 1, np.ceil(xs.max() + 1)))
        y0, y1 = int(max(0, np.floor(ys.min() - 1))), int(min(H - 1, np.ceil(ys.max() + 1)))
        den = (ys[1] - ys[2]) * (xs[0] - xs[2]) + (xs[2] - xs[1]) * (ys[0] - ys[2])
        if abs(den) < 1e-9:
            continue
        gx, gy = np.meshgrid(np.arange(x0, x1 + 1) + 0.5, np.arange(y0, y1 + 1) + 0.5)
        w0 = ((ys[1] - ys[2]) * (gx - xs[2]) + (xs[2] - xs[1]) * (gy - ys[2])) / den
        w1 = ((ys[2] - ys[0]) * (gx - xs[2]) + (xs[0] - xs[2]) * (gy - ys[2])) / den
        w2 = 1 - w0 - w1
        ins = (w0 >= -0.03) & (w1 >= -0.03) & (w2 >= -0.03)
        p = g["pos"][i]
        pos = w0[..., None] * p[0] + w1[..., None] * p[1] + w2[..., None] * p[2]
        sl = (slice(y0, y1 + 1), slice(x0, x1 + 1))
        P[sl][ins] = pos[ins]
        N[sl][ins] = g["nrm"][i]
        cov[sl] |= ins
    return P, N, cov


# ---------------------------------------------------------------- per-cell recolour
def charcoal(L):
    t = np.clip((L - 0.10) / 0.75, 0, 1) ** 1.15
    return (0.095 + 0.105 * t)[..., None] * np.array([0.96, 0.97, 1.04])


def opened(mask, k):
    """Morphological opening: drops copper features thinner than ~k px (invisible at RTS zoom)."""
    im = Image.fromarray((np.clip(mask, 0, 1) * 255).astype(np.uint8))
    im = im.filter(ImageFilter.MinFilter(k)).filter(ImageFilter.MaxFilter(k))
    return np.asarray(im, np.float64) / 255.0


def edge_trim(L, cov):
    """Bevel highlights (brighter than their blurred surroundings) become copper edge trim."""
    return smooth(L - blur(L, 2.2), 0.026, 0.065) * 0.85 * (cov | True)


def recolour_hull(alb, P, N, cov, ctx, shuttle=False):
    rgb = alb[..., :3]
    L = lum(rgb)
    h, s, v = rgb2hsv(rgb)
    cu = ((h > 8) & (h < 50) & (s > 0.30) & (v > 0.30)).astype(np.float64)   # existing copper accents
    out = charcoal(L)
    cls = {"copper": np.zeros((H, H)), "bone": np.zeros((H, H)), "ox": np.zeros((H, H))}

    trim = opened(cu, 5)                       # only the bold copper accents; no hairline edge trim
    out = out * (1 - trim[..., None]) + (COPPER * (0.50 + 0.65 * L)[..., None]) * trim[..., None]
    cls["copper"] = trim.copy()
    wn = fbm(11)

    if not shuttle:
        tx = (P[..., 0] - ctx["hx0"]) / (ctx["hx1"] - ctx["hx0"])
        d = 1 - tx                                              # fraction back from the nose (+X)
        band = np.zeros((H, H))
        for lo, hi in ((0.115, 0.150), (0.215, 0.245)):
            band = np.maximum(band, smooth(d, lo - 0.004, lo + 0.004) * (1 - smooth(d, hi - 0.004, hi + 0.004)))
        band = band * cov * (np.abs(P[..., 1]) < 1.6)
        ox = band[..., None]
        out = out * (1 - ox) + (OX * (0.70 + 1.15 * L)[..., None]) * ox
        cls["ox"] = band
        strap = np.zeros((H, H))
        for lo, hi in ((0.300, 0.328), (0.660, 0.688)):      # bold copper straps (readable zoomed out)
            strap = np.maximum(strap, smooth(d, lo - 0.004, lo + 0.004) * (1 - smooth(d, hi - 0.004, hi + 0.004)))
        strap = strap * cov * (np.abs(P[..., 1]) < 1.6) * (1 - band)
        out = out * (1 - strap[..., None]) + (np.array([0.62, 0.34, 0.17]) * (0.75 + 0.45 * L)[..., None]) * strap[..., None]
        cls["copper"] = np.maximum(cls["copper"], strap)
        plate = (cov & (N[..., 2] > 0.8) & (L > 0.45) & (tx > 0.06) & (tx < 0.52)).astype(np.float64)
    else:
        plate = (cov & (N[..., 2] > 0.85) & (P[..., 2] > ctx["sz1"] - 0.30) & (L > 0.40)).astype(np.float64)
    # polished metal + copper trim: no bone plates, no rust/weathering
    return np.clip(out, 0, 1), cls


def recolour_copper(alb, P, N, cov, ctx, dark_body=True):
    """Dome (dark_body False): polished copper everywhere. Drum (True): dark gunmetal body, copper only on the
    donor's tan/brown trim rings and glow strips."""
    rgb = alb[..., :3]
    L = lum(rgb)
    h, s, v = rgb2hsv(rgb)
    glow = (h > 165) & (h < 275) & (s > 0.25)
    brown = ((h < 55) | (h > 340)) & (s > 0.14) & (v > 0.20)
    dark = (v < 0.22) & ~glow
    cop = hsv2rgb(np.full_like(v, 24.0) + 6 * (1 - v), 0.50 + 0.18 * (1 - v), np.clip(v * 1.22 + 0.08, 0.12, 1.0))
    cop[glow] = hsv2rgb(np.full(glow.sum(), 28.0), np.full(glow.sum(), 0.48), np.clip(v[glow] * 1.3 + 0.18, 0, 1))
    is_cu = (~dark) if not dark_body else ((brown | glow) & ~dark)
    if dark_body:
        is_cu = opened(is_cu.astype(np.float64), 11) > 0.5
    out = np.where(is_cu[..., None], cop, charcoal(L))
    cls = {"copper": is_cu.astype(np.float64), "bone": np.zeros((H, H)), "ox": np.zeros((H, H))}
    return np.clip(out, 0, 1), cls


def mgao(src, cls):
    r0, g0, b0 = src[..., 0], src[..., 1], src[..., 2]
    cu, bn, ox = cls["copper"], cls["bone"], cls["ox"]
    base = (1 - cu) * 0.85 + cu * 0.95
    base = base * (1 - bn) + 0.18 * bn
    base = base * (1 - ox) + 0.30 * ox
    gl = (1 - cu) * 0.72 + cu * 0.78
    gl = gl * (1 - bn) + 0.28 * bn
    R = np.clip(0.75 * base + 0.25 * r0, 0, 1)
    G = np.clip(0.75 * gl + 0.25 * g0, 0, 1)
    return np.stack([R, G, b0, np.zeros_like(R)], -1)            # alpha = emissive: none


def main():
    g = np.load(os.path.join(TEX, "_geo.npz"))
    names = list(g["names"])
    hid = [i for i, n in enumerate(names) if n.startswith("host")][0]
    hp = g["pos"][g["oid"] == hid].reshape(-1, 3)
    dp = g["pos"][g["cell"] == 1].reshape(-1, 3)
    sp = g["pos"][g["cell"] == 3].reshape(-1, 3)
    ctx = {"hx0": hp[:, 0].min(), "hx1": hp[:, 0].max(), "dx0": dp[:, 0].min(), "dx1": dp[:, 0].max(),
           "sz1": sp[:, 2].max()}
    print("ctx", {k: round(float(v), 2) for k, v in ctx.items()})

    hull_src = os.path.join(TEX, "Renegade_Frigate_Thorvald_Albedo.png")
    srcs = {
        0: (np.asarray(Image.open(hull_src).convert("RGBA"), np.float64) / 255.0,
            "Common/Renegade_Frigate/Renegade_Frigate"),
        1: (load("Smuggler/Wraith/Wraith_Albedo.png"), "Smuggler/Wraith/Wraith"),
        2: (load("Smuggler/Wraith/Wraith_Albedo.png"), "Smuggler/Wraith/Wraith"),
        3: (load("Atreide/SpaceShuttle/SpaceShuttle_Albedo.png"), "Atreide/SpaceShuttle/SpaceShuttle"),
    }
    A = np.zeros((2 * H, 2 * H, 4))
    M = np.zeros((2 * H, 2 * H, 4))
    Nn = np.zeros((2 * H, 2 * H, 4))
    for cell, (alb, stem) in srcs.items():
        P, N, cov = bake(g, cell)
        print("cell", cell, "covered texels %.1f%%" % (100 * cov.mean()))
        if cell == 0:
            out, cls = recolour_hull(alb, P, N, cov, ctx)
        elif cell == 3:
            out, cls = recolour_hull(alb, P, N, cov, ctx, shuttle=True)
        elif cell == 1:
            out, cls = recolour_copper(alb, P, N, cov, ctx, dark_body=True)
        else:
            out, cls = recolour_copper(alb, P, N, cov, ctx, dark_body=False)
        mg = load(stem + "_MetallicGlossAOEmiss.png")
        nm = load(stem + "_Normal.png")
        c, r = CELLS[cell]
        sl = (slice(r * H, (r + 1) * H), slice(c * H, (c + 1) * H))
        A[sl] = np.concatenate([out, np.ones((H, H, 1))], -1)
        M[sl] = mgao(mg, cls)
        Nn[sl] = nm
    for arr, name in ((A, "Thorvald_Frigate_Albedo.png"), (M, "Thorvald_Frigate_MetallicGlossAO.png"),
                      (Nn, "Thorvald_Frigate_Normal.png")):
        Image.fromarray((np.clip(arr, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(os.path.join(TEX, name))
        print("wrote", name)


if __name__ == "__main__":
    main()
