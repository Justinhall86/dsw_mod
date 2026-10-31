"""Thorvald Ship (Th_Ship fighter) texture atlas: polished charcoal + bold copper + oxblood nose.

    python 41_make_atlas.py     (needs 04_textures/_geo.npz from 40_dump_geo.py)

2x2 atlas of 512 cells: 0 Ravager body (0,0), 1 Hawk wings + nose inset (1,0), 2 Renegade gun/jet tubes (0,1), 3 unused (1,1).
Nose is -X. Bands are placed in 3D (texel position baked from the geometry), like the frigate's atlas.
"""
import os
import sys

import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "..", "thorvald_frigate", "08_scripts"))
import importlib  # noqa: E402
FA = importlib.import_module("41_make_atlas")      # frigate atlas helpers (bake, colour maths, mgao)
PROJ = os.path.dirname(HERE)
TEX = os.path.join(PROJ, "04_textures")
VEH = FA.VEH
H = FA.H
COPPER = np.array([0.62, 0.34, 0.17])
CELLS = {0: (0, 0), 1: (1, 0), 2: (0, 1), 3: (1, 1)}


PAL = os.environ.get("THV_PAL", "dark")      # dark | twotone
CU_LVL = os.environ.get("THV_CU", "std")     # std | heavy


def charcoal(L):
    t = np.clip((L - 0.10) / 0.75, 0, 1) ** 1.15
    if PAL == "twotone":   # gunmetal panels on a charcoal base: panel breaks stay readable at RTS zoom
        return (0.11 + 0.26 * t)[..., None] * np.array([0.95, 0.97, 1.03])
    return (0.095 + 0.105 * t)[..., None] * np.array([0.96, 0.97, 1.04])


def band(a, lo, hi, soft=0.01):
    return FA.smooth(a, lo - soft, lo + soft) * (1 - FA.smooth(a, hi - soft, hi + soft))


def recolour(alb, P, N, cov, cell, ctx):
    rgb = alb[..., :3]
    L = FA.lum(rgb)
    h, s, v = FA.rgb2hsv(rgb)
    accent = (((h > 165) & (h < 275)) | ((h > 8) & (h < 50))) & (s > 0.30) & (v > 0.30)   # blue lights / existing copper
    up = FA.smooth(N[..., 2], 0.25, 0.5)                    # upward-facing: what the RTS camera sees
    cu = FA.opened(accent.astype(float), 5)
    if os.environ.get("THV_UPONLY"):                          # donor lights on side flanks read as ragged splotches
        cu = cu * up
    out = charcoal(L)
    ox = np.zeros((H, H))
    x0, x1, wy = ctx["x0"], ctx["x1"], ctx["wy"]
    t = (P[..., 0] - x0) / (x1 - x0)                         # 0 at the nose (-X) .. 1 at the tail
    if cell == 0:
        ox = np.clip(band(t, -0.05, 0.17) * cov, 0, 1)                              # oxblood nose
        strap = band(t, 0.47, 0.50, 0.004) * cov * (np.abs(P[..., 1]) < 2)
        cu = np.maximum(cu, strap * (up if os.environ.get("THV_UPONLY") else 1))       # body strap
    if cell == 1:
        ay = np.abs(P[..., 1]) / wy
        cu = np.maximum(cu, band(ay, 0.70, 0.76, 0.006) * cov * (t > 0.25))        # wing straps
        ox = np.clip(band(t, -0.05, 0.12) * cov, 0, 1)                              # nose inset keeps the oxblood frame dark-red
    if CU_LVL == "heavy":
        if cell == 0:
            cu = np.maximum(cu, band(t, 0.17, 0.205, 0.004) * cov)                  # copper collar behind the oxblood nose
        if cell == 1:
            cu = np.maximum(cu, band(np.abs(P[..., 1]) / wy, 0.90, 1.05, 0.006) * cov)   # copper wing tips
    if cell == 2:
        cu = np.maximum(cu, band(t, 0.95, 1.2) * cov)                               # tip-jet rims (rear end)
    cu = cu * (1 - ox)
    out = out * (1 - cu[..., None]) + (COPPER * (0.75 + 0.45 * L)[..., None]) * cu[..., None]
    out = out * (1 - ox[..., None]) + (FA.OX * (0.70 + 1.15 * L)[..., None]) * ox[..., None]
    return np.clip(out, 0, 1), {"copper": cu, "bone": np.zeros((H, H)), "ox": ox}


def main():
    g = np.load(os.path.join(TEX, "_geo.npz"))
    pts = g["pos"].reshape(-1, 3)
    ctx = {"x0": pts[:, 0].min(), "x1": pts[:, 0].max(), "wy": np.abs(pts[:, 1]).max()}
    print("ctx", {k: round(float(v), 2) for k, v in ctx.items()})
    srcs = {0: "Common/Ravager/Ravager", 1: "Atreide/Hawk/Hawk", 2: "Common/Renegade_Frigate/Renegade_Frigate", 3: "Common/Ravager/Ravager"}
    A, M, Nn = (np.zeros((2 * H, 2 * H, 4)) for _ in range(3))
    for cell, stem in srcs.items():
        alb = FA.load(stem + "_Albedo.png")
        P, N, cov = FA.bake(g, cell)
        out, cls = recolour(alb, P, N, cov, cell, ctx)
        c, r = CELLS[cell]
        sl = (slice(r * H, (r + 1) * H), slice(c * H, (c + 1) * H))
        A[sl] = np.concatenate([out, np.ones((H, H, 1))], -1)
        M[sl] = FA.mgao(FA.load(stem + "_MetallicGlossAOEmiss.png"), cls)
        Nn[sl] = FA.load(stem + "_Normal.png")
        print("cell", cell, stem.split("/")[-1], "covered %.1f%%" % (100 * cov.mean()))
    for arr, name in ((A, "Thorvald_Ship_Albedo.png"), (M, "Thorvald_Ship_MetallicGlossAO.png"), (Nn, "Thorvald_Ship_Normal.png")):
        Image.fromarray((np.clip(arr, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(os.path.join(TEX, name))
        print("wrote", name)


if __name__ == "__main__":
    main()
