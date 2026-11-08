"""Find the crashed cruiser's own frame: cluster area-weighted face normals (boxy hull ->
3 orthogonal dominant directions), print them and the rotation that levels the hull.

    python 63_wreck_axes.py <obj> <object name>
"""
import sys
import numpy as np


def load_obj(path, name):
    V, F, cur, base, keepbase = [], [], None, 0, None
    for ln in open(path):
        if ln.startswith("o "):
            cur = ln[2:].strip()
        elif ln.startswith("v "):
            V.append([float(x) for x in ln.split()[1:4]])
        elif ln.startswith("f ") and cur == name:
            F.append([int(t.split("/")[0]) - 1 for t in ln.split()[1:4]])
    return np.array(V), np.array(F)


V, F = load_obj(sys.argv[1], sys.argv[2])
a, b, c = V[F[:, 0]], V[F[:, 1]], V[F[:, 2]]
n = np.cross(b - a, c - a); area = np.linalg.norm(n, axis=1) / 2
ok = area > 1e-6; n = n[ok] / (2 * area[ok, None]); area = area[ok]
# greedy clustering of directions (sign-folded)
dirs = []
order = np.argsort(-area)
rem = np.ones(len(n), bool)
for _ in range(6):
    idx = order[rem[order]]
    if not len(idx):
        break
    best, bw = None, 0
    for i in idx[:400]:
        w = area[np.abs(n @ n[i]) > 0.97].sum()
        if w > bw:
            best, bw = n[i], w
    m = np.abs(n @ best) > 0.97
    s = np.sign(n[m] @ best)[:, None]
    d = (n[m] * s * area[m, None]).sum(0); d /= np.linalg.norm(d)
    dirs.append((d, area[m].sum())); rem &= ~m
tot = area.sum()
for d, w in dirs:
    print("dir", d.round(3), "area %.0f%%" % (100 * w / tot))
used = V[np.unique(F)]
print("verts", len(used), "bbox", used.min(0).round(1), used.max(0).round(1))
# PCA for the long axis
X = used - used.mean(0)
w, e = np.linalg.eigh(X.T @ X)
print("PCA axes (small->large):"); print(e.T.round(3)); print("extent var", w.round(0))
