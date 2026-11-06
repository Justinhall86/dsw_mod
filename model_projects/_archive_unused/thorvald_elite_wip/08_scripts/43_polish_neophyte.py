"""Polish textures for the Ginaz Neophyte (recipe N4_Neophyte).

    blender -b 03_blender/N4_Neophyte.blend --python 43_polish_neophyte.py -- <captain_texture_dir> <captain_tag> <out_dir> <tag>

 - legs/boots (Mercenary) = the polished Captain's textures (<captain_texture_dir>/Mercenary_<n>_<captain_tag>_*.png); the Captain's gold boot-cuff bands become boot leather
 - jacket / sleeves / sash / hands (Raider, original donor texture, 2048): recoloured to the Ginaz palette, then painted with anti-aliased frogging cords (relief),
   pale piping, an opening seam, and grey wrist wraps (ridged); gold toggles are real geometry (hardware.py)
 - head (Idualis02): x2, black hair, skin sampled for the hands
"""
import os
import sys

import bpy
import numpy as np
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import polish_lib as PL  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
CAP_DIR, CAP_TAG, OUT, TAG = os.path.abspath(args[0]), args[1], os.path.abspath(args[2]), args[3]
os.makedirs(OUT, exist_ok=True)
PAL = {"jacket": (92, 32, 52), "piping": (70, 24, 40), "sash": (142, 130, 116), "boots": (66, 54, 50), "hair": (30, 24, 22)}
CORD = np.array((44, 14, 28), np.float32) / 255.0
PIPE = np.array((150, 126, 112), np.float32) / 255.0
WRAP = np.array((142, 130, 116), np.float32) / 255.0

rig = bpy.data.objects["Armature"]
mw = rig.matrix_world
WR = {s: np.array(mw @ rig.data.bones["B_%sWristJ" % s].head_local, np.float32) for s in ("l", "r")}
EL = {s: np.array(mw @ rig.data.bones["B_%sElbowJ" % s].head_local, np.float32) for s in ("l", "r")}

legs = bpy.data.objects["Mercenary"]
fill = bpy.data.objects["RaiderFill_upper"]
head = bpy.data.objects["Idualis02Head"]
names = list(fill["region_names"])
RID = {n: i + 1 for i, n in enumerate(names)}
RID["head"] = 100
RID["legs"] = 200


def region_of(obj, tri):
    if obj is head:
        return RID["head"]
    if obj is legs:
        return RID["legs"]
    attr = obj.data.attributes.get("reg")
    return int(attr.data[tri.vertices[0]].value) if attr else 0


def load_png(path):
    im = bpy.data.images.load(path, check_existing=True)
    return PL.img_to_array(im)


# skin tone from the head texture (for the hands)
head_mat = head.data.materials[0]
a_node, _, _ = PL.material_images(head_mat)
HA = PL.img_to_array(a_node.image)
h_, s_, v_ = PL.hsv(HA[..., :3])
m_ = (h_ > 8) & (h_ < 32) & (s_ > 0.35) & (v_ > 0.45) & (v_ < 0.95)
SKIN = tuple(int(x * 255) for x in np.median(HA[..., :3][m_], axis=0))
print("FACE SKIN", SKIN)

