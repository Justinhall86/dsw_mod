"""Step 05 - render the Commando with a chosen texture set, for visual review.

  blender -b --python 08_scripts/05_render_preview.py -- <albedo.png> <tag>

Renders front / three-quarter / side / back into 02_progress_photos/02_recolour/.
"""
import math
import os
import sys
import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_house"
FBX = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
albedo_path = argv[0] if argv else os.path.join(PROJ, "04_textures", "Commando_House_Albedo.png")
tag = argv[1] if len(argv) > 1 else "preview"
OUT = os.path.join(PROJ, "02_progress_photos", "02_recolour")
os.makedirs(OUT, exist_ok=True)

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

# point the material at the chosen albedo
mat = mesh.data.materials[0]
nt = mat.node_tree
for node in nt.nodes:
    if node.type == "TEX_IMAGE" and node.image and "Albedo" in node.image.name:
        node.image.filepath = albedo_path
        node.image.reload()
        print("ALBEDO ->", node.image.name, node.image.filepath)

bpy.context.view_layer.update()
bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z

world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.62, 0.64, 0.68, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.2

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.2
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

cam_data = bpy.data.cameras.new("Cam")
cam_data.type = "ORTHO"
cam_data.ortho_scale = height * 1.12
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE"
scene.render.resolution_x = 900
scene.render.resolution_y = 1200
scene.render.resolution_percentage = 100
scene.view_settings.view_transform = "Standard"

radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
for name, direction in {
    "front": Vector((0.0, -1.0, 0.0)),
    "three_quarter": Vector((0.7, -0.7, 0.0)),
    "side": Vector((1.0, 0.0, 0.0)),
    "back": Vector((0.0, 1.0, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUT, f"commando_{tag}_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", scene.render.filepath)
