"""Render orthographic + 3/4 views of the current scene for design reference.

    blender -b <blend> --python 04_views.py -- <outdir> [tag] [--ortho]
"""
import bpy
import math
import os
import sys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
OUTDIR = argv[0]
TAG = argv[1] if len(argv) > 1 else "view"
ORTHO = "--ortho" in argv
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

cam_data = bpy.data.cameras.new("ViewCam")
cam = bpy.data.objects.new("ViewCam", cam_data)
scene.collection.objects.link(cam)
scene.camera = cam
cam_data.type = "ORTHO" if ORTHO else "PERSP"
cam_data.ortho_scale = size * 1.15
cam_data.lens = 60
cam_data.clip_end = 500

scene.render.resolution_x = 900
scene.render.resolution_y = 900
scene.render.film_transparent = False
try:
    scene.render.engine = "BLENDER_EEVEE_NEXT"
except Exception:
    scene.render.engine = "BLENDER_EEVEE"
scene.render.image_settings.file_format = "PNG"

VIEWS = {
    "top":    (0.0, 90.0),
    "front":  (0.0, 8.0),
    "back":   (180.0, 8.0),
    "side":   (90.0, 6.0),
    "tq":     (38.0, 22.0),
}
if ORTHO:
    VIEWS = {"top": (0.0, 90.0), "side": (90.0, 0.0), "front": (0.0, 0.0), "back": (180.0, 0.0)}

FOCUS = None
if "--focus" in argv:
    FOCUS = argv[argv.index("--focus") + 1]
    fo = bpy.data.objects.get(FOCUS)
    if fo:
        dg = bpy.context.evaluated_depsgraph_get()
        ev = fo.evaluated_get(dg)
        pts = [ev.matrix_world @ v.co for v in ev.to_mesh().vertices]
        ev.to_mesh_clear()
        mn = Vector((min(p[i] for p in pts) for i in range(3)))
        mx = Vector((max(p[i] for p in pts) for i in range(3)))
        ctr = (mn + mx) / 2
        size = max(mx - mn) * 0.75
        cam_data.ortho_scale = size * 1.15
        VIEWS = {"close_tq": (34.0, 26.0), "close_top": (0.0, 90.0),
                 "close_side": (90.0, 6.0), "close_front": (0.0, 6.0)}
        dist = size * 2.6

dist = size * (2.6 if not ORTHO else 1.6)
for name, (az, el) in VIEWS.items():
    a = math.radians(az)
    e = math.radians(el)
    d = Vector((math.sin(a) * math.cos(e), -math.cos(a) * math.cos(e), math.sin(e)))
    cam.location = ctr + d * dist
    direction = ctr - cam.location
    cam.rotation_euler = direction.to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUTDIR, "%s_%s.png" % (TAG, name))
    bpy.ops.render.render(write_still=True)
    print("RENDER", scene.render.filepath)
