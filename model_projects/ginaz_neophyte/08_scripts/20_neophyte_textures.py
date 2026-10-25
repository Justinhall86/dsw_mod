"""Neophyte textures: recolour per body region + paint chest braiding and wrist wraps BY 3D POSITION.

    blender -b 03_blender/N1_Neophyte.blend --python 20_neophyte_textures.py -- <out_dir> <tag> [--debug]

How it works (reusable for any unit):
  1. For every material image, rasterise each triangle's UV footprint into per-texel arrays: 3D rest-pose position (P),
     body region id (REG) and which object owns the texel.  Regions come from the 'reg' vertex attribute that 03_variants.py
     writes on the base mesh (island ids -> names) and from the object name for fills/heads.
  2. Recolour: hue + saturation replaced, painted value kept and compressed (see dsw-new-unit recolour doc).
  3. Paint: patterns are functions of the 3D position (chest braids = horizontal bands in world z across the jacket front,
     wrist wraps = distance to the wrist bone), so they land correctly on whatever UV layout the donor has.
  4. Swap the images into the materials, pack, render turnaround.
--debug paints each region a flat colour so the region assignment can be checked by eye.
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
DEBUG = "--debug" in args
os.makedirs(OUT, exist_ok=True)

PAL = {
    "jacket": (96, 64, 104),      # violet plum, the Neophyte jacket
    "braid": (88, 26, 44),        # dark wine frogging
    "sash": (158, 146, 130),      # grey-beige sash and wraps
    "trousers": (100, 34, 52),    # wine
    "boots": (66, 54, 50),        # dark leather
    "hair": (30, 24, 22),
    "gold": (196, 154, 78),
    "eye": (64, 42, 30),
}

rig = bpy.data.objects["Armature"]
rig_mw = rig.matrix_world


def bone_head(name):
    return np.array(rig_mw @ rig.data.bones[name].head_local, dtype=np.float32)


WR = {s: bone_head("B_%sWristJ" % s) for s in ("l", "r")}
EL = {s: bone_head("B_%sElbowJ" % s) for s in ("l", "r")}


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


def recolour(img, mask, rgb255, band, lo_hi=None):
    """Replace hue/sat with rgb255's, keep value compressed onto `band` (a, b)."""
    if not mask.any():
        return
    h, s, v = hsv(img)
    vv = v[mask]
    lo, hi = np.percentile(vv, [3, 97]) if lo_hi is None else lo_hi
    vn = np.clip((vv - lo) / max(hi - lo, 1e-6), 0, 1)
    tv = band[0] + (band[1] - band[0]) * vn
    th, ts, _ = colorsys.rgb_to_hsv(*[c / 255.0 for c in rgb255])
    img[mask] = to_rgb(np.full_like(tv, th * 360.0), np.full_like(tv, ts), tv)


def rasterise(obj, W, H, region_of):
    """Per-texel position / region arrays for the materials of `obj` (first material only per image)."""
    me = obj.data
    me.calc_loop_triangles()
    uv = me.uv_layers.active.data
    mw = obj.matrix_world
    out = {}
    for mi, mat in enumerate(me.materials):
        out[mi] = (np.zeros((H, W, 3), np.float32), np.zeros((H, W), np.int16))
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
        sub_P = P[y0:y1, x0:x1]
        sub_R = R[y0:y1, x0:x1]
        interp = a[..., None] * pos[0] + b[..., None] * pos[1] + c[..., None] * pos[2]
        sub_P[inside] = interp[inside]
        sub_R[inside] = reg
    return out


def image_array(mat, sock="Base Color"):
    for l in mat.node_tree.links:
        if l.to_socket.name == sock and l.from_node.type == "TEX_IMAGE" and l.from_node.image:
            im = l.from_node.image
            w, h = im.size
            a = np.array(im.pixels[:], np.float32).reshape(h, w, 4)[::-1]    # flip: row 0 = top
            return l.from_node, a, bpy.path.abspath(im.filepath)
    raise SystemExit("no albedo on " + mat.name)


base = bpy.data.objects["Raider"]
head = bpy.data.objects["Idualis02Head"]
names = list(base["region_names"])
REGION_ID = {n: i + 1 for i, n in enumerate(names)}
REGION_ID["head"] = 100
REGION_ID["other"] = 0


def region_of(obj, tri):
    if obj is head:
        return REGION_ID["head"]
    attr = obj.data.attributes.get("reg")
    return int(attr.data[tri.vertices[0]].value) if attr else 0


