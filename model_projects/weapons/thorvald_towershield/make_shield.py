"""Build the House Thorvald tower shield (hand-modelled to the Elite reference sheet) and save it as a stand-alone weapon blend.

    blender -b --python make_shield.py -- [--shots]

Gurney's shield was tried first (candidates/): with its energy halo and its raised chevron / boss removed, what is left is a Y-shaped plate
with a hole and a goblet outline, nothing like the sheet's tall chamfered slab.  So the shape is built here (shapes in shield_shape.py, shared
with paint_shield.py) and textured by paint_shield.py.

v2 (layered, after "not enough detail"): bevelled outer rim; a second raised frame with the sheet's stepped outline; the emblem in relief
(dark disc, gear ring with a hole, star); a viewing slot cut right through with a raised frame; bolts along the rim and at the frame corners;
a grip and two strap bars on the back.  Bent across its width like a riot shield.

Weapon space (Gurney's convention, so the vanilla B_Shield placement applies): x across, z up, the FRONT faces -y, the hand at the origin.
Built in the converted FBX's WORLD frame, then baked -90 deg about x into the game mesh frame (the importer puts +90 deg on the object).
UVs: front faces planar on u 0..0.48, back faces on u 0.48..0.96 (mirrored), copper side walls on the column u 0.965..1 (v > 0.04), dark
walls (slot tunnel) at its bottom (v < 0.03).  textures/Shield_Albedo.png is used when it exists.

Output: Thorvald_TowerShield.blend with one object "Thorvald_TowerShield" at the origin.
"""
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import shield_shape as S  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
UV_W, UV_H = 0.30, 0.62
SU = 0.48 / (2 * UV_W)
FRONT, BACK, CU_WALL, DARK_WALL = 0, 1, 2, 3

bpy.ops.wm.read_factory_settings(use_empty=True)
bm = bmesh.new()
cat = bm.faces.layers.int.new("cat")


def ring(poly, y):
    return [bm.verts.new((x, y, z + S.Z0)) for x, z in poly]


def orient(f, hint, c):
    f.normal_update()
    if f.normal.dot(hint) < 0:
        f.normal_flip()
    f[cat] = c


def bridge(lo, hi, poly, side, c):
    """Quads between two rings built from the same polygon; side +1: the walls face away from the polygon's inside, -1: toward it,
    0: they face the front (-y)."""
    n = len(lo)
    cx = sum(p[0] for p in poly) / len(poly)
    cz = sum(p[1] for p in poly) / len(poly)
    for k in range(n):
        j = (k + 1) % n
        f = bm.faces.new((lo[k], lo[j], hi[j], hi[k]))
        if side == 0:
            hint = Vector((0, -1, 0))
        else:
            (x0, z0), (x1, z1) = poly[k], poly[j]
            # outward edge normal of a clockwise polygon (front view) = (-dz, dx)
            hint = Vector((-(z1 - z0), 0, (x1 - x0))) * side
        orient(f, hint, c)


def fan(loop, hint, c):
    cen = bm.verts.new(sum((v.co for v in loop), Vector()) / len(loop))
    for k in range(len(loop)):
        f = bm.faces.new((cen, loop[k], loop[(k + 1) % len(loop)]))
        orient(f, hint, c)


def fill_with_hole(outer, hole, hint, c):
    eg = lambda a_, b_: bm.edges.get((a_, b_)) or bm.edges.new((a_, b_))
    edges = [eg(outer[k], outer[(k + 1) % len(outer)]) for k in range(len(outer))]
    edges += [eg(hole[k], hole[(k + 1) % len(hole)]) for k in range(len(hole))]
    res = bmesh.ops.triangle_fill(bm, use_beauty=True, use_dissolve=False, edges=edges)
    hx = sum(v.co.x for v in hole) / len(hole)
    hz = sum(v.co.z for v in hole) / len(hole)
    hr = min(math.hypot(v.co.x - hx, v.co.z - hz) for v in hole)
    kill = []
    for f in [g for g in res["geom"] if isinstance(g, bmesh.types.BMFace)]:
        m = f.calc_center_median()
        # a face whose every vertex is on the hole loop and whose centre is inside the hole's bounding box is a hole face
        if all(v in hole for v in f.verts):
            xs = [v.co.x for v in hole]
            zs = [v.co.z for v in hole]
            if min(xs) < m.x < max(xs) and min(zs) < m.z < max(zs):
                kill.append(f)
                continue
        orient(f, hint, c)
    bmesh.ops.delete(bm, geom=kill, context="FACES_ONLY")
    return len(kill)


