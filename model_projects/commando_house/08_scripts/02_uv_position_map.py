"""Step 02 - rasterise a UV-space position map of the Commando.

For every UV pixel we store the world-space position of the face that covers it
(R=x, G=y, B=z, encoded 0..1).  With that map the albedo can be recoloured by
BODY REGION in numpy (chest / arms / legs / head ...) without guessing from the
texture alone.

Outputs
  04_textures/uv_position.png   (8-bit preview, R=x G=y B=z)
  04_textures/uv_position.npy   (float32 position map, raw world metres)
  04_textures/uv_normal.npy     (float32 world normal per pixel)
  04_textures/uv_covered.npy    (bool coverage mask)

Run:  blender -b --python 08_scripts/02_uv_position_map.py
"""
import os
import bpy
import numpy as np

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_house"
FBX = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "04_textures")
os.makedirs(OUT, exist_ok=True)

SIZE = 512
# world-space extent of the model, used to normalise x/y/z into 0..1
XMIN, XMAX = -0.9, 0.9
YMIN, YMAX = -0.3, 0.5
ZMIN, ZMAX = -0.05, 2.0

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
bpy.context.view_layer.update()

me = mesh.data
uvl = me.uv_layers.active.data
mw = mesh.matrix_world
M3 = mw.to_3x3()

pos = np.zeros((SIZE, SIZE, 3), dtype=np.float32)
nrm = np.zeros((SIZE, SIZE, 3), dtype=np.float32)
cov = np.zeros((SIZE, SIZE), dtype=bool)

n_tris = 0
for poly in me.polygons:
    idx = list(poly.vertices)
    uvs = [uvl[li].uv for li in poly.loop_indices]
    wpos = [mw @ me.vertices[i].co for i in idx]
    n = (M3 @ poly.normal).normalized()
    for i in range(1, len(idx) - 1):
        n_tris += 1
        u = np.array([[p.x, p.y] for p in (uvs[0], uvs[i], uvs[i + 1])], dtype=np.float64) * (SIZE - 1)
        w = np.array([[p.x, p.y, p.z] for p in (wpos[0], wpos[i], wpos[i + 1])], dtype=np.float64)
        x0 = max(int(np.floor(u[:, 0].min())), 0)
        x1 = min(int(np.ceil(u[:, 0].max())), SIZE - 1)
        y0 = max(int(np.floor(u[:, 1].min())), 0)
        y1 = min(int(np.ceil(u[:, 1].max())), SIZE - 1)
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
        sub = nrm[y0:y1 + 1, x0:x1 + 1]
        sub[inside] = np.array([n.x, n.y, n.z], dtype=np.float32)
        cov[y0:y1 + 1, x0:x1 + 1] |= inside

print("TRIANGLES", n_tris)
print("COVERED %.1f%%" % (100.0 * cov.mean()))


def enc(v, lo, hi):
    return np.clip((v - lo) / (hi - lo), 0.0, 1.0)


out = np.zeros((SIZE, SIZE, 4), dtype=np.float32)
out[..., 0] = enc(pos[..., 0], XMIN, XMAX)
out[..., 1] = enc(pos[..., 1], YMIN, YMAX)
out[..., 2] = enc(pos[..., 2], ZMIN, ZMAX)
out[..., 3] = 1.0

img = bpy.data.images.new("uvpos", SIZE, SIZE, alpha=True)
img.pixels.foreach_set(out.ravel())
path = os.path.join(OUT, "uv_position.png")
img.filepath_raw = path
img.file_format = "PNG"
img.save()
print("SAVED", path)

np.save(os.path.join(OUT, "uv_position.npy"), pos)
np.save(os.path.join(OUT, "uv_normal.npy"), nrm)
np.save(os.path.join(OUT, "uv_covered.npy"), cov)
print("SAVED npy")
