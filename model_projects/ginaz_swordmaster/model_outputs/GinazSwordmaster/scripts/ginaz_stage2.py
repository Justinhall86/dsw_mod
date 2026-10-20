"""Stage 2: UV-unwrap ginaz_lo and bake textures from ginaz_hi (Cycles).

Needs the scene from ginaz_stage1.py (objects ginaz_hi with color attribute "Col", ginaz_lo).
Writes model_work/tex/Ginaz_{Albedo,Normal,MetallicGlossAO}.png (1024x1024) and saves
model_work/ginaz_stage2.blend.  Channel layout of MetallicGlossAO follows the game's:
R = metallic, G = gloss, B = ambient occlusion.
"""
import math, os
import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
TEX = os.path.join(HERE, "tex")
os.makedirs(TEX, exist_ok=True)
SIZE = 1024
hi, lo = bpy.data.objects["ginaz_hi"], bpy.data.objects["ginaz_lo"]
sc = bpy.context.scene

# ---------------------------------------------------------------- 1. material class -> metal/gloss attribute on hi
PAL = dict(skin=(0.45, 0.30, 0.22), hair=(0.07, 0.05, 0.04), suit=(0.075, 0.08, 0.095),
           armor=(0.246, 0.262, 0.295), armor2=(0.18, 0.19, 0.22), trim=(0.42, 0.33, 0.17),
           cape=(0.055, 0.060, 0.085), glove=(0.06, 0.055, 0.055), boot=(0.05, 0.045, 0.045))
MG = dict(skin=(0.0, 0.30), hair=(0.0, 0.25), suit=(0.0, 0.20), armor=(0.70, 0.45), armor2=(0.55, 0.35),
          trim=(0.70, 0.60), cape=(0.0, 0.12), glove=(0.0, 0.30), boot=(0.0, 0.30))
ORIG_SKIN = np.array((0.60, 0.42, 0.33))
me = hi.data
n = len(me.vertices)
buf = np.empty(n * 4, dtype=np.float32)
me.color_attributes["Col"].data.foreach_get("color", buf)
col = buf.reshape(-1, 4)[:, :3].astype(np.float64)
orig = dict(PAL, skin=tuple(ORIG_SKIN))                         # palette used when painting stage 1
keys = list(orig)
dist = np.stack([np.linalg.norm(col - np.array(orig[k]), axis=1) for k in keys], axis=1)
cls = dist.argmin(1)
skin_i = keys.index("skin")
sk = cls == skin_i
col[sk] = col[sk] * (np.array(PAL["skin"]) / ORIG_SKIN)         # tone the skin down a little
me.color_attributes["Col"].data.foreach_set("color", np.concatenate([col, np.ones((n, 1))], 1).astype(np.float32).ravel())
mg = np.array([MG[k] for k in keys])[cls]
mgc = me.color_attributes.new("MG", "FLOAT_COLOR", "POINT")
mgc.data.foreach_set("color", np.concatenate([mg, np.ones((n, 2))], 1).astype(np.float32).ravel())   # (metal, gloss, 1, 1)
print("classes:", {k: int((cls == i).sum()) for i, k in enumerate(keys)})

# ---------------------------------------------------------------- 2. UV unwrap the low-poly
for o in bpy.context.view_layer.objects:
    o.select_set(False)
lo.hide_set(False)
lo.select_set(True)
bpy.context.view_layer.objects.active = lo
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(66), island_margin=0.006, area_weight=0.0, correct_aspect=True)
bpy.ops.uv.pack_islands(margin=0.006)
bpy.ops.object.mode_set(mode="OBJECT")
print("UV layers:", [u.name for u in lo.data.uv_layers])

# ---------------------------------------------------------------- 3. bake setup
sc.render.engine = "CYCLES"
sc.cycles.device = "CPU"
sc.cycles.samples = 48
sc.cycles.use_denoising = False
b = sc.render.bake
b.use_selected_to_active = True
b.cage_extrusion = 0.03
b.max_ray_distance = 0.08
b.margin = 10
b.margin_type = "EXTEND"
b.target = "IMAGE_TEXTURES"
b.use_clear = True
b.normal_space = "TANGENT"


def make_hi_material(name, attr):
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    nt = mat.node_tree
    nt.nodes.clear()
    a = nt.nodes.new("ShaderNodeAttribute")
    a.attribute_name = attr
    e = nt.nodes.new("ShaderNodeEmission")
    o = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(a.outputs["Color"], e.inputs["Color"])
    nt.links.new(e.outputs["Emission"], o.inputs["Surface"])
    return mat


