"""Step 01 - analyse the Commando mesh to find the backpack.

The backpack may be
  a) a separate connected component of the mesh (easy to delete), or
  b) part of the torso shell, only separable by bone weights / position.

This prints: connected components, per-component bounding box, the dominant bone
of every vertex, and the vertex-group table.

Run:  blender -b --python 08_scripts/01_analyse_mesh.py
"""
import os
from collections import Counter, deque

import bpy
import numpy as np

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
me = mesh.data
groups = mesh.vertex_groups
print("MESH verts %d tris %d vgroups %d" % (len(me.vertices), len(me.polygons), len(groups)))
print("GROUPS:", [g.name for g in groups])

# ---- connected components over the polygon graph ---------------------
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

comps = {}
for v in range(len(me.vertices)):
    comps.setdefault(find(v), []).append(v)

print("\nCOMPONENTS: %d" % len(comps))
info = []
for root, verts in comps.items():
    co = np.array([mesh.matrix_world @ me.vertices[i].co for i in verts])
    lo = co.min(axis=0)
    hi = co.max(axis=0)
    tris = sum(1 for p in me.polygons if find(p.vertices[0]) == root)
    info.append((len(verts), tris, lo, hi, verts, root))
info.sort(key=lambda t: -t[0])

for n, tris, lo, hi, verts, root in info[:15]:
    print("  verts %5d tris %5d  x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (n, tris, lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]))

# ---- dominant bone per vertex ----------------------------------------
dom = {}
for v in me.vertices:
    if not v.groups:
        dom[v.index] = "NONE"
        continue
    g = max(v.groups, key=lambda g: g.weight)
    dom[v.index] = groups[g.group].name

print("\nDOMINANT BONE histogram:")
for k, n in Counter(dom.values()).most_common(60):
    print("  %-16s %d" % (k, n))

# ---- per-component dominant bone -------------------------------------
print("\nPER-COMPONENT dominant bones:")
for n, tris, lo, hi, verts, root in info[:15]:
    c = Counter(dom[i] for i in verts)
    print("  comp %5d verts: %s" % (n, c.most_common(4)))
