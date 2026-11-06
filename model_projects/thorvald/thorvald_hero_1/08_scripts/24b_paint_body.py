"""Body albedo colour pass for B (called by 24_hero_shoulders.py; system Python, Pillow + numpy).

  python 24b_paint_body.py <spec.json>

spec: {"src": albedo png, "regions": region_ids.npy, "out": png, "iron": [r,g,b], "copper": [r,g,b],
       "clear_regions": [6], "rims": [[[u,v], ...], ...]}   (UV polygons)

1. clear_regions -> iron, keeping the painted shading: Iakin's scattered gold wear marks became small copper flecks
   in the round-1 palette pass and read as rust at RTS zoom (house art direction: no rust).
2. Bold copper rims: every UV polygon in "rims" (the pauldron shell's perimeter faces, from 24_hero_shoulders.py)
   is filled (grown 2 px against filtering seams), so the copper is a deliberate edge band, not speckle. The
   painted shading is kept (scaled around the copper), so the band still shows the plate's form.
"""
import json
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

spec = json.load(open(sys.argv[1]))
img = Image.open(spec["src"]).convert("RGB")
W, H = img.size
arr = np.asarray(img).astype(np.float64)
lum = arr.sum(-1)

reg = np.load(spec["regions"])
if reg.shape != (H, W):
    reg = np.asarray(Image.fromarray(reg.astype(np.uint8)).resize((W, H), Image.NEAREST))
clear = np.isin(reg, spec["clear_regions"])
iron_px = np.isin(reg, [spec.get("iron_region", 5)])
ref = lum[iron_px].mean() if iron_px.any() else lum[clear].mean()
rel = np.clip(lum / max(ref, 1.0), 0.6, 1.4)[..., None]
out = arr.copy()
out[clear] = np.clip(np.array(spec["iron"]) * rel, 0, 255)[clear]
print("cleared %d px of regions %s" % (clear.sum(), spec["clear_regions"]))

rim = Image.new("L", (W, H), 0)
d = ImageDraw.Draw(rim)
for poly in spec["rims"]:
    d.polygon([(u % 1.0 * W, (1 - v % 1.0) * H) for u, v in poly], fill=255)
rim = np.asarray(rim.filter(ImageFilter.MaxFilter(5))) > 0
rel_rim = np.clip(lum / max(lum[rim].mean(), 1.0), 0.8, 1.08)[..., None]
out[rim] = np.clip(np.array(spec["copper"]) * rel_rim, 0, 255)[rim]
print("rim px %d from %d polygons" % (rim.sum(), len(spec["rims"])))
Image.fromarray(out.astype(np.uint8), "RGB").save(spec["out"])
print("saved", spec["out"])
