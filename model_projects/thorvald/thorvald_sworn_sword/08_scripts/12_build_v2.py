"""Sworn Sword 2.0: the minimal version (fewer hand-made parts, easier to maintain).

    blender -b --factory-startup --python 12_build_v2.py -- --tag 2.0a [options]

Same base as 1.0 (S9, 11_build.py): Thorvald Trooper v13. Differences:
 * NO helmet, NO badge: the trooper's own head shows.
 * mask = the Thorvald hero's mask (Karlin, thorvald_hero_1): Feydakin head comps 1+2 (the half-mask), with the
   hero's own gunmetal paint (thorvald_hero_1/04_textures/B_face_recolour/). No sculpting: moved head bone to head
   bone, scaled to this head, the head's own surface pushed behind it.
 * tail rooted at the crown (a top-knot), cord binding as in 1.0.
 * strip, wrap and sash: unchanged from 1.0.
One kit material (Mat_SwornKit, 2048 atlas: tail | sash | wrap | mask), AO baked, normal from painted height.
Outputs: 03_blender/SwornSword2_<tag>.blend, 04_textures/v2/<tag>/SwornKit_*.png
"""
import argparse
import math
import os
import sys

import bmesh
import bpy
import numpy as np
from mathutils import Matrix, Vector
from mathutils.bvhtree import BVHTree
from mathutils.kdtree import KDTree

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(PROJ, os.pardir, os.pardir, os.pardir, ".claude", "skills", "dsw-part-kitbash", "scripts"))
import dsw_parts as P  # noqa: E402
import paintlib as PL  # noqa: E402

SRC = os.path.join(PROJ, os.pardir, "thorvald_trooper", "Final", "model", "Thorvald_Trooper_v13.blend")
HERO = os.path.join(PROJ, os.pardir, "thorvald_hero_1")
MASK_BLEND = os.path.join(HERO, "01_input", "donors", "Feydakin", "Feydakin_unused.blend")
MASK_TEX = os.path.join(HERO, "04_textures", "B_face_recolour", "Feydakin_Albedo_eyes_hair_mask.png")

ap = argparse.ArgumentParser()
ap.add_argument("--tag", required=True)
# strip / sash / wrap (1.0 values)
ap.add_argument("--belt-z", type=float, default=1.13)
ap.add_argument("--sash-x", default="-0.005,0.100")
ap.add_argument("--sash-extra", type=float, default=0.13)
ap.add_argument("--legs-drop", default="4,8")
ap.add_argument("--wrap-top", type=float, default=1.262)
ap.add_argument("--wrap-bot", type=float, default=1.045)
ap.add_argument("--wrap-folds", type=int, default=6)
ap.add_argument("--wrap-fold-h", type=float, default=0.0065)
ap.add_argument("--wrap-margin", type=float, default=0.006)
ap.add_argument("--wrap-split", type=float, default=1.125)
ap.add_argument("--wrap-dip", type=float, default=0.045)
# mask
ap.add_argument("--mask-parts", default="1,2", help="Feydakin comps (1,2 = the half-mask halves)")
ap.add_argument("--mask-scale", type=float, default=0.0, help="0 = fit to this head's width")
ap.add_argument("--mask-rel", type=float, default=0.88, help="x the fitted scale (2.0b: smaller than the head)")
ap.add_argument("--mask-dy", type=float, default=0.0)
ap.add_argument("--mask-dz", type=float, default=0.0)
ap.add_argument("--mask-gap", type=float, default=0.004, help="head surface pushed this far inside the mask")
# tail (2.0b: off by default)
ap.add_argument("--tail", action="store_true")
# shin stripe: the trooper's thin painted leg lines replaced by one thick copper band
ap.add_argument("--stripe-z", default="0.200,0.255", help="z range of the band; empty = keep the old lines")
ap.add_argument("--sash-gap", type=float, default=0.004, help="sash this far in front of the dark band")
ap.add_argument("--tail-at", default="0.0,0.035,-0.012", help="root offset from the crown point (x,y back,z)")
ap.add_argument("--tail-tip-z", type=float, default=1.47)
ap.add_argument("--tail-w", type=float, default=0.062)
ap.add_argument("--tail-root-w", type=float, default=0.030)
ap.add_argument("--tail-th", type=float, default=0.50)
ap.add_argument("--tail-rise", type=float, default=0.06)
ap.add_argument("--tail-out", type=float, default=0.17)
ap.add_argument("--ao-samples", type=int, default=48)
a = ap.parse_args(P.script_args())
OUT_TEX = os.path.join(PROJ, "04_textures", "v2", a.tag)
os.makedirs(OUT_TEX, exist_ok=True)
OUT_BLEND = os.path.join(PROJ, "03_blender", "SwornSword2_%s.blend" % a.tag)

