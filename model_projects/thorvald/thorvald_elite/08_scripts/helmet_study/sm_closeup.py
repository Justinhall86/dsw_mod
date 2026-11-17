"""All-angles sheet of one samurai-pass build next to the owner's reference pictures.
    python sm_closeup.py TAG "<title>"   -> gallery/helmets_and_heads/warden_study/samurai/<TAG>_all_angles.png  (build TAG with VIEWS=all first)"""
import os, sys
from PIL import Image, ImageDraw, ImageFont
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
G = P.GAL + "/warden_study"
tag, title = sys.argv[1], sys.argv[2]
F = ImageFont.truetype("arial.ttf", 18); FS = ImageFont.truetype("arial.ttf", 15)
views = ["front", "tq_left", "tq_right", "side_left", "side_right", "back", "back_tq_right", "top", "front_high", "front_low"]
C = 330
sheet = Image.new("RGB", (C * 5, 40 + C * 2 + 30 + 360 + 30), (236, 236, 238))
d = ImageDraw.Draw(sheet)
d.text((10, 10), title, fill=(0, 0, 0), font=F)
for i, v in enumerate(views):
    im = Image.open(G + "/%s/helmet_%s.png" % (tag, v)).convert("RGBA"); im.thumbnail((C - 6, C - 6))
    bg = Image.new("RGBA", im.size, (255, 255, 255, 255)); bg.alpha_composite(im)
    x, y = (i % 5) * C, 40 + (i // 5) * C
    sheet.paste(bg.convert("RGB"), (x, y)); d.text((x + 6, y + 4), v.replace("_", " "), fill=(60, 60, 60), font=FS)
y = 40 + 2 * C + 30
d.text((10, y - 26), "On the unit (rest pose)  |  owner's reference pictures", fill=(0, 0, 0), font=F)
x = 0
for p in [G + "/%s/body_head_front.png" % tag, G + "/%s/body_head_tq.png" % tag, G + "/samurai/reference/ref2_silhouette_front.jpg",
          G + "/samurai/reference/ref3_spec_sheet.jpg"]:
    im = Image.open(p).convert("RGB"); im.thumbnail((640 if "spec" in p else 360, 360)); sheet.paste(im, (x, y)); x += im.width + 8
sheet.save(G + "/samurai/%s_all_angles.png" % tag)
print("saved", tag)
