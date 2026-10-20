"""v4: bake the helmet's cells from the reference picture (system Python + OpenCV + numpy).

For every texel of every cell (one cell per quad of the loft, see v4_helmet_uv.py) the 3D position on the triangle's plane is computed
(texels in the cell margin extrapolate the plane, which bleeds the neighbouring surface into the margin), projected into the reference
pictures (front / back / side) through the silhouette registration, and the three samples are blended by max(0, n.d)^P x validity.
Validity masks keep foreign picture content out: the outline / background (outside the registered silhouette, eroded), the collar flanges
beside the cheeks, the pauldron band in the side picture and the collar rim under the helmet in the back picture. Invalid picture areas
are bled from valid ones before sampling.
"""
import json
import os
import sys

import cv2
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import v4_atlas as A  # noqa: E402
import v4_trace as T  # noqa: E402

P_EXP = 4.0
VIEW_DIR = {"front": np.array([0.0, -1.0, 0.0]), "back": np.array([0.0, 1.0, 0.0])}


def bleed(img, mask, iters=40):
    img = img.astype(np.float32); m = mask.astype(np.float32)
    out = img * m[..., None]; w = m.copy()
    for _ in range(iters):
        num = cv2.blur(out, (5, 5)); den = cv2.blur(w, (5, 5))
        grow = (den > 1e-4) & (w < 0.5)
        if not grow.any(): break
        new = num / np.maximum(den, 1e-4)[..., None]
        out[grow] = new[grow]; w[grow] = 1.0
    res = np.where((m > 0.5)[..., None], img, out)
    return np.clip(res, 0, 255).astype(np.float32)


def pic_px(view, h, z):
    u = A.CX[view] + A.SIGN[view] * A.S * np.asarray(h); v = A.ROW0 - A.S * np.asarray(z)
    return u, v


def build_view(ref_sharp, view, tri_pts):
    """-> (bled picture float32 (full size), soft validity weight (full size))"""
    H, W = ref_sharp.shape[:2]
    sil = np.zeros((H, W), np.uint8)
    h, z = A.loft_to_pic(view, tri_pts.reshape(-1, 3))
    u, v = pic_px(view, h, z)
    pts = np.stack([u, v], 1).reshape(-1, 3, 2)
    for t in pts:
        cv2.fillConvexPoly(sil, np.round(t).astype(np.int32), 1)
    sil = cv2.morphologyEx(sil, cv2.MORPH_CLOSE, np.ones((5, 5), np.uint8))
    core = cv2.erode(sil, np.ones((9, 9), np.uint8))                       # ~4 px = 2.5 mm inside the registered silhouette
    # exclusion zones (picture world coordinates)
    def zone(hmin, hmax, zmin, zmax):
        uu, vv = pic_px(view, [hmin, hmax], [zmax, zmin])
        x0, x1 = int(min(uu)), int(max(uu)); y0, y1 = int(min(vv)), int(max(vv))
        core[max(y0, 0):y1, max(x0, 0):x1] = 0
    zone(-0.40, 0.40, 2.006, 2.20)                                               # top edge: outline / background
    if view == "front":
        zone(0.128, 0.30, 1.50, 1.80); zone(-0.30, -0.128, 1.50, 1.80)           # collar flanges beside the cheeks
        zone(0.105, 0.30, 1.50, 1.76); zone(-0.30, -0.105, 1.50, 1.76)
    elif view == "side":
        zone(-0.065, 0.40, 1.50, 1.805)                                          # pauldron band covers the lower helmet
        zone(-0.17, 0.40, 1.50, 1.715)
    elif view == "back":
        zone(-0.30, 0.30, 1.50, 1.815)                                           # collar rim under the helmet
    valid = core
    if view == "front":
        # the cleaned reference has an inpainting smear where Blender's green z-axis line crossed the brow tip: repaint it
        # (gold above the V-shaped lower brow edge, black visor below)
        ref_sharp = ref_sharp.copy()
        uu, vv = pic_px(view, [-0.05, 0.05], [1.885, 1.828])
        x0, x1, y0, y1 = int(min(uu)), int(max(uu)) + 1, int(min(vv)), int(max(vv)) + 1
        gu, gv = pic_px(view, [0.0], [1.872])
        gold = ref_sharp[int(gv[0]) - 2:int(gv[0]) + 3, int(gu[0]) - 6:int(gu[0]) + 7].reshape(-1, 3).mean(0)
        for yy in range(y0, y1):
            zz = (A.ROW0 - yy) / A.S
            for xx in range(x0, x1):
                hx = (xx - A.CX[view]) / A.S
                zv = 1.848 + abs(hx) * 0.24
                if zz < 1.835 and abs(hx) > 0.03: continue
                ref_sharp[yy, xx] = gold if zz > zv else (22, 22, 27)
    bled = bleed(ref_sharp, valid)
    wsoft = cv2.GaussianBlur(valid.astype(np.float32), (0, 0), 2.5)
    return bled, wsoft


