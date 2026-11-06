"""List connected islands of one object: id (by size), verts, faces, world bbox, dominant bones.

    blender -b <file.blend> --python islands.py -- <object> [min_verts]
"""
import sys
from collections import Counter

import bmesh
import bpy

a = sys.argv[sys.argv.index("--") + 1:]
o = bpy.data.objects[a[0]]
mn = int(a[1]) if len(a) > 1 else 1
names = {g.index: g.name for g in o.vertex_groups}
dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in o.data.vertices if v.groups}
bm = bmesh.new()
bm.from_mesh(o.data)
bm.verts.ensure_lookup_table()
seen, isl = set(), []
for v0 in bm.verts:
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
    isl.append(mem)
isl.sort(key=len, reverse=True)
mw = o.matrix_world
for i, mem in enumerate(isl):
    if len(mem) < mn:
        continue
    ws = [mw @ v.co for v in mem]
    nf = len({f.index for v in mem for f in v.link_faces})
    bc = Counter(dom.get(v.index) for v in mem).most_common(3)
    print("ISL %3d v%5d f%5d x %.2f..%.2f y %.2f..%.2f z %.2f..%.2f %s" % (
        i, len(mem), nf, min(p.x for p in ws), max(p.x for p in ws), min(p.y for p in ws), max(p.y for p in ws),
        min(p.z for p in ws), max(p.z for p in ws), bc))