C = lambda *v: np.array(v, np.float64) / 255.0  # noqa: E731
RUST, RUST_DK = C(150, 62, 34), C(92, 34, 20)
SASH = C(160, 66, 34)
COPPER = C(178, 104, 56)
HAIR_ROOT, HAIR_MID, HAIR_TIP = C(108, 32, 16), C(182, 68, 28), C(210, 104, 50)
CORD = C(30, 26, 24)
TROUSER = C(30, 30, 33)
KW = 2048
REG = {"tail": (0.0, 0.0, 0.25, 1.0), "sash": (0.25, 0.0, 0.36, 0.56), "wrap": (0.36, 0.0, 1.0, 0.20),
       "mask": (0.36, 0.20, 1.0, 1.0)}

bpy.ops.wm.open_mainfile(filepath=os.path.abspath(SRC))
sc = bpy.context.scene
rig = bpy.data.objects["Armature"]
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
K_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local
obj = bpy.data.objects.__getitem__
km = bpy.data.materials.new("Mat_SwornKit")
km.use_nodes = True
alb = np.zeros((KW, KW, 4), np.float32)
alb[..., 3] = 1
mga = np.zeros((KW, KW, 4), np.float32)
mga[...] = (0.0, 0.35, 1.0, 1.0)
height = np.zeros((KW, KW), np.float32)
hmask = np.zeros((KW, KW), bool)
covered = np.zeros((KW, KW), bool)
KIT = []


def new_obj(name, me):
    ob = bpy.data.objects.new(name, me)
    sc.collection.objects.link(ob)
    for p in me.polygons:
        p.use_smooth = True
    return ob


def fit_uv(ob, region, margin=0.004, keep_aspect=True):
    uvl = ob.data.uv_layers.active.data
    us = np.array([l.uv[:] for l in uvl])
    lo, hi = us.min(0), us.max(0)
    u0, v0, u1, v1 = region
    sx = (u1 - u0 - 2 * margin) / max(hi[0] - lo[0], 1e-6)
    sy = (v1 - v0 - 2 * margin) / max(hi[1] - lo[1], 1e-6)
    if keep_aspect:
        sx = sy = min(sx, sy)
    for l, uv in zip(uvl, us):
        l.uv = (u0 + margin + (uv[0] - lo[0]) * sx, v0 + margin + (uv[1] - lo[1]) * sy)


def kd_of(pts):
    kd = KDTree(len(pts))
    for i, p in enumerate(pts):
        kd.insert(p, i)
    kd.balance()
    return kd


def weights_from(src_pts, src_w, ob, blend=None):
    """Nearest-vertex weight copy: src_pts world points, src_w [{bone: w}]."""
    kd = kd_of(src_pts)
    groups = {}
    for v in ob.data.vertices:
        p = ob.matrix_world @ v.co
        w = dict(src_w[kd.find(p)[1]])
        if blend is not None:
            w = blend(p, w)
        tot = sum(w.values()) or 1.0
        for b, x in w.items():
            if x / tot < 0.01:
                continue
            g = groups.get(b) or ob.vertex_groups.new(name=b)
            groups[b] = g
            g.add([v.index], x / tot, "REPLACE")


def vweights(ob):
    gn = {g.index: g.name for g in ob.vertex_groups}
    pts = [ob.matrix_world @ v.co for v in ob.data.vertices]
    ws = [{gn[g.group]: g.weight for g in v.groups if g.weight > 0} for v in ob.data.vertices]
    return pts, ws


def bvh_of(obs):
    vs, fs = [], []
    for o in obs:
        base = len(vs)
        vs += [o.matrix_world @ v.co for v in o.data.vertices]
        fs += [tuple(base + i for i in p.vertices) for p in o.data.polygons]
    return BVHTree.FromPolygons(vs, fs)


# ================================================================================================ 1. strip (= 1.0)
bpy.data.objects.remove(obj("TrooperHat"), do_unlink=True)
old_sash = obj("DuncanFill_sash")
band_pts, band_w = vweights(old_sash)              # all of the old apron + belt: weight source for the wrap and sash
apron_pts, apron_w = band_pts, band_w
band = [(p, w) for p, w in zip(band_pts, band_w) if p.z > a.belt_z - 0.01]
band_pts, band_w = [p for p, _ in band], [w for _, w in band]
apron_hem = min(p.z for p in apron_pts)
bpy.data.objects.remove(old_sash, do_unlink=True)  # 2.0: the sash is a clean generated ribbon (built after the wrap)
x0, x1 = (float(v) for v in a.sash_x.split(","))


legs = obj("DuncanFill_legs")
lc = P.components(legs)
P.delete_verts(legs, {i for k in a.legs_drop.split(",") if k for i in lc[int(k)]})
legs_pts, legs_w = vweights(legs)

