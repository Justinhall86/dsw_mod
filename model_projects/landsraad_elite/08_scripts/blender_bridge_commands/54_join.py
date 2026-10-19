import numpy as np, os
lo = bpy.data.objects["LandsraadElite"]; sword = bpy.data.objects["AtreideSword"]
tmp = os.path.join(BRIDGE, "..", "sword_dummy"); os.makedirs(tmp, exist_ok=True)
# --- second material: placeholder textures named like the vanilla ones (the converter embeds them; paths get rewritten to the game's files afterwards)
mat = bpy.data.materials.new("Mat_AtreideSoldier"); mat.use_nodes = True; nt = mat.node_tree
for n in list(nt.nodes): nt.nodes.remove(n)
def img(fname, nonc, label):
    im = bpy.data.images.new(fname, 8, 8, alpha=True); im.filepath_raw = os.path.join(tmp, fname); im.file_format = "PNG"
    im.pixels = [0.5, 0.5, 0.5, 1.0] * 64; im.save(); im.colorspace_settings.name = "Non-Color" if nonc else "sRGB"
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; return nd
alb = img("AtreideSoldier01_Albedo.png", False, "Albedo"); mg = img("AtreideSoldier01_MetallicGlossAO.png", True, "MetallicGlossAO"); nm = img("AtreideSoldier01_Normal.png", True, "Normal")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"]); nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nt.links.new(nm.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"]); nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
sword.data.materials.clear(); sword.data.materials.append(mat)
# --- join: the sword's UV layer must have the same name as the Elite's
sword.data.uv_layers[0].name = lo.data.uv_layers[0].name
for o in bpy.context.view_layer.objects: o.select_set(False)
sword.select_set(True); lo.select_set(True); bpy.context.view_layer.objects.active = lo
n_before = len(lo.data.vertices)
bpy.ops.object.join()
me = lo.data
print("joined:", n_before, "->", len(me.vertices), "verts |", len(me.polygons), "faces | materials", [m.name for m in me.materials], "| uv", [u.name for u in me.uv_layers])
cnt = {}
for p in me.polygons: cnt[p.material_index] = cnt.get(p.material_index, 0) + 1
print("faces per material slot:", cnt)
gnames = {g.index: g.name for g in lo.vertex_groups}
sw_v = set(i for p in me.polygons if p.material_index == 1 for i in p.vertices)
use = {}
for i in sw_v:
    for g in me.vertices[i].groups: use[gnames[g.group]] = use.get(gnames[g.group], 0) + 1
print("sword verts:", len(sw_v), "bones:", use)
print("max influences overall:", max(len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices), "| armature modifier:", [m.type for m in lo.modifiers])
