"""v4: semantic helmet bake (system Python + OpenCV).

The loft is not exactly the designed helmet, so blending the photo pixels of three views mixes different features. Instead only the
*classes* come from the reference (gold brow, black visor: crisp masks sampled from the view that best faces each triangle) and the
shading comes from the shell itself: per-triangle tone from a fixed key light, a little low-frequency tone from the picture, highlight
lines along convex creases and dark lines along concave ones - the same painted style as the procedural pauldrons.
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

GOLD = dict(light=(230, 204, 148), mid=(202, 170, 114), dark=(158, 126, 80))
STEEL = dict(light=(176, 179, 196), mid=(142, 145, 162), dark=(98, 101, 120))
DARKC = (28, 28, 34)
LIGHT = np.array([-0.35, -0.45, 0.82]); LIGHT /= np.linalg.norm(LIGHT)


def pic_px(view, h, z):
    return A.CX[view] + A.SIGN[view] * A.S * np.asarray(h), A.ROW0 - A.S * np.asarray(z)


def class_views(ref, tri_pts):
    H, W = ref.shape[:2]
    gray = cv2.cvtColor(ref.astype(np.uint8), cv2.COLOR_RGB2GRAY).astype(np.float32)
    gold_all = (T.gold_mask(ref.astype(np.uint8)) > 0).astype(np.float32)
    dark_all = (ref.max(2) < 52).astype(np.float32)
    out = {}
    for view in ("front", "back", "side"):
        sil = np.zeros((H, W), np.uint8)
        h, z = A.loft_to_pic(view, tri_pts.reshape(-1, 3))
        u, v = pic_px(view, h, z)
        for t in np.stack([u, v], 1).reshape(-1, 3, 2):
            cv2.fillConvexPoly(sil, np.round(t).astype(np.int32), 1)
        sil = cv2.morphologyEx(sil, cv2.MORPH_CLOSE, np.ones((5, 5), np.uint8))
        core = cv2.erode(sil, np.ones((7, 7), np.uint8))

        def zone(hmin, hmax, zmin, zmax):
            uu, vv = pic_px(view, [hmin, hmax], [zmax, zmin])
            x0, x1 = int(min(uu)), int(max(uu)); y0, y1 = int(min(vv)), int(max(vv))
            core[max(y0, 0):y1, max(x0, 0):x1] = 0
        if view == "front":
            zone(0.128, 0.30, 1.50, 1.80); zone(-0.30, -0.128, 1.50, 1.80)        # collar flanges beside the cheeks
        elif view == "side":
            zone(-0.065, 0.40, 1.50, 1.805)                                       # pauldron band over the lower helmet
        else:
            zone(-0.30, 0.30, 1.50, 1.815)                                        # collar rim under the helmet
        cf = core.astype(np.float32)
        out[view] = dict(gold=cv2.GaussianBlur(gold_all * cf, (0, 0), 1.3), dark=cv2.GaussianBlur(dark_all * cf, (0, 0), 1.0),
                         lum=cv2.GaussianBlur(gray, (0, 0), 3.5), core=cf)
    return out


def bake_semantic(albedo, cells_json=None):
    d = json.load(open(cells_json or os.path.join(HERE, "intermediate_data", "helm_cells.json")))
    tris = d["tris"]
    allv = np.array([t["v"] for t in tris], dtype=np.float64)
    CV = class_views(T.load_ref(True).astype(np.float32), allv)
    lum_mean = {}
    for view, c in CV.items():
        g = c["gold"] > 0.6; st = (c["gold"] < 0.1) & (c["dark"] < 0.1) & (c["core"] > 0.5)
        lum_mean[view] = (float(c["lum"][g].mean()) if g.any() else 170.0, float(c["lum"][st].mean()) if st.any() else 130.0)
    # crease angle per triangle edge
    edge_tris = {}
    for ti, t in enumerate(tris):
        vi = t["vi"]
        for k in range(3):
            a, b = vi[k], vi[(k + 1) % 3]
            edge_tris.setdefault((min(a, b), max(a, b)), []).append(ti)
    cen = [np.array(t["v"]).mean(0) for t in tris]

    def crease(ti, e0, e1):
        others = [o for o in edge_tris[(min(e0, e1), max(e0, e1))] if o != ti]
        if not others: return 0.0
        o = others[0]; n1, n2 = np.array(tris[ti]["n"]), np.array(tris[o]["n"])
        a = float(np.degrees(np.arccos(np.clip(n1 @ n2, -1, 1))))
        return a if float(n1 @ (cen[o] - cen[ti])) < 0 else -a

    inner = A.CELL - 2 * A.CELL_MARGIN
    by_quad = {}
    for ti, t in enumerate(tris): by_quad.setdefault(t["quad"], {})[t["half"]] = ti
    ii, jj = np.meshgrid(np.arange(A.CELL), np.arange(A.CELL))
    s = (ii + 0.5 - A.CELL_MARGIN) / inner; tt = (jj + 0.5 - A.CELL_MARGIN) / inner
    sf, tf = s.reshape(-1), tt.reshape(-1)

    def sstep(x, a, b):
        y = np.clip((x - a) / (b - a), 0, 1); return y * y * (3 - 2 * y)

    def lerp3(lo, hi, f):
        lo = np.array(lo, np.float32); hi = np.array(hi, np.float32); return lo[None, :] + (hi - lo)[None, :] * f[:, None]

    for q, halves in by_quad.items():
        x0, y0 = A.cell_px(q)
        tA = tris[halves[0]]; a, b, c = np.array(tA["v"]); two = 1 in halves
        P0 = a + sf[:, None] * (b - a) + tf[:, None] * (c - b)
        nA = np.array(tA["n"])
        if two:
            tB = tris[halves[1]]; dd = np.array(tB["v"][2]); nB = np.array(tB["n"])
            P1 = a + tf[:, None] * (dd - a) + sf[:, None] * (c - dd)
            use1 = tf > sf
            P = np.where(use1[:, None], P1, P0); N = np.where(use1[:, None], nB[None, :], nA[None, :])
        else:
            P = P0; N = np.broadcast_to(nA, P0.shape)
        dots = np.stack([-N[:, 1], N[:, 1], np.abs(N[:, 0])], 1)
        vsel = np.argmax(dots, 1); vsel[N[:, 2] > 0.55] = 3
        gold = np.zeros(len(P), np.float32); dark = np.zeros(len(P), np.float32); mod = np.zeros(len(P), np.float32)
        for vi_, view in enumerate(("front", "back", "side")):
            sel = vsel == vi_
            if not sel.any(): continue
            h, z = A.loft_to_pic(view, P[sel]); u, v = pic_px(view, h, z)
            mx = u.astype(np.float32).reshape(1, -1); my = v.astype(np.float32).reshape(1, -1)
            cv_ = CV[view]
            gs = cv2.remap(cv_["gold"], mx, my, cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)[0]
            gold[sel] = gs
            dark[sel] = cv2.remap(cv_["dark"], mx, my, cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)[0]
            lm = cv2.remap(cv_["lum"], mx, my, cv2.INTER_LINEAR, borderMode=cv2.BORDER_REPLICATE)[0]
            gm, sm = lum_mean[view]
            mod[sel] = np.where(gs > 0.5, (lm - gm) / gm, (lm - sm) / sm)
        g = sstep(gold, 0.32, 0.68); dk = sstep(dark, 0.32, 0.68) * (1 - g)
        lam = np.clip(N @ LIGHT, -1, 1); m = np.clip(mod, -0.18, 0.18)
        steel = lerp3(STEEL["dark"], STEEL["light"], np.clip(0.5 + 0.7 * lam + 1.2 * m, 0, 1))
        top = N[:, 2] > 0.55
        steel[top] = lerp3(STEEL["mid"], STEEL["light"], np.clip(0.4 + 0.6 * lam[top], 0, 1))
        goldc = lerp3(GOLD["dark"], GOLD["light"], np.clip(0.35 + 0.6 * lam + 1.5 * m, 0, 1))
        col = steel * (1 - g - dk)[:, None] + goldc * g[:, None] + np.array(DARKC, np.float32)[None, :] * dk[:, None]
        # crease lines along the quad's own edges (distance in texels, inside this cell only)
        vA = tA["vi"]
        if two:
            vB = tB["vi"]
            edges = [(halves[0], vA[0], vA[1], tf * inner), (halves[0], vA[1], vA[2], (1 - sf) * inner),
                     (halves[1], vB[1], vB[2], (1 - tf) * inner), (halves[1], vB[2], vB[0], sf * inner)]
        else:
            edges = [(halves[0], vA[0], vA[1], tf * inner), (halves[0], vA[1], vA[2], (1 - sf) * inner),
                     (halves[0], vA[2], vA[0], (sf - tf) * inner / 1.4142)]
        for ti, e0, e1, dist in edges:
            an = crease(ti, e0, e1)
            if abs(an) < 12: continue
            w = np.clip(1.0 - np.maximum(dist, 0) / 1.6, 0, 1); w[dist < -0.5] = 0
            if an > 0:
                col = col * (1 - 0.5 * w[:, None]) + np.array([255, 246, 228], np.float32)[None, :] * (0.5 * w[:, None])
            else:
                col = col * (1 - 0.35 * w[:, None])
        albedo[y0:y0 + A.CELL, x0:x0 + A.CELL] = np.clip(col, 0, 255).reshape(A.CELL, A.CELL, 3).astype(np.uint8)
    return albedo
