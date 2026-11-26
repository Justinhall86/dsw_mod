"""Ronin helm: ten whole-unit variations built on R18 (owner request 2026-11-19: "10 different versions ... as creative as you want,
really smooth and really cool"). STUDY ONLY: never install, export or pack.

    blender -b ../../03_blender/helmet_study/ronin_R18.blend --python r20_variants.py -- V01

R18's textures are grey except the copper, so copper = coloured pixels. Each variant:
  armour  : grey value g -> clip(g * k * tint + lift)              (k, tint, lift)
  copper  : existing copper * per-channel ratio (gold, brighter)     (cu)
  shading : Metallic / Roughness of armour and copper (copper mask image drives the mix)
  extras  : glowing visor glass, weapons recoloured to the palette, shield removed, helmet scale
Out: 03_blender/helmet_study/variants/ronin_<V>.blend, 02_progress_photos/51_ronin_variants/<V>/*.png"""
import os, sys, bpy
import numpy as np
from mathutils import Vector, Matrix
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "helmet_study"))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

V = sys.argv[sys.argv.index("--") + 1]
CU_GOLD = (1.03, 1.07, 0.62)
VARS = {
    # k/tint/lift: armour grey -> colour; a_m/a_r: armour metal/rough (None = keep R18); a_spec: specular x (dark armour needs less
    # sky sheen to read dark); cu: copper per-channel ratio; cu_g: copper gamma (deeper base for metallic copper, which mirrors the sky)
    "V01": dict(name="Ronin, polished inlays", cu_m=0.85, cu_r=0.35, cu_g=1.6),
    "V02": dict(name="Nightblade", k=0.5, a_spec=0.3, cu=(1.06, 1.04, 1.02), cu_m=0.3, cu_r=0.5),
    "V03": dict(name="Steel Ronin", k=1.2, lift=0.12, tint=(0.95, 0.98, 1.04), a_m=0.65, a_r=0.32, cu_m=0.8, cu_r=0.35, cu_g=1.6),
    "V04": dict(name="Blued Steel", k=1.0, tint=(0.6, 0.8, 1.2), a_m=0.55, a_r=0.35, cu_m=0.8, cu_r=0.35, cu_g=1.6),
    "V05": dict(name="Gilded Shogun", k=0.6, a_spec=0.5, cu=CU_GOLD, cu_g=1.4, cu_m=0.85, cu_r=0.3, weapons=True),
    "V06": dict(name="Oxblood Lacquer", k=0.85, tint=(1.45, 0.48, 0.45), a_r=0.22, cu_m=0.8, cu_r=0.35, cu_g=1.6),
    "V07": dict(name="Ember Eyes", k=0.5, a_spec=0.3, cu_m=0.3, cu_r=0.5, glow=(1.0, 0.42, 0.12), glow_s=6.0),
    "V08": dict(name="Unified Arms", cu_m=0.8, cu_r=0.35, cu_g=1.6, weapons=True),
    "V09": dict(name="Black Chrome", k=0.42, a_m=0.9, a_r=0.2, cu_m=0.85, cu_r=0.3, cu_g=1.5, weapons=True),
    "V10": dict(name="Duelist (no shield, big helm)", cu_m=0.8, cu_r=0.35, cu_g=1.6, weapons=True, no_shield=True, helm_k=1.10,
                glow=(1.0, 0.42, 0.12), glow_s=3.0),
    # owner 2026-11-20 on V03: mask plates Light copper -> Antique copper (apron #855645); inlays and studs -> Gunmetal #2c2d2e
    "V11": dict(name="Steel Ronin 2", k=1.2, lift=0.12, tint=(0.95, 0.98, 1.04), a_m=0.65, a_r=0.32, mask_cu="855645", inlay="2c2d2e"),
    # owner 2026-11-20: crescent, glaive and shield in the same antique copper as the apron and mask; run on the cleaned helmet (R20b+)
    "V12": dict(name="Steel Ronin 3", k=1.2, lift=0.12, tint=(0.95, 0.98, 1.04), a_m=0.65, a_r=0.32, mask_cu="855645", inlay="2c2d2e",
                crescent="855645", weapons=True, wcu_to="855645", smooth_all=35),
}
C = VARS[V]
OUT = P.ELITE + "/02_progress_photos/51_ronin_variants/%s/" % V
TEX = P.ELITE + "/04_textures/helmet_study/ronin/variants/%s/" % V
os.makedirs(OUT, exist_ok=True)
os.makedirs(TEX, exist_ok=True)
WEAP = ("Thorvald_Glaive", "Thorvald_TowerShield")


