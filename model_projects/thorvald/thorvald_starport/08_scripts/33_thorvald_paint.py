"""Corrino village paint -> Thorvald paint, per texture sheet, and the 2x2 atlas (albedo, MetallicGlossAO, normal).

    python 33_thorvald_paint.py Sheet [Sheet ...]      (writes the atlas for up to four sheets; also imported by 34)

A sheet is a vanilla texture set (terminal_sheets.py): a building's own (`SupplyDepot`) or a shared one
(`VillageMisc_Neutral`, painted from `VillageMisc_Corrino_Albedo.png`).

Rules (hues in degrees):
  gold / yellow panels (h 28-70, s > 0.25)   -> copper #C8743A-ish, value kept as a ratio (Corrino's big gold blocks become
                                                 big copper blocks: bold at RTS zoom, nothing thin to vanish)
  red (crates, h < 15 or > 340, s > 0.35)    -> oxblood
  cyan / blue lights (h 170-230, s > 0.35)   -> ember amber
  everything else (greys, cream)            -> gunmetal: desaturated, value compressed 22 + 0.68 v, faint cool tint
Emblems (Corrino hawk on the Propaganda Office, the depot's crest) are painted out with the panel colour around them.
Donor textures are 512 (the ResearchStation's 1024 is resized), so a 1024 atlas of four 512 quadrants keeps the vanilla
texel density exactly, as long as 34_build_terminal.py places the donors at scale 1.
"""
import os
import sys

import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import terminal_sheets as TS  # noqa: E402
OUT = os.path.join(PROJ, "04_textures", "terminal_native")
Q = 512
QUADS = [(0, 1), (1, 1), (0, 0), (1, 0)]       # sheet index -> (cx, cy) in UV space (v up)

COPPER = np.array((190, 112, 64), np.float32)   # #BE7040 at the gold anchor (faction 0xB26E3C, a touch brighter)
OXBLOOD = np.array((112, 28, 32), np.float32)
EMBER = np.array((255, 150, 60), np.float32)
# emblem fills in donor UV pixels (512 grid, y down): (x0, y0, x1, y1) = fill with the median of a 4 px ring around
# the box; (x0, y0, x1, y1, r, g, b) = fill with that colour (in Corrino paint, so the recolour still applies)
EMBLEMS = {
    "PropagandaOffice": [(380, 284, 484, 384)],             # Corrino hawk on the side panel
    "SupplyDepot": [(32, 384, 104, 452, 183, 163, 93)],     # depot crest on the gold panel
    "SpacingGuildBranch": [(50, 220, 146, 310)],             # Guild logo on the tall tower's face
}


def _load(sheet, key, mode="RGB", fallback=None):
    p = TS.sheet(sheet).get(key)
    if not p:
        return Image.new(mode, (Q, Q), fallback)
    return Image.open(p).convert(mode).resize((Q, Q), Image.LANCZOS)


