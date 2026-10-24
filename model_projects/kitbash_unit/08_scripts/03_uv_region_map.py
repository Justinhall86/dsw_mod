"""Step 03 - rasterise a UV-space position + normal map of the model.

For every UV pixel, store the world position of the face that covers it
(R=x, G=y, B=z).  With that map the albedo can be recoloured by BODY REGION
(chest / arms / legs / head) in numpy instead of guessing from the texture.

    blender -b --python 03_uv_region_map.py -- <model.fbx> <out_dir> [--size 512]

Outputs
  <out_dir>/uv_position.npy    float32 (S,S,3) world metres
  <out_dir>/uv_normal.npy      float32 (S,S,3) world normal
  <out_dir>/uv_covered.npy     bool    (S,S) coverage mask
  <out_dir>/uv_position.png    8-bit preview (R=x G=y B=z)

NOTE: the rasteriser only covers part of the atlas (often ~58%).  That is
fine for region work, but a region classifier must NOT rely on it alone -
use the colour-based classifier in 04_classify_regions.py, which covers the
whole texture.
"""
import os
import sys

import bpy
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import script_args

argv = script_args()
if len(argv) < 2:
    raise SystemExit("usage: 03_uv_region_map.py -- <model.fbx> <out_dir> [--size N]")

src = os.path.abspath(argv[0])
out_dir = os.path.abspath(argv[1])
size = 512
if "--size" in argv:
    size = int(argv[argv.index("--size") + 1])
os.makedirs(out_dir, exist_ok=True)

bs.reset_scene()
body, rig = bs.import_model(src)
bpy.context.view_layer.update()
me = body.data
uvl = me.uv_layers.active.data
mw = body.matrix_world
M3 = mw.to_3x3()

pos = np.zeros((size, size, 3), dtype=np.float32)
nrm = np.zeros((size, size, 3), dtype=np.float32)
cov = np.zeros((size, size), dtype=bool)

n_tris = 0
for poly in me.polygons:
    idx = list(poly.vertices)
    uvs = [uvl[li].uv for li in poly.loop_indices]
    wpos = [mw @ me.vertices[i].co for i in idx]
    n = (M3 @ poly.normal).normalized()
    for i in range(1, len(idx) - 1):
        n_tris += 1
        u = np.array([[p.x, p.y] for p in (uvs[0], uvs[i], uvs[i + 1])], dtype=np.float64) * (size - 1)
        w = np.array([[p.x, p.y, p.z] for p in (wpos[0], wpos[i], wpos[i + 1])], dtype=np.float64)
        x0 = max(int(np.floor(u[:, 0].min())), 0)
        x1 = min(int(np.ceil(u[:, 0].max())), size - 1)
        y0 = max(int(np.floor(u[:, 1].min())), 0)
        y1 = min(int(np.ceil(u[:, 1].max())), size - 1)
        if x1 < x0 or y1 < y0:
            continue
        a, b, c = u[0], u[1], u[2]
        area = (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])
        if abs(area) < 1e-9:
            continue
        gx, gy = np.meshgrid(np.arange(x0, x1 + 1), np.arange(y0, y1 + 1))
        l0 = ((b[0] - gx) * (c[1] - gy) - (c[0] - gx) * (b[1] - gy)) / area
        l1 = ((c[0] - gx) * (a[1] - gy) - (a[0] - gx) * (c[1] - gy)) / area
        l2 = 1.0 - l0 - l1
        inside = (l0 >= -1e-6) & (l1 >= -1e-6) & (l2 >= -1e-6)
        if not inside.any():
            continue
        L = np.stack([l0, l1, l2], axis=-1)[..., None]
        wp = (L * w[None, None, :, :]).sum(axis=2)
        sub = pos[y0:y1 + 1, x0:x1 + 1]
        sub[inside] = wp[inside].astype(np.float32)
        subn = nrm[y0:y1 + 1, x0:x1 + 1]
        subn[inside] = np.array([n.x, n.y, n.z], dtype=np.float32)
        cov[y0:y1 + 1, x0:x1 + 1] |= inside

print("TRIANGLES", n_tris)
print("COVERED %.1f%% of the atlas" % (100.0 * cov.mean()))

lo = pos[cov].min(axis=0) if cov.any() else np.array([-0.9, -0.3, -0.05])
hi = pos[cov].max(axis=0) if cov.any() else np.array([0.9, 0.5, 2.0])
print("WORLD EXTENT x %.2f..%.2f  y %.2f..%.2f  z %.2f..%.2f"
      % (lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]))


def enc(v, a, b):
    return np.clip((v - a) / max(b - a, 1e-6), 0.0, 1.0)


out = np.zeros((size, size, 4), dtype=np.float32)
out[..., 0] = enc(pos[..., 0], lo[0], hi[0])
out[..., 1] = enc(pos[..., 1], lo[1], hi[1])
out[..., 2] = enc(pos[..., 2], lo[2], hi[2])
out[..., 3] = 1.0

img = bpy.data.images.new("uvpos", size, size, alpha=True)
img.pixels.foreach_set(out.ravel())
path = os.path.join(out_dir, "uv_position.png")
img.filepath_raw = path
img.file_format = "PNG"
img.save()

np.save(os.path.join(out_dir, "uv_position.npy"), pos)
np.save(os.path.join(out_dir, "uv_normal.npy"), nrm)
np.save(os.path.join(out_dir, "uv_covered.npy"), cov)
print("SAVED", out_dir)
