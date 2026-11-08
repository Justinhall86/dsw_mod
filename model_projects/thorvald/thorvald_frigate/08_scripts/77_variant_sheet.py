"""Contact sheet of the paint variants: one row per variant (tq, tq_rear, top, rts), labelled with
its orange scheme letter and grey scheme number so they can be mixed.

    python 77_variant_sheet.py <variants photo dir> [A1,B2,...]
"""
import json, os, sys
from PIL import Image, ImageDraw, ImageFont

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
d = os.path.abspath(sys.argv[1])
codes = sys.argv[2].split(",") if len(sys.argv) > 2 else ["A1", "B2", "C3", "D4", "E5"]
names = json.load(open(os.path.join(PROJ, "04_textures", "variants", "names.json")))
try:
    F = ImageFont.truetype("arialbd.ttf", 30); f2 = ImageFont.truetype("arial.ttf", 22)
except OSError:
    F = f2 = ImageFont.load_default()
views = ["tq", "tq_rear", "top", "rts"]
TW, TH = 520, 334
rows = []
for c in codes:
    row = Image.new("RGB", (300 + TW * len(views), TH), (245, 245, 245))
    dr = ImageDraw.Draw(row)
    dr.text((14, 90), "Variant %s" % c, fill=(20, 20, 20), font=F)
    on = names["orange"][c[:-1]].split(" + ")
    y = 135
    dr.text((14, y), "Orange %s:" % c[:-1], fill=(180, 70, 10), font=f2)
    for part in on:
        y += 28; dr.text((24, y), part, fill=(180, 70, 10), font=f2)
    y += 40; dr.text((14, y), "Grey %s:" % c[-1], fill=(60, 60, 60), font=f2)
    for part in names["grey"][c[-1]].split(" + "):
        y += 28; dr.text((24, y), part, fill=(60, 60, 60), font=f2)
    for i, v in enumerate(views):
        im = Image.open(os.path.join(d, c, v + ".png")).convert("RGB")
        im.thumbnail((TW, TH))
        row.paste(im, (300 + i * TW + (TW - im.width) // 2, (TH - im.height) // 2))
    rows.append(row)
sheet = Image.new("RGB", (rows[0].width, TH * len(rows) + 6 * len(rows)), (200, 200, 200))
for i, r in enumerate(rows):
    sheet.paste(r, (0, i * (TH + 6)))
p = os.path.join(d, "VARIANTS_SHEET.png"); sheet.save(p); print(p)
