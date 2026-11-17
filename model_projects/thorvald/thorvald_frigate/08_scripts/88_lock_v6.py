"""Lock the V6 hull shape (87_shape_variants.py) + the Chronos-height stretch (Z x1.39 about the keel) into a new blend.
Turrets move rigidly with the deck under them (re-seated by ray cast), so they stay on the warped sponsons.

    blender -b 03_blender/cruiser_turrets.blend --python 88_lock_v6.py -- 03_blender/cruiser_v6.blend
"""
import os, sys
import numpy as np
import bpy
from mathutils import Matrix, Vector

OUT = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
ZS = 1.39
Z0, ZH, XH, YH = -17.5, 35.0, 83.0, 48.9


def warp(p):
    p = np.atleast_2d(np.asarray(p, float)).copy()
    x, y, z = p[:, 0], p[:, 1], p[:, 2]
    zn = np.clip((z - Z0) / ZH, 0, 1); xn = x / XH; yn = np.abs(y) / YH
    low = np.clip(1 - zn / 0.6, 0, 1) ** 1.5
    nose = np.clip((-xn - 0.35) / 0.65, 0, 1)
    ny = y * (1 - 0.30 * low) * (1 - 0.35 * nose ** 1.5)
    dz = (8 * np.clip(-xn, 0, 1) ** 2 * low + 3 * np.clip(xn, 0, 1) ** 2 * low) + 8 * yn ** 1.5 * low + 7 * nose * low
    nz = Z0 + (z + dz - Z0) * ZS
    return np.stack([x, ny, nz], 1)


meshes = [o for o in bpy.data.objects if o.type == "MESH"]
for o in meshes:
    o.data.transform(o.matrix_world); o.matrix_world = Matrix.Identity(4)
hull = bpy.data.objects["thorvald_cruiser"]
co = np.array([tuple(v.co) for v in hull.data.vertices])
for v, w in zip(hull.data.vertices, warp(co)):
    v.co = Vector(w)
hull.data.update()
bpy.context.view_layer.update()
for t in [o for o in meshes if o.name.startswith("turret_")]:
    tc = np.array([tuple(v.co) for v in t.data.vertices])
    base = tc[tc[:, 2] < tc[:, 2].min() + 0.5].mean(0)          # centre of the turret foot
    nb = warp(base)[0]
    hit, loc, *_ = hull.ray_cast(Vector((nb[0], nb[1], 200)), Vector((0, 0, -1)))   # hull only (identity matrix)
    dz = nb[2] - base[2]              # follow the warp of the foot point (ray casts hit the sponson rail)
    print('  deck hit', hit and round(loc.z, 2), 'foot ->', round(nb[2], 2))
    t.data.transform(Matrix.Translation(Vector((nb[0] - base[0], nb[1] - base[1], dz))))
    t.data.update()
    print("TURRET", t.name, "moved", np.round([nb[0] - base[0], nb[1] - base[1], dz], 2))
bpy.ops.wm.save_as_mainfile(filepath=OUT)
co = np.array([tuple(v.co) for o in bpy.data.objects if o.type == "MESH" for v in o.data.vertices])
print("LOCKED", OUT, "bounds", co.min(0).round(2), co.max(0).round(2))
