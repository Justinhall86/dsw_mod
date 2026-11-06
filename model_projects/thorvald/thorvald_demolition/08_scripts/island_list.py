"""List a unit's islands: id, verts, centre, dominant bones.   blender -b --python island_list.py -- <UnitKey> [zmax]"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
from units import paths  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
zmax = float(a[1]) if len(a) > 1 else 9.0
bs.reset_scene()
body, rig = bs.import_model(paths(a[0])[0])
for k, c in enumerate(P.components(body)):
    ci = P.comp_info(body, c)
    if ci["centre"][2] <= zmax:
        print("ISL %3d v %4d centre (%.2f %.2f %.2f) %s" % (k, len(c), *ci["centre"], ci["bones"][:2]))
