"""Blender script to import Raider TRUE_FBX, set up materials with textures, and export game-ready FBX.
Run inside Blender: File > Import > FBX, then run this script in Text Editor.
"""
import bpy
import os

# Paths
PROJECT_ROOT = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\raider"
INPUT_FBX = os.path.join(PROJECT_ROOT, "01_input", "Male01_Raider.fbx")
ALBEDO = os.path.join(PROJECT_ROOT, "01_input", "Raider_Albedo.png")
METALLIC_GLOSS_AO = os.path.join(PROJECT_ROOT, "01_input", "Raider_MetallicGlossAO.png")
NORMAL = os.path.join(PROJECT_ROOT, "01_input", "Raider_Normal.png")
OUTPUT_FBX = os.path.join(PROJECT_ROOT, "05_fbx_export", "Male01_Raider.fbx")
OUTPUT_BLEND = os.path.join(PROJECT_ROOT, "03_blender", "Male01_Raider.blend")

# Clear scene
bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete()

# Import the TRUE_FBX
bpy.ops.import_scene.fbx(filepath=INPUT_FBX)

# Find armature and mesh
rig = None
mesh = None
for obj in bpy.data.objects:
    if obj.type == 'ARMATURE':
        rig = obj
    elif obj.type == 'MESH':
        mesh = obj

if not rig or not mesh:
    print("ERROR: Could not find armature and mesh")
    exit(1)

print(f"Found rig: {rig.name}, mesh: {mesh.name}")

# Set up material with textures
mat = mesh.data.materials[0] if mesh.data.materials else bpy.data.materials.new(name="Raider_Material")
if not mesh.data.materials:
    mesh.data.materials.append(mat)

mat.use_nodes = True
nodes = mat.node_tree.nodes
links = mat.node_tree.links

# Clear existing nodes
nodes.clear()

# Create nodes
output = nodes.new('ShaderNodeOutputMaterial')
bsdf = nodes.new('ShaderNodeBsdfPrincipled')
tex_albedo = nodes.new('ShaderNodeTexImage')
tex_metal = nodes.new('ShaderNodeTexImage')
tex_normal = nodes.new('ShaderNodeTexImage')
normal_map = nodes.new('ShaderNodeNormalMap')

# Load images
tex_albedo.image = bpy.data.images.load(ALBEDO)
tex_metal.image = bpy.data.images.load(METALLIC_GLOSS_AO)
tex_normal.image = bpy.data.images.load(NORMAL)

# Set color spaces
tex_albedo.image.colorspace_settings.name = 'sRGB'
tex_metal.image.colorspace_settings.name = 'Non-Color'
tex_normal.image.colorspace_settings.name = 'Non-Color'

# Position nodes
output.location = (400, 0)
bsdf.location = (0, 0)
tex_albedo.location = (-600, 300)
tex_metal.location = (-600, 0)
tex_normal.location = (-600, -300)
normal_map.location = (-200, -300)

# Connect nodes
links.new(bsdf.outputs['BSDF'], output.inputs['Surface'])
links.new(tex_albedo.outputs['Color'], bsdf.inputs['Base Color'])
links.new(tex_metal.outputs['Color'], bsdf.inputs['Specular IOR Level'])
links.new(tex_normal.outputs['Color'], normal_map.inputs['Color'])
links.new(normal_map.outputs['Normal'], bsdf.inputs['Normal'])

# Set material properties
bsdf.inputs['Metallic'].default_value = 1.0
bsdf.inputs['Roughness'].default_value = 0.5

# Remove vertex color attributes
for attr in list(mesh.data.color_attributes):
    mesh.data.color_attributes.remove(attr)

# Rest pose
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
for b in rig.data.bones:
    b.use_deform = True
bpy.context.scene.frame_set(1)

# Select and export
bpy.ops.object.select_all(action='DESELECT')
rig.select_set(True)
mesh.select_set(True)
bpy.context.view_layer.objects.active = rig

bpy.ops.export_scene.fbx(
    filepath=OUTPUT_FBX,
    use_selection=True,
    axis_forward='Y',
    axis_up='Z',
    add_leaf_bones=False,
    bake_anim=False,
    path_mode='COPY',
    embed_textures=True,
    apply_scale_options='FBX_SCALE_UNITS',
    primary_bone_axis='Y',
    secondary_bone_axis='X',
    mesh_smooth_type='OFF'
)

print(f"Exported to {OUTPUT_FBX}")

# Save blend file
bpy.ops.wm.save_as_mainfile(filepath=OUTPUT_BLEND)
print(f"Saved blend to {OUTPUT_BLEND}")