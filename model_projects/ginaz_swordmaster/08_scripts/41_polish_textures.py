"""Polish textures for the Ginaz Captain and the Master of Ginaz.

    blender -b 03_blender/C2_Captain_plum.blend --python 41_polish_textures.py -- captain <out_dir> <tag>
    blender -b 03_blender/M2_Master_plum.blend  --python 41_polish_textures.py -- master  <out_dir> <tag>

Input blend = recipe + Ginaz recolour (08_uvdump -> 09_ginaz_recolour -> 10_apply_textures).  This pass upscales every texture, repaints the
decoration with anti-aliased cords/piping/filigree (with relief), flags gold as metal, adds twill to coat and cape, and writes
<out_dir>/<Object>_<n>_<tag>_{Albedo,MetallicGlossAO,Normal}.png.  Also renders a turnaround and close-ups and saves <tag> blend.
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
UNIT, OUT, TAG = args[0], os.path.abspath(args[1]), args[2]
MASTER = UNIT == "master"
os.makedirs(OUT, exist_ok=True)
GOLD = np.array((205, 164, 86), np.float32) / 255.0
GOLD_D = np.array((150, 108, 50), np.float32) / 255.0
SILVER = np.array((160, 156, 150), np.float32) / 255.0
SCALE = {"Mercenary": 2, "RaiderFill_tunic": 1, "GurneyFill_coat": 2, "BannerjeeHead": 2}

mercenary = bpy.data.objects["Mercenary"]
tunic = bpy.data.objects["RaiderFill_tunic"]
coat = bpy.data.objects["GurneyFill_coat"]
head = bpy.data.objects["BannerjeeHead"]
R_TUNIC, R_COAT, R_HEAD, R_CAPE, R_BODY = 1, 2, 3, 4, 5


def dominant_bones(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    return {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}


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




def chain(a, b, fp):
    """Interlaced wave chain: two opposite-phase wavy lines cross to form lens-shaped links (reads as embroidered scrollwork)."""
    return np.maximum(PL.cov_wave(a, b, 0.0200, 0.0030, 0.0062, 0.070, fp),
                      PL.cov_wave(a + 0.0100, b, 0.0200, 0.0030, 0.0062, 0.070, fp, phase=np.pi))


rig = bpy.data.objects["Armature"]
swap_log = []
for obj in (mercenary, tunic, coat, head):
    for mi, mat in enumerate(obj.data.materials):
        if mat.name == "Mat_GinazGold":
            continue
        nodes, A, MG, NM = PL.load_material_arrays(mat, SCALE[obj.name])
        H, W = A.shape[:2]
        P, R = PL.rasterise(obj, W, H, region_of)[mi]
        fp = PL.footprint(P, R)
        cv = PL.Canvas(A, MG, NM, P, R, fp)
        px, py, pz = P[..., 0], P[..., 1], P[..., 2]
        ax = np.abs(px)
        front = np.clip((-py - 0.005) / fp + 0.5, 0, 1)          # soft front-facing mask
        weave = 0.0
        if obj is tunic:
            # clean-up: the donor's tan trim became blotchy gold scribbles after the recolour; the cords/piping below replace it
            h0, s0, v0 = PL.hsv(cv.A)
            blotch = (R == R_TUNIC) & (h0 > 26) & (h0 < 62) & (s0 > 0.30) & (v0 > 0.45)
            PL.recolour(cv.A, PL.box_blur(blotch.astype(np.float32), 1) > 0.2, (66, 24, 38), (0.12, 0.26))
            chest = (R == R_TUNIC) * front
            if MASTER:
                spacing = 0.034
                zz = (pz - 1.27) % spacing
                band_z = PL.cov_band(pz, 1.262, 1.56, fp)
                bars = PL.cov_stripes(pz, spacing, 0.0078, 1.27 + 0.0039, fp) * PL.cov_band(ax, -0.001, 0.150, fp) * band_z * chest
                loops = PL.cov_line(ax - 0.153, 0.0030, fp) * PL.cov_band(zz, -0.001, spacing * 0.80, fp) * band_z * chest
                pipes = PL.cov_line(ax - 0.186, 0.0030, fp) * PL.cov_band(pz, 1.255, 1.60, fp) * chest
                s = np.sin(pz * 120.0) * 0.0055
                vine = np.maximum(PL.cov_line(px - s, 0.0014, fp), PL.cov_line(px + s, 0.0014, fp)) * PL.cov_band(pz, 1.27, 1.55, fp) * chest
                cv.paint(bars, GOLD, 0.0016, True)
                cv.paint(loops, GOLD_D, 0.0013, True)
                cv.paint(pipes, GOLD, 0.0013, True)
                cv.paint(vine, GOLD_D, 0.0008, True)
            else:
                pipes = PL.cov_line(ax - 0.186, 0.0026, fp) * PL.cov_band(pz, 1.255, 1.60, fp) * chest
                top = PL.cov_line(pz - 1.262, 0.0022, fp) * PL.cov_band(ax, 0.0, 0.19, fp) * chest
                seam = PL.cov_line(px, 0.0012, fp) * PL.cov_band(pz, 1.265, 1.58, fp) * chest
                cv.paint(pipes, GOLD, 0.0012, True)
                cv.paint(top, GOLD, 0.0012, True)
                cv.paint(seam * 0.55, np.array((0.16, 0.06, 0.10), np.float32), 0.0)
            cv.cloth = (R == R_TUNIC).astype(np.float32)
            weave = 0.035
        elif obj is coat:
            panel = (R == R_COAT) * front
            opening = PL.cov_line(ax - 0.030, 0.0030, fp) * PL.cov_band(pz, 0.50, 1.02, fp) * panel
            hem1 = PL.cov_line(pz - 0.515, 0.0030, fp) * (R == R_COAT)
            hem2 = PL.cov_line(pz - 0.540, 0.0016, fp) * (R == R_COAT)
            cv.paint(opening, GOLD, 0.0013, True)
            cv.paint(hem1, GOLD, 0.0013, True)
            cv.paint(hem2, GOLD_D, 0.0008, True)
            if MASTER:
                fil_edge = chain(ax, pz, fp) * PL.cov_band(ax, 0.037, 0.085, fp) * PL.cov_band(pz, 0.58, 1.0, fp) * panel
                fil_hem = chain(pz, px, fp) * PL.cov_band(pz, 0.552, 0.70, fp) * (R == R_COAT)
                cv.paint(np.maximum(fil_edge, fil_hem), GOLD, 0.0011, True)
            cv.cloth = (R == R_COAT).astype(np.float32)
            weave = 0.035
        elif obj is mercenary:
            if MASTER:
                cape = (R == R_CAPE)
                h0, s0, v0 = PL.hsv(cv.A)
                yoke = ((R == R_CAPE) | (R == R_BODY)) & (py > 0.0) & (pz > 1.15) & (h0 > 26) & (h0 < 62) & (s0 > 0.30) & (v0 > 0.45)
                PL.recolour(cv.A, PL.box_blur(yoke.astype(np.float32), 1) > 0.2, (92, 32, 52), (0.14, 0.34))
                fil = chain(pz, px, fp) * PL.cov_band(pz, 0.735, 0.94, fp) * cape
                l1 = PL.cov_line(pz - 0.72, 0.0030, fp) * cape
                l2 = PL.cov_line(pz - 0.96, 0.0030, fp) * cape
                cv.paint(np.maximum(fil, np.maximum(l1, l2)), GOLD, 0.0012, True)
                cv.cloth = cape.astype(np.float32)
                weave = 0.035
        else:   # head
            if MASTER:
                h_, s_, v_ = PL.hsv(cv.A)
                hair = ((v_ < 0.62) & (s_ < 0.30) & (R == R_HEAD)).astype(np.float32)
                streak = PL.cov_band(px, -0.038, -0.006, fp) * PL.cov_band(pz, 1.84, 2.1, fp)
                temples = PL.cov_band(ax, 0.055, 0.2, fp) * PL.cov_band(pz, 1.79, 1.88, fp)
                beard = PL.cov_band(pz, 1.5, 1.775, fp) * np.maximum(PL.cov_line(px, 0.010, fp), PL.cov_line(ax - 0.043, 0.006, fp))
                for c in (streak, temples, beard):
                    cv.paint(c * hair, SILVER * (0.85 + 0.3 * v_[..., None]))
        cv.finalize(relief=1.0, emboss=0.32, ao=0.5, weave=weave)
        paths = PL.store_material(mat, nodes, cv.arrays(), OUT, "%s_%d_%s" % (obj.name, mi, TAG))
        swap_log.append((obj.name, mat.name, W, H, round(fp * 1000, 2)))
        print("POLISHED", obj.name, mat.name, "%dx%d" % (W, H), "texel %.2f mm" % (fp * 1000), "gold %.1f%%" % (100 * float((cv.gold > 0.5).mean())))

bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
shots = os.path.join(OUT, "renders")
os.makedirs(shots, exist_ok=True)
objs = [o for o in bpy.data.objects if o.type == "MESH"]
lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in objs:
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
for name, tgt, sc_, d in (("closeup", (0, 0, 1.62), 0.85, (0.45, -0.88, 0.1)), ("chest", (0, 0, 1.38), 0.7, (0, -1, 0.1)),
                          ("hem", (0, 0, 0.75), 1.0, (0.3, -0.95, 0.05)), ("capeback", (0, 0, 1.1), 1.2, (0.2, 1, 0.1))):
    bs.setup_render(800, 800)
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc_, direction=d, distance=4)
    bs.render_to(os.path.join(shots, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(1000, 1300)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(os.path.join(OUT, "..", "..", "03_blender", "%s_%s.blend" % ("C2_Captain" if not MASTER else "M2_Master", TAG))), compress=True)
print("DONE")
