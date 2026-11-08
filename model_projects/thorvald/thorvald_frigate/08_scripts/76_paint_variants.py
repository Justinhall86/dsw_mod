"""Five Kraken-style colour variants of the cruiser: whole burnt-orange PANELS instead of orange trim,
light steel bevels (as on the Kraken), no oxblood stripes, plus five grey treatments. Each variant
pairs one orange scheme (A-E) with one grey scheme (1-5) so they can be mixed afterwards
("orange from A, greys from 4").

    python 76_paint_variants.py [A1,B2,...]    (default A1,B2,C3,D4,E5)
Writes 04_textures/variants/<code>_{Albedo,MetallicGlossAO}.png (swatch block refreshed per variant).
Panel ids come from 75_panels.py (PANEL_MAP.png).
"""
import json, os, sys
import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
SRC = os.path.join(R, "model_inputs", "Structure", "Point_Of_Interest", "SpaceCruiserWreck", "preview_textures")
TEX = os.path.join(PROJ, "04_textures")
OUT = os.path.join(TEX, "variants"); os.makedirs(OUT, exist_ok=True)

ORANGE = np.array([0.80, 0.33, 0.06])
ORANGE_SCHEMES = {          # whole panels (mirror pairs), from PANEL_MAP.png
    "A": ("Sponsons", [179, 126]),                    # the two shoulder decks the cannons stand on
    "B": ("Prow", [430, 90, 448]),                    # nose wedge top + its two cheeks
    "C": ("Dorsal deck", [376]),                      # the big raised aft deck
    "D": ("Flank slopes", [107, 106]),                # long sloped strips down both sides
    "E": ("Fore pods", [326, 304]),                   # the two forward pod roofs
}
# deck / wall / underside / bevel greys (albedo, sRGB-ish values like the vanilla textures)
GREY_SCHEMES = {
    "1": ("Kraken two-tone", dict(deck=0.38, wall=0.20, under=0.10, bevel=0.55)),
    "2": ("Charcoal outline", dict(deck=0.30, wall=0.20, under=0.10, bevel=0.48, outline=0.075)),
    "3": ("Charcoal well", dict(deck=0.30, wall=0.21, under=0.10, bevel=0.48, well=0.085)),
    "4": ("Charcoal plates", dict(deck=0.30, wall=0.21, under=0.10, bevel=0.48, plates=0.085)),
    "5": ("One tone", dict(deck=0.25, wall=0.25, under=0.13, bevel=0.42)),
    # user 2026-11-08: inverted - matte black is the primary tone, charcoal the secondary
    "6": ("Black + charcoal outline", dict(deck=0.045, wall=0.05, under=0.04, bevel=0.26, outline=0.17, matte=True)),
    "7": ("Black + charcoal well", dict(deck=0.045, wall=0.05, under=0.04, bevel=0.26, well=0.17, matte=True)),
    "8": ("Black + charcoal plates", dict(deck=0.045, wall=0.05, under=0.04, bevel=0.26, plates=0.17, matte=True)),
}
WELL = [429, 415]                       # sunken main deck + its floor
PLATES = [437, 421, 351, 14, 87]        # raised centre plates down the spine


def blur(a, r):
    img = Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8), "L")
    return np.asarray(img.filter(ImageFilter.GaussianBlur(r)), np.float64) / 255


def morph(mask, size, op):
    img = Image.fromarray((mask * 255).astype(np.uint8))
    f = ImageFilter.MinFilter(size) if op == "erode" else ImageFilter.MaxFilter(size)
    return np.asarray(img.filter(f)) > 127


im = np.asarray(Image.open(os.path.join(SRC, "CrashedShip_Albedo.png")).convert("RGB"), np.float64) / 255
mg = np.asarray(Image.open(os.path.join(SRC, "CrashedShip_MetallicGlossAO.png")).convert("RGB"), np.float64) / 255
H, W = im.shape[:2]
L = im @ np.array([0.2126, 0.7152, 0.0722])

# ---- bake 3D position / normal / triangle id per texel ------------------------------------------
g = np.load(os.path.join(TEX, "_wreck_geo.npz"))
pid = np.load(os.path.join(TEX, "_wreck_panels.npz"))["pid"]
P3 = np.zeros((H, W, 3)); N3 = np.zeros((H, W, 3)); TID = -np.ones((H, W), int)
for t, (pos, uv, n) in enumerate(zip(g["pos"], g["uv"], g["nrm"])):
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
    N3[yy, xx] = n; TID[yy, xx] = t
cov = TID >= 0
PID = np.where(cov, pid[np.maximum(TID, 0)], -1)
X, Y, Z = P3[..., 0], P3[..., 1], P3[..., 2]
nz = N3[..., 2]

detail = np.clip(L - blur(L, 4), -0.12, 0.12)
detail[morph(L < 0.09, 5, "dilate")] = 0
cham = cov & (np.abs(nz) > 0.25) & (np.abs(nz) < 0.88) & (nz > 0)
wide = morph(morph(cham, 13, "erode"), 13, "dilate")
bevel = (cham & ~wide) | (wide & ~morph(wide, 7, "erode"))
bevel = morph(bevel, 3, "dilate") & cov & (nz > -0.3)