def hexsrgb(h):
    return np.array([int(h[i:i + 2], 16) / 255 for i in (0, 2, 4)])


def _gblur(a, sig):
    r = int(3 * sig + 1)
    k = np.exp(-0.5 * (np.arange(-r, r + 1) / sig) ** 2)
    k /= k.sum()
    for ax in (0, 1):
        a = np.apply_along_axis(lambda m: np.convolve(np.pad(m, r, mode="edge"), k, mode="valid"), ax, a)
    return a


def img_arr(im):
    w, h = im.size
    return np.array(im.pixels[:]).reshape(h, w, 4)


def new_img(name, a, noncolor=False):
    h, w = a.shape[:2]
    im = bpy.data.images.new(name, w, h, alpha=True)
    im.pixels[:] = np.clip(a, 0, 1).ravel()
    if noncolor:
        im.colorspace_settings.name = "Non-Color"
    im.filepath_raw = TEX + name + ".png"
    im.file_format = "PNG"
    im.save()
    im.pack()
    return im


rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")

# ---------- weapons: original paint -> grey + the palette's copper on their orange/red parts (V05/V08/V09/V10)
SH, MD, HL = hexsrgb("6e3e2d"), hexsrgb("c49684"), hexsrgb("efbda9")
if C.get("weapons"):
    for wn in WEAP:
        if wn not in bpy.data.objects:
            continue
        m = bpy.data.objects[wn].active_material
        n = next(n for n in m.node_tree.nodes if n.type == "TEX_IMAGE" and n.image)
        a = img_arr(n.image)
        r, g, b = a[..., 0], a[..., 1], a[..., 2]
        gy = r * 0.2126 + g * 0.7152 + b * 0.0722
        cm = _gblur(((r > g * 1.25) & (r > b * 1.4) & (r > 0.18)).astype(float), 1.2)
        out = a.copy()
        out[..., :3] = (gy * C.get("k", 1.0))[..., None] * np.array(C.get("tint", (1, 1, 1))) + C.get("lift", 0)
        if (cm > 0.5).any():
            lo, hi = np.percentile(gy[cm > 0.5], [3, 97])
            t = np.clip((gy - lo) / max(hi - lo, 1e-3), 0, 1)[..., None]
            ramp = np.where(t < 0.5, SH + (MD - SH) * t * 2, MD + (HL - MD) * (t * 2 - 1)) ** C.get("cu_g", 1.0) * np.array(C.get("cu", (1, 1, 1)))
            if C.get("wcu_to"):
                # weapon copper = the apron's antique copper (median moved to that hex, ramp shading kept)
                ramp = np.clip(ramp * hexsrgb(C["wcu_to"]) / np.median(ramp.reshape(-1, 3)[(cm > 0.9).ravel()], axis=0), 0, 1)
            out[..., :3] = out[..., :3] * (1 - cm[..., None]) + ramp * cm[..., None]
        n.image = new_img("W_" + wn, out)
        wci = new_img("WCu_" + wn, np.dstack([cm] * 3 + [np.ones_like(cm)]), noncolor=True)
        wb = m.node_tree.nodes["Principled BSDF"]
        wb.inputs["Roughness"].default_value = 0.45
        if C.get("wcu_to"):
            # copper parts matte like the mask (0.2 / 0.6), steel parts keep the weapon's metal
            wn_ = m.node_tree.nodes.new("ShaderNodeTexImage")
            wn_.image = wci
            for sock, cv in (("Metallic", 0.2), ("Roughness", 0.6)):
                mr = m.node_tree.nodes.new("ShaderNodeMapRange")
                mr.inputs["To Min"].default_value = wb.inputs[sock].default_value
                mr.inputs["To Max"].default_value = cv
                m.node_tree.links.new(wn_.outputs["Color"], mr.inputs["Value"])
                m.node_tree.links.new(mr.outputs["Result"], wb.inputs[sock])

if C.get("no_shield") and "Thorvald_TowerShield" in bpy.data.objects:
    bpy.data.objects.remove(bpy.data.objects["Thorvald_TowerShield"], do_unlink=True)

