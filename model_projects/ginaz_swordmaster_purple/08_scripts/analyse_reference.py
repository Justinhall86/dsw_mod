"""Analyse the purple concept art: segment the character, measure the silhouette,
and write a cleaned reference (background removed) for the colour projection bake.

The backdrop is a warm-sand gradient with a soft cast shadow at the bottom.  Two
signals separate the figure from it:

  * luminance ratio to the row's own background (the shadow keeps the row's
    brightness, the figure is 3-5x darker);
  * chromaticity distance (the figure's purple/brown is a different hue from sand).

The row background is the 95th percentile of the outer 8% columns, so a hand or
sleeve reaching the image edge cannot poison it.

Run with the system python:  python analyse_reference.py
"""
import os
import json
import numpy as np
from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\ginaz_swordmaster_purple"
SRC = os.path.join(PROJ, "01_input", "ginaz_swordmaster_purple.jpg")
OUT = os.path.join(PROJ, "04_textures")
MID = os.path.join(PROJ, "08_scripts", "intermediate_data")
os.makedirs(OUT, exist_ok=True)
os.makedirs(MID, exist_ok=True)

im = Image.open(SRC).convert("RGB")
a = np.asarray(im).astype(np.float32) / 255.0
H, W = a.shape[:2]
lum = a @ np.array([0.30, 0.59, 0.11])

# ---------------------------------------------------------------- background
edge = max(3, int(W * 0.08))
strip = np.concatenate([a[:, :edge], a[:, W - edge:]], axis=1)
bg_row = np.percentile(strip, 95, axis=1)        # (H, 3) row background
bg = np.repeat(bg_row[:, None, :], W, axis=1)     # (H, W, 3)
bg_lum = np.maximum(bg @ np.array([0.30, 0.59, 0.11]), 1e-4)   # (H, W)
ratio = lum / bg_lum

s = a.sum(2, keepdims=True)
chroma = a / np.maximum(s, 1e-6)
bg_chroma = (bg_row / np.maximum(bg_row.sum(1, keepdims=True), 1e-6))[:, None, :]
chroma_d = np.abs(chroma - bg_chroma).sum(2)
dist = np.sqrt(((a - bg) ** 2).sum(2))

fg = (dist > 0.075) & ((ratio < 0.85) | (chroma_d > 0.045))
print("fg pixels", int(fg.sum()))


def erode(mask, it=1):
    m = mask
    for _ in range(it):
        p = np.pad(m, 1, constant_values=False)
        m = (p[1:-1, 1:-1] & p[:-2, 1:-1] & p[2:, 1:-1] &
             p[1:-1, :-2] & p[1:-1, 2:])
    return m


def dilate(mask, it=1):
    m = mask
    for _ in range(it):
        p = np.pad(m, 1, constant_values=False)
        m = (p[1:-1, 1:-1] | p[:-2, 1:-1] | p[2:, 1:-1] |
             p[1:-1, :-2] | p[1:-1, 2:])
    return m


fg = dilate(erode(fg, 1), 1)          # morphological open

# ---------------------------------------------------------------- largest blob
lbl = np.zeros((H, W), np.int32)
cur, best = 0, (0, 0)
for y in range(H):
    for x in range(W):
        if fg[y, x] and lbl[y, x] == 0:
            cur += 1
            stack = [(y, x)]
            lbl[y, x] = cur
            n = 0
            while stack:
                cy, cx = stack.pop()
                n += 1
                for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    ny, nx = cy + dy, cx + dx
                    if 0 <= ny < H and 0 <= nx < W and fg[ny, nx] and lbl[ny, nx] == 0:
                        lbl[ny, nx] = cur
                        stack.append((ny, nx))
            if n > best[0]:
                best = (n, cur)
fg = lbl == best[1]
print("largest blob", best[0], "px")

ys, xs = np.nonzero(fg)
top, bottom = int(ys.min()), int(ys.max())
left, right = int(xs.min()), int(xs.max())
height_px = bottom - top
print("bbox x", left, right, " y", top, bottom, " height", height_px)

rows = {}
for y in range(top, bottom + 1):
    rx = np.nonzero(fg[y])[0]
    if len(rx):
        # list of runs (the gap between arm and body is real background)
        runs = []
        s0 = rx[0]
        for i in range(1, len(rx)):
            if rx[i] != rx[i - 1] + 1:
                runs.append((int(s0), int(rx[i - 1])))
                s0 = rx[i]
        runs.append((int(s0), int(rx[-1])))
        rows[y] = runs


def row_at(frac):
    y = int(round(top + frac * height_px))
    for yy in range(max(top, y - 4), min(bottom, y + 5)):
        if yy in rows:
            return (yy, rows[yy])
    return None


marks = {}
for label, frac in (("head_top", 0.015), ("head_bottom", 0.115), ("collar", 0.145),
                     ("shoulder", 0.185), ("chest", 0.28), ("belt", 0.45),
                     ("hip", 0.52), ("thigh", 0.62), ("knee", 0.72),
                     ("shin", 0.82), ("hem", 0.885), ("ankle", 0.93)):
    marks[label] = row_at(frac)

for k, v in marks.items():
    if v:
        y, runs = v
        print("%-11s y=%4d (frac %.3f)  runs %s" % (k, y, (y - top) / height_px, runs))

# widest continuous run per region
def widest_row(lo, hi):
    cand = [(y, max((r[1] - r[0]) for r in runs)) for y, runs in rows.items() if lo <= (y - top) / height_px <= hi]
    return max(cand, key=lambda t: t[1]) if cand else None

shoulder = widest_row(0.15, 0.30)
hem = widest_row(0.75, 0.95)
print("widest upper", shoulder, "frac", (shoulder[0] - top) / height_px)
print("widest lower", hem, "frac", (hem[0] - top) / height_px)

# ---------------------------------------------------------------- outputs
clean = np.ones((H, W, 3), np.float32)
clean[fg] = a[fg]
Image.fromarray((clean * 255).astype(np.uint8)).save(os.path.join(OUT, "reference_cleaned.png"))

# a white-filled silhouette (alpha) for the same purpose
sil = np.zeros((H, W), np.float32)
sil[fg] = 1.0
Image.fromarray((sil * 255).astype(np.uint8)).save(os.path.join(OUT, "reference_silhouette.png"))

ann = (a * 255).astype(np.uint8).copy()
for y, _ in (shoulder, hem):
    ann[y, :] = (255, 0, 0)
ann[top:bottom + 1, left] = (0, 255, 0)
ann[top:bottom + 1, right] = (0, 255, 0)
for k, v in marks.items():
    if v:
        y, runs = v
        for (x0, x1) in runs:
            ann[max(0, y - 1):y + 2, x0:x1 + 1] = (0, 200, 255)
Image.fromarray(ann).save(os.path.join(OUT, "reference_annotated.png"))

out = {
    "width": W, "height": H,
    "char_top": top, "char_bottom": bottom, "char_height_px": height_px,
    "char_left": left, "char_right": right,
    "shoulder_row": list(shoulder), "hem_row": list(hem),
    "marks": {k: [v[0], v[1]] for k, v in marks.items() if v},
}
with open(os.path.join(MID, "reference_measurements.json"), "w") as f:
    json.dump(out, f, indent=1)
print("wrote cleaned reference + measurements")
