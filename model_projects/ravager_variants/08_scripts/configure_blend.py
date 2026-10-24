"""Make a built Ravager blend portable and open it in a textured preview."""
import os
import sys

import bpy
from mathutils import Vector


def arguments():
    if "--" not in sys.argv:
        raise SystemExit("usage: configure_blend.py -- <blend> <texture_dir>")
    args = sys.argv[sys.argv.index("--") + 1:]
    if len(args) != 2:
        raise SystemExit("usage: configure_blend.py -- <blend> <texture_dir>")
    return os.path.abspath(args[0]), os.path.abspath(args[1])


blend_path, texture_root = arguments()
if not os.path.isfile(blend_path):
    raise FileNotFoundError(blend_path)
if not os.path.isdir(texture_root):
    raise NotADirectoryError(texture_root)

project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
skill_scripts = os.path.join(
    project_root, ".claude", "skills", "dsw-model-workshop", "scripts"
)
sys.path.insert(0, skill_scripts)
import blender_scene as bs

bpy.ops.wm.open_mainfile(filepath=blend_path)

body = max(
    (obj for obj in bpy.data.objects if obj.type == "MESH"),
    key=lambda obj: len(obj.data.polygons),
    default=None,
)
if body is None:
    raise RuntimeError("The blend contains no body mesh")

texture_paths = {}
for folder, _, names in os.walk(texture_root):
    for name in names:
        if not name.lower().endswith(".png"):
            continue
        if name in texture_paths:
            raise RuntimeError("Duplicate texture filename: %s" % name)
        texture_paths[name] = os.path.join(folder, name)

relinked = []
for material in body.data.materials:
    if material is None or not material.use_nodes:
        continue
    for node in material.node_tree.nodes:
        if node.type != "TEX_IMAGE" or node.image is None:
            continue
        basename = os.path.basename(bpy.path.abspath(node.image.filepath))
        if not basename:
            basename = node.image.name
        path = texture_paths.get(basename)
        if path is None:
            raise FileNotFoundError(
                "No project texture found for %s in material %s"
                % (basename, material.name)
            )
        image = bpy.data.images.load(path, check_existing=False)
        image.name = basename
        image.colorspace_settings.name = (
            "sRGB" if "_Albedo." in basename else "Non-Color"
        )
        node.image = image
        relinked.append((material.name, basename))

if not relinked:
    raise RuntimeError("No material image textures were linked")

for image in list(bpy.data.images):
    if image.users == 0:
        bpy.data.images.remove(image)

rig = next((obj for obj in bpy.data.objects if obj.type == "ARMATURE"), None)
if rig is not None:
    rig.show_in_front = False
    rig.display_type = "WIRE"
    rig.hide_set(True)

for obj in list(bpy.data.objects):
    if obj is body or obj is rig or obj is bpy.context.scene.camera:
        continue
    if obj.name in {"Cube", "Camera", "Light", "Lamp"}:
        bpy.data.objects.remove(obj, do_unlink=True)

corners = [body.matrix_world @ Vector(corner) for corner in body.bound_box]
view_center = Vector((
    sum(corner.x for corner in corners) / len(corners),
    sum(corner.y for corner in corners) / len(corners),
    sum(corner.z for corner in corners) / len(corners),
))
model_height = max(corner.z for corner in corners) - min(
    corner.z for corner in corners
)
camera = bpy.context.scene.camera
if camera is None:
    raise RuntimeError("The blend contains no showcase camera")

for screen in bpy.data.screens:
    for area in screen.areas:
        if area.type != "VIEW_3D":
            continue
        space = area.spaces.active
        space.shading.type = "MATERIAL"
        space.shading.use_scene_lights = False
        space.shading.use_scene_world = False
        space.overlay.show_extras = False
        space.overlay.show_floor = False
        space.overlay.show_axis_x = False
        space.overlay.show_axis_y = False
        space.overlay.show_cursor = False
        space.overlay.show_relationship_lines = False
        space.region_3d.view_perspective = "CAMERA"
        space.region_3d.view_location = view_center
        space.region_3d.view_rotation = camera.rotation_euler.to_quaternion()
        space.region_3d.view_distance = max(model_height * 1.8, 2.5)

for obj in bpy.context.selected_objects:
    obj.select_set(False)
bpy.context.view_layer.objects.active = None

packed = bs.pack_all_images()
image_problems = [
    image.name
    for image in bpy.data.images
    if image.users and image.size[0] and not image.packed_file
]
if image_problems:
    raise RuntimeError("Textures were not packed: %s" % ", ".join(image_problems))

bpy.context.preferences.filepaths.save_version = 0
bpy.ops.wm.save_as_mainfile(filepath=blend_path, compress=True)

print("CONFIGURED", blend_path)
print("BODY", body.name, "triangles", len(body.data.polygons))
print("MATERIAL TEXTURES", relinked)
print("NEWLY PACKED", packed)
print(
    "PACKED IMAGES",
    [(image.name, tuple(image.size), bool(image.packed_file))
     for image in bpy.data.images if image.users and image.size[0]],
)
