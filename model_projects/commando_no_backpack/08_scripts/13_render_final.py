"""Step 13 - render the final no-backpack Commando with a chosen texture set.

  blender -b --python 08_scripts/13_render_final.py -- <fbx> <albedo.png> <tag>

Renders front / three_quarter / side / back into
02_progress_photos/06_final/<tag>_<view>.png
"""
import math
import os
import sys

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
SHOTS = os.path.join(PROJ, "02_progress_photos", "06_final")
os.makedirs(SHOTS, exist_ok=True)

DEFAULT_FBX = os.path.join(PROJ, "05_fbx_export", "Male01_CommandoNoPackHouse.fbx")
DEFAULT_ALBEDO = r"C:\dsw_mod\D4XEditor\res\res\CharMOD\Male01_CommandoNoPackHouse\Male01_CommandoNoPackHouse_Albedo.png"

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
fbx = os.path.abspath(argv[0]) if len(argv) > 0 else DEFAULT_FBX
albedo = os.path.abspath(argv[1]) if len(argv) > 1 else DEFAULT_ALBEDO
tag = argv[2] if len(argv) > 2 else "final"

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
mesh = next(o for o in bpy.data.objects if o.type == "MESH")
for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

# point the albedo at the chosen texture
mat = mesh.data.materials[0]
if mat and mat.use_nodes:
    for node in [n for n in mat.node_tree.nodes if n.type == "TEX_IMAGE"]:
        cur = node.image.name if node.image else ""
        if "Albedo" in cur or "Albedo" in node.name:
            new = bpy.data.images.load(albedo, check_existing=False)
            new.name = cur or os.path.basename(albedo)
            node.image = new
            print("ALBEDO ->", new.name, new.filepath)
            break

world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.62, 0.64, 0.68, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.2
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 3.2
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1200
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

bpy.context.view_layer.update()
bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z
cd.ortho_scale = height * 1.12
radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
for name, direction in {
    "back": Vector((0.0, 1.0, 0.0)),
    "three_quarter": Vector((0.7, 0.7, 0.0)),
    "front": Vector((0.0, -1.0, 0.0)),
    "side": Vector((1.0, 0.0, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(SHOTS, f"{tag}_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", sc.render.filepath)
