"""v2 upscale, step 2: UV-unwrap elite_lo and bake 2048px textures from elite_hi (Cycles, GUI Blender via the bridge).

ALBEDO: not from vertex colours any more. The dense sculpt gets a material that samples the CLEANED reference render
(04_textures/reference_cleaned.png) through three orthographic projections (front/back/side, calibrated by silhouette
fitting: 605 px/m, soles at image row 1442), weighted per vertex by the "VW" attribute (visible + facing). Vertices no view can
see fall back to the old vertex colour "Col". The bake then transfers those pixels to the low-poly UV atlas.
Also bakes: tangent normal map, metal/gloss (class colours -> MG), ambient occlusion. Writes RGBA PNGs (alpha 255).
"""
import math, os
import bpy
import numpy as np

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite"
TEX = os.path.join(PROJ, "04_textures", "v2_2048")
os.makedirs(TEX, exist_ok=True)
SIZE = 2048
REF = os.path.join(PROJ, "04_textures", "reference_cleaned.png")
IW, IH = 2528.0, 1696.0
S, CX_F, CX_B, CX_S, ROW0 = 605.0, 563.0, 1480.0, 2162.0, 1442.0
V0 = (IH - ROW0) / IH                                 # image v of z = 0
hi, lo = bpy.data.objects["elite_hi"], bpy.data.objects["elite_lo"]
hi.hide_viewport = False; hi.hide_render = False; hi.hide_set(False)
lo.hide_viewport = False; lo.hide_render = False; lo.hide_set(False)
sc = bpy.context.scene

# ------------------------------------------------ 1. metal / gloss classes on the dense mesh (unchanged recipe)
me = hi.data; n = len(me.vertices)
srgb = np.load(os.path.join(PROJ, "08_scripts", "intermediate_data", "elite_hi_col_srgb.npy"))
luma = srgb @ np.array([0.30, 0.59, 0.11]); rb = srgb[:, 0] - srgb[:, 2]
mx, mn = srgb.max(1), srgb.min(1); sat = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
gold = (rb > 0.20) & (sat > 0.35) & (luma > 0.30); cream = (~gold) & (rb > 0.05) & (luma > 0.45); dark = (~gold) & (~cream) & (luma < 0.16)
mg = np.tile(np.array([0.65, 0.45]), (n, 1)); mg[gold] = (0.75, 0.55); mg[cream] = (0.0, 0.15); mg[dark] = (0.10, 0.22)
mgc = me.color_attributes.get("MG") or me.color_attributes.new("MG", "FLOAT_COLOR", "POINT")
mgc.data.foreach_set("color", np.concatenate([mg, np.ones((n, 2))], 1).astype(np.float32).ravel())

# ------------------------------------------------ 2. UV unwrap the low-poly
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); bpy.context.view_layer.objects.active = lo
bpy.ops.object.mode_set(mode="EDIT"); bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(66), island_margin=0.003, area_weight=0.0, correct_aspect=True)
bpy.ops.uv.pack_islands(margin=0.003)
bpy.ops.object.mode_set(mode="OBJECT")
print("UV layers:", [u.name for u in lo.data.uv_layers])

# ------------------------------------------------ 3. bake setup
sc.render.engine = "CYCLES"; sc.cycles.device = "CPU"; sc.cycles.samples = 32; sc.cycles.use_denoising = False
b = sc.render.bake
b.use_selected_to_active = True; b.cage_extrusion = 0.03; b.max_ray_distance = 0.08
b.margin = 16; b.margin_type = "EXTEND"; b.target = "IMAGE_TEXTURES"; b.use_clear = True; b.normal_space = "TANGENT"


def make_attr_material(name, attr):
    mat = bpy.data.materials.new(name); mat.use_nodes = True; nt = mat.node_tree; nt.nodes.clear()
    a = nt.nodes.new("ShaderNodeAttribute"); a.attribute_name = attr
    e = nt.nodes.new("ShaderNodeEmission"); o = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(a.outputs["Color"], e.inputs["Color"]); nt.links.new(e.outputs["Emission"], o.inputs["Surface"])
    return mat


