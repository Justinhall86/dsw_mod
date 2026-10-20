"""v4: build the 1024x1024 parts atlas textures (system Python + OpenCV).

  Part_Albedo.png / Part_MetallicGlossAO.png / Part_Normal.png  ->  04_textures/v4_parts_1024/

Helmet : crops of the (cleaned) reference picture pasted into the front / back / side islands (the loft's UVs are orthographic
         projections into them), sharpened, with the colours bled outwards past the UV footprint (no dark fringes under mip-mapping).
Pauldron: painted procedurally from the face groups exported by Blender (pad_uvdata.json): two-tier gold band, steel dome, dark underside,
         per-face tone, highlight lines on convex creases, dark lines on concave ones.
MetallicGlossAO: R metallic, G gloss, B ambient occlusion (per class: gold / steel / dark).  Normal: flat.
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

PROJ = os.path.dirname(HERE)
OUT = os.path.join(PROJ, "04_textures", "v4_parts_1024")
SIZE = A.ATLAS

GOLD = dict(light=(226, 199, 142), mid=(200, 168, 112), dark=(160, 128, 80))
STEEL = dict(light=(168, 171, 188), mid=(138, 141, 158), dark=(98, 101, 120))
DARK = (44, 44, 52)
MG = dict(gold=(0.78, 0.58), steel=(0.66, 0.46), dark=(0.10, 0.22))


def bleed(img, mask, iters=14):
    """push the colours of the masked-in pixels outwards (mask: uint8 0/1)"""
    img = img.astype(np.float32); m = mask.astype(np.float32)
    out = img * m[..., None]; w = m.copy()
    for _ in range(iters):
        num = cv2.blur(out, (3, 3)); den = cv2.blur(w, (3, 3))
        grow = (den > 1e-4) & (w < 0.5)
        new = num / np.maximum(den, 1e-4)[..., None]
        out[grow] = new[grow]; w[grow] = 1.0
        if not grow.any(): break
    res = np.where((m > 0.5)[..., None], img, out)
    return np.clip(res, 0, 255).astype(np.uint8)


def paste_helmet(albedo):
    ref = T.load_ref(True)
    for name, isl in A.ISLANDS.items():
        crop = ref[isl.v0:isl.v1, isl.u0:isl.u1]
        up = cv2.resize(crop, (isl.w, isl.h), interpolation=cv2.INTER_LANCZOS4).astype(np.float32)
        bl = cv2.GaussianBlur(up, (0, 0), 1.8)
        up = np.clip(up + 0.8 * (up - bl), 0, 255).astype(np.uint8)
        albedo[isl.ay:isl.ay + isl.h, isl.ax:isl.ax + isl.w] = up
    return albedo


def paste_helmet_bled(albedo):
    """helmet islands from the reference, with everything that is not this helmet (outline, background, collar flanges, pauldron band,
    collar rim) replaced by the nearest valid helmet colour first (validity masks of v4_helmet_bake.build_view)"""
    import v4_helmet_bake as HB
    d = json.load(open(os.path.join(HERE, "intermediate_data", "helm_cells.json")))
    allv = np.array([t["v"] for t in d["tris"]], dtype=np.float64)
    ref = T.load_ref(True).astype(np.float32)
    bl = cv2.GaussianBlur(ref, (0, 0), 1.3)
    sharp = np.clip(ref + 0.8 * (ref - bl), 0, 255)
    for name, isl in A.ISLANDS.items():
        bled, _ = HB.build_view(sharp, isl.view, allv)
        crop = bled[isl.v0:isl.v1, isl.u0:isl.u1]
        up = cv2.resize(crop, (isl.w, isl.h), interpolation=cv2.INTER_LANCZOS4)
        albedo[isl.ay:isl.ay + isl.h, isl.ax:isl.ax + isl.w] = np.clip(up, 0, 255).astype(np.uint8)
    return albedo


def helmet_footprint():
    d = json.load(open(os.path.join(HERE, "intermediate_data", "helm_uvdata.json")))
    m = np.zeros((SIZE, SIZE), np.uint8)
    for f in d["faces"]:
        pts = np.array([[u * SIZE, (1.0 - v) * SIZE] for u, v in f["uv"]], np.float32)
        cv2.fillPoly(m, [np.round(pts).astype(np.int32)], 1)
    return m


def classify(rgb):
    """gold / dark / steel masks (float 0..1) from RGB uint8"""
    hsv = cv2.cvtColor(rgb, cv2.COLOR_RGB2HSV)
    h, s, v = hsv[..., 0].astype(np.int32), hsv[..., 1] / 255.0, hsv[..., 2] / 255.0
    gold = ((h >= 10) & (h <= 28) & (s >= 0.22) & (v >= 0.40)).astype(np.float32)
    dark = (v < 0.20).astype(np.float32)
    gold = cv2.GaussianBlur(gold, (0, 0), 1.2); dark = cv2.GaussianBlur(dark, (0, 0), 1.2)
    return gold, np.clip(dark, 0, 1)


def paint_pauldron(albedo, mgmap):
    d = json.load(open(os.path.join(HERE, "intermediate_data", "pad_uvdata.json")))
    uv = np.array(d["uv"], np.float64); P = np.stack([uv[:, 0] * SIZE, (1.0 - uv[:, 1]) * SIZE], 1)
    SS = 3                                              # supersample the painting
    W = SIZE * SS
    layer = np.zeros((W, W, 3), np.float32); cover = np.zeros((W, W), np.uint8)
    mg_layer = np.zeros((W, W, 3), np.float32)
    rng = np.random.default_rng(7)
    L = np.array([-0.35, -0.45, 0.82]); L /= np.linalg.norm(L)
    base = {0: GOLD["dark"], 1: GOLD["light"], 2: GOLD["dark"], 3: GOLD["mid"], 4: STEEL["mid"], 5: STEEL["mid"], 6: DARK}
    cls = {0: "gold", 1: "gold", 2: "gold", 3: "gold", 4: "steel", 5: "steel", 6: "dark"}
    polys = d["polys"]
    colors = []
    for pi, p in enumerate(polys):
        g = p["grp"]; col = np.array(base[g], np.float32)
        if g == 6:
            colors.append(col); continue                  # underside: one dark patch (below)
        n = np.array(p["n"]); lam = float(np.clip(n @ L, -1, 1))
        tone = 1.0 + 0.10 * lam + rng.normal(0, 0.022)
        if g == 5:                                       # dome facets: a clear light/dark steel range
            col = np.array(STEEL["dark"], np.float32) + (np.array(STEEL["light"], np.float32) - np.array(STEEL["dark"], np.float32)) * float(np.clip(0.5 + 0.9 * lam, 0, 1))
            tone = 1.0 + rng.normal(0, 0.02)
        elif g == 4:
            col = np.array(STEEL["dark"], np.float32) + (np.array(STEEL["light"], np.float32) - np.array(STEEL["dark"], np.float32)) * float(np.clip(0.45 + 0.8 * lam, 0, 1))
            tone = 1.0 + rng.normal(0, 0.02)
        col = np.clip(col * tone, 0, 255)
        colors.append(col)
        pts = np.array([P[i] * SS for i in p["v"]], np.float32)
        cv2.fillPoly(layer, [np.round(pts).astype(np.int32)], tuple(float(x) for x in col), lineType=cv2.LINE_8)
        cv2.fillPoly(cover, [np.round(pts).astype(np.int32)], 1)
        mgv = MG[cls[g]]
        cv2.fillPoly(mg_layer, [np.round(pts).astype(np.int32)], (mgv[0], mgv[1], 0.62 if g == 6 else 1.0))
    # creases
    for e in d["edges"]:
        if e["g0"] < 0 or e["g0"] == 6 or e["g1"] == 6: continue
        a, b = P[e["a"]] * SS, P[e["b"]] * SS
        c0 = colors[0]  # placeholder
        # average colour of the two adjacent faces' groups
        def gcol(gp): return np.array(base[gp], np.float32)
        avg = 0.5 * (gcol(e["g0"]) + gcol(e["g1"]))
        both_gold = cls[e["g0"]] == "gold" and cls[e["g1"]] == "gold"
        if e["ang"] > 14:
            hi = avg + (np.array([255, 245, 225], np.float32) - avg) * (0.55 if both_gold else 0.45)
            cv2.line(layer, tuple(np.round(a).astype(int)), tuple(np.round(b).astype(int)), tuple(float(x) for x in hi), 3 * SS // 2 + 1, cv2.LINE_AA)
        elif e["ang"] < -14:
            lo = avg * 0.62
            cv2.line(layer, tuple(np.round(a).astype(int)), tuple(np.round(b).astype(int)), tuple(float(x) for x in lo), 2 * SS // 2 + 1, cv2.LINE_AA)
    # downsample
    small = cv2.resize(layer, (SIZE, SIZE), interpolation=cv2.INTER_AREA)
    mgs = cv2.resize(mg_layer, (SIZE, SIZE), interpolation=cv2.INTER_AREA)
    cov = cv2.resize(cover.astype(np.float32), (SIZE, SIZE), interpolation=cv2.INTER_AREA)
    # bleed past the polygon footprint so mip-mapping does not pick up foreign colours
    footprint = (cov > 0.98).astype(np.uint8)
    small8 = np.clip(small, 0, 255).astype(np.uint8)
    small8 = bleed(small8, footprint, iters=10)
    mgs = bleed((mgs * 255).astype(np.uint8), footprint, iters=10).astype(np.float32) / 255.0
    x0, y0, x1, y1 = A.PAD_RECT
    sel = np.zeros((SIZE, SIZE), bool); sel[max(y0 - 6, 0):min(y1 + 6, SIZE), max(x0 - 6, 0):min(x1 + 6, SIZE)] = True
    albedo[sel] = small8[sel]
    mgmap[sel] = mgs[sel]
    px, py = A.PAD_DARK_PX                                  # dark patch for the underside faces
    albedo[int(py) - 7:int(py) + 8, int(px) - 7:int(px) + 8] = DARK
    mgmap[int(py) - 7:int(py) + 8, int(px) - 7:int(px) + 8] = (MG["dark"][0], MG["dark"][1], 0.62)
    return albedo, mgmap


def main():
    os.makedirs(OUT, exist_ok=True)
    albedo = np.full((SIZE, SIZE, 3), STEEL["mid"], np.uint8)
    albedo = paste_helmet_bled(albedo)
    # MetallicGlossAO
    mgmap = np.zeros((SIZE, SIZE, 3), np.float32)
    gold, dark = classify(albedo)
    steel = np.clip(1.0 - gold - dark, 0, 1)
    mgmap[..., 0] = gold * MG["gold"][0] + dark * MG["dark"][0] + steel * MG["steel"][0]
    mgmap[..., 1] = gold * MG["gold"][1] + dark * MG["dark"][1] + steel * MG["steel"][1]
    mgmap[..., 2] = 1.0
    albedo, mgmap = paint_pauldron(albedo, mgmap)
    mg8 = np.clip(mgmap * 255.0 + 0.5, 0, 255).astype(np.uint8)
    nrm = np.zeros((SIZE, SIZE, 3), np.uint8); nrm[...] = (128, 128, 255)

    def save(arr, name):
        rgba = np.dstack([arr, np.full(arr.shape[:2], 255, np.uint8)])
        cv2.imwrite(os.path.join(OUT, name), cv2.cvtColor(rgba, cv2.COLOR_RGBA2BGRA))
    save(albedo, "Part_Albedo.png"); save(mg8, "Part_MetallicGlossAO.png"); save(nrm, "Part_Normal.png")
    print("wrote", OUT)
    cv2.imwrite(os.path.join(PROJ, "02_progress_photos", "10_parts_quality", "tex_v4_albedo_preview.png"), cv2.cvtColor(albedo, cv2.COLOR_RGB2BGR))


if __name__ == "__main__":
    main()
