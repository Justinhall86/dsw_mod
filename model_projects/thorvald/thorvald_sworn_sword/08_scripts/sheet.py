"""Assemble <dir>/<tag>_{body,head,waist}_*.png into <dir>/<tag>_sheet.png (body row, head row, waist row)."""
import os
import sys
from PIL import Image, ImageDraw
d, tag = sys.argv[1], sys.argv[2]
rows = [("body", ["front", "tq", "side", "back"], (450, 630)), ("head", ["front", "tq", "side", "back"], (450, 450)),
        ("waist", ["front", "tq", "side"], (450, 450))]
H = sum(r[2][1] for r in rows) + 40
s = Image.new("RGB", (1800, H), "white")
dr = ImageDraw.Draw(s)
dr.text((10, 10), "Sworn Sword %s" % tag, fill="black")
y = 40
for g, views, (w, h) in rows:
    for i, v in enumerate(views):
        p = os.path.join(d, "%s_%s_%s.png" % (tag, g, v))
        if os.path.exists(p):
            s.paste(Image.open(p).convert("RGB").resize((w, h)), (i * 450, y))
    y += h
s.save(os.path.join(d, "%s_sheet.png" % tag))
print(os.path.join(d, "%s_sheet.png" % tag))
