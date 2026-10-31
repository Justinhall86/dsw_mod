import os

import bpy
from mathutils import Vector


repo = r"C:\Users\justi\Python\dsw_mod"
project = os.path.join(repo, "model_projects", "freecompany_unarmed")
blend = os.path.join(project, "03_blender", "FreeCompany_Unarmed.blend")
emissive_path = os.path.join(
    project, "01_input", "Smuggler_FreeCompany_Emissive.png")

bpy.ops.wm.open_mainfile(filepath=blend)

body = bpy.data.objects.get("FreeCompany")
rig = bpy.data.objects.get("Armature")
if body is None or body.type != "MESH":
    raise RuntimeError("FreeCompany body mesh is missing")
if rig is None or rig.type != "ARMATURE":
    raise RuntimeError("Female01 armature is missing")
if not os.path.isfile(emissive_path):
    raise FileNotFoundError(emissive_path)

materials = [m for m in body.data.materials if m and m.use_nodes]
if not materials:
    raise RuntimeError("body has no node-based material")
material = materials[0]
for node in list(material.node_tree.nodes):
    if node.type == "TEX_IMAGE" and node.name.startswith("FreeCompany Emissive"):
        material.node_tree.nodes.remove(node)
for old_image in list(bpy.data.images):
    if old_image.name.startswith("Smuggler_FreeCompany_Emissive.png") \
            and old_image.users == 0:
        bpy.data.images.remove(old_image)

principled = next(
    (node for node in material.node_tree.nodes
     if node.type == "BSDF_PRINCIPLED"),
    None,
)
if principled is None:
    raise RuntimeError("body material has no Principled BSDF")

emission_color = principled.inputs.get("Emission Color")
emission_strength = principled.inputs.get("Emission Strength")
if emission_color is None or emission_strength is None:
    raise RuntimeError("Principled BSDF does not expose emission inputs")

image = bpy.data.images.load(emissive_path, check_existing=False)
image.name = os.path.basename(emissive_path)
image.pack()
texture = material.node_tree.nodes.new("ShaderNodeTexImage")
texture.name = "FreeCompany Emissive"
texture.label = "FreeCompany Emissive"
texture.image = image
texture.location = (-520, -420)
material.node_tree.links.new(texture.outputs["Color"], emission_color)
emission_strength.default_value = 1.0

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

for screen in bpy.data.screens:
    for area in screen.areas:
        if area.type != "VIEW_3D":
            continue
        space = area.spaces.active
        space.shading.type = "MATERIAL"
        space.overlay.show_bones = False
        space.overlay.show_extras = False
        space.overlay.show_relationship_lines = False
        space.region_3d.view_location = centre
        space.region_3d.view_rotation = camera.rotation_euler.to_quaternion()
        space.region_3d.view_distance = 4.6

bpy.ops.wm.save_as_mainfile(filepath=blend, compress=True)
print("EMISSIVE", image.name, image.size[:], "packed", bool(image.packed_file))
print("SAVED", blend, os.path.getsize(blend))