for obj in (legs, fill, head):
    for mi, mat in enumerate(obj.data.materials):
        if mat.name == "Mat_GinazGold":
            continue
        if obj is legs:
            nodes = PL.material_images(mat)
            stem = "Mercenary_%d_%s" % (mi, CAP_TAG)
            A = load_png(os.path.join(CAP_DIR, stem + "_Albedo.png"))
            MG = load_png(os.path.join(CAP_DIR, stem + "_MetallicGlossAO.png"))
            NM = load_png(os.path.join(CAP_DIR, stem + "_Normal.png"))
        else:
            nodes, A, MG, NM = PL.load_material_arrays(mat, 2 if obj is head else 1)
        H, W = A.shape[:2]
        P, R = PL.rasterise(obj, W, H, region_of)[mi]
        fp = PL.footprint(P, R)
        cv = PL.Canvas(A, MG, NM, P, R, fp)
        px, py, pz = P[..., 0], P[..., 1], P[..., 2]
        ax = np.abs(px)
        h0, s0, v0 = PL.hsv(cv.A)
        auto_gold = True
        weave = 0.0
        if obj is legs:
            cuff = (R == RID["legs"]) & (pz < 0.66) & (h0 > 26) & (h0 < 62) & (s0 > 0.38) & (v0 > 0.45)
            cuff = PL.box_blur(cuff.astype(np.float32), 1) > 0.25
            PL.recolour(cv.A, cuff, PAL["boots"], (0.16, 0.34))
            cv.MG[..., 0][cuff] = 0.02          # not metal any more
            cv.MG[..., 1][cuff] = 0.30
            auto_gold = False                   # keep the Captain's metal flags exactly as built
            cv.finalize(relief=0.0, emboss=0.0, ao=0.0, auto_gold=False)
        elif obj is fill:
            tunic, sleeves, bits, hands = (R == RID[k] for k in ("tunic", "sleeves", "bits", "hands"))
            sash = tunic & (pz > 1.00) & (pz < 1.23) & (ax < 0.30)
            jacket = (tunic & ~sash) | sleeves | bits
            piping = jacket & (s0 > 0.18) & (v0 > 0.55) & (h0 > 20) & (h0 < 60)
            PL.recolour(cv.A, jacket & ~piping, PAL["jacket"], (0.20, 0.52))
            PL.recolour(cv.A, piping, PAL["piping"], (0.26, 0.46))
            PL.recolour(cv.A, sash, PAL["sash"], (0.34, 0.62))
            PL.recolour(cv.A, hands, SKIN, (0.30, 0.64))
            hand_skin = (R != 0) & (ax > 0.5) & (h0 > 5) & (h0 < 45) & (s0 > 0.18) & (v0 > 0.45)
            PL.recolour(cv.A, hand_skin, SKIN, (0.30, 0.64))
            front = np.clip((-py - 0.02) / fp + 0.5, 0, 1) * tunic
            # frogging cords: dense bars with end loops, relief, pale piping at the front edges, centre seam
            spacing = 0.027
            zz = (pz - 1.26) % spacing
            band_z = PL.cov_band(pz, 1.255, 1.585, fp)
            bars = PL.cov_stripes(pz, spacing, 0.0150, 1.26 + 0.0075, fp) * PL.cov_band(ax, -0.001, 0.150, fp) * band_z * front
            loops = PL.cov_line(ax - 0.153, 0.0036, fp) * PL.cov_band(zz, -0.001, spacing * 0.90, fp) * band_z * front
            pipes = PL.cov_line(ax - 0.186, 0.0030, fp) * PL.cov_band(pz, 1.245, 1.60, fp) * front
            seam = PL.cov_line(px, 0.0010, fp) * PL.cov_band(pz, 1.25, 1.60, fp) * front
            cv.paint(bars, CORD, 0.0016)
            cv.paint(loops, CORD, 0.0014)
            cv.paint(pipes, PIPE, 0.0010)
            cv.paint(seam * 0.5, CORD * 0.7)
            # wrist wraps: ridged bandage on the lower sleeve and the back of the hand
            dl = np.linalg.norm(P - WR["l"], axis=-1)
            dr = np.linalg.norm(P - WR["r"], axis=-1)
            dist = np.minimum(dl, dr)
            axl = (WR["l"] - EL["l"]) / np.linalg.norm(WR["l"] - EL["l"])
            axr = (WR["r"] - EL["r"]) / np.linalg.norm(WR["r"] - EL["r"])
            arm_t = np.where(dl < dr, (P - WR["l"]) @ axl, (P - WR["r"]) @ axr)
            wrap = np.maximum(sleeves * PL.cov_band(dist, -1, 0.20, fp), hands * PL.cov_band(arm_t, -1, 0.045, fp) * PL.cov_band(dist, -1, 0.10, fp))
            turns = 0.5 + 0.5 * np.sin(arm_t * 150.0)
            cv.paint(wrap, WRAP[None, None, :] * (0.78 + 0.22 * turns[..., None]), 0.0012)
            cv.Hgt = np.maximum(cv.Hgt, wrap * turns * 0.0014)
            cv.paint(wrap * np.clip((0.13 - turns) * 8.0, 0, 1), WRAP * 0.6)
            cv.cloth = (tunic | sleeves).astype(np.float32)
            weave = 0.03
            cv.finalize(relief=1.0, emboss=0.32, ao=0.5, weave=weave)
        else:   # head
            inh = R == RID["head"]
            hair = inh & (v0 < 0.62) & (s0 < 0.28)
            PL.recolour(cv.A, hair, PAL["hair"], (0.05, 0.2))
            cv.finalize(relief=0.0, emboss=0.0, ao=0.0)
        PL.store_material(mat, nodes, cv.arrays(), OUT, "%s_%d_%s" % (obj.name, mi, TAG))
        print("POLISHED", obj.name, mat.name, "%dx%d" % (W, H), "texel %.2f mm" % (fp * 1000))

bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(os.path.join(OUT, "..", "..", "03_blender", "N4_Neophyte_%s.blend" % TAG)), compress=True)
print("DONE")
