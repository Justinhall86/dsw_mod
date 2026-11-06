"""Print the top-surface height at named probe points (plan-view x,y).

    blender -b <blend> --python probe_top.py -- x1,y1 x2,y2 ...
"""
import sys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.open_mainfile(filepath=a[0])
rad = float(a[a.index("--r") + 1]) if "--r" in a else 0.35
skip = a.index("--r") + 2 if "--r" in a else 1
pts = [tuple(float(v) for v in p.split(",")) for p in a[skip:] if "," in p]

dg = bpy.context.evaluated_depsgraph_get()
ev = bpy.data.objects["Renegade_Frigate"].evaluated_get(dg)
import mathutils  # noqa: E402

bvh = mathutils.bvhtree.BVHTree.FromObject(ev, dg)
hi_z = max((ev.matrix_world @ v.co).z for v in ev.data.vertices)
for x, y in pts:
    hit = bvh.ray_cast(Vector((x, y, hi_z + 5)), Vector((0, 0, -1)))
    z = hit[0].z if hit[0] is not None else None
    n = hit[1] if hit[0] is not None else None
    zs = []
    for i in range(8):
        import math  # noqa: E402
        ang = i * math.pi / 4
        h = bvh.ray_cast(Vector((x + rad * math.cos(ang), y + rad * math.sin(ang), hi_z + 5)),
                         Vector((0, 0, -1)))
        zs.append(h[0].z if h[0] is not None else None)
    ok = all(v is not None for v in zs)
    spread = (max(zs) - min(zs)) if ok and z is not None else None
    print("PROBE x %6.2f y %6.2f  top z %s  normal %s  ring spread %s"
          % (x, y, ("%5.2f" % z) if z is not None else "  none",
             tuple(round(v, 2) for v in n) if n else "-",
             ("%.2f" % spread) if spread is not None else "off-surface"))
