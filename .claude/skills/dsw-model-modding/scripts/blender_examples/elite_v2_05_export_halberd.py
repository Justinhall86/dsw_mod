"""v2 step 4: export the skinned 20k mesh as Male01_LandsraadElite.fbx (halberd variant) for the HMD Toolkit.
Run in the GUI Blender via the bridge. Expects objects elite_lo + Rig (skinned by v2_04_skin.py)."""
import os
PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
OUT = os.path.join(PROJ, "05_fbx_export", "Male01_LandsraadElite.fbx")
lo = bpy.data.objects["elite_lo"]; rig = bpy.data.objects["Rig"]; me = lo.data
lo.name = "LandsraadElite"; me.name = "LandsraadElite"; rig.name = "Armature"; rig.data.name = "Armature"
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
for bn in rig.data.bones: bn.use_deform = True               # prop bones carry no weights; the toolkit restores the skeleton anyway
bpy.context.scene.frame_set(1)
for a in list(me.color_attributes): me.color_attributes.remove(a)   # Col / VW / MG were only bake inputs
mat = bpy.data.materials["Mat_Elite"]; me.materials.clear(); me.materials.append(mat)
for nm in ("elite_hi", "snapcam", "keylight"):
    o = bpy.data.objects.get(nm)
    if o: bpy.data.objects.remove(o, do_unlink=True)
rig.hide_set(False); rig.hide_viewport = False; lo.hide_set(False); lo.hide_viewport = False; lo.hide_render = False
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
for o in bpy.context.view_layer.objects: o.select_set(o in (rig, lo))
bpy.context.view_layer.objects.active = rig
print("tris", len(me.polygons), "| materials", [m.name for m in me.materials], "| attrs", [a.name for a in me.attributes if not a.name.startswith('.')])
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z', add_leaf_bones=False,
        bake_anim=False, path_mode='COPY', embed_textures=True, apply_scale_options='FBX_SCALE_UNITS',
        primary_bone_axis='Y', secondary_bone_axis='X', mesh_smooth_type='FACE')
print("exported", OUT, os.path.getsize(OUT), "bytes")
try:
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "v2_halberd_final.blend"))
except RuntimeError as e:
    print("save skipped:", str(e)[:60])
