"""Extract the purple coat's silhouette profile from the segmented reference.

Outputs JSON: for each image row, the coat's outer half-width and the front gap
width, expressed in MODEL metres (model z = (feet_row - y) / PX_PER_M, model
x = (x - centre_x) / PX_PER_M).

The base Ginaz body is 1.88 m tall with its feet at z = 0, so the reference's
feet row is the model's z = 0 and the topknot row is z = 1.881.

Run with the system python:  python extract_coat_profile.py
"""
import os
import json
import numpy as np
from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\ginaz_swordmaster_purple"
TEX = os.path.join(PROJ, "04_textures")
MID = os.path.join(PROJ, "08_scripts", "intermediate_data")

MODEL_HEIGHT = 1.881

sil = np.asarray(Image.open(os.path.join(TEX, "reference_silhouette.png")).convert("L")) > 127
H, W = sil.shape
ys, xs = np.nonzero(sil)
top, bottom = int(ys.min()), int(ys.max())
height_px = bottom - top
PX_PER_M = height_px / MODEL_HEIGHT
centre_x = (W - 1) / 2.0
print("rows %d..%d  height %d px  %.1f px/m  centre x %.1f" % (top, bottom, height_px, PX_PER_M, centre_x))


def runs_of(row):
    rx = np.nonzero(row)[0]
    if not len(rx):
        return []
    out = []
    s0 = rx[0]
    for i in range(1, len(rx)):
        if rx[i] != rx[i - 1] + 1:
            out.append((int(s0), int(rx[i - 1])))
            s0 = rx[i]
    out.append((int(s0), int(rx[-1])))
    return out


profile = []
for y in range(top, bottom + 1):
    runs = runs_of(sil[y])
    if not runs:
        continue
    z = (bottom - y) / PX_PER_M
    # central band = the coat / body; outer runs are the arms
    central = [r for r in runs if (r[0] + r[1]) / 2.0 < centre_x + 0.22 * W]
    outer = [r for r in runs if (r[0] + r[1]) / 2.0 >= centre_x + 0.22 * W]
    coat = [r for r in central if r[0] > centre_x - 0.24 * W and r[1] < centre_x + 0.24 * W]
    if not coat:
        coat = central
    if not coat:
        coat = runs
    if not coat:
        continue
    x_lo = min(r[0] for r in coat)
    x_hi = max(r[1] for r in coat)
    # front gap: the gap between the two innermost runs, if the coat is split
    gap = 0.0
    if len(coat) == 2:
        gap = (coat[1][0] - coat[0][1])
    elif len(runs) >= 3:
        mid = [r for r in runs if r[0] > centre_x - 0.1 * W and r[1] < centre_x + 0.1 * W]
        if len(mid) == 2:
            gap = mid[1][0] - mid[0][1]
    profile.append({
        "y": y, "z": round(z, 4),
        "half_w": round((x_hi - x_lo) / 2.0 / PX_PER_M, 4),
        "x_lo_m": round((x_lo - centre_x) / PX_PER_M, 4),
        "x_hi_m": round((x_hi - centre_x) / PX_PER_M, 4),
        "gap_m": round(gap / PX_PER_M, 4),
        "n_runs": len(runs),
        "arm_x": [round((outer[0][0] - centre_x) / PX_PER_M, 3), round((outer[0][1] - centre_x) / PX_PER_M, 3)] if outer else None,
    })

# print a readable table every ~4 cm of model height
print("\n   z     half_w   x_lo    x_hi    gap   runs")
step = max(1, int(0.04 * PX_PER_M))
for i, p in enumerate(profile):
    if i % step == 0 and p["z"] < 1.78:
        print("%6.3f  %6.3f  %6.3f  %6.3f  %5.3f  %d" % (
            p["z"], p["half_w"], p["x_lo_m"], p["x_hi_m"], p["gap_m"], p["n_runs"]))

with open(os.path.join(MID, "coat_profile.json"), "w") as f:
    json.dump({"px_per_m": PX_PER_M, "centre_x": centre_x, "top": top, "bottom": bottom,
               "model_height": MODEL_HEIGHT, "profile": profile}, f, indent=1)
print("\nwrote coat_profile.json")
