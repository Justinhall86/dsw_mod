"""Paint the House Thorvald tower shield's albedo (textures/Shield_Albedo.png, 2048) from the shared shapes (shield_shape.py) and make_shield.py's
UV layout: front faces planar on u 0..0.48, back faces on u 0.48..0.96 (mirrored), copper wall column u 0.965..1, dark walls at its bottom.

    python paint_shield.py

The sheet's shield: dark weathered steel; worn copper on the bevelled rim, the stepped inner frame, the slot frame, the gear, star and bolts,
each with a lit top edge and a dark foot; the emblem sits in a near-black disc; rust grime along the frames (heavier low down), rust streaks
running down from the bolts, deep slash gouges and fine scratches.  The back: the same steel with the copper rim, leather grip and straps.
"""
import math
import os
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import shield_shape as S  # noqa: E402

N = 2048
UV_W, UV_H = 0.30, 0.62
SU = 0.48 / (2 * UV_W)
STEEL = np.array((42, 41, 42), float)
COPPER = np.array((112, 56, 33), float)
COPPER_HI = np.array((176, 104, 64), float)
RUST = np.array((92, 42, 22), float)
DARK = np.array((20, 19, 19), float)
LEATHER = np.array((52, 36, 27), float)
rng = np.random.default_rng(7)


def px(x, z, back=False):
    u = 0.48 + (UV_W - x) * SU if back else (x + UV_W) * SU
    v = 0.5 + 0.5 * z / UV_H
    return (u * N, (1.0 - v) * N)


M = lambda m: m * SU * N


def poly_mask(poly, back=False, blur=0.0):
    im = Image.new("L", (N, N), 0)
    ImageDraw.Draw(im).polygon([px(x, z, back) for x, z in poly], fill=255)
    if blur:
        im = im.filter(ImageFilter.GaussianBlur(blur))
    return np.asarray(im, float) / 255.0


def line_mask(poly, width_m, back=False, closed=True, blur=0.0):
    im = Image.new("L", (N, N), 0)
    pts = [px(x, z, back) for x, z in poly] + ([px(*poly[0], back)] if closed else [])
    ImageDraw.Draw(im).line(pts, fill=255, width=max(1, int(M(width_m))), joint="curve")
    if blur:
        im = im.filter(ImageFilter.GaussianBlur(blur))
    return np.asarray(im, float) / 255.0


