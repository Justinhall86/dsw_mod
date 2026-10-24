"""Step 17 - render the Maula rifle on its own, from a few angles, to work out
which end is the barrel and how the game orients it.

  blender -b --python 08_scripts/17_rifle_orient.py
"""
import math
import os

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
OUT = os.path.join(PROJ, "02_progress_photos", "07_rifle")
os.makedirs(OUT, exist_ok=True)
RIFLE = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_MaulaRifle_TRUE_FBX.fbx"

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=RIFLE)
rifle = bpy.data.objects.get("MaulaRifle")
cube = bpy.data.objects.get("Cube")
if cube:
    print("DELETING helper Cube: %d tris, dimensions %s"
          % (len(cube.data.polygons), tuple(round(v, 2) for v in cube.dimensions)))
    bpy.data.objects.remove(cube, do_unlink=True)
for n in ("Camera", "Light"):
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)

world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.7, 0.72, 0.75, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.5
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 3.0
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(60), 0.0, math.radians(30))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

# frame the rifle from its own bounds so nothing is cropped
bb = [rifle.matrix_world @ Vector(c) for c in rifle.bound_box]
lo = Vector((min(b.x for b in bb), min(b.y for b in bb), min(b.z for b in bb)))
hi = Vector((max(b.x for b in bb), max(b.y for b in bb), max(b.z for b in bb)))
centre = (lo + hi) / 2
size = hi - lo
print("rifle bounds size %s  centre %s" % (tuple(round(v, 3) for v in size),
                                           tuple(round(v, 3) for v in centre)))

for name, (direction, axis) in {
    "side_X": (Vector((1.0, 0.0, 0.0)), 0),
    "side_Y": (Vector((0.0, 1.0, 0.0)), 1),
    "top_Z": (Vector((0.0, 0.0, 1.0)), 2),
    "three_quarter": (Vector((0.8, 0.5, 0.35)), 2),
}.items():
    # ortho_scale covers the LARGER screen dimension
    if name.startswith("side"):
        w, h = max(size.x, size.y), size.z
    elif name == "top_Z":
        w, h = max(size.x, size.y), size.z
    else:
        w, h = max(size.x, size.y, size.z), max(size.x, size.y, size.z)
    if name == "top_Z":
        sc.render.resolution_x, sc.render.resolution_y = 600, 1200
        cd.ortho_scale = max(h, w * 1200.0 / 600.0) * 1.15
    elif name == "three_quarter":
        sc.render.resolution_x, sc.render.resolution_y = 1200, 800
        cd.ortho_scale = max(w, h * 1200.0 / 800.0) * 1.15
    else:
        sc.render.resolution_x, sc.render.resolution_y = 1200, 600
        cd.ortho_scale = max(w, h * 1200.0 / 600.0) * 1.15
    d = direction.normalized()
    cam.location = centre + d * 4.0
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, f"rifle_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", sc.render.filepath, "ortho_scale %.3f" % cd.ortho_scale)
