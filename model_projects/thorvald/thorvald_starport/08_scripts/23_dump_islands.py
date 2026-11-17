# list every loose island (object) in the donors' parts.blend: blender -b --python 23_dump_islands.py -- <donor> ...
import bpy, sys, os
from mathutils import Vector
DON = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "03_blender", "kitbash_donors")
for d in sys.argv[sys.argv.index("--") + 1:]:
    bpy.ops.wm.open_mainfile(filepath=os.path.join(DON, d, "parts.blend"))
    rows = []
    for o in bpy.data.objects:
        if o.type != "MESH": continue
        b = [o.matrix_world @ Vector(c) for c in o.bound_box]
        lo = [min(v[k] for v in b) for k in range(3)]; hi = [max(v[k] for v in b) for k in range(3)]
        rows.append((len(o.data.polygons), o.name, o.data.materials[0].name, lo, hi))
    rows.sort(reverse=True)
    print("DONOR", d, len(rows))
    for f, n, m, lo, hi in rows[:40]:
        print("  ISL %-22s %-5s f=%-5d lo=%s hi=%s" % (n, m, f, [round(x, 2) for x in lo], [round(x, 2) for x in hi]))
