import os
TEX = r"C:\Users\justi\Python\dsw_mod\model_work\tex"
OUT = r"C:\Users\justi\Python\dsw_mod\model_outputs\Male01_GinazSwordmaster.fbx"
rig = bpy.data.objects["Armature"]; lo = bpy.data.objects["GinazSwordmaster"]; me = lo.data
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
mat = bpy.data.materials["Mat_Ginaz"]; nt = mat.node_tree
for nd in nt.nodes:                                    # reload the (re-baked / AO-floored) PNGs from disk
    if nd.bl_idname == "ShaderNodeTexImage" and nd.image: nd.image.reload()
me.materials.clear(); me.materials.append(mat)
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, lo))
print("selected:", [o.name for o in bpy.context.selected_objects], "| attrs", [a.name for a in me.attributes if not a.name.startswith('.')])
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='OFF')
print("exported", os.path.getsize(OUT), "bytes")
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_work\ginaz_final.blend")
