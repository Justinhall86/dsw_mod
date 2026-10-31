"""Render a turntable frame sequence of the whole scene.

    blender -b <blend> --python 10_turntable.py -- <outdir> [frames] [res] [az0]
"""
import bpy
import math
import os
import sys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
OUTDIR = os.path.abspath(argv[0])
FRAMES = int(argv[1]) if len(argv) > 1 else 36
RES = int(argv[2]) if len(argv) > 2 else 720
AZ0 = float(argv[3]) if len(argv) > 3 else -25.0
os.makedirs(OUTDIR, exist_ok=True)

scene = bpy.context.scene
objs = [o for o in bpy.data.objects if o.type == "MESH"]
mn = Vector((1e9, 1e9, 1e9))
mx = Vector((-1e9, -1e9, -1e9))
dg = bpy.context.evaluated_depsgraph_get()
for o in objs:
    oe = o.evaluated_get(dg)
    for c in oe.bound_box:
        w = oe.matrix_world @ Vector(c)
        mn = Vector((min(mn[i], w[i]) for i in range(3)))
        mx = Vector((max(mx[i], w[i]) for i in range(3)))
ctr = (mn + mx) / 2
size = max(mx - mn)

cam_data = bpy.data.cameras.new("TurnCam")
cam = bpy.data.objects.new("TurnCam", cam_data)
scene.collection.objects.link(cam)
scene.camera = cam
cam_data.lens = 70
cam_data.clip_end = 500

scene.render.resolution_x = RES
scene.render.resolution_y = RES
scene.render.resolution_percentage = 100
scene.render.film_transparent = False
try:
    scene.render.engine = "BLENDER_EEVEE_NEXT"
except Exception:
    scene.render.engine = "BLENDER_EEVEE"
scene.render.image_settings.file_format = "PNG"
scene.render.image_settings.color_mode = "RGB"
scene.view_settings.view_transform = "AgX"

EL = math.radians(19.0)
dist = size * 2.6
for i in range(FRAMES):
    az = math.radians(AZ0 + 360.0 * i / FRAMES)
    d = Vector((math.sin(az) * math.cos(EL), -math.cos(az) * math.cos(EL), math.sin(EL)))
    cam.location = ctr + d * dist
    cam.rotation_euler = (ctr - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUTDIR, "f%03d.png" % i)
    bpy.ops.render.render(write_still=True)
    print("FRAME", i, scene.render.filepath)
