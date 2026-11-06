"""Carve the conical hat out of the fused Meshy character mesh, level it, and decimate it to a game-sized mesh.

    blender -b --disable-autoexec <meshy.blend> --python extract_hat.py -- <out.blend> [target_tris] [--tilt-back deg]

The sculpt's hat is tilted, so: (1) take the apex (highest point) and fit the rim plane (PCA of the outermost vertices) to get the hat's own axis;
(2) in that frame the outer surface is a cone  rho = k * t  (t = distance down the axis from the apex, rho = distance from the axis), capped at
the rim radius; (3) vertices within `SHELL` of that cone (outer skin + underside) are the hat; (4) rotate so the axis is vertical, apex at the
origin, z up; (5) drop floating bits and decimate.  Saved as a single mesh `KasaHat` in <out.blend>.
"""
import math
import os
import sys

import bmesh
import bpy
import numpy as np
from mathutils import Matrix

a = [x for x in sys.argv[sys.argv.index("--") + 1:]]
out = os.path.abspath(a[0])
target = int(a[1]) if len(a) > 1 and not a[1].startswith("--") else 1200
tilt_back = float(a[a.index("--tilt-back") + 1]) if "--tilt-back" in a else 0.0
SHELL = 0.035

ob = next(o for o in bpy.data.objects if o.type == "MESH")
me = ob.data
n = len(me.vertices)
co = np.empty(n * 3, dtype=np.float64)
me.vertices.foreach_get("co", co)
co = co.reshape(n, 3)

apex = co[np.argmax(co[:, 2])]
# rim = the outermost vertices of the hat region (the head never reaches this radius)
hr = np.hypot(co[:, 0] - apex[0], co[:, 1] - apex[1])
rim = co[(co[:, 2] > 0.70) & (hr > 0.235)]
c = rim.mean(0)
w, vecs = np.linalg.eigh(np.cov((rim - c).T))
axis = vecs[:, 0]                       # smallest variance = rim plane normal
if np.dot(apex - c, axis) < 0:
    axis = -axis                         # points from the rim up to the apex
print("HAT apex", apex.round(3), "rim centre", c.round(3), "axis", axis.round(3),
      "tilt from vertical %.1f deg" % math.degrees(math.acos(abs(axis[2]))))

d = co - apex
t = -(d @ axis)                          # distance down the axis from the apex
rho = np.linalg.norm(d + np.outer(t, axis), axis=1)
m = (t > 0.02) & (t < 0.40) & (co[:, 2] > 0.62) & (rho > 0.0)
# cone slope from the wall of the hat (t between 3 and 12 cm below the apex), outer surface = max rho per band
ks = []
for lo in np.arange(0.03, 0.12, 0.01):
    b = m & (t >= lo) & (t < lo + 0.01)
    if b.any():
        ks.append(rho[b].max() / (lo + 0.005))
k = float(np.median(ks))
r_rim = float(np.percentile(rho[(co[:, 2] > 0.70) & (hr > 0.235)], 98))
t_rim = r_rim / k
print("HAT cone slope k %.3f  rim radius %.3f  rim at t %.3f (cone half-angle %.1f deg)" % (k, r_rim, t_rim, math.degrees(math.atan(k))))
rho_out = np.minimum(k * t, r_rim)
keep = (t > -0.005) & (t < t_rim + 0.09) & (rho >= rho_out - SHELL) & (rho <= rho_out + 0.02) & (co[:, 2] > 0.70)
print("HAT keep verts", int(keep.sum()), "of", n)

# level the hat: rotate so `axis` -> +z, apex at the origin
zax = np.array([0.0, 0.0, 1.0])
v = np.cross(axis, zax)
s = np.linalg.norm(v)
if s < 1e-9:
    R = np.eye(3)
else:
    vx = np.array([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])
    R = np.eye(3) + vx + vx @ vx * ((1 - np.dot(axis, zax)) / s ** 2)
if tilt_back:  # optional deliberate tilt (positive = brim lifted at the front), about the x axis
    th = math.radians(tilt_back)
    Rt = np.array([[1, 0, 0], [0, math.cos(th), -math.sin(th)], [0, math.sin(th), math.cos(th)]])
    R = Rt @ R

bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
bmesh.ops.delete(bm, geom=[vv for vv in bm.verts if not keep[vv.index]], context="VERTS")
seen = set()
islands = []
for v0 in bm.verts:
    if v0.index in seen or not v0.is_valid:
        continue
    stack, mem = [v0], []
    seen.add(v0.index)
    while stack:
        vv = stack.pop()
        mem.append(vv)
        for e in vv.link_edges:
            ww = e.other_vert(vv)
            if ww.index not in seen:
                seen.add(ww.index)
                stack.append(ww)
    islands.append(mem)
islands.sort(key=len, reverse=True)
print("HAT islands", [len(i) for i in islands[:8]], "total", len(islands))
big = len(islands[0])
bmesh.ops.delete(bm, geom=[vv for i in islands[1:] if len(i) < 0.05 * big for vv in i], context="VERTS")
for vv in bm.verts:
    p = R @ (np.array(vv.co, dtype=np.float64) - apex)
    vv.co = (float(p[0]), float(p[1]), float(p[2]))
hat = bpy.data.meshes.new("KasaHat")
bm.to_mesh(hat)
bm.free()
print("HAT before decimate: verts %d tris %d" % (len(hat.vertices), sum(len(p.vertices) - 2 for p in hat.polygons)))

for o in list(bpy.data.objects):  # drop the 550k-vertex original, keep only the carved hat
    bpy.data.objects.remove(o, do_unlink=True)
bpy.data.meshes.remove(me)
obj = bpy.data.objects.new("KasaHat", hat)
bpy.context.collection.objects.link(obj)
bpy.context.view_layer.objects.active = obj
tris = sum(len(p.vertices) - 2 for p in hat.polygons)
mod = obj.modifiers.new("dec", "DECIMATE")
mod.ratio = min(1.0, target / max(tris, 1))
bpy.ops.object.modifier_apply(modifier="dec")
hat = obj.data
print("HAT after decimate: verts %d tris %d" % (len(hat.vertices), sum(len(p.vertices) - 2 for p in hat.polygons)))
zs = [vv.co.z for vv in hat.vertices]
rs = [(vv.co.x ** 2 + vv.co.y ** 2) ** 0.5 for vv in hat.vertices]
print("HAT bounds z %.3f..%.3f  max r %.3f" % (min(zs), max(zs), max(rs)))
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("HAT saved", out)
