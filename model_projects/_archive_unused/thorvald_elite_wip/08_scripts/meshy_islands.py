"""List the connected pieces (islands) of a big single-mesh .blend, with vertex counts and bounding boxes.

    blender -b --disable-autoexec <file.blend> --python meshy_islands.py -- [min_verts]
"""
import sys

import bmesh
import bpy

a = sys.argv[sys.argv.index("--") + 1:]
min_verts = int(a[0]) if a else 500
ob = next(o for o in bpy.data.objects if o.type == "MESH")
bm = bmesh.new()
bm.from_mesh(ob.data)
bm.verts.ensure_lookup_table()
seen = [False] * len(bm.verts)
islands = []
for v0 in bm.verts:
    if seen[v0.index]:
        continue
    stack, members = [v0], []
    seen[v0.index] = True
    while stack:
        v = stack.pop()
        members.append(v.index)
        for e in v.link_edges:
            w = e.other_vert(v)
            if not seen[w.index]:
                seen[w.index] = True
                stack.append(w)
    islands.append(members)
islands.sort(key=len, reverse=True)
print("ISL total islands", len(islands), "verts", len(bm.verts))
for i, m in enumerate(islands[:40]):
    if len(m) < min_verts:
        break
    xs = [bm.verts[k].co.x for k in m]
    ys = [bm.verts[k].co.y for k in m]
    zs = [bm.verts[k].co.z for k in m]
    print("ISL %2d verts %7d  x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f" % (i, len(m), min(xs), max(xs), min(ys), max(ys), min(zs), max(zs)))