def noise(scale, amp, stretch=1):
    n = rng.normal(0, 1, (N // scale + 2, max(2, N // (scale * stretch) + 2)))
    im = Image.fromarray(((n - n.min()) / (np.ptp(n) + 1e-9) * 255).astype(np.uint8)).resize((N, N), Image.BICUBIC)
    return (np.asarray(im, float) / 255.0 - 0.5) * 2 * amp


def lay(img, mask, col):
    m = np.clip(mask, 0, 1)[..., None]
    return img * (1 - m) + np.asarray(col, float) * m


img = np.zeros((N, N, 3)) + STEEL
img += (noise(128, 12) + noise(32, 7) + noise(8, 3))[..., None]
img += np.clip(noise(64, 1.0) - 0.45, 0, 1)[..., None] * 30          # lighter worn blotches
img += noise(4, 5, stretch=24)[..., None] * 0.8          # brushed, vertical streaks (along z)
cu_noise = (noise(48, 16) + noise(12, 8) + noise(3, 4))[..., None]
O = S.outline()
for back in (False, True):
    rim = np.clip(poly_mask(O, back) - poly_mask(S.offset(O, S.RIM), back), 0, 1)
    img = lay(img, rim, COPPER + cu_noise)
    img = lay(img, line_mask(S.offset(O, 0.012), 0.004, back, blur=1.5) * 0.7, COPPER_HI)        # lit outer bevel edge
    img = lay(img, line_mask(S.offset(O, S.RIM - 0.010), 0.003, back, blur=1.2) * 0.55, COPPER_HI)
    img = lay(img, line_mask(O, 0.004, back, blur=1.0) * 0.6, RUST * 0.6)                          # dark worn outer edge
    img = lay(img, line_mask(S.offset(O, S.RIM + 0.004), 0.010, back, blur=3) * 0.65, DARK)       # shadow at the rim's foot
    # slot frame + opening
    sf = np.clip(poly_mask(S.slot_outer(), back) - poly_mask(S.slot_inner(), back), 0, 1)
    img = lay(img, sf, COPPER + cu_noise)
    img = lay(img, poly_mask(S.slot_inner(), back), DARK * 0.6)
    if back:
        continue
    # inner stepped frame
    P = S.PANEL
    img = lay(img, line_mask(S.offset(P, -0.004), 0.010, blur=4) * 0.6, DARK)                          # drop shadow outside the ribbon
    fr = np.clip(poly_mask(P) - poly_mask(S.offset(P, S.FRAME_W)), 0, 1)
    img = lay(img, fr, COPPER + cu_noise)
    img = lay(img, line_mask(S.offset(P, 0.002), 0.003, blur=1.0) * 0.6, COPPER_HI)
    img = lay(img, line_mask(S.offset(P, S.FRAME_W - 0.002), 0.003, blur=1.0) * 0.5, RUST * 0.7)
    # emblem: near-black disc with a thin copper lip, gear ring with a hole, star
    c = S.EMBLEM_C
    img = lay(img, poly_mask(S.circle(c, S.DISC_R + 0.004, 48), blur=3) * 0.7, DARK)
    img = lay(img, poly_mask(S.circle(c, S.DISC_R, 48)), DARK + noise(16, 4)[..., None])
    img = lay(img, line_mask(S.circle(c, S.DISC_R - 0.002, 48), 0.003, blur=1) * 0.6, COPPER * 0.8)
    img = lay(img, poly_mask(S.gear(), blur=2.5) * 0.8, DARK * 0.5)                                    # gear shadow on the disc
    gear = np.clip(poly_mask(S.gear()) - poly_mask(S.circle(c, S.GEAR_HOLE, 40)), 0, 1)
    img = lay(img, gear, COPPER * 1.08 + cu_noise)
    img = lay(img, line_mask(S.offset(S.gear(), 0.002), 0.003, blur=1) * 0.55, COPPER_HI)
    img = lay(img, poly_mask(S.star()), COPPER_HI * 0.95 + cu_noise * 0.6)
    img = lay(img, line_mask(S.star(), 0.002, blur=0.8) * 0.5, RUST * 0.7)
    # rust grime inside the frames, heavier low down
    zz = np.linspace(1, 0, N)[:, None] * np.ones((1, N))                      # 1 at the top of the texture
    low = np.clip(1.15 - zz * 1.3, 0.25, 1.0)
    g = (line_mask(S.offset(O, S.RIM + 0.012), 0.045, blur=14) + line_mask(S.offset(P, -0.008), 0.03, blur=10) * 0.7)
    g = np.clip(g * np.clip(0.5 + noise(20, 0.7), 0, 1) * low, 0, 1)
    img = lay(img, g * 0.6, RUST)
    patches = np.clip(noise(40, 1.0) + noise(10, 0.45) - 0.42, 0, 1) * 1.8 * poly_mask(S.offset(O, S.RIM))
    img = lay(img, patches * 0.6, RUST * 0.9)
    # bright edge wear on the steel along the raised frames
    img = lay(img, line_mask(S.offset(P, -0.003), 0.004, blur=1.2) * np.clip(0.4 + noise(6, 0.8), 0, 1) * 0.5, (110, 108, 104))

# bolts: copper domes with a lit spot, rust streaks running down from them
pil = Image.fromarray(np.clip(img, 0, 255).astype(np.uint8))
streak = Image.new("L", (N, N), 0)
ds = ImageDraw.Draw(streak)
for x, z, where in S.bolts():
    if rng.random() < 0.55:
        x0, y0 = px(x, z)
        ln = M(rng.uniform(0.03, 0.09))
        ds.line([(x0, y0), (x0 + rng.normal(0, 2), y0 + ln)], fill=int(rng.uniform(90, 170)), width=int(M(0.006)))
streak = np.asarray(streak.filter(ImageFilter.GaussianBlur(4)), float) / 255.0
img = lay(np.asarray(pil, float), streak * 0.7, RUST)
pil = Image.fromarray(np.clip(img, 0, 255).astype(np.uint8))
d = ImageDraw.Draw(pil)
for x, z, where in S.bolts():
    for back in ((False,) if where == "frame" else (False, True)):
        cx, cy = px(x, z, back)
        r = M(S.BOLT_R)
        d.ellipse([cx - r - 2, cy - r - 2, cx + r + 2, cy + r + 2], fill=tuple(int(c) for c in DARK))
        d.ellipse([cx - r, cy - r, cx + r, cy + r], fill=tuple(int(c) for c in COPPER * 1.1))
        d.ellipse([cx - r * 0.55, cy - r * 0.65, cx - r * 0.05, cy - r * 0.15], fill=tuple(int(c) for c in COPPER_HI))
# deep slash gouges (dark cut, lit lower lip) + fine scratches on the steel
for _ in range(9):
    x, z = rng.uniform(-0.15, 0.12), rng.uniform(-0.45, -0.05)    # below the emblem
    a, ln = rng.uniform(math.radians(20), math.radians(70)) * rng.choice((1, -1)), rng.uniform(0.06, 0.16)
    p0, p1 = px(x, z), px(x + ln * math.cos(a), z + ln * math.sin(a))
    d.line([p0, p1], fill=(12, 11, 11), width=6)
    d.line([(p0[0] + 3, p0[1] + 4), (p1[0] + 3, p1[1] + 4)], fill=(120, 116, 110), width=2)
for _ in range(220):
    back = rng.random() < 0.35
    x, z = rng.uniform(-0.23, 0.23), rng.uniform(-0.53, 0.53)
    a, ln = rng.uniform(0, math.pi), rng.uniform(0.01, 0.06)
    c = int(rng.uniform(55, 82))
    d.line([px(x, z, back), px(x + ln * math.cos(a), z + ln * math.sin(a), back)], fill=(c, c - 1, c - 3), width=1)
# back: leather grip and straps over the strap bars (see make_shield.py)
for (x0, x1, z0, z1) in ((-0.022, 0.022, -0.075, 0.075), (-0.14, 0.14, 0.17, 0.205), (-0.14, 0.14, -0.30, -0.265)):
    zc0, zc1 = z0 - S.Z0, z1 - S.Z0
    a_, b_ = px(x1, zc1, True), px(x0, zc0, True)
    d.rectangle([a_[0], a_[1], b_[0], b_[1]], fill=tuple(int(c) for c in LEATHER))
# side walls: worn copper column; dark walls (slot tunnel) at its bottom
col = np.asarray(pil, float)
x0 = int(0.965 * N)
col[:, x0:] = COPPER * 0.8 + (noise(16, 12)[:, x0:, None])
col[int(0.96 * N):, x0:] = DARK
pil = Image.fromarray(np.clip(col, 0, 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(0.7))
pil.save(os.path.join(HERE, "textures", "Shield_Albedo.png"))
print("SAVED textures/Shield_Albedo.png", pil.size)
