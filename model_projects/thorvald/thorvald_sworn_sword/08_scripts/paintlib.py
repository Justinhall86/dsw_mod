"""Paint textures by 3D position inside Blender (numpy): rasterize each face's UV triangles, interpolate per-corner
attributes (world position, normal, other UV layers, per-vertex values) per pixel, and let the caller decide the pixel.
Images use Blender's bottom-left pixel order and stored (sRGB-encoded for 8-bit) values 0..1.
"""
import numpy as np


def img_to_np(img):
    w, h = img.size
    a = np.empty(w * h * 4, np.float32)
    img.pixels.foreach_get(a)
    return a.reshape(h, w, 4)


def np_to_img(img, arr):
    img.pixels.foreach_set(arr.astype(np.float32).ravel())
    img.update()


def face_tris(ob, faces, uv_layer=None, extra_uv=None, vattr=None):
    """Triangles of the given polygons: uv (n,3,2) in the target layer, world pos (n,3,3), world normal (n,3,3) and,
    if asked, another UV layer (n,3,2) and a per-vertex attribute array vattr[vertex] (n,3,k)."""
    me = ob.data
    uvl = (me.uv_layers[uv_layer] if uv_layer else me.uv_layers.active).data
    xuv = me.uv_layers[extra_uv].data if extra_uv else None
    mw = ob.matrix_world
    nm = mw.to_3x3().inverted().transposed()
    U, Pp, N, X, A = [], [], [], [], []
    for fi in faces:
        p = me.polygons[fi]
        li = list(p.loop_indices)
        for k in range(1, len(li) - 1):
            tri = (li[0], li[k], li[k + 1])
            U.append([tuple(uvl[l].uv) for l in tri])
            vs = [me.loops[l].vertex_index for l in tri]
            Pp.append([tuple(mw @ me.vertices[v].co) for v in vs])
            N.append([tuple((nm @ me.vertices[v].normal).normalized()) for v in vs])
            if xuv is not None:
                X.append([tuple(xuv[l].uv) for l in tri])
            if vattr is not None:
                A.append([vattr[v] for v in vs])
    out = [np.array(U, np.float64), np.array(Pp, np.float64), np.array(N, np.float64)]
    if extra_uv:
        out.append(np.array(X, np.float64))
    if vattr is not None:
        out.append(np.array(A, np.float64))
    return out


def raster(shape, uv, attrs, pad_px=2.0):
    """Pixels covered by each UV triangle (padded by pad_px). Returns rows, cols, and each attr interpolated."""
    H, W = shape[:2]
    rows, cols, outs = [], [], [[] for _ in attrs]
    for t in range(len(uv)):
        q = uv[t] * np.array([W, H])
        x0, y0 = np.floor(q.min(0) - pad_px).astype(int)
        x1, y1 = np.ceil(q.max(0) + pad_px).astype(int)
        x0, y0 = max(x0, 0), max(y0, 0)
        x1, y1 = min(x1, W - 1), min(y1, H - 1)
        if x1 < x0 or y1 < y0:
            continue
        xs, ys = np.meshgrid(np.arange(x0, x1 + 1) + 0.5, np.arange(y0, y1 + 1) + 0.5)
        a, b, c = q
        v0, v1 = b - a, c - a
        d = v0[0] * v1[1] - v1[0] * v0[1]
        if abs(d) < 1e-9:
            continue
        px, py = xs - a[0], ys - a[1]
        l1 = (px * v1[1] - v1[0] * py) / d
        l2 = (v0[0] * py - px * v0[1]) / d
        l0 = 1 - l1 - l2
        hmin = abs(d) / max(np.linalg.norm(v0), np.linalg.norm(v1), np.linalg.norm(c - b), 1e-6)
        tol = pad_px / max(hmin, 1e-6)
        m = (l0 >= -tol) & (l1 >= -tol) & (l2 >= -tol)
        if not m.any():
            continue
        L = np.stack([l0[m], l1[m], l2[m]], 1)
        Lc = L.clip(0, None)
        Lc /= Lc.sum(1, keepdims=True)
        rows.append((ys[m] - 0.5).astype(int))
        cols.append((xs[m] - 0.5).astype(int))
        for k, at in enumerate(attrs):
            outs[k].append(Lc @ at[t])
    if not rows:
        return np.zeros(0, int), np.zeros(0, int), [np.zeros((0, a.shape[-1])) for a in attrs]
    return np.concatenate(rows), np.concatenate(cols), [np.concatenate(o) for o in outs]


def sample(img_arr, uv):
    """Bilinear sample of an (H,W,C) array at uv (n,2) in 0..1 (wraps)."""
    H, W = img_arr.shape[:2]
    x = (uv[:, 0] % 1.0) * W - 0.5
    y = (uv[:, 1] % 1.0) * H - 0.5
    x0 = np.floor(x).astype(int)
    y0 = np.floor(y).astype(int)
    fx, fy = (x - x0)[:, None], (y - y0)[:, None]
    x0m, x1m = x0 % W, (x0 + 1) % W
    y0m, y1m = y0 % H, (y0 + 1) % H
    return (img_arr[y0m, x0m] * (1 - fx) * (1 - fy) + img_arr[y0m, x1m] * fx * (1 - fy) +
            img_arr[y1m, x0m] * (1 - fx) * fy + img_arr[y1m, x1m] * fx * fy)


def lum(rgb):
    return rgb[..., 0] * 0.299 + rgb[..., 1] * 0.587 + rgb[..., 2] * 0.114


def hash_noise(x, seed=0.0):
    """Smooth 1D value noise (x any float array)."""
    i = np.floor(x)
    f = x - i
    r = lambda n: (np.sin((n + seed) * 127.1) * 43758.5453) % 1.0  # noqa: E731
    u = f * f * (3 - 2 * f)
    return r(i) * (1 - u) + r(i + 1) * u


def noise3(p, freq, seed=0.0):
    """Cheap 3D value-ish noise from three 1D noises (p (n,3))."""
    return (hash_noise(p[:, 0] * freq + p[:, 1] * 0.37 * freq, seed) * 0.4 +
            hash_noise(p[:, 1] * freq + p[:, 2] * 0.53 * freq, seed + 3.1) * 0.35 +
            hash_noise(p[:, 2] * freq + p[:, 0] * 0.71 * freq, seed + 7.7) * 0.25)


def height_to_normal(h, mask, strength):
    """Tangent-space normal map (RGBA 0..1) from a height field h (H,W) in pixels-of-height units, only where mask."""
    gx = np.zeros_like(h)
    gy = np.zeros_like(h)
    gx[:, 1:-1] = (h[:, 2:] - h[:, :-2]) * 0.5
    gy[1:-1, :] = (h[2:, :] - h[:-2, :]) * 0.5
    n = np.stack([-gx * strength, -gy * strength, np.ones_like(h)], -1)
    n /= np.linalg.norm(n, axis=-1, keepdims=True)
    out = np.zeros(h.shape + (4,), np.float32)
    out[..., :3] = 0.5 + 0.5 * n
    out[..., 3] = 1
    flat = ~mask
    out[flat] = (0.5, 0.5, 1.0, 1.0)
    return out
