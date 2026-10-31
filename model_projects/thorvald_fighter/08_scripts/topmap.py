"""ASCII map of the top surface height (and a second map of the surface's vertical clearance).

    blender -b <blend> --python topmap.py -- [--step 0.5]

For every grid cell centre in plan view, casts a ray straight down and reports the height of the first surface hit,
so flat deck areas big enough to mount new parts can be read off directly.  Cells with no surface are '.'.
"""
import sys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.open_mainfile(filepath=a[0])
step = float(a[a.index("--step") + 1]) if "--step" in a else 0.5
dg = bpy.context.evaluated_depsgraph_get()
ob = bpy.data.objects["Renegade_Frigate"]
ev = ob.evaluated_get(dg)

import mathutils  # noqa: E402

lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for v in ev.data.vertices:
    w = ev.matrix_world @ v.co
    lo = Vector((min(lo.x, w.x), min(lo.y, w.y), min(lo.z, w.z)))
    hi = Vector((max(hi.x, w.x), max(hi.y, w.y), max(hi.z, w.z)))
print("BOUNDS lo", tuple(round(v, 2) for v in lo), "hi", tuple(round(v, 2) for v in hi))

bvh = mathutils.bvhtree.BVHTree.FromObject(ev, dg)

rows = []
y = hi.y
while y >= lo.y - 1e-6:
    cells = []
    x = lo.x
    while x <= hi.x + 1e-6:
        hit = bvh.ray_cast(Vector((x, y, hi.z + 5)), Vector((0, 0, -1)))
        cells.append(hit[0].z if hit[0] is not None else None)
        x += step
    rows.append((y, cells))
    y -= step

zs = [z for _, cs in rows for z in cs if z is not None]
zmin, zmax = min(zs), max(zs)
print("top surface z range %.2f .. %.2f" % (zmin, zmax))
hdr = "      " + "".join("%d" % (int(round(lo.x + i * step)) % 10) for i in range(len(rows[0][1])))
print(hdr)
for y, cells in rows:
    line = ""
    for z in cells:
        if z is None:
            line += "."
        else:
            t = (z - zmin) / max(zmax - zmin, 1e-6)
            line += "0123456789ABCDEF"[int(t * 15)]
    print("%6.1f%s" % (y, line))
print("legend: 0 = lowest top surface (%.2f), F = highest (%.2f), . = nothing" % (zmin, zmax))
