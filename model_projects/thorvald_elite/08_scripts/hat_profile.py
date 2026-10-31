"""Print the outer / underside height of the extracted (levelled, apex-at-origin) hat by radius, from the intact sectors only.

    blender -b <kasa_hat.blend> --python hat_profile.py -- [step]
"""
import math
import sys

import bpy
import numpy as np

step = float(sys.argv[sys.argv.index("--") + 1]) if "--" in sys.argv and len(sys.argv) > sys.argv.index("--") + 1 else 0.01
ob = next(o for o in bpy.data.objects if o.type == "MESH")
n = len(ob.data.vertices)
co = np.empty(n * 3)
ob.data.vertices.foreach_get("co", co)
co = co.reshape(n, 3)
r = np.hypot(co[:, 0], co[:, 1])
ang = np.degrees(np.arctan2(co[:, 1], co[:, 0]))      # -90 = front (-Y)
front = np.abs(((ang + 90 + 180) % 360) - 180) < 55    # the fused / holed sector
ok = ~front
print("PROFILE verts %d, front-sector verts %d (excluded)" % (n, front.sum()))
rr = 0.0
rows = []
while rr < r.max() + step:
    m = ok & (r >= rr) & (r < rr + step)
    if m.sum() > 3:
        z = co[m, 2]
        rows.append((rr + step / 2, z.max(), z.min(), m.sum()))
        print("PROFILE r %.3f  z_outer %.4f  z_under %.4f  thick %.4f  n %d" % (rr + step / 2, z.max(), z.min(), z.max() - z.min(), m.sum()))
    rr += step
