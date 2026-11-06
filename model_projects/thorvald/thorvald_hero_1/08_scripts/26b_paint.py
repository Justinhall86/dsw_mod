"""Texture painter for 26_colour_pass.py (system Python: Pillow + numpy).

  python 26b_paint.py <jobs.json>

jobs: [{"src": png, "out": png, "fills": [...], "lines": [...], "mga_src": png|null, "mga_out": png|null,
        "mga_fill": {"polys": [...], "metal": 0..255, "gloss": 0..255}|null}]
  fill: {"polys": [[[u,v],...],...], "colour": [r,g,b], "lo": .., "hi": .., "contrast": 0..1, "keep_copper": bool}
        every UV polygon is filled (grown 2 px against filtering seams) with colour, scaled by each texel's brightness
        relative to the mask's mean (clipped lo..hi) - the painted shading stays, `contrast` < 1 flattens it toward
        a uniform matte. keep_copper leaves the bold copper rim texels (24b_paint_body.py) untouched.
  line: {"segs": [[[u0,v0],[u1,v1]],...], "width": px, "colour": [r,g,b]} - a band centred on each UV edge (trim
        along the cloth's open hems: the half outside the island lands in unused texels, so the visible band is
        width/2 wide on the cloth)
  mga_fill: R = metallic, G = gloss, B = AO kept (modeling.md 15.8) - for a matte fabric metal 0, gloss low
"""
import json
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter


def wrap(t):
    return t if 0.0 <= t <= 1.0 else t % 1.0


def poly_mask(size, polys, grow=2):
    W, H = size
    m = Image.new("L", size, 0)
    d = ImageDraw.Draw(m)
    for poly in polys:
        d.polygon([(wrap(u) * W, (1 - wrap(v)) * H) for u, v in poly], fill=255)
    if grow:
        m = m.filter(ImageFilter.MaxFilter(2 * grow + 1))
    return np.asarray(m) > 0


for job in json.load(open(sys.argv[1])):
    img = Image.open(job["src"]).convert("RGBA")
    size = img.size
    arr = np.asarray(img).astype(np.float64)
    rgb = arr[..., :3]
    lum = rgb.sum(-1)
    copper = (rgb[..., 0] > 130) & (rgb[..., 0] - rgb[..., 2] > 80)
    for f in job.get("fills", []):
        m = poly_mask(size, f["polys"])
        if f.get("keep_copper"):
            m &= ~copper
        if not m.any():
            continue
        rel = lum / max(lum[m].mean(), 1.0)
        rel = 1.0 + (rel - 1.0) * f.get("contrast", 1.0)
        rel = np.clip(rel, f.get("lo", 0.6), f.get("hi", 1.3))[..., None]
        rgb[m] = np.clip(np.array(f["colour"]) * rel, 0, 255)[m]
        print("fill %-12s %7d px" % (f.get("name", ""), m.sum()))
    W, H = size
    for ln in job.get("lines", []):
        band = Image.new("L", size, 0)
        d = ImageDraw.Draw(band)
        for (u0, v0), (u1, v1) in ln["segs"]:
            d.line([(u0 * W, (1 - v0) * H), (u1 * W, (1 - v1) * H)], fill=255, width=int(ln["width"]))
        m = np.asarray(band) > 0
        rel = np.clip(lum / max(lum[m].mean(), 1.0), 0.8, 1.15)[..., None]
        rgb[m] = np.clip(np.array(ln["colour"]) * rel, 0, 255)[m]
        print("trim %-12s %7d px from %d edges" % (ln.get("name", ""), m.sum(), len(ln["segs"])))
    arr[..., :3] = rgb
    Image.fromarray(arr.astype(np.uint8), "RGBA").save(job["out"])
    print("saved", job["out"])
    if job.get("mga_src") and job.get("mga_fill"):
        mg = np.asarray(Image.open(job["mga_src"]).convert("RGBA")).copy()
        mf = job["mga_fill"]
        mm = poly_mask(Image.open(job["mga_src"]).size, mf["polys"])
        mg[..., 0][mm] = mf["metal"]
        mg[..., 1][mm] = mf["gloss"]
        Image.fromarray(mg, "RGBA").save(job["mga_out"])
        print("saved", job["mga_out"])