def paint(donor, strength=1.0, copper=None, gold_to="copper"):
    """Thorvald albedo for one sheet (512 RGB). strength scales the gunmetal darkening (1 = default);
    copper overrides the copper anchor colour (RGB); gold_to="gunmetal" keeps this sheet's gold panels charcoal
    (the Guild tower the owner liked in D5 was grey, not copper)."""
    cu_anchor = np.array(copper, np.float32) if copper is not None else COPPER
    im = _load(donor, "corrino")
    rgb = np.asarray(im).astype(np.float32)
    for e in EMBLEMS.get(donor, []):
        x0, y0, x1, y1 = e[:4]
        if len(e) == 7:
            rgb[y0:y1, x0:x1] = e[4:]
        else:
            ring = np.concatenate([rgb[max(y0 - 4, 0):y0, x0:x1].reshape(-1, 3), rgb[y1:y1 + 4, x0:x1].reshape(-1, 3),
                                   rgb[y0:y1, max(x0 - 4, 0):x0].reshape(-1, 3), rgb[y0:y1, x1:x1 + 4].reshape(-1, 3)])
            rgb[y0:y1, x0:x1] = np.median(ring, 0)
    hsv = np.asarray(Image.fromarray(rgb.astype(np.uint8)).convert("HSV")).astype(np.float32)
    h, s, v = hsv[..., 0] * 360 / 255, hsv[..., 1] / 255, hsv[..., 2]
    gold = (h > 28) & (h < 70) & (s > 0.25) & (v > 60)
    # Corrino gold panels carry a cream/dirt wash (low saturation): fold warm pixels enclosed by gold into the panel
    warm = (h > 22) & (h < 75) & (s > 0.08) & (v > 60)
    g8 = Image.fromarray((gold * 255).astype(np.uint8))
    closed = np.asarray(g8.filter(ImageFilter.MaxFilter(9)).filter(ImageFilter.MinFilter(9))) > 0
    gold = gold | (closed & warm)
    red = ((h < 15) | (h > 340)) & (s > 0.35) & (v > 50)
    cyan = (h > 170) & (h < 230) & (s > 0.35) & (v > 90)
    # soften the masks one pixel so recoloured borders don't alias
    def soft(m):
        return np.asarray(Image.fromarray((m * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(0.8))).astype(np.float32)[..., None] / 255
    out = rgb.copy()
    lum = rgb @ np.array([0.299, 0.587, 0.114], np.float32)
    k = strength
    gm = (22 * k + lum * (1 - 0.32 * k))[..., None] * np.array([0.97, 0.99, 1.03], np.float32)
    out[:] = gm
    if gold.any() and gold_to == "copper":
        anchor = np.percentile(v[gold], 75)
        cu = cu_anchor * np.clip(v / anchor, 0.25, 1.25)[..., None]
        out = out * (1 - soft(gold)) + cu * soft(gold)
    if red.any():
        anchor = np.percentile(v[red], 75)
        ox = OXBLOOD * np.clip(v / anchor, 0.3, 1.3)[..., None]
        out = out * (1 - soft(red)) + ox * soft(red)
    if cyan.any():
        out = out * (1 - soft(cyan)) + EMBER * np.clip(v / 255 + 0.2, 0.4, 1.0)[..., None] * soft(cyan)
    return Image.fromarray(np.clip(out, 0, 255).astype(np.uint8))


def atlas(donors, out_dir=OUT, tag="", strength=1.0, copper=None, sheet_opts=None):
    """Writes Terminal<tag>_{Albedo,MetallicGlossAO,Normal}.png (1024) and returns their paths."""
    os.makedirs(out_dir, exist_ok=True)
    A = Image.new("RGB", (2 * Q, 2 * Q), (60, 61, 63))
    M = Image.new("RGB", (2 * Q, 2 * Q), (0, 60, 255))
    N = Image.new("RGB", (2 * Q, 2 * Q), (128, 128, 255))
    for i, d in enumerate(donors):
        cx, cy = QUADS[i]
        box = (cx * Q, (1 - cy) * Q)
        A.paste(paint(d, strength, copper, **(sheet_opts or {}).get(d, {})), box)
        M.paste(_load(d, "mga", "RGB", (0, 60, 255)), box)
        N.paste(_load(d, "normal", "RGB", (128, 128, 255)), box)
    paths = {}
    for key, im in (("Albedo", A), ("MetallicGlossAO", M), ("Normal", N)):
        p = os.path.join(out_dir, "Terminal%s_%s.png" % (tag, key))
        im.save(p)
        paths[key] = p
    return paths


if __name__ == "__main__":
    ds = sys.argv[1:]
    print(atlas(ds))
    sheet = Image.new("RGB", (Q * len(ds), Q * 2))
    for i, d in enumerate(ds):
        sheet.paste(_load(d, "corrino"), (i * Q, 0))
        sheet.paste(paint(d), (i * Q, Q))
    p = os.path.join(PROJ, "02_progress_photos", "21_thorvald_paint", "paint_%s.png" % "_".join(ds))
    os.makedirs(os.path.dirname(p), exist_ok=True)
    sheet.save(p)
    print("SHEET", p)