# ================================================================================================ 2. wrap (= 1.0)
torso_bvh, legs_bvh = bvh_of([obj("Gurney")]), bvh_of([legs])
NA_W = 40


def radius(bvh, z, th):
    d = Vector((math.sin(th), -math.cos(th), 0))
    hit = bvh.ray_cast(Vector((0, 0, z)) + d * 0.34, -d, 0.34)      # start inside the A-pose arms' reach
    return (0.34 - hit[3]) if hit[0] is not None else None


r_top = [radius(torso_bvh, max(a.wrap_top, 1.262) + 0.006, 2 * math.pi * j / NA_W) for j in range(NA_W)]
r_bot = [radius(legs_bvh, a.wrap_bot + 0.01, 2 * math.pi * j / NA_W) for j in range(NA_W)]
for arr in (r_top, r_bot):
    good = [x for x in arr if x is not None]
    arr[:] = [x if x is not None else sum(good) / len(good) for x in arr]
NR = a.wrap_folds * 4
wb = bmesh.new()
wuv = wb.loops.layers.uv.new("UVMap")
grid, zs = [], []
for i in range(NR + 1):
    s = i / NR
    z = a.wrap_bot + (a.wrap_top - a.wrap_bot) * s
    zs.append(z)
    ring = []
    for j in range(NA_W):
        th = 2 * math.pi * j / NA_W
        rt, rb = r_top[j] - 0.002, r_bot[j] + a.wrap_margin
        ph = (s * a.wrap_folds + 0.35 * math.sin(th + 0.6)) % 1.0     # diagonal layers: slow rise, sharp drop
        bulge = a.wrap_fold_h * ph ** 1.6 * (1 - ph) ** 0.25 * 2.2 if (0.02 < s < 0.98 and z > a.wrap_split + 0.006) else 0
        r = rb + (rt - rb) * (s * s * (3 - 2 * s)) - 0.010 * math.sin(math.pi * s) + bulge
        r = max(r, rb if s < 0.3 else 0.0)
        zz = z - a.wrap_dip * abs(math.cos(th)) ** 4 * (1 - s) ** 2
        ring.append(wb.verts.new((math.sin(th) * r, -math.cos(th) * r, zz)))
    grid.append(ring)
circ = sum(2 * math.pi * (r_top[j] + r_bot[j]) / 2 for j in range(NA_W)) / NA_W
for i in range(NR):
    for j in range(NA_W):
        jn = (j + 1) % NA_W
        f = wb.faces.new([grid[i][j], grid[i][jn], grid[i + 1][jn], grid[i + 1][j]])
        for loop, (uu, vv) in zip(f.loops, ((j, i), (j + 1, i), (j + 1, i + 1), (j, i + 1))):
            loop[wuv].uv = (uu / NA_W * circ, zs[vv])
bmesh.ops.recalc_face_normals(wb, faces=wb.faces[:])
wm_ = bpy.data.meshes.new("SwornWrap")
wb.to_mesh(wm_)
wb.free()
wrap = new_obj("SwornWrap", wm_)
fit_uv(wrap, REG["wrap"], keep_aspect=False)
legs_kd = kd_of(legs_pts)


def wrap_blend(p, w):
    f = max(0.0, 1.0 - (p.z - a.wrap_bot) / 0.06) * 0.5         # bottom rings follow the leg tops half-way
    if f <= 0:
        return w
    out = {b: x * (1 - f) for b, x in w.items()}
    for b, x in legs_w[legs_kd.find(p)[1]].items():
        out[b] = out.get(b, 0.0) + x * f
    return out


weights_from(band_pts, band_w, wrap, wrap_blend)
KIT.append(wrap)
print("WRAP %d faces, circumference %.2f m" % (len(wm_.polygons), circ))
# ---- sash: a ribbon hanging from under the rust layers, over the dark band and the thigh, angled hem
body_bvh = bvh_of([wrap, legs])
NCOL, NROW = 6, 18
z_top = a.wrap_split + 0.012
sb = bmesh.new()
suv = sb.loops.layers.uv.new("UVMap")
cols = []
for ci in range(NCOL + 1):
    f = ci / NCOL
    x = x0 + (x1 - x0) * f
    z_end = apron_hem - a.sash_extra * (0.65 + 0.35 * f)
    col, y_run = [], 1.0
    for ri in range(NROW + 1):
        z = z_top + (z_end - z_top) * ri / NROW
        h = body_bvh.ray_cast(Vector((x, -1.0, z)), Vector((0, 1, 0)), 2.0)
        y = (h[0].y - a.sash_gap) if h[0] is not None else y_run
        y_run = min(y_run, y)                     # hangs straight below a bulge, never back into the body
        col.append(sb.verts.new((x, y_run, z)))
    cols.append(col)
