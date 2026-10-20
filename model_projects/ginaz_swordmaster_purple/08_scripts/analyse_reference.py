"""Analyse the purple concept art: segment the character, measure the silhouette,
and write a cleaned reference (background removed) for the colour projection bake.

The backdrop is a smooth warm-sand vertical gradient, horizontally uniform, so the
background of each row is estimated from that row's outer 8% of columns and the
character is whatever differs from it.

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
print("image", W, "x", H)

# ---- background estimate: per row, the median of the outer columns
edge = max(3, int(W * 0.08))
bg = np.empty_like(a)
for y in range(H):
    strip = np.concatenate([a[y, :edge], a[y, W - edge:]], axis=0)
    bg[y] = np.median(strip, axis=0)

dist = np.sqrt(((a - bg) ** 2).sum(2))
fg = dist > 0.10
# drop isolated noise
fg = fg & (dist > 0.13)
print("fg pixels", int(fg.sum()), "of", H * W)

# keep the largest connected blob (row/column flood fill, no scipy)
lbl = np.zeros((H, W), np.int32)
cur = 0
best = (0, 0)
stack = []
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

# fill small vertical holes inside the silhouette (the background showing through
# the gap between the coat's front panels is real, so holes are NOT filled)
ys, xs = np.nonzero(fg)
top, bottom = int(ys.min()), int(ys.max())
left, right = int(xs.min()), int(xs.max())
height_px = bottom - top
print("bbox x", left, right, " y", top, bottom, " height", height_px)

rows = {}
for y in range(top, bottom + 1):
    rx = np.nonzero(fg[y])[0]
    if len(rx):
        rows[y] = (int(rx.min()), int(rx.max()), len(rx))


def row_at(frac):
    y = int(round(top + frac * height_px))
    for yy in range(max(top, y - 3), min(bottom, y + 4)):
        if yy in rows:
            return (yy,) + rows[yy]
    return None


marks = {}
for label, frac in (("head_top", 0.02), ("head_bottom", 0.115), ("shoulder", 0.185),
                     ("chest", 0.28), ("belt", 0.45), ("waist", 0.42),
                     ("hip", 0.52), ("thigh", 0.62), ("knee", 0.72),
                     ("shin", 0.82), ("ankle", 0.92), ("hem", 0.88)):
    marks[label] = row_at(frac)

for k, v in marks.items():
    if v:
        y, x0, x1, n = v
        print("%-11s y=%4d (frac %.3f)  x %4d..%4d  width %4d  fill %d"
              % (k, y, (y - top) / height_px, x0, x1, x1 - x0, n))

low = [(y, *rows[y]) for y in rows if y > top + 0.40 * height_px]
up = [(y, *rows[y]) for y in rows if y < top + 0.30 * height_px]
hem = max(low, key=lambda r: r[2] - r[1])
sh = max(up, key=lambda r: r[2] - r[1])
print("widest lower row", hem, "frac", (hem[0] - top) / height_px)
print("widest upper row", sh, "frac", (sh[0] - top) / height_px)

# clean reference: character pixels kept, background -> white
clean = np.ones((H, W, 3), np.float32)
clean[fg] = a[fg]
Image.fromarray((clean * 255).astype(np.uint8)).save(os.path.join(OUT, "reference_cleaned.png"))

# annotation overlay for visual verification
ann = (a * 255).astype(np.uint8).copy()
for y, x0, x1, _ in (sh, hem):
    ann[y, x0:x1 + 1] = (255, 0, 0)
ann[top:bottom + 1, left] = (0, 255, 0)
ann[top:bottom + 1, right] = (0, 255, 0)
for k, v in marks.items():
    if v:
        y, x0, x1, n = v
        ann[max(0, y - 1):y + 2, x0:x1 + 1] = (0, 200, 255)
Image.fromarray(ann).save(os.path.join(OUT, "reference_annotated.png"))

out = {
    "width": W, "height": H,
    "char_top": top, "char_bottom": bottom, "char_height_px": height_px,
    "char_left": left, "char_right": right,
    "hem_row": list(hem), "shoulder_row": list(sh),
    "marks": {k: list(v) for k, v in marks.items() if v},
}
with open(os.path.join(MID, "reference_measurements.json"), "w") as f:
    json.dump(out, f, indent=1)
print("wrote cleaned reference + measurements")