# ---------- glass mask for the visor (from the vanilla Ranger albedo still in the blend: its green glass)
glass_img = None
if C.get("glow"):
    mm = bpy.data.materials["Mat_RangerMaskCopper"]
    orig = next(n.image for n in mm.node_tree.nodes if n.type == "TEX_IMAGE" and n.image and n.image.name.startswith("AtreideRanger_Albedo"))
    a = img_arr(orig)
    gr = ((a[..., 1] > a[..., 0] * 1.12) & (a[..., 1] > a[..., 2] * 0.95)).astype(float)
    gr = _gblur(gr, 1.2) * np.clip(a[..., :3].mean(-1) * 2.2, 0.3, 1.0)       # keep the painted glass shading
    glass_img = new_img("Glass_" + V, np.dstack([gr * C["glow"][0], gr * C["glow"][1], gr * C["glow"][2], np.ones_like(gr)]))

# ---------- body, helmet, mask: recolour albedo and drive metal / roughness with a copper mask
done = {}
for m in {sl.material for o in bpy.data.objects if o.type == "MESH" and not o.name.startswith(WEAP) for sl in o.material_slots if sl.material}:
    nt = m.node_tree
    bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
    lk = bsdf.inputs["Base Color"].links
    if not lk or lk[0].from_node.type != "TEX_IMAGE":
        continue
    tn = lk[0].from_node
    key = tn.image.name
    # the mask, apron and helmet crescent keep R18's calibrated copper (matte, mask = apron: owner fix 2026-11-19); only the
    # copper inlays/studs on the armour get the variant's polished metal. Mask and apron also keep their own (cloth/visor) shading.
    keep_cu = m.name in ("Mat_RangerMaskCopper", "Mat_DuncanSash", "Mat_RoninHelm")
    keep_all = m.name in ("Mat_RangerMaskCopper", "Mat_DuncanSash")
    cu_g = 1.0 if keep_cu else C.get("cu_g", 1.0)
    if key not in done:
        a = img_arr(tn.image)
        rgb = a[..., :3]
        sat = rgb.max(-1) - rgb.min(-1)
        cm = np.clip(_gblur(sat, 0.8) / 0.12, 0, 1)
        g = rgb[..., 0] * 0.2126 + rgb[..., 1] * 0.7152 + rgb[..., 2] * 0.0722
        arm = np.clip((g * C.get("k", 1.0))[..., None] * np.array(C.get("tint", (1, 1, 1))) + C.get("lift", 0), 0, 1)
        cu = np.clip(rgb ** cu_g * np.array(C.get("cu", (1, 1, 1))), 0, 1)
        sel = cm > 0.9
        if C.get("mask_cu") and m.name == "Mat_RangerMaskCopper" and sel.any():
            # owner 2026-11-20: mask plates -> the apron's antique copper (median shifted to that hex, painted shading kept)
            cu = np.clip(cu * hexsrgb(C["mask_cu"]) / np.median(cu[sel], axis=0), 0, 1)
        if C.get("inlay") and not keep_cu and sel.any():
            # owner 2026-11-20: armour inlays and studs -> gunmetal (copper's light/dark shading kept as a value ratio)
            lum = cu @ np.array([0.2126, 0.7152, 0.0722])
            cu = np.clip(hexsrgb(C["inlay"]) * (lum / np.median(lum[sel]))[..., None], 0, 1)
        out = a.copy()
        out[..., :3] = arm * (1 - cm[..., None]) + cu * cm[..., None]
        done[key] = (new_img("V_" + key.split(".")[0], out),
                     new_img("Cu_" + key.split(".")[0], np.dstack([cm] * 3 + [np.ones_like(cm)]), noncolor=True))
    alb, cmi = done[key]
    tn.image = alb
    # copper mask node (same UV as the albedo)
    cn = nt.nodes.new("ShaderNodeTexImage")
    cn.image = cmi
    m0, r0 = bsdf.inputs["Metallic"].default_value, bsdf.inputs["Roughness"].default_value
    a_m0 = m0 if C.get("a_m") is None or keep_all else C["a_m"]
    a_r0 = r0 if C.get("a_r") is None or keep_all else C["a_r"]
    c_m0 = m0 if keep_cu else a_m0 if C.get("inlay") else C.get("cu_m", a_m0)
    c_r0 = r0 if keep_cu else a_r0 if C.get("inlay") else C.get("cu_r", a_r0)
    for sock, av, cv in (("Metallic", a_m0, c_m0), ("Roughness", a_r0, c_r0)):
        for l in list(bsdf.inputs[sock].links):
            nt.links.remove(l)
        mr = nt.nodes.new("ShaderNodeMapRange")
        mr.inputs["To Min"].default_value = av
        mr.inputs["To Max"].default_value = cv
        nt.links.new(cn.outputs["Color"], mr.inputs["Value"])
        nt.links.new(mr.outputs["Result"], bsdf.inputs[sock])
    if C.get("a_spec") is not None and not keep_all:
        sp = bsdf.inputs["Specular IOR Level"]
        if sp.links:
            mul = nt.nodes.new("ShaderNodeMath")
            mul.operation = "MULTIPLY"
            mul.inputs[1].default_value = C["a_spec"]
            nt.links.new(sp.links[0].from_socket, mul.inputs[0])
            nt.links.new(mul.outputs[0], sp)
        else:
            sp.default_value *= C["a_spec"]
    if glass_img is not None and m.name == "Mat_RangerMaskCopper":
        gn = nt.nodes.new("ShaderNodeTexImage")
        gn.image = glass_img
        nt.links.new(gn.outputs["Color"], bsdf.inputs["Emission Color"])
        bsdf.inputs["Emission Strength"].default_value = C["glow_s"]