for ci in range(NCOL):
    for ri in range(NROW):
        q = [cols[ci][ri], cols[ci + 1][ri], cols[ci + 1][ri + 1], cols[ci][ri + 1]]
        fc = sb.faces.new(q)
        for loop in fc.loops:
            loop[suv].uv = (loop.vert.co.x, loop.vert.co.z)
bmesh.ops.recalc_face_normals(sb, faces=sb.faces[:])
if sum(fc.normal.y for fc in sb.faces) > 0:            # face the front
    bmesh.ops.reverse_faces(sb, faces=sb.faces[:])
sm_ = bpy.data.meshes.new("SwornSash")
sb.to_mesh(sm_)
sb.free()
sash = new_obj("SwornSash", sm_)
sash.data.uv_layers.active = sash.data.uv_layers["UVMap"]
fit_uv(sash, REG["sash"])
weights_from(apron_pts, apron_w, sash)
KIT.insert(0, sash)
print("SASH ribbon %d faces, z %.3f -> %.3f" % (len(sm_.polygons), z_top, apron_hem - a.sash_extra))

# ================================================================================================ 3. mask (hero's)
with bpy.data.libraries.load(os.path.abspath(MASK_BLEND)) as (src, dst):
    dst.objects = ["Feydakin", "Rig"]
fey, frig = dst.objects
d_head = frig.matrix_world @ frig.data.bones["B_HeadJ"].matrix_local
mask = bpy.data.objects.new("SwornMask", fey.data.copy())
sc.collection.objects.link(mask)
mask.data.transform(fey.matrix_world)
comps = P.components(mask)
P.delete_verts(mask, {i for k in a.mask_parts.split(",") for i in comps[int(k)]}, invert=True)
mask.vertex_groups.clear()
for o in (fey, frig):
    bpy.data.objects.remove(o, do_unlink=True)
mask.data.transform(K_HEAD @ d_head.inverted())
head = obj("CommandoHead")
hmw = head.matrix_world
mv = [v.co.copy() for v in mask.data.vertices]
mz0, mz1 = min(v.z for v in mv), max(v.z for v in mv)
hp = [hmw @ v.co for v in head.data.vertices]
band_h = [p for p in hp if mz0 < p.z < mz1]
s_fit = (max(p.x for p in band_h) - min(p.x for p in band_h)) / (max(v.x for v in mv) - min(v.x for v in mv))
s = a.mask_scale or s_fit * a.mask_rel
hc = Vector((0, sum(p.y for p in band_h) / len(band_h), (mz0 + mz1) / 2))
mc = Vector((0, sum(v.y for v in mv) / len(mv), (mz0 + mz1) / 2))
for v, c0 in zip(mask.data.vertices, mv):
    v.co = hc + (c0 - mc) * s + Vector((0, a.mask_dy, a.mask_dz))
mask.data.update()
mask.data.uv_layers[0].name = "src"
# the head's own surface inside the mask's height is pushed in behind it (nearest-surface test, both sides)
mbvh = BVHTree.FromPolygons([v.co for v in mask.data.vertices], [tuple(p.vertices) for p in mask.data.polygons])
mzl = min(v.co.z for v in mask.data.vertices) - 0.01
mzh = max(v.co.z for v in mask.data.vertices) + 0.01
inv = hmw.inverted()
pushed = 0
for v in head.data.vertices:
    p = hmw @ v.co
    if not (mzl < p.z < mzh):
        continue
    hit, nrm, _, d = mbvh.find_nearest(p, 0.03)
    if hit is None:
        continue
    axis = Vector((0, hc.y, p.z))                    # mask normals are not trusted: outward = away from the head axis
    out = (hit - axis)
    out.z = 0
    if out.length < 1e-6:
        continue
    out.normalize()
    depth = (p - hit).dot(out)                        # > 0: head vertex outside the mask surface
    if depth > -a.mask_gap:
        v.co = inv @ (p - out * (depth + a.mask_gap))
        pushed += 1
head.data.update()
mask.data.uv_layers.new(name="UVMap")
mask.data.uv_layers.active = mask.data.uv_layers["UVMap"]
bpy.ops.object.select_all(action="DESELECT")
mask.select_set(True)
bpy.context.view_layer.objects.active = mask
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(55), island_margin=0.012)
bpy.ops.object.mode_set(mode="OBJECT")
fit_uv(mask, REG["mask"], 0.008)
for p in mask.data.polygons:
    p.use_smooth = True
KIT.append(mask)
print("MASK Feydakin %s: %d faces, scale %.3f (fit %.3f), z %.3f..%.3f, %d head verts pushed" % (
    a.mask_parts, len(mask.data.polygons), s, s_fit, mzl + 0.01, mzh - 0.01, pushed))

