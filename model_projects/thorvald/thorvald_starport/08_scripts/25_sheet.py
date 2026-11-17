"""Sheet of the composed terminal designs: py -3.14 25_sheet.py <designs.json> <dir>"""
import json, os, sys
from PIL import Image, ImageDraw, ImageFont
spec = json.load(open(sys.argv[1])); d = sys.argv[2]
f = ImageFont.truetype("arialbd.ttf", 24); W = 640
s = Image.new("RGB", (W * 3, len(spec) * (W + 40)), (30, 30, 34)); dr = ImageDraw.Draw(s)
for r, v in enumerate(spec):
    dr.text((12, r * (W + 40) + 6), "%s   %s" % (v["name"], v.get("note", "")), fill=(255, 255, 255), font=f)
    for c, t in enumerate(("tex_front", "tex_back", "clay_front")):
        p = os.path.join(d, "%s_%s.png" % (v["name"], t))
        if not os.path.exists(p):
            continue
        im = Image.open(p).convert("RGBA"); bg = Image.new("RGBA", im.size, (46, 46, 50, 255))
        s.paste(Image.alpha_composite(bg, im).convert("RGB"), (c * W, r * (W + 40) + 40))
s.save(os.path.join(d, "TERMINAL_DESIGNS.png")); print("ok")
