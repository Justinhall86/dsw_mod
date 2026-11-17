"""Heavy Vanguard tower shield: break up the flat gunmetal (owner 2026-11-13 "too artificial").
Runs AFTER ground_recolour.py on a recoloured CharMOD folder:
    python shield_detail.py <Male01_ThorvaldElite dir>
 - two-tone panels (outer band darker, inner plate lighter, back face mid), mottled low/mid-frequency wear, bottom grime
 - AO just inside every copper frame, bevel light/shadow on the copper frames
 - two riveted horizontal seams across the inner front plate
 - a real normal map from the same height field (frames + rivets raised, seams recessed); was flat 128,128,255
Seeds are in the 1024 UV layout of ThEliTowerShield (front face left, back face right, rim strip at the far right)."""
import os, sys
import numpy as np
from PIL import Image, ImageDraw, ImageFilter

D = sys.argv[1]
AP, NP = os.path.join(D, "ThEliTowerShield_Albedo.png"), os.path.join(D, "ThEliTowerShield_Normal.png")
im = Image.open(AP).convert("RGB"); W, H = im.size; k = W / 1024
a = np.asarray(im).astype(float)
r, g, b = a[..., 0], a[..., 1], a[..., 2]; v = a.max(-1) / 255
cu = (r > g + 18) & (g > b - 6) & (v > 0.22)                       # copper frames, rivets, emblem
# the ORIGINAL shield paint tells frames (sat > .6, bright) from rust grime (dull brown) - grime goes back to plate
ORIG = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
                    "thorvald_elite", "Final", "game_files", "CharMOD", "Male01_ThorvaldElite", "ThEliTowerShield_Albedo.png")
oa = np.asarray(Image.open(ORIG).convert("RGB").resize((W, H))).astype(float) / 255
omx, omn = oa.max(-1), oa.min(-1)
cu &= ((omx - omn) / np.maximum(omx, 1e-6) > 0.45) & (omx > 0.28)
grime_px = (r > g + 18) & ~cu                                          # these were turned copper by the recolour
a[grime_px] = (oa[grime_px] * 255).mean(-1, keepdims=True) * 0.9      # neutral, ~original value
cu0 = Image.fromarray((cu * 255).astype(np.uint8))
# drop rust-smudge flecks (the old paint's grime turned copper): keep only what survives an opening, regrown
o = int(7 * k) | 1
cu = cu & (np.asarray(cu0.filter(ImageFilter.MinFilter(o)).filter(ImageFilter.MaxFilter(o + 4))) > 127)
cuI = Image.fromarray((cu * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(3))

def region(seed):
    m = cuI.copy(); ImageDraw.floodfill(m, (int(seed[0] * k), int(seed[1] * k)), 128, thresh=10)
    return np.asarray(m) == 128
outer, inner, back = region((60, 500)), region((260, 760)), region((740, 840))
rng = np.random.default_rng(7)
def noise(n, blur):
    x = Image.fromarray((rng.random((n, n)) * 255).astype(np.uint8)).resize((W, H), Image.BICUBIC).filter(ImageFilter.GaussianBlur(blur * k))
    return np.asarray(x).astype(float) / 255 - 0.5
mott = 0.22 * noise(12, 6) + 0.12 * noise(48, 2) + 0.05 * noise(256, 0.6)
yy = np.linspace(0, 1, H)[:, None] * np.ones((1, W))

hx = lambda h: np.array([int(h[i:i + 2], 16) for i in (1, 3, 5)], float)
out = a.copy()
luma = a.mean(-1)
for m, col in ((outer, hx("#262E33")), (inner, hx("#3A4349")), (back, hx("#2F383D"))):
    rel = np.clip(luma / max(np.median(luma[m]), 1), 0.55, 1.6)       # keep painted scratches
    grime = 1 - 0.22 * np.clip((yy - 0.72) / 0.28, 0, 1)
    c = col * (rel * (1 + mott) * grime)[..., None]
    keep = v < 0.07                                                    # slot hole, emblem backing stay black
    sel = m & ~keep
    out[sel] = c[sel]
# AO inside frames
near = np.asarray(cuI.filter(ImageFilter.GaussianBlur(7 * k))).astype(float) / 255
ao = 1 - 0.55 * np.clip(near * 2.2, 0, 1)
out[~cu] *= ao[~cu][:, None]
# copper bevel: light on top-left edges, shadow on bottom-right
cuf = cu.astype(float)
sh = lambda x, dx, dy: np.roll(np.roll(x, dy, 0), dx, 1)
lit = np.clip(cuf - sh(cuf, 2, 2), 0, 1); dark = np.clip(cuf - sh(cuf, -2, -2), 0, 1)
out[..., :] *= (1 + 0.35 * lit - 0.35 * dark)[..., None]
# seams + rivets on the inner plate
height = np.asarray(cuI.filter(ImageFilter.GaussianBlur(1.5 * k))).astype(float) / 255 + 0.15 * inner
seamI = Image.new("L", (W, H), 0); rivI = Image.new("L", (W, H), 0)
ds, dr = ImageDraw.Draw(seamI), ImageDraw.Draw(rivI)
cols = np.where(inner.any(0))[0]
for y0 in (600, 790):
    y = int(y0 * k); row = np.where(inner[y])[0]
    if len(row) < 10: continue
    x0, x1 = row.min() + int(6 * k), row.max() - int(6 * k)
    ds.line([(x0, y), (x1, y)], fill=255, width=max(2, int(3 * k)))
    for x in np.linspace(x0 + 14 * k, x1 - 14 * k, 6):
        for yy_ in (y - 9 * k, y + 9 * k):
            dr.ellipse([x - 3.5 * k, yy_ - 3.5 * k, x + 3.5 * k, yy_ + 3.5 * k], fill=255)
seam = np.asarray(seamI).astype(float) / 255 * inner; riv = np.asarray(rivI.filter(ImageFilter.GaussianBlur(0.8 * k))).astype(float) / 255 * inner
below = sh(seam, 0, max(2, int(3 * k))) * (1 - seam)
out *= (1 - 0.6 * seam)[..., None]; out *= (1 + 0.28 * below)[..., None]
rivcol = hx("#6A7177")[None, None, :] * (0.8 + 0.4 * sh(riv, -1, -1))[..., None]
out = out * (1 - riv[..., None]) + rivcol * riv[..., None]
height = height - 0.5 * seam + 0.6 * riv
Image.fromarray(np.clip(out, 0, 255).astype(np.uint8)).save(AP)
# normal map from height (OpenGL-style, +Y up)
hgt = np.asarray(Image.fromarray((np.clip(height, 0, 1.5) / 1.5 * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(1.0 * k))).astype(float) / 255
gx = np.gradient(hgt, axis=1); gy = np.gradient(hgt, axis=0); s = 6.0
n = np.dstack([-gx * s, gy * s, np.ones_like(hgt)]); n /= np.linalg.norm(n, axis=-1, keepdims=True)
nm = ((n * 0.5 + 0.5) * 255).astype(np.uint8)
Image.fromarray(np.dstack([nm, np.full((H, W), 255, np.uint8)]), "RGBA").save(NP)
print("SHIELD detailed: outer %d inner %d back %d px" % (outer.sum(), inner.sum(), back.sum()))
