"""v4: side-by-side comparison of one of our renders with the same framing of the reference picture.
  python v4_compare.py <view: side|front|back> <centre_h> <centre_z> <width_m> <ours.png> <out.png> [--dh 0 --dz 0]
Our render must have been made with an orthographic camera looking at (centre_h, centre_z) with ortho width `width_m`
(same convention as the bridge's shot()). Output: [reference | ours | 50% blend]."""
import os
import sys

import cv2
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import v4_trace as T


def make(view, ch, cz, wm, ours_path, out_path, dh=0.0, dz=0.0):
    ours = cv2.cvtColor(cv2.imread(ours_path), cv2.COLOR_BGR2RGB)
    Hpx, Wpx = ours.shape[:2]
    ppm = Wpx / wm                                   # pixels per metre of our render
    hm = Hpx / ppm
    ref = T.load_ref(False)
    vc = T.ViewCrop(ref, view, ch - wm / 2, ch + wm / 2, cz - hm / 2, cz + hm / 2, zoom=1, dh=dh, dz=dz)
    crop = vc.img
    # the crop is in picture pixels (605 px/m); our render is at `ppm` px/m -> rescale the crop to our size
    crop = cv2.resize(crop, (Wpx, Hpx), interpolation=cv2.INTER_CUBIC)
    if view == "back":                               # the back view is mirrored in x relative to our camera at rz=180? both look at the same side: no flip needed
        pass
    blend = (crop.astype(float) * 0.5 + ours.astype(float) * 0.5).astype(np.uint8)
    cv2.imwrite(out_path, cv2.cvtColor(np.hstack([crop, ours, blend]), cv2.COLOR_RGB2BGR))
    return out_path


if __name__ == "__main__":
    a = sys.argv[1:]
    dh = float(a[a.index("--dh") + 1]) if "--dh" in a else 0.0
    dz = float(a[a.index("--dz") + 1]) if "--dz" in a else 0.0
    print(make(a[0], float(a[1]), float(a[2]), float(a[3]), a[4], a[5], dh, dz))
