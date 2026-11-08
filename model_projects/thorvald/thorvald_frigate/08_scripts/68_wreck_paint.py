"""Step 3: repaint the cruiser wreck's albedo in the Thorvald look (polished charcoal/gunmetal,
bold copper trim, oxblood bands; no rust, no sand).

    python 68_wreck_paint.py        (needs 04_textures/_wreck_geo.npz from 67_wreck_whole.py)

Every texel is baked with the 3D position + normal of the triangle that covers it, so bands can be
placed along the ship.  The vanilla albedo only contributes its fine detail (panel lines, vents,
scratches) through a high-pass, so the low-frequency sand burn is thrown away.
Copper = thin bright rims of the vanilla paint (bevel bands round each plate), on faces that are seen
from above.  Writes 04_textures/Thorvald_Cruiser_{Albedo,MetallicGlossAO}.png.
"""
import os
import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
SRC = os.path.join(R, "model_inputs", "Structure", "Point_Of_Interest", "SpaceCruiserWreck", "preview_textures")
TEX = os.path.join(PROJ, "04_textures")

CHAR = np.array([0.075, 0.08, 0.09])      # polished charcoal panels
GUN = np.array([0.20, 0.21, 0.23])        # gunmetal rims/raised plates
COPPER = np.array([0.80, 0.33, 0.06])     # burnt orange paint (was copper 0.78,0.42,0.19; user 2026-11-07)
OX = np.array([0.30, 0.06, 0.06])

im = np.asarray(Image.open(os.path.join(SRC, "CrashedShip_Albedo.png")).convert("RGB"), np.float64) / 255
H, W = im.shape[:2]
L = im @ np.array([0.2126, 0.7152, 0.0722])


def blur(a, r):
    img = Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8), "L")
    return np.asarray(img.filter(ImageFilter.GaussianBlur(r)), np.float64) / 255


def morph(mask, size, op):
    img = Image.fromarray((mask * 255).astype(np.uint8))
    f = ImageFilter.MinFilter(size) if op == "erode" else ImageFilter.MaxFilter(size)
    return np.asarray(img.filter(f)) > 127


# ---- bake 3D position / normal per texel ---------------------------------------------
g = np.load(os.path.join(TEX, "_wreck_geo.npz"))
P3 = np.zeros((H, W, 3)); N3 = np.zeros((H, W, 3)); cov = np.zeros((H, W), bool)
for pos, uv, n in zip(g["pos"], g["uv"], g["nrm"]):
    px = np.stack([uv[:, 0] * W, (1 - uv[:, 1]) * H], 1)
    x0, y0 = np.floor(px.min(0)).astype(int); x1, y1 = np.ceil(px.max(0)).astype(int)
    x0, y0 = max(x0, 0), max(y0, 0); x1, y1 = min(x1, W - 1), min(y1, H - 1)
    if x1 < x0 or y1 < y0:
        continue
    ys, xs = np.mgrid[y0:y1 + 1, x0:x1 + 1]
    q = np.stack([xs + 0.5, ys + 0.5], -1)
    a, b, c = px
    v0, v1 = b - a, c - a
    den = v0[0] * v1[1] - v1[0] * v0[1]
    if abs(den) < 1e-9:
        continue
    d = q - a
    l1 = (d[..., 0] * v1[1] - v1[0] * d[..., 1]) / den
    l2 = (v0[0] * d[..., 1] - d[..., 0] * v0[1]) / den
    l0 = 1 - l1 - l2
    ins = (l0 >= -0.02) & (l1 >= -0.02) & (l2 >= -0.02)
    yy, xx = ys[ins], xs[ins]
    P3[yy, xx] = l0[ins, None] * pos[0] + l1[ins, None] * pos[1] + l2[ins, None] * pos[2]
    N3[yy, xx] = n; cov[yy, xx] = True
print("covered %.0f%% of texels" % (100 * cov.mean()))
X, Yab, Z = P3[..., 0], np.abs(P3[..., 1]), P3[..., 2]
nz = N3[..., 2]

