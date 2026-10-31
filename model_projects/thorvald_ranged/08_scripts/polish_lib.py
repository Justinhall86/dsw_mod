"""Texture polish engine for the Ginaz units (runs inside Blender; numpy + bpy only).

What it does per material:
  1. UPSCALE albedo / MetallicGlossAO / normal (default x2) with a mild unsharp mask, so detail painted on top is crisp instead of blocky.
  2. Rasterise the mesh into the texture: for every texel the REST-POSE POSITION (P), a REGION id (R) and the texel footprint in metres (FP).
  3. A Canvas paints with ANTI-ALIASED coverage (soft edges measured in texels, so lines stay clean at any resolution) and records a HEIGHT map.
  4. finalize(): height -> detail normal (combined with the original normal map), emboss shading + contact darkening on the albedo,
     gold/metal coverage -> MetallicGlossAO (R metallic, G gloss), optional fabric twill micro-normal.
  5. save the three PNGs and point the material's nodes at them.

Conventions: arrays are float32, row 0 = TOP of the image (bpy pixels are bottom-up, helpers flip).  Normal maps are OpenGL style (green = up), which
is what Blender's Normal Map node and the FBX importer wiring assume.
"""
import colorsys
import os

import bpy
import numpy as np


# ------------------------------------------------------------------ image <-> array
def img_to_array(img):
    w, h = img.size
    a = np.array(img.pixels[:], np.float32).reshape(h, w, 4)
    return np.ascontiguousarray(a[::-1])


def array_to_img(name, arr, path=None, colourspace=None):
    h, w = arr.shape[:2]
    im = bpy.data.images.new(name, w, h, alpha=True)
    if colourspace:                         # MUST be set before the pixels are written (changing it afterwards clears the buffer)
        im.colorspace_settings.name = colourspace
    rgba = arr if arr.shape[2] == 4 else np.concatenate([arr, np.ones((h, w, 1), np.float32)], -1)
    im.pixels.foreach_set(np.ascontiguousarray(np.clip(rgba, 0, 1)[::-1]).ravel())
    if path:
        im.filepath_raw = path
        im.file_format = "PNG"
        im.save()
    im.pack()
    return im


def resize(arr, w2, h2):
    """Resize via Blender's own image scaler (bilinear); fast and good enough before the unsharp pass."""
    h, w = arr.shape[:2]
    if (w, h) == (w2, h2):
        return arr
    im = array_to_img("__tmp_resize", arr)
    im.scale(w2, h2)
    out = img_to_array(im)
    bpy.data.images.remove(im)
    return out


def box_blur(a, r):
    """Separable box blur, radius r texels, edge-clamped. a: (H,W) or (H,W,C)."""
    if r <= 0:
        return a
    k = 2 * r + 1
    out = a
    for axis in (0, 1):
        pad = [(0, 0)] * a.ndim
        pad[axis] = (r + 1, r)
        p = np.pad(out, pad, mode="edge")
        c = np.cumsum(p, axis=axis, dtype=np.float64)
        sl_hi = [slice(None)] * a.ndim
        sl_lo = [slice(None)] * a.ndim
        sl_hi[axis] = slice(k, None)
        sl_lo[axis] = slice(0, -k)
        out = ((c[tuple(sl_hi)] - c[tuple(sl_lo)]) / k).astype(np.float32)
    return out


def unsharp(rgb, amount=0.55, radius=1):
    b = box_blur(rgb, radius)
    return np.clip(rgb + (rgb - b) * amount, 0, 1)


# ------------------------------------------------------------------ colour helpers
def hsv(a):
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    mx, mn = a.max(-1), a.min(-1)
    d = np.maximum(mx - mn, 1e-6)
    h = np.where(mx == r, (60 * ((g - b) / d)) % 360, np.where(mx == g, 60 * ((b - r) / d) + 120, 60 * ((r - g) / d) + 240))
    h = np.where(mx - mn < 1e-6, 0, h)
    s = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
    return h, s, mx


def to_rgb(h, s, v):
    c = v * s
    x = c * (1 - np.abs((h / 60.0) % 2 - 1))
    m = v - c
    z = np.zeros_like(c)
    seg = (np.floor(h / 60.0) % 6).astype(int)
    r = np.select([seg == i for i in range(6)], [c, x, z, z, x, c])
    g = np.select([seg == i for i in range(6)], [x, c, c, x, z, z])
    b = np.select([seg == i for i in range(6)], [z, z, x, c, c, x])
    return np.stack([r + m, g + m, b + m], -1)


def recolour(img, mask, rgb255, band):
    """Replace hue/sat with rgb255's, keep the painted value compressed onto `band`."""
    if not mask.any():
        return
    h, s, v = hsv(img)
    vv = v[mask]
    lo, hi = np.percentile(vv, [3, 97])
    vn = np.clip((vv - lo) / max(hi - lo, 1e-6), 0, 1)
    tv = band[0] + (band[1] - band[0]) * vn
    th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in rgb255])
    img[mask] = to_rgb(np.full_like(tv, th * 360.0), np.full_like(tv, ts), tv)


