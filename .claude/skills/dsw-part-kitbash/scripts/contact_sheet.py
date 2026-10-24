"""Make a labelled contact sheet from a folder of renders (system python + Pillow).

  python contact_sheet.py <dir> [--pattern "part_*.png"] [--cols 6] [--size 250] [--out sheet.png]
  python contact_sheet.py --grid out.png --cols 3 a_front.png a_tq.png ... (explicit files, row-major)

Labels are the file names without extension (part_014_104v_lClavicle -> "#014 104v lClavicle").
"""
import argparse
import glob
import os
import re

from PIL import Image, ImageDraw

ap = argparse.ArgumentParser()
ap.add_argument("dir", nargs="?")
ap.add_argument("files", nargs="*")
ap.add_argument("--pattern", default="part_*.png")
ap.add_argument("--cols", type=int, default=6)
ap.add_argument("--size", type=int, default=250)
ap.add_argument("--out")
ap.add_argument("--grid", help="output path when passing explicit files")
a = ap.parse_args()

if a.grid:
    files = ([a.dir] if a.dir else []) + a.files
    out = a.grid
else:
    files = sorted(glob.glob(os.path.join(a.dir, a.pattern)))
    out = a.out or os.path.join(a.dir, "sheet.png")
if not files:
    raise SystemExit("no images")
w = a.size
rows = (len(files) + a.cols - 1) // a.cols
sh = Image.new("RGB", (a.cols * w, rows * w), "white")
d = ImageDraw.Draw(sh)
for i, f in enumerate(files):
    x, y = (i % a.cols) * w, (i // a.cols) * w
    sh.paste(Image.open(f).convert("RGB").resize((w, w)), (x, y))
    name = os.path.splitext(os.path.basename(f))[0]
    m = re.match(r"part_(\d+)_(\d+)v_(.*)", name)
    label = "#%s %sv %s" % m.groups() if m else name
    d.rectangle((x, y, x + min(w, 7 * len(label) + 8), y + 14), fill="white")
    d.text((x + 3, y + 1), label, fill="black")
sh.save(out)
print("sheet", out, sh.size)
