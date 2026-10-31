"""Stage 2 (Landsraad Elite): UV-unwrap elite_lo and bake game textures from elite_hi (Cycles).

Run inside the GUI Blender through the bridge: exec(open(path).read(), globals())
Needs objects elite_hi (colour attribute "Col", linear) and elite_lo, and model_work/elite_hi_col_srgb.npy.
Writes model_work/tex/Elite_{Albedo,Normal,MetallicGlossAO}.png (1024, RGBA alpha=255) and builds Mat_Elite on elite_lo.
MetallicGlossAO channels follow the game: R metallic, G gloss, B ambient occlusion.
"""
import math, os
import bpy
import numpy as np

HERE = r"C:\Users\justi\Python\dsw_mod\model_work"
TEX = os.path.join(HERE, "tex")
os.makedirs(TEX, exist_ok=True)
SIZE = 1024
hi, lo = bpy.data.objects["elite_hi"], bpy.data.objects["elite_lo"]
hi.hide_viewport = False; hi.hide_render = False; hi.hide_set(False)
lo.hide_viewport = False; lo.hide_render = False; lo.hide_set(False)
sc = bpy.context.scene

# ------------------------------------------------ 1. material class -> (metal, gloss) attribute on hi
me = hi.data
n = len(me.vertices)
srgb = np.load(os.path.join(HERE, "elite_hi_col_srgb.npy"))
luma = srgb @ np.array([0.30, 0.59, 0.11])
rb = srgb[:, 0] - srgb[:, 2]
mx, mn = srgb.max(1), srgb.min(1)
sat = np.where(mx > 1e-6, (mx - mn) / np.maximum(mx, 1e-6), 0)
gold = (rb > 0.20) & (sat > 0.35) & (luma > 0.30)
cream = (~gold) & (rb > 0.05) & (luma > 0.45)
dark = (~gold) & (~cream) & (luma < 0.16)
mg = np.tile(np.array([0.65, 0.45]), (n, 1))                    # painted steel armour
mg[gold] = (0.75, 0.55)
mg[cream] = (0.0, 0.15)
mg[dark] = (0.10, 0.22)
print("classes: gold", int(gold.sum()), "cream", int(cream.sum()), "dark", int(dark.sum()), "armour", int((~gold & ~cream & ~dark).sum()))
mgc = me.color_attributes.get("MG") or me.color_attributes.new("MG", "FLOAT_COLOR", "POINT")
mgc.data.foreach_set("color", np.concatenate([mg, np.ones((n, 2))], 1).astype(np.float32).ravel())

# ------------------------------------------------ 2. UV unwrap the low-poly
for o in bpy.context.view_layer.objects:
    o.select_set(False)
lo.select_set(True)
bpy.context.view_layer.objects.active = lo
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(66), island_margin=0.006, area_weight=0.0, correct_aspect=True)
bpy.ops.uv.pack_islands(margin=0.006)
bpy.ops.object.mode_set(mode="OBJECT")
print("UV layers:", [u.name for u in lo.data.uv_layers])

# ------------------------------------------------ 3. bake
sc.render.engine = "CYCLES"; sc.cycles.device = "CPU"; sc.cycles.samples = 32; sc.cycles.use_denoising = False
b = sc.render.bake
b.use_selected_to_active = True; b.cage_extrusion = 0.03; b.max_ray_distance = 0.08
b.margin = 10; b.margin_type = "EXTEND"; b.target = "IMAGE_TEXTURES"; b.use_clear = True; b.normal_space = "TANGENT"


def make_hi_material(name, attr):
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    nt = mat.node_tree
    nt.nodes.clear()
    a = nt.nodes.new("ShaderNodeAttribute"); a.attribute_name = attr
    e = nt.nodes.new("ShaderNodeEmission"); o = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(a.outputs["Color"], e.inputs["Color"]); nt.links.new(e.outputs["Emission"], o.inputs["Surface"])
    return mat


