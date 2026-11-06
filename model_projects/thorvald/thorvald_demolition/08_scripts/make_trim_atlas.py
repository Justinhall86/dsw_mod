"""Paint the House Thorvald TRIM atlas (hat, yoke tiers, cuffs, waist, skirt tabard): albedo, MetallicGlossAO and normal, 1024 x 1024.

    python make_trim_atlas.py <out_dir>           ->  Trim_Albedo.png, Trim_MetallicGlossAO.png, Trim_Normal.png, Trim_preview.png

Layout comes from trim_layout.py (shared with the model builder).  Painting is done in texture space per region with u around the part and v along it;
a height field drives the normal map, so stitches, weave, scale edges and rivets have real relief.  Copper is flagged metal in the MG map.
MG layout: R metallic, G gloss, B ambient occlusion, A 255 (the game converter wants alpha 255).  Normal: OpenGL (green up), like the other units.
"""
import math
import os
import sys

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import trim_layout as TL  # noqa: E402

N = TL.SIZE
rng = np.random.default_rng(7)

# palette (0..1)
BLACK = np.array([30, 27, 24]) / 255.0
GUN = np.array([56, 51, 46]) / 255.0
RUST = np.array([112, 52, 30]) / 255.0
RUST_D = np.array([72, 32, 20]) / 255.0
COPPER = np.array([178, 110, 60]) / 255.0
COPPER_D = np.array([104, 58, 30]) / 255.0

A = np.zeros((N, N, 3), np.float32)       # albedo
HT = np.zeros((N, N), np.float32)         # height in pixels
MET = np.zeros((N, N), np.float32)
GLO = np.full((N, N), 0.30, np.float32)
AO = np.full((N, N), 0.90, np.float32)
A[:] = BLACK


def region(name):
    """-> (rows slice, cols slice, h, w); local array row 0 is v = 1 (top), so V = 1 - (row + 0.5) / h."""
    x0, y0, x1, y1 = TL.BOX[name]
    return slice(N - y1, N - y0), slice(x0, x1), y1 - y0, x1 - x0


def grids(h, w):
    rr, cc = np.mgrid[0:h, 0:w].astype(np.float32)
    return rr, cc, (cc + 0.5) / w, 1.0 - (rr + 0.5) / h


def smooth_noise(h, w, cell, amp, seed):
    r = np.random.default_rng(seed)
    gh, gw = h // cell + 2, w // cell + 2
    g = r.random((gh, gw)).astype(np.float32)
    big = np.kron(g, np.ones((cell, cell), np.float32))[:h + cell, :w + cell]
    # cheap blur
    k = np.ones(cell, np.float32) / cell
    big = np.apply_along_axis(lambda m: np.convolve(m, k, mode="same"), 1, big)
    big = np.apply_along_axis(lambda m: np.convolve(m, k, mode="same"), 0, big)
    return (big[:h, :w] - 0.5) * 2 * amp


def put(name, alb, ht, met=None, glo=None, ao=None):
    rs, cs, h, w = region(name)
    A[rs, cs] = np.clip(alb, 0, 1)
    HT[rs, cs] = ht
    MET[rs, cs] = 0 if met is None else met
    if glo is not None:
        GLO[rs, cs] = glo
    if ao is not None:
        AO[rs, cs] = ao


def mix(base, col, m):
    m = np.clip(m, 0, 1)[..., None]
    return base * (1 - m) + np.asarray(col, np.float32) * m


def line(d, half):
    """soft 1px-antialiased line: d = distance in pixels to the line centre."""
    return np.clip(half - np.abs(d) + 0.5, 0, 1)


