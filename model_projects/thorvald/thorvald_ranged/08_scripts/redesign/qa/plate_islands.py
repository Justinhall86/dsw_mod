"""How do Gurney's g_plate faces (the ochre box |x|<0.22, front, z 1.28-1.60) sit in its UV islands?"""
import bpy, bmesh, sys
from bpy_extras import bmesh_utils
o = bpy.data.objects["Gurney"]; mw = o.matrix_world
bm = bmesh.new(); bm.from_mesh(o.data); bm.faces.ensure_lookup_table()
uvl = bm.loops.layers.uv.active
isl = bmesh_utils.bmesh_linked_uv_islands(bm, uvl)
def inbox(f):
    c = mw @ f.calc_center_median()
    return c.y < 0.0 and abs(c.x) < 0.22 and 1.28 < c.z < 1.60
for k, I in enumerate(isl):
    n = len(I); nb = sum(inbox(f) for f in I)
    if nb:
        cs = [mw @ f.calc_center_median() for f in I]
        print("ISL %3d faces %4d in_box %4d  x[%.2f..%.2f] y[%.2f..%.2f] z[%.2f..%.2f]" % (k, n, nb, min(c.x for c in cs), max(c.x for c in cs),
              min(c.y for c in cs), max(c.y for c in cs), min(c.z for c in cs), max(c.z for c in cs)))
