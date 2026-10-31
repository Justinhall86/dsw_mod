"""Dump the assembled frigate's triangles (world position, normal, source UV) and the atlas cell of
each object, for 41_make_atlas.py.

    blender -b 03_blender/frigate_v10_layers.blend --python 40_dump_geo.py -- <out.npz>

Cells (col, row from the TOP of the atlas image):
  0 Renegade hull + nozzles   1 Wraith drum   2 Wraith dome   3 Space Shuttle plate stack
"""
import sys

import bpy
import numpy as np

out = sys.argv[sys.argv.index("--") + 1]


def cell_of(name):
    if name.startswith("p0_wraith"):
        return 1
    if "_wraith" in name and name.startswith("g"):
        return 2
    if "spaceshuttle" in name:
        return 3
    return 0          # host_* and the g0/g1 Renegade nozzles


pos, uv, nrm, cell, oid, names = [], [], [], [], [], []
for oi, o in enumerate(sorted((o for o in bpy.data.objects if o.type == "MESH"), key=lambda o: o.name)):
    me = o.data
    me.calc_loop_triangles()
    layer = me.uv_layers.active.data
    mw = o.matrix_world
    names.append(o.name)
    for t in me.loop_triangles:
        pos.append([tuple(mw @ me.vertices[v].co) for v in t.vertices])
        uv.append([tuple(layer[l].uv) for l in t.loops])
        nrm.append(tuple((mw.to_3x3() @ t.normal).normalized()))
        cell.append(cell_of(o.name))
        oid.append(oi)
np.savez(out, pos=np.array(pos, np.float32), uv=np.array(uv, np.float32), nrm=np.array(nrm, np.float32),
         cell=np.array(cell, np.int8), oid=np.array(oid, np.int16), names=np.array(names))
print("DUMP", out, len(pos), "tris", len(names), "objects")