def new_image(name):
    img = bpy.data.images.new(name, SIZE, SIZE, alpha=False, float_buffer=True)
    img.colorspace_settings.name = "Non-Color"
    return img


lo_mat = bpy.data.materials.get("Mat_Elite") or bpy.data.materials.new("Mat_Elite")
lo_mat.use_nodes = True
for k in list(lo_mat.node_tree.nodes):
    lo_mat.node_tree.nodes.remove(k)
lo.data.materials.clear(); lo.data.materials.append(lo_mat)
tex_node = lo_mat.node_tree.nodes.new("ShaderNodeTexImage")
lo_mat.node_tree.nodes.active = tex_node


def bake(kind, img, hi_mat=None):
    tex_node.image = img
    if hi_mat is not None:
        hi.data.materials.clear(); hi.data.materials.append(hi_mat)
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    hi.select_set(True); lo.select_set(True)
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.bake(type=kind)
    return np.array(img.pixels[:], dtype=np.float32).reshape(SIZE, SIZE, 4)[..., :3]


def to_srgb(x):
    x = np.clip(x, 0, 1)
    return np.where(x <= 0.0031308, x * 12.92, 1.055 * np.power(x, 1 / 2.4) - 0.055)


def save(arr, fname):
    """Write raw 8-bit values (no colour-space conversion), RGBA with alpha 255 like the working models."""
    img = bpy.data.images.new("out_" + fname, SIZE, SIZE, alpha=True, float_buffer=False)
    img.colorspace_settings.name = "Non-Color"
    img.alpha_mode = "NONE" if False else img.alpha_mode
    img.pixels = np.concatenate([np.clip(arr, 0, 1), np.ones((SIZE, SIZE, 1))], axis=2).astype(np.float32).ravel()
    img.filepath_raw = os.path.join(TEX, fname)
    img.file_format = "PNG"
    img.save()
    bpy.data.images.remove(img)


albedo = bake("EMIT", new_image("bk_albedo"), make_hi_material("hi_col", "Col")); print("albedo baked")
mgv = bake("EMIT", new_image("bk_mg"), make_hi_material("hi_mg", "MG")); print("metal/gloss baked")
ao = bake("AO", new_image("bk_ao")); print("AO baked")
nrm = bake("NORMAL", new_image("bk_nrm")); print("normal baked")
save(nrm, "Elite_Normal.png")
ao_m = np.clip(ao.mean(2), 0, 1)
save(np.stack([mgv[..., 0], mgv[..., 1], np.maximum(ao_m, 0.4)], axis=2), "Elite_MetallicGlossAO.png")
save(to_srgb(albedo * (0.70 + 0.30 * ao.mean(2, keepdims=True))), "Elite_Albedo.png")
print("textures written to", TEX)

# ------------------------------------------------ 4. real material on lo (preview + FBX export)
sc.render.engine = "BLENDER_EEVEE"
for k in list(lo_mat.node_tree.nodes):
    lo_mat.node_tree.nodes.remove(k)
nt = lo_mat.node_tree


def img_node(fname, nonc, label):
    old = bpy.data.images.get(fname)
    if old:
        bpy.data.images.remove(old)
    im = bpy.data.images.load(os.path.join(TEX, fname))
    im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label
    return nd


alb_n = img_node("Elite_Albedo.png", False, "Albedo")
mg_n = img_node("Elite_MetallicGlossAO.png", True, "MetallicGlossAO")
nrm_n = img_node("Elite_Normal.png", True, "Normal")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(alb_n.outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(mg_n.outputs["Color"], bsdf.inputs["Specular IOR Level"])      # the wiring the HMD Toolkit maps
nt.links.new(nrm_n.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
hi.hide_set(True); hi.hide_viewport = True; hi.hide_render = True
lo.select_set(True)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "elite_stage2.blend"))
print("saved elite_stage2.blend")