# ================================================================================================ 4. tail (from the crown)
tail = None
if a.tail:
    deps = bpy.context.evaluated_depsgraph_get()
    scene_bvh = bvh_of([o for o in bpy.data.objects if o.type == "MESH" and o.name != "Thorvald_Katana"])
    top_z = max(p.z for p in hp)
    crown = [p for p in hp if p.z > top_z - 0.01]
    crown_pt = sum(crown, Vector()) / len(crown)
    ox, oy, oz = (float(x) for x in a.tail_at.split(","))
    T = Vector((ox, crown_pt.y + oy, top_z + oz))
    # drop the root onto the scalp: the highest head surface at that x,y
    hit = scene_bvh.ray_cast(Vector((T.x, T.y, top_z + 0.2)), Vector((0, 0, -1)), 0.4)
    scalp_z = hit[0].z if hit[0] is not None else T.z
    T.z = scalp_z


    def back_y(z, half_w):
        m = -1.0
        for x in (-half_w, -half_w / 2, 0.0, half_w / 2, half_w):
            h = scene_bvh.ray_cast(Vector((x, 1.5, z)), Vector((0, -1, 0)))
            if h[0] is not None:
                m = max(m, h[0].y)
        return m


    def width(t):
        if t < 0.30:
            w = a.tail_root_w + (a.tail_w - a.tail_root_w) * (0.5 - 0.5 * math.cos(math.pi * t / 0.30))
        elif t < 0.55:
            w = a.tail_w
        else:
            w = a.tail_w * max(0.0, 1 - ((t - 0.55) / 0.45) ** 1.5)
        return max(w, 0.003)


    ctrl = [Vector((0, T.y - 0.004, T.z - 0.012)), Vector((0, T.y + 0.004, T.z + a.tail_rise * 0.55)),
            Vector((0, T.y + a.tail_out * 0.30, T.z + a.tail_rise)),
            Vector((0, T.y + a.tail_out * 0.70, T.z + a.tail_rise * 0.75)),
            Vector((0, T.y + a.tail_out, T.z + a.tail_rise * 0.05))]
    yy, z = ctrl[-1].y, ctrl[-1].z - 0.07
    while z > a.tail_tip_z + 0.02:                        # fall: never closer to the body than its own thickness
        yy = max(yy, back_y(z, a.tail_w) + a.tail_w * a.tail_th + 0.012)
        ctrl.append(Vector((0, yy, z)))
        z -= 0.07
    ctrl.append(Vector((0, max(yy, back_y(a.tail_tip_z, 0.01) + 0.012), a.tail_tip_z)))


    def catmull(pts, n_per=16):
        out = []
        ext = [pts[0] * 2 - pts[1]] + pts + [pts[-1] * 2 - pts[-2]]
        for i in range(1, len(ext) - 2):
            p0, p1, p2, p3 = ext[i - 1], ext[i], ext[i + 1], ext[i + 2]
            for k in range(n_per):
                t = k / n_per
                out.append(0.5 * ((2 * p1) + (-p0 + p2) * t + (2 * p0 - 5 * p1 + 4 * p2 - p3) * t * t +
                                  (-p0 + 3 * p1 - 3 * p2 + p3) * t ** 3))
        out.append(pts[-1])
        return out


    dense = catmull(ctrl)
    acc = [0.0]
    for i in range(1, len(dense)):
        acc.append(acc[-1] + (dense[i] - dense[i - 1]).length)
    LEN = acc[-1]
    NS, NK = 34, 14
    BIND = (0.035, 0.085)


    def at_len(sv):
        for i in range(1, len(acc)):
            if acc[i] >= sv:
                return dense[i - 1].lerp(dense[i], (sv - acc[i - 1]) / max(acc[i] - acc[i - 1], 1e-9))
        return dense[-1]


    ts = sorted(set([i / NS for i in range(NS + 1)] + [BIND[0], BIND[0] + 0.004, BIND[1] - 0.004, BIND[1],
                                                       (BIND[0] + BIND[1]) / 2]))
    tb = bmesh.new()
    tuv = tb.loops.layers.uv.new("UVMap")
    X = Vector((1, 0, 0))
    stations, prev_n = [], None
    for t in ts:
        sv = t * LEN
        cpt = at_len(sv)
        tang = (at_len(min(sv + 0.01, LEN)) - at_len(max(sv - 0.01, 0))).normalized()
        nrm = tang.cross(X).normalized()
        if prev_n is not None and nrm.dot(prev_n) < 0:
            nrm = -nrm
        prev_n = nrm
        w = width(t)
        th = max(0.010, a.tail_th * w) if t < 0.97 else 0.004
        cord = BIND[0] + 0.003 < t < BIND[1] - 0.003
        ring = []
        for k in range(NK):
            ang = 2 * math.pi * k / NK
            rip = 1.16 if cord else (1.0 + 0.09 * math.sin(6 * ang + 1.3 * t * 6) if 0.1 < t < 0.95 else 1.0)
            ring.append(tb.verts.new(cpt + X * (w * math.cos(ang) * rip) + nrm * (th * math.sin(ang) * rip)))
        stations.append((t, ring))
    for i in range(len(stations) - 1):
        (t0, r0), (t1, r1) = stations[i], stations[i + 1]
        for k in range(NK):
            kn = (k + 1) % NK
            f = tb.faces.new([r0[k], r0[kn], r1[kn], r1[k]])
            for loop, (uu, vv) in zip(f.loops, ((k, t0), (k + 1, t0), (k + 1, t1), (k, t1))):
                loop[tuv].uv = (uu / NK, 1.0 - vv)
    for (t, ring), rev in ((stations[0], True), (stations[-1], False)):
        cv = tb.verts.new(sum((v.co for v in ring), Vector()) / NK)
        for k in range(NK):
            vs = [ring[k], ring[(k + 1) % NK], cv]
            f = tb.faces.new(vs[::-1] if rev else vs)
            for loop in f.loops:
                loop[tuv].uv = (0.5, 1.0 - t)
    bmesh.ops.recalc_face_normals(tb, faces=tb.faces[:])
    tm = bpy.data.meshes.new("SwornTail")
    tb.to_mesh(tm)
    tb.free()
    tail = new_obj("SwornTail", tm)
    u0, v0, u1, v1 = REG["tail"]
    for l in tm.uv_layers.active.data:
        l.uv = (u0 + 0.004 + l.uv[0] * (u1 - u0 - 0.008), v0 + 0.004 + l.uv[1] * (v1 - v0 - 0.008))
    KIT.append(tail)
    print("TAIL root %s, %.3f m, %d faces" % (tuple(round(x, 3) for x in T), LEN, len(tm.polygons)))

