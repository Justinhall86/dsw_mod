import os as _os, sys as _sys
_sys.path.insert(0, _os.path.dirname(_os.path.abspath(__file__)))
import paths as P
"""Fill the three dimples on the House Guard face plate (albedo + normal + metal/AO), inside the plate panel only."""
import json, numpy as np
from PIL import Image, ImageDraw, ImageFilter
D = P.HG_DIR
cats = json.load(open(P.WORK + "/house_guard/" + "cats.json")); W = 512
def mask(k, grow=1):
    m = Image.new("L", (W, W), 0); d = ImageDraw.Draw(m)
    for poly in cats[k]: d.polygon([(u * W, (1 - v) * W) for u, v in poly], fill=255)
    return m.filter(ImageFilter.MinFilter(3)) if grow < 0 else m
plate = np.asarray(mask("plate")) > 127
src = np.asarray(Image.open(D + "HouseGuard_Albedo.png").convert("RGB")).astype(float)
val = src.max(-1)
blur = np.asarray(Image.fromarray(val.astype(np.uint8)).filter(ImageFilter.MedianFilter(15))).astype(float)
dimple = plate & (val < blur - 18)
dI = Image.fromarray((dimple * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(5))
# keep only blob-shaped spots (drop long seam lines): opening
blob = np.asarray(dI.filter(ImageFilter.MinFilter(5)).filter(ImageFilter.MaxFilter(7))) > 127
blob &= plate
print("dimple px", int(blob.sum()))
Image.fromarray((blob * 255).astype(np.uint8)).save(P.WORK + "/house_guard/" + "dimple_mask.png")
def inpaint(arr, m, flat=None):
    a = arr.astype(float).copy()
    if flat is not None: a[m] = flat; return a
    # iterative diffusion from the border inward
    known = ~m
    for _ in range(60):
        b = Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).filter(ImageFilter.BoxBlur(2))
        a[m] = np.asarray(b).astype(float)[m]
    return a
for name in ("H5_copper_crown_chin_collar",):
    a = np.asarray(Image.open(P.WORK + "/house_guard/" + "%s.png" % name).convert("RGB"))
    Image.fromarray(inpaint(a, blob).astype(np.uint8)).save(P.WORK + "/house_guard/" + "%s_smooth.png" % name)
n = np.asarray(Image.open(D + "HouseGuard_Normal.png").convert("RGB"))
nn = inpaint(n, blob); nb = np.asarray(Image.fromarray(nn.astype(np.uint8)).filter(ImageFilter.GaussianBlur(1))).astype(float)
nn[blob] = nb[blob]; Image.fromarray(nn.astype(np.uint8)).save(P.WORK + "/house_guard/" + "HG_Normal_smooth.png")
mt = Image.open(D + "HouseGuard_MetallicGlossAO.png"); mode = mt.mode
m = np.asarray(mt.convert("RGBA")); Image.fromarray(inpaint(m, blob).astype(np.uint8), "RGBA").convert(mode).save(P.WORK + "/house_guard/" + "HG_Metal_smooth.png")
