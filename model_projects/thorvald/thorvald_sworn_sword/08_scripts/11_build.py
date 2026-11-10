"""Sworn Sword, quality pass (S5+): every new part rebuilt to sit with the vanilla parts.

    blender -b --factory-startup --python 11_build.py -- --tag S5 [options]

Base: Thorvald Trooper v13. New objects all use ONE new material, Mat_SwornKit (2048 atlas: tail | sash | wrap | mask |
helmet), with a baked AO (Cycles) feeding the albedo shading and the MetallicGlossAO blue channel, and a normal map
from painted height (strands, folds, rivets).

 * strip   kasa hat off; Duncan apron + belt band removed from DuncanFill_sash except a strip of the front apron (the
           sash); DuncanFill_legs comps 4 (Duncan apron/kama) and 8 (back skirt) removed, comp 7 (groin) kept
 * wrap    NEW snug band from under the chest-plate rim (z 1.262) to over the leg tops (z 1.065), radius from ray casts
           against the torso (top) and legs (bottom) + a slight waist; 5 real folds in the geometry. Weights from the
           old belt band (nearest vertex), the bottom rings blended toward the leg tops' weights
 * sash    the apron strip widened, extended toward the knee with an angled end; moved to the kit (planar UVs)
 * mask    Gunner's mask (comps 0,1 minus the red skull band) + its cheek studs (6,7); scaled to the face, the
           Commando cloth wrap pushed behind it. Its own painted texture is transferred into the kit and recoloured
           black lacquer; studs copper; menpo mouth (oxblood, ivory teeth) painted on the vent
 * helmet  kettle dome with 8 raised ribs, raised brow band with copper rivets, slim copper rolled brim, copper socket;
           the Trooper's gear emblem as a front badge
 * tail    swept horsehair along the Meshy path (out of the socket, arc back, fall away from the neck), clumped
           section, cord binding at the root; strands in albedo + normal; weights head -> neck -> upper spine
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
sys.path.insert(0, r"D:\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402
import paintlib as PL  # noqa: E402

SRC = os.path.join(PROJ, os.pardir, "thorvald_trooper", "Final", "model", "Thorvald_Trooper_v13.blend")
DONORS = os.path.join(PROJ, os.pardir, "thorvald_hero_1", "05_fbx_export", "helmet_donors")

ap = argparse.ArgumentParser()
ap.add_argument("--tag", required=True)
ap.add_argument("--belt-z", type=float, default=1.13)
ap.add_argument("--sash-x", default="-0.005,0.100")
ap.add_argument("--sash-extra", type=float, default=0.13, help="extra sash length below the apron hem (m)")
ap.add_argument("--legs-drop", default="4,8")
ap.add_argument("--wrap-top", type=float, default=1.262)
ap.add_argument("--wrap-bot", type=float, default=1.045)
ap.add_argument("--wrap-folds", type=int, default=6)
ap.add_argument("--wrap-fold-h", type=float, default=0.0065, help="fold bulge (m)")
ap.add_argument("--wrap-margin", type=float, default=0.006)
ap.add_argument("--mask-donor", default="Gunner")
ap.add_argument("--mask-parts", default="0,1,6,7")
ap.add_argument("--mask-ycut", type=float, default=-0.030, help="donor head-local: faces behind this y are dropped")
ap.add_argument("--mask-zcut", type=float, default=0.080, help="donor head-local: faces above this z are dropped")
ap.add_argument("--mask-width", type=float, default=1.06)
ap.add_argument("--mask-dz", type=float, default=0.0)
ap.add_argument("--mask-dy", type=float, default=0.0)
ap.add_argument("--wrap-dip", type=float, default=0.045)
ap.add_argument("--stud-scale", type=float, default=0.55)
ap.add_argument("--menpo-nose", type=float, default=0.012)
ap.add_argument("--menpo-chin", type=float, default=0.007)
ap.add_argument("--menpo-flare", type=float, default=0.009)
ap.add_argument("--wrap-split", type=float, default=1.125, help="below this the band is dark trouser cloth, above it the rust wrap")
ap.add_argument("--brim-front", type=float, default=1.895)
ap.add_argument("--brim-back", type=float, default=1.855)
ap.add_argument("--helm-h", type=float, default=1.30)
ap.add_argument("--helm-margin", type=float, default=0.012)
ap.add_argument("--ribs", type=int, default=8)
ap.add_argument("--rib-h", type=float, default=0.045, help="rib height, fraction of the radius")
ap.add_argument("--badge", type=float, default=0.75, help="gear badge scale vs the chest emblem; 0 = none")
ap.add_argument("--tail-tip-z", type=float, default=1.47)
ap.add_argument("--tail-w", type=float, default=0.062)
ap.add_argument("--tail-root-w", type=float, default=0.034)
ap.add_argument("--tail-th", type=float, default=0.50)
ap.add_argument("--tail-rise", type=float, default=0.09)
ap.add_argument("--tail-out", type=float, default=0.20)
ap.add_argument("--ao-samples", type=int, default=48)
a = ap.parse_args(P.script_args())
OUT_TEX = os.path.join(PROJ, "04_textures", a.tag)
os.makedirs(OUT_TEX, exist_ok=True)
OUT_BLEND = os.path.join(PROJ, "03_blender", "SwornSword_%s.blend" % a.tag)

C = lambda *v: np.array(v, np.float64) / 255.0  # noqa: E731
RUST, RUST_DK = C(150, 62, 34), C(92, 34, 20)
SASH = C(160, 66, 34)
GUNMETAL, GUN_HI = C(56, 59, 64), C(112, 116, 122)
COPPER, COPPER_HI = C(178, 104, 56), C(232, 160, 102)
LACQUER = C(30, 28, 29)
OXBLOOD, IVORY = C(98, 22, 24), C(196, 184, 156)
HAIR_ROOT, HAIR_MID, HAIR_TIP = C(108, 32, 16), C(182, 68, 28), C(210, 104, 50)
CORD = C(30, 26, 24)
TROUSER = C(30, 30, 33)
KW = 2048
REG = {"tail": (0.0, 0.0, 0.25, 1.0), "sash": (0.25, 0.0, 0.36, 0.56), "wrap": (0.36, 0.0, 1.0, 0.20),
       "mask": (0.36, 0.20, 0.68, 0.55), "helmet": (0.36, 0.55, 1.0, 1.0)}

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
KIT = []          # (object, kind)


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


def weights_from(src_pts, src_w, ob, blend=None):
    """Nearest-vertex weight copy: src_pts list of world points, src_w list of {bone: w}."""
    kd = KDTree(len(src_pts))
    for i, p in enumerate(src_pts):
        kd.insert(p, i)
    kd.balance()
    groups = {}
    for v in ob.data.vertices:
        p = ob.matrix_world @ v.co
        _, i, _ = kd.find(p)
        w = dict(src_w[i])
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


# ================================================================================================ 1. strip
bpy.data.objects.remove(obj("TrooperHat"), do_unlink=True)
sash = obj("DuncanFill_sash")
band_pts, band_w = vweights(sash)
band_keep = [(p, w) for p, w in zip(band_pts, band_w) if p.z > a.belt_z - 0.01]
band_pts, band_w = [p for p, _ in band_keep], [w for _, w in band_keep]
x0, x1 = (float(v) for v in a.sash_x.split(","))
me = sash.data
bm = bmesh.new()
bm.from_mesh(me)
bmesh.ops.bisect_plane(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:], plane_co=(0, 0, a.belt_z), plane_no=(0, 0, 1))
for xc in (x0, x1):
    low = [f for f in bm.faces if max(v.co.z for v in f.verts) <= a.belt_z + 1e-4]
    g = list({e for f in low for e in f.edges}) + low + list({v for f in low for v in f.verts})
    bmesh.ops.bisect_plane(bm, geom=g, plane_co=(xc, 0, 0), plane_no=(1, 0, 0))
dead = [f for f in bm.faces if not (f.calc_center_median().z < a.belt_z and x0 < f.calc_center_median().x < x1
                                    and f.calc_center_median().y < -0.04)]
bmesh.ops.delete(bm, geom=dead, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
# extend the hem: two steps down, the far (+x) side longer - an angled end
hem_z = min(v.co.z for v in bm.verts)
cur = [e for e in bm.edges if e.is_boundary and all(abs(v.co.z - hem_z) < 0.02 for v in e.verts)]
for step in (1, 2):
    res = bmesh.ops.extrude_edge_only(bm, edges=cur)
    nv = [g for g in res["geom"] if isinstance(g, bmesh.types.BMVert)]
    for v in nv:
        f = (v.co.x - x0) / (x1 - x0)
        v.co.z = hem_z - a.sash_extra * step / 2 * (0.65 + 0.35 * f)
        v.co.y -= 0.004 * step                     # hangs a touch off the thigh
    cur = [g for g in res["geom"] if isinstance(g, bmesh.types.BMEdge) and all(v in nv for v in g.verts)]
bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
bm.to_mesh(me)
bm.free()
me.update()
me.materials.clear()
me.materials.append(km)
for p in me.polygons:
    p.material_index = 0
uvl = me.uv_layers.active.data
for l in me.loops:
    co = sash.matrix_world @ me.vertices[l.vertex_index].co
    uvl[l.index].uv = (co.x, co.z)
fit_uv(sash, REG["sash"])
sash.name = "SwornSash"
KIT.append((sash, "sash"))
print("SASH %d faces, hem %.3f -> %.3f" % (len(me.polygons), hem_z, hem_z - a.sash_extra))

legs = obj("DuncanFill_legs")
lc = P.components(legs)
kill = set()
for k in [int(x) for x in a.legs_drop.split(",") if x]:
    kill |= set(lc[k])
P.delete_verts(legs, kill)
legs_pts, legs_w = vweights(legs)

# ================================================================================================ 2. wrap
def bvh_of(names):
    vs, fs = [], []
    for n in names:
        o = obj(n)
        base = len(vs)
        vs += [o.matrix_world @ v.co for v in o.data.vertices]
        fs += [tuple(base + i for i in p.vertices) for p in o.data.polygons]
    return BVHTree.FromPolygons(vs, fs)


torso_bvh = bvh_of(["Gurney"])
legs_bvh = bvh_of(["DuncanFill_legs"])
CY = 0.0
NA_W = 40


def radius(bvh, z, th, fallback):
    d = Vector((math.sin(th), -math.cos(th), 0))
    o = Vector((0, CY, z)) + d * 0.34           # inside the A-pose arms' reach
    hit = bvh.ray_cast(o, -d, 0.34)
    return (0.34 - hit[3]) if hit[0] is not None else fallback


r_top = [radius(torso_bvh, max(a.wrap_top, 1.262) + 0.006, 2 * math.pi * j / NA_W, None) for j in range(NA_W)]
r_bot = [radius(legs_bvh, a.wrap_bot + 0.01, 2 * math.pi * j / NA_W, None) for j in range(NA_W)]
for arr in (r_top, r_bot):                                   # fill misses from neighbours
    good = [x for x in arr if x is not None]
    for j in range(NA_W):
        if arr[j] is None:
            arr[j] = sum(good) / len(good)
# the top tucks just inside the chest-plate rim; the bottom sits a margin outside the legs
rows = []
NR = a.wrap_folds * 4
for i in range(NR + 1):
    s = i / NR
    z = a.wrap_bot + (a.wrap_top - a.wrap_bot) * s
    rows.append((z, s, 0.0))
wb = bmesh.new()
wuv = wb.loops.layers.uv.new("UVMap")
grid = []
for (z, s, bulge) in rows:
    ring = []
    for j in range(NA_W):
        th = 2 * math.pi * j / NA_W
        rt = r_top[j] - 0.002
        rb = r_bot[j] + a.wrap_margin
        # wrapped layers: each rises slowly and drops sharply at its lower edge; the wraps run slightly diagonal
        ph = (s * a.wrap_folds + 0.35 * math.sin(th + 0.6)) % 1.0
        bulge = a.wrap_fold_h * (ph ** 1.6) * (1 - ph) ** 0.25 * 2.2 if (0.02 < s < 0.98 and z > a.wrap_split + 0.006) else 0.0
        r = rb + (rt - rb) * (s * s * (3 - 2 * s)) - 0.010 * math.sin(math.pi * s) + bulge
        r = max(r, rb if s < 0.3 else 0.0)
        zz = z - a.wrap_dip * abs(math.cos(th)) ** 4 * (1 - s) ** 2     # hem dips at the front and back centre
        ring.append(wb.verts.new((math.sin(th) * r, CY - math.cos(th) * r, zz)))
    grid.append(ring)
circ = sum(2 * math.pi * (r_top[j] + r_bot[j]) / 2 for j in range(NA_W)) / NA_W
for i in range(NR):
    for j in range(NA_W):
        jn = (j + 1) % NA_W
        f = wb.faces.new([grid[i][j], grid[i][jn], grid[i + 1][jn], grid[i + 1][j]])
        for loop, (uu, vv) in zip(f.loops, ((j, i), (j + 1, i), (j + 1, i + 1), (j, i + 1))):
            loop[wuv].uv = (uu / NA_W * circ, rows[vv][0])
bmesh.ops.recalc_face_normals(wb, faces=wb.faces[:])
wm_ = bpy.data.meshes.new("SwornWrap")
wb.to_mesh(wm_)
wb.free()
wrap = new_obj("SwornWrap", wm_)
fit_uv(wrap, REG["wrap"], keep_aspect=False)


def wrap_blend(p, w):
    f = max(0.0, 1.0 - (p.z - a.wrap_bot) / 0.06) * 0.5     # bottom rings follow the leg tops half-way
    if f <= 0:
        return w
    _, i, _ = legs_kd.find(p)
    out = {b: x * (1 - f) for b, x in w.items()}
    for b, x in legs_w[i].items():
        out[b] = out.get(b, 0.0) + x * f
    return out


legs_kd = KDTree(len(legs_pts))
for i, p in enumerate(legs_pts):
    legs_kd.insert(p, i)
legs_kd.balance()
weights_from(band_pts, band_w, wrap, wrap_blend)
KIT.append((wrap, "wrap"))
print("WRAP %d faces z %.3f..%.3f, circumference %.2f m" % (len(wm_.polygons), a.wrap_bot, a.wrap_top, circ))


# ================================================================================================ 3. mask
def import_head(donor):
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(DONORS, "%s_TRUE_FBX.fbx" % donor))
    new = [o for o in bpy.data.objects if o not in before]
    d_arm = next(o for o in new if o.type == "ARMATURE")
    d_head = d_arm.matrix_world @ d_arm.data.bones["B_HeadJ"].matrix_local
    dm = [o for o in new if o.type == "MESH"]
    for o in bpy.context.view_layer.objects:
        o.select_set(o in dm)
    bpy.context.view_layer.objects.active = dm[0]
    if len(dm) > 1:
        bpy.ops.object.join()
    h = bpy.context.view_layer.objects.active
    for m in list(h.modifiers):
        h.modifiers.remove(m)
    h.parent = None
    h.data.transform(h.matrix_world)
    h.matrix_world = Matrix.Identity(4)
    gn = {g.index: g.name for g in h.vertex_groups}
    dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in h.data.vertices if v.groups}
    b2 = bmesh.new()
    b2.from_mesh(h.data)
    bmesh.ops.delete(b2, geom=[f for f in b2.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                     context="FACES")
    bmesh.ops.delete(b2, geom=[v for v in b2.verts if not v.link_faces], context="VERTS")
    b2.to_mesh(h.data)
    b2.free()
    for o in new:
        if o is not h and o.name in bpy.data.objects:
            bpy.data.objects.remove(o, do_unlink=True)
    return h, d_head


mask, d_head = import_head(a.mask_donor)
mask.name = mask.data.name = "SwornMask"
comps = [c for c in P.components(mask) if len(c) >= 4]
parts = [int(k) for k in a.mask_parts.split(",")]
keep = set()
stud = set()
for k in parts:
    keep |= set(comps[k])
    if k >= 2:
        stud |= set(comps[k])
# per-vertex "stud" flag survives the deletes as a float attribute
fl = mask.data.attributes.new("stud", "FLOAT", "POINT")
for i in range(len(mask.data.vertices)):
    fl.data[i].value = 1.0 if i in stud else 0.0
P.delete_verts(mask, keep, invert=True)
dh = d_head.translation
b2 = bmesh.new()
b2.from_mesh(mask.data)
for co, no in (((0, a.mask_ycut, 0), (0, 1, 0)), ((0, 0, a.mask_zcut), (0, 0, 1))):
    bmesh.ops.bisect_plane(b2, geom=b2.verts[:] + b2.edges[:] + b2.faces[:], plane_co=Vector(co) + dh, plane_no=no,
                           clear_outer=True)
bmesh.ops.delete(b2, geom=[v for v in b2.verts if not v.link_faces], context="VERTS")
b2.to_mesh(mask.data)
b2.free()
# drop little leftover islands of the cut (keep studs)
cs = P.components(mask)
P.delete_verts(mask, {i for c in cs if len(c) < 6 for i in c})
mask.data.transform(K_HEAD @ d_head.inverted())
mask.data.uv_layers[0].name = "src"
head = obj("CommandoHead")
hmw = head.matrix_world
mv = [v.co.copy() for v in mask.data.vertices]
mz0, mz1 = min(v.z for v in mv), max(v.z for v in mv)
m_half = max(abs(v.x) for v in mv)
cheek = [hmw @ v.co for v in head.data.vertices]
cheek = [p for p in cheek if mz0 < p.z < mz1 and p.y < 0.03]
f_half = max(abs(p.x) for p in cheek)
s = a.mask_width * f_half / m_half
ctr = sum(mv, Vector()) / len(mv)
for v, c0 in zip(mask.data.vertices, mv):
    v.co = ctr + (c0 - ctr) * s + Vector((0, a.mask_dy, a.mask_dz))
# --- menpo shaping: sculpted nose, jutting chin, flared lower cheeks; the cord studs made small
studa = mask.data.attributes["stud"]
mvs = [v.co.copy() for v in mask.data.vertices]
zl, zh = min(c.z for c in mvs), max(c.z for c in mvs)
yfront = min(c.y for c in mvs)
sid = [i for i in range(len(mvs)) if studa.data[i].value > 0.5]
for side in (-1, 1):
    ids = [i for i in sid if mvs[i].x * side > 0]
    if ids:
        sc_ = sum((mvs[i] for i in ids), Vector()) / len(ids)
        for i in ids:
            mask.data.vertices[i].co = sc_ + (mvs[i] - sc_) * a.stud_scale
H_ = zh - zl
for v in mask.data.vertices:
    if studa.data[v.index].value > 0.5:
        continue
    c0 = v.co.copy()
    front = c0.y < yfront + 0.045
    if not front:
        continue
    t = (c0.z - zl) / H_                                  # 0 chin .. 1 top (nose bridge)
    # nose: a ridge down the centre of the upper half, widest at the tip (t ~0.62)
    nx = max(0.0, 1 - abs(c0.x) / 0.024) ** 2
    nz = max(0.0, 1 - abs(t - 0.66) / 0.30)
    dy = -a.menpo_nose * nx * nz
    # chin: forward and a touch down at the bottom centre
    cx = max(0.0, 1 - abs(c0.x) / 0.035) ** 2
    cz = max(0.0, 1 - t / 0.22)
    dy -= a.menpo_chin * cx * cz
    # cheek flares: the lower outer edge turned out
    fx = max(0.0, (abs(c0.x) - 0.045) / 0.04)
    fz = max(0.0, 1 - t / 0.40)
    dx = math.copysign(a.menpo_flare * min(fx, 1.0) * fz, c0.x)
    v.co = c0 + Vector((dx, dy, -0.3 * a.menpo_chin * cx * cz))
mask.data.update()
mbvh = BVHTree.FromPolygons([v.co for v in mask.data.vertices], [tuple(p.vertices) for p in mask.data.polygons])
mx = max(abs(v.co.x) for v in mask.data.vertices)
mzl, mzh = min(v.co.z for v in mask.data.vertices), max(v.co.z for v in mask.data.vertices)
inv = hmw.inverted()
pushed = 0
for v in head.data.vertices:
    p = hmw @ v.co
    if not (mzl < p.z < mzh and abs(p.x) < mx and p.y < 0.02):
        continue
    hit = mbvh.ray_cast(p + Vector((0, -0.3, 0)), Vector((0, 1, 0)), 0.6)
    if hit[0] is not None and p.y < hit[0].y + 0.005:
        v.co = inv @ Vector((p.x, hit[0].y + 0.006, p.z))
        pushed += 1
head.data.update()
mask.data.uv_layers.new(name="UVMap")
mask.data.uv_layers.active = mask.data.uv_layers["UVMap"]
bpy.ops.object.select_all(action="DESELECT")
mask.select_set(True)
bpy.context.view_layer.objects.active = mask
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(55), island_margin=0.015)
bpy.ops.object.mode_set(mode="OBJECT")
fit_uv(mask, REG["mask"], 0.008)
KIT.append((mask, "mask"))
print("MASK %s parts %s: %d faces, scale %.3f, %d face verts pushed behind" % (a.mask_donor, parts,
                                                                             len(mask.data.polygons), s, pushed))

# ================================================================================================ 4. helmet
skull = [hmw @ v.co for v in head.data.vertices]
tilt = math.atan2(a.brim_front - a.brim_back, 0.25)
brim_c = Vector((0.0, -0.012, (a.brim_front + a.brim_back) / 2))
R_t = Matrix.Rotation(-tilt, 4, "X")
R_inv = R_t.inverted()


def dome_r(t):
    t = min(max(t, 0.0), 1.0)
    return (1.0 - t ** 2.3) ** 0.5


ASPECT = 1.12
need = 0.0
for p in skull:
    q = R_inv @ (p - brim_c)
    if q.z <= 0.0:
        continue
    lo_s, hi_s = 0.03, 0.4
    for _ in range(40):
        sm = (lo_s + hi_s) / 2
        if math.hypot(q.x / sm, q.y / (sm * ASPECT)) <= dome_r(q.z / (a.helm_h * sm)) - a.helm_margin / sm:
            hi_s = sm
        else:
            lo_s = sm
    need = max(need, hi_s)
RX, RY, H = need, need * ASPECT, a.helm_h * need
BAND0, BAND1 = 0.024, 0.052          # brow band (local z)
# rows: (radial, z, kind) kind: brim / band / dome / knob
prof = [(0.97, 0.016, "brim"), (1.00, -0.003, "brim"), (1.045, -0.002, "brim"), (1.066, 0.007, "brim"),
        (1.06, 0.016, "brim"), (1.03, 0.021, "brim"), (1.006, BAND0, "band"), (1.032, BAND0 + 0.002, "band"),
        (1.034, (BAND0 + BAND1) / 2, "band"), (1.030, BAND1 - 0.002, "band"), (1.004, BAND1, "dome")]
NZ = 9
for i in range(1, NZ):
    t = i / NZ
    z = BAND1 + t * (H - BAND1)
    prof.append((dome_r(z / H) * 1.004 / dome_r(BAND1 / H), z, "dome"))
prof += [(0.30, H - 0.002, "knob"), (0.27, H + 0.012, "knob"), (0.20, H + 0.017, "knob"), (0.0, H + 0.018, "knob")]
NA = 40
hb = bmesh.new()
huv = hb.loops.layers.uv.new("UVMap")
rings = []
for (r_, z_, kind) in prof:
    ring = []
    for j in range(NA):
        th = 2 * math.pi * j / NA
        rr = r_
        if kind == "dome":
            # ribs: narrow raised ridges, fading out toward the top
            fade = max(0.0, 1.0 - (z_ - BAND1) / (H - BAND1)) ** 0.5
            rr *= 1 + a.rib_h * fade * max(0.0, math.cos(a.ribs * th)) ** 10
        if r_ == 0.0:
            if j == 0:
                ring = [hb.verts.new(brim_c + R_t @ Vector((0, 0, z_)))] * NA
            break
        ring.append(hb.verts.new(brim_c + R_t @ Vector((RX * rr * math.sin(th), -RY * rr * math.cos(th), z_))))
    rings.append(ring)
cum = [0.0]
for k in range(1, len(prof)):
    cum.append(cum[-1] + math.hypot((prof[k][0] - prof[k - 1][0]) * RX, prof[k][1] - prof[k - 1][1]))
for k in range(len(rings) - 1):
    for j in range(NA):
        jn = (j + 1) % NA
        vs = [rings[k][j], rings[k][jn], rings[k + 1][jn], rings[k + 1][j]]
        uvs = [(j, k), (j + 1, k), (j + 1, k + 1), (j, k + 1)]
        keepv = []
        for v, uvv in zip(vs, uvs):
            if all(v is not q for q, _ in keepv):
                keepv.append((v, uvv))
        if len(keepv) < 3:
            continue
        f = hb.faces.new([q for q, _ in keepv])
        for loop, (_, (uj, uk)) in zip(f.loops, keepv):
            loop[huv].uv = (uj / NA * 2 * math.pi * RX * 1.05, cum[uk])
bmesh.ops.recalc_face_normals(hb, faces=hb.faces[:])
hm = bpy.data.meshes.new("SwornHelmet")
hb.to_mesh(hm)
hb.free()
helmet = new_obj("SwornHelmet", hm)
fit_uv(helmet, REG["helmet"])
KIT.append((helmet, "helmet"))
helm_top = brim_c + R_t @ Vector((0, 0, H + 0.018))
print("HELMET rx %.3f ry %.3f h %.3f tilt %.1f, %d ribs, %d faces" % (RX, RY, H, math.degrees(tilt), a.ribs,
                                                                        len(hm.polygons)))
badge = None
if a.badge > 0:
    em = obj("TrooperEmblem")
    badge = bpy.data.objects.new("SwornBadge", em.data.copy())
    sc.collection.objects.link(badge)
    bme = badge.data
    bme.transform(em.matrix_world)
    ec = sum((v.co for v in bme.vertices), Vector()) / len(bme.vertices)
    zb = BAND1 + 0.024
    tf = R_inv @ Vector((0, 0, 0))
    front_r = dome_r(zb / H) * 1.004 / dome_r(BAND1 / H)
    loc = brim_c + R_t @ Vector((0, -RY * front_r - 0.002, zb))
    # emblem faces -y on the chest; tilt it back with the dome surface at that height
    slope = math.atan2(RY * (dome_r((zb + 0.01) / H) - dome_r((zb - 0.01) / H)) / dome_r(BAND1 / H), 0.02)
    M = Matrix.Translation(loc) @ R_t @ Matrix.Rotation(-slope, 4, "X") @ Matrix.Scale(a.badge, 4) @ \
        Matrix.Translation(-ec)
    bme.transform(M)
    badge.vertex_groups.clear()
    print("BADGE gear emblem x%.2f at %s" % (a.badge, tuple(round(x, 3) for x in loc)))

# ================================================================================================ 5. tail
deps = bpy.context.evaluated_depsgraph_get()
bv, bf = [], []
for o in bpy.data.objects:
    if o.type != "MESH" or o.name in ("Thorvald_Katana",) or o is badge:
        continue
    oe = o.evaluated_get(deps)
    m2 = oe.to_mesh()
    base = len(bv)
    bv += [o.matrix_world @ v.co for v in m2.vertices]
    bf += [tuple(base + i for i in p.vertices) for p in m2.polygons]
    oe.to_mesh_clear()
scene_bvh = BVHTree.FromPolygons(bv, bf)


def back_y(z, half_w):
    m = -1.0
    for x in (-half_w, -half_w / 2, 0.0, half_w / 2, half_w):
        hit = scene_bvh.ray_cast(Vector((x, 1.5, z)), Vector((0, -1, 0)))
        if hit[0] is not None:
            m = max(m, hit[0].y)
    return m


def width(t):
    if t < 0.30:
        w = a.tail_root_w + (a.tail_w - a.tail_root_w) * (0.5 - 0.5 * math.cos(math.pi * t / 0.30))
    elif t < 0.55:
        w = a.tail_w
    else:
        w = a.tail_w * max(0.0, 1 - ((t - 0.55) / 0.45) ** 1.5)
    return max(w, 0.003)


T = helm_top
ctrl = [Vector((0, T.y - 0.002, T.z - 0.010)), Vector((0, T.y + 0.004, T.z + a.tail_rise * 0.55)),
        Vector((0, T.y + a.tail_out * 0.30, T.z + a.tail_rise)),
        Vector((0, T.y + a.tail_out * 0.70, T.z + a.tail_rise * 0.75)),
        Vector((0, T.y + a.tail_out, T.z + a.tail_rise * 0.05))]
yy = ctrl[-1].y
z = ctrl[-1].z - 0.07
while z > a.tail_tip_z + 0.02:
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
BIND = (0.035, 0.085)                 # cord binding (fraction of the length)


def at_len(sv):
    for i in range(1, len(acc)):
        if acc[i] >= sv:
            f = (sv - acc[i - 1]) / max(acc[i] - acc[i - 1], 1e-9)
            return dense[i - 1].lerp(dense[i], f)
    return dense[-1]


ts = sorted(set([i / NS for i in range(NS + 1)] + [BIND[0], BIND[0] + 0.004, BIND[1] - 0.004, BIND[1],
                                                   (BIND[0] + BIND[1]) / 2]))
tb = bmesh.new()
tuv = tb.loops.layers.uv.new("UVMap")
X = Vector((1, 0, 0))
stations = []
prev_n = None
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
        rip = 1.0 + 0.09 * math.sin(6 * ang + 1.3 * t * 6) if 0.1 < t < 0.95 else 1.0
        if cord:
            rip = 1.16
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
        if rev:
            vs.reverse()
        f = tb.faces.new(vs)
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
KIT.append((tail, "tail"))
close = sum(1 for v in tm.vertices if scene_bvh.find_nearest(v.co, 0.006)[0] is not None)
print("TAIL %.3f m, %d faces, %d verts within 6 mm of body" % (LEN, len(tm.polygons), close))

# ================================================================================================ materials, AO bake
for ob, kind in KIT:
    ob.data.materials.clear()
    ob.data.materials.append(km)
nt = km.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
ao_img = bpy.data.images.new("SwornKit_AO", KW, KW, alpha=False)
ao_node = nt.nodes.new("ShaderNodeTexImage")
ao_node.image = ao_img
nt.nodes.active = ao_node
for o in bpy.data.objects:
    o.select_set(False)
for ob, _ in KIT:
    ob.select_set(True)
bpy.context.view_layer.objects.active = KIT[0][0]
sc.render.engine = "CYCLES"
sc.cycles.samples = a.ao_samples
sc.cycles.device = "CPU"
sc.world.light_settings.distance = 0.12
sc.render.bake.margin = 6
bpy.ops.object.bake(type="AO", margin=6)
AO = PL.img_to_np(ao_img)[..., 0].copy()
nt.nodes.remove(ao_node)
print("AO baked (%d samples), mean %.2f" % (a.ao_samples, float(AO[AO > 0].mean())))
sc.render.engine = "BLENDER_EEVEE"


def tris(ob, **kw):
    return PL.face_tris(ob, range(len(ob.data.polygons)), **kw)


def put(r, c, col, mg, h=None, ao_w=0.55, top=None):
    ao = AO[r, c]
    shade = (1 - ao_w) + ao_w * ao
    if top is not None:
        shade = shade * (0.88 + 0.22 * top)
    alb[r, c, :3] = (col * shade[:, None]).clip(0, 1)
    mga[r, c, 0] = mg[0]
    mga[r, c, 1] = mg[1]
    mga[r, c, 2] = ao.clip(0.25, 1)
    covered[r, c] = True
    if h is not None:
        height[r, c] = h
        hmask[r, c] = True


# --- tail: texture-space strands (v: 1 = root), then shading by position
uv, pos, nrm = tris(tail)
r, c, (pp, nn, uvv) = PL.raster((KW, KW), uv, [pos, nrm, uv])
U = (uvv[:, 0] - u0) / (u1 - u0)
V = (uvv[:, 1] - v0) / (v1 - v0)
tlen = 1.0 - V
strand = (0.45 * PL.hash_noise(U * 64.0 + tlen * 1.5, 1.3) + 0.35 * PL.hash_noise(U * 23.0 + tlen * 4.0, 7.7) +
          0.20 * PL.hash_noise(U * 150.0, 3.1))
gr = np.clip(tlen / 0.5, 0, 1)[:, None]
base = HAIR_ROOT * (1 - gr) + HAIR_MID * gr
tipf = np.clip((tlen - 0.75) / 0.25, 0, 1)[:, None]
base = base * (1 - tipf) + HAIR_TIP * tipf
col = base * (0.62 + 0.62 * strand ** 1.2)[:, None]
sheen = np.clip(nn[:, 2], 0, 1) ** 2 * 0.18                    # top-lit sheen
col = col + sheen[:, None] * C(255, 170, 120)
cordz = (tlen > BIND[0]) & (tlen < BIND[1])
wind = np.sin((tlen - BIND[0]) / (BIND[1] - BIND[0]) * math.pi * 7) > -0.2
col[cordz & wind] = CORD
col[cordz & ~wind] = COPPER * 0.95
rim = cordz & (((tlen - BIND[0]) < 0.004) | ((BIND[1] - tlen) < 0.004))
col[rim] = COPPER
mg = np.where(cordz[:, None], np.array([[0.7, 0.5]]), np.array([[0.0, 0.42]]))
put(r, c, col, mg.T, h=strand * 1.6, ao_w=0.6, top=nn[:, 2])

# --- wrap: folds are geometry; paint shadow under each fold, highlight on the crest, a darker crease, weave noise
uv, pos, nrm = tris(wrap)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
s = (pp[:, 2] - a.wrap_bot) / (a.wrap_top - a.wrap_bot)
thp = np.arctan2(pp[:, 0], -(pp[:, 1] - CY))
sw = (a.wrap_split - a.wrap_bot) / (a.wrap_top - a.wrap_bot)
ph = (s * a.wrap_folds + 0.35 * np.sin(thp + 0.6)) % 1.0
crest = np.clip(ph, 0, 1) ** 1.2                     # lit toward the overhanging lower edge of the layer above
crease = np.exp(-(ph / 0.07) ** 2) + np.exp(-((1 - ph) / 0.025) ** 2) * 0.6
weave = 0.94 + 0.06 * PL.noise3(pp, 400.0, 1.0)
col = RUST * (0.80 + 0.30 * crest)[:, None] * weave[:, None]
col = col * (1 - crease[:, None]) + RUST_DK * crease[:, None]
trous = pp[:, 2] < a.wrap_split
vcrease = 0.85 + 0.15 * PL.hash_noise(thp * 9.0, 2.2)
col[trous] = TROUSER * (vcrease[trous] * (0.95 + 0.05 * PL.noise3(pp[trous], 500.0, 6.0)))[:, None]
edge_sh = trous & (pp[:, 2] > a.wrap_split - 0.012)          # the wrap's shadow on the cloth below it
col[edge_sh] *= 0.55
crest[trous] = 0.0
put(r, c, col, np.array([[0.0], [0.28]]).repeat(len(r), 1), h=crest * 1.2 + (PL.noise3(pp, 900.0, 4.0) - 0.5) * 0.3,
    top=nn[:, 2])

# --- sash: three vertical folds, darker border with stitches, angled hem
uv, pos, nrm = tris(sash)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
fx = ((pp[:, 0] - x0) / (x1 - x0)).clip(0, 1)
fold = np.cos(fx * 3 * math.pi) ** 2
col = SASH * (0.78 + 0.28 * fold)[:, None] * (0.94 + 0.06 * PL.noise3(pp, 400.0, 2.0))[:, None]
edge = (fx < 0.07) | (fx > 0.93)
col[edge] = RUST_DK * 1.15
stitch = (np.abs(fx - 0.09) < 0.012) | (np.abs(fx - 0.91) < 0.012)
dash = (np.floor(pp[:, 2] / 0.008) % 2) == 0
col[stitch & dash] = COPPER * 0.85
put(r, c, col, np.array([[0.0], [0.28]]).repeat(len(r), 1), h=fold * 1.5, top=nn[:, 2])

# --- mask: the donor's painted texture carried over, recoloured lacquer; studs copper; menpo mouth
src_path = [f for f in os.listdir(DONORS) if f.startswith(a.mask_donor + "__") and f.endswith("_Albedo.png")][0]
src_img = bpy.data.images.load(os.path.join(DONORS, src_path))
SRCA = PL.img_to_np(src_img)
studv = np.array([[mask.data.attributes["stud"].data[i].value] for i in range(len(mask.data.vertices))])
uv, pos, nrm, suv, sv_ = PL.face_tris(mask, range(len(mask.data.polygons)), extra_uv="src", vattr=studv)
r, c, (pp, nn, su, st) = PL.raster((KW, KW), uv, [pos, nrm, suv, sv_])
srgb = PL.sample(SRCA, su)[:, :3]
L = PL.lum(srgb)
detail = (L / max(float(np.median(L)), 1e-3)).clip(0.35, 2.2)
col = LACQUER * (0.55 + 0.55 * detail)[:, None]
lacq_hi = np.clip(nn[:, 2] * 0.5 - nn[:, 1] * 0.5, 0, 1) ** 3 * 0.25        # glossy lacquer highlight
col = col + lacq_hi[:, None] * C(150, 150, 155)
isstud = st[:, 0] > 0.5
col[isstud] = COPPER * (0.7 + 0.5 * detail[isstud, None].clip(0.5, 1.4) / 1.4)
mz_lo, mz_hi = pp[:, 2].min(), pp[:, 2].max()
mouth_z = mz_lo + 0.30 * (mz_hi - mz_lo)
front = nn[:, 1] < -0.5
dz = pp[:, 2] - mouth_z
hw = 0.036 * np.sqrt(np.clip(1 - (dz / 0.012) ** 2, 0, 1)) * (1 + 0.25 * (dz < 0))
mouth = front & (np.abs(pp[:, 0]) < hw) & (np.abs(dz) < 0.012) & ~isstud
col[mouth] = OXBLOOD
teeth = mouth & (np.abs(dz - 0.005) < 0.0028) & (np.abs(pp[:, 0]) < 0.027)
col[teeth] = IVORY
gaps = teeth & (np.abs(((pp[:, 0] + 0.0045) / 0.009) % 1.0 - 0.5) < 0.08)
col[gaps] = IVORY * 0.55
# snarl wrinkles: two copper-dark creases from the nose wings to the mouth corners
for sx in (-1, 1):
    d = np.abs((pp[:, 0] * sx - 0.018) - (pp[:, 2] - (mouth_z + 0.03)) * -0.55)
    crease = front & (d < 0.0025) & (pp[:, 2] > mouth_z + 0.013) & (pp[:, 2] < mouth_z + 0.035)
    col[crease] = LACQUER * 0.35
mg = np.where(isstud[:, None], np.array([[0.85, 0.55]]), np.array([[0.10, 0.72]]))
put(r, c, col, mg.T, h=detail * 0.6, ao_w=0.45)
mask.data.uv_layers.remove(mask.data.uv_layers["src"])
mask.data.uv_layers["UVMap"].active_render = True

# --- helmet: gunmetal plates, rib crests worn light, brow band with copper rivets, copper brim + socket
uv, pos, nrm = tris(helmet)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
ql = np.array([tuple(R_inv @ (Vector(p) - brim_c)) for p in pp])
hz = ql[:, 2]
ang = np.arctan2(ql[:, 0] / RX, -ql[:, 1] / RY)
ribf = np.cos(a.ribs * ang).clip(0, 1) ** 10
hammer = PL.noise3(pp, 300.0, 5.0)
col = GUNMETAL * (0.88 + 0.16 * hammer)[:, None]
dome = (hz >= BAND1) & (hz < H - 0.004)
crestw = dome & (ribf > 0.6)
col[crestw] = col[crestw] * 0.6 + GUN_HI * 0.4
band = (hz >= BAND0) & (hz < BAND1)
col[band] = GUNMETAL * 0.92
bedge = band & ((np.abs(hz - BAND0) < 0.003) | (np.abs(hz - BAND1) < 0.003))
col[bedge] = GUN_HI * 0.85
rivet_ang = (ang / (2 * math.pi) * 16) % 1.0
rv = band & (np.abs(rivet_ang - 0.5) < 0.09) & (np.abs(hz - (BAND0 + BAND1) / 2) < 0.0055)
col[rv] = COPPER_HI
brim = hz < BAND0
col[brim] = COPPER * (0.82 + 0.25 * np.clip(nn[brim, 2:3], -1, 1))
knob = hz >= H - 0.004
col[knob] = COPPER * 0.95
metal = np.where((brim | knob | rv)[:, None], np.array([[0.88, 0.58]]), np.array([[0.62, 0.52]]))
hgt = ribf * dome * 1.0 + rv * 1.5 + (hammer - 0.5) * 0.25
put(r, c, col, metal.T, h=hgt, ao_w=0.6, top=nn[:, 2])

# normal map from the painted height (tail strands, folds, rivets, hammered plates)
nrm_map = PL.height_to_normal(height * 4.0, hmask, 1.0)
uncov = ~covered
alb[uncov, :3] = 0.5


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


i_alb = save_img("SwornKit_Albedo", alb)
i_mga = save_img("SwornKit_MetallicGlossAO", mga, True)
i_nrm = save_img("SwornKit_Normal", nrm_map, True)
bpy.data.images.remove(ao_img)
for kind, im in (("Albedo", i_alb), ("MGA", i_mga), ("Normal", i_nrm)):
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

# ================================================================================================ skin + attach
for ob in (mask, helmet) + ((badge,) if badge else ()):
    ob.vertex_groups.clear()
    ob.vertex_groups.new(name="B_HeadJ").add([v.index for v in ob.data.vertices], 1.0, "REPLACE")
tail.vertex_groups.clear()
gh, gn_, gs = (tail.vertex_groups.new(name=n) for n in ("B_HeadJ", "B_Neck01J", "B_SpineTopJ"))
z_hi, z_lo = T.z - 0.08, 1.66
for v in tail.data.vertices:
    f = min(max((v.co.z - z_lo) / (z_hi - z_lo), 0.0), 1.0)
    f = f * f * (3 - 2 * f)
    mid = 4 * f * (1 - f) * 0.35
    rest = max(1 - f - mid, 0.0)
    for g, w in ((gh, f), (gn_, mid), (gs, rest)):
        if w > 0:
            g.add([v.index], w, "REPLACE")
for ob in (wrap, mask, helmet, tail) + ((badge,) if badge else ()):
    P.attach_to_rig(ob, rig, Matrix.Identity(4))
rig.data.pose_position = "POSE"
bpy.context.view_layer.update()
P.purge_orphans()
tri = sum(sum(len(p.vertices) - 2 for p in o.data.polygons) for o in bpy.data.objects
          if o.type == "MESH" and o.name != "Thorvald_Katana")
kit_tri = {o.name: sum(len(p.vertices) - 2 for p in o.data.polygons) for o, _ in KIT}
print("TRIS total %d (no katana); kit %s" % (tri, kit_tri))
print("MATERIALS", sorted({m.name for o in bpy.data.objects if o.type == "MESH" for m in o.data.materials if m}))
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
