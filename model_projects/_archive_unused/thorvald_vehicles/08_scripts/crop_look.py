"""Crop + brighten a render so the cannon/wing junction can actually be seen.  Usage: python crop_look.py <img> <out> <x0> <y0> <x1> <y1> [scale] [bright]"""
import sys

from PIL import Image, ImageEnhance

src, out = sys.argv[1], sys.argv[2]
x0, y0, x1, y1 = (int(v) for v in sys.argv[3:7])
scale = float(sys.argv[7]) if len(sys.argv) > 7 else 3.0
bright = float(sys.argv[8]) if len(sys.argv) > 8 else 2.2
im = Image.open(src).convert("RGB").crop((x0, y0, x1, y1))
im = ImageEnhance.Brightness(im).enhance(bright)
im = ImageEnhance.Contrast(im).enhance(1.3)
im = im.resize((int(im.width * scale), int(im.height * scale)), Image.LANCZOS)
im.save(out)
print("saved", out, im.size)
