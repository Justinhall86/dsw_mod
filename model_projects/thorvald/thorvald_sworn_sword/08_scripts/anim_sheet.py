"""<dir>/<tag>_<clip>_<view>_<t>.png -> <dir>/<tag>_anim_sheet.png: one row per clip, front-3/4 frames then back-3/4."""
import glob, os, sys
from PIL import Image, ImageDraw
d, tag = sys.argv[1], sys.argv[2]
clips = sorted({os.path.basename(p)[len(tag) + 1:].rsplit("_", 2)[0] for p in glob.glob(os.path.join(d, tag + "_*_fq_0.png"))})
c = 210
s = Image.new("RGB", (c * 10 + 150, c * len(clips)), "white"); dr = ImageDraw.Draw(s)
for r, cl in enumerate(clips):
    dr.text((5, r * c + 100), cl.replace("Common_", ""), fill="black")
    for i, (v, t) in enumerate([(v, t) for v in ("fq", "bq") for t in (0, 2, 4, 6, 8)]):
        p = os.path.join(d, "%s_%s_%s_%d.png" % (tag, cl, v, t))
        if os.path.exists(p): s.paste(Image.open(p).convert("RGB").resize((c, c)), (150 + i * c, r * c))
s.save(os.path.join(d, tag + "_anim_sheet.png")); print(os.path.join(d, tag + "_anim_sheet.png"))
