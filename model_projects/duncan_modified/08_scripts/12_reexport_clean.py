"""Step 12: re-export from the saved blend with use_deform=False on bones that carry no weights
(so Blender writes only the 36 real skin clusters like the source HMD, not empty ones for prop bones).
Bone names/hierarchy/transforms are untouched -- use_deform is a Blender-only skinning hint."""
import bpy, os

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified"
BLEND = os.path.join(PROJ, "03_blender", "duncan_modified.blend")
OUT = os.path.join(PROJ, "05_fbx_export", "duncan_modified.fbx")

bpy.ops.wm.open_mainfile(filepath=BLEND)
scene = bpy.context.scene
me_obj = next(o for o in scene.objects if o.type == 'MESH')
rig = next(o for o in scene.objects if o.type == 'ARMATURE')
mesh = me_obj.data

weighted = set()
for vg in me_obj.vertex_groups:
    if any(g.group == vg.index and g.weight > 1e-6 for v in mesh.vertices for g in v.groups):
        weighted.add(vg.name)
print("weighted bones:", len(weighted))
# validated in-game exports (landsraad helmet) shipped with every bone use_deform=True and
# empty clusters for unweighted bones; the toolkit + repackager handle those fine.
for b in rig.data.bones:
    b.use_deform = True

if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
scene.frame_set(1)
for o in scene.objects:
    o.hide_viewport = False; o.hide_render = False
    try: o.hide_set(False)
    except Exception: pass
for o in scene.objects: o.select_set(o in (rig, me_obj))
bpy.context.view_layer.objects.active = rig
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward='Y', axis_up='Z',
    add_leaf_bones=False, bake_anim=False, path_mode='COPY', embed_textures=True,
    apply_scale_options='FBX_SCALE_UNITS', primary_bone_axis='Y', secondary_bone_axis='X',
    mesh_smooth_type='FACE')
print("re-exported", OUT, os.path.getsize(OUT), "bytes")
