"""Find see-through holes the way the game shows them: back-face culling ON, transparent film, 8 camera angles (+ optional clip poses).
A hole = transparent pixels fully enclosed by the silhouette (not connected to the image border). Holes are circled red on the PNG.

    python ../bl.py <unit.blend> gap_check.py -- <out_dir> <tag> [--hide Sniper] [--clip Sniper_Run:12 ...] [--min 6]
"""
import os, sys, math, json
import bpy
import numpy as np
from mathutils import Vector
SK = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), *[".."] * 6, ".claude", "skills", "dsw-new-unit", "scripts"))
sys.path.insert(0, SK)
import blender_scene as bs, preview_wiring as PW
from scipy import ndimage
from PIL import Image, ImageDraw

a = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG = os.path.abspath(a[0]), a[1]; os.makedirs(OUT, exist_ok=True)
hide = a[a.index("--hide") + 1].split(",") if "--hide" in a else []
clips = [a[i + 1] for i, x in enumerate(a) if x == "--clip"]
MIN = int(a[a.index("--min") + 1]) if "--min" in a else 6
PROJ = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", ".."))
for o in bpy.data.objects:
    if o.type == "MESH" and any(h in o.name for h in hide):
        o.hide_render = True
PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
    try: m.surface_render_method = "DITHERED"
    except Exception: pass
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
sc = bpy.context.scene
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
report = []


REST = {}


def rest_centre(obj_name, fi):
    """Rest-pose centre of face fi of the ORIGINAL mesh (the armature modifier keeps topology, so indices match)."""
    o = bpy.data.objects[obj_name]
    if obj_name not in REST:
        REST[obj_name] = [o.matrix_world @ p.center for p in o.data.polygons]
    return REST[obj_name][fi] if fi < len(REST[obj_name]) else None


def locate(cam_info, x, y, s):
    """Cast rays through a ring of pixels just outside the hole: which objects / faces border it, and where (rest pose)."""
    mw, fr = cam_info                          # fr: view_frame corners (top-right, bottom-right, bottom-left, top-left), camera space
    W = H = 700
    dg = bpy.context.evaluated_depsgraph_get()
    fwd = (mw.to_3x3() @ Vector((0, 0, -1))).normalized()
    r = max(4, int(math.sqrt(s) / 2) + 4)
    hits = {}
    for k in range(24):
        t = 2 * math.pi * k / 24
        px, py = x + r * math.cos(t), y + r * math.sin(t)
        u, v = px / W, 1 - py / H
        top = fr[3].lerp(fr[0], u); bot = fr[2].lerp(fr[1], u); loc = bot.lerp(top, v)
        o = mw @ Vector((loc.x, loc.y, 0)) - fwd * 20
        ok, hp, hn, fi, ob, _ = sc.ray_cast(dg, o, fwd)
        if ok:
            name = ob.original.name if hasattr(ob, "original") else ob.name
            rc = rest_centre(name, fi)
            hits.setdefault(name, []).append([round(c, 3) for c in rc] if rc is not None else None)
    out = {}
    for n, l in hits.items():
        l = [q for q in l if q]
        if l:
            out[n] = dict(n=len(l), rest_mean=[round(sum(q[i] for q in l) / len(l), 3) for i in range(3)])
    return out


def shoot(name, target, scale):
    for k in range(8):
        ang = k * 45.0
        d = (math.sin(math.radians(ang)), -math.cos(math.radians(ang)), 0.12)
        bs.setup_render(700, 700); sc.render.film_transparent = True
        cam = bs.setup_camera(target=target, ortho_scale=scale, direction=d, distance=6)
        p = os.path.join(OUT, "%s_%s_a%03d.png" % (TAG, name, ang)); bs.render_to(p, cam)
        cam_info = (cam.matrix_world.copy(), [Vector(c) for c in cam.data.view_frame(scene=sc)])
        bpy.data.objects.remove(cam, do_unlink=True)
        im = Image.open(p).convert("RGBA"); al = np.asarray(im)[..., 3]
        empty = al < 40
        lab, n = ndimage.label(empty)
        border = set(np.unique(np.concatenate([lab[0], lab[-1], lab[:, 0], lab[:, -1]])))
        holes = []
        for i in range(1, n + 1):
            if i in border: continue
            ys, xs = np.nonzero(lab == i)
            if len(xs) >= MIN: holes.append((int(xs.mean()), int(ys.mean()), int(len(xs))))
        bg = Image.new("RGBA", im.size, (200, 200, 205, 255)); bg.alpha_composite(im); dr = ImageDraw.Draw(bg)
        for x, y, s in holes:
            r = max(8, int(math.sqrt(s)) + 6); dr.ellipse((x - r, y - r, x + r, y + r), outline=(255, 0, 0, 255), width=3)
        bg.convert("RGB").save(p)
        located = [locate(cam_info, x, y, s) for x, y, s in holes]
        report.append(dict(view=name, angle=ang, holes=holes, located=located))
        print("GAPS %-24s a%03d holes %d %s" % (name, ang, len(holes), holes[:6]))
        for (hx, hy, hs), L in zip(holes, located):
            print("   at (%d,%d) %dpx: %s" % (hx, hy, hs, "; ".join("%s x%d rest %s" % (n, d["n"], d["rest_mean"]) for n, d in sorted(L.items(), key=lambda kv: -kv[1]["n"]))))


shoot("rest", Vector((0, 0, 1.0)), 2.3)
for spec in clips:
    clip, fr = spec.split(":")
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    src = next(o for o in new if o.type == "ARMATURE"); act = src.animation_data.action
    for o in new:
        if o.type == "MESH": bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data_create(); rig.animation_data.action = act
    if hasattr(rig.animation_data, "action_slot") and len(act.slots): rig.animation_data.action_slot = act.slots[0]
    sc.frame_set(int(fr)); bpy.context.view_layer.update()
    pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head if "B_ROOTJ" in rig.pose.bones else Vector((0, 0, 1))
    shoot("%s_f%s" % (clip, fr), Vector((pel.x, pel.y, 1.0)), 2.3)
json.dump(report, open(os.path.join(OUT, TAG + "_gaps.json"), "w"), indent=1)
print("TOTAL holes", sum(len(r["holes"]) for r in report))