# ------------------------------------------------------------------ rasterising the mesh into a texture
def rasterise(obj, W, H, region_of):
    """-> {material index: (P (H,W,3) rest-pose position, R (H,W) region id)}; texels outside every triangle have R == 0."""
    me = obj.data
    me.calc_loop_triangles()
    uv = me.uv_layers.active.data
    mw = obj.matrix_world
    out = {mi: (np.zeros((H, W, 3), np.float32), np.zeros((H, W), np.int16)) for mi in range(len(me.materials))}
    verts = [mw @ v.co for v in me.vertices]
    for tri in me.loop_triangles:
        P, R = out[tri.material_index]
        pts = np.array([[uv[l].uv[0] * W, (1 - uv[l].uv[1]) * H] for l in tri.loops], np.float32)
        pos = np.array([verts[v] for v in tri.vertices], np.float32)
        reg = region_of(obj, tri)
        x0, x1 = int(max(pts[:, 0].min() - 1, 0)), int(min(pts[:, 0].max() + 2, W))
        y0, y1 = int(max(pts[:, 1].min() - 1, 0)), int(min(pts[:, 1].max() + 2, H))
        if x1 <= x0 or y1 <= y0:
            continue
        xs, ys = np.meshgrid(np.arange(x0, x1) + 0.5, np.arange(y0, y1) + 0.5)
        d = (pts[1, 1] - pts[2, 1]) * (pts[0, 0] - pts[2, 0]) + (pts[2, 0] - pts[1, 0]) * (pts[0, 1] - pts[2, 1])
        if abs(d) < 1e-9:
            continue
        a = ((pts[1, 1] - pts[2, 1]) * (xs - pts[2, 0]) + (pts[2, 0] - pts[1, 0]) * (ys - pts[2, 1])) / d
        b = ((pts[2, 1] - pts[0, 1]) * (xs - pts[2, 0]) + (pts[0, 0] - pts[2, 0]) * (ys - pts[2, 1])) / d
        c = 1 - a - b
        inside = (a >= -0.02) & (b >= -0.02) & (c >= -0.02)
        if not inside.any():
            continue
        interp = a[..., None] * pos[0] + b[..., None] * pos[1] + c[..., None] * pos[2]
        P[y0:y1, x0:x1][inside] = interp[inside]
        R[y0:y1, x0:x1][inside] = reg
    return out


def footprint(P, R):
    """Texel size in metres (median over covered neighbours); used as the anti-aliasing width."""
    cov = R != 0
    dx = np.linalg.norm(P[:, 1:] - P[:, :-1], axis=-1)
    ok = cov[:, 1:] & cov[:, :-1] & (dx < 0.05) & (dx > 0)
    med = float(np.median(dx[ok])) if ok.any() else 0.002
    return max(med, 1e-4)


# ------------------------------------------------------------------ soft coverage primitives (all in metres, anti-aliased by the texel footprint)
def cov_line(dist, half_width, fp):
    """1 on the line, soft edge about one texel wide.  dist = distance to the line centre (metres)."""
    return np.clip((half_width - np.abs(dist)) / fp + 0.5, 0.0, 1.0)


def cov_stripes(c, spacing, width, origin, fp):
    d = ((c - origin + spacing * 0.5) % spacing) - spacing * 0.5
    return cov_line(d, width * 0.5, fp)


def cov_band(c, lo, hi, fp):
    return np.clip((c - lo) / fp + 0.5, 0, 1) * np.clip((hi - c) / fp + 0.5, 0, 1)


def cov_wave(a, b, spacing, width, amp, period, fp, phase=0.0):
    """Wavy line family: a = across, b = along (metres).  Lines every `spacing`, wobbling by +-amp every `period` metres."""
    d = a + amp * np.sin(b * (2 * np.pi / period) + phase)
    return cov_stripes(d, spacing, width, 0.0, fp)


def hash01(x, y, z):
    return (np.sin(x * 127.1 + y * 311.7 + z * 74.7) * 43758.5453) % 1.0


