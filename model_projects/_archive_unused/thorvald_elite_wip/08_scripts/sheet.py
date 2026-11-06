"""Contact sheet: python sheet.py <out.png> <cols> <img> [<img> ...]  (label = file stem)"""
import os
import sys

from PIL import Image, ImageDraw

out, cols, files = sys.argv[1], int(sys.argv[2]), sys.argv[3:]
ims = [Image.open(f).convert("RGB") for f in files]
w, h = ims[0].size
rows = (len(ims) + cols - 1) // cols
sheet = Image.new("RGB", (cols * w, rows * (h + 24)), "white")
d = ImageDraw.Draw(sheet)
for i, (f, im) in enumerate(zip(files, ims)):
    x, y = (i % cols) * w, (i // cols) * (h + 24)
    sheet.paste(im.resize((w, h)), (x, y + 24))
    d.text((x + 8, y + 6), os.path.splitext(os.path.basename(f))[0], fill="black")
sheet.save(out)
print(out, sheet.size)
