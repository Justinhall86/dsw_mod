"""Which open boundary loops of a mesh lie nearest to given points (e.g. the rest positions gap_check reported)?

    blender -b <unit.blend> --python loops_near.py -- <object name contains> x,y,z [x,y,z ...]

A gap ON a loop that runs along x = 0 is an unwelded mirror seam (fit_ops cap); a small closed loop is a hole (cap); a long loop at a panel edge
that only opens in motion needs weld_weights; see references/fixes.md.
"""
import sys

import bmesh
import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
o = next(ob for ob in bpy.data.objects if ob.type == "MESH" and a[0] in ob.name); mw = o.matrix_world
bm = bmesh.new(); bm.from_mesh(o.data)
bnd = [e for e in bm.edges if len(e.link_faces) == 1]
adj = {}
for e in bnd:
    for v in e.verts:
        adj.setdefault(v.index, []).append(e)
seen, loops = set(), []
for e0 in bnd:
    if e0.index in seen:
        continue
    stack, comp = [e0], []
    while stack:
        e = stack.pop()
        if e.index in seen:
            continue
        seen.add(e.index); comp.append(e)
        for v in e.verts:
            stack += [x for x in adj[v.index] if x.index not in seen]
    loops.append(comp)
print("LOOPS %s: %d open loops, %d boundary edges" % (o.name, len(loops), len(bnd)))
for s in a[1:]:
    t = Vector(tuple(float(c) for c in s.split(",")))
    best = []
    for k, L in enumerate(loops):
        ps = [mw @ v.co for e in L for v in e.verts]
        seam = sum(abs(p.x) < 0.003 for p in ps) / len(ps)
        best.append((min((p - t).length for p in ps), k, len(L), [round(min(p[i] for p in ps), 3) for i in range(3)],
                     [round(max(p[i] for p in ps), 3) for i in range(3)], seam))
    best.sort()
    print("NEAR", [round(c, 3) for c in t])
    for d, k, n, lo, hi, seam in best[:3]:
        print("   d %.3f  loop %3d  %3d edges  lo %s hi %s%s" % (d, k, n, lo, hi, "  (on the x=0 seam: %d%% of verts)" % (100 * seam) if seam > 0.2 else ""))
