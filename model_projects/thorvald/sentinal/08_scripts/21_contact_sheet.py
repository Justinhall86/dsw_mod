"""Compose the variant contact sheet (system python + Pillow).

    python 21_contact_sheet.py

Reads  02_progress_photos/05_variants/contact/{vanilla,<name>}.png  (480px,
identical camera: cam_frame(10.2, 1.75, 52, 45))
Writes 02_progress_photos/05_variants/contact/contact_sheet.png  (large row)
        02_progress_photos/05_variants/contact/contact_sheet_128.png (~128px)
"""
import os
import shutil

from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PHOTO = os.path.join(ROOT, "02_progress_photos", "05_variants")
CONTACT = os.path.join(PHOTO, "contact")
REF = os.path.join(ROOT, "02_progress_photos", "00_reference")

ORDER = ["vanilla", "scythe", "bulwark", "mule", "nightwisp", "longshot"]
LARGE = 360
SMALL = 128
PAD = 14
LABEL_H = 26
BG = (34, 34, 36)

os.makedirs(CONTACT, exist_ok=True)
# the vanilla entry: same camera as every variant contact render
for src, dst in (("vanilla_game.png", "vanilla.png"),
                 ("vanilla_top.png", "vanilla_top.png")):
    s, d = os.path.join(REF, src), os.path.join(CONTACT, dst)
    if os.path.exists(s) and not os.path.exists(d):
        shutil.copyfile(s, d)

missing = [n for n in ORDER
           if not os.path.exists(os.path.join(CONTACT, n + ".png"))]
if missing:
    raise SystemExit("missing contact renders: " + ", ".join(missing))

w = PAD + len(ORDER) * (LARGE + PAD)
h = PAD + LARGE + LABEL_H + PAD + SMALL + LABEL_H + PAD
sheet = Image.new("RGB", (w, h), BG)
d = ImageDraw.Draw(sheet)


def paste_row(y, size):
    for i, name in enumerate(ORDER):
        im = Image.open(os.path.join(CONTACT, name + ".png")).convert("RGB")
        im = im.resize((size, size), Image.LANCZOS)
        x = PAD + i * (LARGE + PAD) + (LARGE - size) // 2
        sheet.paste(im, (x, y))
        tx = PAD + i * (LARGE + PAD) + LARGE // 2
        d.text((tx, y + size + 6), name.upper(), fill=(235, 235, 235),
               anchor="ma")


paste_row(PAD, LARGE)
paste_row(PAD + LARGE + LABEL_H + PAD, SMALL)

sheet.save(os.path.join(CONTACT, "contact_sheet.png"))
print("sheet", os.path.join(CONTACT, "contact_sheet.png"), sheet.size)

# a second sheet where every tile is rendered/resized to ~128px, so the
# silhouettes can be judged at DSW's real on-screen size
s128 = Image.new("RGB", (PAD + len(ORDER) * (SMALL + PAD),
                         PAD + SMALL + LABEL_H + PAD), BG)
d2 = ImageDraw.Draw(s128)
for i, name in enumerate(ORDER):
    im = Image.open(os.path.join(CONTACT, name + ".png")).convert("RGB")
    im = im.resize((SMALL, SMALL), Image.LANCZOS)
    x = PAD + i * (SMALL + PAD)
    s128.paste(im, (x, PAD))
    d2.text((x + SMALL // 2, PAD + SMALL + 6), name.upper(),
            fill=(235, 235, 235), anchor="ma")
s128.save(os.path.join(CONTACT, "contact_sheet_128.png"))
print("sheet128", os.path.join(CONTACT, "contact_sheet_128.png"), s128.size)
