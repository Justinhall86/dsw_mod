"""Neophyte textures (N2: Captain legs + Raider jacket + Idualis02 head): recolour per body region and paint by 3D position.

    blender -b 03_blender/N2_Neophyte.blend --python 21_neophyte_textures.py -- <out_dir> <tag>

How it works (reusable for any unit):
  1. For every material image, rasterise each triangle's UV footprint into per-texel arrays: 3D rest-pose position (P) and a body
     region id (R).  Regions come from the 'reg' vertex attribute that 03_variants.py writes (island ids -> names) and from the object.
  2. Recolour: hue + saturation replaced, painted value kept and compressed.
  3. Paint: patterns are functions of the 3D position (chest braids = horizontal bands in world z across the jacket front, wrist wraps =
     distance to the wrist bone), so they land correctly on whatever UV layout the donor has.
  4. Legs/boots keep the Ginaz Captain's recoloured textures (04_textures/shared), except the gold boot cuffs -> boot leather.
  5. Eyes: the Idualis02 glowing blue eyeball meshes are removed in the recipe (no "Eyes of Ibad"), the painted eyes remain.
  6. Swap the images into the materials, pack, render turnaround + close-ups, save the blend.
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

PAL = {
    "jacket": (92, 32, 52),       # Ginaz wine: the same coat colour as the Captain
    "braid": (52, 20, 32),        # dark wine frogging
    "piping": (70, 24, 40),
    "sash": (142, 130, 116),      # grey-beige sash and wraps
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


SHARED = os.path.join(HERE, "..", "04_textures", "shared")
GINAZ_LEGS = {"Mat_Mercenary": "Smuggler_Mercenary_Ginaz_Albedo.png", "Mat_Base": "Smuggler_Base_Ginaz_Albedo.png"}

base = bpy.data.objects["Mercenary"]
# v2 additions: denser braiding, sash tail (modelled in the recipe, textured by the sash recolour), hand skin sampled from the face
fill = bpy.data.objects["RaiderFill_upper"]
head = bpy.data.objects["Idualis02Head"]
names = list(fill["region_names"])
REGION_ID = {n: i + 1 for i, n in enumerate(names)}
REGION_ID["head"] = 100
REGION_ID["legs"] = 200


def region_of(obj, tri):
    if obj is head:
        return REGION_ID["head"]
    if obj is base:
        return REGION_ID["legs"]
    attr = obj.data.attributes.get("reg")
    return int(attr.data[tri.vertices[0]].value) if attr else 0


def face_skin():
    node, A = image_array(head.data.materials[0])
    h_, s_, v_ = hsv(A[..., :3])
    m = (h_ > 8) & (h_ < 32) & (s_ > 0.35) & (v_ > 0.45) & (v_ < 0.95)
    return tuple(int(x * 255) for x in np.median(A[..., :3][m], axis=0))


SKIN = face_skin()
print("FACE SKIN", SKIN)
swap = []
for obj in (base, fill, head):
    rast_cache = {}
    for mi, mat in enumerate(obj.data.materials):
        node, A = image_array(mat)
        if obj is base:
            A = load_pixels(os.path.join(SHARED, GINAZ_LEGS[mat.name]))
        H, W = A.shape[:2]
        rast = rasterise(obj, W, H, region_of)
        P, R = rast[mi]
        img = A[..., :3].copy()
        is_ = lambda n: R == REGION_ID[n]
        px, py, pz = P[..., 0], P[..., 1], P[..., 2]
        h_, s_, v_ = hsv(img)
        if obj is base:
            # the Captain's gold boot-cuff bands do not belong on a trainee: gold/yellow texels low on the leg -> boot leather
            cuff = (R == REGION_ID["legs"]) & (pz < 0.66) & (h_ > 28) & (h_ < 62) & (s_ > 0.40) & (v_ > 0.45)
            recolour(img, cuff, PAL["boots"], (0.16, 0.34))
            print("CUFF texels", int(cuff.sum()), mat.name)
        elif obj is fill:
            tunic, sleeves = is_("tunic"), is_("sleeves")
            sash = tunic & (pz > 1.00) & (pz < 1.23) & (np.abs(px) < 0.30)
            jacket = (tunic & ~sash) | sleeves | is_("bits")
            piping = jacket & (s_ > 0.18) & (v_ > 0.55) & (h_ > 20) & (h_ < 60)
            recolour(img, jacket & ~piping, PAL["jacket"], (0.20, 0.52))
            recolour(img, piping, PAL["piping"], (0.26, 0.46))
            recolour(img, sash, PAL["sash"], (0.34, 0.62))
            recolour(img, is_("hands"), SKIN, (0.30, 0.64))
            # the visible hands live in the sleeve islands too: any skin-hued texel out at the end of the arms (|x| > 0.5) -> the face's tan
            hand_skin = (R != 0) & (np.abs(px) > 0.5) & (h_ > 5) & (h_ < 45) & (s_ > 0.18) & (v_ > 0.45)
            recolour(img, hand_skin, SKIN, (0.30, 0.64))
            print("HAND skin texels", int(hand_skin.sum()))
            # chest braiding (v2): dense dark-wine frogging, loops at both ends of every bar, pale vertical piping, gold toggles
            front = tunic & (py < -0.02) & (pz > 1.245) & (pz < 1.58) & (np.abs(px) < 0.175)
            spacing, width = 0.027, 0.0165
            zz = (pz - 1.26) % spacing
            band = front & (zz < width) & (pz > 1.26) & (np.abs(px) < 0.150)
            loop_l = front & (np.abs(np.abs(px) - 0.150) < 0.0075) & (zz < spacing * 0.9) & (pz > 1.26)
            braid_col = np.array((44, 14, 28), np.float32) / 255.0
            shade = 0.85 + 0.55 * np.clip(1 - np.abs(zz / width - 0.5) * 2, 0, 1)
            for m in (band, loop_l):
                img[m] = np.clip(braid_col * shade[m][:, None], 0, 1)
            pipe = tunic & (py < -0.02) & (pz > 1.245) & (pz < 1.60) & (np.abs(np.abs(px) - 0.185) < 0.0055)
            img[pipe] = np.array((150, 126, 112), np.float32) / 255.0
            tog = front & (np.abs(px) < 0.0085) & (zz < width) & (pz > 1.26)
            img[tog] = np.array(PAL["gold"], np.float32) / 255.0
            # wrist wraps: grey bandage on the lower sleeve and the back of the hand (distance to the wrist bone)
            dl = np.linalg.norm(P - WR["l"], axis=-1)
            dr = np.linalg.norm(P - WR["r"], axis=-1)
            dist = np.minimum(dl, dr)
            axl = (WR["l"] - EL["l"]) / np.linalg.norm(WR["l"] - EL["l"])
            axr = (WR["r"] - EL["r"]) / np.linalg.norm(WR["r"] - EL["r"])
            arm_t = np.where(dl < dr, (P - WR["l"]) @ axl, (P - WR["r"]) @ axr)
            wrap = (sleeves & (dist < 0.20)) | (is_("hands") & (arm_t < 0.045) & (dist < 0.10))
            stripe = 0.5 + 0.5 * np.sin(arm_t * 150.0)
            wc = np.array(PAL["sash"], np.float32) / 255.0
            img[wrap] = (wc * (0.78 + 0.22 * stripe[..., None]))[wrap]
            img[wrap & (stripe < 0.12)] = wc * 0.6
        else:   # Idualis02 head: hair black, the glowing blue eyes -> normal brown eyes
            inh = R == REGION_ID["head"]
            recolour(img, inh & (v_ < 0.62) & (s_ < 0.28), PAL["hair"], (0.05, 0.2))
            # (the glowing blue eyeball meshes - islands 33/34 - are removed in the recipe; the face keeps its painted brown-grey eyes)
        out = np.concatenate([np.clip(img, 0, 1), A[..., 3:]], -1)
        final = np.ascontiguousarray(out[::-1])
        new = bpy.data.images.new("%s_%d_%s" % (obj.name, mi, TAG), W, H, alpha=True)
        new.pixels.foreach_set(final.ravel())
        new.filepath_raw = os.path.join(OUT, "%s_%d_%s_Albedo.png" % (obj.name, mi, TAG))
        new.file_format = "PNG"
        new.save()
        swap.append((node, new))
        print("TEXTURE", obj.name, mat.name, W, H)

for node, new in swap:
    node.image = new
bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)

shots = os.path.join(OUT, "renders")
os.makedirs(shots, exist_ok=True)
lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in (base, fill, head):
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
cam = bs.setup_camera(target=Vector((0, 0, 1.30)), ortho_scale=0.9, direction=(0.0, -1.0, 0.1), distance=4)
bs.render_to(os.path.join(shots, "%s_chest.png" % TAG), cam)
bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(1000, 1300)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(os.path.join(OUT, "..", "..", "03_blender", "N3_NeophyteV2_%s.blend" % TAG)), compress=True)
print("DONE")
