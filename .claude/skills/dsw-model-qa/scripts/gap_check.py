"""Find see-through gaps the way the GAME shows them: back faces culled, transparent film, N cameras around the unit, at rest and in clip poses.

    blender -b <unit.blend> --python gap_check.py -- <out_dir> <tag> [--drop Sniper,Katana] [--clip Common_Run:6 ...]
                [--anim-dir <dir>] [--views 8] [--elev 0.12] [--min 6] [--res 700]
    (cloud: python bl.py <unit.blend> gap_check.py -- ...)

A candidate gap = transparent pixels fully enclosed by the silhouette (not connected to the image border).  For each one, rays are cast through a
ring of pixels around it and the faces they hit are reported with their REST-POSE position, so a gap in a pose can be fixed in the model.
Natural negative space (between the legs, arm and body, a handle loop, fingers) is also enclosed: triage it with references/triage.md.

Writes: <tag>_<pose>_a<angle>.png (holes circled), <tag>_gaps.json, <tag>_gap_sheet.png (zoomed crop of every candidate, numbered).
"""
import json
import math
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import bpy  # noqa: E402
import numpy as np  # noqa: E402
from mathutils import Vector  # noqa: E402
from PIL import Image, ImageDraw, ImageFont  # noqa: E402

import qa_common as Q  # noqa: E402

try:
    from scipy import ndimage
except ImportError:                                                   # pip install scipy (into the Python that runs bpy / Blender's python)
    raise SystemExit("gap_check needs scipy: <blender python> -m pip install scipy")

a = Q.args()
OUT, TAG = os.path.abspath(a[0]), a[1]
os.makedirs(OUT, exist_ok=True)
drop = [s for s in Q.opt(a, "--drop", "").split(",") if s]
clips = Q.opts(a, "--clip")
NV = Q.opt(a, "--views", 8, int); ELEV = Q.opt(a, "--elev", 0.12, float); MIN = Q.opt(a, "--min", 6, int); RES = Q.opt(a, "--res", 700, int)
anim_dir = Q.opt(a, "--anim-dir") or Q.find_anim_dir(bpy.data.filepath)

Q.drop_objects(drop)
Q.matte(culling=True)
sc = bpy.context.scene
REST = {o.name: [o.matrix_world @ p.center for p in o.data.polygons] for o in Q.meshes()}   # rest-pose face centres (topology is kept by the armature)
report = []


def locate(mw, fr, x, y, s):
    """Rays through a ring of pixels just outside the hole: which objects border it, and where (rest pose, mean of hit face centres)."""
    dg = bpy.context.evaluated_depsgraph_get()
    fwd = (mw.to_3x3() @ Vector((0, 0, -1))).normalized()
    r = max(4, int(math.sqrt(s) / 2) + 4)
    hits = {}
    for k in range(24):
        t = 2 * math.pi * k / 24
        u, v = (x + r * math.cos(t)) / RES, 1 - (y + r * math.sin(t)) / RES
        loc = fr[2].lerp(fr[1], u).lerp(fr[3].lerp(fr[0], u), v)       # view_frame: top-right, bottom-right, bottom-left, top-left
        ok, _hp, _hn, fi, ob, _m = sc.ray_cast(dg, mw @ Vector((loc.x, loc.y, 0)) - fwd * 20, fwd)
        if ok:
            name = ob.original.name if hasattr(ob, "original") else ob.name
            if name in REST and fi < len(REST[name]):
                hits.setdefault(name, []).append(REST[name][fi])
    return {n: dict(n=len(l), rest=[round(sum(p[i] for p in l) / len(l), 3) for i in range(3)]) for n, l in hits.items()}


