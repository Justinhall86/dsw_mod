"""Master of Ginaz textures: gold embroidery painted BY 3D POSITION over the recoloured Captain textures.

    blender -b 03_blender/M1_Master_plum.blend --python 30_master_textures.py -- <out_dir> <tag>

Adds: gold frogging + piping on the chest, vine filigree along the coat opening and hem, a gold hem band with filigree on the cape,
gold trim on the mantle edge, and a silver streak in the hair and silver flecks in the beard.  Source images = the current (already
Ginaz-recoloured) images of the materials in the opened blend.
"""
import colorsys
import os
import sys

import bpy
import numpy as np
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(args[0])
TAG = args[1]
os.makedirs(OUT, exist_ok=True)
GOLD = np.array((200, 160, 84), np.float32) / 255.0
GOLD_D = np.array((150, 112, 52), np.float32) / 255.0
SILVER = np.array((150, 146, 142), np.float32) / 255.0

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
    """Replace hue/sat with rgb255's, keep value compressed onto `band` (a, b)."""
    if not mask.any():
        return
    h, s, v = hsv(img)
    vv = v[mask]
    lo, hi = np.percentile(vv, [3, 97])
    vn = np.clip((vv - lo) / max(hi - lo, 1e-6), 0, 1)
    tv = band[0] + (band[1] - band[0]) * vn
    th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in rgb255])
    img[mask] = to_rgb(np.full_like(tv, th * 360.0), np.full_like(tv, ts), tv)


def rasterise(obj, W, H, region_of):
    """Per-texel position / region arrays for each material of `obj`."""
    me = obj.data
    me.calc_loop_triangles()
    uv = me.uv_layers.active.data
    mw = obj.matrix_world
    out = {mi: (np.zeros((H, W, 3), np.float32), np.zeros((H, W), np.int16)) for mi in range(len(me.materials))}
    for tri in me.loop_triangles:
        P, R = out[tri.material_index]
        pts = np.array([[uv[l].uv[0] * W, (1 - uv[l].uv[1]) * H] for l in tri.loops], np.float32)
        pos = np.array([mw @ me.vertices[v].co for v in tri.vertices], np.float32)
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


def image_array(mat):
    for l in mat.node_tree.links:
        if l.to_socket.name == "Base Color" and l.from_node.type == "TEX_IMAGE" and l.from_node.image:
            im = l.from_node.image
            w, h = im.size
            a = np.array(im.pixels[:], np.float32).reshape(h, w, 4)[::-1]    # row 0 = top
            return l.from_node, a
    raise SystemExit("no albedo on " + mat.name)


def load_pixels(path):
    im = bpy.data.images.load(path, check_existing=True)
    w, h = im.size
    return np.array(im.pixels[:], np.float32).reshape(h, w, 4)[::-1]




def wave_lines(a, b, freq=95.0, amp=1.6, k=22.0, thick=0.30):
    """Thick wavy lines (period ~6.6 cm): a = distance across the band, b = distance along it."""
    return np.abs(np.sin(a * freq + amp * np.sin(b * k))) < thick


def scroll(a, b):
    """Coarse vine filigree: two interleaved wave lines (thick enough to survive 512 px textures)."""
    return wave_lines(a, b, 95.0, 1.6, 22.0, 0.30) | wave_lines(a + 0.0165, b + 0.05, 95.0, -1.6, 22.0, 0.22)


def hashnoise(x, y, z):
    return (np.sin(x * 12.9898 + y * 78.233 + z * 37.719) * 43758.5453) % 1.0


mercenary = bpy.data.objects["Mercenary"]
tunic = bpy.data.objects["RaiderFill_tunic"]
coat = bpy.data.objects["GurneyFill_coat"]
head = bpy.data.objects["BannerjeeHead"]
OBJS = (mercenary, tunic, coat, head)
R_TUNIC, R_COAT, R_HEAD, R_CAPE, R_BODY = 1, 2, 3, 4, 5