def new_image(name):
    img = bpy.data.images.new(name, SIZE, SIZE, alpha=False, float_buffer=True)
    img.colorspace_settings.name = "Non-Color"
    return img


lo_mat = bpy.data.materials.new("Mat_Ginaz")
lo_mat.use_nodes = True
lo.data.materials.clear()
lo.data.materials.append(lo_mat)
tex_node = lo_mat.node_tree.nodes.new("ShaderNodeTexImage")
lo_mat.node_tree.nodes.active = tex_node


def bake(kind, img, hi_mat=None):
    tex_node.image = img
    if hi_mat is not None:
        hi.data.materials.clear()
        hi.data.materials.append(hi_mat)
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    hi.hide_set(False)
    hi.select_set(True)
    lo.select_set(True)
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.bake(type=kind)
    return np.array(img.pixels[:], dtype=np.float32).reshape(SIZE, SIZE, 4)[..., :3]


def to_srgb(x):
    x = np.clip(x, 0, 1)
    return np.where(x <= 0.0031308, x * 12.92, 1.055 * np.power(x, 1 / 2.4) - 0.055)


def save(arr, fname):
    """Write raw 8-bit values (no colorspace conversion) through Blender's image API."""
    img = bpy.data.images.new("out_" + fname, SIZE, SIZE, alpha=False, float_buffer=False)
    img.colorspace_settings.name = "Non-Color"
    img.pixels = np.concatenate([np.clip(arr, 0, 1), np.ones((SIZE, SIZE, 1))], axis=2).astype(np.float32).ravel()
    img.filepath_raw = os.path.join(TEX, fname)
    img.file_format = "PNG"
    img.save()
    bpy.data.images.remove(img)


albedo = bake("EMIT", new_image("bk_albedo"), make_hi_material("hi_col", "Col"))
print("albedo baked");              save(to_srgb(albedo), "Ginaz_Albedo.png")
mgv = bake("EMIT", new_image("bk_mg"), make_hi_material("hi_mg", "MG"))
print("metal/gloss baked")
ao = bake("AO", new_image("bk_ao"))
print("AO baked")
nrm = bake("NORMAL", new_image("bk_nrm"))
print("normal baked");              save(nrm, "Ginaz_Normal.png")
packed = np.stack([mgv[..., 0], mgv[..., 1], np.clip(ao.mean(2), 0, 1)], axis=2)
save(packed, "Ginaz_MetallicGlossAO.png")
# bake a bit of the AO into the albedo as well (cheap contact shadows)
save(to_srgb(albedo * (0.55 + 0.45 * ao.mean(2, keepdims=True))), "Ginaz_Albedo.png")
print("textures written to", TEX)

# ---------------------------------------------------------------- 4. real material on lo (for preview + FBX export)
sc.render.engine = "BLENDER_EEVEE"
for k in list(lo_mat.node_tree.nodes):
    lo_mat.node_tree.nodes.remove(k)
nt = lo_mat.node_tree


def img_node(fname, nonc):
    im = bpy.data.images.load(os.path.join(TEX, fname))
    im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
    nd = nt.nodes.new("ShaderNodeTexImage")
    nd.image = im
    nd.name = nd.label = fname.replace(".png", "")
    return nd


alb_n, nrm_n, mg_n = img_node("Ginaz_Albedo.png", False), img_node("Ginaz_Normal.png", True), img_node("Ginaz_MetallicGlossAO.png", True)
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
out = nt.nodes.new("ShaderNodeOutputMaterial")
nmap = nt.nodes.new("ShaderNodeNormalMap")
sep = nt.nodes.new("ShaderNodeSeparateColor")
inv = nt.nodes.new("ShaderNodeMath")
inv.operation = "SUBTRACT"
inv.inputs[0].default_value = 1.0
nt.links.new(alb_n.outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(nrm_n.outputs["Color"], nmap.inputs["Color"])
nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
nt.links.new(mg_n.outputs["Color"], sep.inputs["Color"])
nt.links.new(sep.outputs["Red"], bsdf.inputs["Metallic"])
nt.links.new(sep.outputs["Green"], inv.inputs[1])
nt.links.new(inv.outputs["Value"], bsdf.inputs["Roughness"])
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
hi.hide_set(True)
lo.select_set(True)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "ginaz_stage2.blend"))
print("saved ginaz_stage2.blend")