# ---------- smooth shading everywhere (the hand-built shield and glaive were flat-shaded: faceted); hard corners above the angle stay sharp
if C.get("smooth_all"):
    import math
    for o in bpy.data.objects:
        if o.type == "MESH":
            for p_ in o.data.polygons:
                p_.use_smooth = True
            o.data.set_sharp_from_angle(angle=math.radians(C["smooth_all"]))

# ---------- separate crescent (r10 SPLIT_HORN): solid colour material
if C.get("crescent") and "Kit_ronincrescent" in bpy.data.objects:
    cbs = bpy.data.objects["Kit_ronincrescent"].active_material.node_tree.nodes["Principled BSDF"]
    cg = np.array(C.get("crescent_gain", (1, 1, 1)))
    cbs.inputs["Base Color"].default_value = list(np.clip(hexsrgb(C["crescent"]) * cg, 0, 1) ** 2.2) + [1]
    cbs.inputs["Metallic"].default_value = 0.2
    cbs.inputs["Roughness"].default_value = 0.6

# ---------- helmet scale (about the helmet's own centre, mask moves with it)
if C.get("helm_k"):
    helm, mask = bpy.data.objects["Kit_roninhelm"], bpy.data.objects["Kit_rangermask"]
    hv = [v.co for v in helm.data.vertices]
    c = Vector([(min(p[i] for p in hv) + max(p[i] for p in hv)) / 2 for i in range(3)])
    c.z = min(p.z for p in hv)   # grow up and out from the neck line, not into the shoulders
    for o in (helm, mask):
        for v in o.data.vertices:
            v.co = c + (v.co - c) * C["helm_k"]
        o.data.update()

os.makedirs(P.ELITE + "/03_blender/helmet_study/variants", exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=P.ELITE + "/03_blender/helmet_study/variants/ronin_%s.blend" % V)

# ---------- renders: same light as R18 (game-like matte grey sky)
rig.data.pose_position = "REST"
for o in [o for o in bpy.data.objects if o.type in ("LIGHT", "CAMERA")]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
kit = [bpy.data.objects["Kit_roninhelm"], bpy.data.objects["Kit_rangermask"]]
hv = [o.matrix_world @ v.co for o in kit for v in o.data.vertices]
hcen = Vector([(min(p[i] for p in hv) + max(p[i] for p in hv)) / 2 for i in range(3)])
hsz = max(max(p[i] for p in hv) - min(p[i] for p in hv) for i in range(3))
bs.setup_render(500, 500)
for tg, d in (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.12)), ("side", (1, 0, 0.05))):
    cam = bs.setup_camera(target=hcen, ortho_scale=hsz * 1.3, direction=d, distance=4)
    bs.render_to(OUT + "head_" + tg + ".png", cam)
    bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(600, 800)
for tg, d in (("full_front", (0, -1, 0.1)), ("full_tq", (0.7, -0.7, 0.2)), ("full_back", (0.3, 1, 0.15)), ("full_tqL", (-0.7, -0.7, 0.2))):
    cam = bs.setup_camera(target=Vector((0, 0, 1.15)), ortho_scale=2.7, direction=d, distance=8)
    bs.render_to(OUT + "body_" + tg + ".png", cam)
    bpy.data.objects.remove(cam, do_unlink=True)
# RTS view: steep camera from far (judged downscaled in the sheet)
bs.setup_render(400, 400)
cam = bs.setup_camera(target=Vector((0, 0, 1.0)), ortho_scale=2.6, direction=(0.55, -0.55, 0.9), distance=10)
bs.render_to(OUT + "rts.png", cam)
print("VARIANT DONE", V, C["name"])
