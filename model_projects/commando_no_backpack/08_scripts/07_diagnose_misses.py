"""Step 07 - diagnose the two ray misses at x=0.20, z=1.25..1.30.

Question: is that a hole created by removing the backpack, or the natural gap
between the torso and the arm (which exists in the original model too)?

Method: compare the SAME probe grid on three meshes
  A  original (backpack on)
  B  backpack removed
  C  backpack removed AND the torso component alone
and report where the back-facing surface is in each.  Also render a zoomed
close-up of the region.

  blender -b --python 08_scripts/07_diagnose_misses.py
"""
import math
import os

import bpy
import bmesh
import numpy as np
from mathutils import Vector
from mathutils.bvhtree import BVHTree

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "04_no_backpack")
BACKPACK = [4, 5, 6, 7, 41, 42, 43, 44]


def load():
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=SRC)
    m = bpy.data.objects["Commando"]
    for n in ("Cube", "Camera", "Light"):
        o = bpy.data.objects.get(n)
        if o:
            bpy.data.objects.remove(o, do_unlink=True)
    return m


def components(me):
    parent = list(range(len(me.vertices)))

    def find(a):
        while parent[a] != a:
            parent[a] = parent[parent[a]]
            a = parent[a]
        return a

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[rb] = ra

    for poly in me.polygons:
        vs = list(poly.vertices)
        for i in range(1, len(vs)):
            union(vs[0], vs[i])
    roots = {}
    for v in range(len(me.vertices)):
        roots.setdefault(find(v), []).append(v)
    return sorted(roots, key=lambda r: -len(roots[r])), roots


def probe(mesh, xs, zs):
    me = mesh.data
    bvh = BVHTree.FromPolygons(
        [mesh.matrix_world @ v.co for v in me.vertices],
        [list(p.vertices) for p in me.polygons],
        all_triangles=False)
    out = {}
    for xi in xs:
        for zi in zs:
            loc, nor, idx, dist = bvh.ray_cast(Vector((float(xi), 1.2, float(zi))),
                                                Vector((0.0, -1.0, 0.0)), 3.0)
            if loc is None:
                out[(xi, zi)] = ("OPEN", None)
            else:
                facing = nor.dot(Vector((0.0, 1.0, 0.0)))
                out[(xi, zi)] = ("OUT" if facing > 0.05 else "INSIDE", tuple(round(c, 3) for c in loc))
    return out


XS = [round(v, 3) for v in np.linspace(-0.24, 0.24, 13)]
ZS = [round(v, 3) for v in np.linspace(1.10, 1.62, 9)]

# --- A: original -------------------------------------------------------
m = load()
A = probe(m, XS, ZS)

# --- B: backpack removed ----------------------------------------------
m = load()
me = m.data
order, roots = components(me)
pack = {v for c in BACKPACK for v in roots[order[c]]}
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
for f in list(bm.faces):
    if any(v.index in pack for v in f.verts):
        bm.faces.remove(f)
bm.to_mesh(me)
bm.free()
me.update()
B = probe(m, XS, ZS)

# --- torso extent at the problem height -------------------------------
print("TORSO (upper-body component, comp 01) x extent per height:")
order, roots = components(me)
torso = roots[order[1]]
co = np.array([(m.matrix_world @ me.vertices[v].co)[:] for v in torso])
for z in (1.20, 1.25, 1.30, 1.35):
    sel = co[(co[:, 2] > z - 0.03) & (co[:, 2] < z + 0.03)]
    if len(sel):
        print("  z=%.2f  x %6.3f..%6.3f   y %6.3f..%6.3f  (n=%d)"
              % (z, sel[:, 0].min(), sel[:, 0].max(), sel[:, 1].min(), sel[:, 1].max(), len(sel)))

print("\nPROBE GRID (x across, z down)  O=outside-facing, I=inside, ?=open")
for zi in ZS:
    rowA = "".join({"OUT": "O", "INSIDE": "I", "OPEN": "?"}[A[(xi, zi)][0]] for xi in XS)
    rowB = "".join({"OUT": "O", "INSIDE": "I", "OPEN": "?"}[B[(xi, zi)][0]] for xi in XS)
    print("  z=%.2f  original %s   no-pack %s" % (zi, rowA, rowB))
print("           x = " + " ".join("%.2f" % x for x in XS))

# --- close-up render of the region ------------------------------------
for name, mesh_obj in (("orig", None), ("nopack", None)):
    pass

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
mesh = bpy.data.objects["Commando"]
for n in ("Cube", "Camera", "Light"):
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)
me = mesh.data
order, roots = components(me)
pack = {v for c in BACKPACK for v in roots[order[c]]}
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
for f in list(bm.faces):
    if any(v.index in pack for v in f.verts):
        bm.faces.remove(f)
bm.to_mesh(me)
bm.free()
me.update()

world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.62, 0.64, 0.68, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.2
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 3.2
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cd.ortho_scale = 0.55
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 700
sc.render.resolution_y = 700
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

target = Vector((0.16, 0.10, 1.28))
cam.location = target + Vector((0.0, 1.4, 0.0))
cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()
sc.render.filepath = os.path.join(OUT, "closeup_rightgap.png")
bpy.ops.render.render(write_still=True)
print("RENDERED", sc.render.filepath)