# ---- base: charcoal panels / gunmetal rims, keep only fine detail ------------------------
detail = np.clip(L - blur(L, 4), -0.12, 0.12)
blackhole = morph(L < 0.09, 5, "dilate")                 # vanilla burn-through decals: no detail there
detail[blackhole] = 0
# geometry decides the tone: deck plates gunmetal, walls charcoal, underside darker
t_up = np.clip((nz - 0.2) / 0.6, 0, 1)[..., None]
base = GUN[None, None] * t_up + CHAR[None, None] * (1 - t_up)
base[nz < -0.3] = CHAR * 0.8
out = base * (1 + 1.4 * detail[..., None])

# ---- copper: chamfers (faces between deck and wall) = clean trim lines ----------------------
cham = cov & (np.abs(nz) > 0.25) & (np.abs(nz) < 0.88) & (nz > 0)
# plus the vertical lip of every raised plate seen from the side (thin walls high on the hull)
wide = morph(morph(cham, 13, "erode"), 13, "dilate")     # broad sloped plates stay gunmetal...
cham = (cham & ~wide) | (wide & ~morph(wide, 7, "erode"))  # ...with a copper edge round them
out[wide & ~cham] = (GUN * 0.8)[None] * (1 + 1.4 * detail[wide & ~cham, None])
cham = morph(cham, 7, "dilate") & cov & (nz > -0.3)        # bold bands, not hairlines (user: "much too thin")
copper = blur(cham.astype(float), 0.7)
out = out * (1 - copper[..., None]) + (COPPER * (1 + 0.8 * detail[..., None])) * copper[..., None]

# ---- oxblood: two transverse bands across the deck --------------------------------------------
band = cov & (nz > 0.5) & (Z > 2) & (((X > -30) & (X < -23)) | ((X > 20) & (X < 26)))
spine = np.zeros_like(band)
ox = blur((band | spine).astype(float), 1.0)
out = out * (1 - ox[..., None]) + (OX * (1 + 1.2 * detail[..., None])) * ox[..., None]

# ---- engine bells: copper-lipped dark throats ----------------------------------------------
eng = cov & (X > 70) & (np.abs(Yab - 15.3) < 9.5)
out[eng] = out[eng] * 0.55
out = np.clip(out, 0, 1)

# ---- flat swatches for add-on parts (turrets): find an unused 64x64 block --------------------
import json
free = ~morph(cov, 9, "dilate")
SW = None
for y0 in range(0, H - 64, 16):
    for x0 in range(0, W - 64, 16):
        if free[y0:y0 + 64, x0:x0 + 64].all():
            SW = (x0, y0); break
    if SW:
        break
sw = {}
for k, (name, col) in enumerate([("gun", GUN), ("char", CHAR), ("copper", COPPER), ("ox", OX)]):
    x0, y0 = SW[0] + (k % 2) * 32, SW[1] + (k // 2) * 32
    out[y0:y0 + 32, x0:x0 + 32] = col
    sw[name] = [(x0 + 16) / W, 1 - (y0 + 16) / H]          # UV (v up) of the swatch centre
json.dump(sw, open(os.path.join(TEX, "cruiser_swatches.json"), "w"), indent=1)
print("swatches at", SW, sw)
Image.fromarray((out * 255).astype(np.uint8)).save(os.path.join(TEX, "Thorvald_Cruiser_Albedo.png"))

# ---- MetallicGlossAO: R metal, G gloss, B AO (polished hull, shiny copper) -----------------
mg = np.asarray(Image.open(os.path.join(SRC, "CrashedShip_MetallicGlossAO.png")).convert("RGB"), np.float64) / 255
met = np.clip(0.55 - 0.35 * copper, 0, 1)                  # painted trim, not bare metal
gloss = np.clip(0.55 + 0.25 * copper - 0.15 * ox, 0, 1)
ao = mg[..., 2].copy()
ao[~cov] = 1.0                                   # swatches / unused texels: no baked occlusion
x0, y0 = SW
met[y0:y0 + 64, x0:x0 + 64] = 0.6
met[y0 + 32:y0 + 64, x0:x0 + 32] = 0.2           # trim swatch: paint
Image.fromarray((np.stack([met, gloss, ao], -1) * 255).astype(np.uint8)).save(
    os.path.join(TEX, "Thorvald_Cruiser_MetallicGlossAO.png"))
print("copper %.1f%%  oxblood %.1f%%" % (100 * (copper > 0.5).mean(), 100 * (ox > 0.5).mean()))
print("PAINT_OK")
