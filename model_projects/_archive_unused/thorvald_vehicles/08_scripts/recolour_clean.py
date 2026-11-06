"""Clean, factory-new House Thorvald paint for the drone and its twin cannons.  No weathering: the rust colour is PAINT, never corrosion.

    python recolour_clean.py            (system Python: needs PIL + numpy)

1. Cannons (Banshee texture, only inside the cannon's UV polygons from cannon_uv.json):
     bright blue panels  -> solid Thorvald rust-orange paint (the same colour as the drone's wing panels)
     grey / tan metal    -> clean dark gunmetal
   Stains and grime are removed by keeping only the fine detail (panel lines, edges) on top of a flat tone, then compressing the value range.
2. Drone (CombatDrone_Smuggler albedo): the scattered orange / dark-red speckle that reads as rust and wear is removed (small spots only; large
   solid panels - the wings, the rear flap - are kept) and the holes are filled from the surrounding clean panel colour.
"""
import json
import os

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
TEX_B = os.path.join(PROJ, "04_textures", "banshee")
TEX_D = os.path.join(PROJ, "04_textures", "drone")


def hsv(rgb):
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    mx, mn = rgb.max(-1), rgb.min(-1)
    d = mx - mn
    sd = np.where(d > 1e-6, d, 1)
    h = np.zeros_like(mx)
    h = np.where(mx == r, (60 * ((g - b) / sd)) % 360, h)
    h = np.where(mx == g, 60 * ((b - r) / sd) + 120, h)
    h = np.where(mx == b, 60 * ((r - g) / sd) + 240, h)
    h = np.where(d > 1e-6, h, 0)
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0)
    return h, s, mx


def from_hsv(h, s, v):
    h = (h % 360) / 60.0
    i = np.floor(h).astype(int) % 6
    f = h - np.floor(h)
    p, q, t = v * (1 - s), v * (1 - s * f), v * (1 - s * (1 - f))
    r = np.choose(i, [v, q, p, p, t, v])
    g = np.choose(i, [t, v, v, q, p, p])
    b = np.choose(i, [p, p, t, v, v, q])
    return np.stack([r, g, b], -1)


def blur(a, radius):
    im = Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8))
    return np.asarray(im.filter(ImageFilter.GaussianBlur(radius))).astype(np.float32) / 255.0


# ---- the paint colour: sample the drone's own wing panel so the cannons match it exactly ----------------------------------------------
drone = np.asarray(Image.open(os.path.join(TEX_D, "CombatDrone_Smuggler_Albedo.png")).convert("RGB")).astype(np.float32) / 255.0
dh, ds, dv = hsv(drone)
wing = (ds > 0.55) & (dv > 0.45) & (dv < 0.85) & (dh > 5) & (dh < 30)
wing[:, :380] = False                                    # the big rust panels live on the right of the atlas
ys, xs = np.nonzero(wing)
paint = np.median(drone[ys, xs], axis=0) if len(ys) > 200 else np.array([0.66, 0.29, 0.15])
ph, ps, pv = hsv(paint[None, None, :])
ph, ps, pv = float(ph[0, 0]), float(ps[0, 0]), float(pv[0, 0])
print("PAINT colour from the drone wing: rgb(%d,%d,%d)  hsv(%.0f, %.2f, %.2f)  from %d px" % (*(paint * 255), ph, ps, pv, len(ys)))

# ---- 1. cannons ------------------------------------------------------------------------------------------------------------------------------
src = Image.open(os.path.join(TEX_B, "Banshee_Albedo.png")).convert("RGB")
W, H = src.size
polys = json.load(open(os.path.join(TEX_B, "cannon_uv.json")))
mask_im = Image.new("L", (W, H), 0)
dr = ImageDraw.Draw(mask_im)
for poly in polys:
    dr.polygon([(u % 1.0 * W, (1 - v % 1.0) * H) for u, v in poly], fill=255)
mask_im = mask_im.filter(ImageFilter.MaxFilter(5))        # cover the seams
mask = np.asarray(mask_im) > 0
a = np.asarray(src).astype(np.float32) / 255.0
h, s, v = hsv(a)
blue = mask & (h > 185) & (h < 265) & (s > 0.30)
metal = mask & ~blue
out = a.copy()


