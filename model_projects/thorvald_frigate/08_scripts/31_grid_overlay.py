"""Draw a labelled world-coordinate grid on the renders from 30_grid_survey.py and tile the views.

    python 31_grid_overlay.py <outdir> <donor> [step]
"""
import json
import os
import sys

from PIL import Image, ImageDraw, ImageFont

outdir, key = sys.argv[1], sys.argv[2]
step = float(sys.argv[3]) if len(sys.argv) > 3 else 0.5
try:
    FONT = ImageFont.truetype('C:/Windows/Fonts/arialbd.ttf', 14)
except OSError:
    FONT = None
m = json.load(open(os.path.join(outdir, key + "_meta.json")))
px, scale, c = m["px"], m["scale"], m["centre"]
ax = {"x": (0, 1), "y": (1, 1), "z": (2, 1), "-y": (1, -1)}
tiles = []
for name, v in m["views"].items():
    im = Image.open(os.path.join(outdir, "%s_%s.png" % (key, name))).convert("RGB")
    d = ImageDraw.Draw(im, "RGBA")
    (ri, rs), (ui, us) = ax[v["right"]], ax[v["up"]]
    k = px / scale

    def X(w): return px / 2 + (w - c[ri]) * rs * k
    def Y(w): return px / 2 - (w - c[ui]) * us * k

    def ticks(axis_i, sign, mapper, horizontal):
        lo = c[axis_i] - scale / 2 * 1.0
        n0 = int(lo // step) - 1
        for n in range(n0, n0 + int(scale / step) + 4):
            w = n * step
            p = mapper(w)
            if not (0 <= p <= px):
                continue
            major = abs(w - round(w)) < 1e-6
            col = (255, 40, 40, 150 if major else 60)
            if horizontal:
                d.line([(p, 0), (p, px)], fill=col, width=1)
                if major:
                    d.text((p + 2, 2), "%g" % w, fill=(255, 255, 0), font=FONT, stroke_width=2, stroke_fill=(0, 0, 0))
            else:
                d.line([(0, p), (px, p)], fill=col, width=1)
                if major:
                    d.text((2, p + 2), "%g" % w, fill=(255, 255, 0), font=FONT, stroke_width=2, stroke_fill=(0, 0, 0))

    # label axes in WORLD values (for -y the image-right axis is reversed, labels still world y)
    ticks(ri, rs, X, True)
    ticks(ui, us, Y, False)
    d.rectangle([0, px - 16, 190, px], fill=(0, 0, 0, 180))
    d.text((4, px - 14), "%s  right=%s up=%s" % (name, v["right"], v["up"]), fill=(255, 255, 255))
    im.save(os.path.join(outdir, '%s_%s_grid.png' % (key, name)))
    tiles.append(im)
tiles = tiles[:2]
sheet = Image.new("RGB", (px * len(tiles), px))
for i, t in enumerate(tiles):
    sheet.paste(t, (i * px, 0))
out = os.path.join(outdir, key + "_grid.png")
sheet.save(out)
print(out, sheet.size)
