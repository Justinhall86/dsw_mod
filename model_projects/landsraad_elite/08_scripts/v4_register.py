"""v4: register the reference picture's helmet to the loft by silhouette fitting (system Python + OpenCV).
For each view the picture's helmet silhouette (inside the orange selection outline, restricted to the head zone) is compared with the
loft's projected silhouette after   h_p = sh*(h_s - h_c) + h_c + th ,  z_p = sz*(z_s - z_c) + z_c + tz   (picture = f(sculpt frame)).
Coordinate-descent on (sh, th, sz, tz) maximising the IoU. Prints the best parameters per view."""
import json, os, sys
import cv2, numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import v4_trace as T

def ref_mask(view, h0, h1, z0, z1):
    ref = T.load_ref(False)                                   # original picture with the orange outline
    vc = T.ViewCrop(ref, view, h0, h1, z0, z1, zoom=1)
    im = vc.img
    r, g, b = im[..., 0].astype(int), im[..., 1].astype(int), im[..., 2].astype(int)
    orange = ((r > 150) & (r - b > 55) & (r > g) & (g > b) & ((r - g) > 25)).astype(np.uint8)
    orange = cv2.dilate(orange, np.ones((7, 7), np.uint8))
    free = (orange == 0).astype(np.uint8)
    n, lab = cv2.connectedComponents(free, connectivity=4)
    outside = np.zeros_like(free)
    for (y, x) in ((0, 0), (0, im.shape[1] - 1)):
        outside |= (lab == lab[y, x]).astype(np.uint8)
    inside = 1 - outside                                       # helmet (+ outline pixels)
    inside = cv2.erode(inside, np.ones((7, 7), np.uint8))      # undo the outline dilation
    return vc, inside

def loft_mask(vc, verts, tris, view, sh, th, sz, tz, hc, zc):
    h = verts[:, 1] if view == "side" else verts[:, 0]
    z = verts[:, 2]
    hp = sh * (h - hc) + hc + th; zp = sz * (z - zc) + zc + tz
    px = np.array([vc.world_to_px(a, b) for a, b in zip(hp, zp)])
    m = np.zeros(vc.img.shape[:2], np.uint8)
    for t in tris:
        cv2.fillConvexPoly(m, np.round(px[t]).astype(np.int32), 1)
    return m

def fit(view, bounds, verts, tris, init):
    h0, h1, z0, z1 = bounds
    vc, ref_in = ref_mask(view, h0, h1, z0, z1)
    H, W = ref_in.shape
    # restrict the comparison to the head zone
    zz = np.array([vc.px_to_world(0, y)[1] for y in range(H)])
    hh = np.array([vc.px_to_world(x, 0)[0] for x in range(W)])
    zone = ((zz > 1.84)[:, None] & (np.abs(hh) < 0.165 if view != "side" else (hh > -0.2) & (hh < 0.26))[None, :]).astype(np.uint8)
    hc = 0.0 if view != "side" else 0.0; zc = 1.82
    p = dict(sh=init[0], th=init[1], sz=init[2], tz=init[3])
    def score(p):
        m = loft_mask(vc, verts, tris, view, p["sh"], p["th"], p["sz"], p["tz"], hc, zc)
        a = (m & zone).sum(); b = (ref_in & zone).sum(); i = (m & ref_in & zone).sum()
        return i / max(a + b - i, 1)
    best = score(p)
    steps = dict(sh=0.02, th=0.01, sz=0.02, tz=0.01)
    for rnd in range(6):
        improved = False
        for k in ("sh", "th", "sz", "tz"):
            for d in (-1, 1):
                q = dict(p); q[k] += d * steps[k]
                s = score(q)
                if s > best + 1e-4: p, best, improved = q, s, True
        if not improved:
            steps = {k: v / 2 for k, v in steps.items()}
    return p, best

if __name__ == "__main__":
    d = np.load(os.path.join(os.path.dirname(os.path.abspath(__file__)), "intermediate_data", "helm_loft.npz"))
    V, F = d["verts"], d["tris"]
    out = {}
    out["front"] = fit("front", (-0.30, 0.30, 1.60, 2.05), V, F, (1.0, 0.0, 1.0, 0.0))
    out["side"] = fit("side", (-0.30, 0.40, 1.60, 2.05), V, F, (1.0, 0.03, 1.0, 0.0))
    for k, (p, s) in out.items():
        print(k, {a: round(b, 4) for a, b in p.items()}, "IoU %.3f" % s)
    json.dump({k: dict(p=v[0], iou=v[1]) for k, v in out.items()}, open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "intermediate_data", "helm_register.json"), "w"))
