"""Stage 1: turn model_inputs/ginaz_swordmaster.fbx (a 3-view turnaround sheet) into a
game-sized figure fitted to the Male01 rig's rest pose.

Run:  blender -b --factory-startup --python ginaz_stage1.py
Out:  model_work/ginaz_stage1.blend  (objects: ginaz_hi, ginaz_lo)

Steps: crop the front figure -> scale/align to the rig -> bend arms to the rig's 45 deg rest
pose -> paint regional vertex colors -> two-stage decimate (body, then head/hands) -> clean.
"""
import math, os
import bpy, bmesh
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
SRC = os.path.join(ROOT, "model_inputs", "ginaz_swordmaster.fbx")
OUT = os.path.join(HERE, "ginaz_stage1.blend")
HEIGHT = 1.88          # head top, to match the Male01 rig (HeadJ at z=1.771)
Y_SHIFT = 0.22         # centers the body on the rig's depth
ARM_BEND = math.radians(22.0)
TARGET_TRIS = 7000


def sstep(a, lo, hi):
    t = np.clip((a - lo) / (hi - lo), 0, 1)
    return t * t * (3 - 2 * t)


def get_co(me):
    co = np.empty(len(me.vertices) * 3, dtype=np.float32)
    me.vertices.foreach_get("co", co)
    return co.reshape(-1, 3).astype(np.float64)


def set_co(me, co):
    me.vertices.foreach_set("co", co.astype(np.float32).ravel())
    me.update()


def components(bm):
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        st, c = [v], []
        seen.add(v.index)
        while st:
            x = st.pop()
            c.append(x)
            for e in x.link_edges:
                w = e.other_vert(x)
                if w.index not in seen:
                    seen.add(w.index)
                    st.append(w)
        comps.append(c)
    comps.sort(key=len, reverse=True)
    return comps


# ---------------------------------------------------------------- 1. import + crop
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
sheet = next(o for o in bpy.data.objects if o.type == "MESH")
bm = bmesh.new()
bm.from_mesh(sheet.data)
# front figure = x < -0.03; drop the floor (z < -0.472) and ceiling (z > 0.46) slabs it touches
bmesh.ops.delete(bm, geom=[v for v in bm.verts if v.co.x > -0.03 or v.co.z < -0.472 or v.co.z > 0.46], context="VERTS")
bm.verts.ensure_lookup_table()
comps = components(bm)
bmesh.ops.delete(bm, geom=[v for c in comps[1:] for v in c], context="VERTS")
me = bpy.data.meshes.new("ginaz_hi")
bm.to_mesh(me)
bm.free()
hi = bpy.data.objects.new("ginaz_hi", me)
bpy.context.collection.objects.link(hi)
bpy.data.objects.remove(sheet, do_unlink=True)
print("front figure:", len(me.vertices), "verts", len(me.polygons), "tris")

# ---------------------------------------------------------------- 2. scale + align + arm bend
W = get_co(me)
mn, mx = W.min(0), W.max(0)
k = HEIGHT / (mx[2] - mn[2])
W = (W - np.array([(mn[0] + mx[0]) / 2, 0.0, mn[2]])) * k
W[:, 1] += Y_SHIFT
for s in (+1, -1):
    P = np.array([s * 0.31, 0.0, 1.52])               # shoulder pivot
    w = sstep(s * W[:, 0], 0.29, 0.36) * (1 - sstep(W[:, 2], 1.62, 1.82)) * sstep(W[:, 2], 0.78, 0.9)
    dx, dz = s * (W[:, 0] - P[0]), W[:, 2] - P[2]
    a = ARM_BEND * w
    xr = dx * np.cos(a) - dz * np.sin(a)
    zr = dx * np.sin(a) + dz * np.cos(a)
    m = w > 0
    W[m, 0] = s * xr[m] + P[0]
    W[m, 2] = zr[m] + P[2]
set_co(me, W)
for p in me.polygons:
    p.use_smooth = True
x, y, z = W[:, 0], W[:, 1], W[:, 2]
ax = np.abs(x)

