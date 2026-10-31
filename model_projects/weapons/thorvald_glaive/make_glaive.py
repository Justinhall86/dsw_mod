"""Build the House Thorvald glaive: the Landsraad halberd's shaft, collar ring, socket and butt cap (game parts) with a hand-modelled curved
glaive blade and back hook (the Elite reference sheet), and a rust cloth grip wrap.  Saved as a stand-alone weapon blend.

    blender -b --python make_glaive.py -- [--shots]

Weapon space follows Gurney's javelin (GurneySet_Javelin), whose clips the Elite plays: shaft along z, head at -z, the hand at the origin,
blade flat in the xz plane (edge +x).  The halberd is turned 90 deg about z to match, its own spear blade deleted, and its length remapped
(collar + socket kept, the shaft shortened x0.68, butt kept) so the whole glaive is 2.25 m with the grip 1.40 m below the tip.

Texture (1024): the vanilla halberd albedo in the top-left quadrant (old UVs scaled into it; paint_glaive.py recolours brass -> copper and
the shaft black), the blade's planar projection in the top-right quadrant, the grip wrap in the bottom-right.  glaive_uv.json carries the
blade outline (edge side, back side) in UV space for the painter.
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
ZB, L = -0.745, 0.62                                  # blade base (z) and blade length; tip at ZB - L
WRAP = (-0.20, 0.16, 0.031)                           # grip wrap z0, z1, radius
BLADE_UV = dict(x0=-0.12, x1=0.20, z0=ZB - L - 0.01, z1=ZB + 0.01)   # planar frame of the blade -> top-right quadrant


def remap_z(z):
    if z <= -0.565:
        return z + 0.12                               # collar ring + socket: moved up 12 cm, unchanged
    if z < 1.063:
        return -0.445 + (z + 0.565) * 0.679          # shaft: 1.63 -> 1.105 m
    return z - 1.063 + 0.66                           # butt cap


bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(HERE, "source", "Landsraad_Halberd_TRUE_FBX.fbx"))
hb = max([o for o in bpy.data.objects if o.type == "MESH" and o.name.split(".")[0] != "Cube"], key=lambda o: len(o.data.vertices))
for o in list(bpy.data.objects):
    if o is not hb:
        bpy.data.objects.remove(o, do_unlink=True)
hb.name = hb.data.name = "Thorvald_Glaive"
hb.parent = None
hb.data.transform(hb.matrix_world)
hb.matrix_world.identity()

bm = bmesh.new()
bm.from_mesh(hb.data)
uvl = bm.loops.layers.uv.active
# islands: drop the spear blade (reaches below z -0.90) and its shoulder bits (stick out past the collar ring in y)
islands, seen = [], set()
for f0 in bm.faces:
    if f0 in seen:
        continue
    stack, comp = [f0], []
    seen.add(f0)
    while stack:
        f = stack.pop()
        comp.append(f)
        for e in f.edges:
            for g in e.link_faces:
                if g not in seen:
                    seen.add(g)
                    stack.append(g)
    islands.append(comp)
gone = []
for comp in islands:
    vs = {v for f in comp for v in f.verts}
    if min(v.co.z for v in vs) < -0.90 or min(v.co.y for v in vs) < -0.065 or max(v.co.y for v in vs) > 0.13:
        gone += comp
bmesh.ops.delete(bm, geom=gone, context="FACES")
print("GLAIVE halberd: removed %d blade faces, kept %d" % (len(gone), len(bm.faces)))
# halberd UVs -> top-left quadrant
for f in bm.faces:
    for lp in f.loops:
        u, v = lp[uvl].uv
        lp[uvl].uv = (u * 0.5, 0.5 + v * 0.5)
yc = 0.031                                            # the halberd's shaft axis sits at y 0.031: centre it on the axis
for v in bm.verts:
    v.co = Vector((v.co.x, v.co.y - yc, remap_z(v.co.z)))
    v.co = Matrix.Rotation(math.radians(90), 3, "Z") @ v.co      # blade plane (was yz) -> xz like the javelin
old_faces = set(bm.faces)


def uv_blade(x, z):
    return (0.5 + 0.5 * (x - BLADE_UV["x0"]) / (BLADE_UV["x1"] - BLADE_UV["x0"]), 0.5 + 0.5 * (z - BLADE_UV["z0"]) / (BLADE_UV["z1"] - BLADE_UV["z0"]))


# ---- blade outline (s along the blade from the base, w across: + edge side, - back side) ----
def ctr(s):
    return 0.06 * (s / L) ** 2                        # the blade sweeps toward its edge near the tip


def lerp_tab(tab, t):
    for (t0, v0), (t1, v1) in zip(tab, tab[1:]):
        if t <= t1:
            return v0 + (v1 - v0) * (t - t0) / (t1 - t0)
    return tab[-1][1]


EDGE = [(0.0, 0.030), (0.3, 0.058), (0.55, 0.074), (0.75, 0.068), (0.9, 0.042), (1.0, 0.0)]
BACK = [(0.0, 0.024), (0.5, 0.022), (0.8, 0.017), (0.93, 0.008), (1.0, 0.0)]
N = 16
edge_pts = [(L * i / N, ctr(L * i / N) + lerp_tab(EDGE, i / N)) for i in range(N + 1)]
back_line = lambda s: ctr(s) - lerp_tab(BACK, s / L)
TH = 0.007                                            # half thickness of the blade spine (the edge is a quarter of it)
# blade body: quad strips between the edge and back lines (front, back, edge wall, back wall), tip shared, base capped
P3 = lambda s, w, y: bm.verts.new((w, y, ZB - s))
Ef = [P3(s, w, -TH * 0.25) for s, w in edge_pts[:-1]]
Eb = [P3(s, w, TH * 0.25) for s, w in edge_pts[:-1]]
Bf = [P3(L * i / N, back_line(L * i / N), -TH) for i in range(N)]
Bb = [P3(L * i / N, back_line(L * i / N), TH) for i in range(N)]
Tf, Tb = P3(L, edge_pts[-1][1], -TH * 0.2), P3(L, edge_pts[-1][1], TH * 0.2)
Ef.append(Tf); Eb.append(Tb); Bf.append(Tf); Bb.append(Tb)
for i in range(N):
    j = i + 1
    for quad in ((Ef[i], Ef[j], Bf[j], Bf[i]), (Eb[i], Bb[i], Bb[j], Eb[j]), (Ef[i], Eb[i], Eb[j], Ef[j]), (Bf[i], Bf[j], Bb[j], Bb[i])):
        vs = list(dict.fromkeys(quad))               # the tip is shared: quads at the tip collapse to triangles
        if len(vs) >= 3:
            bm.faces.new(vs)
bm.faces.new((Ef[0], Bf[0], Bb[0], Eb[0]))
# back hook: a separate convex plate overlapping the blade's back by 5 mm.  From the notch on the back at s 0.22 L its inner edge rises to
# the hook tip (0.42 L, back - 0.085), pointing toward the blade tip; its outer edge curves back down onto the back at s 0.05 L
HOOK = [(0.05 * L, 0.005), (0.15 * L, -0.045), (0.28 * L, -0.075), (0.42 * L, -0.085), (0.22 * L, 0.005)]
hf = [P3(s, back_line(s) + w, -TH * 0.8) for s, w in HOOK]
hb_ = [P3(s, back_line(s) + w, TH * 0.8) for s, w in HOOK]
bm.faces.new(hf)
bm.faces.new(list(reversed(hb_)))
for k in range(len(HOOK)):
    k2 = (k + 1) % len(HOOK)
    bm.faces.new((hf[k], hf[k2], hb_[k2], hb_[k]))
contour = edge_pts + [(L * i / N, back_line(L * i / N)) for i in range(N - 1, -1, -1)]
contour_hook = [(s, back_line(s) + w) for s, w in HOOK]
blade_faces = [f for f in bm.faces if f not in old_faces]
bmesh.ops.triangulate(bm, faces=[f for f in blade_faces if len(f.verts) > 4])
blade_faces = [f for f in bm.faces if f not in old_faces]
for f in blade_faces:
    for lp in f.loops:
        lp[uvl].uv = uv_blade(lp.vert.co.x, lp.vert.co.z)

# ---- grip wrap: an open cylinder sleeve over the shaft ----
z0, z1, r = WRAP
segs, rows = 12, 6
ring = [[bm.verts.new((r * math.cos(2 * math.pi * k / segs), r * math.sin(2 * math.pi * k / segs), z0 + (z1 - z0) * j / rows))
         for k in range(segs)] for j in range(rows + 1)]
wrap_faces = []
for j in range(rows):
    for k in range(segs):
        k2 = (k + 1) % segs
        f = bm.faces.new((ring[j][k], ring[j][k2], ring[j + 1][k2], ring[j + 1][k]))
        wrap_faces.append(f)
        for lp, (kk, jj) in zip(f.loops, ((k, j), (k + 1, j), (k + 1, j + 1), (k, j + 1))):
            lp[uvl].uv = (0.5 + 0.5 * kk / segs, 0.02 + 0.46 * jj / rows)
bmesh.ops.recalc_face_normals(bm, faces=blade_faces + wrap_faces)
bm.normal_update()
for f in wrap_faces:                                  # outward
    c = f.calc_center_median()
    if f.normal.dot(Vector((c.x, c.y, 0.0))) < 0:
        f.normal_flip()
bm.to_mesh(hb.data)
bm.free()
me = hb.data
# built in the converted FBX's WORLD frame (head -z); the game mesh frame is that rotated -90 deg about x (the importer puts +90 deg on the
# object), so bake the inverse: mounted with the vanilla javelin rotation it then sits like Gurney's javelin
zs = [v.co.z for v in me.vertices]
me.transform(Matrix.Rotation(math.radians(-90), 4, "X"))
print("GLAIVE length %.3f m (tip z %.3f, butt z %.3f), %d verts, %d faces" % (max(zs) - min(zs), min(zs), max(zs), len(me.vertices), len(me.polygons)))
json.dump(dict(blade_uv=BLADE_UV, edge=[uv_blade(w, ZB - s) for s, w in edge_pts], tip=uv_blade(contour[N][1], ZB - contour[N][0]),
               contour=[uv_blade(w, ZB - s) for s, w in contour], hook=[uv_blade(w, ZB - s) for s, w in contour_hook], wrap=dict(u=(0.5, 1.0), v=(0.02, 0.48))),
          open(os.path.join(HERE, "glaive_uv.json"), "w"))

alb = os.path.join(HERE, "textures", "Glaive_Albedo.png")
mat = bpy.data.materials.new("Mat_Glaive")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(nd for nd in nt.nodes if nd.type == "BSDF_PRINCIPLED")
tex = nt.nodes.new("ShaderNodeTexImage")
tex.image = bpy.data.images.load(alb if os.path.exists(alb) else os.path.join(HERE, "textures", "Halberd.png"), check_existing=False)
tex.image.pack()
nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bsdf.inputs["Metallic"].default_value = 0.45
bsdf.inputs["Roughness"].default_value = 0.4
me.materials.clear()
me.materials.append(mat)
for p in me.polygons:
    p.use_smooth = False
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "Thorvald_Glaive.blend"), compress=True)
print("SAVED Thorvald_Glaive.blend", "with albedo" if os.path.exists(alb) else "(vanilla albedo)")

if "--shots" in a:
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 700, 1400
    w = bpy.data.worlds.new("W")
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.55, 0.58, 1)
    sc.world = w
    sun = bpy.data.objects.new("S", bpy.data.lights.new("S", "SUN"))
    sun.data.energy = 3.5
    sun.rotation_euler = (math.radians(55), 0, math.radians(-35))
    sc.collection.objects.link(sun)
    hb.rotation_euler = (math.radians(90), math.radians(180), 0)    # back to the world frame, blade up
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = 2.4
    cam.location = (0, -4, 0.28)
    cam.rotation_euler = (math.radians(90), 0, 0)
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = os.path.join(HERE, "preview_thorvald_glaive.png")
    bpy.ops.render.render(write_still=True)
    # close-up of the head
    cam.data.ortho_scale = 0.9
    cam.location = (0.03, -4, 1.05)
    sc.render.resolution_x = sc.render.resolution_y = 900
    sc.render.filepath = os.path.join(HERE, "preview_thorvald_glaive_head.png")
    bpy.ops.render.render(write_still=True)
