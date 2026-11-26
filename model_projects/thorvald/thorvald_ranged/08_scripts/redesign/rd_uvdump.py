"""../08_uvdump_trooper.py (unchanged on disk) with one change for the redesign: the ochre chest plate region (g_plate) is chosen by the face's
own direction (it must face forward, n.y < -0.5, plus |x| < 0.27) instead of the bare box |x| < 0.22, which cut through the plate's triangles and left an
orange sawtooth at the armpit.  Run exactly like the original:  blender -b <variant.blend> --python rd_uvdump.py -- <out.json>
"""
import os
SRC = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "08_uvdump_trooper.py")
code = open(SRC, encoding="utf-8").read()
OLD = "if c.y < 0.0 and abs(c.x) < 0.22 and 1.28 < c.z < 1.60:"
NEW = "if c.y < 0.0 and abs(c.x) < 0.27 and 1.28 < c.z < 1.60 and (obj.matrix_world.to_3x3() @ face.normal).normalized().y < -0.5:"
assert code.count(OLD) == 1, "08_uvdump_trooper.py changed: update rd_uvdump.py"
exec(compile(code.replace(OLD, NEW), SRC, "exec"), {"__name__": "__main__", "__file__": SRC})
