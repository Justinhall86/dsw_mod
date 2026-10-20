"""v4: segment the flat-shaded facets of the reference picture (watershed on a Lab gradient) and write an annotated overlay.

  python v4_segment.py <view> <h0> <h1> <z0> <z1> <zoom> <out_prefix> [--grad 6.0] [--min 120] [--blur 2]

writes <out_prefix>_regions.png (random colours + region ids), <out_prefix>_edges.png (boundaries on the picture),
and <out_prefix>.json: {"regions": {id: {"area_m2", "centroid":[h,z], "poly":[[h,z],...], "mean_rgb"}}, "zoom", "view", "bounds"}
All coordinates are world metres of the reference picture (back view: h = world x).
"""
import json
import os
import sys

import cv2
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import v4_trace as T


def segment(view, h0, h1, z0, z1, zoom, out_prefix, grad_t=6.0, min_px=120, blur=2, dh=0.0, dz=0.0):
    ref = T.load_ref(True)
    vc = T.ViewCrop(ref, view, h0, h1, z0, z1, zoom=zoom, dh=dh, dz=dz)
    img = vc.img.copy()
    sm = img
    for _ in range(blur):
        sm = cv2.bilateralFilter(sm, 9, 30, 9)
    lab = cv2.cvtColor(sm, cv2.COLOR_RGB2LAB).astype(np.float32)
    g = np.zeros(lab.shape[:2], np.float32)
    for c in range(3):
        gx = cv2.Sobel(lab[..., c], cv2.CV_32F, 1, 0, ksize=3); gy = cv2.Sobel(lab[..., c], cv2.CV_32F, 0, 1, ksize=3)
        g += gx * gx + gy * gy
    g = np.sqrt(g)
    flat = (g < grad_t).astype(np.uint8)
    flat = cv2.erode(flat, np.ones((5, 5), np.uint8))
    n, markers = cv2.connectedComponents(flat, connectivity=4)
    # drop tiny markers
    cnt = np.bincount(markers.ravel(), minlength=n)
    keep = np.where(cnt >= min_px)[0]; keep = keep[keep != 0]
    remap = np.zeros(n, np.int32); remap[keep] = np.arange(1, len(keep) + 1)
    markers = remap[markers].astype(np.int32)
    markers_ws = markers.copy()
    cv2.watershed(cv2.cvtColor(sm, cv2.COLOR_RGB2BGR), markers_ws)
    N = len(keep)
    # outputs
    rng = np.random.default_rng(3)
    cols = rng.integers(40, 255, (N + 2, 3)).astype(np.uint8)
    reg = np.zeros_like(img)
    for i in range(1, N + 1):
        reg[markers_ws == i] = cols[i]
    edges = img.copy(); edges[markers_ws == -1] = (255, 0, 255)
    info = {}
    H, W = markers_ws.shape
    for i in range(1, N + 1):
        m = (markers_ws == i).astype(np.uint8)
        a = int(m.sum())
        if a < min_px: continue
        ys, xs = np.nonzero(m)
        cx, cy = xs.mean(), ys.mean()
        cnts, _ = cv2.findContours(m, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
        c = max(cnts, key=cv2.contourArea)
        ap = cv2.approxPolyDP(c, 0.0025 * zoom * T.S * 0.5 + 2.0, True)[:, 0, :]
        poly = [list(vc.px_to_world(float(x), float(y))) for x, y in ap]
        info[str(i)] = dict(area_m2=a / (zoom * T.S) ** 2, centroid=list(vc.px_to_world(cx, cy)), poly=poly,
                            mean_rgb=[int(v) for v in img[m > 0].mean(0)])
        cv2.putText(reg, str(i), (int(cx) - 8, int(cy) + 4), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 2, cv2.LINE_AA)
        cv2.putText(reg, str(i), (int(cx) - 8, int(cy) + 4), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1, cv2.LINE_AA)
    cv2.imwrite(out_prefix + "_regions.png", cv2.cvtColor(reg, cv2.COLOR_RGB2BGR))
    cv2.imwrite(out_prefix + "_edges.png", cv2.cvtColor(edges, cv2.COLOR_RGB2BGR))
    json.dump(dict(view=view, zoom=zoom, bounds=[h0, h1, z0, z1], regions=info), open(out_prefix + ".json", "w"))
    print("regions:", len(info))
    return info


if __name__ == "__main__":
    a = sys.argv[1:]
    gt = float(a[a.index("--grad") + 1]) if "--grad" in a else 6.0
    mn = int(a[a.index("--min") + 1]) if "--min" in a else 120
    bl = int(a[a.index("--blur") + 1]) if "--blur" in a else 2
    segment(a[0], float(a[1]), float(a[2]), float(a[3]), float(a[4]), int(a[5]), a[6], gt, mn, bl)
