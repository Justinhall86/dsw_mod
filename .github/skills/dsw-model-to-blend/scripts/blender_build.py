"""Blender-side script to build a textured .blend from FBX + textures."""

import math
import os
import sys

import bpy
from mathutils import Matrix, Vector


def script_args():
    """Parse arguments passed after '--' in Blender command line."""
    argv = sys.argv
    if "--" in argv:
        return argv[argv.index("--") + 1:]
    return []


def opt(flag, default=None):
    argv = script_args()
    return argv[argv.index(flag) + 1] if flag in argv else default


def reset_scene():
    """Clear the scene completely."""
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete()
    
    # Clean up orphaned data
    for block in bpy.data.meshes:
        if block.users == 0:
            bpy.data.meshes.remove(block)
    for block in bpy.data.materials:
        if block.users == 0:
            bpy.data.materials.remove(block)
    for block in bpy.data.images:
        if block.users == 0:
            bpy.data.images.remove(block)
    for block in bpy.data.armatures:
        if block.users == 0:
            bpy.data.armatures.remove(block)


def import_model(fbx_path):
    """Import FBX and return (mesh_object, armature_object)."""
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(fbx_path))
    
    # Find the mesh and armature
    mesh_obj = None
    armature_obj = None
    
    for obj in bpy.context.selected_objects:
        if obj.type == 'MESH':
            mesh_obj = obj
        elif obj.type == 'ARMATURE':
            armature_obj = obj
    
    # If no armature found in selection, search all objects
    if not armature_obj:
        for obj in bpy.data.objects:
            if obj.type == 'ARMATURE':
                armature_obj = obj
                break
    
    if not mesh_obj:
        raise RuntimeError("No mesh found in FBX")
    
    return mesh_obj, armature_obj


def wire_textures(mat, texture_paths):
    """Wire texture files to a material's principled BSDF."""
    if not mat.use_nodes:
        mat.use_nodes = True
    
    nodes = mat.node_tree.nodes
    links = mat.node_tree.links
    
    # Find Principled BSDF
    bsdf = None
    for node in nodes:
        if node.type == 'BSDF_PRINCIPLED':
            bsdf = node
            break
    
    if not bsdf:
        raise RuntimeError(f"No Principled BSDF in material {mat.name}")
    
    # Clear existing texture nodes
    for node in list(nodes):
        if node.type == 'TEX_IMAGE':
            nodes.remove(node)
    
    wired = []
    
    # Base Color
    if "Base Color" in texture_paths:
        tex_path = texture_paths["Base Color"]
        if os.path.exists(tex_path):
            tex_node = nodes.new('ShaderNodeTexImage')
            tex_node.image = bpy.data.images.load(tex_path, check_existing=False)
            tex_node.image.colorspace_settings.name = 'sRGB'
            links.new(tex_node.outputs['Color'], bsdf.inputs['Base Color'])
            wired.append(("Base Color", os.path.basename(tex_path)))
    
    # Specular IOR Level (Metallic/Gloss/AO)
    if "Specular IOR Level" in texture_paths:
        tex_path = texture_paths["Specular IOR Level"]
        if os.path.exists(tex_path):
            tex_node = nodes.new('ShaderNodeTexImage')
            tex_node.image = bpy.data.images.load(tex_path, check_existing=False)
            tex_node.image.colorspace_settings.name = 'Non-Color'
            # Connect to Metallic (R channel typically)
            links.new(tex_node.outputs['Color'], bsdf.inputs['Metallic'])
            # Also try Roughness from G channel
            # Note: This is a simplification; proper setup would use Separate RGB
            wired.append(("Metallic", os.path.basename(tex_path)))
    
    # Normal
    if "Normal" in texture_paths:
        tex_path = texture_paths["Normal"]
        if os.path.exists(tex_path):
            tex_node = nodes.new('ShaderNodeTexImage')
            tex_node.image = bpy.data.images.load(tex_path, check_existing=False)
            tex_node.image.colorspace_settings.name = 'Non-Color'
            
            normal_map = nodes.new('ShaderNodeNormalMap')
            links.new(tex_node.outputs['Color'], normal_map.inputs['Color'])
            links.new(normal_map.outputs['Normal'], bsdf.inputs['Normal'])
            wired.append(("Normal", os.path.basename(tex_path)))
    
    return wired


