"""Contact sheet + GIFs from clip frames.   python clip_sheets.py <frames_dir> <tag> <out_dir>"""
import glob
import os
import sys

from PIL import Image

frames, tag, out = sys.argv[1], sys.argv[2], sys.argv[3]
os.makedirs(out, exist_ok=True)
clips = ["Common_FightIdle", "Common_Run", "Common_AttackMelee01", "Common_AttackMelee02", "Common_FightHitFront"]
rows = []
for clip in clips:
    fs = sorted(glob.glob(os.path.join(frames, clip, "f*.png")))
    if not fs:
        continue
    rows.append([fs[int(i * (len(fs) - 1) / 5)] for i in range(6)])
    ims = [Image.open(f).convert("RGB").resize((400, 400)) for f in fs]
    pal = [im.convert("P", palette=Image.ADAPTIVE, colors=128) for im in ims]
    pal[0].save(os.path.join(out, "%s_%s.gif" % (tag, clip.replace("Common_", ""))), save_all=True, append_images=pal[1:], duration=66, loop=0, optimize=True)
W = 250
s = Image.new("RGB", (6 * W, len(rows) * W), "white")
for r, fl in enumerate(rows):
    for c, f in enumerate(fl):
        s.paste(Image.open(f).convert("RGB").resize((W, W)), (c * W, r * W))
s.save(os.path.join(out, "%s_clips_sheet.png" % tag))
print("ok", len(rows))
