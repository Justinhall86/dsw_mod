"""Compare rest-mesh vs evaluated (armature-modified) vertex bounds for every mesh.

    blender -b --python dump_eval.py -- <in.blend>
"""
import os
import sys

import bpy
from mathutils import Vector

src = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
bpy.ops.wm.open_mainfile(filepath=src)
dg = bpy.context.evaluated_depsgraph_get()


def span(obj, verts):
    lo = Vector((1e9, 1e9, 1e9))
    hi = Vector((-1e9, -1e9, -1e9))
    for v in verts:
        p = obj.matrix_world @ v
        lo = Vector(tuple(min(lo[i], p[i]) for i in range(3)))
        hi = Vector(tuple(max(hi[i], p[i]) for i in range(3)))
    return lo, hi


for name in ("Renegade_Frigate", "TK_Scanner", "TK_Module", "TK_Turret", "TK_SensorDome"):
    o = bpy.data.objects[name]
    lo0, hi0 = span(o, [v.co for v in o.data.vertices])
    ev = o.evaluated_get(dg)
    me = ev.to_mesh()
    lo1, hi1 = span(ev, [v.co for v in me.vertices])
    ev.to_mesh_clear()
    print("%-14s rest  %s .. %s" % (name, tuple(round(v, 3) for v in lo0), tuple(round(v, 3) for v in hi0)))
    print("%-14s eval  %s .. %s" % (name, tuple(round(v, 3) for v in lo1), tuple(round(v, 3) for v in hi1)))

arm = bpy.data.objects["Armature"]
for pb in arm.pose.bones:
    b = arm.data.bones[pb.name]
    print("bone %-8s rest head %s tail %s  pose loc %s"
          % (pb.name,
             tuple(round(v, 3) for v in b.head_local),
             tuple(round(v, 3) for v in b.tail_local),
             tuple(round(v, 3) for v in pb.location)))
    m = arm.matrix_world @ pb.matrix @ b.matrix_local.inverted()
    print("         skin matrix maps origin -> %s" % tuple(round(v, 3) for v in (m @ Vector((0, 0, 0)))))
    print("         skin matrix maps (1,0,0) -> %s" % tuple(round(v, 3) for v in (m @ Vector((1, 0, 0)))))
