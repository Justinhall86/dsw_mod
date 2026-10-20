"""Blender (5.x) FBX export with the settings the HMD Toolkit expects. Run inside Blender
(Text editor, --python, or the live bridge) with the armature + one skinned mesh in the scene.

Edit OUT (and optionally MESH/RIG names) below. What it does:
  - rest pose, no action, all bones deform (prop bones carry no weights anyway)
  - checks the material wiring: Albedo->Base Color, MetallicGlossAO->Specular IOR Level, Normal->Normal Map
  - removes vertex-colour attributes (they are baked into the albedo)
  - DOES NOT clear custom normals: clearing them before export once produced zero-length normals and an
    all-black model in game. If you must, run scripts/fix_normals.py on the converted HMD.
  - exports selected armature + mesh: Forward Y, Up Z, no leaf bones, no animation, Copy + Embed
    textures, FBX units scale, bone axes Y/X
"""
import os
import bpy

OUT = r"C:\path\to\Male01_MyUnit.fbx"     # <Rig>_<Name>.fbx: the name becomes the HMD/folder name
RIG = None                                  # None = the only armature
MESH = None                                 # None = the mesh skinned to RIG

rig = bpy.data.objects[RIG] if RIG else next(o for o in bpy.data.objects if o.type == "ARMATURE")
mesh = bpy.data.objects[MESH] if MESH else next(
    o for o in bpy.data.objects
    if o.type == "MESH" and any(m.type == "ARMATURE" and m.object == rig for m in o.modifiers))

if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
for b in rig.data.bones:
    b.use_deform = True
bpy.context.scene.frame_set(1)

for mat in mesh.data.materials:
    linked = {l.to_socket.name for l in mat.node_tree.links} if mat and mat.use_nodes else set()
    for sock in ("Base Color", "Specular IOR Level", "Normal"):
        if sock not in linked:
            print(f"WARNING material {mat.name}: nothing linked to {sock} - the toolkit maps textures by this wiring")

for a in list(mesh.data.color_attributes):
    mesh.data.color_attributes.remove(a)

rig.hide_set(False); rig.hide_viewport = False          # a hidden armature is silently skipped
mesh.hide_set(False); mesh.hide_viewport = False
for o in bpy.context.view_layer.objects:
    o.select_set(o in (rig, mesh))
bpy.context.view_layer.objects.active = rig

bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
    bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
    primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="OFF")
print("exported", OUT, os.path.getsize(OUT), "bytes;", len(mesh.data.polygons), "faces")