def make_projection_material():
    mat = bpy.data.materials.new("hi_projection"); mat.use_nodes = True; nt = mat.node_tree; nt.nodes.clear()
    N = nt.nodes; L = nt.links
    ref = bpy.data.images.get("reference_cleaned.png") or bpy.data.images.load(REF)
    ref.reload()
    ref.colorspace_settings.name = "sRGB"
    tc = N.new("ShaderNodeTexCoord"); sep = N.new("ShaderNodeSeparateXYZ"); L.new(tc.outputs["Object"], sep.inputs["Vector"]) if False else L.new(tc.outputs["Object"], sep.inputs["Vector"])

    def view(name, ucomp, scale_u, loc_u):
        comb = N.new("ShaderNodeCombineXYZ"); L.new(sep.outputs[ucomp], comb.inputs["X"]); L.new(sep.outputs["Z"], comb.inputs["Y"])
        mp = N.new("ShaderNodeMapping"); mp.vector_type = "POINT"
        mp.inputs["Location"].default_value = (loc_u / IW, V0, 0.0); mp.inputs["Scale"].default_value = (scale_u / IW, S / IH, 1.0)
        L.new(comb.outputs["Vector"], mp.inputs["Vector"])
        im = N.new("ShaderNodeTexImage"); im.image = ref; im.interpolation = "Linear"; im.extension = "EXTEND"; im.label = name
        L.new(mp.outputs["Vector"], im.inputs["Vector"])
        return im.outputs["Color"]

    # front: u = (563 + 605 x)/W ; back: u = (1480 - 605 x)/W ; side: u = (2162 + 605 y)/W ; v = (254 + 605 z)/H
    cf = view("front", "X", S, CX_F); cb = view("back", "X", -S, CX_B); cs = view("side", "Y", S, CX_S)
    vw = N.new("ShaderNodeAttribute"); vw.attribute_name = "VW"
    sc_ = N.new("ShaderNodeSeparateColor"); L.new(vw.outputs["Color"], sc_.inputs["Color"])

    def scaled(col, ch):
        vm = N.new("ShaderNodeVectorMath"); vm.operation = "SCALE"
        L.new(col, vm.inputs[0]); L.new(sc_.outputs[ch], vm.inputs["Scale"]); return vm.outputs["Vector"]

    def add(a, b_):
        vm = N.new("ShaderNodeVectorMath"); vm.operation = "ADD"; L.new(a, vm.inputs[0]); L.new(b_, vm.inputs[1]); return vm.outputs["Vector"]

    acc = add(add(scaled(cf, "Red"), scaled(cb, "Green")), scaled(cs, "Blue"))
    s1 = N.new("ShaderNodeMath"); s1.operation = "ADD"; L.new(sc_.outputs["Red"], s1.inputs[0]); L.new(sc_.outputs["Green"], s1.inputs[1])
    s2 = N.new("ShaderNodeMath"); s2.operation = "ADD"; L.new(s1.outputs["Value"], s2.inputs[0]); L.new(sc_.outputs["Blue"], s2.inputs[1])
    smax = N.new("ShaderNodeMath"); smax.operation = "MAXIMUM"; L.new(s2.outputs["Value"], smax.inputs[0]); smax.inputs[1].default_value = 1e-4
    inv = N.new("ShaderNodeMath"); inv.operation = "DIVIDE"; inv.inputs[0].default_value = 1.0; L.new(smax.outputs["Value"], inv.inputs[1])
    proj = N.new("ShaderNodeVectorMath"); proj.operation = "SCALE"; L.new(acc, proj.inputs[0]); L.new(inv.outputs["Value"], proj.inputs["Scale"])
    alpha = N.new("ShaderNodeMath"); alpha.operation = "MULTIPLY"; alpha.use_clamp = True; L.new(s2.outputs["Value"], alpha.inputs[0]); alpha.inputs[1].default_value = 4.0
    fall = N.new("ShaderNodeAttribute"); fall.attribute_name = "Col"
    mix = N.new("ShaderNodeMix"); mix.data_type = "RGBA"; mix.blend_type = "MIX"
    L.new(alpha.outputs["Value"], mix.inputs["Factor"]); L.new(fall.outputs["Color"], mix.inputs[6]); L.new(proj.outputs["Vector"], mix.inputs[7])
    em = N.new("ShaderNodeEmission"); out = N.new("ShaderNodeOutputMaterial")
    L.new(mix.outputs[2], em.inputs["Color"]); L.new(em.outputs["Emission"], out.inputs["Surface"])
    return mat


