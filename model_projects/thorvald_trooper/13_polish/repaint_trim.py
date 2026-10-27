"""Repaint the House Thorvald TRIM atlas at 2048 with game-quality cloth (dsw-unit-upscale texture pass).

    python repaint_trim.py <out_dir>  ->  Trim_Albedo.png, Trim_MetallicGlossAO.png, Trim_Normal.png, Trim_preview.png

Same box layout as trim_layout.py (UVs in the blend are baked to it), painted at 2x with pixel constants scaled by S.
Focused changes over make_trim_atlas.py (the v8 apron/waist were the weakest part):
  - apron/tails: drape fold shading that MATCHES the skirt.py geometry ripple (sin(2*pi*folds*u + phase), amplitude (1-v)^1.5
    growing to the hem), valley creases, fine twill instead of the corduroy ribbing, gathers under the belt, sand dust + wear at the hem.
  - hem: the concept's dark border band carrying the copper chain pattern, crisper at 2048 with real relief.
  - waist: dark leather belt (the concept's belt) so the apron separates from the torso, stitching, strap keepers, buckle at
    u = 0.75 (front centre in build_waist' angle mapping), domed copper rivets.
Heights are kept in 1024-pixel units (put() scales by S), so relief strength is unchanged while edges get sharper.
"""
import math
import os
import sys

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "08_scripts"))
import trim_layout as TL  # noqa: E402

S = 2                                    # upscale factor over the original 1024 atlas
N = TL.SIZE * S
rng = np.random.default_rng(7)

# palette (0..1)
BLACK = np.array([30, 27, 24]) / 255.0
GUN = np.array([56, 51, 46]) / 255.0
RUST = np.array([112, 52, 30]) / 255.0
RUST_D = np.array([72, 32, 20]) / 255.0
COPPER = np.array([178, 110, 60]) / 255.0
COPPER_D = np.array([104, 58, 30]) / 255.0
LEATHER = np.array([43, 33, 27]) / 255.0
LEATHER_D = np.array([26, 20, 17]) / 255.0
LEATHER_HI = np.array([64, 50, 41]) / 255.0
THREAD = np.array([122, 84, 54]) / 255.0

A = np.zeros((N, N, 3), np.float32)
HT = np.zeros((N, N), np.float32)
MET = np.zeros((N, N), np.float32)
GLO = np.full((N, N), 0.30, np.float32)
AO = np.full((N, N), 0.90, np.float32)
A[:] = BLACK


def region(name):
    """-> (rows slice, cols slice, h, w); local row 0 is v = 1 (top), so V = 1 - (row + 0.5) / h."""
    x0, y0, x1, y1 = TL.BOX[name]
    k = float(S)
    x0, y0, x1, y1 = x0 * k, y0 * k, x1 * k, y1 * k
    return slice(int(N - y1), int(N - y0)), slice(int(x0), int(x1)), int(y1 - y0), int(x1 - x0)


def grids(h, w):
    rr, cc = np.mgrid[0:h, 0:w].astype(np.float32)
    return rr, cc, (cc + 0.5) / w, 1.0 - (rr + 0.5) / h


def smooth_noise(h, w, cell, amp, seed):
    r = np.random.default_rng(seed)
    gh, gw = h // cell + 2, w // cell + 2
    g = r.random((gh, gw)).astype(np.float32)
    big = np.kron(g, np.ones((cell, cell), np.float32))[:h + cell, :w + cell]
    k = np.ones(cell, np.float32) / cell
    big = np.apply_along_axis(lambda m: np.convolve(m, k, mode="same"), 1, big)
    big = np.apply_along_axis(lambda m: np.convolve(m, k, mode="same"), 0, big)
    return (big[:h, :w] - 0.5) * 2 * amp


def put(name, alb, ht, met=None, glo=None, ao=None):
    rs, cs, h, w = region(name)
    A[rs, cs] = np.clip(alb, 0, 1)
    HT[rs, cs] = ht * S                    # heights stay in 1024-px units
    MET[rs, cs] = 0 if met is None else met
    if glo is not None:
        GLO[rs, cs] = glo
    if ao is not None:
        AO[rs, cs] = ao