def bake(albedo, cells_json=None, return_debug=False):
    d = json.load(open(cells_json or os.path.join(HERE, "intermediate_data", "helm_cells.json")))
    tris = d["tris"]
    allv = np.array([t["v"] for t in tris], dtype=np.float64)              # (T,3,3)
    ref = T.load_ref(True).astype(np.float32)
    bl = cv2.GaussianBlur(ref, (0, 0), 1.3)
    sharp = np.clip(ref + 0.9 * (ref - bl), 0, 255)
    views = {}
    for view in ("front", "back", "side"):
        views[view] = build_view(sharp, view, allv)
    nq = max(t["quad"] for t in tris) + 1
    print("cells:", nq, "triangles:", len(tris))
    inner = A.CELL - 2 * A.CELL_MARGIN
    by_quad = {}
    for t in tris: by_quad.setdefault(t["quad"], {})[t["half"]] = t
    ii, jj = np.meshgrid(np.arange(A.CELL), np.arange(A.CELL))               # texel indices (row j, col i)
    s = (ii + 0.5 - A.CELL_MARGIN) / inner; tt = (jj + 0.5 - A.CELL_MARGIN) / inner
    for q, halves in by_quad.items():
        x0, y0 = A.cell_px(q)
        if y0 + A.CELL > 424 + 32:
            print("cell overflow", q)
        # quad vertices a,b,c,d from the two halves
        if 0 in halves and 1 in halves:
            a, b, c = np.array(halves[0]["v"]); d = np.array(halves[1]["v"][2])
        else:
            a, b, c = np.array(halves[0]["v"]); d = None
        # texel positions: half 0 where s >= t (corners (0,0),(1,0),(1,1)), half 1 where t > s (corners (0,0),(1,1),(0,1))
        P0 = a[None, None, :] + s[..., None] * (b - a) + tt[..., None] * (c - b)
        if d is not None:
            P1 = a[None, None, :] + tt[..., None] * (d - a) + s[..., None] * (c - d)
            use1 = (tt > s)[..., None]
            P = np.where(use1, P1, P0)
            n0 = np.array(halves[0]["n"]); n1 = np.array(halves[1]["n"])
            N = np.where(use1, n1[None, None, :], n0[None, None, :])
        else:
            P = P0; N = np.broadcast_to(np.array(halves[0]["n"]), P0.shape)
        flat = P.reshape(-1, 3); nflat = N.reshape(-1, 3)
        acc = np.zeros((flat.shape[0], 3), np.float32); wsum = np.zeros(flat.shape[0], np.float32)
        for view in ("front", "back", "side"):
            img, wsoft = views[view]
            h, z = A.loft_to_pic(view, flat)
            u, v = pic_px(view, h, z)
            mx = u.astype(np.float32).reshape(1, -1); my = v.astype(np.float32).reshape(1, -1)
            col = cv2.remap(img, mx, my, cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)[0]
            wv = cv2.remap(wsoft, mx, my, cv2.INTER_LINEAR, borderMode=cv2.BORDER_REPLICATE)[0]
            if view == "side": dot = np.abs(nflat[:, 0])
            else: dot = np.clip(nflat @ VIEW_DIR[view], 0, None)
            w = (dot ** P_EXP) * (0.08 + 0.92 * wv)
            acc += col * w[:, None]; wsum += w
        out = np.where((wsum > 1e-5)[:, None], acc / np.maximum(wsum, 1e-5)[:, None], np.array([138, 141, 158], np.float32))
        albedo[y0:y0 + A.CELL, x0:x0 + A.CELL] = np.clip(out, 0, 255).reshape(A.CELL, A.CELL, 3).astype(np.uint8)
    return albedo
