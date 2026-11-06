"""House Thorvald recolour of each asset's source albedo -> 04_textures/<asset>/<same name>.

    python 02_recolour.py [asset ...]

Same palette as the other Thorvald vehicles (thorvald_vehicles/08_scripts/02_recolour.py), but a cleaner mapping for these large,
mostly light-panelled assets. The house script stretches each class's value range to fill a band, which turns faint dirt on cream
panels into dark blotches and orange speckle. Here every class keeps its value RATIO to the class's bright anchor instead:

    new_v = target_v * (v / v_anchor) ** GAMMA        v_anchor = the class's 92nd-percentile value

so panel lines, edges and AO survive at their real strength and nothing is amplified. Clean factory paint, no weathering.

Classes (first match wins):
    accent   saturated faction colour (green, blue, red-purple)  -> rust panels; islands under ACCENT_PX -> ember trim
    gold     brass / gold / yellow trim                          -> copper
    neutral  everything else, including faint dirt and specks    -> gunmetal
"""
import colorsys
import importlib.util
import os
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from assets import ASSETS, PROJ, input_dir  # noqa: E402

spec = importlib.util.spec_from_file_location(
    "thv_recolour", os.path.join(PROJ, "..", "thorvald_vehicles", "08_scripts", "02_recolour.py"))
R = importlib.util.module_from_spec(spec)
spec.loader.exec_module(R)          # palette, HSV helpers, connected-component labelling

PAL = R.PAL
GAMMA = 0.8
ANCHOR_PCT = 92
ACCENT_PX = 900                    # faction-colour islands smaller than this are trim/lights -> ember
# class: (palette key, target value, saturation)
TARGET = {
    "neutral": ("gunmetal", 0.34, 0.09),
    "gold":    ("copper",   0.72, None),
    "rust":    ("rust",     0.48, None),
    "ember":   ("ember",    0.92, None),
}


def hs_of(key):
    h, s, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in PAL[key]])
    return h * 360.0, s


def paint(out, sel, v, cls):
    if not sel.any():
        return 0
    key, tv, sat = TARGET[cls]
    th, ts = hs_of(key)
    if sat is not None:
        ts = sat
    # anchor on the class's brightest painted surface (high percentile): it lands on target_v, darker parts keep their ratio,
    # so recesses and unused atlas space stay dark and nothing is stretched
    ref = max(float(np.percentile(v[sel], ANCHOR_PCT)), 0.03)
    nv = np.clip(tv * (np.maximum(v[sel], 1e-4) / ref) ** GAMMA, 0.0, 1.0)
    n = int(sel.sum())
    out[sel] = R.hsv_to_rgb_scalar(np.full(n, th, np.float32), np.full(n, ts, np.float32), nv.astype(np.float32))
    return n


def recolour(src, dst):
    a = np.asarray(Image.open(src).convert("RGBA")).astype(np.float32) / 255.0
    rgb = a[..., :3]
    h, s, v = R.hsv_arrays(rgb)
    out = rgb.copy()
    # dark browns/greens (v < 0.30) are shadow and grime, not paint: they stay in the metal class, or they break up into speckle
    faction = (s >= 0.30) & (v >= 0.30) & (R.hue_in(h, 70, 290) | R.hue_in(h, 330, 12))
    gold = ~faction & (s >= 0.42) & (v >= 0.30) & R.hue_in(h, 22, 70)    # true brass only: khaki/olive paint stays metal
    stats = {}
    labels, n = R.label_components(faction, max_labels=200000)
    if n:
        sizes = np.bincount(labels.ravel(), minlength=n + 1)
        small = faction & (sizes[labels] < ACCENT_PX) & (v >= 0.45)
        stats["ember"] = paint(out, small, v, "ember")
        stats["rust"] = paint(out, faction & ~small, v, "rust")
    stats["copper"] = paint(out, gold, v, "gold")
    stats["gunmetal"] = paint(out, ~faction & ~gold, v, "neutral")
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    res = np.concatenate([out, a[..., 3:]], -1)
    Image.fromarray((np.clip(res, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(dst)
    return stats


if __name__ == "__main__":
    for name in sys.argv[1:] or list(ASSETS):
        a = ASSETS[name]
        clean = os.path.join(PROJ, "04_textures", name, "clean", a["source"])     # e.g. HQ with the painted banner removed
        print("RECOLOUR", name, recolour(clean if os.path.exists(clean) else os.path.join(input_dir(name), a["source"]),
                                         os.path.join(PROJ, "04_textures", name, a["source"])))
