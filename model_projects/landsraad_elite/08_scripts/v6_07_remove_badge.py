"""v6: paint Gurney's shoulder badge out of the pad textures (albedo + normal + gloss/AO) so the pad is smooth.

  python 08_scripts/v6_07_remove_badge.py

The badge sits on the pad's armour plate (texture pixels ~x 405-475, y 200-258 of the 512 map): a gold shield in the
albedo, an embossed bevel in the normal map and an outline in the metallic/gloss/AO map - removing only the albedo
would leave the bump visible in the light. The mask is found from the gold shield itself (gold pixels inside the
search box, holes filled, grown a few pixels to include the bevel); each map is then inpainted from the surrounding
plate (OpenCV Telea) and lightly smoothed inside the patch so no seam shows.
Inputs : recoloured albedo (v5_kitbash), the game's own Gurney normal + MetallicGlossAO.
Outputs: 04_textures/v6_pads_nobadge/ElitePads_*.png and the staged CharMOD copies + 06_game_ready/v6_G1 copies.
"""
import os
import shutil

import cv2
import numpy as np
from PIL import Image

LE = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
GUR = r"C:\dsw_mod\extr\Character\Atreide\Unit\Gurney\Gurney"
ALB = os.path.join(LE, "04_textures", "v5_kitbash", "gurney_parts_landsraad_Albedo.png")
OUT = os.path.join(LE, "04_textures", "v6_pads_nobadge")
STAGED = r"C:\dsw_mod\D4XEditor\res\res\CharMOD\Male01_LandsraadEliteG1"
GAME_READY = os.path.join(LE, "06_game_ready", "v6_G1")
SEARCH = (400, 196, 480, 262)          # x0, y0, x1, y1 of the box that contains the badge and nothing else gold
os.makedirs(OUT, exist_ok=True)

alb = np.array(Image.open(ALB).convert("RGB"))
nrm = np.array(Image.open(GUR + "_Normal.png").convert("RGB"))
mga = np.array(Image.open(GUR + "_MetallicGlossAO.png").convert("RGB"))
H, W = alb.shape[:2]

hsv = cv2.cvtColor(alb, cv2.COLOR_RGB2HSV)            # OpenCV hue 0-179: gold ~ 15-28
gold = (hsv[..., 0] >= 12) & (hsv[..., 0] <= 32) & (hsv[..., 1] > 90) & (hsv[..., 2] > 120)
box = np.zeros((H, W), bool)
x0, y0, x1, y1 = SEARCH
box[y0:y1, x0:x1] = True
core = (gold & box).astype(np.uint8)
# keep only the badge + the stray gold dot under it: connected components whose centre is below the gold band above
n, lab, stats, cent = cv2.connectedComponentsWithStats(core, connectivity=8)
keep = [i for i in range(1, n) if cent[i][1] > 215 and stats[i][cv2.CC_STAT_AREA] > 3]
print("gold blobs in the search box:", [(i, tuple(int(c) for c in cent[i]), int(stats[i][cv2.CC_STAT_AREA])) for i in range(1, n)], "-> kept", keep)
core = np.isin(lab, keep).astype(np.uint8)
cnts, _ = cv2.findContours(core, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
filled = np.zeros_like(core)
cv2.drawContours(filled, cnts, -1, 1, thickness=cv2.FILLED)          # fills the engraved pale lines inside the shield
print("badge pixels (gold, holes filled):", int(filled.sum()), "in", len(cnts), "blobs")


def grow(mask, px):
    k = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2 * px + 1, 2 * px + 1))
    return cv2.dilate(mask, k)


m_alb = grow(filled, 2)
m_nrm = grow(filled, 4)            # the bevel / emboss extends a little past the gold shape
ys, xs = np.nonzero(m_nrm)
print("normal-map patch bbox:", xs.min(), ys.min(), xs.max(), ys.max())


def paint(img, mask, radius=5, smooth=3):
    out = cv2.inpaint(img, (mask * 255).astype(np.uint8), radius, cv2.INPAINT_TELEA)
    # soften only inside the patch (+1px) so the filled area has no streaks
    blur = cv2.GaussianBlur(out, (0, 0), smooth)
    soft = grow(mask, 1).astype(bool)
    out = out.copy()
    out[soft] = blur[soft]
    return out


alb2 = paint(alb, m_alb)
nrm2 = paint(nrm, m_nrm, 6, 4)
mga2 = paint(mga, m_nrm, 6, 4)

# normals: renormalise vectors inside the patch (blur shortens them)
v = nrm2.astype(np.float32) / 127.5 - 1.0
sel = grow(m_nrm, 1).astype(bool)
ln = np.maximum(np.linalg.norm(v[sel], axis=1, keepdims=True), 1e-6)
v[sel] = v[sel] / ln
nrm2 = np.clip((v * 127.5 + 127.5), 0, 255).astype(np.uint8)


def save_rgba(arr, name):
    im = Image.fromarray(arr).convert("RGBA")
    im.putalpha(255)
    p = os.path.join(OUT, name)
    im.save(p)
    for d in (STAGED, GAME_READY):
        shutil.copyfile(p, os.path.join(d, name))
    return p


save_rgba(alb2, "ElitePads_Albedo.png")
save_rgba(nrm2, "ElitePads_Normal.png")
save_rgba(mga2, "ElitePads_MetallicGlossAO.png")

# before/after sheet of the pad region (4x)
x0c, y0c, x1c, y1c = 365, 134, 514, 267
sc = 4
def crop(a): return cv2.resize(a[y0c:y1c, x0c:x1c], None, fx=sc, fy=sc, interpolation=cv2.INTER_NEAREST)
top = np.hstack([crop(alb), crop(alb2)])
mid = np.hstack([crop(nrm), crop(nrm2)])
bot = np.hstack([crop(mga), crop(mga2)])
Image.fromarray(np.vstack([top, mid, bot])).save(os.path.join(OUT, "before_after.png"))
print("saved ->", OUT)
