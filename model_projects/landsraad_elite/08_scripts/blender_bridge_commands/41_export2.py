import os
OUT = r"C:\Users\justi\Python\dsw_mod\model_outputs\LandsraadElite\fbx\Male01_LandsraadElite.fbx"
lo = bpy.data.objects["LandsraadElite"]; rig = bpy.data.objects["Armature"]; me = lo.data
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); bpy.context.view_layer.objects.active = lo
with bpy.context.temp_override(**view3d_ctx()):
    try: bpy.ops.mesh.customdata_custom_splitnormals_clear()
    except Exception as e: print("clear custom normals:", e)
for p in me.polygons: p.use_smooth = True
if "sharp_edge" in me.attributes:
    try: me.attributes.remove(me.attributes["sharp_edge"])
    except Exception as e: print("sharp_edge:", e)
me.update()
print("attrs:", [a.name for a in me.attributes if not a.name.startswith('.')])
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, lo))
bpy.context.view_layer.objects.active = rig
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='FACE')
print("exported", os.path.getsize(OUT), "bytes")
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_outputs\LandsraadElite\blender\elite_final.blend")
