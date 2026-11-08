"""Split the cruiser hull into flat panels (edge-connected triangles with the same facing) so whole
plates can be painted a house colour. Writes 04_textures/_wreck_panels.npz (tri -> panel id) and a
labelled top/side map 02_progress_photos/cruiser_panels/PANEL_MAP.png for picking panels.

    python 75_panels.py
"""
import os
import numpy as np
from PIL import Image, ImageDraw, ImageFont
try:
    FONT = ImageFont.truetype("arialbd.ttf", 14)
except OSError:
    FONT = ImageFont.load_default()

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
TEX = os.path.join(PROJ, "04_textures")
g = np.load(os.path.join(TEX, "_wreck_geo.npz"))
pos, nrm = g["pos"], g["nrm"]
T = len(pos)
key = np.round(pos / 0.05).astype(np.int64)
vid = {}
tv = np.zeros((T, 3), np.int64)
for t in range(T):
    for k in range(3):
        tv[t, k] = vid.setdefault(tuple(key[t, k]), len(vid))
edges = {}
for t in range(T):
    for a, b in ((0, 1), (1, 2), (2, 0)):
        e = tuple(sorted((tv[t, a], tv[t, b])))
        edges.setdefault(e, []).append(t)
par = list(range(T))


def find(i):
    while par[i] != i:
        par[i] = par[par[i]]; i = par[i]
    return i


for ts in edges.values():
    for i in range(len(ts)):
        for j in range(i + 1, len(ts)):
            a, b = ts[i], ts[j]
            if np.dot(nrm[a], nrm[b]) > 0.985:
                par[find(a)] = find(b)
root = np.array([find(i) for i in range(T)])
_, pid = np.unique(root, return_inverse=True)
area = 0.5 * np.linalg.norm(np.cross(pos[:, 1] - pos[:, 0], pos[:, 2] - pos[:, 0]), axis=1)
cen = pos.mean(1)
P = pid.max() + 1
parea = np.bincount(pid, area, P)
pc = np.stack([np.bincount(pid, area * cen[:, i], P) for i in range(3)], 1) / np.maximum(parea, 1e-9)[:, None]
pn = np.stack([np.bincount(pid, area * nrm[:, i], P) for i in range(3)], 1)
pn /= np.maximum(np.linalg.norm(pn, axis=1), 1e-9)[:, None]
np.savez(os.path.join(TEX, "_wreck_panels.npz"), pid=pid, parea=parea, pc=pc, pn=pn)
big = np.argsort(-parea)
print("panels", P, "  >20 area:", int((parea > 20).sum()))
for p in big[:60]:
    print("P%3d area %7.1f  c(%6.1f %6.1f %5.1f)  n(%5.2f %5.2f %5.2f)" % (p, parea[p], *pc[p], *pn[p]))

out = os.path.join(PROJ, "02_progress_photos", "cruiser_panels"); os.makedirs(out, exist_ok=True)
rng = np.random.default_rng(3)
col = (rng.uniform(0.3, 0.95, (P, 3)) * 255).astype(int)
SC = 8
sheets = []
for name, sel, (i, j), order, flip in (("TOP (nose left)", nrm[:, 2] > 0.15, (0, 1), 2, -1),
                                       ("SIDE -Y wall (nose left)", nrm[:, 1] < -0.15, (0, 2), 1, -1)):
    idx = np.where(sel)[0]
    idx = idx[np.argsort(cen[idx, order] * (1 if order == 2 else -1))]
    u0, u1 = pos[:, :, i].min() - 3, pos[:, :, i].max() + 3
    v0, v1 = pos[:, :, j].min() - 3, pos[:, :, j].max() + 3
    im = Image.new("RGB", (int((u1 - u0) * SC), int((v1 - v0) * SC) + 30), (235, 235, 235))
    d = ImageDraw.Draw(im)
    tf = lambda a, b: ((a - u0) * SC, (v1 - b) * SC + 30)
    for t in idx:
        d.polygon([tf(pos[t, k, i], pos[t, k, j]) for k in range(3)], fill=tuple(col[pid[t]]), outline=(40, 40, 40))
    for p in big:
        if parea[p] < 25 or not np.any(pid[idx] == p):
            continue
        if (order == 2 and pn[p, 2] < 0.15) or (order == 1 and pn[p, 1] > -0.15):
            continue
        x, y = tf(pc[p, i], pc[p, j])
        d.text((x - 8, y - 6), str(p), fill=(0, 0, 0), font=FONT)
    d.text((10, 5), name, fill=(0, 0, 0), font=FONT)
    sheets.append(im)
Wd = max(s.width for s in sheets)
sheet = Image.new("RGB", (Wd, sum(s.height for s in sheets)), (255, 255, 255))
y = 0
for s in sheets:
    sheet.paste(s, (0, y)); y += s.height
sheet.save(os.path.join(out, "PANEL_MAP.png"))
print("PANELS_OK")
