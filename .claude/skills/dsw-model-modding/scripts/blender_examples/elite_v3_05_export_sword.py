"""v3 step 5: with the assembled guard (v3_04) open, add the Atreides Trooper's sword (blender_bridge_commands/53_sword.py + 54_join.py first) and export the sword variant."""
import os
OUT = r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite\05_fbx_export\Male01_LandsraadGuardEliteSword.fbx"
lo = bpy.data.objects["LandsraadElite"]; rig = bpy.data.objects["Armature"]; me = lo.data
lo.name = "LandsraadEliteSword"; me.name = "LandsraadEliteSword"
sm = me.materials[2]; sm.name = "Mat_AtreideSword"
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
for bn in rig.data.bones: bn.use_deform = True
bpy.context.scene.frame_set(1)
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); bpy.context.view_layer.objects.active = lo
with bpy.context.temp_override(**view3d_ctx()):
    try: bpy.ops.mesh.customdata_custom_splitnormals_clear()
    except Exception as e: print("clear custom normals:", e)
for p in me.polygons: p.use_smooth = True
for nm in ("sharp_edge",):
    if nm in me.attributes:
        try: me.attributes.remove(me.attributes[nm])
        except Exception as e: print(nm, e)
for a in list(me.color_attributes): me.color_attributes.remove(a)
me.update()
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, lo))
bpy.context.view_layer.objects.active = rig
print("materials", [m.name for m in me.materials], "| attrs", [a.name for a in me.attributes if not a.name.startswith('.')], "| tris", len(me.polygons))
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='FACE')
print("exported", os.path.getsize(OUT), "bytes")
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite\03_blender\v3_guard_elite_sword_final.blend")
