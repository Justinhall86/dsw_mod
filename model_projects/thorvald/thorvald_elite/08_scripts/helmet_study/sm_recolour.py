"""Samurai pass (2026-11-15) on the Warden helmet paint: less insect, more kabuto.
Works at 1024 px (vanilla 512 upscaled) and places details in 3D through posmap.npz (wd_posmap.py):
  - visor: full smoked (as W5) | slit (a narrow eye band, the rest of the visor painted over as shell) | slit + copper brow line
  - plates: the faceted hex plates toned toward the shell so the bowl reads as one piece (PLATE 0 = W4 contrast, 1 = flat)
  - lames: horizontal lamellar lines on the lower back and sides (shikoro rows painted on the bowl), optional oxblood lacing
  - crown: copper crown (W3/W5) or plain; brow badge: small copper plate at the centre of the brow where kuwagata horns mount
    python sm_recolour.py [name ...]     -> 04_textures/helmet_study/warden/SM_<name>.png
"""
import json, os, sys
import numpy as np
from PIL import Image, ImageFilter
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.REPO + "/model_projects/thorvald/thorvald_recolours/08_scripts")
import ground_recolour as gr

W = P.WORK + "/warden/"
N = 1024
src = Image.open(P.WARDEN_DIR + "AtreideWarden_Albedo.png").convert("RGBA").resize((N, N), Image.LANCZOS)
src = np.asarray(src)
rgb = src[..., :3].astype(float)
r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
mx, mn = rgb.max(-1), rgb.min(-1)
v = mx / 255
s = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1), 0)
pm = np.load(W + "posmap.npz")
pos, hit = pm["pos"], pm["hit"]
# grow the position map a few texels so masks cover the UV island edges
for _ in range(3):
    gm = np.asarray(Image.fromarray(hit.astype(np.uint8) * 255).filter(ImageFilter.MaxFilter(3))) > 0
    for c in range(3):
        ch = Image.fromarray(np.where(hit, pos[..., c], -9).astype(np.float32), "F").filter(ImageFilter.MaxFilter(3))
        pos[..., c] = np.where(hit, pos[..., c], np.asarray(ch))
    hit = gm
meta = json.load(open(W + "panels.json"))["meta"]
z0, z1 = meta["z0"], meta["z1"]
X, Y, Z = pos[..., 0], pos[..., 1], (pos[..., 2] - z0) / (z1 - z0)     # Z: 0 = rim, 1 = top of the helmet


def soft(a, blur=1.2):
    return np.asarray(Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(blur))).astype(float) / 255


wgreen = soft(((g / np.maximum(r, 1)) - 1.1) / 0.25 * (g > 40), 2.0)
wlight = soft(np.clip((v - 0.5) / 0.12, 0, 1) * np.clip((0.26 - s) / 0.1, 0, 1), 2.0) * (1 - wgreen)
front = hit & (Y < -0.06)
# crest area as in wd_recolour (panels.json, scaled to 1024)
from PIL import ImageDraw
crest = Image.new("L", (N, N), 0)
d = ImageDraw.Draw(crest)
for p in json.load(open(W + "panels.json"))["panels"]:
    if p["centre"][2] > z1 - 0.045 and abs(p["centre"][0]) < 0.07:
        for poly in p["uv"]:
            d.polygon([(u * N, (1 - vv) * N) for u, vv in poly], fill=255)
crest = np.asarray(crest.filter(ImageFilter.MaxFilter(9))) > 127
wvis_full = wgreen * front * (1 - crest)
hx = gr.hx
CU_D, CU_H = hx("#8A4F34"), hx("#B87333")
GM_D, GM_L, SMOKE, OX, BLK = hx("#2A3439"), hx("#53565B"), hx("#1B2023"), hx("#5A1E1E"), hx("#141617")


def shade(base, lo=0.6, hi=1.3, med=0.45):
    return base * np.clip(v / med, lo, hi)[..., None]


def copper():
    t = np.clip((v - 0.2) / 0.6, 0, 1)[..., None]
    return (CU_D * (1 - t) + CU_H * t) * np.clip(0.7 + 0.5 * v, 0.7, 1.15)[..., None]


