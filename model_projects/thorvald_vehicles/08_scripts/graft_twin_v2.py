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
    for ax in (0.26, 0.35):
        prof = []
        for k in range(24):
            ay = -0.72 + k * 0.02
            z = top_at(bone, side * ax, ay)
            if z is not None:
                prof.append("y%+.2f:%.3f" % (ay, z))
        print("   MEASURE %s wing top profile |x| %.2f : %s" % (bone, ax, " ".join(prof)))
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

# ---- two cannons -------------------------------------------------------------------------------------------------------------------------
errs_all = []
for bone, w in wings.items():
    side = w["side"]
    R = rig.data.bones[bone].matrix_local.copy()
    P = rig.pose.bones[bone].matrix.copy()
    to_rest = R @ P.inverted()
    muzzle_y = w["ymin"] - 0.10                      # the muzzle stands a little past the leading edge
    at = Vector((side * XC, muzzle_y + length, w["top"] + half_h * 0.85))    # root of the cannon (rear), centre line height
    bm = bm0.copy()
    intended = []
    for v in bm.verts:
        p = Vector((v.co.x * side, v.co.y, v.co.z))  # the -x cannon is a mirror image
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
    print("CANNON %s side %+d at (%.3f %.3f %.3f)  wing top %.3f  visible z %.3f..%.3f  y %.3f..%.3f  max skin error %.6f" % (
        bone, side, at.x, at.y, at.z, w["top"], min(g.z for g in got), max(g.z for g in got), min(g.y for g in got), max(g.y for g in got), max(errs)))
bm0.free()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out, "max skin error", max(errs_all))