# ------------------------------------------------------------------ canvas
class Canvas:
    def __init__(self, albedo, mg, nrm, P, R, fp):
        self.A = albedo[..., :3].copy()
        self.alpha = albedo[..., 3:].copy()
        self.MG = mg.copy()
        self.N = nrm.copy()
        self.P, self.R, self.fp = P, R, fp
        h, w = R.shape
        self.Hgt = np.zeros((h, w), np.float32)          # relief height in metres
        self.gold = np.zeros((h, w), np.float32)         # metal coverage 0..1
        self.cloth = np.zeros((h, w), np.float32)        # twill coverage 0..1

    def paint(self, cov, rgb, height=0.0, gold=False, shade_by_height=True):
        """Blend colour `rgb` (0..1 triplet or (H,W,3)) with coverage `cov` (0..1); raise the relief by cov*height; flag metal."""
        cov = np.clip(cov, 0, 1)
        col = np.asarray(rgb, np.float32)
        if col.ndim == 1:
            col = col[None, None, :]
        self.A = self.A * (1 - cov[..., None]) + col * cov[..., None]
        if height:
            self.Hgt = np.maximum(self.Hgt, cov * height)
        if gold:
            self.gold = np.maximum(self.gold, cov)

    def finalize(self, relief=1.0, emboss=0.35, ao=0.5, weave=0.0, gold_metal=0.9, gold_gloss=0.72, auto_gold=True):
        fp = self.fp
        # auto-detect existing gold-ish paint (donor studs, stripes) so it also reads as metal
        if auto_gold:
            h, s, v = hsv(self.A)
            auto = ((h > 32) & (h < 54) & (s > 0.42) & (v > 0.55)).astype(np.float32)
            auto = box_blur(auto, 1)
            self.gold = np.maximum(self.gold, auto * 0.85)
        Hs = box_blur(self.Hgt, 1)
        gy, gx = np.gradient(Hs)
        slope_x, slope_y = gx / fp, gy / fp               # metres per metre
        # emboss: light from the upper left (image space): lit where the surface faces up-left
        lit = (-slope_x * 0.6 - slope_y * 0.8)
        shade = 1.0 + emboss * np.clip(lit * 4.0, -1, 1)
        halo = np.clip(box_blur(self.Hgt, 3) - self.Hgt, 0, None)       # contact darkening around raised parts
        shade *= 1.0 - ao * np.clip(halo * 120.0, 0, 0.6)
        self.A = np.clip(self.A * shade[..., None], 0, 1)
        # detail normal
        nxy = np.stack([-slope_x, slope_y], -1) * relief * 2.0
        if weave > 0:
            R_, P_ = self.R, self.P
            u = (P_[..., 0] + P_[..., 1] * 0.7) * 520.0
            v_ = P_[..., 2] * 520.0
            tw = np.sin(u + v_) * 0.5 + np.sin(u - v_ * 0.6) * 0.25
            nxy = nxy + np.stack([tw, np.roll(tw, 3, axis=0)], -1) * weave * self.cloth[..., None]
        n0 = self.N[..., :3] * 2 - 1
        nx = n0[..., 0] + nxy[..., 0]
        ny = n0[..., 1] + nxy[..., 1]
        nz = n0[..., 2]
        ln = np.sqrt(nx * nx + ny * ny + nz * nz)
        self.N = np.stack([nx / ln, ny / ln, nz / ln], -1) * 0.5 + 0.5
        # metal
        g = np.clip(self.gold, 0, 1)
        self.MG[..., 0] = self.MG[..., 0] * (1 - g) + gold_metal * g
        self.MG[..., 1] = self.MG[..., 1] * (1 - g) + gold_gloss * g

    def arrays(self):
        alb = np.concatenate([np.clip(self.A, 0, 1), self.alpha], -1)
        mg = np.concatenate([np.clip(self.MG[..., :3], 0, 1), np.ones_like(self.alpha)], -1)
        nm = np.concatenate([np.clip(self.N, 0, 1), np.ones_like(self.alpha)], -1)
        return alb, mg, nm


# ------------------------------------------------------------------ material plumbing
def material_images(mat):
    """-> (albedo node, mg node, normal node); any may be None."""
    nt = mat.node_tree
    alb = mg = nrm = None
    for l in nt.links:
        if l.from_node.type == "TEX_IMAGE":
            if l.to_socket.name == "Base Color":
                alb = l.from_node
            elif l.to_socket.name == "Specular IOR Level":
                mg = l.from_node
            elif l.to_node.type == "NORMAL_MAP":
                nrm = l.from_node
    return alb, mg, nrm


def load_material_arrays(mat, scale, sharpen=0.55):
    a_node, m_node, n_node = material_images(mat)
    A = img_to_array(a_node.image)
    h, w = A.shape[:2]
    W, H = w * scale, h * scale
    A = resize(A, W, H)
    A[..., :3] = unsharp(A[..., :3], sharpen, 1) if scale > 1 else A[..., :3]
    MG = resize(img_to_array(m_node.image), W, H) if m_node and m_node.image else np.dstack([np.zeros((H, W)), np.full((H, W), 0.4), np.ones((H, W)), np.ones((H, W))]).astype(np.float32)
    NM = resize(img_to_array(n_node.image), W, H) if n_node and n_node.image else np.dstack([np.full((H, W), 0.5), np.full((H, W), 0.5), np.ones((H, W)), np.ones((H, W))]).astype(np.float32)
    return (a_node, m_node, n_node), A, MG, NM


def store_material(mat, nodes, canvas_arrays, out_dir, stem):
    os.makedirs(out_dir, exist_ok=True)
    alb, mg, nm = canvas_arrays
    paths = {}
    a_node, m_node, n_node = nodes
    for kind, arr, node, cs in (("Albedo", alb, a_node, None), ("MetallicGlossAO", mg, m_node, "Non-Color"), ("Normal", nm, n_node, "Non-Color")):
        p = os.path.join(out_dir, "%s_%s.png" % (stem, kind))
        im = array_to_img("%s_%s" % (stem, kind), arr, p, cs)
        if node is not None:
            node.image = im
        paths[kind] = p
    return paths