swap = {}
for obj in (base, head):
    mat = obj.data.materials[0]
    node, A, path = image_array(mat)
    H, W = A.shape[:2]
    rast = rasterise(obj, W, H, region_of)
    P, R = rast[0]
    cover = np.zeros((H, W), bool)
    cover[R != 0] = True
    img = A[..., :3].copy()
    is_ = lambda n: R == REGION_ID[n]
    px, py, pz = P[..., 0], P[..., 1], P[..., 2]

    if DEBUG:
        cols = {"tunic": (255, 0, 0), "sleeves": (0, 255, 0), "trousers": (0, 0, 255), "boots": (255, 255, 0),
                "hands": (255, 0, 255), "bits": (0, 255, 255), "head": (255, 128, 0)}
        for n, c in cols.items():
            img[is_(n) if n in REGION_ID else False] = np.array(c) / 255.0
        zb = (R == 0) & (pz != 0)
    elif obj is base:
        h_, s_, v_ = hsv(img)
        tunic, sleeves = is_("tunic"), is_("sleeves")
        sash = tunic & (pz > 1.00) & (pz < 1.23) & (np.abs(px) < 0.30)
        jacket = (tunic & ~sash) | sleeves | is_("bits")
        piping = jacket & (s_ > 0.18) & (v_ > 0.55) & (h_ > 20) & (h_ < 60)
        recolour(img, jacket & ~piping, PAL["jacket"], (0.22, 0.56))
        recolour(img, piping, PAL["braid"], (0.28, 0.5))
        recolour(img, sash, PAL["sash"], (0.45, 0.8))
        recolour(img, is_("trousers"), PAL["trousers"], (0.18, 0.48))
        recolour(img, is_("boots"), PAL["boots"], (0.14, 0.36))
        recolour(img, is_("hands"), (176, 112, 82), (0.35, 0.78))
        # leftover bits of the old garments (unregioned texels that are still covered) take the jacket colour
        other = (R == 0) & (np.abs(pz) > 0) & ~cover
        # --- chest braiding: horizontal frogging across the jacket front (world z bands), toggles in the centre
        front = tunic & (py < -0.02) & (pz > 1.24) & (pz < 1.56) & (np.abs(px) < 0.16)
        spacing, width = 0.034, 0.013
        zz = (pz - 1.26) % spacing
        band = front & (zz < width) & (pz > 1.26)
        end_loop = front & (np.abs(np.abs(px) - 0.13) < 0.011) & (zz < spacing * 0.8)
        braid_col = np.array(PAL["braid"], np.float32) / 255.0
        shade = 0.85 + 0.3 * np.clip(1 - np.abs(zz / width - 0.5) * 2, 0, 1)
        for m in (band, end_loop):
            img[m] = braid_col * shade[m][:, None]
        toggle = front & (np.abs(px) < 0.008) & (zz < width) & (pz > 1.26)
        img[toggle] = np.array(PAL["gold"], np.float32) / 255.0
        # --- wrist wraps: grey bandage on the lower sleeve + hand back, by distance to the wrist bone
        dl = np.linalg.norm(P - WR["l"], axis=-1)
        dr = np.linalg.norm(P - WR["r"], axis=-1)
        dist = np.minimum(dl, dr)
        arm_t = np.where(dl < dr, ((P - WR["l"]) @ ((WR["l"] - EL["l"]) / np.linalg.norm(WR["l"] - EL["l"]))),
                         ((P - WR["r"]) @ ((WR["r"] - EL["r"]) / np.linalg.norm(WR["r"] - EL["r"]))))
        wrap = (is_("sleeves") & (dist < 0.20)) | (is_("hands") & (arm_t < 0.045) & (dist < 0.10))
        wrap &= ~is_("trousers")
        stripe = 0.5 + 0.5 * np.sin(arm_t * 150.0)
        wc = np.array(PAL["sash"], np.float32) / 255.0
        img[wrap] = (wc * (0.78 + 0.22 * stripe[..., None]))[wrap]
        # thin dark edge between wrap turns
        img[wrap & (stripe < 0.12)] = wc * 0.6
    else:   # Idualis02 head
        h_, s_, v_ = hsv(img)
        hair = (v_ < 0.62) & (s_ < 0.28) & (R == REGION_ID["head"])
        recolour(img, hair, PAL["hair"], (0.05, 0.2))
        eyes = (R == REGION_ID["head"]) & (h_ > 190) & (h_ < 290) & (s_ > 0.08) & (v_ > 0.35)
        recolour(img, eyes, PAL["eye"], (0.18, 0.6))
    out = np.concatenate([np.clip(img, 0, 1), A[..., 3:]], -1)
    final = np.ascontiguousarray(out[::-1])
    new = bpy.data.images.new("%s_%s_%s" % (obj.name, TAG, "albedo"), W, H, alpha=True)
    new.pixels.foreach_set(final.ravel())
    new.filepath_raw = os.path.join(OUT, "%s_%s_Albedo.png" % (obj.name, TAG))
    new.file_format = "PNG"
    new.save()
    swap[node] = new
    print("TEXTURE", obj.name, W, H, "covered texels", int(cover.sum()))

for node, new in swap.items():
    node.image = new
bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)

# ---- renders
shots = os.path.join(OUT, "renders")
os.makedirs(shots, exist_ok=True)
lo = Vector((9, 9, 9)); hi = Vector((-9, -9, -9))
for o in (base, head):
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
bs.setup_render(700, 700)
cam = bs.setup_camera(target=Vector((0, 0, 1.62)), ortho_scale=0.85, direction=(0.45, -0.88, 0.1), distance=4)
bs.render_to(os.path.join(shots, "%s_closeup.png" % TAG), cam)
bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(1000, 1300)
try:
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT, "..", "..", "03_blender", "%s_%s.blend" % ("N1_Neophyte", TAG)), compress=True)
except Exception as e:
    print("save failed", e)
print("DONE")