# exterior outline: deck texels near the ship's top-view silhouette edge
from PIL import ImageDraw
SC = 4
x0w, y0w = g["pos"][..., 0].min() - 2, g["pos"][..., 1].min() - 2
sil = Image.new("L", (int((g["pos"][..., 0].max() - x0w + 2) * SC), int((g["pos"][..., 1].max() - y0w + 2) * SC)), 0)
dr = ImageDraw.Draw(sil)
for pos in g["pos"]:
    dr.polygon([((p[0] - x0w) * SC, (p[1] - y0w) * SC) for p in pos], fill=255)
sil = np.asarray(sil) > 127
inner = np.asarray(Image.fromarray((sil * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(2 * int(6 * SC) + 1))) > 127
sx = np.clip(((X - x0w) * SC).astype(int), 0, sil.shape[1] - 1)
sy = np.clip(((Y - y0w) * SC).astype(int), 0, sil.shape[0] - 1)
near_edge = cov & ~inner[sy, sx] & (nz > 0.2)


def paint(ocode, gcode):
    """ocode may combine schemes, e.g. 'AD' = sponsons + flank slopes."""
    oname = " + ".join(ORANGE_SCHEMES[c][0] for c in ocode)
    opanels = [p for c in ocode for p in ORANGE_SCHEMES[c][1]]
    gname, gs = GREY_SCHEMES[gcode]
    sec = next((gs[k] for k in ("outline", "well", "plates") if k in gs), gs["deck"])
    t_up = np.clip((nz - 0.2) / 0.6, 0, 1)
    tone = gs["deck"] * t_up + gs["wall"] * (1 - t_up)
    tone = np.where(nz < -0.3, gs["under"], tone)
    if "well" in gs:
        tone = np.where(np.isin(PID, WELL), gs["well"], tone)
    if "plates" in gs:
        tone = np.where(np.isin(PID, PLATES), gs["plates"], tone)
    if "outline" in gs:
        tone = np.where(near_edge, gs["outline"], tone)
    tone = np.where(bevel, gs["bevel"], tone)
    base = np.stack([tone * 0.97, tone, tone * 1.06], -1)          # faint cool steel cast
    orange = cov & np.isin(PID, opanels) & ~bevel
    oa = blur(orange.astype(float), 0.8)
    base = base * (1 - oa[..., None]) + ORANGE[None, None] * oa[..., None]
    out = base * (1 + 1.4 * detail[..., None])
    eng = cov & (X > 70) & (np.abs(np.abs(Y) - 15.3) < 9.5)
    out[eng] *= 0.55
    out = np.clip(out, 0, 1)
    # swatches for the turrets: gun = deck grey, char = wall grey, copper = orange, ox = bevel
    sw = json.load(open(os.path.join(TEX, "cruiser_swatches.json")))
    cols = {"gun": sec if gs.get("matte") else gs["deck"], "char": gs["wall"], "copper": ORANGE, "ox": gs["bevel"]}
    for name, (u, v) in sw.items():
        cx, cy = int(u * W), int((1 - v) * H)
        c = cols[name]
        out[cy - 16:cy + 16, cx - 16:cx + 16] = c if np.ndim(c) else [c * 0.97, c, c * 1.06]
    hull_met, hull_gloss = (0.2, 0.28) if gs.get("matte") else (0.55, 0.55)
    met = np.where(oa > 0.5, 0.2, np.where(bevel, 0.75, hull_met))
    gloss = np.where(oa > 0.5, 0.45, np.where(bevel, 0.7, hull_gloss))
    ao = mg[..., 2].copy(); ao[~cov] = 1.0
    for name, (u, v) in sw.items():
        cx, cy = int(u * W), int((1 - v) * H)
        met[cy - 16:cy + 16, cx - 16:cx + 16] = 0.2 if name == "copper" else 0.6
    code = ocode + gcode
    Image.fromarray((out * 255).astype(np.uint8)).save(os.path.join(OUT, code + "_Albedo.png"))
    Image.fromarray((np.stack([met, gloss, ao], -1) * 255).astype(np.uint8)).save(os.path.join(OUT, code + "_MetallicGlossAO.png"))
    print("%s  orange=%s (%.1f%% of hull texels)  grey=%s" % (code, oname, 100 * orange.sum() / cov.sum(), gname))


codes = sys.argv[1].split(",") if len(sys.argv) > 1 else ["A1", "B2", "C3", "D4", "E5"]
for c in codes:
    paint(c[:-1], c[-1])
names = {"orange": {k: v[0] for k, v in ORANGE_SCHEMES.items()}, "grey": {k: v[0] for k, v in GREY_SCHEMES.items()}}
for c in codes:
    names["orange"][c[:-1]] = " + ".join(ORANGE_SCHEMES[x][0] for x in c[:-1])
json.dump(names,
          open(os.path.join(OUT, "names.json"), "w"), indent=1)
print("VARIANTS_OK")
