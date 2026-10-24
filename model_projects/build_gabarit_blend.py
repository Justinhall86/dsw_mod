import os
import sys

import bpy
from mathutils import Vector


def build(project, source_fbxs):
    project = os.path.abspath(project)
    input_dir = os.path.join(project, "01_input")
    preview_dir = os.path.join(project, "02_progress_photos", "01_import_review")
    blend_dir = os.path.join(project, "03_blender")
    export_dir = os.path.join(project, "05_fbx_export")
    for folder in (preview_dir, blend_dir, export_dir):
        os.makedirs(folder, exist_ok=True)

    texture_path = os.path.join(input_dir, "ColorChart_Albedo.png")
    if not os.path.isfile(texture_path):
        raise FileNotFoundError(texture_path)
    for fbx in source_fbxs:
        if not os.path.isfile(fbx):
            raise FileNotFoundError(fbx)

    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete(use_global=False)

    mesh_objects = []
    for fbx in source_fbxs:
        before = set(bpy.data.objects)
        bpy.ops.import_scene.fbx(filepath=fbx)
        mesh_objects.extend(
            obj for obj in bpy.data.objects
            if obj not in before and obj.type == "MESH"
        )
    if not mesh_objects:
        raise RuntimeError(f"No mesh objects imported from {source_fbxs}")

    texture = bpy.data.images.load(texture_path, check_existing=True)
    texture.colorspace_settings.name = "sRGB"
    texture.pack()
    for obj in mesh_objects:
        material = bpy.data.materials.new(name=f"{obj.name}_ColorChart")
        material.diffuse_color = (0.8, 0.8, 0.8, 1.0)
        material.use_nodes = True
        nodes = material.node_tree.nodes
        nodes.clear()
        output = nodes.new("ShaderNodeOutputMaterial")
        shader = nodes.new("ShaderNodeBsdfPrincipled")
        image = nodes.new("ShaderNodeTexImage")
        image.image = texture
        image.label = "ColorChart_Albedo"
        image.location = (-400, 100)
        shader.location = (-100, 100)
        output.location = (200, 100)
        material.node_tree.links.new(image.outputs["Color"], shader.inputs["Base Color"])
        material.node_tree.links.new(shader.outputs["BSDF"], output.inputs["Surface"])
        shader.inputs["Roughness"].default_value = 0.65
        obj.data.materials.clear()
        obj.data.materials.append(material)

    bpy.context.scene.render.engine = "BLENDER_EEVEE"
    bpy.context.scene.render.resolution_x = 1100
    bpy.context.scene.render.resolution_y = 1100
    bpy.context.scene.render.resolution_percentage = 100
    bpy.context.scene.render.image_settings.file_format = "PNG"
    bpy.context.scene.render.film_transparent = False
    scene = bpy.context.scene
    scene.world.use_nodes = True
    background = scene.world.node_tree.nodes.get("Background")
    background.inputs["Color"].default_value = (0.11, 0.12, 0.14, 1.0)
    background.inputs["Strength"].default_value = 0.8

    depsgraph = bpy.context.evaluated_depsgraph_get()
    world_vertices = [
        obj.evaluated_get(depsgraph).matrix_world @ vertex.co
        for obj in mesh_objects
        for vertex in obj.data.vertices
    ]
    minimum = Vector(tuple(min(v[i] for v in world_vertices) for i in range(3)))
    maximum = Vector(tuple(max(v[i] for v in world_vertices) for i in range(3)))
    center = (minimum + maximum) * 0.5
    extent = max(maximum - minimum)
    if extent <= 0:
        raise RuntimeError("Imported meshes have no measurable bounds")

    camera_data = bpy.data.cameras.new("PreviewCamera")
    camera = bpy.data.objects.new("PreviewCamera", camera_data)
    scene.collection.objects.link(camera)
    camera_data.type = "ORTHO"
    camera_data.ortho_scale = extent * 1.6
    camera.location = center + Vector((3.2, -5.5, 3.1)).normalized() * extent * 2.5
    camera.rotation_euler = (center - camera.location).to_track_quat("-Z", "Y").to_euler()
    scene.camera = camera

    light_data = bpy.data.lights.new("KeyLight", "AREA")
    light = bpy.data.objects.new("KeyLight", light_data)
    scene.collection.objects.link(light)
    light.location = center + Vector((2.5, -3.5, 5.0)) * extent
    light_data.energy = 1500
    light_data.shape = "DISK"
    light_data.size = extent * 2.2
    light.rotation_euler = (center - light.location).to_track_quat("-Z", "Y").to_euler()

    stem = os.path.basename(project)
    blend_path = os.path.join(blend_dir, f"{stem}.blend")
    fbx_path = os.path.join(export_dir, f"{stem}.fbx")
    preview_path = os.path.join(preview_dir, f"{stem}.png")

    for obj in bpy.context.selected_objects:
        obj.select_set(False)
    for obj in mesh_objects:
        obj.select_set(True)
    bpy.context.view_layer.objects.active = mesh_objects[0]
    bpy.ops.export_scene.fbx(
        filepath=fbx_path,
        use_selection=True,
        bake_anim=False,
        path_mode="COPY",
        embed_textures=True,
        apply_scale_options="FBX_SCALE_UNITS",
        mesh_smooth_type="OFF",
    )

    for screen in bpy.data.screens:
        for area in screen.areas:
            if area.type == "VIEW_3D":
                area.spaces.active.shading.type = "MATERIAL"
                area.spaces.active.region_3d.view_perspective = "CAMERA"

    scene.render.filepath = preview_path
    bpy.ops.render.render(write_still=True)
    bpy.ops.wm.save_as_mainfile(filepath=blend_path)
    print(
        f"BUILT {blend_path}; FBX={fbx_path}; preview={preview_path}; "
        f"meshes={len(mesh_objects)}; uv_maps={[len(o.data.uv_layers) for o in mesh_objects]}"
    )


args = sys.argv[sys.argv.index("--") + 1:]
if len(args) < 2:
    raise SystemExit("Usage: blender --python build_gabarit_blend.py -- <project_dir> <source_fbx> [source_fbx ...]")
build(args[0], args[1:])
