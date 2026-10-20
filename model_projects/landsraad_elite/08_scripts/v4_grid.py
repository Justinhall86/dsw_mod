"""v4: gridded, zoomed crop of the reference picture with world-coordinate labels (to read vertex positions by eye) and an optional
overlay of polygons / points given in world coordinates (to check a hand-built outline against the picture).

  python v4_grid.py <view: front|back|side> <h0> <h1> <z0> <z1> <zoom> <out.png> [--step 0.02] [--overlay shapes.json] [--clean 0|1]

h = world x for front/back, world y for side (a back-view picture has +x on the LEFT; labels always show the world value).
shapes.json : {"name": {"pts": [[h,z],...], "closed": true, "color": [r,g,b], "label": true}, ...}
"""
import json
import os
import sys

import cv2
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import v4_trace as T


def make(view, h0, h1, z0, z1, zoom, out, step=0.02, overlay=None, clean=True, dh=0.0, dz=0.0, labels_every=2):
    ref = T.load_ref(clean)
    vc = T.ViewCrop(ref, view, h0, h1, z0, z1, zoom=zoom, dh=dh, dz=dz)
    im = vc.img.copy()
    Hpx, Wpx = im.shape[:2]
    # grid lines at multiples of `step`
    k0 = int(np.ceil(h0 / step - 1e-9)); k1 = int(np.floor(h1 / step + 1e-9))
    for k in range(k0, k1 + 1):
        h = k * step
        px, _ = vc.world_to_px(h, z0)
        major = (k % labels_every == 0)
        cv2.line(im, (int(px), 0), (int(px), Hpx - 1), (255, 60, 60) if major else (255, 200, 80), 1 if not major else 1)
        if major:
            cv2.putText(im, "%.2f" % h, (int(px) + 3, 14), cv2.FONT_HERSHEY_SIMPLEX, 0.45, (255, 255, 0), 1, cv2.LINE_AA)
    j0 = int(np.ceil(z0 / step - 1e-9)); j1 = int(np.floor(z1 / step + 1e-9))
    for j in range(j0, j1 + 1):
        z = j * step
        _, py = vc.world_to_px(h0, z)
        major = (j % labels_every == 0)
        cv2.line(im, (0, int(py)), (Wpx - 1, int(py)), (255, 60, 60) if major else (255, 200, 80), 1)
        if major:
            cv2.putText(im, "%.2f" % z, (3, int(py) - 3), cv2.FONT_HERSHEY_SIMPLEX, 0.45, (255, 255, 0), 1, cv2.LINE_AA)
    if overlay:
        shapes = json.load(open(overlay))
        for name, sh in shapes.items():
            col = tuple(int(c) for c in sh.get("color", (0, 255, 255)))
            pts = np.array([vc.world_to_px(h, z) for h, z in sh["pts"]], np.int32)
            if len(pts) > 1:
                cv2.polylines(im, [pts], bool(sh.get("closed", True)), col, 2, cv2.LINE_AA)
            for i, p in enumerate(pts):
                cv2.circle(im, tuple(int(x) for x in p), 4, col, -1)
                if sh.get("label", False):
                    cv2.putText(im, "%s%d" % (sh.get("tag", name[:2]), i), (int(p[0]) + 5, int(p[1]) - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.45, col, 1, cv2.LINE_AA)
    cv2.imwrite(out, cv2.cvtColor(im, cv2.COLOR_RGB2BGR))
    return out


if __name__ == "__main__":
    a = sys.argv[1:]
    step = float(a[a.index("--step") + 1]) if "--step" in a else 0.02
    ov = a[a.index("--overlay") + 1] if "--overlay" in a else None
    cl = bool(int(a[a.index("--clean") + 1])) if "--clean" in a else True
    print(make(a[0], float(a[1]), float(a[2]), float(a[3]), float(a[4]), int(a[5]), a[6], step=step, overlay=ov, clean=cl))
