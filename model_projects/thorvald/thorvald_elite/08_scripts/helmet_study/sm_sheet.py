"""Contact sheet for samurai-pass builds: one row per TAG from gallery/helmets_and_heads/warden_study/<TAG>/.
    python sm_sheet.py <out.png> "<title>" TAG[=label] TAG[=label] ...   (env COLS = comma list of render names)"""
import os, sys
from PIL import Image, ImageDraw, ImageFont
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
out, title, tags = sys.argv[1], sys.argv[2], sys.argv[3:]
cols = os.environ.get("COLS", "helmet_front,helmet_tq_right,helmet_side_left,helmet_back,body_head_tq,body_full_tq,rts_a").split(",")
C = int(os.environ.get("CELL", "260"))
try:
    F = ImageFont.truetype("arial.ttf", 18); FS = ImageFont.truetype("arial.ttf", 14)
except OSError:
    F = FS = ImageFont.load_default()
LW = 230
sheet = Image.new("RGB", (LW + C * len(cols), 40 + C * len(tags)), (236, 236, 238))
d = ImageDraw.Draw(sheet)
d.text((10, 10), title, fill=(20, 20, 20), font=F)
for i, t in enumerate(tags):
    tag, _, label = t.partition("=")
    y = 40 + i * C
    d.rectangle([0, y, LW - 4, y + C - 4], fill=(250, 250, 250))
    words, line, yy = (label or tag).split(), "", y + 8
    d.text((8, yy), tag, fill=(0, 0, 0), font=F); yy += 26
    for w in words:
        if d.textlength(line + " " + w, font=FS) > LW - 20:
            d.text((8, yy), line, fill=(60, 60, 60), font=FS); yy += 18; line = w
        else:
            line = (line + " " + w).strip()
    d.text((8, yy), line, fill=(60, 60, 60), font=FS)
    for j, c in enumerate(cols):
        p = P.GAL + "/warden_study/%s/%s.png" % (tag, c)
        if not os.path.exists(p):
            continue
        im = Image.open(p).convert("RGBA")
        if c.startswith("rts"):
            im = im.resize((C - 4, C - 4), Image.NEAREST)
        im.thumbnail((C - 4, C - 4))
        bg = Image.new("RGBA", im.size, (215, 215, 220, 255))
        bg.alpha_composite(im)
        sheet.paste(bg.convert("RGB"), (LW + j * C, y))
sheet.save(out)
print("sheet", out, sheet.size)