def new_image(name):
    img = bpy.data.images.new(name, SIZE, SIZE, alpha=False, float_buffer=True); img.colorspace_settings.name = "Non-Color"; return img


lo_mat = bpy.data.materials.get("Mat_Elite") or bpy.data.materials.new("Mat_Elite")
lo_mat.use_nodes = True
for k in list(lo_mat.node_tree.nodes): lo_mat.node_tree.nodes.remove(k)
lo.data.materials.clear(); lo.data.materials.append(lo_mat)
tex_node = lo_mat.node_tree.nodes.new("ShaderNodeTexImage"); lo_mat.node_tree.nodes.active = tex_node


def bake(kind, img, hi_mat=None):
    tex_node.image = img
    if hi_mat is not None:
        hi.data.materials.clear(); hi.data.materials.append(hi_mat)
    for o in bpy.context.view_layer.objects: o.select_set(False)
    hi.select_set(True); lo.select_set(True); bpy.context.view_layer.objects.active = lo
    bpy.ops.object.bake(type=kind)
    return np.array(img.pixels[:], dtype=np.float32).reshape(SIZE, SIZE, 4)[..., :3]


def to_srgb(x):
    x = np.clip(x, 0, 1)
    return np.where(x <= 0.0031308, x * 12.92, 1.055 * np.power(x, 1 / 2.4) - 0.055)


def save(arr, fname):
    img = bpy.data.images.new("out_" + fname, SIZE, SIZE, alpha=True, float_buffer=False); img.colorspace_settings.name = "Non-Color"
    img.pixels = np.concatenate([np.clip(arr, 0, 1), np.ones((SIZE, SIZE, 1))], axis=2).astype(np.float32).ravel()
    img.filepath_raw = os.path.join(TEX, fname); img.file_format = "PNG"; img.save(); bpy.data.images.remove(img)


albedo = bake("EMIT", new_image("bk_albedo"), make_projection_material()); print("albedo baked (image projection)")
mgv = bake("EMIT", new_image("bk_mg"), make_attr_material("hi_mg", "MG")); print("metal/gloss baked")
ao = bake("AO", new_image("bk_ao")); print("AO baked")
nrm = bake("NORMAL", new_image("bk_nrm")); print("normal baked")
save(nrm, "Elite_Normal.png")
ao_m = np.clip(ao.mean(2), 0, 1)
save(np.stack([mgv[..., 0], mgv[..., 1], np.maximum(ao_m, 0.4)], axis=2), "Elite_MetallicGlossAO.png")
save(to_srgb(albedo * (0.80 + 0.20 * ao.mean(2, keepdims=True))), "Elite_Albedo.png")   # the reference already has lighting baked in: only a touch of AO
print("textures written to", TEX)

# ------------------------------------------------ 4. real material on lo (preview + FBX export): same wiring as before
sc.render.engine = "BLENDER_EEVEE"
for k in list(lo_mat.node_tree.nodes): lo_mat.node_tree.nodes.remove(k)
nt = lo_mat.node_tree


def img_node(fname, nonc, label):
    old = bpy.data.images.get(fname)
    if old: bpy.data.images.remove(old)
    im = bpy.data.images.load(os.path.join(TEX, fname)); im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; return nd


alb_n = img_node("Elite_Albedo.png", False, "Albedo"); mg_n = img_node("Elite_MetallicGlossAO.png", True, "MetallicGlossAO"); nrm_n = img_node("Elite_Normal.png", True, "Normal")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(alb_n.outputs["Color"], bsdf.inputs["Base Color"]); nt.links.new(mg_n.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nt.links.new(nrm_n.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"]); nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
hi.hide_set(True); hi.hide_viewport = True; hi.hide_render = True
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "v2_stage2_baked.blend"))
print("saved v2_stage2_baked.blend")
