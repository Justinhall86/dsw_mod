"""Find the camera view of the colour reference by matching its silhouette to the mesh.

Run: blender --background --disable-autoexec <input.blend> --python 01_fit_camera.py -- <reference> <out.json>
"""
import json
import math
import sys

import bpy
import numpy as np

ref_path, out_path = sys.argv[sys.argv.index("--") + 1:][:2]
SIZE = 200

img = bpy.data.images.load(ref_path)
w, h = img.size
px = np.array(img.pixels[:], dtype=np.float32).reshape(h, w, 4)[::-1, :, :3]
step = w // SIZE
target = px[::step, ::step].max(axis=2)[:SIZE, :SIZE] > 0.06

obj = bpy.data.objects["mesh_node"]
mesh = obj.data
co = np.zeros(len(mesh.vertices) * 3, dtype=np.float32)
mesh.vertices.foreach_get("co", co)
mat = np.array(obj.matrix_world, dtype=np.float32)
pts = co.reshape(-1, 3) @ mat[:3, :3].T + mat[:3, 3]
tri = np.zeros(len(mesh.polygons) * 3, dtype=np.int32)
mesh.polygons.foreach_get("vertices", tri) if all(p.loop_total == 3 for p in mesh.polygons[:50]) else None
rng = np.random.default_rng(1)
# dense samples on the faces, so the silhouette has no holes
tri = tri.reshape(-1, 3)
weights = rng.dirichlet((1, 1, 1), size=len(tri) * 2)
faces = np.repeat(tri, 2, axis=0)
samples = (pts[faces] * weights[:, :, None]).sum(axis=1)
samples -= (samples.max(axis=0) + samples.min(axis=0)) / 2


def axes(az, el, roll):
    a, e, r = map(math.radians, (az, el, roll))
    fwd = -np.array((math.cos(a) * math.cos(e), math.sin(a) * math.cos(e), math.sin(e)))
    right = np.cross(fwd, (0, 0, 1))
    right /= np.linalg.norm(right)
    up = np.cross(right, fwd)
    return right * math.cos(r) + up * math.sin(r), -right * math.sin(r) + up * math.cos(r), fwd


def silhouette(az, el, roll, scale, dx, dy):
    x_axis, y_axis, _ = axes(az, el, roll)
    u = (samples @ x_axis * scale + 0.5 + dx) * SIZE
    v = (0.5 - samples @ y_axis * scale + dy) * SIZE
    keep = (u >= 0) & (u < SIZE) & (v >= 0) & (v < SIZE)
    mask = np.zeros((SIZE, SIZE), dtype=bool)
    mask[v[keep].astype(int), u[keep].astype(int)] = True
    return mask


def score(*view):
    mask = silhouette(*view)
    return (mask & target).sum() / max((mask | target).sum(), 1)


rows, cols = np.nonzero(target)
tx, ty = (cols.min() + cols.max()) / 2 / SIZE - 0.5, (rows.min() + rows.max()) / 2 / SIZE - 0.5
extent = max(cols.max() - cols.min(), rows.max() - rows.min()) / SIZE
radius = np.linalg.norm(samples, axis=1).max()
best, best_view = -1, None
for az in range(0, 360, 10):
    for el in range(15, 80, 10):
        for scale in (extent / radius / 2 * f for f in (0.85, 1.0, 1.15, 1.3)):
            view = (az, el, 0, scale, tx, ty)
            s = score(*view)
            if s > best:
                best, best_view = s, view
view = list(best_view)
steps = [8, 8, 8, view[3] * 0.08, 0.02, 0.02]
for _ in range(60):
    improved = False
    for i in range(6):
        for sign in (1, -1):
            trial = list(view)
            trial[i] += sign * steps[i]
            s = score(*trial)
            if s > best:
                best, view, improved = s, trial, True
    if not improved:
        steps = [x * 0.6 for x in steps]
print("@@IoU %.3f view %s" % (best, [round(float(x), 3) for x in view]))
with open(out_path, "w") as f:
    json.dump({"iou": float(best), "az": view[0], "el": view[1], "roll": view[2], "scale": view[3],
               "dx": view[4], "dy": view[5],
               "centre": [0, 0, 0]}, f)