def shoot(pose):
    lo, hi = Q.bounds()
    tgt = (lo + hi) / 2
    scale = max(hi.z - lo.z, hi.x - lo.x, hi.y - lo.y) * 1.08
    for k in range(NV):
        ang = 360.0 * k / NV
        d = (math.sin(math.radians(ang)), -math.cos(math.radians(ang)), ELEV)
        Q.bs.setup_render(RES, RES); sc.render.film_transparent = True
        cam = Q.bs.setup_camera(target=tgt, ortho_scale=scale, direction=d, distance=8)
        p = os.path.join(OUT, "%s_%s_a%03d.png" % (TAG, pose, ang)); Q.bs.render_to(p, cam)
        mw, fr = cam.matrix_world.copy(), [Vector(c) for c in cam.data.view_frame(scene=sc)]
        bpy.data.objects.remove(cam, do_unlink=True)
        im = Image.open(p).convert("RGBA"); empty = np.asarray(im)[..., 3] < 40
        lab, n = ndimage.label(empty)
        border = set(np.unique(np.concatenate([lab[0], lab[-1], lab[:, 0], lab[:, -1]])))
        holes = []
        for i in range(1, n + 1):
            if i not in border:
                ys, xs = np.nonzero(lab == i)
                if len(xs) >= MIN:
                    holes.append((int(xs.mean()), int(ys.mean()), int(len(xs))))
        located = [locate(mw, fr, *h) for h in holes]
        bg = Image.new("RGBA", im.size, (200, 200, 205, 255)); bg.alpha_composite(im); dr = ImageDraw.Draw(bg)
        for x, y, s in holes:
            rr = max(8, int(math.sqrt(s)) + 6); dr.ellipse((x - rr, y - rr, x + rr, y + rr), outline=(255, 0, 0, 255), width=3)
        bg.convert("RGB").save(p)
        report.append(dict(pose=pose, angle=ang, png=os.path.basename(p), holes=[dict(x=h[0], y=h[1], px=h[2], at=L) for h, L in zip(holes, located)]))
        print("GAPS %-26s a%03d  %d" % (pose, ang, len(holes)))
        for h, L in zip(holes, located):
            print("   (%d,%d) %4dpx  %s" % (h[0], h[1], h[2], "; ".join("%s x%d rest %s" % (k2, v2["n"], v2["rest"])
                                                                   for k2, v2 in sorted(L.items(), key=lambda kv: -kv[1]["n"]))))


shoot("rest")
for spec in clips:
    clip, fr_ = spec.rsplit(":", 1)
    if not anim_dir and not clip.endswith(".fbx"):
        raise SystemExit("no clip folder found: pass --anim-dir")
    Q.pose_clip(clip, fr_, anim_dir)
    shoot("%s_f%s" % (os.path.splitext(os.path.basename(clip))[0], fr_))
json.dump(report, open(os.path.join(OUT, TAG + "_gaps.json"), "w"), indent=1)

# contact sheet: every candidate cropped and numbered (the numbers match the order in the json)
F = ImageFont.load_default()
try:
    F = ImageFont.truetype("DejaVuSans-Bold.ttf", 14)
except OSError:
    pass
cells = []
for r in report:
    for h in r["holes"]:
        im = Image.open(os.path.join(OUT, r["png"])).convert("RGB")
        c = im.crop((h["x"] - 60, h["y"] - 60, h["x"] + 60, h["y"] + 60)).resize((240, 240), Image.NEAREST)
        who = max(h["at"].items(), key=lambda kv: kv[1]["n"])[0] if h["at"] else "?"
        ImageDraw.Draw(c).text((4, 4), "#%d %s a%d %dpx\n%s" % (len(cells), r["pose"][:18], r["angle"], h["px"], who[:26]),
                               fill=(255, 255, 0), font=F, stroke_width=2, stroke_fill="black")
        cells.append(c)
if cells:
    cols = 8; sheet = Image.new("RGB", (cols * 240, ((len(cells) + cols - 1) // cols) * 240), "white")
    for i, c in enumerate(cells):
        sheet.paste(c, ((i % cols) * 240, (i // cols) * 240))
    sheet.save(os.path.join(OUT, TAG + "_gap_sheet.png"))
print("TOTAL candidates %d  (sheet %s)" % (len(cells), os.path.join(OUT, TAG + "_gap_sheet.png")))