# ================================================================================================ AO bake
for ob in KIT:
    ob.data.materials.clear()
    ob.data.materials.append(km)
nt = km.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
ao_img = bpy.data.images.new("SwornKit_AO", KW, KW, alpha=False)
ao_node = nt.nodes.new("ShaderNodeTexImage")
ao_node.image = ao_img
nt.nodes.active = ao_node
for o in bpy.data.objects:
    o.select_set(o in KIT)
bpy.context.view_layer.objects.active = KIT[0]
mask.data.uv_layers["UVMap"].active_render = True
sc.render.engine = "CYCLES"
sc.cycles.samples = a.ao_samples
sc.cycles.device = "CPU"
sc.world.light_settings.distance = 0.12
bpy.ops.object.bake(type="AO", margin=6)
AO = PL.img_to_np(ao_img)[..., 0].copy()
nt.nodes.remove(ao_node)
sc.render.engine = "BLENDER_EEVEE"


def tris(ob, **kw):
    return PL.face_tris(ob, range(len(ob.data.polygons)), **kw)


def put(r, c, col, mg, h=None, ao_w=0.55, top=None):
    ao = AO[r, c]
    shade = (1 - ao_w) + ao_w * ao
    if top is not None:
        shade = shade * (0.88 + 0.22 * top)
    alb[r, c, :3] = (col * shade[:, None]).clip(0, 1)
    mga[r, c, 0], mga[r, c, 1], mga[r, c, 2] = mg[0], mg[1], ao.clip(0.25, 1)
    covered[r, c] = True
    if h is not None:
        height[r, c] = h
        hmask[r, c] = True


def flat_mg(n, metal, gloss):
    return np.array([[metal], [gloss]]).repeat(n, 1)


if tail:
    # --- tail: strands along the length (v: 1 = root), dark root -> light tips, top-lit sheen, cord binding
    uv, pos, nrm = tris(tail)
    r, c, (pp, nn, uvv) = PL.raster((KW, KW), uv, [pos, nrm, uv])
    U = (uvv[:, 0] - u0) / (u1 - u0)
    tlen = 1.0 - (uvv[:, 1] - v0) / (v1 - v0)
    strand = (0.45 * PL.hash_noise(U * 64.0 + tlen * 1.5, 1.3) + 0.35 * PL.hash_noise(U * 23.0 + tlen * 4.0, 7.7) +
              0.20 * PL.hash_noise(U * 150.0, 3.1))
    gr = np.clip(tlen / 0.5, 0, 1)[:, None]
    tipf = np.clip((tlen - 0.75) / 0.25, 0, 1)[:, None]
    col = (HAIR_ROOT * (1 - gr) + HAIR_MID * gr) * (1 - tipf) + HAIR_TIP * tipf
    col = col * (0.62 + 0.62 * strand ** 1.2)[:, None] + (np.clip(nn[:, 2], 0, 1) ** 2 * 0.18)[:, None] * C(255, 170, 120)
    cordz = (tlen > BIND[0]) & (tlen < BIND[1])
    wind = np.sin((tlen - BIND[0]) / (BIND[1] - BIND[0]) * math.pi * 7) > -0.2
    col[cordz & wind] = CORD
    col[cordz & ~wind] = COPPER * 0.95
    col[cordz & (((tlen - BIND[0]) < 0.004) | ((BIND[1] - tlen) < 0.004))] = COPPER
    mg = np.where(cordz[:, None], np.array([[0.7, 0.5]]), np.array([[0.0, 0.42]]))
    put(r, c, col, mg.T, h=strand * 1.6, ao_w=0.6, top=nn[:, 2])