def dominant_bones(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    dom = {}
    for v in obj.data.vertices:
        if v.groups:
            dom[v.index] = names[max(v.groups, key=lambda x: x.weight).group]
    return dom


CAPE_DOM = dominant_bones(mercenary)


def region_of(obj, tri):
    if obj is tunic:
        return R_TUNIC
    if obj is coat:
        return R_COAT
    if obj is head:
        return R_HEAD
    n = sum(1 for v in tri.vertices if "Cape" in (CAPE_DOM.get(v) or ""))
    return R_CAPE if n >= 2 else R_BODY


swap = []
for obj in OBJS:
    for mi, mat in enumerate(obj.data.materials):
        node, A = image_array(mat)
        H, W = A.shape[:2]
        rast = rasterise(obj, W, H, region_of)
        P, R = rast[mi]
        img = A[..., :3].copy()
        px, py, pz = P[..., 0], P[..., 1], P[..., 2]
        front = py < -0.01
        h_, s_, v_ = hsv(img)
        if obj is tunic:
            chest = (R == R_TUNIC) & front & (pz > 1.25) & (pz < 1.58)
            spacing, width = 0.034, 0.0075
            zz = (pz - 1.27) % spacing
            bars = chest & (np.abs(px) < 0.15) & (zz < width) & (pz > 1.27)
            loops = chest & (np.abs(np.abs(px) - 0.152) < 0.0055) & (zz < spacing * 0.85) & (pz > 1.27)
            pipes = chest & (np.abs(np.abs(px) - 0.185) < 0.0045)
            vine = chest & (np.abs(px) < 0.018) & scroll(px, pz)
            for m, c in ((bars, GOLD), (loops, GOLD_D), (pipes, GOLD), (vine, GOLD_D)):
                img[m] = c
            print("CHEST gold texels", int((bars | loops | pipes | vine).sum()))
        elif obj is coat:
            panel = (R == R_COAT) & front
            edge = panel & (np.abs(px) > 0.030) & (np.abs(px) < 0.080) & (pz < 1.0)
            hem = (R == R_COAT) & (pz < 0.70) & (pz > 0.52)
            fil = (edge & scroll(np.abs(px), pz)) | (hem & scroll(pz, px))
            img[fil] = GOLD
            img[(R == R_COAT) & (pz > 0.50) & (pz < 0.535)] = GOLD_D
            img[(R == R_COAT) & (np.abs(np.abs(px) - 0.030) < 0.003) & front & (pz < 1.0)] = GOLD
            print("COAT gold texels", int(fil.sum()))
        elif obj is mercenary:
            cape = R == R_CAPE
            band = cape & (pz < 0.95)
            fil = band & scroll(pz, px)
            img[fil] = GOLD
            img[cape & (pz > 0.70) & (pz < 0.74)] = GOLD_D
            img[cape & (pz > 0.945) & (pz < 0.975)] = GOLD_D
            print("CAPE gold texels", int(fil.sum()))
        else:
            hair = (R == R_HEAD) & (v_ < 0.62) & (s_ < 0.30)
            streak = hair & (px < -0.006) & (px > -0.038) & (pz > 1.84)                       # one bold streak back from the forehead
            temples = hair & (np.abs(px) > 0.055) & (pz > 1.79) & (pz < 1.88)                # grey at both temples
            beard = hair & (pz < 1.775) & ((np.abs(px) < 0.012) | (np.abs(np.abs(px) - 0.045) < 0.009))   # chin tuft + two side streaks
            for m in (streak, temples, beard):
                img[m] = SILVER * (0.85 + 0.3 * v_[m][:, None] / max(float(v_[m].max()) if m.any() else 1.0, 1e-3))
            print("HAIR silver texels", int((streak | beard | temples).sum()))
        out = np.concatenate([np.clip(img, 0, 1), A[..., 3:]], -1)
        final = np.ascontiguousarray(out[::-1])
        new = bpy.data.images.new("%s_%d_%s" % (obj.name, mi, TAG), W, H, alpha=True)
        new.pixels.foreach_set(final.ravel())
        new.filepath_raw = os.path.join(OUT, "%s_%d_%s_Albedo.png" % (obj.name, mi, TAG))
        new.file_format = "PNG"
        new.save()
        swap.append((node, new))
for node, new in swap:
    node.image = new
bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
shots = os.path.join(OUT, "renders")
os.makedirs(shots, exist_ok=True)
lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in OBJS:
    a, b = bs.model_bounds(o)
    lo = Vector((min(lo.x, a.x), min(lo.y, a.y), min(lo.z, a.z)))
    hi = Vector((max(hi.x, b.x), max(hi.y, b.y), max(hi.z, b.z)))
centre = (lo + hi) / 2
scale = (hi.z - lo.z) * 1.08
for name, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0.05)), ("back", (0, 1, 0)), ("side", (1, 0, 0))):
    bs.setup_render(600, 840)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
    bs.render_to(os.path.join(shots, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
for name, tgt, sc_, d in (("closeup", (0, 0, 1.62), 0.85, (0.45, -0.88, 0.1)), ("chest", (0, 0, 1.30), 0.9, (0, -1, 0.1)),
                          ("hem", (0, 0, 0.75), 1.0, (0.3, -0.95, 0.05)), ("capeback", (0, 0, 1.1), 1.2, (0.2, 1, 0.1))):
    bs.setup_render(700, 700)
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc_, direction=d, distance=4)
    bs.render_to(os.path.join(shots, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(1000, 1300)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(os.path.join(OUT, "..", "..", "03_blender", "M1_Master_%s.blend" % TAG)), compress=True)
print("DONE")