# ------------------------------------------------------------------------------------------------ hat
def paint_hat():
    vf = TL.hat_vfrac()
    # outer surface
    rs, cs, h, w = region("hat_out")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([34, 33, 32], np.float32) / 255.0, (h, w, 3)).copy()
    strand = 0.5 + 0.5 * np.sin(2 * math.pi * U * 128)
    hoop = 0.5 + 0.5 * np.sin(2 * math.pi * rr / 6.0)
    alb += (strand * 0.030 + hoop * 0.014 - 0.02)[..., None] + smooth_noise(h, w, 6, 0.012, 1)[..., None]
    ht = strand * 0.5 + hoop * 0.25
    for idx in (2, 5):  # the two raised rings
        d = (V - vf[idx]) * h
        ridge = line(d, 1.6)
        alb = mix(alb, np.array([62, 58, 54]) / 255.0, ridge * 0.9)
        shade = line(d + 3.0, 1.2)
        alb = mix(alb, np.array([14, 13, 12]) / 255.0, shade * 0.6)
        ht = np.maximum(ht, ridge * 2.2)
    # rim pinstripe: copper band with stitching
    v0, v1 = vf[7], vf[8]
    band = np.clip((V - v0) * h + 0.5, 0, 1) * np.clip((v1 - V) * h + 0.5, 0, 1)
    edge = line((V - v0) * h, 0.9) + line((V - v1) * h, 0.9)
    alb = mix(alb, COPPER, band)
    alb = mix(alb, COPPER_D, np.clip(edge, 0, 1) * band * 0.8)
    mid = 0.5 * (v0 + v1)
    dash = ((cc % 16) < 9).astype(np.float32) * line((V - mid) * h, 0.7)
    alb = mix(alb, RUST_D, dash * band)
    ht = np.maximum(ht, band * 0.9) - dash * 0.6
    put("hat_out", alb, ht, met=band * 0.9, glo=0.30 + band * 0.42, ao=0.95)
    # underside: dark lattice of ribs and hoops
    rs, cs, h, w = region("hat_under")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([22, 21, 20], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (smooth_noise(h, w, 5, 0.014, 2) + 0.012 * (0.5 + 0.5 * np.sin(2 * math.pi * U * 96)))[..., None]
    ribs = line(((cc % 32) - 16), 1.7)
    hoops = np.zeros((h, w), np.float32)
    for vv in (0.32, 0.62, 0.90):
        hoops = np.maximum(hoops, line((V - vv) * h, 1.6))
    lattice = np.maximum(ribs, hoops)
    alb = mix(alb, np.array([70, 44, 30]) / 255.0, lattice * 0.85)
    put("hat_under", alb, lattice * 1.4, glo=0.22, ao=0.75)
    # rim edge band
    rs, cs, h, w = region("hat_rim")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([24, 22, 21], np.float32) / 255.0, (h, w, 3)).copy()
    dash = ((cc % 14) < 8).astype(np.float32) * line((V - 0.5) * h, 1.3)
    alb = mix(alb, COPPER, dash)
    put("hat_rim", alb, dash * 0.8, met=dash * 0.9, glo=0.3 + dash * 0.4)


# ------------------------------------------------------------------------------------------------ yoke tiers
def paint_yoke(name, seed):
    rs, cs, h, w = region(name)
    rr, cc, U, V = grids(h, w)
    row = np.floor(rr / 10.0)
    off = np.where(row % 2 == 1, 8.0, 0.0)
    cx = ((cc + off) % 16.0) - 8.0
    cy = rr % 10.0
    dd = np.hypot(cx, cy - 1.0)
    base = np.array([26, 24, 22], np.float32) / 255.0
    alb = np.broadcast_to(base, (h, w, 3)).copy()
    alb += (smooth_noise(h, w, 4, 0.012, seed) + 0.020 * (1 - cy / 10.0))[..., None]
    arc = line(dd - 8.0, 0.9) * (cy > 1.0)
    alb = mix(alb, np.array([74, 68, 62]) / 255.0, arc * 0.9)
    ht = arc * 1.6 + (1 - cy / 10.0) * 0.4
    # copper edge band (last third of v): stitched
    band = np.clip((V - 0.667) * h * 1.0 + 0.5, 0, 1)
    alb = mix(alb, COPPER, band)
    top = line((V - 0.667) * h, 0.9)
    alb = mix(alb, COPPER_D, top * 0.8)
    stitch = ((cc % 12) < 7).astype(np.float32) * line((V - 0.833) * h, 0.7)
    alb = mix(alb, RUST_D, stitch * band)
    ht = np.maximum(ht * (1 - band), band * 1.1) - stitch * 0.5
    put(name, alb, ht, met=band * 0.9, glo=0.28 + band * 0.44, ao=0.9)


