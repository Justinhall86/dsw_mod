"""Position map of the Warden helmet albedo: for every texel, the 3D point (Warden rest pose, world space) it is painted on.
Lets the samurai paints (sm_recolour.py) place bands, slits and lines in 3D instead of guessing in UV space.
    blender -b --python wd_posmap.py
Out: 04_textures/helmet_study/warden/posmap.npz (pos: N x N x 3 float32, nrm: N x N x 3, hit: N x N bool; row 0 = top of the image)."""
import os, sys
import numpy as np
import bpy
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
import wd_panels as WP

N = int(os.environ.get("N", "1024"))
body, rig = WP.load()
me = body.data
me.calc_loop_triangles()
uvl = me.uv_layers.active.data
mw = body.matrix_world
co = np.array([tuple(mw @ v.co) for v in me.vertices], dtype=np.float64)
nr = np.array([tuple((mw.to_3x3() @ v.normal).normalized()) for v in me.vertices], dtype=np.float64)
pos = np.zeros((N, N, 3), np.float32)
nrm = np.zeros((N, N, 3), np.float32)
hit = np.zeros((N, N), bool)
for t in me.loop_triangles:
    uv = np.array([tuple(uvl[l].uv) for l in t.loops])
    px = np.stack([uv[:, 0] * N, (1 - uv[:, 1]) * N], 1)
    x0, y0 = np.floor(px.min(0)).astype(int)
    x1, y1 = np.ceil(px.max(0)).astype(int)
    x0, y0, x1, y1 = max(x0, 0), max(y0, 0), min(x1, N - 1), min(y1, N - 1)
    if x1 < x0 or y1 < y0:
        continue
    gx, gy = np.meshgrid(np.arange(x0, x1 + 1) + 0.5, np.arange(y0, y1 + 1) + 0.5)
    a, b, c = px
    den = (b[1] - c[1]) * (a[0] - c[0]) + (c[0] - b[0]) * (a[1] - c[1])
    if abs(den) < 1e-12:
        continue
    w0 = ((b[1] - c[1]) * (gx - c[0]) + (c[0] - b[0]) * (gy - c[1])) / den
    w1 = ((c[1] - a[1]) * (gx - c[0]) + (a[0] - c[0]) * (gy - c[1])) / den
    w2 = 1 - w0 - w1
    m = (w0 >= -0.02) & (w1 >= -0.02) & (w2 >= -0.02)
    if not m.any():
        continue
    vi = list(t.vertices)
    p = w0[..., None] * co[vi[0]] + w1[..., None] * co[vi[1]] + w2[..., None] * co[vi[2]]
    n = w0[..., None] * nr[vi[0]] + w1[..., None] * nr[vi[1]] + w2[..., None] * nr[vi[2]]
    ys, xs = np.nonzero(m)
    pos[ys + y0, xs + x0] = p[ys, xs]
    nrm[ys + y0, xs + x0] = n[ys, xs]
    hit[ys + y0, xs + x0] = True
np.savez_compressed(P.WORK + "/warden/posmap.npz", pos=pos, nrm=nrm, hit=hit)
print("POSMAP", N, "texels hit %d" % hit.sum())