# --- wrap: shadow under each layer, lit crest, darker crease, weave; trouser cloth below the split
uv, pos, nrm = tris(wrap)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
s = (pp[:, 2] - a.wrap_bot) / (a.wrap_top - a.wrap_bot)
thp = np.arctan2(pp[:, 0], -pp[:, 1])
ph = (s * a.wrap_folds + 0.35 * np.sin(thp + 0.6)) % 1.0
crest = np.clip(ph, 0, 1) ** 1.2
crease = np.exp(-(ph / 0.07) ** 2) + np.exp(-((1 - ph) / 0.025) ** 2) * 0.6
col = RUST * (0.80 + 0.30 * crest)[:, None] * (0.94 + 0.06 * PL.noise3(pp, 400.0, 1.0))[:, None]
col = col * (1 - crease[:, None]) + RUST_DK * crease[:, None]
trous = pp[:, 2] < a.wrap_split
vcrease = 0.85 + 0.15 * PL.hash_noise(thp * 9.0, 2.2)
col[trous] = TROUSER * (vcrease[trous] * (0.95 + 0.05 * PL.noise3(pp[trous], 500.0, 6.0)))[:, None]
col[trous & (pp[:, 2] > a.wrap_split - 0.012)] *= 0.55
crest[trous] = 0.0
put(r, c, col, flat_mg(len(r), 0.0, 0.28), h=crest * 1.2 + (PL.noise3(pp, 900.0, 4.0) - 0.5) * 0.3, top=nn[:, 2])

# --- sash: three vertical folds, dark border with copper stitching
uv, pos, nrm = tris(sash)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
fx = ((pp[:, 0] - x0) / (x1 - x0)).clip(0, 1)
fold = np.cos(fx * 3 * math.pi) ** 2
col = SASH * (0.78 + 0.28 * fold)[:, None] * (0.94 + 0.06 * PL.noise3(pp, 400.0, 2.0))[:, None]
col[(fx < 0.07) | (fx > 0.93)] = RUST_DK * 1.15
stitch = (np.abs(fx - 0.09) < 0.012) | (np.abs(fx - 0.91) < 0.012)
col[stitch & ((np.floor(pp[:, 2] / 0.008) % 2) == 0)] = COPPER * 0.85
put(r, c, col, flat_mg(len(r), 0.0, 0.28), h=fold * 1.5, top=nn[:, 2])

# --- mask: the hero's painted texture as is (gunmetal), carried into the kit through the donor UVs
SRCA = PL.img_to_np(bpy.data.images.load(os.path.abspath(MASK_TEX)))
uv, pos, nrm, suv = PL.face_tris(mask, range(len(mask.data.polygons)), extra_uv="src")
r, c, (pp, nn, su) = PL.raster((KW, KW), uv, [pos, nrm, suv])
col = PL.sample(SRCA, su)[:, :3]
L = PL.lum(col)
put(r, c, col, flat_mg(len(r), 0.55, 0.50), h=(L / max(float(np.median(L)), 1e-3)).clip(0.4, 2.0) * 0.5, ao_w=0.35)
mask.data.uv_layers.remove(mask.data.uv_layers["src"])
mask.data.uv_layers["UVMap"].active_render = True

alb[~covered, :3] = 0.5
nrm_map = PL.height_to_normal(height * 4.0, hmask, 1.0)


def save_img(name, arr, non_color=False):
    im = bpy.data.images.new(name, KW, KW, alpha=True)
    PL.np_to_img(im, arr)
    im.filepath_raw = os.path.join(OUT_TEX, name + ".png")
    im.file_format = "PNG"
    im.save()
    im.pack()
    if non_color:
        im.colorspace_settings.name = "Non-Color"
    return im


