"""v5 recolour step B for any donor (system python): repaint only the donor parts' UV islands to the
Landsraad guard palette. Gold stays gold (re-tinted to the guard's gold); a coloured accent (e.g. Gurney's
green) becomes gold trim; everything else becomes the guard's lavender-grey armour, shading kept.

  python 08_scripts/v5_10_recolour_generic.py
"""
import os

import numpy as np
from PIL import Image

import importlib.util

HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("rc", os.path.join(HERE, "v5_05_recolour.py"))
src_txt = open(os.path.join(HERE, "v5_05_recolour.py"), encoding="utf-8").read().split("src = np.array")[0]
ns = {}
exec(src_txt, ns)   # reuse mask_for / hsv / to_rgb / classify / paths from the Sardaukar recolour
MP, LE, mask_for, hsv, to_rgb, classify = ns["MP"], ns["LE"], ns["mask_for"], ns["hsv"], ns["to_rgb"], ns["classify"]
OUTDIR = ns["OUTDIR"]

HG_PAD = [20, 21, 30, 31, 35, 36, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54]
JOBS = (
    ("gurney", os.path.join(MP, "gurney", "01_input", "Gurney_Albedo.png"), [17, 18], 0.06),
    ("houseguard", os.path.join(MP, "imperial_houseguard", "04_textures", "HouseGuard_Albedo.png"), HG_PAD, 0.06),
)

gd = np.array(Image.open(ns["GUARD"]).convert("RGBA"))
gm = mask_for(["guard_17", "guard_18"], (gd.shape[1], gd.shape[0]))
gh, gs, gv = hsv(gd[..., :3])
g_gold = classify(gh, gs, gv) & gm
g_body = gm & ~g_gold
A_H, A_S, A_V = np.median(gh[g_body]), np.median(gs[g_body]), np.median(gv[g_body])
G_H, G_S, G_V = np.median(gh[g_gold]), np.median(gs[g_gold]), np.median(gv[g_gold])

for donor, tex, ids, lift in JOBS:
    src = np.array(Image.open(tex).convert("RGBA"))
    pm = mask_for(["%s_%d" % (donor, i) for i in ids], (src.shape[1], src.shape[0]))
    ph, ps, pv = hsv(src[..., :3])
    gold = classify(ph, ps, pv) & pm
    accent = pm & ~gold & (ph > 0.20) & (ph < 0.55) & (ps > 0.15)   # green/teal accent (any brightness) -> gold trim, so no speckle
    body = pm & ~gold & ~accent
    nh, ns_, nv = ph.copy(), ps.copy(), pv.copy()
    for sel, (th, tsat, tv) in ((body, (A_H, A_S, A_V + lift)), (gold | accent, (G_H, G_S, G_V))):
        if sel.sum() == 0:
            continue
        nh[sel] = th
        ns_[sel] = np.clip(tsat * (0.7 + 0.6 * ps[sel] / max(ps[sel].max(), 1e-6)), 0, 1)
        nv[sel] = np.clip(tv + (pv[sel] - np.median(pv[sel])), 0.05, 1.0)
    out = src.copy()
    out[..., :3][pm] = to_rgb(nh, ns_, nv)[pm]
    path = os.path.join(OUTDIR, "%s_parts_landsraad_Albedo.png" % donor)
    Image.fromarray(out).save(path)
    print(donor, "body", body.sum(), "gold", gold.sum(), "accent->gold", accent.sum(), "->", path)