# ------------------------------------------------------------------------------------------------ cuff, waist
def paint_cuff():
    rs, cs, h, w = region("cuff")
    rr, cc, U, V = grids(h, w)
    wv = (((cc // 3) + (rr // 3)) % 2).astype(np.float32)
    alb = np.broadcast_to(RUST.astype(np.float32), (h, w, 3)).copy()
    alb += (wv * 0.045 - 0.022)[..., None] + smooth_noise(h, w, 5, 0.014, 3)[..., None]
    ht = wv * 0.5
    for lo, hi in ((0.05, 0.15), (0.85, 0.95)):
        m = np.clip((V - lo) * h + 0.5, 0, 1) * np.clip((hi - V) * h + 0.5, 0, 1)
        alb = mix(alb, RUST_D, m * 0.9)
        ht = np.maximum(ht, m * 0.8)
        mid = 0.5 * (lo + hi)
        dash = ((cc % 10) < 6).astype(np.float32) * line((V - mid) * h, 0.7)
        alb = mix(alb, COPPER, dash)
        ht = np.maximum(ht, dash * 1.0)
    metal = np.zeros((h, w), np.float32)
    for mid in (0.10, 0.90):
        metal = np.maximum(metal, ((cc % 10) < 6).astype(np.float32) * line((V - mid) * h, 0.7))
    put("cuff", alb, ht, met=metal * 0.9, glo=0.26 + metal * 0.4, ao=0.9)


def paint_waist():
    rs, cs, h, w = region("waist")
    rr, cc, U, V = grids(h, w)
    grain = 0.5 + 0.5 * np.sin(2 * math.pi * rr / 3.5)
    alb = np.broadcast_to((RUST * 0.95).astype(np.float32), (h, w, 3)).copy()
    alb += (grain * 0.04 - 0.02)[..., None] + smooth_noise(h, w, 6, 0.016, 4)[..., None]
    ht = grain * 0.4
    for lo, hi in ((0.10, 0.20), (0.80, 0.90)):
        m = np.clip((V - lo) * h + 0.5, 0, 1) * np.clip((hi - V) * h + 0.5, 0, 1)
        alb = mix(alb, RUST_D, m * 0.9)
        ht = np.maximum(ht, m * 0.7)
    stitch = np.zeros((h, w), np.float32)
    for vv in (0.27, 0.73):
        stitch = np.maximum(stitch, ((cc % 12) < 7).astype(np.float32) * line((V - vv) * h, 0.7))
    alb = mix(alb, COPPER_D, stitch * 0.9)
    riv = np.hypot(((cc % 32) - 16.0), (rr - h * 0.5)) < 4.2
    rivet = np.where(riv, 1.0, 0.0).astype(np.float32)
    rim = line(np.hypot(((cc % 32) - 16.0), (rr - h * 0.5)) - 4.2, 0.9)
    alb = mix(alb, COPPER, rivet)
    alb = mix(alb, RUST_D, rim * (1 - rivet) * 0.7)
    ht = np.maximum(ht, rivet * 2.0)
    put("waist", alb, ht + stitch * 0.5, met=rivet * 0.9 + stitch * 0.0, glo=0.30 + rivet * 0.42, ao=0.9)


def paint_cap():
    rs, cs, h, w = region("cap")
    rr, cc, U, V = grids(h, w)
    wv = (((cc // 3) + (rr // 3)) % 2).astype(np.float32)
    alb = np.broadcast_to(np.array([30, 27, 25], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (wv * 0.04 - 0.02)[..., None] + smooth_noise(h, w, 6, 0.012, 5)[..., None]
    seam = line(((cc % 64) - 32), 1.0) * 0.5
    alb = mix(alb, np.array([14, 13, 12]) / 255.0, seam)
    put("cap", alb, wv * 0.5 - seam * 0.5, glo=0.24, ao=0.8)


# ------------------------------------------------------------------------------------------------ skirt tabard (front + back)
def paint_hood():
    """Black hood + mask: fine twill, a centre seam at the back and down the mask, a stitched hem under the eye slit and above it, soft folds at the neck."""
    rs, cs, h, w = region("hood")
    rr, cc, U, V = grids(h, w)
    tw = ((((cc + rr) // 2) % 3) == 0).astype(np.float32)               # diagonal twill
    alb = np.broadcast_to(BLACK.astype(np.float32), (h, w, 3)).copy()
    alb += (tw * 0.030 - 0.012)[..., None] + smooth_noise(h, w, 7, 0.010, 41)[..., None]
    ht = tw * 0.35
    z0, z1 = TL.HOOD_RINGS[0], TL.HOOD_TOP
    vf = lambda z: (z - z0) / (z1 - z0)
    v_lo, v_hi = vf(TL.HOOD_RINGS[TL.HOOD_SLIT[0]]), vf(TL.HOOD_RINGS[TL.HOOD_SLIT[1]])
    du = np.minimum(U, 1 - U)                                            # 0 at the front centre
    # mask: slightly warmer, smoother cloth on the front below the slit
    mask = np.clip((0.30 - du) * 30, 0, 1) * np.clip((v_lo - V) * h * 0.08 + 0.5, 0, 1) * np.clip((V - 0.08) * 20, 0, 1)
    alb = mix(alb, np.array([38, 30, 26]) / 255.0, mask * 0.6)
    # hems: a raised band just below and just above the slit, with stitches
    for vc in (v_lo - 0.035, v_hi + 0.035):
        band = line((V - vc) * h, 3.0)
        alb = mix(alb, np.array([20, 18, 16]) / 255.0, band * 0.9)
        ht = np.maximum(ht, band * 1.4)
        st = ((cc % 9) < 5).astype(np.float32) * line((V - vc) * h, 0.6)
        alb = mix(alb, np.array([70, 52, 40]) / 255.0, st * 0.7)
    # seams: back centre (u = 0.5) and the mask's centre front below the slit
    back = line((U - 0.5) * w, 1.2)
    front = line(du * w, 1.0) * (V < v_lo - 0.05)
    for sm in (back, front):
        alb = mix(alb, np.array([14, 12, 11]) / 255.0, sm * 0.9)
        ht = np.minimum(ht, 1 - sm) - sm * 0.6
    # gathered folds at the neck (bottom 25%)
    fold = (0.5 + 0.5 * np.sin(U * 2 * np.pi * 9 + smooth_noise(h, w, 9, 1.5, 43))) * np.clip((0.25 - V) * 6, 0, 1)
    alb -= (fold * 0.025)[..., None]
    ht += fold * 1.2
    put("hood", alb, ht, met=np.zeros((h, w), np.float32), glo=0.20, ao=0.85 - fold * 0.15)


def paint_tabard(name, seed):
    rs, cs, h, w = region(name)
    rr, cc, U, V = grids(h, w)
    folds = np.sin(2 * math.pi * (U * 5.5 + smooth_noise(h, w, 24, 0.5, seed) * 0.12)) * 0.030
    vert = 0.5 + 0.5 * np.sin(2 * math.pi * U * 128)
    horz = 0.5 + 0.5 * np.sin(2 * math.pi * rr / 3.0)
    alb = np.broadcast_to(np.array([104, 48, 28], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (folds + vert * 0.022 + horz * 0.012 - 0.017)[..., None] + smooth_noise(h, w, 8, 0.014, seed + 1)[..., None]
    alb *= np.where(V > 0.90, 0.78 + 0.22 * (1 - (V - 0.90) / 0.10), 1.0)[..., None]   # shadow under the belt
    ht = vert * 0.5 + horz * 0.3 + folds * 6
    # patterned hem band
    hv = TL.TAB_HEM / (TL.TAB_Z[1] - TL.TAB_Z[0])
    hem = np.clip((hv - V) * h + 0.5, 0, 1)
    alb = mix(alb, np.array([62, 28, 18]) / 255.0, hem)
    px = (cc % 28) - 14.0
    py = rr - (h * (1 - hv * 0.5))
    diamond = np.abs(px) / 12.0 + np.abs(py) / 9.0
    outline = line((diamond - 1.0) * 6.0, 1.0) * hem
    inner_dot = (diamond < 0.28).astype(np.float32) * hem
    alb = mix(alb, COPPER, outline)
    alb = mix(alb, COPPER, inner_dot)
    cap = line((V - hv) * h, 1.0)
    alb = mix(alb, COPPER, cap)
    base_line = line((V - 0.004) * h, 1.3)
    alb = mix(alb, RUST_D, base_line)
    metal = np.maximum(np.maximum(outline, inner_dot), cap)
    ht = np.maximum(ht, metal * 1.4)
    put(name, alb, ht, met=metal * 0.85, glo=0.26 + metal * 0.44, ao=0.9)


def paint_tails():
    """Long dark coat tails: heavy black-brown cloth with soft vertical folds, a rust band and a copper pinline above the hem."""
    rs, cs, h, w = region("tails")
    rr, cc, U, V = grids(h, w)
    folds = np.sin(2 * math.pi * (U * 4.0 + smooth_noise(h, w, 24, 0.5, 61) * 0.15)) * 0.022
    vert = 0.5 + 0.5 * np.sin(2 * math.pi * U * 110)
    alb = np.broadcast_to(np.array([34, 30, 27], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (folds + vert * 0.012 - 0.008)[..., None] + smooth_noise(h, w, 8, 0.010, 62)[..., None]
    alb *= np.where(V > 0.92, 0.75 + 0.25 * (1 - (V - 0.92) / 0.08), 1.0)[..., None]
    ht = vert * 0.4 + folds * 6
    band = np.clip((0.075 - V) * h + 0.5, 0, 1) * np.clip((V - 0.02) * h + 0.5, 0, 1)
    alb = mix(alb, RUST_D, band)
    pin = line((V - 0.088) * h, 0.9)
    alb = mix(alb, COPPER_D, pin)
    ht = np.maximum(ht, band * 0.8 + pin * 1.2)
    put("tails", alb, ht, met=pin * 0.8, glo=0.22 + pin * 0.4, ao=0.9 - np.abs(folds) * 3)


def build():
    A[:] = BLACK
    paint_hat()
    paint_yoke("yoke0", 11)
    paint_yoke("yoke1", 12)
    paint_yoke("yoke2", 13)
    paint_cuff()
    paint_waist()
    paint_cap()
    paint_hood()
    paint_tails()
    paint_tabard("tab_front", 21)
    paint_tabard("tab_back", 31)


def save(out):
    os.makedirs(out, exist_ok=True)
    rgb = (np.clip(A, 0, 1) * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([rgb, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_Albedo.png"))
    mg = np.dstack([np.clip(MET, 0, 1), np.clip(GLO, 0, 1), np.clip(AO, 0, 1)])
    mg8 = (mg * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([mg8, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_MetallicGlossAO.png"))
    # normal from the height field (pixels); OpenGL convention: +y up in the image
    gy, gx = np.gradient(HT.astype(np.float64))
    k = 0.55
    nx, ny, nz = -gx * k, gy * k, np.ones_like(gx)
    ln = np.sqrt(nx * nx + ny * ny + nz * nz)
    nrm = np.dstack([nx / ln, ny / ln, nz / ln]) * 0.5 + 0.5
    n8 = (nrm * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([n8, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_Normal.png"))
    Image.fromarray(rgb, "RGB").save(os.path.join(out, "Trim_preview.png"))
    print("TRIM atlas written to", out)


if __name__ == "__main__":
    build()
    save(os.path.abspath(sys.argv[1]))
