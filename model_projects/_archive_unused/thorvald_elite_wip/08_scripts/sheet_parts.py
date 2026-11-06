"""Labelled sheet of component renders: python sheet_parts.py <dir> [cols]
Label = id, verts, heaviest bone, view (F/B)."""
import json
import os
import sys

from PIL import Image, ImageDraw

d = sys.argv[1]
cols = int(sys.argv[2]) if len(sys.argv) > 2 else 8
info = json.load(open(os.path.join(d, "components.json")))
w, h, lab = 150, 210, 28
rows = (len(info) + cols - 1) // cols
sheet = Image.new("RGB", (cols * w, rows * (h + lab)), "white")
dr = ImageDraw.Draw(sheet)
for i, c in enumerate(info):
    x, y = (i % cols) * w, (i // cols) * (h + lab)
    im = Image.open(os.path.join(d, "part_%03d.png" % c["id"])).convert("RGB").resize((w, h))
    sheet.paste(im, (x, y + lab))
    bone = c["bones"][0][0].replace("B_", "").replace("J", "") if c["bones"] else "-"
    dr.text((x + 3, y + 2), "#%d %dv %s %s" % (c["id"], c["verts"], bone, c["view"][0].upper()), fill="black")
    dr.text((x + 3, y + 14), "z%.2f x%.2f" % (c["centre"][2], c["centre"][0]), fill="gray")
out = os.path.join(d, "..", os.path.basename(d) + "_parts.png")
sheet.save(out)
print(out, sheet.size)
