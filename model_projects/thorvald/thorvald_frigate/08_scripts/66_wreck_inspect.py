"""List islands (size, centre, faces) and open boundary loops of the mirrored wreck.

    blender -b 03_blender/wreck_mirror.blend --python 66_wreck_inspect.py -- <object>
"""
import sys
import bpy, bmesh
from mathutils import Vector

name = sys.argv[sys.argv.index("--") + 1]
o = bpy.data.objects[name]
bm = bmesh.new(); bm.from_mesh(o.data)
bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=0.02)
bm.faces.ensure_lookup_table()
seen = set()
for f0 in bm.faces:
    if f0.index in seen:
        continue
    st, isl = [f0], []
    seen.add(f0.index)
    while st:
        f = st.pop(); isl.append(f)
        for e in f.edges:
            for g in e.link_faces:
                if g.index not in seen:
                    seen.add(g.index); st.append(g)
    vs = {v for f in isl for v in f.verts}
    lo = Vector((min(v.co[i] for v in vs) for i in range(3)))
    hi = Vector((max(v.co[i] for v in vs) for i in range(3)))
    print("ISL faces %4d size %5.1f centre %s" % (len(isl), max(hi - lo), tuple(round(c, 1) for c in (lo + hi) / 2)))
bnd = [e for e in bm.edges if e.is_boundary]
print("BOUNDARY edges", len(bnd), "total len %.1f" % sum(e.calc_length() for e in bnd))
mn = Vector((min(v.co[i] for v in bm.verts) for i in range(3)))
mx = Vector((max(v.co[i] for v in bm.verts) for i in range(3)))
print("BBOX", tuple(round(c, 1) for c in mn), tuple(round(c, 1) for c in mx))