def mix(base, col, m):
    m = np.clip(m, 0, 1)[..., None]
    return base * (1 - m) + np.asarray(col, np.float32) * m


def line(d, half):
    """soft antialiased line: d = distance in pixels to the line centre (both in NEW pixels)."""
    return np.clip(half - np.abs(d) + 0.5, 0, 1)


def dash_mask(cc, period, duty):
    """stitch dash pattern; period in NEW pixels."""
    return ((cc % period) < period * duty).astype(np.float32)


# ------------------------------------------------------------------------------------------------ hat (same design, 2x)
def paint_hat():
    vf = TL.hat_vfrac()
    rs, cs, h, w = region("hat_out")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([34, 33, 32], np.float32) / 255.0, (h, w, 3)).copy()
    strand = 0.5 + 0.5 * np.sin(2 * math.pi * U * 128)
    hoop = 0.5 + 0.5 * np.sin(2 * math.pi * rr / (6.0 * S))
    alb += (strand * 0.030 + hoop * 0.014 - 0.02)[..., None] + smooth_noise(h, w, 6 * S, 0.012, 1)[..., None]
    ht = strand * 0.5 + hoop * 0.25
    for idx in (2, 5):
        d = (V - vf[idx]) * h
        ridge = line(d, 1.6 * S)
        alb = mix(alb, np.array([62, 58, 54]) / 255.0, ridge * 0.9)
        shade = line(d + 3.0 * S, 1.2 * S)
        alb = mix(alb, np.array([14, 13, 12]) / 255.0, shade * 0.6)
        ht = np.maximum(ht, ridge * 2.2)
    v0, v1 = vf[7], vf[8]
    band = np.clip((V - v0) * h + 0.5, 0, 1) * np.clip((v1 - V) * h + 0.5, 0, 1)
    edge = line((V - v0) * h, 0.9 * S) + line((V - v1) * h, 0.9 * S)
    alb = mix(alb, COPPER, band)
    alb = mix(alb, COPPER_D, np.clip(edge, 0, 1) * band * 0.8)
    mid = 0.5 * (v0 + v1)
    dash = dash_mask(cc, 16 * S, 0.56) * line((V - mid) * h, 0.7 * S)
    alb = mix(alb, RUST_D, dash * band)
    ht = np.maximum(ht, band * 0.9) - dash * 0.6
    put("hat_out", alb, ht, met=band * 0.9, glo=0.30 + band * 0.42, ao=0.95)
    rs, cs, h, w = region("hat_under")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([22, 21, 20], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (smooth_noise(h, w, 5 * S, 0.014, 2) + 0.012 * (0.5 + 0.5 * np.sin(2 * math.pi * U * 96)))[..., None]
    ribs = line(((cc % (32 * S)) - 16 * S), 1.7 * S)
    hoops = np.zeros((h, w), np.float32)
    for vv in (0.32, 0.62, 0.90):
        hoops = np.maximum(hoops, line((V - vv) * h, 1.6 * S))
    lattice = np.maximum(ribs, hoops)
    alb = mix(alb, np.array([70, 44, 30]) / 255.0, lattice * 0.85)
    put("hat_under", alb, lattice * 1.4, glo=0.22, ao=0.75)
    rs, cs, h, w = region("hat_rim")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(np.array([24, 22, 21], np.float32) / 255.0, (h, w, 3)).copy()
    dash = dash_mask(cc, 14 * S, 0.57) * line((V - 0.5) * h, 1.3 * S)
    alb = mix(alb, COPPER, dash)
    put("hat_rim", alb, dash * 0.8, met=dash * 0.9, glo=0.3 + dash * 0.4)


# ------------------------------------------------------------------------------------------------ yoke tiers (legacy boxes)
def paint_yoke(name, seed):
    rs, cs, h, w = region(name)
    rr, cc, U, V = grids(h, w)
    row = np.floor(rr / (10.0 * S))
    off = np.where(row % 2 == 1, 8.0 * S, 0.0)
    cx = ((cc + off) % (16.0 * S)) - 8.0 * S
    cy = rr % (10.0 * S)
    dd = np.hypot(cx, cy - 1.0 * S)
    base = np.array([26, 24, 22], np.float32) / 255.0
    alb = np.broadcast_to(base, (h, w, 3)).copy()
    alb += (smooth_noise(h, w, 4 * S, 0.012, seed) + 0.020 * (1 - cy / (10.0 * S)))[..., None]
    arc = line(dd - 8.0 * S, 0.9 * S) * (cy > 1.0 * S)
    alb = mix(alb, np.array([74, 68, 62]) / 255.0, arc * 0.9)
    ht = arc * 1.6 + (1 - cy / (10.0 * S)) * 0.4
    band = np.clip((V - 0.667) * h + 0.5, 0, 1)
    alb = mix(alb, COPPER, band)
    top = line((V - 0.667) * h, 0.9 * S)
    alb = mix(alb, COPPER_D, top * 0.8)
    stitch = dash_mask(cc, 12 * S, 0.58) * line((V - 0.833) * h, 0.7 * S)
    alb = mix(alb, RUST_D, stitch * band)
    ht = np.maximum(ht * (1 - band), band * 1.1) - stitch * 0.5
    put(name, alb, ht, met=band * 0.9, glo=0.28 + band * 0.44, ao=0.9)


def paint_cuff():
    rs, cs, h, w = region("cuff")
    rr, cc, U, V = grids(h, w)
    wv = (((cc // (3 * S)) + (rr // (3 * S))) % 2).astype(np.float32)
    alb = np.broadcast_to(RUST.astype(np.float32), (h, w, 3)).copy()
    alb += (wv * 0.045 - 0.022)[..., None] + smooth_noise(h, w, 5 * S, 0.014, 3)[..., None]
    ht = wv * 0.5
    metal = np.zeros((h, w), np.float32)
    for lo, hi, mid in ((0.05, 0.15, 0.10), (0.85, 0.95, 0.90)):
        m = np.clip((V - lo) * h + 0.5, 0, 1) * np.clip((hi - V) * h + 0.5, 0, 1)
        alb = mix(alb, RUST_D, m * 0.9)
        ht = np.maximum(ht, m * 0.8)
        dash = dash_mask(cc, 10 * S, 0.6) * line((V - mid) * h, 0.7 * S)
        alb = mix(alb, COPPER, dash)
        ht = np.maximum(ht, dash * 1.0)
        metal = np.maximum(metal, dash)
    put("cuff", alb, ht, met=metal * 0.9, glo=0.26 + metal * 0.4, ao=0.9)


def paint_cap():
    rs, cs, h, w = region("cap")
    rr, cc, U, V = grids(h, w)
    wv = (((cc // (3 * S)) + (rr // (3 * S))) % 2).astype(np.float32)
    alb = np.broadcast_to(np.array([30, 27, 25], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (wv * 0.04 - 0.02)[..., None] + smooth_noise(h, w, 6 * S, 0.012, 5)[..., None]
    seam = line(((cc % (64 * S)) - 32 * S), 1.0 * S) * 0.5
    alb = mix(alb, np.array([14, 13, 12]) / 255.0, seam)
    put("cap", alb, wv * 0.5 - seam * 0.5, glo=0.24, ao=0.8)


def paint_hood():
    """Black hood + mask: fine twill, seams, stitched hems at the eye slit, soft gathers at the neck."""
    rs, cs, h, w = region("hood")
    rr, cc, U, V = grids(h, w)
    tw = ((((cc + rr) // (2 * S)) % 3) == 0).astype(np.float32)
    alb = np.broadcast_to(BLACK.astype(np.float32), (h, w, 3)).copy()
    alb += (tw * 0.030 - 0.012)[..., None] + smooth_noise(h, w, 7 * S, 0.010, 41)[..., None]
    ht = tw * 0.35
    z0, z1 = TL.HOOD_RINGS[0], TL.HOOD_TOP
    vf = lambda z: (z - z0) / (z1 - z0)
    v_lo, v_hi = vf(TL.HOOD_RINGS[TL.HOOD_SLIT[0]]), vf(TL.HOOD_RINGS[TL.HOOD_SLIT[1]])
    du = np.minimum(U, 1 - U)
    mask = np.clip((0.30 - du) * 30, 0, 1) * np.clip((v_lo - V) * h * 0.08 + 0.5, 0, 1) * np.clip((V - 0.08) * 20, 0, 1)
    alb = mix(alb, np.array([38, 30, 26]) / 255.0, mask * 0.6)
    for vc in (v_lo - 0.035, v_hi + 0.035):
        band = line((V - vc) * h, 3.0 * S)
        alb = mix(alb, np.array([20, 18, 16]) / 255.0, band * 0.9)
        ht = np.maximum(ht, band * 1.4)
        st = dash_mask(cc, 9 * S, 0.55) * line((V - vc) * h, 0.6 * S)
        alb = mix(alb, np.array([70, 52, 40]) / 255.0, st * 0.7)
    back = line((U - 0.5) * w, 1.2 * S)
    front = line(du * w, 1.0 * S) * (V < v_lo - 0.05)
    for sm in (back, front):
        alb = mix(alb, np.array([14, 12, 11]) / 255.0, sm * 0.9)
        ht = np.minimum(ht, 1 - sm) - sm * 0.6
    fold = (0.5 + 0.5 * np.sin(U * 2 * math.pi * 9 + smooth_noise(h, w, 9 * S, 1.5, 43))) * np.clip((0.25 - V) * 6, 0, 1)
    alb -= (fold * 0.025)[..., None]
    ht += fold * 1.2
    put("hood", alb, ht, met=np.zeros((h, w), np.float32), glo=0.20, ao=0.85 - fold * 0.15)


# ------------------------------------------------------------------------------------------------ waist: dark leather belt
def paint_waist():
    """Leather belt (u = 0.75 is the front centre in build_waist' angle mapping), stitched edges, strap keepers, buckle, rivets."""
    rs, cs, h, w = region("waist")
    rr, cc, U, V = grids(h, w)
    alb = np.broadcast_to(LEATHER.astype(np.float32), (h, w, 3)).copy()
    grain = smooth_noise(h, w, 4 * S, 0.010, 4) + smooth_noise(h, w, 14 * S, 0.008, 5)
    wrinkle = 0.5 + 0.5 * np.sin(2 * math.pi * V * 26 + smooth_noise(h, w, 18 * S, 2.0, 6))
    alb += (grain + wrinkle * 0.012 - 0.006)[..., None]
    ht = wrinkle * 0.35 + grain * 2.0
    # rounded top/bottom edges: dark bevel with a light rim
    for lo, hi in ((0.10, 0.22), (0.78, 0.90)):
        m = np.clip((V - lo) * h + 0.5, 0, 1) * np.clip((hi - V) * h + 0.5, 0, 1)
        alb = mix(alb, LEATHER_D, m * 0.55)
    rim = np.maximum(line((V - 0.155) * h, 1.2 * S), line((V - 0.845) * h, 1.2 * S))
    alb = mix(alb, LEATHER_HI, rim * 0.5)
    ht = np.maximum(ht, rim * 0.8)
    # copper thread stitching
    stitch = np.zeros((h, w), np.float32)
    for vv in (0.27, 0.73):
        stitch = np.maximum(stitch, dash_mask(cc, 12 * S, 0.58) * line((V - vv) * h, 0.7 * S))
    alb = mix(alb, THREAD, stitch * 0.75)
    ht = np.maximum(ht, stitch * 0.6)
    metal = np.zeros((h, w), np.float32)
    # strap keepers and tongue around the front buckle
    du = np.abs(((U - 0.75 + 0.5) % 1.0) - 0.5)
    tongue = (du > 0.030) & (du < 0.085) & (np.abs(V - 0.5) < 0.135)
    tongue_m = line(np.abs(V - 0.5) * h - 0.135 * h, 1.2 * S) * ((du > 0.030) & (du < 0.085))
    alb = mix(alb, LEATHER_HI, tongue.astype(np.float32) * 0.5)
    alb = mix(alb, LEATHER_D, tongue_m * 0.6)
    ht = np.maximum(ht, tongue.astype(np.float32) * 0.8)
    for kpos in (0.105, 0.185):
        keep = (np.abs(du - kpos) < 0.013) & (V > 0.17) & (V < 0.83)
        kedge = line(np.abs(du - kpos) * w - 0.013 * w, 1.1 * S) * ((V > 0.17) & (V < 0.83))
        alb = mix(alb, LEATHER_HI, keep.astype(np.float32) * 0.45)
        alb = mix(alb, LEATHER_D, kedge * 0.7)
        ht = np.maximum(ht, keep.astype(np.float32) * 1.0)
        st2 = dash_mask(rr.astype(np.float32), 7 * S, 0.55) * line((du - kpos) * w - 0.011 * w, 0.6 * S) * ((V > 0.19) & (V < 0.81)).astype(np.float32)
        alb = mix(alb, THREAD, st2 * 0.6)
    # buckle frame + pin
    outer = (du < 0.030) & (np.abs(V - 0.5) < 0.185)
    inner = (du < 0.020) & (np.abs(V - 0.5) < 0.115)
    frame = outer & ~inner
    pin = (du < 0.005) & (np.abs(V - 0.5) < 0.135)
    alb = mix(alb, COPPER, frame.astype(np.float32) * 0.95)
    alb = mix(alb, COPPER_D, (inner & ~pin).astype(np.float32) * 0.0)          # open centre stays leather
    alb = mix(alb, COPPER, pin.astype(np.float32) * 0.95)
    fedge = line(np.abs(du - 0.025) * w, 1.0 * S) * (np.abs(V - 0.5) < 0.185)
    alb = mix(alb, np.array([236, 186, 128]) / 255.0, fedge * 0.35)
    ht = np.maximum(ht, frame.astype(np.float32) * 2.2 + pin.astype(np.float32) * 1.8)
    metal = np.maximum(metal, frame.astype(np.float32) + pin.astype(np.float32))
    # domed rivets beside the keepers
    for rpos in (0.145, 0.235, 0.325):
        rd = np.hypot((du - rpos) * w, (V - 0.5) * h)
        riv = np.clip(5.2 * S - rd, 0, 1)
        dome = np.clip(5.2 * S - rd, 0, 1) ** 0.5
        alb = mix(alb, COPPER, riv * 0.95)
        alb = mix(alb, np.array([236, 186, 128]) / 255.0, np.clip(2.2 * S - rd + 1.5 * S, 0, 1) * 0.5)
        ht = np.maximum(ht, dome * 1.8)
        metal = np.maximum(metal, riv)
    # wear + a contact shadow onto the apron at the lower edge
    dust = np.clip((0.12 - V) / 0.12, 0, 1) * (0.55 + 0.45 * smooth_noise(h, w, 10 * S, 1.0, 7))
    alb = mix(alb, np.array([96, 72, 58]) / 255.0, dust * 0.14)
    sh = np.clip((0.10 - V) / 0.10, 0, 1)
    alb *= (1.0 - 0.25 * sh)[..., None]
    put("waist", alb, ht, met=metal * 0.9, glo=0.32 + metal * 0.42, ao=0.9 - sh * 0.15)


# ------------------------------------------------------------------------------------------------ skirt cloth (apron + tails)
def cloth_drape(U, V, folds, phase):
    """Skirt.py' ripple: sin(2*pi*folds*u + phase), amplitude (1-v)^1.5 growing toward the hem (v=0)."""
    t = np.clip(1.0 - V, 0, 1)
    geo = np.sin(2 * math.pi * folds * U + phase)
    return geo, geo * (t ** 1.5)


def paint_tabard(name, folds, phase, seed):
    """Rust apron: drape folds aligned with the geometry, twill, gathers under the belt, chain-pattern hem border, dust."""
    rs, cs, h, w = region(name)
    rr, cc, U, V = grids(h, w)
    geo, shade = cloth_drape(U, V, folds, phase)
    alb = np.broadcast_to(RUST.astype(np.float32), (h, w, 3)).copy()
    # drape: crests catch warm light, valleys fall into shadow
    alb += (shade * 0.042)[..., None] * np.array([1.0, 0.78, 0.62], np.float32)
    crease = np.clip(-geo * 1.25 - 0.25, 0, 1) * np.clip(1.0 - V, 0, 1) ** 1.2
    alb = mix(alb, RUST_D * 0.82, crease * 0.5)
    # fine wrinkles between the folds
    wr = np.sin(2 * math.pi * (U * 17 + smooth_noise(h, w, 20 * S, 0.35, seed) * 0.5))
    alb += (wr * 0.010 * np.clip(1.0 - V, 0, 1) * (0.5 + 0.5 * geo))[..., None]
    # twill weave (replaces the old corduroy ribbing)
    tw = ((((cc + rr) // (2 * S)) % 3) == 0).astype(np.float32)
    alb += (tw * 0.010 - 0.005)[..., None]
    # gathers under the belt + contact shadow
    gath = (0.5 + 0.5 * np.sin(2 * math.pi * U * 21 + smooth_noise(h, w, 16 * S, 1.2, seed + 2))) * np.clip((V - 0.80) / 0.20, 0, 1)
    alb -= (gath * 0.016)[..., None]
    sh = np.clip((V - 0.84) / 0.16, 0, 1)
    alb *= (1.0 - 0.30 * sh * sh)[..., None]
    # hem border: dark band carrying the copper chain pattern
    hv = TL.TAB_HEM / (TL.TAB_Z[1] - TL.TAB_Z[0])
    hem = np.clip((hv - V) * h + 0.5, 0, 1)
    alb = mix(alb, np.array([52, 24, 16]) / 255.0, hem)
    px = (cc % (28 * S)) - 14.0 * S
    py = rr - (h * (1 - hv * 0.5))
    diamond = np.abs(px) / (12.0 * S) + np.abs(py) / (9.0 * S)
    outline = line((diamond - 1.0) * 6.0 * S, 1.0 * S) * hem
    inner_dot = (diamond < 0.28).astype(np.float32) * hem
    cap = line((V - hv) * h, 1.0 * S)
    stitch = dash_mask(cc, 12 * S, 0.58) * line((V - (hv + 0.014)) * h, 0.7 * S)
    alb = mix(alb, COPPER, outline)
    alb = mix(alb, COPPER, inner_dot)
    alb = mix(alb, COPPER, cap)
    alb = mix(alb, THREAD, stitch * 0.7)
    # sand dust + edge wear at the hem
    dust = np.clip((0.16 - V) / 0.16, 0, 1) * (0.55 + 0.45 * smooth_noise(h, w, 10 * S, 1.0, seed + 3))
    alb = mix(alb, np.array([122, 84, 62]) / 255.0, dust * 0.16)
    edge = np.clip((0.012 - V) * h, 0, 1)
    alb = mix(alb, np.array([30, 14, 9]) / 255.0, edge * 0.8)
    metal = np.maximum(np.maximum(outline, inner_dot), cap)
    ht = tw * 0.25 + shade * 2.4 - crease * 1.3 + wr * 0.5 * np.clip(1.0 - V, 0, 1) + gath * 0.8
    ht = np.maximum(ht, metal * 1.4 + stitch * 0.6)
    put(name, alb, ht, met=metal * 0.85, glo=0.26 + metal * 0.44,
        ao=0.92 - crease * 0.25 - sh * 0.18 - np.clip(-shade, 0, 1) * 0.22)


def paint_tails(folds, phase, seed):
    """Dark coat tails: heavy cloth with soft drape folds, rust hem band with a copper pinline, dust at the edge."""
    rs, cs, h, w = region("tails")
    rr, cc, U, V = grids(h, w)
    geo, shade = cloth_drape(U, V, folds, phase)
    alb = np.broadcast_to(np.array([34, 30, 27], np.float32) / 255.0, (h, w, 3)).copy()
    alb += (shade * 0.036)[..., None] * np.array([1.0, 0.85, 0.72], np.float32)
    crease = np.clip(-geo * 1.25 - 0.25, 0, 1) * np.clip(1.0 - V, 0, 1) ** 1.2
    alb = mix(alb, np.array([18, 15, 13]) / 255.0, crease * 0.55)
    wr = np.sin(2 * math.pi * (U * 15 + smooth_noise(h, w, 22 * S, 0.35, seed) * 0.5))
    alb += (wr * 0.008 * np.clip(1.0 - V, 0, 1))[..., None]
    tw = ((((cc + rr) // (2 * S)) % 3) == 0).astype(np.float32)
    alb += (tw * 0.008 - 0.004)[..., None]
    sh = np.clip((V - 0.86) / 0.14, 0, 1)
    alb *= (1.0 - 0.28 * sh * sh)[..., None]
    # rust hem band + copper pinline (kept from v8)
    band = np.clip((0.075 - V) * h + 0.5, 0, 1) * np.clip((V - 0.02) * h + 0.5, 0, 1)
    alb = mix(alb, RUST_D, band)
    pin = line((V - 0.088) * h, 0.9 * S)
    alb = mix(alb, COPPER_D, pin)
    dust = np.clip((0.12 - V) / 0.12, 0, 1) * (0.55 + 0.45 * smooth_noise(h, w, 10 * S, 1.0, seed + 3))
    alb = mix(alb, np.array([96, 72, 58]) / 255.0, dust * 0.13)
    edge = np.clip((0.010 - V) * h, 0, 1)
    alb = mix(alb, np.array([12, 10, 9]) / 255.0, edge * 0.8)
    ht = tw * 0.25 + shade * 2.2 - crease * 1.3 + wr * 0.4 * np.clip(1.0 - V, 0, 1)
    ht = np.maximum(ht, band * 0.8 + pin * 1.2)
    put("tails", alb, ht, met=pin * 0.8, glo=0.22 + pin * 0.4,
        ao=0.92 - crease * 0.22 - sh * 0.18 - np.clip(-shade, 0, 1) * 0.20)


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
    # tails box is shared by both side panels whose geometry folds sit half a period apart:
    # paint at the average phase; each panel is then off by 1/16 of the box (soft folds hide it).
    paint_tails(4, 1.57, 61)
    paint_tabard("tab_front", 3, 1.57, 21)       # matches the T5 front panel exactly (folds=3, phase=1.57)
    paint_tabard("tab_back", 4, 0.0, 31)


def save(out):
    os.makedirs(out, exist_ok=True)
    rgb = (np.clip(A, 0, 1) * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([rgb, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_Albedo.png"))
    mg = np.dstack([np.clip(MET, 0, 1), np.clip(GLO, 0, 1), np.clip(AO, 0, 1)])
    mg8 = (mg * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([mg8, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_MetallicGlossAO.png"))
    gy, gx = np.gradient(HT.astype(np.float64))
    k = 0.55 * S
    nx, ny, nz = -gx * k, gy * k, np.ones_like(gx)
    ln = np.sqrt(nx * nx + ny * ny + nz * nz)
    nrm = np.dstack([nx / ln, ny / ln, nz / ln]) * 0.5 + 0.5
    n8 = (nrm * 255 + 0.5).astype(np.uint8)
    Image.fromarray(np.dstack([n8, np.full((N, N), 255, np.uint8)]), "RGBA").save(os.path.join(out, "Trim_Normal.png"))
    Image.fromarray(rgb, "RGB").save(os.path.join(out, "Trim_preview.png"))
    print("TRIM atlas written to", out, N, "x", N)


if __name__ == "__main__":
    build()
    save(os.path.abspath(sys.argv[1]))