O = S.outline()
O1, O2, O3 = S.offset(O, 0.012), S.offset(O, S.RIM - 0.010), S.offset(O, S.RIM)
SO, SI = S.slot_outer(), S.slot_inner()
# --- body: back plate (slot hole), outer wall, bevelled rim, field (slot hole) ---
r_back = ring(O, S.Y_BACK)
r_edge = ring(O, S.Y_RIM_EDGE)
bridge(r_back, r_edge, O, +1, CU_WALL)
r_b1 = ring(O1, S.Y_RIM_TOP)
bridge(r_edge, r_b1, O, 0, FRONT)
r_b2 = ring(O2, S.Y_RIM_TOP)
bridge(r_b1, r_b2, O1, 0, FRONT)
r_f = ring(O3, S.Y_FIELD)
bridge(r_b2, r_f, O2, 0, FRONT)
si_back = ring(SI, S.Y_BACK)
k1 = fill_with_hole(r_back, si_back, Vector((0, 1, 0)), BACK)
so_field = ring(SO, S.Y_FIELD)
k2 = fill_with_hole(r_f, so_field, Vector((0, -1, 0)), FRONT)
# --- viewing slot: raised frame, tunnel through to the back ---
so_top = ring(SO, S.Y_FRAME)
bridge(so_field, so_top, SO, +1, CU_WALL)
si_top = ring(SI, S.Y_FRAME)
bridge(so_top, si_top, SO, 0, FRONT)
bridge(si_top, si_back, SI, -1, DARK_WALL)
# --- inner stepped frame (a raised ribbon on the field) ---
P, Pin = S.PANEL, S.offset(S.PANEL, S.FRAME_W)
p0, p1 = ring(P, S.Y_FIELD + 0.001), ring(P, S.Y_FRAME)
bridge(p0, p1, P, +1, CU_WALL)
q1, q0 = ring(Pin, S.Y_FRAME), ring(Pin, S.Y_FIELD + 0.001)
bridge(p1, q1, P, 0, FRONT)
bridge(q1, q0, Pin, -1, CU_WALL)
# --- emblem: dark disc, gear ring (with its hole), star ---
D = S.circle(S.EMBLEM_C, S.DISC_R, 40)
d0, d1 = ring(D, S.Y_FIELD + 0.001), ring(D, S.Y_DISC)
bridge(d0, d1, D, +1, CU_WALL)
fan(d1, Vector((0, -1, 0)), FRONT)
G, GH = S.gear(), S.circle(S.EMBLEM_C, S.GEAR_HOLE, len(S.gear()))
g0, g1 = ring(G, S.Y_DISC - 0.0005), ring(G, S.Y_GEAR)
bridge(g0, g1, G, +1, CU_WALL)
h1, h0 = ring(GH, S.Y_GEAR), ring(GH, S.Y_DISC - 0.0005)
bridge(g1, h1, G, 0, FRONT)
bridge(h1, h0, GH, -1, CU_WALL)
ST = S.star()
s0, s1 = ring(ST, S.Y_DISC - 0.0005), ring(ST, S.Y_STAR)
bridge(s0, s1, ST, +1, CU_WALL)
fan(s1, Vector((0, -1, 0)), FRONT)
# --- bolts: low octagonal domes on the rim top and on the frame corners ---
nb = 0
for x, z, where in S.bolts():
    yb = S.Y_RIM_TOP if where == "rim" else S.Y_FRAME
    B0 = S.circle((x, z), S.BOLT_R, 8)
    B1 = S.circle((x, z), S.BOLT_R * 0.6, 8)
    b0, b1 = ring(B0, yb + 0.001), ring(B1, yb - S.BOLT_H)
    bridge(b0, b1, B0, +1, CU_WALL)
    fan(b1, Vector((0, -1, 0)), FRONT)
    nb += 1
# --- back: grip at the hand, two strap bars ---
for (x0, x1, z0, z1, dy) in ((-0.022, 0.022, -0.075, 0.075, 0.045), (-0.14, 0.14, 0.17, 0.205, 0.022), (-0.14, 0.14, -0.30, -0.265, 0.022)):
    box = bmesh.ops.create_cube(bm, size=1.0)["verts"]
    for v in box:
        v.co = Vector((x0 + (v.co.x + 0.5) * (x1 - x0), S.Y_BACK + (v.co.y + 0.5) * dy, z0 + (v.co.z + 0.5) * (z1 - z0)))
    bf = {f for v in box for f in v.link_faces}
    bmesh.ops.recalc_face_normals(bm, faces=list(bf))
    for f in bf:
        f[cat] = BACK if f.normal.y > 0.5 else CU_WALL
