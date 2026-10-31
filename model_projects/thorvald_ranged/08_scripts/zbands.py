"""Print each mesh's world z range and its vertex counts per 2 cm band between z0 and z1 (to find where two parts overlap).

    blender -b <file.blend> --python zbands.py -- <z0> <z1>
"""
import sys

import bpy

z0, z1 = [float(a) for a in sys.argv[sys.argv.index("--") + 1:][:2]]
for o in bpy.data.objects:
    if o.type != "MESH" or o.hide_render:
        continue
    zs = [(o.matrix_world @ v.co).z for v in o.data.vertices]
    bands = {}
    for z in zs:
        if z0 <= z < z1:
            k = round(z // 0.02 * 0.02, 2)
            bands[k] = bands.get(k, 0) + 1
    print("ZB %-22s z %.3f..%.3f  %s" % (o.name, min(zs), max(zs), dict(sorted(bands.items()))))