def flat_tone(v_in, sel, mid, span, detail_gain=1.0, radius=2.2):
    """Value for a class: a flat `mid` plus only the fine detail (edges, panel lines) of the source, clipped to +-span."""
    low = blur(np.where(sel, v_in, np.median(v_in[sel])), radius)
    detail = (v_in - low) * detail_gain
    return np.clip(mid + np.clip(detail, -span, span), 0.02, 1.0)


# paint panels: solid rust-orange, shaded only by the source's edge detail
tv = flat_tone(v, blue, pv, 0.12, 1.4)
paint_rgb = from_hsv(np.full_like(h, ph), np.full_like(h, ps), tv)
out[blue] = paint_rgb[blue]
# metal: clean dark gunmetal, a touch warmer than neutral so it sits with the black-and-copper palette
mv = flat_tone(v, metal, 0.26, 0.16, 1.2)
metal_rgb = from_hsv(np.full_like(h, 24.0), np.full_like(h, 0.10), mv)
out[metal] = metal_rgb[metal]
# the light parts of the source metal (white-ish plates) become the lighter clean plate tone, not dirt
plate = metal & (v > np.percentile(v[metal], 72)) & (s < 0.25)
plate = np.asarray(Image.fromarray((plate * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(3)).filter(ImageFilter.MaxFilter(3))) > 0
plate &= metal                                                    # opened: no isolated specks, so the paint reads as whole panels, not streaks
pt = flat_tone(v, plate, pv, 0.025, 0.4)                          # flat factory paint: almost no tonal variation inside a panel
pl = from_hsv(np.full_like(h, ph), np.full_like(h, ps), pt)      # the same rust paint as the drone's wings
out[plate] = pl[plate]
Image.fromarray((np.clip(out, 0, 1) * 255 + 0.5).astype(np.uint8), "RGB").save(os.path.join(TEX_B, "Banshee_Thorvald_Albedo.png"))
print("CANNON texture: blue->paint %d px, metal %d px (of %d in the UV mask)" % (blue.sum(), metal.sum(), mask.sum()))

# ---- 2. drone: remove speckle, keep solid panels ---------------------------------------------------------------------------------------------
bright = (ds > 0.55) & (dv > 0.72) & (dh > 8) & (dh < 45)         # the bright orange splatter (and its anti-aliased edges): always removed
grime = (ds > 0.30) & (dv < 0.38) & (dh > 0) & (dh < 30)          # dark red-brown stains: always removed
paintc = (ds > 0.55) & (dv > 0.40) & (dv < 0.78) & (dh > 5) & (dh < 32)   # the real paint colour (wings, rear flap)
op = np.asarray(Image.fromarray((paintc * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(9)).filter(ImageFilter.MaxFilter(11))) > 0
solid = op & paintc                                               # only WIDE regions of paint colour are kept as panels
cand = bright | grime | paintc
speck = bright | grime | (paintc & ~solid)
speck = np.asarray(Image.fromarray((speck * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(3))) > 0
speck &= ~solid
valid = (~speck).astype(np.float32)
filled = drone.copy()
for rad in (3, 6, 12, 24):                                         # fill the holes from the nearest clean pixels, widening until none are left
    num = np.stack([blur(drone[..., c] * valid, rad) for c in range(3)], -1)
    den = blur(valid, rad)[..., None]
    est = num / np.maximum(den, 1e-4)
    use = speck & (den[..., 0] > 0.05)
    filled[use] = est[use]
    valid = np.where(use, 1.0, valid)
    speck &= ~use
Image.fromarray((np.clip(filled, 0, 1) * 255 + 0.5).astype(np.uint8), "RGB").save(os.path.join(TEX_D, "CombatDrone_Thorvald_Clean_Albedo.png"))
print("DRONE texture: %d candidate px, %d kept as solid panels, speckle removed %d px" % (cand.sum(), solid.sum(), (bright | grime | (paintc & ~solid)).sum()))
