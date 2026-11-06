"""Close-up renders of one blend, rest pose, matte game-like light.

  blender -b --factory-startup --python inspect_closeup.py -- <blend> <out_dir> <name>:<x>,<y>,<z>:<ortho>:<view> ...
  view = front | side | tq | back | top
"""
import math
import os
import sys

import bpy
from mathutils import Vector

args = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.open_mainfile(filepath=args[0])
out = args[1]
os.makedirs(out, exist_ok=True)
sc = bpy.context.scene
for o in bpy.data.objects:
    if o.type == "ARMATURE":
        o.data.pose_position = "REST"
for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
cam = bpy.data.objects.new("CloseCam", bpy.data.cameras.new("CloseCam"))
cam.data.type = "ORTHO"
sc.collection.objects.link(cam)
sc.camera = cam
for rot, e in (((50, 0, 30), 3.0), ((60, 0, 200), 1.2)):
    s = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
    s.data.energy = e
    s.rotation_euler = [math.radians(v) for v in rot]
    sc.collection.objects.link(s)
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = sc.render.resolution_y = 500
sc.view_settings.view_transform = "Standard"
DIRS = {"front": (0, -1, 0), "back": (0, 1, 0), "side": (1, 0, 0), "tq": (0.7, -0.7, 0.15), "top": (0.2, -0.4, 1)}
for spec in args[2:]:
    name, c, ortho, view = spec.split(":")
    c = Vector([float(v) for v in c.split(",")])
    cam.data.ortho_scale = float(ortho)
    cam.location = c + Vector(DIRS[view]).normalized() * 4
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(out, name + ".png")
    bpy.ops.render.render(write_still=True)
print("CLOSEUPS", out)
