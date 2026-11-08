"""Multi-mesh HMD -> OBJ (one object per mesh model, world transforms baked, Z-up as in game).
hmd2fbx only takes single-mesh HMDs; the SpaceCruiserWreck POIs have 2 and 8 meshes.

    python 61_hmd_to_obj.py <hmd> <out.obj>
"""
import os, sys
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
R = HERE
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
sys.path.insert(0, os.path.join(R, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd_reader as H
from hmd2fbx import pos_to_mat4

src, out = sys.argv[1], sys.argv[2]
d = H.load(src)
lines, base = ["# from %s" % os.path.basename(src)], 1
for i, m in enumerate(d.models):
    print(i, m.name, "parent", m.parent, "geom", m.geometry)
    if m.geometry < 0:
        continue
    M, k = np.identity(4), i
    while k >= 0:                                   # row vectors: v @ M_self @ M_parent ...
        M = M @ pos_to_mat4(d.models[k].position)
        k = d.models[k].parent
    g = d.geometries[m.geometry]
    vs = H.decode_vertices(d, g)
    P = np.array([v["position"][:3] for v in vs]); P = np.c_[P, np.ones(len(P))] @ M
    uv = [v.get("uv", (0, 0)) for v in vs]
    lines.append("o %s_%d" % (m.name or "mesh", i))
    lines += ["v %.5f %.5f %.5f" % tuple(p[:3]) for p in P]
    lines += ["vt %.5f %.5f" % (u[0], 1 - u[1]) for u in uv]
    nt = 0
    for grp in H.decode_indices(d, g):
        for t in range(0, len(grp) - 2, 3):
            a, b, c = (grp[t] + base, grp[t + 1] + base, grp[t + 2] + base)
            lines.append("f %d/%d %d/%d %d/%d" % (a, a, b, b, c, c)); nt += 1
    base += len(vs)
    print("   verts %d tris %d  bbox %s %s" % (len(vs), nt, P[:, :3].min(0).round(1), P[:, :3].max(0).round(1)))
open(out, "w").write("\n".join(lines))
print("wrote", out)
