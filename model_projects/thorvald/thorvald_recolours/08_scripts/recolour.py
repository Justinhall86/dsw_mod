"""Thorvald recolour of the Imperial (Corrino) Harvester and the Ornithopter albedos.

Texture-only: hue/saturation replaced, painted value kept and compressed onto a band
per palette role (same method as thorvald_vehicles/02_recolour.py). Geometry, UVs,
normal and MetallicGlossAO maps are untouched.
"""
import colorsys
import os
import sys
from importlib.machinery import SourceFileLoader

import numpy as np
from PIL import Image

R = SourceFileLoader("rc", "/home/user/dsw_mod/model_projects/thorvald_vehicles/08_scripts/02_recolour.py").load_module()
V = "/home/user/dsw_mod/model_inputs/Vehicle/"
R.PAL["rust_deep"] = (0x48, 0x24, 0x1A)   # art-sheet skirt rust: redder and darker than "rust"
OUT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "04_textures")

# (name, hue_lo, hue_hi, sat_lo, sat_hi, val_lo, val_hi, palette key, mode, arg); first match wins
LAMP = ("lamp", 22, 60, 0.45, 1.01, 0.55, 1.01, "ember", "compress", (0.60, 0.97))
ANY = ("steel", None, None, 0.0, 1.01, 0.0, 1.01, "gunmetal", "compress", (0.08, 0.44))
JOBS = {
    "Harvester_Albedo.png": ("Imperial/Harvester/Harvester_Albedo.png", [
        LAMP,
        ("green", 90, 165, 0.20, 1.01, 0.0, 1.01, "copper", "compress", (0.30, 0.78)),
        ("red",  320,  32, 0.15, 1.01, 0.0, 1.01, "rust_deep", "compress", (0.14, 0.42)),
        ANY]),
    "Harvester_Track_Albedo.png": ("Imperial/Harvester/Harvester_Track_Albedo.png", [
        ("orange", 330, 40, 0.30, 1.01, 0.0, 1.01, "rust_deep", "compress", (0.18, 0.46)),
        ("dark", None, None, 0.0, 1.01, 0.0, 1.01, "gunmetal", "compress", (0.08, 0.32))]),
    "Ornithopter_Albedo.png": ("Atreide/Ornithopter/Ornithopter_Albedo.png", [
        LAMP,
        ("green", 90, 165, 0.20, 1.01, 0.0, 1.01, "rust", "compress", (0.20, 0.55)),
        ("brown",  0,  30, 0.25, 1.01, 0.0, 1.01, "copper", "compress", (0.28, 0.72)),
        ANY]),
}

os.makedirs(OUT, exist_ok=True)
for out_name, (rel, rules) in JOBS.items():
    src = Image.open(V + rel).convert("RGBA")
    a = np.asarray(src).astype(np.float32) / 255.0
    rgb = a[..., :3].copy()
    h, s, v = R.hsv_arrays(rgb)
    out = rgb.copy()
    done = np.zeros(h.shape, bool)
    stats = {}
    for name, hlo, hhi, slo, shi, vlo, vhi, key, mode, arg in rules:
        sel = (~done) & R.hue_in(h, hlo, hhi) & (s >= slo) & (s <= shi) & (v >= vlo) & (v <= vhi)
        stats[name] = round(100.0 * R.paint(out, sel, h, s, v, key, mode, arg) / h.size, 1)
        done |= sel
    res = np.concatenate([out, a[..., 3:]], -1)
    Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(os.path.join(OUT, out_name))
    print(out_name, "% of pixels:", stats)
