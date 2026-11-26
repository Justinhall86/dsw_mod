"""Sheets for the ten Ronin variants (r20_variants.py). python sheet.py [V01 V02 ...]
   <V>_sheet.png per variant; overview_bodies.png (3/4 body), overview_heads.png (head 3/4), overview_rts.png (RTS-size thumbnails)."""
import os, sys
from PIL import Image, ImageDraw, ImageFont

D = os.path.dirname(os.path.abspath(__file__))
NAMES = {"V01": "Ronin, polished inlays", "V02": "Nightblade", "V03": "Steel Ronin", "V04": "Blued Steel", "V05": "Gilded Shogun",
         "V06": "Oxblood Lacquer", "V07": "Ember Eyes", "V08": "Unified Arms", "V09": "Black Chrome", "V10": "Duelist", "V11": "Steel Ronin 2", "V12": "Steel Ronin 3 (clean helmet)"}
vs = sys.argv[1:] or [v for v in NAMES if os.path.exists(os.path.join(D, v, "rts.png"))]
try:
    F = ImageFont.truetype("arialbd.ttf", 26)
    FS = ImageFont.truetype("arial.ttf", 20)
except OSError:
    F = FS = ImageFont.load_default()
BG = (226, 226, 230)


def ld(v, k, size):
    im = Image.open(os.path.join(D, v, k + ".png")).convert("RGBA")
    bg = Image.new("RGBA", im.size, BG + (255,))
    return Image.alpha_composite(bg, im).convert("RGB").resize(size, Image.LANCZOS)


def label(v):
    return "%s  %s" % (v, NAMES[v])


# per-variant sheet: 4 body angles + 3 head angles
for v in vs:
    s = Image.new("RGB", (4 * 450, 40 + 600 + 450), BG)
    d = ImageDraw.Draw(s)
    d.text((12, 6), label(v), fill=(20, 20, 20), font=F)
    for i, k in enumerate(("body_full_front", "body_full_tq", "body_full_back", "body_full_tqL")):
        s.paste(ld(v, k, (450, 600)), (i * 450, 40))
    for i, k in enumerate(("head_front", "head_tq", "head_side")):
        s.paste(ld(v, k, (450, 450)), (i * 450, 640))
    s.paste(ld(v, "rts", (110, 110)).resize((450, 450), Image.NEAREST), (3 * 450, 640))
    d.text((3 * 450 + 10, 645), "RTS size (110 px, enlarged)", fill=(20, 20, 20), font=FS)
    s.save(os.path.join(D, v + "_sheet.png"))


def grid(key, cell, path, cols=5):
    rows = (len(vs) + cols - 1) // cols
    s = Image.new("RGB", (cols * cell[0], rows * (cell[1] + 34)), BG)
    d = ImageDraw.Draw(s)
    for i, v in enumerate(vs):
        x, y = (i % cols) * cell[0], (i // cols) * (cell[1] + 34)
        im = ld(v, key, cell) if key != "rts" else ld(v, "rts", (96, 96)).resize(cell, Image.LANCZOS)
        s.paste(im, (x, y + 34))
        d.text((x + 8, y + 5), label(v), fill=(20, 20, 20), font=FS)
    s.save(os.path.join(D, path))


grid("body_full_tq", (390, 520), "overview_bodies.png")
grid("head_tq", (390, 390), "overview_heads.png")
grid("rts", (240, 240), "overview_rts.png")
print("sheets", vs)
