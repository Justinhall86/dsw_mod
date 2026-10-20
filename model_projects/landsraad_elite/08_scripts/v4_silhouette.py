"""v4: silhouette outline (world h,z) of a triangle mesh in a front/back/side orthographic view, for overlaying on the reference crops.
  python v4_silhouette.py <mesh.npz> <view> <out.json> [--dh 0 --dz 0 --color r,g,b]
The outline is written as an overlay shape for v4_grid.py (h,z in world metres; for 'back' h is world x, for 'side' world y)."""
import json, sys
import cv2, numpy as np

def outline(verts, tris, view, ppm=2000, pad=0.02):
    h = verts[:, 1] if view == "side" else verts[:, 0]
    z = verts[:, 2]
    h0, h1, z0, z1 = h.min() - pad, h.max() + pad, z.min() - pad, z.max() + pad
    W, H = int((h1 - h0) * ppm) + 1, int((z1 - z0) * ppm) + 1
    px = ((h - h0) * ppm).astype(np.int32); py = ((z1 - z) * ppm).astype(np.int32)
    mask = np.zeros((H, W), np.uint8)
    for t in tris:
        cv2.fillConvexPoly(mask, np.stack([px[t], py[t]], 1), 255)
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, np.ones((5, 5), np.uint8))
    cnts, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    c = max(cnts, key=cv2.contourArea)
    ap = cv2.approxPolyDP(c, 1.5, True)[:, 0, :]
    return [[h0 + x / ppm, z1 - y / ppm] for x, y in ap]

if __name__ == "__main__":
    a = sys.argv[1:]
    d = np.load(a[0]); view = a[1]
    dh = float(a[a.index("--dh") + 1]) if "--dh" in a else 0.0
    dz = float(a[a.index("--dz") + 1]) if "--dz" in a else 0.0
    col = [int(x) for x in a[a.index("--color") + 1].split(",")] if "--color" in a else [0, 255, 255]
    pts = outline(d["verts"], d["tris"], view)
    pts = [[p[0] + dh, p[1] + dz] for p in pts]
    json.dump({"sil": {"pts": pts, "closed": True, "color": col}}, open(a[2], "w"))
    print(len(pts), "outline points")
