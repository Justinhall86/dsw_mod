"""Cheap hull-shape variants of the cruiser (vertex warps only: same topology, UVs and textures) to reduce the boxy /
flat-bottomed look, Kraken-style (tapered wedge sides, rising keel, pointed prow). Then Z-stretch and render via 73.
    SHAPE=V1..V6|V0 ZS=1.39 blender -b 03_blender/cruiser_turrets.blend --python 87_shape_variants.py -- <outdir> <views> <albedo> <mgao>
Hull frame: x -83.7(nose)..79.6(tail), y +-48.9, z -17.5(keel)..17.5. Turrets are not warped."""
import os, runpy, sys
import numpy as np
import bpy
SHAPE = os.environ.get("SHAPE", "V0"); ZS = float(os.environ.get("ZS", "1.39"))
Z0, ZH, XH, YH = -17.5, 35.0, 83.0, 48.9
hull = bpy.data.objects["thorvald_cruiser"]
objs = [o for o in bpy.data.objects if o.type == "MESH"]
for o in objs:
    o.data.transform(o.matrix_world); o.matrix_world = o.matrix_world.__class__.Identity(4)
co = np.array([tuple(v.co) for v in hull.data.vertices])
x, y, z = co[:, 0].copy(), co[:, 1].copy(), co[:, 2].copy()
zn = np.clip((z - Z0) / ZH, 0, 1); xn = x / XH; yn = np.abs(y) / YH
low = np.clip(1 - zn / 0.6, 0, 1) ** 1.5                  # 1 at the keel, 0 above 60% height
nose = np.clip((-xn - 0.35) / 0.65, 0, 1)                 # 0..1 over the forward 2/3 (nose is -X)


def tumble(a): return y * (1 - a * low)                   # lower hull narrows: wedge sides
def rocker(b, t): return b * np.clip(-xn, 0, 1) ** 2 * low + t * np.clip(xn, 0, 1) ** 2 * low   # keel rises to bow / stern
def belly(c): return c * yn ** 1.5 * low                  # keel edges rise: shallow V belly
def prow(w, l): return y * (1 - w * nose ** 1.5), l * nose * low   # nose pinches in plan, lower bow lifts

dz = np.zeros_like(z); ny = y.copy()
if SHAPE == "V1": ny = tumble(0.30)
elif SHAPE == "V2": dz = rocker(9, 4)
elif SHAPE == "V3": dz = belly(9)
elif SHAPE == "V4": ny, dz = prow(0.35, 7)
elif SHAPE == "V5": ny = tumble(0.22); dz = rocker(7, 3) + belly(6)
elif SHAPE == "V6":
    ny = tumble(0.30); ny = ny * (1 - 0.35 * nose ** 1.5); dz = rocker(8, 3) + belly(8) + 7 * nose * low
for i, v in enumerate(hull.data.vertices):
    v.co = (x[i], ny[i], z[i] + dz[i])
hull.data.update()
objs = [o for o in bpy.data.objects if o.type == "MESH"]
for o in objs:
    for v in o.data.vertices:
        v.co.z = Z0 + (v.co.z - Z0) * ZS
    o.data.update()
runpy.run_path(os.path.join(os.path.dirname(os.path.abspath(__file__)), "73_render_blend.py"), run_name="__main__")
