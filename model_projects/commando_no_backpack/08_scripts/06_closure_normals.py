"""Step 06 - PROPER closure test.

The plain ray test in step 05 is not enough: a ray fired from behind hits the
CHEST if the back surface is missing, so "no misses" does not prove the torso
is closed.  This test also checks the normal of the hit surface: a surface
facing the camera (dot(normal, -ray) > 0) is an outside surface; a surface
facing away is the INSIDE of the body showing through a hole.

  blender -b --python 08_scripts/06_closure_normals.py
"""
import os

import bpy
import bmesh
import numpy as np
from mathutils import Vector
from mathutils.bvhtree import BVHTree

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
BACKPACK = [4, 5, 6, 7, 41, 42, 43, 44]

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
me = mesh.data

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
order = sorted(roots, key=lambda r: -len(roots[r]))
pack_verts = {v for c in BACKPACK for v in roots[order[c]]}

bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
for f in list(bm.faces):
    if any(v.index in pack_verts for v in f.verts):
        bm.faces.remove(f)
bm.to_mesh(me)
bm.free()
me.update()

bvh = BVHTree.FromPolygons(
    [mesh.matrix_world @ v.co for v in me.vertices],
    [list(p.vertices) for p in me.polygons],
    all_triangles=False)

print("CLOSURE TEST (ray from behind, -Y), after removing the backpack:")
bad = []
for xi in np.linspace(-0.20, 0.20, 11):
    for zi in np.linspace(1.10, 1.60, 11):
        origin = Vector((float(xi), 1.2, float(zi)))
        direction = Vector((0.0, -1.0, 0.0))
        loc, nor, idx, dist = bvh.ray_cast(origin, direction, 3.0)
        if loc is None:
            bad.append((xi, zi, "no hit (open hole)"))
            continue
        # the surface must face back toward the camera (+Y)
        facing = nor.dot(Vector((0.0, 1.0, 0.0)))
        if facing <= 0.05:
            bad.append((xi, zi, "back-facing (seeing inside the body)"))
print("  probes: 121   problems: %d" % len(bad))
for b in bad[:20]:
    print("    x=%.2f z=%.2f  %s" % b)

if not bad:
    print("  -> the back is a proper closed, outward-facing surface")

# ---- and the same test on the ORIGINAL mesh, as a control ------------
print("\nCONTROL: the same probe on the original (backpack still on) mesh")
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
m2 = bpy.data.objects["Commando"]
me2 = m2.data
bvh2 = BVHTree.FromPolygons(
    [m2.matrix_world @ v.co for v in me2.vertices],
    [list(p.vertices) for p in me2.polygons],
    all_triangles=False)
bad2 = 0
for xi in np.linspace(-0.20, 0.20, 11):
    for zi in np.linspace(1.10, 1.60, 11):
        loc, nor, idx, dist = bvh2.ray_cast(Vector((float(xi), 1.2, float(zi))),
                                            Vector((0.0, -1.0, 0.0)), 3.0)
        if loc is None or nor.dot(Vector((0.0, 1.0, 0.0))) <= 0.05:
            bad2 += 1
print("  probes: 121   problems: %d (the pack itself blocks the view)" % bad2)
