"""Turnaround sheet of one unit: front, side, back, three-quarter (T-pose, matte game-like preview) + optional posed panels.

    blender -b <unit.blend> --python turnaround.py -- <out.png> [--title "..."] [--drop Sniper] [--pose Sniper_FightIdle:1 ...] [--anim-dir <dir>]
            [--cull]      (back faces culled, as in game: use it for QA sheets)

The weapon rests at the feet in T-pose, so --drop it there; posed panels are rendered after the T-pose ones with every object (weapon in hand).
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import bpy  # noqa: E402
from PIL import Image, ImageDraw, ImageFont  # noqa: E402

import qa_common as Q  # noqa: E402

a = Q.args()
OUT = os.path.abspath(a[0]); title = Q.opt(a, "--title", os.path.splitext(os.path.basename(bpy.data.filepath))[0])
drop = [s for s in Q.opt(a, "--drop", "").split(",") if s]; poses = Q.opts(a, "--pose")
anim_dir = Q.opt(a, "--anim-dir") or Q.find_anim_dir(bpy.data.filepath)
tmp = os.path.join(os.path.dirname(OUT), "_turnaround_tmp"); os.makedirs(tmp, exist_ok=True)
Q.matte(culling="--cull" in a)
RES = 1000


def render(tag, d, objs=None):
    lo, hi = Q.bounds(objs)
    c = (lo + hi) / 2; size = max(hi.z - lo.z, hi.x - lo.x, hi.y - lo.y) * 1.06
    Q.bs.setup_render(RES, RES)
    cam = Q.bs.setup_camera(target=c, ortho_scale=size, direction=d, distance=8)
    p = os.path.join(tmp, tag + ".png"); Q.bs.render_to(p, cam); bpy.data.objects.remove(cam, do_unlink=True)
    return p


hidden = [o for o in Q.meshes() if any(s in o.name for s in drop)]
for o in hidden:
    o.hide_render = True
panels = [(lab, render(tag, d, [o for o in Q.meshes()])) for lab, tag, d in
          (("Front", "front", (0, -1, 0.02)), ("Side", "side", (1, 0, 0.02)), ("Back", "back", (0, 1, 0.02)), ("Three-quarter", "tq", (0.6, -0.8, 0.05)))]
for o in hidden:
    o.hide_render = False
for spec in poses:
    clip, fr = spec.rsplit(":", 1)
    Q.pose_clip(clip, fr, anim_dir)
    panels.append(("%s f%s" % (os.path.basename(clip).replace(".fbx", ""), fr), render("pose_%s_%s" % (os.path.basename(clip), fr), (0.6, -0.8, 0.08))))


def crop(im):
    px = im.load(); W, H = im.size; bg = px[2, 2]
    xs = [x for x in range(0, W, 2) if any(sum(abs(p - q) for p, q in zip(px[x, y], bg)) > 30 for y in range(0, H, 6))]
    return im.crop((max(0, min(xs) - 24), 0, min(W, max(xs) + 24), H)) if xs else im


ims = [(lab, crop(Image.open(p).convert("RGB"))) for lab, p in panels]
try:
    F, f = ImageFont.truetype("DejaVuSans-Bold.ttf", 30), ImageFont.truetype("DejaVuSans-Bold.ttf", 24)
except OSError:
    F = f = ImageFont.load_default()
s = Image.new("RGB", (sum(i.width for _, i in ims), RES + 110), (236, 236, 238)); d = ImageDraw.Draw(s)
d.text((16, 12), title, fill=(20, 20, 20), font=F)
x = 0
for lab, im in ims:
    s.paste(im, (x, 110)); d.text((x + im.width // 2, 70), lab, fill=(60, 60, 60), font=f, anchor="ma"); x += im.width
s.save(OUT); print("TURNAROUND", OUT, s.size)
