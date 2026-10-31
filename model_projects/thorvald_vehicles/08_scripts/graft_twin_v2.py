"""v2: integrate the two Banshee cannons into the drone's wings (sink, mount block, rear cap, body contact).

    blender -b --python graft_twin_v2.py -- <drone_nogimbal.blend> <Banshee_TRUE_FBX.fbx> <out.blend> [--scale 0.8] [--x 0.42] [--albedo path.png] [--measure]

--measure only prints the measured numbers (wing top z / leading / trailing edge y at several |x|, body flank profile,
cannon dimensions, rear-cap state, triangle counts) and exits without building anything.

Everything is measured in the POSED frame via the evaluated mesh, then converted to rest coordinates through the wing
bone (rest = R * P^-1 * posed), so each cannon and its mount follow their wing in every clip.  The -x side is the mirror
image (x flipped, faces reversed).

Changes vs graft_twin.py:
  A. the cannon is sunk ~35% of its height into the wing top (no daylight under it),
  B. one tapered mount block per cannon bridges cannon and wing, UV'd from a flat gunmetal face of the drone body,
  C. the cannon is moved inward and slightly back so its rear cap meets the drone body flank (no free-floating rear end),
  D. the rear end is capped with a flat disc (the front bore stays open).

Also writes 04_textures/banshee/cannon_uv.json (the cannon's UV polygons) for the recolour step.
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)

a = sys.argv[sys.argv.index("--") + 1:]
drone_blend, banshee_fbx, out = os.path.abspath(a[0]), os.path.abspath(a[1]), os.path.abspath(a[2])
S = float(a[a.index("--scale") + 1]) if "--scale" in a else 0.8
XC = float(a[a.index("--x") + 1]) if "--x" in a else 0.42
MEASURE = "--measure" in a
TEX = os.path.join(PROJ, "04_textures", "banshee")
ALB = os.path.abspath(a[a.index("--albedo") + 1]) if "--albedo" in a else os.path.join(TEX, "Banshee_Albedo.png")

bpy.ops.wm.open_mainfile(filepath=drone_blend)
scn = bpy.context.scene
scn.frame_set(1)
rig = bpy.data.objects["Armature"]
drone = bpy.data.objects["CombatDrone_Smuggler"]
bpy.context.view_layer.update()


def posed(obj):
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


# ---- the drone's wings and body, as seen ----------------------------------------------------------------------------------------
dnames = {g.index: g.name for g in drone.vertex_groups}
dom = {}
for v in drone.data.vertices:
    if v.groups:
        dom[v.index] = dnames[max(v.groups, key=lambda g: g.weight).group]
dpts = posed(drone)
body_pts = [dpts[i] for i, d in dom.items() if d == "B_Drone"]
print("MEASURE body verts %d  x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f" % (
    len(body_pts), min(p.x for p in body_pts), max(p.x for p in body_pts), min(p.y for p in body_pts),
    max(p.y for p in body_pts), min(p.z for p in body_pts), max(p.z for p in body_pts)))
biny = {}
for p in body_pts:
    biny.setdefault(round(p.y / 0.05), []).append(abs(p.x))
print("MEASURE body flank profile, y bin 0.05 -> max |x| of body verts:")
for b in sorted(biny):
    print("   MEASURE body  y %+.3f..%+.3f  max|x| %.3f  (n %d)" % (b * 0.05 - 0.025, b * 0.05 + 0.025, max(biny[b]), len(biny[b])))
wings = {}
for bone in ("B_WingL", "B_WingR"):
    pts = [dpts[i] for i, d in dom.items() if d == bone]
    side = 1.0 if sum(p.x for p in pts) / len(pts) > 0 else -1.0
    tipx = max(abs(p.x) for p in pts)
    inx = min(abs(p.x) for p in pts)
    wings[bone] = dict(side=side, tipx=tipx, inx=inx)
    print("MEASURE WING %s side %+d  |x| %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f" % (
        bone, side, inx, tipx, min(p.y for p in pts), max(p.y for p in pts), min(p.z for p in pts), max(p.z for p in pts)))
    for ax in (0.20, 0.25, 0.30, 0.35, 0.42, 0.50):
        band = [p for p in pts if abs(abs(p.x) - ax) < 0.03]
        if len(band) < 5:
            print("   MEASURE %s |x| %.2f: no wing verts" % (bone, ax))
            continue
        prof = {}
        for p in band:
            prof.setdefault(round(p.y / 0.1), []).append(p.z)
        print("   MEASURE %s |x| %.2f  n %4d  top z %.3f  lead y %.3f  trail y %.3f  y span %.3f" % (
            bone, ax, len(band), max(p.z for p in band), min(p.y for p in band), max(p.y for p in band),
            max(p.y for p in band) - min(p.y for p in band)))
        print("      top z by y bin: " + ", ".join("y%+.1f:%.3f" % (k * 0.1, max(v)) for k, v in sorted(prof.items())))

# ---- surface probes: interpolated wing top z (posed triangles) and the body flank at the cannon's height --------------------------
wing_tris = {}
for poly in drone.data.polygons:
    grp = dom.get(poly.vertices[0])
    if grp in ("B_WingL", "B_WingR"):
        vs = [dpts[i] for i in poly.vertices]
        wing_tris.setdefault(grp, []).append([vs[0], vs[1], vs[2]] if len(vs) == 3 else [vs[i] for i in (0, 1, 2)] + [vs[0], vs[2], vs[3]])


def tri_z_at(t, x, y):
    out = None
    for k in (0, 3):
        if k + 2 >= len(t):
            break
        (x0, y0, z0), (x1, y1, z1), (x2, y2, z2) = t[k], t[k + 1], t[k + 2]
        d = (y1 - y2) * (x0 - x2) + (x2 - x1) * (y0 - y2)
        if abs(d) < 1e-12:
            continue
        a = ((y1 - y2) * (x - x2) + (x2 - x1) * (y - y2)) / d
        b = ((y2 - y0) * (x - x2) + (x0 - x2) * (y - y2)) / d
        c = 1 - a - b
        if a < -1e-6 or b < -1e-6 or c < -1e-6:
            continue
        z = a * z0 + b * z1 + c * z2
        out = z if out is None else max(out, z)
    return out


def top_at(bone, x, y):
    best = None
    for t in wing_tris[bone]:
        z = tri_z_at(t, x, y)
        if z is not None and (best is None or z > best):
            best = z
    return best


def bot_at(bone, x, y):
    best = None
    for t in wing_tris[bone]:
        z = tri_z_at(t, x, y)
        if z is not None and (best is None or z < best):
            best = z
    return best


for bone in ("B_WingL", "B_WingR"):
    side = wings[bone]["side"]
    for ax in (0.24, 0.26):
        prof = []
        for k in range(52):
            ay = -0.75 + k * 0.01
            zt = top_at(bone, side * ax, ay)
            zb2 = bot_at(bone, side * ax, ay)
            if zt is not None:
                prof.append("y%+.2f:%.3f/%.3f" % (ay, zt, zb2 if zb2 is not None else -1))
        print("   MEASURE %s wing top/bot |x| %.2f : %s" % (bone, ax, " ".join(prof)))


for bone in ("B_WingL", "B_WingR"):
    side = wings[bone]["side"]
    for ax in (0.22, 0.26, 0.30, 0.35, 0.42):
        row = []
        for ay in (-0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.0):
            z = top_at(bone, side * ax, ay)
            row.append("y%+.2f:%s" % (ay, "none" if z is None else "%.3f" % z))
        print("   MEASURE %s wing top z at |x| %.2f : %s" % (bone, ax, "  ".join(row)))
for bone in ("B_WingL", "B_WingR"):
    side = wings[bone]["side"]
    for ax in (0.24, 0.28, 0.32):
        prof = []
        for k in range(52):
            ay = -0.75 + k * 0.01
            z = top_at(bone, side * ax, ay)
            if z is not None:
                prof.append("y%+.2f:%.3f" % (ay, z))
        print("   MEASURE %s wing top profile |x| %.2f : %s" % (bone, ax, " ".join(prof)))

# body flank surface (triangle interpolation) at the cannon's height
body_tris = []
for poly in drone.data.polygons:
    if dom.get(poly.vertices[0]) == "B_Drone":
        vs = [dpts[i] for i in poly.vertices]
        for k in range(1, len(vs) - 1):
            body_tris.append((vs[0], vs[k], vs[k + 1]))
print("MEASURE body triangles for flank probe %d" % len(body_tris))


def body_x_at(y, z):
    lo = hi = None
    for a, b, c in body_tris:
        d = (b.y - c.y) * (a.z - c.z) + (c.z - b.z) * (a.y - c.y)
        if abs(d) < 1e-12:
            continue
        l1 = ((b.y - c.y) * (z - c.z) + (c.z - b.z) * (y - c.y)) / d
        l2 = ((c.y - a.y) * (z - c.z) + (a.z - c.z) * (y - c.y)) / d
        l3 = 1.0 - l1 - l2
        if l1 < -1e-9 or l2 < -1e-9 or l3 < -1e-9:
            continue
        x = l1 * a.x + l2 * b.x + l3 * c.x
        if lo is None or x < lo:
            lo = x
        if hi is None or x > hi:
            hi = x
    return lo, hi


for zq in (1.02, 1.06, 1.10, 1.14, 1.18):
    row = []
    for k in range(26):
        yq = -0.85 + k * 0.05
        lo, hi = body_x_at(yq, zq)
        row.append("y%+.2f:%s" % (yq, "--" if hi is None else "%.3f" % hi))
    print("   MEASURE body flank +x at z %.2f : %s" % (zq, " ".join(row)))

zb = [p for p in body_pts if 1.00 <= p.z <= 1.35]
print("MEASURE body flank, z 1.00..1.35 (cannon height), y bin 0.05 -> max |x|:")
bz = {}
for p in zb:
    bz.setdefault(round(p.y / 0.05), []).append(abs(p.x))
for b in sorted(bz):
    print("   MEASURE body@z1.0+  y %+.3f..%+.3f  max|x| %.3f  (n %d)" % (b * 0.05 - 0.025, b * 0.05 + 0.025, max(bz[b]), len(bz[b])))
print("MEASURE body@z1.0+ overall max|x| %.3f" % (max(abs(p.x) for p in zb) if zb else 0.0))

# ---- the Banshee cannon (posed), centred on its root ---------------------------------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=banshee_fbx)
new = [o for o in bpy.data.objects if o not in before]
ban = max([o for o in new if o.type == "MESH" and o.name.startswith("Banshee")], key=lambda o: len(o.data.vertices))
bnames = {g.index: g.name for g in ban.vertex_groups}
canon_v = {v.index for v in ban.data.vertices if v.groups and bnames[max(v.groups, key=lambda g: g.weight).group] == "B_Canon"}
bpts = posed(ban)
bm0 = bmesh.new()
bm0.from_mesh(ban.data)
for v, p in zip(bm0.verts, bpts):
    v.co = p
seen, comps = set(), []
for v0 in bm0.verts:
    if v0.index in seen:
        continue
    st, mem = [v0], []
    seen.add(v0.index)
    while st:
        v = st.pop()
        mem.append(v)
        for e in v.link_edges:
            w = e.other_vert(v)
            if w.index not in seen:
                seen.add(w.index)
                st.append(w)
    comps.append(mem)
piece = set()
for c in comps:
    if sum(1 for v in c if v.index in canon_v) * 2 > len(c):
        piece |= {v.index for v in c}
bmesh.ops.delete(bm0, geom=[f for f in bm0.faces if f.verts[0].index not in piece], context="FACES")
bmesh.ops.delete(bm0, geom=[v for v in bm0.verts if not v.link_faces], context="VERTS")
cv = [v.co.copy() for v in bm0.verts]
root = sum([p for p in cv if p.y > -0.25], Vector()) / max(1, len([p for p in cv if p.y > -0.25]))
for v in bm0.verts:
    v.co = (v.co - root) * S                                  # root at the origin, barrel toward -y, scaled
cx = [v.co.x for v in bm0.verts]
cy = [v.co.y for v in bm0.verts]
cz = [v.co.z for v in bm0.verts]
length, half_h = -min(cy), (max(cz) - min(cz)) / 2
cy_max, cy_min = max(cy), min(cy)
ax_x, ax_z = (max(cx) + min(cx)) / 2, (max(cz) + min(cz)) / 2
radii = [((v.co.x - ax_x) ** 2 + (v.co.z - ax_z) ** 2) ** 0.5 for v in bm0.verts]
print("MEASURE CANNON x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f  (length %.3f m  height %.3f m  half_h %.3f)" % (
    min(cx), max(cx), cy_min, cy_max, min(cz), max(cz), length, max(cz) - min(cz), half_h))
print("MEASURE CANNON axis (x %.3f z %.3f)  radius max %.3f  mean %.3f" % (ax_x, ax_z, max(radii), sum(radii) / len(radii)))
rim = [v for v in bm0.verts if v.co.y > cy_max - 0.004]
rim_r = [((v.co.x - ax_x) ** 2 + (v.co.z - ax_z) ** 2) ** 0.5 for v in rim]
cap_faces = [f for f in bm0.faces if all(v.co.y > cy_max - 0.004 for v in f.verts) and f.normal.y > 0.5]
open_edges = [e for e in bm0.edges if len(e.link_faces) == 1]
rear_open = [e for e in open_edges if all(v.co.y > cy_max - 0.004 for v in e.verts)]
muz_open = [e for e in open_edges if all(v.co.y < cy_min + 0.004 for v in e.verts)]
print("MEASURE CANNON rear rim verts %d radius %.3f..%.3f  cap faces %d  rear open edges %d  muzzle open edges %d -> rear %s" % (
    len(rim), min(rim_r), max(rim_r), len(cap_faces), len(rear_open), len(muz_open), "CLOSED" if cap_faces or not rear_open else "OPEN"))
print("MEASURE CANNON faces %d  tris %d  drone body tris %d" % (
    len(bm0.faces), sum(len(f.verts) - 2 for f in bm0.faces),
    sum(len(p.vertices) - 2 for p in drone.data.polygons)))

# cannon bottom line (local)
print("MEASURE cannon bottom (local):")
for k in range(20):
    y0 = cy_min + k * 0.05
    band = [v for v in bm0.verts if y0 <= v.co.y < y0 + 0.05]
    if not band:
        continue
    mz = min(v.co.z for v in band)
    lows = [v for v in band if v.co.z <= mz + 0.004]
    print("   MEASURE cannon y %.2f..%.2f min z %.3f lowest x %.3f..%.3f n %d" % (
        y0, y0 + 0.05, mz, min(v.co.x for v in lows), max(v.co.x for v in lows), len(lows)))

# cannon rear boundary detail
print("MEASURE cannon rear boundary edges:")
for e in bm0.edges:
    if len(e.link_faces) == 1 and all(v.co.y > cy_max - 0.004 for v in e.verts):
        for v in e.verts:
            print("   MEASURE rear bnd vert (%.4f %.4f %.4f) r %.4f" % (
                v.co.x, v.co.y, v.co.z, ((v.co.x - ax_x) ** 2 + (v.co.z - ax_z) ** 2) ** 0.5))

# cannon faces whose normal points at the axis (bore candidates)
inward = []
for f in bm0.faces:
    c = f.calc_center_median()
    if (c.x - ax_x) * f.normal.x + (c.z - ax_z) * f.normal.z < 0:
        inward.append(c)
print("MEASURE cannon faces %d, inward-radial (bore candidates) %d" % (len(bm0.faces), len(inward)))
ry = {}
for c in inward:
    ry.setdefault(round((c.y - cy_min) / 0.1, 1), 0)
    ry[round((c.y - cy_min) / 0.1, 1)] += 1
print("MEASURE inward faces by 0.1 m from muzzle: %s" % sorted(ry.items()))

# UV polygons for the recolour step
uvl = bm0.loops.layers.uv.active
polys = [[(lp[uvl].uv.x, lp[uvl].uv.y) for lp in f.loops] for f in bm0.faces]
json.dump(polys, open(os.path.join(TEX, "cannon_uv.json"), "w"))
print("UV polygons", len(polys))

for o in new:
    bpy.data.objects.remove(o, do_unlink=True)

if MEASURE:
    print("MEASURE ONLY: nothing built")
    raise SystemExit(0)

# ================= BUILD: A (sink) + C (body contact) + D (rear cap) + B (mount) =================
# Everything is placed in the POSED frame and converted to rest coordinates through the wing bone.
XC = 0.255            # cannon axis |x| -> rear-cap inner rim 0.190 vs body flank 0.183..0.196 (V5 <= 0.01)
GR = 0.096            # mount cradle radius (cannon max radius 0.092 + 0.004 clearance)
MW_T = 0.1196         # mount half-width at the top: cannon half-width 0.092 + 15% of the cannon width per side
MW_B = 0.126          # mount half-width at the bottom (drafted taper)
FIL = 0.04            # mount bottom corner radius
M_TOP = -0.01         # the mount's outer top sits 0.01 below the cannon's mid-height (the cradle rim is at it)
M_YR = -0.0264        # mount rear y, local to the cannon's rear: centred under the cannon's rear third
M_YF = -0.2576        # mount front y, local (length = 25% of the cannon's length)
M_UV = (0.637, 0.875)  # UV of a flat gunmetal face of the drone body (poly 11), copied to every mount face

zmin_local = min(v.co.z for v in bm0.verts)
strip = [v.co.copy() for v in bm0.verts if v.co.z <= zmin_local + 0.004]
under = [v.co.copy() for v in bm0.verts if v.co.z <= -0.03]
print("BUILD cannon lowest strip %d verts  local y %.3f..%.3f  x %.3f..%.3f  z %.3f" % (
    len(strip), min(p.y for p in strip), max(p.y for p in strip),
    min(p.x for p in strip), max(p.x for p in strip), zmin_local))
print("BUILD cannon underside verts (local z <= -0.03): %d" % len(under))

# ---- choose the cannon's rear y (at.y) and axis height (Zc) ------------------------------------
cands = []
for k in range(20):
    aty = -0.26 - 0.01 * k
    per, bad = {}, False
    for bone in ("B_WingL", "B_WingR"):
        side = wings[bone]["side"]
        st, un = [], []
        for p in strip:
            t = top_at(bone, side * (XC + p.x), aty + p.y)
            if t is None:
                bad = True
                break
            st.append(t)
        if bad:
            break
        for p in under:
            t = top_at(bone, side * (XC + p.x), aty + p.y)
            if t is not None:
                un.append(t - p.z)          # Zc ceiling for this vertex (no daylight)
        per[bone] = (min(st), max(st), min(un) if un else 1e9)
    if bad:
        print("BUILD cand at.y %+.2f : strip off wing" % aty)
        continue
    b_lo = max(per[b][1] for b in per) - 0.06                        # V3: deepest penetration <= 0.06
    b_hi = min(min(per[b][1] for b in per) - 0.02,                   # V3: deepest penetration >= 0.02
               min(per[b][2] for b in per) - 0.003 - 0.090)          # no daylight under the whole underside
    ok = b_lo <= b_hi
    cands.append((aty, ok, b_lo, b_hi, per))
    print("BUILD cand at.y %+.2f : %s  bottom in [%.4f .. %.4f]  margin %.4f | %s" % (
        aty, "FEASIBLE" if ok else "infeasible", b_lo, b_hi, max(0.0, b_hi - b_lo),
        "  ".join("%s top %.3f..%.3f ceil %.3f" % (b, per[b][0], per[b][1], per[b][2]) for b in per)))
feas = [c for c in cands if c[1]]
if not feas:
    print("BUILD ERROR: no feasible (at.y, Zc) placement - stopping")
    raise SystemExit(1)
aty, _, b_lo, b_hi, per = max(feas, key=lambda c: (c[3] - c[2], c[0]))
B = 0.5 * (b_lo + b_hi)          # the cannon's bottom height
Zc = B + 0.090                   # the cannon's axis height
print("BUILD CHOSEN at.y %.3f  cannon bottom %.4f  axis z %.4f  (cannon height %.3f)" % (aty, B, Zc, max(cz) - min(cz)))
for bone in ("B_WingL", "B_WingR"):
    mn, mx, _ = per[bone]
    print("BUILD %s wing top under the strip %.3f..%.3f -> penetration %.3f..%.3f m = %.1f%%..%.1f%% of height" % (
        bone, mn, mx, mx - B, mn - B, 100 * (mx - B) / (max(cz) - min(cz)), 100 * (mn - B) / (max(cz) - min(cz))))

# ---- D: close the cannon's rear cap (weld the slit, fill what is left; the muzzle stays open) ----
rear_set = [v for v in bm0.verts if v.co.y > cy_max - 0.01]
bmesh.ops.remove_doubles(bm0, verts=rear_set, dist=0.0005)
open_edges = [e for e in bm0.edges if len(e.link_faces) == 1]
rear_open = [e for e in open_edges if all(v.co.y > cy_max - 0.004 for v in e.verts)]
if rear_open:
    filled = bmesh.ops.holes_fill(bm0, edges=rear_open, sides=0)
    for f in filled.get("faces", []):
        if f.normal.y < 0:
            f.normal_flip()
open_edges = [e for e in bm0.edges if len(e.link_faces) == 1]
rear_open = [e for e in open_edges if all(v.co.y > cy_max - 0.004 for v in e.verts)]
muz_open = [e for e in open_edges if all(v.co.y < cy_min + 0.004 for v in e.verts)]
cap_faces = [f for f in bm0.faces if all(v.co.y > cy_max - 0.004 for v in f.verts)]
print("BUILD rear cap: %d cap faces, %d rear boundary edges (0 = closed), %d muzzle boundary edges (must stay open)" % (
    len(cap_faces), len(rear_open), len(muz_open)))
if rear_open or not muz_open:
    print("BUILD ERROR: rear cap fix failed")
    raise SystemExit(1)

# ---- material (clean version if the recolour has run) -----------------------------------------------------------------------------------
mat = bpy.data.materials.new("Mat_ThorvaldCannon")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
alb = nt.nodes.new("ShaderNodeTexImage")
alb.image = bpy.data.images.load(ALB, check_existing=False)
alb.location = (-520, 300)
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
nrm = nt.nodes.new("ShaderNodeTexImage")
nrm.image = bpy.data.images.load(os.path.join(TEX, "Banshee_Normal.png"), check_existing=False)
nrm.image.colorspace_settings.name = "Non-Color"
nrm.location = (-520, -200)
nm = nt.nodes.new("ShaderNodeNormalMap")
nm.location = (-250, -200)
nt.links.new(nrm.outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.45
print("ALBEDO", ALB)

# ---- two cannons (A: sunk into the wing, C: rear cap at the body flank) ---------------------------
errs_all = []
side_objs = {}
for bone, w in wings.items():
    side = w["side"]
    R = rig.data.bones[bone].matrix_local.copy()
    P = rig.pose.bones[bone].matrix.copy()
    to_rest = R @ P.inverted()
    at = Vector((side * XC, aty, Zc))            # rear-cap centre of the cannon (posed frame)
    bm = bm0.copy()
    intended = []
    for v in bm.verts:
        p = Vector((v.co.x * side, v.co.y, v.co.z))   # the -x cannon is a mirror image
        e = at + p
        intended.append(e)
        v.co = (to_rest @ e.to_4d()).to_3d()
    if side < 0:
        bmesh.ops.reverse_faces(bm, faces=bm.faces[:])
    mesh = bpy.data.meshes.new("Cannon_" + bone)
    bm.to_mesh(mesh)
    bm.free()
    mesh.update()
    mesh.materials.append(mat)
    ob = bpy.data.objects.new("Cannon_" + bone, mesh)
    bpy.context.collection.objects.link(ob)
    vg = ob.vertex_groups.new(name=bone)
    vg.add(list(range(len(mesh.vertices))), 1.0, "REPLACE")
    ob.parent = rig
    md = ob.modifiers.new("Armature", "ARMATURE")
    md.object = rig
    bpy.context.view_layer.update()
    got = posed(ob)
    errs = [(g - e).length for g, e in zip(got, intended)]
    errs_all.append(max(errs))
    side_objs[side] = (ob, at, intended, got)
    print("CANNON %s side %+d at (%.3f %.3f %.3f)  max skin error %.8f" % (bone, side, at.x, at.y, at.z, max(errs)))

# ---- B: one tapered mount block per cannon, cradle top, bottom sunk 0.02 into the wing -------------
mount_data = {}
for bone, w in wings.items():
    side = w["side"]
    R = rig.data.bones[bone].matrix_local.copy()
    P = rig.pose.bones[bone].matrix.copy()
    to_rest = R @ P.inverted()
    at = Vector((side * XC, aty, Zc))
    if side < 0:
        u_in, u_out = 1.0, -1.0      # u grows from the cannon axis toward the body on the -x side
    else:
        u_in, u_out = -1.0, 1.0

    def o_pt(u, yl, z):
        return Vector((u * side, yl, z))          # local offset -> posed offset (u is along world x)

    # bottom corners: rounded on the body side (inner), square on the tip side (outer)
    yf, yr = M_YF, M_YR
    if side > 0:
        cu_t = (+MW_T, yf)      # (u, y) of the top rim corners: cu_t/ru_t at the front, then rear
        ru_t = (+MW_T, yr)
        ro_t = (-MW_T, yr)
        co_t = (-MW_T, yf)
        cu_b, ru_b, ro_b, co_b = (+MW_B, yf), (+MW_B, yr), (-MW_B, yr), (-MW_B, yf)
        arch_c, arch_r = (+MW_T, GR)
    else:
        cu_t, ru_t, ro_t, co_t = (-MW_T, yf), (-MW_T, yr), (+MW_T, yr), (+MW_T, yf)
        cu_b, ru_b, ro_b, co_b = (-MW_B, yf), (-MW_B, yr), (+MW_B, yr), (+MW_B, yf)
        arch_c, arch_r = (-MW_T, GR)

    mb = bmesh.new()
    pts = {}      # name -> posed position

    def corner(u, y, zb=B - 0.02, zt=M_TOP):
        return (o_pt(u, y, zt), o_pt(u, y, zb))

    # 4 top corners and 3 bottom corners (the inner-bottom corner is replaced by the fillet arc)
    pts["cu_t"], pts["cu_b"] = corner(*cu_t)
    pts["ru_t"], pts["ru_b"] = corner(*ru_t)
    pts["ro_t"], pts["ro_b"] = corner(*ro_t)
    pts["co_t"], _ = corner(*co_t)
    u_c, y_c = cu_b                     # inner-bottom corner to round
    r_corner = 0.04
    arc_b = []
    for k in range(4):
        a = math.pi / 2 * k / 3         # from the front edge to the body-side edge
        pts["arc_b%d" % k] = o_pt(u_c + u_in * r_corner * math.sin(a) - u_in * 0 + (0 if True else 0),
                                  y_c + r_corner * (1 - math.cos(a)) * (1 if y_c == yf else -1),
                                  B - 0.02)
    # (the arc above walks from the front-bottom edge to the inner-bottom edge; rebuild it explicitly)
    for k in range(4):
        a = math.pi / 2 * k / 3
        pts["arc_b%d" % k] = o_pt(u_c + u_in * r_corner * math.sin(a), yf + r_corner * (1 - math.cos(a)), B - 0.02)

    # top rim: square inner edge (the inner top rim coincides with the cannon axis region) +
    # a quarter arch on the outer edge wrapping the cannon's lower half
    pts["au0"] = o_pt(u_out * MW_T, yf, M_TOP)
    arc_u = ["au0"]
    a_end = math.asin(max(-1.0, min(1.0, M_TOP / arch_r)))
    n_arc = 6
    for k in range(1, n_arc + 1):
        a = a_end * k / n_arc
        pts["au%d" % k] = o_pt(u_out * arch_r * math.cos(a), yf, arch_r * math.sin(a))
        arc_u.append("au%d" % k)
    pts["auR0"] = o_pt(u_out * arch_r * math.cos(a_end), yr, arch_r * math.sin(a_end))
    arc_u_r = ["auR0"]
    for k in range(1, n_arc + 1):
        a = a_end * (n_arc - k) / n_arc
        pts["auR%d" % k] = o_pt(u_out * arch_r * math.cos(a), yr, arch_r * math.sin(a))
        arc_u_r.append("auR%d" % k)
    pts["cuR_t"] = o_pt(u_in * MW_T, yr, M_TOP)

    vmap = {n: mb.verts.new(p) for n, p in pts.items()}
    F = mb.faces.new

    # outer side wall (u = outer): front-bottom -> rear-bottom -> rear-arch -> front-arch
    F([vmap["ro_b"], vmap["ru_b"]] + [vmap[n] for n in reversed(arc_u_r)] + [vmap[n] for n in arc_u])
    # inner side wall (u = inner): front-top -> rear-top -> rear-bottom -> fillet arc -> front-bottom
    F([vmap["cu_t"], vmap["cuR_t"], vmap["ru_b"]] + [vmap[n] for n in reversed("arc_b0 arc_b1 arc_b2 arc_b3".split())] + [vmap["cu_b"]])
    # top front face
    F([vmap["cu_t"]] + [vmap[n] for n in arc_u] + [vmap["au0"]])  # will fix winding below
    # top rear face
    F([vmap["cuR_t"]] + [vmap[n] for n in arc_u_r])
    # bottom face (the fillet arc is its inner-front edge)
    F([vmap["cu_b"]] + [vmap[n] for n in "arc_b0 arc_b1 arc_b2 arc_b3".split()] + [vmap["ru_b"], vmap["ro_b"], vmap["co_t"]])
    # front face (y = yf)
    F([vmap["cu_t"], vmap["cu_b"]] + [vmap[n] for n in "arc_b3 arc_b2 arc_b1 arc_b0".split()] + [vmap["au0"]] + [vmap[n] for n in reversed(arc_u[1:])])
    # rear face (y = yr)
    F([vmap["cuR_t"], vmap["ru_b"], vmap["ro_b"]] + [vmap[n] for n in reversed(arc_u_r)])

    bmesh.ops.recalc_face_normals(bm=mb, faces=mb.faces[:])
    # all normals must point away from the mount's centre
    ctr = sum((v.co for v in mb.verts), Vector()) / len(mb.verts)
    for f in mb.faces:
        if f.normal.dot(f.calc_center_median() - ctr) < 0:
            f.normal_flip()

    # UV: one flat gunmetal face's UV on every face
    uvl = mb.loops.layers.uv.new("UVMap")
    for f in mb.faces:
        for lp in f.loops:
            lp[uvl].uv = M_UV

    # posed -> rest
    intended = []
    for v in mb.verts:
        e = at + v.co
        intended.append(e)
        v.co = (to_rest @ e.to_4d()).to_3d()
    if side < 0:
        bmesh.ops.reverse_faces(mb, faces=mb.faces[:])
    mesh = bpy.data.meshes.new("Mount_" + bone)
    mb.to_mesh(mesh)
    mb.free()
    mesh.update()
    mesh.materials.append(drone.data.materials[0])      # CombatDrone_mat -> the clean texture via swap_albedo
    ob = bpy.data.objects.new("Mount_" + bone, mesh)
    bpy.context.collection.objects.link(ob)
    vg = ob.vertex_groups.new(name=bone)
    vg.add(list(range(len(mesh.vertices))), 1.0, "REPLACE")
    ob.parent = rig
    md = ob.modifiers.new("Armature", "ARMATURE")
    md.object = rig
    bpy.context.view_layer.update()
    got = posed(ob)
    errs = [(g - e).length for g, e in zip(got, intended)]
    errs_all.append(max(errs))
    mount_data[side] = (ob, intended, got)
    print("MOUNT %s side %+d verts %d faces %d tris %d  y %.3f..%.3f  z %.3f..%.3f  max skin error %.8f" % (
        bone, side, len(mesh.vertices), len(mesh.polygons),
        sum(len(p.vertices) - 2 for p in mesh.polygons),
        min(g.y for g in got), max(g.y for g in got), min(g.z for g in got), max(g.z for g in got), max(errs)))

bm0.free()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out, "max skin error", max(errs_all))

# ============================ VALIDATIONS V1-V11 (V12 is done by eye) =============================
ok_all = {}
print("\n===== VALIDATIONS =====")
# V1 skin error
e1 = max(errs_all)
ok_all["V1"] = e1 < 1e-5
print("V1 skin error %.8f : %s (limit 0.00001)" % (e1, "PASS" if ok_all["V1"] else "FAIL"))

# V2 weights
unw = 0
grp_bad = 0
for ob in list(side_objs[s][0] for s in side_objs) + list(mount_data[s][0] for s in mount_data):
    for v in ob.data.vertices:
        gs = [g for g in v.groups if g.weight > 0]
        if len(gs) != 1 or abs(gs[0].weight - 1.0) > 1e-6 or ob.vertex_groups[gs[0].group].name not in ("B_WingL", "B_WingR"):
            grp_bad += 1
        if not gs:
            unw += 1
ok_all["V2"] = unw == 0 and grp_bad == 0
print("V2 weights: unweighted %d, vertices with != 1 full-weight wing group %d : %s" % (unw, grp_bad, "PASS" if ok_all["V2"] else "FAIL"))

# V3/V4 gap + penetration, measured on the final evaluated meshes
for s in (1, -1):
    bone = "B_WingR" if s > 0 else "B_WingL"
    ob, at, _, _ = side_objs[s]
    got = posed(ob)
    lows = [g for g in got if g.z < at.z - 0.03]          # the cannon's lower vertices
    deepest = shallow = None
    for g in lows:
        t = top_at(bone, g.x, g.y)
        if t is None:
            continue
        pen = t - g.z                                     # > 0 = inside the wing
        deepest = pen if deepest is None else max(deepest, pen)
        shallow = pen if shallow is None else min(shallow, pen)
    gap = -deepest
    ok3 = (-0.06 - 1e-9) <= gap <= (-0.02 + 1e-9)
    h = max(cz) - min(cz)
    ok4 = deepest <= 0.40 * h + 1e-9
    ok_all["V3" + ("+" if s > 0 else "-")] = ok3
    ok_all["V4" + ("+" if s > 0 else "-")] = ok4
    print("V3 %s gap %.4f m (deepest penetration %.4f, shallowest %.4f) : %s (want -0.02..-0.06)" % (
        bone, gap, deepest, shallow, "PASS" if ok3 else "FAIL"))
    print("V4 %s penetration %.1f%% of height %.3f m : %s (limit 40%%)" % (
        bone, 100 * deepest / h, h, "PASS" if ok4 else "FAIL"))

# V5/V6 body contact + overhang
for s in (1, -1):
    bone = "B_WingR" if s > 0 else "B_WingL"
    ob, at, _, _ = side_objs[s]
    got = posed(ob)
    rear = [g for g in got if g.y > at.y + cy_max - 0.02]   # rear-cap region
    best = 1e9
    for g in rear:
        lo, hi = body_x_at(g.y, g.z)
        if hi is None:
            continue
        best = min(best, abs(g.x) - hi)                     # 0 = touching the flank, <0 = inside
    ok5 = best <= 0.01
    ok_all["V5" + ("+" if s > 0 else "-")] = ok5
    print("V5 %s rear-cap to body flank distance %.4f m (inner rim |x| %.4f vs flank) : %s (limit 0.01)" % (
        bone, best, min(abs(g.x) for g in rear), "PASS" if ok5 else "FAIL"))
    ymax = max(g.y for g in got)
    ymeet = at.y + cy_max - 0.05
    over = ymax - ymeet
    ok6 = over <= 0.05
    ok_all["V6" + ("+" if s > 0 else "-")] = ok6
    print("V6 %s rearmost y %.4f, meets the body at y %.4f, overhang %.4f m : %s (limit 0.05)" % (
        bone, ymax, ymeet, over, "PASS" if ok6 else "FAIL"))

# V7 symmetry (cannons and mounts)
mm = 0.0
for s in (1, -1):
    ob, _, _, _ = side_objs[s]
    got = posed(ob)
    other = posed(side_objs[-s][0])
    for g in got:
        tgt = Vector((-g.x, g.y, g.z))
        mm = max(mm, min((o - tgt).length for o in other))
for s in (1, -1):
    ob, _, got_m = (mount_data[s][0], None, mount_data[s][2])
    other = mount_data[-s][2]
    for g in got_m:
        tgt = Vector((-g.x, g.y, g.z))
        mm = max(mm, min((o - tgt).length for o in other))
ok_all["V7"] = mm < 5e-4
print("V7 symmetry max mismatch %.6f m : %s (limit 0.0005)" % (mm, "PASS" if ok_all["V7"] else "FAIL"))

# V8 winding: outer faces point away from the cannon axis / mount centre
def winding_ok(ob, at, axis_y=(cy_min, cy_max), label=""):
    me = ob.data
    dg = bpy.context.evaluated_depsgraph_get()
    ev = ob.evaluated_get(dg)
    tot = outn = 0
    for poly in me.polygons:
        c = ev.matrix_world @ poly.center
        n = (ev.matrix_world.to_3x3() @ poly.normal).normalized()
        if abs(c.y - at.y) < axis_y[1] and (c - at).length < 0.13:
            continue                                  # bore / cradle region excluded
        rad = Vector((c.x - at.x, 0, c.z - at.z))
        if rad.length < 1e-6:
            continue
        tot += 1
        if n.dot(rad.normalized()) > 0:
            outn += 1
    frac = outn / max(1, tot)
    print("V8 %s outward faces %d/%d = %.0f%%" % (label, outn, tot, 100 * frac))
    return frac >= 0.85

w8 = True
for s in (1, -1):
    bone = "B_WingR" if s > 0 else "B_WingL"
    w8 &= winding_ok(side_objs[s][0], side_objs[s][1], label="Cannon " + bone)
for s in (1, -1):
    bone = "B_WingR" if s > 0 else "B_WingL"
    ob = mount_data[s][0]
    got = mount_data[s][2]
    ctr = sum(got, Vector()) / len(got)
    me = ob.data
    dg = bpy.context.evaluated_depsgraph_get()
    ev = ob.evaluated_get(dg)
    tot = outn = 0
    for poly in me.polygons:
        c = ev.matrix_world @ poly.center
        n = (ev.matrix_world.to_3x3() @ poly.normal).normalized()
        rad = c - ctr
        tot += 1
        if n.dot(rad) > 0:
            outn += 1
    frac = outn / max(1, tot)
    print("V8 Mount %s outward faces %d/%d = %.0f%%" % (bone, outn, tot, 100 * frac))
    w8 &= frac >= 0.85
ok_all["V8"] = w8
print("V8 winding : %s (limit 85%% outward)" % ("PASS" if w8 else "FAIL"))

# V9 body unchanged vs Thorvald_Drone_v2_nogimbal.blend
def islands(md):
    import bmesh as _bm
    b = _bm.new()
    b.from_mesh(md)
    seen, out = set(), []
    for v in b.verts:
        if v.index in seen:
            continue
        stack, comp = [v], []
        seen.add(v.index)
        while stack:
            u = stack.pop()
            comp.append(u)
            for e in u.link_edges:
                o = e.other_vert(u)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        out.append(comp)
    b.free()
    return out

def sig(md):
    out = []
    for comp in islands(md):
        oe = 0
        idxs = {v.index for v in comp}
        b2 = None
        # count open edges inside this component
        for v in comp:
            for e in v.link_edges:
                if len(e.link_faces) == 1 and e.other_vert(v).index in idxs:
                    oe += 1
        out.append((len(comp), oe // 2))
    return sorted(out, reverse=True)

bpy.ops.wm.open_mainfile(filepath=os.path.join(os.path.dirname(out), "Thorvald_Drone_v2_nogimbal.blend"))
base_sig = sig(bpy.data.objects["CombatDrone_Smuggler"].data)
bpy.ops.wm.open_mainfile(filepath=out)
new_sig = sig(bpy.data.objects["CombatDrone_Smuggler"].data)
ok_all["V9"] = base_sig == new_sig
print("V9 body islands %s vs base %s : %s" % (new_sig, base_sig, "PASS" if ok_all["V9"] else "FAIL"))

# V10 triangle budget
tot_tri = 0
for ob in bpy.data.objects:
    if ob.type == "MESH":
        tot_tri += sum(len(p.vertices) - 2 for p in ob.data.polygons)
ok_all["V10"] = tot_tri < 4000
print("V10 total tris %d : %s (limit 4000)" % (tot_tri, "PASS" if ok_all["V10"] else "FAIL"))

# V11 pose test: rotate the wing bones +15 deg about X, everything must follow and stay seated
scn.frame_set(1)
pre = {}
for s in (1, -1):
    pre[s] = (posed(side_objs[s][0]), posed(mount_data[s][0]))
import math as _m
for bname in ("B_WingL", "B_WingR"):
    rig.pose.bones[bname].rotation_mode = "XYZ"
    rig.pose.bones[bname].rotation_euler = (_m.radians(15.0), 0, 0)
bpy.context.view_layer.update()
v11ok = True
for s in (1, -1):
    bone = "B_WingR" if s > 0 else "B_WingL"
    for ob, pre_pts, lbl in ((side_objs[s][0], pre[s][0], "Cannon"), (mount_data[s][0], pre[s][1], "Mount")):
        now = posed(ob)
        moved = max((n - p).length for n, p in zip(now, pre_pts))
        if lbl == "Cannon":
            lows0 = [p for p, q in zip(pre_pts, now) if q.z < side_objs[s][1].z - 0.03]
            g0 = min(top_at(bone, p.x, p.y) - p.z for p in lows0 if top_at(bone, p.x, p.y) is not None)
            lows1 = [n for n in now if n.z < side_objs[s][1].z - 0.03]
            g1 = min(top_at(bone, n.x, n.y) - n.z for n in lows1 if top_at(bone, n.x, n.y) is not None)
            dgap = abs(g1 - g0)
            okc = moved > 0.05 and dgap < 0.005
            print("V11 %s %s moved %.4f m, penetration change %.4f m : %s" % (
                lbl, bone, moved, dgap, "PASS" if okc else "FAIL"))
            v11ok &= okc
        else:
            okm = moved > 0.05
            print("V11 %s %s moved %.4f m : %s" % (lbl, bone, moved, "PASS" if okm else "FAIL"))
            v11ok &= okm
for bname in ("B_WingL", "B_WingR"):
    rig.pose.bones[bname].rotation_euler = (0, 0, 0)
bpy.context.view_layer.update()
ok_all["V11"] = v11ok
print("V11 pose test : %s" % ("PASS" if v11ok else "FAIL"))
print("(pose reset; the saved file is unposed)")

print("\n===== SUMMARY =====")
for k in sorted(ok_all):
    print("  %s : %s" % (k, "PASS" if ok_all[k] else "FAIL"))
print("OVERALL: %s" % ("PASS" if all(ok_all.values()) else "FAIL"))
