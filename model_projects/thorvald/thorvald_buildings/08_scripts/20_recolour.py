"""Recolour the donor albedos to the House Thorvald look: polished gunmetal, bold copper trim, oxblood accents.

    python 20_recolour.py            # all buildings -> ../04_textures/<Building>/albedo.png
    python 20_recolour.py Smelter    # just these

How a pixel is classed:
  - faction paint: where the vanilla Harkonnen albedo differs from the neutral one (the engine's own faction-colour zones)
  - warm paint: saturated orange / yellow / gold in the neutral albedo (orange ramps, gold trims)
  - red paint: saturated red (crates, warning panels); blue and cyan fall to metal
  - everything else: plain metal and concrete
Faction and warm paint become copper, red paint becomes oxblood, the rest becomes gunmetal. Shading is kept by
scaling each target colour with the source luminance.
"""
import os
import sys

import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402

STRUCT = os.path.join(REPO, "model_inputs", "Structure")
TEX = os.path.join(PROJ, "04_textures")

GUNMETAL = np.array([1.00, 0.96, 0.90])   # warm-neutral tint, multiplied by a compressed value
COPPER = np.array([0.80, 0.47, 0.24])     # #CC783D, a touch brighter than faction 0xB26E3C so it reads at RTS zoom
OXBLOOD = np.array([0.40, 0.09, 0.11])    # #66171C

# name -> donor folder, neutral albedo, faction albedo (or None), what faction paint becomes
BUILDINGS = {
    "ConsignmentTerminal": ("Point_Of_Interest/TrafficHub", "TrafficHub_Albedo.png", None, "copper"),
    "AlloySmelter": ("Buildings/SpiceCollector", "SpiceCollector_albedo.png", None, "copper"),
    "OreDrill": ("Buildings/WaterExtractor", "WaterExtractor_Albedo.png", "WaterExtractor_Harkonnen_Albedo.png", "copper"),
    "WarAcademyAnnex": ("Buildings/IndoctrinationCenter", "IndoctrinationCenter_Albedo.png",
                        "IndoctrinationCenter_Harkonnen_Albedo.png", "copper"),
    "ContractHall": ("Base/ConquestOutpost", "ConquestOutpost_Albedo.png", "ConquestOutpost_Harkonnen_Albedo.png", "oxblood"),
    # the HQ kitbash (model_projects/thorvald/thorvald_hq) uses the same outpost with copper faction zones
    "ThorvaldCitadel": ("Base/ConquestOutpost", "ConquestOutpost_Albedo.png", "ConquestOutpost_Harkonnen_Albedo.png",
                        "copper"),
}


def load(path, tmp):
    return np.asarray(Image.open(B.dds_as_png(path, tmp)).convert("RGB"), dtype=np.float32) / 255.0


def hsv(a):
    mx, mn = a.max(-1), a.min(-1)
    s = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1e-6), 0)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    d = np.maximum(mx - mn, 1e-6)
    h = np.select([mx == r, mx == g], [((g - b) / d) % 6, (b - r) / d + 2], (r - g) / d + 4) * 60
    return h, s, mx


def soft(mask, px=2):
    im = Image.fromarray((mask * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(px))
    return np.asarray(im, dtype=np.float32)[..., None] / 255.0


def recolour(name):
    folder, neutral, faction, fpaint = BUILDINGS[name]
    out = os.path.join(TEX, name)
    os.makedirs(out, exist_ok=True)
    a = load(os.path.join(STRUCT, folder, neutral), os.path.join(out, "src_albedo.png"))
    lum = a @ np.array([0.299, 0.587, 0.114])
    h, s, v = hsv(a)

    fac = np.zeros(lum.shape, np.float32)
    if faction:
        f = load(os.path.join(STRUCT, folder, faction), os.path.join(out, "src_faction.png"))
        if f.shape == a.shape:
            # Harkonnen paint is saturated red; the rest of a faction albedo is only re-tinted, so a plain diff floods
            fh, fs, fv = hsv(f)
            fac = (((fh < 15) | (fh > 340)) & (fs > 0.5) & (fv > 0.25) & (s < 0.35)).astype(np.float32)
            # close the mask so a Harkonnen emblem painted inside a red panel doesn't survive as a grey outline
            im = Image.fromarray((fac * 255).astype(np.uint8))
            k = max(5, a.shape[0] // 64) | 1
            fac = np.asarray(im.filter(ImageFilter.MaxFilter(k)).filter(ImageFilter.MinFilter(k)), np.float32) / 255.0
    sat = (s > 0.35) & (v > 0.15)
    warm = (sat & (h >= 18) & (h <= 65)).astype(np.float32)
    # only red paint becomes oxblood; blue / cyan (the Ice Extractor's ice, coolant, crates) falls to gunmetal,
    # so the drill's ice chunks read as dark ore instead of blood pools
    cold = (sat & ((h < 12) | (h > 335))).astype(np.float32)

    base = (0.06 + 0.40 * lum ** 1.15)[..., None] * GUNMETAL
    shade = (0.45 + 0.85 * lum)[..., None]
    copper = np.clip(COPPER * shade, 0, 1)
    oxblood = np.clip(OXBLOOD * (0.55 + 0.9 * lum)[..., None], 0, 1)

    m_copper = soft(np.clip(warm + (fac if fpaint == "copper" else 0), 0, 1))
    m_ox = soft(np.clip(cold + (fac if fpaint == "oxblood" else 0), 0, 1)) * (1 - m_copper)
    res = base * (1 - m_copper - m_ox) + copper * m_copper + oxblood * m_ox
    Image.fromarray((np.clip(res, 0, 1) * 255).astype(np.uint8)).save(os.path.join(out, "albedo.png"))
    print(name, "copper %.0f%%  oxblood %.0f%%" % (m_copper.mean() * 100, m_ox.mean() * 100))


if __name__ == "__main__":
    for n in BUILDINGS:
        if not argv or n in argv:
            recolour(n)
