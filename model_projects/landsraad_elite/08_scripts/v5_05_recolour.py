"""v5 recolour step B (system python): recolour the grafted Sardaukar pauldron texture to the Landsraad
guard palette (lavender-grey armour + gold trim), touching ONLY the pixels the pauldron's UVs cover.

  python 08_scripts/v5_05_recolour.py [--stats]

Method (same idea as the workshop skill): classify pauldron pixels into gold trim / armour body, replace hue
and saturation with the guard's own armour / gold values (measured on the guard's chest + hood UV islands),
keep each pixel's value (shading) but re-centre it on the guard's armour brightness.
"""
import colorsys
import json
import os
import sys

import numpy as np
from PIL import Image, ImageDraw

MP = r"C:\Users\justi\Python\dsw_mod\model_projects"
LE = os.path.join(MP, "landsraad_elite")
TRIS = json.load(open(os.path.join(LE, "08_scripts", "intermediate_data", "v5_uv_tris.json")))
SRC = os.path.join(MP, "imperial_sardaukar", "04_textures", "Sardaukar_Albedo.png")
GUARD = os.path.join(MP, "landsraad_guard", "04_textures", "LandsraadGuard_Albedo.png")
OUTDIR = os.path.join(LE, "04_textures", "v5_kitbash")
os.makedirs(OUTDIR, exist_ok=True)


def mask_for(keys, size):
    m = Image.new("L", size, 0)
    d = ImageDraw.Draw(m)
    for k in keys:
        for tri in TRIS[k]:
            d.polygon([(u * size[0], (1 - v) * size[1]) for u, v in tri], fill=255)
    return np.array(m) > 0


def hsv(arr):
    r, g, b = arr[..., 0] / 255.0, arr[..., 1] / 255.0, arr[..., 2] / 255.0
    mx, mn = np.maximum(np.maximum(r, g), b), np.minimum(np.minimum(r, g), b)
    d = mx - mn
    h = np.zeros_like(mx)
    nz = d > 1e-6
    rm, gm, bm = (mx == r) & nz, (mx == g) & nz & ~((mx == r)), (mx == b) & nz & ~(mx == r) & ~(mx == g)
    h[rm] = ((g - b)[rm] / d[rm]) % 6
    h[gm] = (b - r)[gm] / d[gm] + 2
    h[bm] = (r - g)[bm] / d[bm] + 4
    h = h / 6.0
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0)
    return h, s, mx


def to_rgb(h, s, v):
    i = np.floor(h * 6).astype(int) % 6
    f = h * 6 - np.floor(h * 6)
    p, q, t = v * (1 - s), v * (1 - f * s), v * (1 - (1 - f) * s)
    out = np.zeros(h.shape + (3,))
    for k, (a, b, c) in enumerate(((v, t, p), (q, v, p), (p, v, t), (p, q, v), (t, p, v), (v, p, q))):
        sel = i == k
        out[..., 0][sel], out[..., 1][sel], out[..., 2][sel] = a[sel], b[sel], c[sel]
    return (np.clip(out, 0, 1) * 255).astype(np.uint8)


def classify(h, s, v):
    gold = (h > 0.08) & (h < 0.18) & (s > 0.35) & (v > 0.45)
    return gold


src = np.array(Image.open(SRC).convert("RGBA"))
gd = np.array(Image.open(GUARD).convert("RGBA"))
pm = mask_for(["sardaukar_14", "sardaukar_18", "sardaukar_19"], (src.shape[1], src.shape[0]))
gm = mask_for(["guard_17", "guard_18"], (gd.shape[1], gd.shape[0]))

ph, ps, pv = hsv(src[..., :3])
gh, gs, gv = hsv(gd[..., :3])
p_gold, g_gold = classify(ph, ps, pv) & pm, classify(gh, gs, gv) & gm
p_body, g_body = pm & ~p_gold, gm & ~g_gold


def stat(h, s, v, m):
    return "n=%d  H=%.3f S=%.3f V=%.3f (V std %.3f)" % (m.sum(), np.median(h[m]), np.median(s[m]), np.median(v[m]), v[m].std())


print("pauldron body :", stat(ph, ps, pv, p_body))
print("pauldron gold :", stat(ph, ps, pv, p_gold))
print("guard armour  :", stat(gh, gs, gv, g_body))
print("guard gold    :", stat(gh, gs, gv, g_gold))
if "--stats" in sys.argv:
    sys.exit()

# body: guard armour hue/sat, value re-centred on the guard's armour brightness (shading kept)
tgt_h, tgt_s, tgt_v = np.median(gh[g_body]), np.median(gs[g_body]), np.median(gv[g_body])
src_v = np.median(pv[p_body])
nh, ns, nv = ph.copy(), ps.copy(), pv.copy()
nh[p_body] = tgt_h
ns[p_body] = np.clip(tgt_s * (0.6 + 0.8 * (ps[p_body] / max(ps[p_body].max(), 1e-6))), 0, 1)
nv[p_body] = np.clip(tgt_v + 0.09 + (pv[p_body] - src_v) * 1.0, 0.05, 1.0)   # +0.09: pauldron read darker than the hood once lit
# gold: guard gold hue/sat, keep shading, re-centre brightness
tgh, tgs, tgv = np.median(gh[g_gold]), np.median(gs[g_gold]), np.median(gv[g_gold])
sgv = np.median(pv[p_gold])
nh[p_gold] = tgh
ns[p_gold] = np.clip(tgs * (ps[p_gold] / max(np.median(ps[p_gold]), 1e-6)), 0, 1)
nv[p_gold] = np.clip(tgv + (pv[p_gold] - sgv), 0.05, 1.0)

out = src.copy()
rgb = to_rgb(nh, ns, nv)
out[..., :3][pm] = rgb[pm]
Image.fromarray(out).save(os.path.join(OUTDIR, "Sardaukar_pauldron_landsraad_Albedo.png"))
print("saved", os.path.join(OUTDIR, "Sardaukar_pauldron_landsraad_Albedo.png"))
