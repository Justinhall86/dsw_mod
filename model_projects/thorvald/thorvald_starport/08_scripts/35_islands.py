"""List the loose islands of a donor (same joining rule as 34_build_terminal.py): centre, bounds, faces, sheet.

    python 35_islands.py Donor [min_faces]
Coordinates match the 32_donor_grid.py sheets (native size, XY centred, base z 0).
"""
import importlib.util
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import terminal_scene as T  # noqa: E402
from mathutils import Vector  # noqa: E402

_s = importlib.util.spec_from_file_location("b", os.path.join(T.HERE, "34_build_terminal.py"))
Bm = importlib.util.module_from_spec(_s)
_s.loader.exec_module(Bm)

a = T.args()
T.reset()
ob = T.village(a[0], "corrino")
import bpy  # noqa: E402
bpy.ops.object.select_all(action="DESELECT")
ob.select_set(True)
bpy.context.view_layer.objects.active = ob
bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
me = ob.data
rows = []
for faces in Bm.islands(me):
    vs = {v for f in faces for v in me.polygons[f].vertices}
    co = [me.vertices[v].co for v in vs]
    lo = [min(c[k] for c in co) for k in range(3)]
    hi = [max(c[k] for c in co) for k in range(3)]
    c = sum((me.polygons[f].center for f in faces), Vector()) / len(faces)
    rows.append((len(faces), c, lo, hi, T.sheet_of(me.materials[me.polygons[faces[0]].material_index])))
rows.sort(key=lambda r: -r[0])
mn = int(a[1]) if len(a) > 1 else 8
print("ISLANDS", a[0], len(rows))
for f, c, lo, hi, sh in rows:
    if f >= mn:
        print("  f=%-4d c=(%5.2f %5.2f %5.2f) lo=(%5.2f %5.2f %5.2f) hi=(%5.2f %5.2f %5.2f) %s" % ((f,) + tuple(c) + tuple(lo) + tuple(hi) + (sh,)))