# --- bend across the width ---
for k in range(-4, 5):
    bmesh.ops.bisect_plane(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:], dist=1e-5, plane_co=(k * 0.06, 0, 0), plane_no=(1, 0, 0))
for v in bm.verts:
    v.co.y += S.BEND * (v.co.x / S.W) ** 2
bm.normal_update()
# --- UVs ---
uvl = bm.loops.layers.uv.new("UVMap")
for f in bm.faces:
    c = f[cat]
    for lp in f.loops:
        x, z = lp.vert.co.x, lp.vert.co.z - S.Z0
        v = 0.5 + 0.5 * z / UV_H
        if c == FRONT:
            lp[uvl].uv = ((x + UV_W) * SU, v)
        elif c == BACK:
            lp[uvl].uv = (0.48 + (UV_W - x) * SU, v)
        elif c == CU_WALL:
            lp[uvl].uv = (0.9825, 0.05 + 0.9 * (0.5 + 0.5 * z / UV_H))
        else:
            lp[uvl].uv = (0.9825, 0.015)
me = bpy.data.meshes.new("Thorvald_TowerShield")
bm.to_mesh(me)
bm.free()
sh = bpy.data.objects.new("Thorvald_TowerShield", me)
bpy.context.collection.objects.link(sh)
for p in me.polygons:
    p.use_smooth = False
lo = [min(v.co[i] for v in me.vertices) for i in range(3)]
hi = [max(v.co[i] for v in me.vertices) for i in range(3)]
ntri = sum(len(p.vertices) - 2 for p in me.polygons)
print("SHIELD size %.3f x %.3f x %.3f m (x, depth, z), %d verts, %d tris, %d bolts, hole faces removed %d/%d"
      % (hi[0] - lo[0], hi[1] - lo[1], hi[2] - lo[2], len(me.vertices), ntri, nb, k1, k2))
# world frame -> game mesh frame
me.transform(Matrix.Rotation(math.radians(-90), 4, "X"))

alb = os.path.join(HERE, "textures", "Shield_Albedo.png")
mat = bpy.data.materials.new("Mat_TowerShield")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(nd for nd in nt.nodes if nd.type == "BSDF_PRINCIPLED")
if os.path.exists(alb):
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(alb, check_existing=False)
    tex.image.pack()
    nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bsdf.inputs["Metallic"].default_value = 0.35
bsdf.inputs["Roughness"].default_value = 0.55
me.materials.append(mat)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "Thorvald_TowerShield.blend"), compress=True)
print("SAVED Thorvald_TowerShield.blend", "with albedo" if os.path.exists(alb) else "(no albedo yet)")

if "--shots" in a:
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 1500, 1000
    w = bpy.data.worlds.new("W")
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.55, 0.58, 1)
    sc.world = w
    sun = bpy.data.objects.new("S", bpy.data.lights.new("S", "SUN"))
    sun.data.energy = 3.5
    sun.rotation_euler = (math.radians(55), 0, math.radians(-35))
    sc.collection.objects.link(sun)
    for o in bpy.data.objects:
        for m in getattr(o.data, "materials", []):
            m.use_backface_culling = True
    for k, rz in enumerate((0.0, 35.0, 180.0)):        # front, three-quarter, back
        ob = sh if k == 0 else sh.copy()
        if k:
            sc.collection.objects.link(ob)
        ob.rotation_euler = (math.radians(90), 0, math.radians(rz))
        ob.location = ((k - 1) * 0.8, 0, 0)
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = 2.5
    cam.location = (0, -4, S.Z0)
    cam.rotation_euler = (math.radians(90), 0, 0)
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = os.path.join(HERE, "preview_thorvald_towershield.png")
    bpy.ops.render.render(write_still=True)
    cam.data.ortho_scale = 0.75                            # close-up: emblem, slot, frame
    cam.location = (-0.8 + 0.0, -4, 0.20)
    sc.render.resolution_x, sc.render.resolution_y = 900, 900
    sh.rotation_euler = (math.radians(90), 0, math.radians(-20))
    cam.location = (0.0, -4, 0.22)
    sh.location = (0, 0, 0)
    for o in [o for o in bpy.data.objects if o.type == "MESH" and o is not sh]:
        o.hide_render = True
    sc.render.filepath = os.path.join(HERE, "preview_thorvald_towershield_detail.png")
    bpy.ops.render.render(write_still=True)
