"""Step 08 - definitive closure test: per-component manifold check.

A component with ZERO boundary edges (edges with only one linked face) is a
closed shell.  If the torso component is closed, removing the backpack cannot
have opened a hole in it.

Runs on the mesh BEFORE and AFTER the backpack removal and prints the boundary
edge count per component.

  blender -b --python 08_scripts/08_manifold_test.py
"""
import os

import bpy
import bmesh

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
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


def comps(me):
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


def report(mesh, label):
    me = mesh.data
    order, roots = comps(me)
    comp_of = {}
    for i, root in enumerate(order):
        for v in roots[root]:
            comp_of[v] = i

    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    bm.edges.ensure_lookup_table()
    bm.faces.ensure_lookup_table()

    boundary_per_comp = {}
    for e in bm.edges:
        if len(e.link_faces) == 1:
            c = comp_of[e.verts[0].index]
            boundary_per_comp[c] = boundary_per_comp.get(c, 0) + 1
    bm.free()

    print("\n%s" % label)
    open_comps = []
    for c in sorted(boundary_per_comp):
        if c < 6 or c > 40:
            open_comps.append((c, boundary_per_comp[c]))
    print("  components with open boundary edges:")
    for c, n in open_comps:
        print("    comp %2d : %d boundary edges" % (c, n))
    torso_open = boundary_per_comp.get(1, 0)
    print("  TORSO (comp 01) boundary edges: %d  -> %s"
          % (torso_open, "CLOSED shell" if torso_open == 0 else "OPEN"))
    return torso_open


m = load()
report(m, "BEFORE (backpack present)")

m = load()
me = m.data
order, roots = comps(me)
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
report(m, "AFTER (backpack removed)")

# after removal the component numbering may shift; report the biggest ones
order2, roots2 = comps(me)
print("\nAFTER: component list (largest first) with boundary edges:")
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
bm.edges.ensure_lookup_table()
comp_of = {}
for i, root in enumerate(order2):
    for v in roots2[root]:
        comp_of[v] = i
bp = {}
for e in bm.edges:
    if len(e.link_faces) == 1:
        c = comp_of[e.verts[0].index]
        bp[c] = bp.get(c, 0) + 1
bm.free()
for i, root in enumerate(order2[:8]):
    print("  comp %2d  verts %4d  boundary edges %d" % (i, len(roots2[root]), bp.get(i, 0)))