def mix(o, col, w):
    o[:] = o * (1 - w[..., None]) + col * w[..., None]


def band(x, lo, hi, feather=0.01):
    return np.clip((x - lo) / feather, 0, 1) * np.clip((hi - x) / feather, 0, 1)


def build(visor="slit", plate=0.7, lames=0, lacing=False, crown="copper", badge=False, slit=(0.50, 0.60), brow=False,
          shell_dark=0.85, visor_col=None):
    o = gr.ramp(v * shell_dark, gr.GREY)
    rng = np.random.default_rng(1)
    o[crest] = GM_D * (1.0 + 0.05 * rng.standard_normal((crest.sum(), 1)))
    # plates: W4 light gunmetal toned toward the shell
    mix(o, shade(GM_L * (1 - plate) + GM_D * plate), wlight)
    # visor: the whole green face area first painted as shell, then the eye opening
    mix(o, shade(GM_D, 0.8, 1.15), wvis_full)
    vc = visor_col if visor_col is not None else SMOKE
    if visor == "full":
        mix(o, shade(vc, 0.7, 1.6), wvis_full)
    elif visor in ("slit", "slit_brow"):
        ws = soft(wgreen * front * band(Z, *slit, 0.012), 1.0)
        mix(o, shade(vc * 0.7, 0.7, 1.4), ws)
        if visor == "slit_brow" or brow:          # copper brow line just above the slit (the mabizashi / peak edge)
            wb = soft(front * band(Z, slit[1] + 0.02, slit[1] + 0.055, 0.008) * (np.abs(X) < 0.105), 0.8)
            mix(o, copper() * 1.05, wb)
    if crown == "copper":
        mix(o, copper() * 0.9, soft(crest.astype(float), 2.0))
    if lames:     # horizontal lames: dark groove + light top edge every 'lames' metres on the back/sides below the visor line
        zz = pos[..., 2]
        ph = ((zz - z0) / lames) % 1.0
        area = hit & (Y > -0.09) & (Z < 0.46) & ~crest
        groove = soft(area * (ph < 0.14), 0.7)
        edge = soft(area * (ph > 0.86), 0.7)
        mix(o, BLK, groove * 0.85)
        mix(o, copper() * 0.95, edge * 0.8)
        if lacing:   # oxblood lacing (odoshi): short vertical stitches across each groove, every 2 cm round the bowl
            ang = np.arctan2(X, Y - 0.0)
            arc = (ang * 0.12 / 0.02) % 1.0
            mix(o, shade(OX, 0.8, 1.2), soft(area * (ph < 0.30) * (arc < 0.30), 0.6) * 0.95)
    if badge:     # small copper brow plate (kuwagata-dai) at the centre front above the visor
        wbd = soft(front * band(Z, slit[1] + 0.03, slit[1] + 0.14, 0.01) * (np.abs(X) < 0.022), 1.0)
        mix(o, copper() * 1.1, wbd)
    return o


RECIPES = {
    "slit":            dict(visor="slit"),
    "slit_brow":       dict(visor="slit_brow"),
    "slit_lames":      dict(visor="slit", lames=0.022),
    "slit_lames_lace": dict(visor="slit_brow", lames=0.022, lacing=True),
    "slit_plain":      dict(visor="slit", crown="none", plate=1.0),
    "slit_badge":      dict(visor="slit_brow", badge=True),
    "full_flat":       dict(visor="full", plate=1.0),
    "slit_brow_flat":  dict(visor="slit_brow", plate=1.0, crown="none"),
    "slit_brow_lames": dict(visor="slit_brow", lames=0.022),
    "slit_brow_lames_plain": dict(visor="slit_brow", lames=0.022, crown="none", plate=1.0),
    "full_lames":      dict(visor="full", lames=0.022),
}
if __name__ == "__main__":
    names = sys.argv[1:] or list(RECIPES)
    for k in names:
        o = build(**RECIPES[k])
        Image.fromarray(np.dstack([np.clip(o, 0, 255).astype(np.uint8), src[..., 3]]), "RGBA").save(W + "SM_" + k + ".png")
        print("wrote SM_" + k)
