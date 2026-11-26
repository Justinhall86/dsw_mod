"""Did my fix change anything?  Per mesh object: vertex count, verts moved, verts whose skin weights changed, faces added/removed -
matched by REST POSITION (welds renumber vertices).  Run it before spending a 15-minute gap scan on a fix.

    blender -b <before.blend> --python diff_blends.py -- <after.blend> [--tol 0.0005]
"""
import os
import sys

import bpy
from mathutils.kdtree import KDTree

a = sys.argv[sys.argv.index("--") + 1:]
after = os.path.abspath(a[0]); tol = float(a[a.index("--tol") + 1]) if "--tol" in a else 0.0005


def grab():
    out = {}
    for o in bpy.data.objects:
        if o.type != "MESH":
            continue
        names = {g.index: g.name for g in o.vertex_groups}
        out[o.name] = dict(p=[o.matrix_world @ v.co for v in o.data.vertices], f=len(o.data.polygons),
                           w=[{names[g.group]: round(g.weight, 3) for g in v.groups if g.weight > 0.001} for v in o.data.vertices])
    return out


A = grab()
bpy.ops.wm.open_mainfile(filepath=after)
B = grab()
for n in sorted(set(A) | set(B)):
    if n not in A or n not in B:
        print("DIFF %-28s only in %s" % (n, "after" if n in B else "before")); continue
    a_, b_ = A[n], B[n]
    kd = KDTree(len(a_["p"]))
    for i, p in enumerate(a_["p"]):
        kd.insert(p, i)
    kd.balance()
    moved = wchg = 0
    for i, p in enumerate(b_["p"]):
        _co, j, d = kd.find(p)
        if d > tol:
            moved += 1
        elif a_["w"][j] != b_["w"][i]:
            wchg += 1
    flag = "" if (moved or wchg or a_["f"] != b_["f"] or len(a_["p"]) != len(b_["p"])) else "   (unchanged)"
    print("DIFF %-28s verts %5d -> %5d  faces %5d -> %5d  moved %4d  weights changed %4d%s"
          % (n, len(a_["p"]), len(b_["p"]), a_["f"], b_["f"], moved, wchg, flag))