bpy.data.images.remove(ao_img)
for kind, im in (("Albedo", save_img("SwornKit_Albedo", alb)), ("MGA", save_img("SwornKit_MetallicGlossAO", mga, True)),
                 ("Normal", save_img("SwornKit_Normal", nrm_map, True))):
    t = nt.nodes.new("ShaderNodeTexImage")
    t.image = im
    if kind == "Albedo":
        nt.links.new(t.outputs["Color"], bsdf.inputs["Base Color"])
    elif kind == "MGA":
        nt.links.new(t.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    else:
        nmn = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(t.outputs["Color"], nmn.inputs["Color"])
        nt.links.new(nmn.outputs["Normal"], bsdf.inputs["Normal"])

# ================================================================================================ shin stripe
# The trooper's legs (DuncanFill_legs, Mat_Duncan) carry three thin dim-orange painted lines on the shins (z ~0.15,
# 0.24, 0.33) that vanish at RTS zoom. Erase them (fill with the dark cloth around them) and paint one thick copper
# band. Written into a NEW image: repainting a packed image and re-packing keeps the old pixels.
if a.stripe_z:
    sz0, sz1 = (float(x) for x in a.stripe_z.split(","))
    dm = legs.data.materials[0]
    tn = next(n for n in dm.node_tree.nodes if n.type == "TEX_IMAGE" and n.image and "lbedo" in n.image.name)
    LA = PL.img_to_np(tn.image).copy()
    shin = [p.index for p in legs.data.polygons if 0.06 < (legs.matrix_world @ p.center).z < 0.42]
    uv, pos, nrm = PL.face_tris(legs, shin)
    r, c, (pp, nn) = PL.raster(LA.shape, uv, [pos, nrm], pad_px=1.5)
    px = LA[r, c, :3]
    orange = (px[:, 0] > px[:, 2] + 0.08) & (px[:, 0] > 0.15)
    cloth = px[~orange].mean(0) if (~orange).any() else np.array([0.05, 0.05, 0.05])
    lum = PL.lum(px)
    det = (lum / max(float(np.median(lum[~orange])), 1e-3)).clip(0.6, 1.5)
    LA[r[orange], c[orange], :3] = cloth * det[orange, None].clip(0.8, 1.2)
    band_px = (pp[:, 2] > sz0) & (pp[:, 2] < sz1)
    edge = band_px & ((pp[:, 2] - sz0 < 0.004) | (sz1 - pp[:, 2] < 0.004))
    # albedo is sRGB-encoded storage: write the copper in display values
    cu = COPPER * (0.85 + 0.25 * np.clip(nn[band_px, 2:3] * 0.5 + 0.5, 0, 1)) * det[band_px, None].clip(0.85, 1.15)
    LA[r[band_px], c[band_px], :3] = cu
    LA[r[edge], c[edge], :3] = COPPER * 0.55
    ni = bpy.data.images.new("SwornLegs_Albedo", LA.shape[1], LA.shape[0], alpha=True)
    PL.np_to_img(ni, LA)
    ni.filepath_raw = os.path.join(OUT_TEX, "SwornLegs_Albedo.png")
    ni.file_format = "PNG"
    ni.save()
    ni.pack()
    tn.image = ni
    print("SHIN %d old-line px erased, copper band z %.3f..%.3f (%d px)" % (int(orange.sum()), sz0, sz1,
                                                                          int(band_px.sum())))

# ================================================================================================ skin + attach
mask.vertex_groups.new(name="B_HeadJ").add([v.index for v in mask.data.vertices], 1.0, "REPLACE")
if tail:
    gh, gn_, gs = (tail.vertex_groups.new(name=n) for n in ("B_HeadJ", "B_Neck01J", "B_SpineTopJ"))
    z_hi, z_lo = T.z - 0.08, 1.66
    for v in tail.data.vertices:
        f = min(max((v.co.z - z_lo) / (z_hi - z_lo), 0.0), 1.0)
        f = f * f * (3 - 2 * f)
        mid = 4 * f * (1 - f) * 0.35
        for g, w in ((gh, f), (gn_, mid), (gs, max(1 - f - mid, 0.0))):
            if w > 0:
                g.add([v.index], w, "REPLACE")
for ob in [o for o in (sash, wrap, mask, tail) if o]:
    P.attach_to_rig(ob, rig, Matrix.Identity(4))
rig.data.pose_position = "POSE"
bpy.context.view_layer.update()
P.purge_orphans()
tri = sum(sum(len(p.vertices) - 2 for p in o.data.polygons) for o in bpy.data.objects
          if o.type == "MESH" and o.name != "Thorvald_Katana")
print("TRIS total %d (no katana); kit %s" % (tri, {o.name: sum(len(p.vertices) - 2 for p in o.data.polygons) for o in KIT}))
print("MATERIALS", sorted({m.name for o in bpy.data.objects if o.type == "MESH" for m in o.data.materials if m}))
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