def setup_lighting_and_camera():
    """Add camera, sun, fill light, and world."""
    # Camera
    cam_data = bpy.data.cameras.new("Camera")
    cam_obj = bpy.data.objects.new("Camera", cam_data)
    bpy.context.collection.objects.link(cam_obj)
    cam_obj.location = (0, -3, 1.8)
    cam_obj.rotation_euler = (math.radians(75), 0, 0)
    bpy.context.scene.camera = cam_obj
    
    # Sun
    sun_data = bpy.data.lights.new("Sun", 'SUN')
    sun_obj = bpy.data.objects.new("Sun", sun_data)
    bpy.context.collection.objects.link(sun_obj)
    sun_obj.rotation_euler = (math.radians(45), math.radians(30), 0)
    sun_data.energy = 5.0
    sun_data.angle = 0.53
    
    # Fill light
    fill_data = bpy.data.lights.new("Fill", 'AREA')
    fill_obj = bpy.data.objects.new("Fill", fill_data)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (2, 2, 2)
    fill_obj.rotation_euler = (math.radians(-45), 0, math.radians(-30))
    fill_data.energy = 3.0
    fill_data.size = 2.0
    
    # World
    world = bpy.data.worlds.new("World")
    bpy.context.scene.world = world
    world.use_nodes = True
    bg = world.node_tree.nodes.get("Background")
    if bg:
        bg.inputs[0].default_value = (0.05, 0.05, 0.07, 1.0)
        bg.inputs[1].default_value = 0.5


def main():
    argv = script_args()
    
    body_path = opt("--body")
    tex_dir = opt("--textures")
    out_path = opt("--out")
    title = opt("--title", "Model")
    
    if not body_path or not out_path:
        print("Usage: blender_build.py -- --body <fbx> --textures <dir> --out <blend> [--title <name>]")
        sys.exit(1)
    
    print(f"Building {title}...")
    print(f"  Body: {body_path}")
    print(f"  Textures: {tex_dir}")
    print(f"  Output: {out_path}")
    
    reset_scene()
    
    # Import model
    body, rig = import_model(body_path)
    bpy.context.view_layer.update()
    body.name = title
    body.data.name = title + "Mesh"
    if rig:
        rig.name = "Armature"
    
    print(f"BODY verts {len(body.data.vertices)} tris {len(body.data.polygons)}")
    if rig:
        print(f"RIG bones {len(rig.data.bones)}")
    
    # Wire textures
    if tex_dir:
        tex_dir = os.path.abspath(tex_dir)
        stem = None
        for f in sorted(os.listdir(tex_dir)):
            if f.endswith("_Albedo.png"):
                stem = f[:-len("_Albedo.png")]
                break
        
        if stem:
            wanted = {
                "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
                "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
                "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
            }
            for mat in body.data.materials:
                if not mat.use_nodes:
                    continue
                wired = wire_textures(mat, wanted)
                for sock, name in wired:
                    print(f"   {sock:<20} <- {name}")
        else:
            print(f"   No *_Albedo.png in {tex_dir}")
    
    # Setup lighting and camera
    setup_lighting_and_camera()
    
    # Pack all images
    for img in bpy.data.images:
        if img.source == 'FILE' and not img.packed_file:
            img.pack()
    
    print(f"   packed {sum(1 for img in bpy.data.images if img.packed_file)} images")
    
    # Save
    bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(out_path))
    print(f"SAVED {out_path}")


if __name__ == "__main__":
    main()