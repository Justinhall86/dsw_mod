import os
import sys

import bpy
from mathutils import Vector

repo = r"C:\Users\justi\Python\dsw_mod"
scripts = os.path.join(repo, ".claude", "skills", "dsw-model-workshop", "scripts")
sys.path.insert(0, scripts)

import blender_scene as bs


def reset_scene():
    for obj in list(bpy.data.objects):
        bpy.data.objects.remove(obj, do_unlink=True)


def import_model(path):
    window = bpy.context.window
    override = {"window": window}
    if window:
        override["screen"] = window.screen
        area = next((item for item in window.screen.areas if item.type == "VIEW_3D"), None)
        if area:
            override["area"] = area
            region = next((item for item in area.regions if item.type == "WINDOW"), None)
            if region:
                override["region"] = region

    with bpy.context.temp_override(**override):
        bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))

    meshes = [obj for obj in bpy.data.objects if obj.type == "MESH"]
    rigs = [obj for obj in bpy.data.objects if obj.type == "ARMATURE"]
    if not meshes:
        raise RuntimeError("no mesh in " + path)
    body = max(meshes, key=lambda obj: len(obj.data.polygons))
    for name in bs.JUNK_NAMES:
        junk = bpy.data.objects.get(name)
        if junk and junk.type == "MESH":
            bpy.data.objects.remove(junk, do_unlink=True)
    return body, rigs[0] if rigs else None


bs.reset_scene = reset_scene
bs.import_model = import_model
builder = os.path.join(scripts, "07_build_blend.py")
with open(builder, "rb") as source:
    exec(compile(source.read(), builder, "exec"))

texture_dir = os.path.abspath(tex_dir)
texture_paths = {
    os.path.basename(path).lower(): path
    for path in (
        os.path.join(texture_dir, name)
        for name in os.listdir(texture_dir)
    )
    if os.path.isfile(path)
}

for material in body.data.materials:
    if not material or not material.use_nodes:
        continue
    token = material.name[4:] if material.name.startswith("Mat_") else material.name
    base = texture_paths.get((token + "_Albedo.png").lower())
    if base:
        wanted = {"Base Color": base}
        for suffix in ("_MetallicGlossAO.png", "_MetallicGlossAOEmiss.png"):
            match = texture_paths.get((token + suffix).lower())
            if match:
                wanted["Specular IOR Level"] = match
                break
        for suffix in ("_Normal.png", "_Normal_raw.png"):
            match = texture_paths.get((token + suffix).lower())
            if match:
                wanted["Normal"] = match
                break
        for sock, name, path in bs.wire_textures(material, wanted):
            print("   MATERIAL MAP", material.name, sock, name, path)

    emission = texture_paths.get((token + "_Emissive.png").lower())
    principled = next(
        (node for node in material.node_tree.nodes if node.type == "BSDF_PRINCIPLED"),
        None,
    )
    if emission and principled:
        color = principled.inputs.get("Emission Color")
        strength = principled.inputs.get("Emission Strength")
        if color is None or strength is None:
            raise RuntimeError("material lacks emission inputs: " + material.name)
        image = bpy.data.images.load(emission, check_existing=False)
        image.name = os.path.basename(emission)
        image.pack()
        tex = material.node_tree.nodes.new("ShaderNodeTexImage")
        tex.name = "Emissive_" + token
        tex.label = "Emissive " + token
        tex.image = image
        tex.location = (-520, -420)
        material.node_tree.links.new(tex.outputs["Color"], color)
        strength.default_value = 1.0
        print("   EMISSIVE", material.name, image.name)

print("SCENE OBJECTS")
for obj in bpy.data.objects:
    tris = len(obj.data.polygons) if obj.type == "MESH" else 0
    print("   OBJECT", obj.name, obj.type, "tris", tris, "parent",
          obj.parent.name if obj.parent else None)

for image in bpy.data.images:
    if image.size[0] and not image.packed_file:
        image.pack()

if rig:
    rig.show_in_front = False
for obj in bpy.context.view_layer.objects:
    obj.select_set(False)
body.select_set(True)
bpy.context.view_layer.objects.active = body

corners = [body.matrix_world @ Vector(corner) for corner in body.bound_box]
centre = Vector((
    (min(v.x for v in corners) + max(v.x for v in corners)) / 2,
    (min(v.y for v in corners) + max(v.y for v in corners)) / 2,
    (min(v.z for v in corners) + max(v.z for v in corners)) / 2,
))
camera = bpy.context.scene.camera
if camera is None:
    raise RuntimeError("scene camera is missing")
height = max(max(v.z for v in corners) - min(v.z for v in corners), 0.2)
width = max(max(v.x for v in corners) - min(v.x for v in corners),
            max(v.y for v in corners) - min(v.y for v in corners), 0.2)
view_distance = max(height, width) * 2.3

for screen in bpy.data.screens:
    for area in screen.areas:
        if area.type == "VIEW_3D":
            space = area.spaces.active
            space.shading.type = "MATERIAL"
            space.overlay.show_bones = False
            space.overlay.show_extras = False
            space.overlay.show_relationship_lines = False
            space.region_3d.view_location = centre
            space.region_3d.view_rotation = camera.rotation_euler.to_quaternion()
            space.region_3d.view_distance = view_distance

bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(out_path), compress=True)
print("FINAL SCENE OBJECTS", len(bpy.data.objects))
print("SAVED", os.path.abspath(out_path), os.path.getsize(out_path))
