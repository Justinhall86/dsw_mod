"""Find sliver faces (long, thin triangles) per mesh: aspect = longest_edge^2 / (2 * area), i.e. roughly base / height.

    blender -b <file.blend> --python sliver_report.py -- [min_aspect] [max_area]
"""
import sys

import bmesh
import bpy

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
min_aspect = float(a[0]) if a else 10.0
max_area = float(a[1]) if len(a) > 1 else 0.001
for o in bpy.data.objects:
    if o.type != "MESH" or o.hide_render:
        continue
    bm = bmesh.new()
    bm.from_mesh(o.data)
    mw = o.matrix_world
    bad = []
    for f in bm.faces:
        if len(f.verts) != 3:
            continue
        area = f.calc_area()
        if area < 1e-9:
            continue
        longest = max(e.calc_length() for e in f.edges)
        asp = longest * longest / (2 * area)
        if asp >= min_aspect and area <= max_area:
            c = mw @ f.calc_center_median()
            bad.append((asp, area, c))
    print("SL %-20s faces %5d  slivers %3d" % (o.name, len(bm.faces), len(bad)))
    for asp, area, c in sorted(bad, key=lambda t: -t[0])[:14]:
        print("SL    aspect %6.1f area %.6f at (%.3f %.3f %.3f)" % (asp, area, c.x, c.y, c.z))
    bm.free()
