"""Print the radius-vs-height profile of the top of a fused mesh, to find a hat's outer shell, underside and rim.

    blender -b --disable-autoexec <file.blend> --python meshy_profile.py -- <z0> <z1> [step]
"""
import sys

import bpy
import numpy as np

a = sys.argv[sys.argv.index("--") + 1:]
z0, z1 = float(a[0]), float(a[1])
step = float(a[2]) if len(a) > 2 else 0.01
ob = next(o for o in bpy.data.objects if o.type == "MESH")
n = len(ob.data.vertices)
co = np.empty(n * 3, dtype=np.float32)
ob.data.vertices.foreach_get("co", co)
co = co.reshape(n, 3)
top = co[co[:, 2] > z1 - 0.02]
cx, cy = float(np.median(top[:, 0])), float(np.median(top[:, 1]))
print("PROF axis centre from the apex: x %.4f y %.4f" % (cx, cy))
r = np.hypot(co[:, 0] - cx, co[:, 1] - cy)
z = co[:, 2]
zz = z0
while zz < z1 + 1e-6:
    m = (z >= zz) & (z < zz + step)
    if m.any():
        rr = np.sort(r[m])
        print("PROF z %.3f..%.3f  n %6d  r min %.3f  p10 %.3f  median %.3f  p90 %.3f  max %.3f  | y(min..max) %.3f..%.3f" % (
            zz, zz + step, m.sum(), rr[0], rr[int(len(rr) * .1)], rr[len(rr) // 2], rr[int(len(rr) * .9)], rr[-1],
            co[m, 1].min(), co[m, 1].max()))
    zz += step
