import os, math, numpy as np
from mathutils import Vector, Euler
TEX = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\tex"
OUT = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_outputs\Male01_GinazSwordmaster.fbx"
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]; me = lo.data
# ---- clean state: rest pose, no action, prop bones deform again (they carry no weights anyway)
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
for b in rig.data.bones: b.use_deform = True
bpy.context.scene.frame_set(1)
# ---- material exactly like the toolkit's own imports: Albedo->Base Color, MGAO->Specular IOR Level, Normal->NormalMap
mat = bpy.data.materials.get("Mat_Ginaz") or bpy.data.materials.new("Mat_Ginaz")
mat.use_nodes = True; nt = mat.node_tree
for n in list(nt.nodes): nt.nodes.remove(n)
def img(fname, cs, label):
    im = bpy.data.images.get(fname)
    if im: bpy.data.images.remove(im)
    im = bpy.data.images.load(os.path.join(TEX, fname)); im.colorspace_settings.name = cs
    nd = nt.nodes.new("ShaderNodeTexImage"); nd.image = im; nd.label = label; return nd
alb = img("Ginaz_Albedo.png", "sRGB", "Albedo"); mg = img("Ginaz_MetallicGlossAO.png", "Non-Color", "MetallicGlossAO"); nm = img("Ginaz_Normal.png", "Non-Color", "Normal")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); out = nt.nodes.new("ShaderNodeOutputMaterial"); nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nt.links.new(nm.outputs["Color"], nmap.inputs["Color"]); nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
me.materials.clear(); me.materials.append(mat)
# ---- tidy names, drop the high-poly + stray data from the export
lo.name = "GinazSwordmaster"; me.name = "GinazSwordmaster"; rig.name = "Armature"; rig.data.name = "Armature"
for o in list(bpy.data.objects):
    if o.name == "ginaz_hi": bpy.data.objects.remove(o, do_unlink=True)
rig.hide_set(False); rig.hide_viewport = False; lo.hide_set(False); lo.hide_viewport = False
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, lo))
print("selected:", [o.name for o in bpy.context.selected_objects], "| tris", len(me.polygons), "| uv", [u.name for u in me.uv_layers], "| color attrs", [a.name for a in me.color_attributes])
for a in list(me.color_attributes):                       # vertex colors are baked into the texture; don't ship them
    me.color_attributes.remove(a)
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='OFF')
print("exported", OUT, os.path.getsize(OUT), "bytes")
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\ginaz_final.blend")
print("saved ginaz_final.blend")
