"""Faction lineup for the samurai pass: the other Thorvald ground units (cut from warden_study/lineup/faction_lineup.png, same pose,
camera and lighting) next to helmet candidates rendered by wd_lineup.py with LPAD=1.55 (body at the same pixel height, tall crests fit).
    python sm_lineup.py <out.png> TAG[=label] ...
"""
import os, sys
from PIL import Image, ImageDraw, ImageFont
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
G = P.GAL + "/warden_study/"
FL = Image.open(G + "lineup/faction_lineup.png").convert("RGB")     # 9 columns x 300 px, header 45 px, two rows (3/4, front)
W, H0 = 300, 45
RH = (FL.height - H0) // 2
OTHERS = [(0, "Trooper"), (1, "Iron Ranger"), (2, "Iron Guard"), (3, "Vanguard now (v3b)"), (7, "Sworn Sword 2.1")]
CW, CH = 330, 560
SC = 0.861        # 1.08 / 1.55 * (390 / 650) / (390 / 650) ... body 361 px in both
try:
    F = ImageFont.truetype("arialbd.ttf", 17); FS = ImageFont.truetype("arial.ttf", 13)
except OSError:
    F = FS = ImageFont.load_default()
out, tags = sys.argv[1], sys.argv[2:]
cols = [("o", c, n) for c, n in OTHERS[:3]] + [("t",) + tuple(t.partition("=")[::2]) for t in tags] + [("o", c, n) for c, n in OTHERS[3:]]
BG = FL.getpixel((5, H0 + 5))
sheet = Image.new("RGB", (CW * len(cols), 50 + 2 * CH), BG)
d = ImageDraw.Draw(sheet)
d.rectangle([0, 0, sheet.width, 48], fill=(30, 30, 32))
for i, col in enumerate(cols):
    x = i * CW
    if col[0] == "o":
        name = col[2]
        for r in range(2):
            cell = FL.crop((col[1] * W, H0 + r * RH, col[1] * W + W, H0 + r * RH + RH))
            sheet.paste(cell, (x + (CW - W) // 2, 50 + r * CH + CH - RH))
    else:
        name = col[1]
        for r, v in enumerate(("tq", "front")):
            p = G + "samurai/lineup/%s_%s.png" % (col[1], v)
            if not os.path.exists(p):
                continue
            im = Image.open(p).convert("RGBA")
            im = im.resize((int(im.width * SC * 390 / 650 / (390 / 650)), int(im.height * SC)), Image.LANCZOS)
            bg = Image.new("RGBA", (CW, CH), BG + (255,))
            bg.alpha_composite(im, ((CW - im.width) // 2, CH - im.height))
            sheet.paste(bg.convert("RGB"), (x, 50 + r * CH))
    d.text((x + 8, 6), name, fill=(255, 255, 255), font=F)
    if col[0] == "t" and col[2]:
        d.text((x + 8, 27), col[2][:44], fill=(200, 200, 200), font=FS)
sheet.save(out)
print("lineup", out, sheet.size)
