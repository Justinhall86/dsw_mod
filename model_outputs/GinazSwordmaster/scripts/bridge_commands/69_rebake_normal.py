import os, numpy as np
HERE = r"C:\Users\justi\Python\dsw_mod\model_work"
SIZE = 1024
lo = bpy.data.objects["GinazSwordmaster"]; me = lo.data; rig = bpy.data.objects["Armature"]; sc = bpy.context.scene
# 1. bring the high-poly back from stage 1
with bpy.data.libraries.load(os.path.join(HERE, "ginaz_stage1.blend"), link=False) as (src, dst):
    dst.objects = ["ginaz_hi"]
hi = dst.objects[0]; bpy.context.collection.objects.link(hi)
for a in list(hi.data.color_attributes): hi.data.color_attributes.remove(a)
# 2. clear custom normals + sharp edges on the low-poly -> plain smooth vertex normals
for nm in ("custom_normal", "sharp_edge"):
    if nm in me.attributes: me.attributes.remove(me.attributes[nm])
for p in me.polygons: p.use_smooth = True
me.update()
print("custom normals now:", me.has_custom_normals)
# 3. bake the tangent-space normal map hi -> lo
for pb in rig.pose.bones: pb.matrix_basis.identity()
bake_mat = bpy.data.materials.new("bake_tmp"); bake_mat.use_nodes = True
tn = bake_mat.node_tree.nodes.new("ShaderNodeTexImage")
img = bpy.data.images.new("bk_nrm2", SIZE, SIZE, alpha=False, float_buffer=True); img.colorspace_settings.name = "Non-Color"
tn.image = img; bake_mat.node_tree.nodes.active = tn
orig_mats = list(me.materials); me.materials.clear(); me.materials.append(bake_mat)
sc.render.engine = "CYCLES"; sc.cycles.device = "CPU"; sc.cycles.samples = 16
b = sc.render.bake
b.use_selected_to_active = True; b.cage_extrusion = 0.03; b.max_ray_distance = 0.08; b.margin = 10; b.margin_type = "EXTEND"
b.target = "IMAGE_TEXTURES"; b.use_clear = True; b.normal_space = "TANGENT"
for o in bpy.context.view_layer.objects: o.select_set(False)
hi.hide_set(False); hi.hide_viewport = False; lo.hide_set(False)
hi.select_set(True); lo.select_set(True); bpy.context.view_layer.objects.active = lo
bpy.ops.object.bake(type='NORMAL')
px = np.array(img.pixels[:], dtype=np.float32).reshape(SIZE, SIZE, 4)[..., :3]
out = bpy.data.images.new("out_normal", SIZE, SIZE, alpha=False, float_buffer=False); out.colorspace_settings.name = "Non-Color"
out.pixels = np.concatenate([np.clip(px, 0, 1), np.ones((SIZE, SIZE, 1))], 2).astype(np.float32).ravel()
out.filepath_raw = os.path.join(HERE, "tex", "Ginaz_Normal.png"); out.file_format = "PNG"; out.save()
print("normal map re-baked; mean rgb", px.reshape(-1, 3).mean(0).round(3))
# 4. restore material, remove the high-poly and temp data
me.materials.clear(); [me.materials.append(m) for m in orig_mats]
bpy.data.objects.remove(hi, do_unlink=True)
bpy.data.materials.remove(bake_mat)
sc.render.engine = "BLENDER_EEVEE"
# 5. split-vertex check
uv = me.uv_layers.active.data; per = {}
for p in me.polygons:
    for li in p.loop_indices: per.setdefault(me.loops[li].vertex_index, set()).add((round(uv[li].uv[0], 5), round(uv[li].uv[1], 5)))
print("export vertex estimate (UV seams only):", sum(len(s) for s in per.values()))