# ---------------------------------------------------------------- 3. regional vertex colors
d = np.array([0.7071, -0.7071])
t_wrist = (ax - 0.625) * d[0] + (z - 1.163) * d[1]
t_elbow = (ax - 0.433) * d[0] + (z - 1.356) * d[1]
arm_zone = (ax > 0.36) & (z < 1.52) & (z > 0.85)
hand = arm_zone & (t_wrist > 0.0)
forearm = arm_zone & (t_wrist <= 0.0) & (t_elbow > 0.02)
upperarm = arm_zone & (t_elbow <= 0.02)
pauldron = ((z > 1.40) & (ax > 0.17) & (z < 1.78) & ~arm_zone) | ((z > 1.45) & (ax > 0.30) & (z < 1.75))
head = (z > 1.64) & (ax < 0.15)
hair = head & (z >= 1.78)
neck = (z > 1.60) & (z <= 1.70) & (ax < 0.10)
chest = (z > 1.18) & (z <= 1.64) & (ax < 0.24) & (y < 0.10) & ~arm_zone & ~pauldron
cape = ((y > 0.12) & (z < 1.62) & (z > 0.30)) | ((y > 0.05) & (z < 0.9) & (z > 0.3) & (ax > 0.2))
shin = (z > 0.20) & (z < 0.58) & (ax < 0.30) & (y < 0.06) & ~cape
thigh = (z >= 0.58) & (z < 1.18) & (ax < 0.30) & ~cape & ~arm_zone
boots = z <= 0.20
belt_zone = (z > 1.0) & (z < 1.2) & (ax < 0.25) & (y < 0.10)
belt = belt_zone & (z > 1.07) & (z < 1.16)
PAL = dict(skin=(0.60, 0.42, 0.33), hair=(0.07, 0.05, 0.04), suit=(0.075, 0.08, 0.095),
           armor=(0.246, 0.262, 0.295), armor2=(0.18, 0.19, 0.22), trim=(0.42, 0.33, 0.17),
           cape=(0.055, 0.060, 0.085), glove=(0.06, 0.055, 0.055), boot=(0.05, 0.045, 0.045))
n = len(me.vertices)
col = np.tile(np.array(PAL["suit"]), (n, 1))
for mask, key in ((thigh, "suit"), (upperarm, "suit"), (neck, "suit"), (chest, "armor"), (pauldron, "armor"),
                  (forearm, "armor"), (shin, "armor"), (belt_zone, "armor2"), (belt, "trim"), (cape, "cape"),
                  (boots, "boot"), (hand, "glove"), (head & ~hair, "skin"), (hair, "hair"),
                  (cape & (arm_zone | pauldron), "armor")):
    col[mask] = PAL[key]
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
nbrs = [[e.other_vert(v).index for e in v.link_edges] for v in bm.verts]
bm.free()
for _ in range(2):                                      # soften region borders
    new = col.copy()
    for i, nb in enumerate(nbrs):
        if nb:
            new[i] = 0.5 * col[i] + 0.5 * col[nb].mean(0)
    col = new
ca = me.color_attributes.new("Col", "FLOAT_COLOR", "POINT")
ca.data.foreach_set("color", np.concatenate([col, np.ones((n, 1))], axis=1).astype(np.float32).ravel())
me.color_attributes.active_color = ca

# ---------------------------------------------------------------- 4. two-stage decimate
hh = ((z > 1.62) & (ax < 0.16)) | ((ax > 0.36) & (z < 1.52) & (z > 0.85) & (t_wrist > -0.04))
lo = hi.copy()
lo.data = hi.data.copy()
lo.name = "ginaz_lo"
bpy.context.collection.objects.link(lo)
g_hh = lo.vertex_groups.new(name="hh")
g_hh.add([int(i) for i in np.where(hh)[0]], 1.0, "REPLACE")
g_body = lo.vertex_groups.new(name="body")
g_body.add([int(i) for i in np.where(~hh)[0]], 1.0, "REPLACE")


def decimate(group, target, name):
    m = lo.modifiers.new(name, "DECIMATE")
    m.decimate_type = "COLLAPSE"
    m.use_collapse_triangulate = True
    m.vertex_group = group
    m.invert_vertex_group = True            # in this Blender, the (inverted) group is the PROTECTED set
    m.ratio = target / len(lo.data.polygons)
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.modifier_apply(modifier=name)


decimate("hh", 9400, "DecBody")                      # shrink the body, head/hands untouched
decimate("body", TARGET_TRIS, "DecHeadHands")        # then thin head/hands, body untouched
for g in list(lo.vertex_groups):
    lo.vertex_groups.remove(g)

# ---------------------------------------------------------------- 5. clean
bm = bmesh.new()
bm.from_mesh(lo.data)
bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=1e-5)
bmesh.ops.holes_fill(bm, edges=[e for e in bm.edges if e.is_boundary], sides=0)
bmesh.ops.triangulate(bm, faces=bm.faces[:])
bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
print("lo: open edges", sum(1 for e in bm.edges if e.is_boundary), "non-manifold", sum(1 for e in bm.edges if not e.is_manifold))
bm.to_mesh(lo.data)
bm.free()
for p in lo.data.polygons:
    p.use_smooth = True
c = get_co(lo.data)
print("lo:", len(lo.data.vertices), "verts", len(lo.data.polygons), "tris | head",
      int(((c[:, 2] > 1.62) & (abs(c[:, 0]) < 0.16)).sum()), "hands", int(((abs(c[:, 0]) > 0.7) & (c[:, 2] < 1.2) & (c[:, 2] > 0.85)).sum()))
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("saved", OUT)
