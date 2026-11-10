"""Sworn Sword: the Thorvald Trooper v13 with a new head and waist.

    blender -b --factory-startup --python 10_build.py -- --tag S2 [options]

 1. strip: kasa hat off; apron and kama cut away below the belt (DuncanFill_sash), except one narrow strip of the front
    apron on the left (+x) that becomes the hanging sash (game cloth, its own skin weights); the Duncan legs' own hip
    panels (DuncanFill_legs comps 4, 7, 8: the dark kama under the apron) removed too
 2. waist wrap: the band + belt move to the kit material (cylindrical UVs) and are extended down over the hips (closes
    the gap the apron left); painted rust with horizontal folds. The sash strip is repainted on a fresh copy of the
    sash albedo (S1 lesson: re-packing an already packed image keeps the OLD pixels)
 3. samurai mask: the Suboid's lower-face respirator (head-bone parts 1+5), moved head bone to head bone, scaled to the
    face width; the Commando face's cloth wrap verts that would poke through are pushed back behind it (hidden anyway)
 4. helmet: a clean surface of revolution (kettle dome + slim rolled brim + socket knob) from the Meshy profile, fitted
    over the skull, brim tilted (higher at the brow, lower at the nape); gunmetal, copper brim roll and socket
 5. tail: a swept horsehair tail along the Meshy path - up out of the crown socket, arcing back, then falling away from
    the neck (y never moves back toward the body) to hang off the shoulder blades; flattened, clumped cross-section;
    weights head -> neck -> upper spine
 Kit parts share one new material Mat_SwornKit (2048 atlas: tail | wrap | mask | helmet).

Writes 03_blender/SwornSword_<tag>.blend and 04_textures/<tag>/.
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
ap.add_argument("--belt-z", type=float, default=1.13, help="cut line: apron/kama below this go")
ap.add_argument("--sash-x", default="0.015,0.095", help="x range of the apron strip kept as the hanging sash")
ap.add_argument("--legs-drop", default="4,8", help="4 = Duncan front apron + kama, 8 = back skirt (7 is the groin: keep)")
ap.add_argument("--tail-root-w", type=float, default=0.034, help="tail half-width where it leaves the socket (m)")
ap.add_argument("--wrap-bottom", type=float, default=1.00, help="the wrap is extended down to this z over the hips")
ap.add_argument("--wrap-flare", type=float, default=1.035, help="xy scale of the extension's bottom ring")
ap.add_argument("--brim-front", type=float, default=1.895)
ap.add_argument("--brim-back", type=float, default=1.855)
ap.add_argument("--helm-h", type=float, default=1.40, help="dome height / mean radius")
ap.add_argument("--helm-margin", type=float, default=0.012)
ap.add_argument("--mask-parts", default="1,5")
ap.add_argument("--mask-width", type=float, default=1.10, help="mask half-width / face half-width at the cheeks")
ap.add_argument("--mask-dz", type=float, default=0.0)
ap.add_argument("--mask-dy", type=float, default=0.0)
ap.add_argument("--tail-tip-z", type=float, default=1.47)
ap.add_argument("--tail-w", type=float, default=0.062, help="tail max half-width (m)")
ap.add_argument("--tail-th", type=float, default=0.50, help="tail half-thickness / half-width")
ap.add_argument("--tail-rise", type=float, default=0.09, help="arc height above the helmet socket (m)")
ap.add_argument("--tail-out", type=float, default=0.20, help="how far back of the socket the arc reaches (m)")
a = ap.parse_args(P.script_args())
OUT_TEX = os.path.join(PROJ, "04_textures", a.tag)
os.makedirs(OUT_TEX, exist_ok=True)
OUT_BLEND = os.path.join(PROJ, "03_blender", "SwornSword_%s.blend" % a.tag)

RUST = np.array([164, 70, 37]) / 255.0
SASH = np.array([178, 78, 40]) / 255.0
GUNMETAL = np.array([54, 57, 62]) / 255.0
COPPER = np.array([178, 104, 56]) / 255.0
LACQUER = np.array([30, 29, 30]) / 255.0
HAIR = np.array([186, 72, 28]) / 255.0
KW = 2048
REG = {"tail": (0.0, 0.0, 0.30, 1.0), "wrap": (0.30, 0.0, 1.0, 0.17), "mask": (0.30, 0.17, 0.62, 0.56),
       "helmet": (0.30, 0.56, 1.0, 1.0)}

bpy.ops.wm.open_mainfile(filepath=os.path.abspath(SRC))
sc = bpy.context.scene
rig = bpy.data.objects["Armature"]
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
K_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local


def obj(name):
    return bpy.data.objects[name]


def fit_uv_to_region(ob, region, margin=0.01, faces=None):
    me = ob.data
    uvl = me.uv_layers.active.data
    loops = [l for f in (faces if faces is not None else range(len(me.polygons)))
             for l in me.polygons[f].loop_indices]
    us = np.array([uvl[l].uv[:] for l in loops])
    lo, hi = us.min(0), us.max(0)
    u0, v0, u1, v1 = region
    s = min((u1 - u0 - 2 * margin) / max(hi[0] - lo[0], 1e-6), (v1 - v0 - 2 * margin) / max(hi[1] - lo[1], 1e-6))
    for l, uv in zip(loops, us):
        uvl[l].uv = (u0 + margin + (uv[0] - lo[0]) * s, v0 + margin + (uv[1] - lo[1]) * s)


km = bpy.data.materials.new("Mat_SwornKit")           # images attached at the end
km.use_nodes = True
kit_alb = np.zeros((KW, KW, 4), np.float32)
kit_alb[..., 3] = 1
kit_mga = np.zeros((KW, KW, 4), np.float32)
kit_mga[..., :] = (0.0, 0.35, 1.0, 1.0)

# ---------------------------------------------------------------------------------------------------- 1. strip
bpy.data.objects.remove(obj("TrooperHat"), do_unlink=True)
sash = obj("DuncanFill_sash")
x0, x1 = (float(v) for v in a.sash_x.split(","))
me = sash.data
bm = bmesh.new()
bm.from_mesh(me)
bmesh.ops.bisect_plane(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:], plane_co=(0, 0, a.belt_z), plane_no=(0, 0, 1))
for xc in (x0, x1):
    low = [f for f in bm.faces if max(v.co.z for v in f.verts) <= a.belt_z + 1e-4]
    g = list({e for f in low for e in f.edges}) + low + list({v for f in low for v in f.verts})
    bmesh.ops.bisect_plane(bm, geom=g, plane_co=(xc, 0, 0), plane_no=(1, 0, 0))
dead = []
for f in bm.faces:
    c = f.calc_center_median()
    if c.z >= a.belt_z:
        continue
    if x0 < c.x < x1 and c.y < -0.04:
        continue                      # the sash strip (front layer only)
    dead.append(f)
bmesh.ops.delete(bm, geom=dead, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")

# ---------------------------------------------------------------------------------------------------- 2. wrap
# extension: the band's open bottom edge (left by the cut) extruded down over the hips in two steps
bm.verts.ensure_lookup_table()
band_faces = {f for f in bm.faces if f.calc_center_median().z >= a.belt_z}
bnd = [e for e in bm.edges if e.is_boundary and all(abs(v.co.z - a.belt_z) < 0.004 for v in e.verts)
       and any(f in band_faces for f in e.link_faces)]
cy = 0.0
# obstacles the extension must sit outside of: the legs (minus the dropped apron/skirt) and the torso
legs = obj("DuncanFill_legs")
lc = P.components(legs)
kill = set()
for k in [int(x) for x in a.legs_drop.split(",") if x]:
    kill |= set(lc[k])
P.delete_verts(legs, kill)
print("STRIP legs: dropped comps %s (%d verts)" % (a.legs_drop, len(kill)))
ov, of = [], []
for oname in ("DuncanFill_legs", "Gurney"):
    o = obj(oname)
    base = len(ov)
    ov += [o.matrix_world @ v.co for v in o.data.vertices]
    of += [tuple(base + i for i in p.vertices) for p in o.data.polygons]
obst = BVHTree.FromPolygons(ov, of)
new_faces = []
cur = bnd
NSTEP = 3
pushed_out = 0
for step in range(1, NSTEP + 1):
    f_ = step / NSTEP
    zt = a.belt_z + (a.wrap_bottom - a.belt_z) * f_
    fl = 1 + (a.wrap_flare - 1) * f_
    res = bmesh.ops.extrude_edge_only(bm, edges=cur)
    nv = [g for g in res["geom"] if isinstance(g, bmesh.types.BMVert)]
    ne = [g for g in res["geom"] if isinstance(g, bmesh.types.BMEdge)]
    for v in nv:
        v.co.x *= fl
        v.co.y = cy + (v.co.y - cy) * fl
        v.co.z = zt
        d = Vector((v.co.x, v.co.y - cy, 0.0))
        r_now = d.length
        d.normalize()
        o = Vector((0, cy, zt)) + d * 0.6
        hit = obst.ray_cast(o, -d, 0.6)
        if hit[0] is not None:
            r_need = 0.6 - hit[3] + 0.008
            if r_need > r_now:
                v.co.x, v.co.y = d.x * r_need, cy + d.y * r_need
                pushed_out += 1
    new_faces += [f for e in ne for f in e.link_faces]
    cur = [e for e in ne if all(v in nv for v in e.verts)]
print("WRAP extension: %d verts pushed outside the legs/torso" % pushed_out)
wrap_set = band_faces | set(new_faces)
for f in bm.faces:
    f.material_index = 1 if f in wrap_set else 0
bmesh.ops.recalc_face_normals(bm, faces=list(set(new_faces)))
bm.to_mesh(me)
bm.free()
me.materials.append(km)
me.update()
print("STRIP+WRAP sash: %d faces (%d wrap), extension %d faces down to z %.3f" % (
    len(me.polygons), len([p for p in me.polygons if p.material_index == 1]), len(set(new_faces)), a.wrap_bottom))
# cylindrical UVs for the wrap (seam at the back)
wrap_f = [p.index for p in me.polygons if p.material_index == 1]
uvl = me.uv_layers.active.data
for fi in wrap_f:
    p = me.polygons[fi]
    us = []
    for l in p.loop_indices:
        co = me.vertices[me.loops[l].vertex_index].co
        us.append((math.atan2(co.x, -co.y) / (2 * math.pi) + 0.5, co.z))
    span = max(u for u, _ in us) - min(u for u, _ in us)
    for l, (u, z) in zip(p.loop_indices, us):
        if span > 0.5 and u < 0.5:
            u += 1.0
        uvl[l].uv = (u * 1.6, z)                        # circumference ~1.6 m: keep texels square-ish
fit_uv_to_region(sash, REG["wrap"], 0.004, wrap_f)

# wrap paint (kit atlas, by position)
uv, pos, nrm = PL.face_tris(sash, wrap_f)
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
z = pp[:, 2]
ph = ((z - a.wrap_bottom) / 0.0175) % 1.0
fold = 0.78 + 0.26 * np.sin(ph * math.pi) ** 0.6
crease = np.where((ph < 0.07) | (ph > 0.96), 0.58, 1.0)
noise = 0.94 + 0.06 * PL.hash_noise(pp[:, 0] * 160 + pp[:, 1] * 140, 4.2)
light = 0.85 + 0.2 * nn[:, 2].clip(-1, 1)
col = RUST[None] * (fold * crease * noise * light)[:, None]
kit_alb[r, c, :3] = col.clip(0, 1)
kit_mga[r, c] = (0.0, 0.30, 1.0, 1.0)

# sash strip: repaint on a FRESH image copy of the sash albedo
mat = me.materials[0]
alb_node = next(l.from_node for l in mat.node_tree.links
                if l.to_node.type == "BSDF_PRINCIPLED" and l.to_socket.name == "Base Color")
src_img = alb_node.image
arr = PL.img_to_np(src_img)
src = arr.copy()
strip_f = [p.index for p in me.polygons if p.material_index == 0]
uv, pos, nrm = PL.face_tris(sash, strip_f)
r, c, (pp, nn) = PL.raster(arr.shape, uv, [pos, nrm])
L = PL.lum(src[r, c, :3])
ph = ((pp[:, 0] - x0) / (x1 - x0)).clip(0, 1)
fold = 0.80 + 0.20 * np.cos(ph * 3 * math.pi) ** 2
detail = (L / max(np.median(L), 1e-3)).clip(0.7, 1.3) ** 0.45
arr[r, c, :3] = (SASH[None] * (fold * detail)[:, None]).clip(0, 1)
new_img = bpy.data.images.new("SwornSash_Albedo", src_img.size[0], src_img.size[1], alpha=True)
PL.np_to_img(new_img, arr)
new_img.filepath_raw = os.path.join(OUT_TEX, "SwornSash_Albedo.png")
new_img.file_format = "PNG"
new_img.save()
new_img.pack()
alb_node.image = new_img
mat.name = "Mat_SwornSash"
print("SASH strip repainted: %d faces -> %s" % (len(strip_f), new_img.filepath_raw))


def import_head_parts(donor, keep):
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
    bm2 = bmesh.new()
    bm2.from_mesh(h.data)
    bmesh.ops.delete(bm2, geom=[f for f in bm2.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                     context="FACES")
    bmesh.ops.delete(bm2, geom=[v for v in bm2.verts if not v.link_faces], context="VERTS")
    bm2.to_mesh(h.data)
    bm2.free()
    comps = [cc for cc in P.components(h) if len(cc) >= 4]
    ids = set()
    for k in keep:
        ids |= set(comps[k])
    P.delete_verts(h, ids, invert=True)
    for o in new:
        if o is not h and o.name in bpy.data.objects:
            bpy.data.objects.remove(o, do_unlink=True)
    h.data.transform(K_HEAD @ d_head.inverted())
    return h


# ---------------------------------------------------------------------------------------------------- 3. mask
head = obj("CommandoHead")
hmw = head.matrix_world
mask = import_head_parts("Suboid", [int(k) for k in a.mask_parts.split(",")])
mask.name = mask.data.name = "SwornMask"
mv = [v.co.copy() for v in mask.data.vertices]
mz0, mz1 = min(v.z for v in mv), max(v.z for v in mv)
m_half = max(abs(v.x) for v in mv)
cheek = [hmw @ v.co for v in head.data.vertices]
cheek = [p for p in cheek if mz0 < p.z < mz1 and p.y < 0.03]
f_half = max(abs(p.x) for p in cheek)
s = a.mask_width * f_half / m_half
ctr = sum(mv, Vector()) / len(mv)
for v, c0 in zip(mask.data.vertices, mv):
    v.co = Vector((ctr.x + (c0.x - ctr.x) * s, ctr.y + (c0.y - ctr.y) * s, ctr.z + (c0.z - ctr.z) * s)) + Vector(
        (0, a.mask_dy, a.mask_dz))
mask.data.update()
mfaces = [tuple(p.vertices) for p in mask.data.polygons]
mbvh = BVHTree.FromPolygons([v.co for v in mask.data.vertices], mfaces)
mx = max(abs(v.co.x) for v in mask.data.vertices)
mzl, mzh = min(v.co.z for v in mask.data.vertices), max(v.co.z for v in mask.data.vertices)
pushed = 0
inv = hmw.inverted()
for v in head.data.vertices:
    p = hmw @ v.co
    if not (mzl < p.z < mzh and abs(p.x) < mx and p.y < 0.02):
        continue
    # the mask surface straight in front of (or behind) this point
    hit_f = mbvh.ray_cast(p + Vector((0, -0.3, 0)), Vector((0, 1, 0)), 0.6)
    if hit_f[0] is None:
        continue
    front_y = hit_f[0].y
    if p.y < front_y + 0.005:
        p2 = Vector((p.x, front_y + 0.006, p.z))
        v.co = inv @ p2
        pushed += 1
head.data.update()
print("MASK scale %.3f (face half-width %.3f, mask %.3f); %d face verts pushed behind it" % (s, f_half, m_half,
                                                                                          pushed))

# ---------------------------------------------------------------------------------------------------- 4. helmet
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
        rr = math.hypot(q.x / sm, q.y / (sm * ASPECT))
        if rr <= dome_r(q.z / (a.helm_h * sm)) - a.helm_margin / sm:
            hi_s = sm
        else:
            lo_s = sm
    need = max(need, hi_s)
RX, RY, H = need, need * ASPECT, a.helm_h * need
print("HELMET rx %.3f ry %.3f h %.3f tilt %.1f deg" % (RX, RY, H, math.degrees(tilt)))
# (radial scale, z) bottom -> top: inner lip, slim rolled brim, kettle dome, small socket knob
prof = [(0.97, 0.016), (1.00, -0.003), (1.045, -0.002), (1.065, 0.007), (1.06, 0.016), (1.03, 0.021), (1.005, 0.024)]
NZ = 14
for i in range(1, NZ):
    t = i / NZ
    prof.append((dome_r(t) * 1.005, 0.024 + t * (H - 0.024)))
prof = prof[:-1] + [(0.30, H - 0.002), (0.27, H + 0.012), (0.20, H + 0.017), (0.0, H + 0.018)]
NA = 40
hb = bmesh.new()
huv = hb.loops.layers.uv.new("UVMap")
rings = []
for (r_, z_) in prof:
    ring = []
    for j in range(NA + 1):
        th = 2 * math.pi * j / NA
        if r_ == 0.0 and j > 0:
            ring.append(ring[0])
            continue
        ring.append(hb.verts.new(brim_c + R_t @ Vector((RX * r_ * math.sin(th), -RY * r_ * math.cos(th), z_))))
    if r_ != 0.0:
        ring[NA] = ring[0]
    rings.append(ring)
cum = [0.0]
for k in range(1, len(prof)):
    cum.append(cum[-1] + math.hypot(prof[k][0] - prof[k - 1][0], (prof[k][1] - prof[k - 1][1]) / max(RX, 1e-3)))
for k in range(len(rings) - 1):
    for j in range(NA):
        vs = [rings[k][j], rings[k][j + 1], rings[k + 1][j + 1], rings[k + 1][j]]
        uvs = [(j / NA, cum[k]), ((j + 1) / NA, cum[k]), ((j + 1) / NA, cum[k + 1]), (j / NA, cum[k + 1])]
        keep = []
        for v, uvv in zip(vs, uvs):
            if all(v is not q for q, _ in keep):
                keep.append((v, uvv))
        if len(keep) < 3:
            continue
        try:
            f = hb.faces.new([q for q, _ in keep])
        except ValueError:
            continue
        for loop, (_, uvv) in zip(f.loops, keep):
            loop[huv].uv = (uvv[0] * 2.6, uvv[1] / cum[-1])
bmesh.ops.recalc_face_normals(hb, faces=hb.faces[:])
hm = bpy.data.meshes.new("SwornHelmet")
hb.to_mesh(hm)
hb.free()
helmet = bpy.data.objects.new("SwornHelmet", hm)
sc.collection.objects.link(helmet)
for p in hm.polygons:
    p.use_smooth = True
fit_uv_to_region(helmet, REG["helmet"], 0.004)
helm_top = brim_c + R_t @ Vector((0, 0, H + 0.018))
print("HELMET top %s, %d faces" % (tuple(round(x, 3) for x in helm_top), len(hm.polygons)))

# ---------------------------------------------------------------------------------------------------- 5. tail
deps = bpy.context.evaluated_depsgraph_get()
bv, bf = [], []
for o in bpy.data.objects:
    if o.type != "MESH" or o.name == "Thorvald_Katana":
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
# the arc: up out of the socket, over and back (a rounded hook like the reference)
ctrl = [Vector((0, T.y - 0.002, T.z - 0.010)), Vector((0, T.y + 0.004, T.z + a.tail_rise * 0.55)),
        Vector((0, T.y + a.tail_out * 0.30, T.z + a.tail_rise)),
        Vector((0, T.y + a.tail_out * 0.70, T.z + a.tail_rise * 0.75)),
        Vector((0, T.y + a.tail_out, T.z + a.tail_rise * 0.05))]
# the fall: y never moves back toward the body (it hangs off the shoulder blades), keeping clear of them
yy = ctrl[-1].y
z = ctrl[-1].z - 0.07
while z > a.tail_tip_z + 0.02:
    tz = 0.4 + 0.6 * (ctrl[-1].z - z) / max(ctrl[-1].z - a.tail_tip_z, 1e-3)
    need_y = back_y(z, a.tail_w) + a.tail_w * a.tail_th + 0.012
    yy = max(yy, need_y)
    ctrl.append(Vector((0, yy, z)))
    z -= 0.07
ctrl.append(Vector((0, max(yy, back_y(a.tail_tip_z, 0.01) + 0.012), a.tail_tip_z)))


def catmull(pts, n_per=10):
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


dense = catmull(ctrl, 16)
acc = [0.0]
for i in range(1, len(dense)):
    acc.append(acc[-1] + (dense[i] - dense[i - 1]).length)
LEN = acc[-1]
NS, NK = 48, 18


def at_len(sv):
    for i in range(1, len(acc)):
        if acc[i] >= sv:
            f = (sv - acc[i - 1]) / max(acc[i] - acc[i - 1], 1e-9)
            return dense[i - 1].lerp(dense[i], f)
    return dense[-1]


tb = bmesh.new()
tuv = tb.loops.layers.uv.new("UVMap")
X = Vector((1, 0, 0))
stations = []
prev_n = None
for i in range(NS + 1):
    t = i / NS
    sv = t * LEN
    cpt = at_len(sv)
    tang = (at_len(min(sv + 0.01, LEN)) - at_len(max(sv - 0.01, 0))).normalized()
    nrm = tang.cross(X).normalized()
    if prev_n is not None and nrm.dot(prev_n) < 0:
        nrm = -nrm
    prev_n = nrm
    w = width(t)
    th = max(0.010, a.tail_th * w) if t < 0.97 else 0.004
    ring = []
    for k in range(NK):
        ang = 2 * math.pi * k / NK
        rip = 1.0 + 0.09 * math.sin(6 * ang + 1.3 * t * 6) if 0.05 < t < 0.95 else 1.0
        ring.append(tb.verts.new(cpt + X * (w * math.cos(ang) * rip) + nrm * (th * math.sin(ang) * rip)))
    ring.append(ring[0])
    stations.append((t, cpt, ring))
for i in range(NS):
    r0, r1 = stations[i][2], stations[i + 1][2]
    for k in range(NK):
        f = tb.faces.new([r0[k], r0[k + 1], r1[k + 1], r1[k]])
        for loop, (uu, vv) in zip(f.loops, ((k, i), (k + 1, i), (k + 1, i + 1), (k, i + 1))):
            loop[tuv].uv = (uu / NK, 1.0 - vv / NS)
for ring, rev in ((stations[0][2], True), (stations[-1][2], False)):
    cv = tb.verts.new(sum((v.co for v in ring[:NK]), Vector()) / NK)
    for k in range(NK):
        vs = [ring[k], ring[k + 1], cv]
        if rev:
            vs.reverse()
        f = tb.faces.new(vs)
        for loop in f.loops:
            loop[tuv].uv = (0.5, 0.999 if rev else 0.001)
bmesh.ops.recalc_face_normals(tb, faces=tb.faces[:])
tm = bpy.data.meshes.new("SwornTail")
tb.to_mesh(tm)
tb.free()
tail = bpy.data.objects.new("SwornTail", tm)
sc.collection.objects.link(tail)
for p in tm.polygons:
    p.use_smooth = True
# UVs: u around (0..1) -> region width, v along -> region height (stretch both to fill the strip)
uvl = tm.uv_layers.active.data
u0, v0, u1, v1 = REG["tail"]
for l in uvl:
    l.uv = (u0 + 0.004 + l.uv[0] * (u1 - u0 - 0.008), v0 + 0.004 + l.uv[1] * (v1 - v0 - 0.008))
close = sum(1 for v in tm.vertices if scene_bvh.find_nearest(v.co, 0.006)[0] is not None)
print("TAIL length %.3f m, tip z %.3f, %d faces; verts within 6 mm of body/helmet: %d of %d" % (
    LEN, a.tail_tip_z, len(tm.polygons), close, len(tm.vertices)))

# ---------------------------------------------------------------------------------------------------- mask UVs
bpy.ops.object.select_all(action="DESELECT")
mask.select_set(True)
bpy.context.view_layer.objects.active = mask
if not mask.data.uv_layers:
    mask.data.uv_layers.new(name="UVMap")
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(60), island_margin=0.02)
bpy.ops.object.mode_set(mode="OBJECT")
fit_uv_to_region(mask, REG["mask"], 0.01)

# ---------------------------------------------------------------------------------------------------- kit paint
# tail strands (texture space): v = 1 at the root
u0, v0, u1, v1 = REG["tail"]
cols_px = np.arange(int(u0 * KW), int(u1 * KW))
rows_px = np.arange(int(v0 * KW), int(v1 * KW))
U, V = np.meshgrid((cols_px - u0 * KW) / ((u1 - u0) * KW), (rows_px - v0 * KW) / ((v1 - v0) * KW))
strand = (0.50 * PL.hash_noise(U * 70.0 + V * 2.0, 1.3) + 0.30 * PL.hash_noise(U * 29.0 + V * 5.0, 7.7) +
          0.20 * PL.hash_noise(U * 180.0, 3.1))
shade = 0.62 + 0.55 * strand ** 1.3
clump = 0.85 + 0.15 * np.cos(U * 2 * math.pi * 6 + 1.3 * (1 - V) * 6 * 2 * math.pi / 6.0)
root = np.clip((1.0 - V) / 0.06, 0.5, 1.0)
tip = 1.0 + 0.12 * np.clip((0.2 - V) / 0.2, 0, 1)
val = (shade * clump * root * tip)[..., None] * HAIR[None, None]
kit_alb[rows_px[0]:rows_px[-1] + 1, cols_px[0]:cols_px[-1] + 1, :3] = val.clip(0, 1)
kit_mga[rows_px[0]:rows_px[-1] + 1, cols_px[0]:cols_px[-1] + 1, :] = (0.0, 0.45, 1.0, 1.0)

# helmet
uv, pos, nrm = PL.face_tris(helmet, range(len(helmet.data.polygons)))
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
ql = np.array([tuple(R_inv @ (Vector(p) - brim_c)) for p in pp])
hz = ql[:, 2]
noise = 0.93 + 0.07 * PL.hash_noise(pp[:, 0] * 220 + pp[:, 1] * 170 + pp[:, 2] * 260, 2.0)
light = 0.82 + 0.22 * nn[:, 2].clip(-1, 1)
col = GUNMETAL[None] * (noise * light)[:, None]
brim = hz < 0.024
col[brim] = COPPER[None] * (0.80 + 0.22 * nn[brim, 2:3].clip(-1, 1))
groove = (hz >= 0.024) & (hz < 0.029)
col[groove] *= 0.55
knob = hz > H - 0.004
col[knob] = COPPER[None] * 0.92
kit_alb[r, c, :3] = col.clip(0, 1)
kit_mga[r, c] = np.where((brim | knob)[:, None], (0.85, 0.55, 1.0, 1.0), (0.55, 0.50, 1.0, 1.0))

# mask: black lacquer, copper rim along the open edges, snarling mouth
mme = mask.data
efc = {}
for p in mme.polygons:
    for k in p.edge_keys:
        efc[k] = efc.get(k, 0) + 1
rim_v = {v for k, n in efc.items() if n == 1 for v in k}
rim_pts = np.array([tuple(mask.matrix_world @ mme.vertices[v].co) for v in rim_v])
uv, pos, nrm = PL.face_tris(mask, range(len(mme.polygons)))
r, c, (pp, nn) = PL.raster((KW, KW), uv, [pos, nrm])
d_rim = np.full(len(pp), 9.0)
for k in range(0, len(rim_pts), 64):
    d_rim = np.minimum(d_rim, np.linalg.norm(pp[:, None, :] - rim_pts[None, k:k + 64], axis=2).min(1))
light = 0.75 + 0.45 * np.clip(-nn[:, 1] * 0.6 + nn[:, 2] * 0.4, -1, 1)
col = LACQUER[None] * light[:, None]
mz_lo, mz_hi = pp[:, 2].min(), pp[:, 2].max()
mouth_z = mz_lo + 0.33 * (mz_hi - mz_lo)
facing = nn[:, 1] < -0.45
half_w = 0.034 * (1 - ((pp[:, 2] - mouth_z) / 0.011) ** 2).clip(0, 1) ** 0.5
mouth = facing & (np.abs(pp[:, 0]) < half_w) & (np.abs(pp[:, 2] - mouth_z) < 0.011)
col[mouth] = np.array([10, 8, 8]) / 255.0
teeth = mouth & (np.abs(pp[:, 2] - (mouth_z + 0.005)) < 0.0028) & (np.abs(pp[:, 0]) < 0.026)
col[teeth] = np.array([168, 156, 132]) / 255.0
rim = d_rim < 0.0045
col[rim] = COPPER[None]
kit_alb[r, c, :3] = col.clip(0, 1)
kit_mga[r, c] = np.where(rim[:, None], (0.85, 0.55, 1.0, 1.0), (0.15, 0.70, 1.0, 1.0))


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


nrm_arr = np.zeros((KW, KW, 4), np.float32)
nrm_arr[..., :] = (0.5, 0.5, 1.0, 1.0)
i_alb = save_img("SwornKit_Albedo", kit_alb)
i_mga = save_img("SwornKit_MetallicGlossAO", kit_mga, True)
i_nrm = save_img("SwornKit_Normal", nrm_arr, True)
nt = km.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
for kind, im in (("Albedo", i_alb), ("MGA", i_mga), ("Normal", i_nrm)):
    t = nt.nodes.new("ShaderNodeTexImage")
    t.image = im
    if kind == "Albedo":
        nt.links.new(t.outputs["Color"], bsdf.inputs["Base Color"])
    elif kind == "MGA":
        nt.links.new(t.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    else:
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(t.outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.55

# ---------------------------------------------------------------------------------------------------- skin + attach
for ob in (mask, helmet, tail):
    ob.data.materials.clear()
    ob.data.materials.append(km)
    ob.vertex_groups.clear()
for ob in (mask, helmet):
    ob.vertex_groups.new(name="B_HeadJ").add([v.index for v in ob.data.vertices], 1.0, "REPLACE")
gh = tail.vertex_groups.new(name="B_HeadJ")
gn = tail.vertex_groups.new(name="B_Neck01J")
gs = tail.vertex_groups.new(name="B_SpineTopJ")
z_hi, z_lo = T.z - 0.08, 1.66
for v in tail.data.vertices:
    zz = v.co.z
    f = min(max((zz - z_lo) / (z_hi - z_lo), 0.0), 1.0)
    f = f * f * (3 - 2 * f)
    mid = 4 * f * (1 - f) * 0.35
    rest = max(1 - f - mid, 0.0)
    if f > 0:
        gh.add([v.index], f, "REPLACE")
    if mid > 0:
        gn.add([v.index], mid, "REPLACE")
    if rest > 0:
        gs.add([v.index], rest, "REPLACE")
for ob in (mask, helmet, tail):
    P.attach_to_rig(ob, rig, Matrix.Identity(4))
rig.data.pose_position = "POSE"
bpy.context.view_layer.update()
P.purge_orphans()
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
