"""Step 21 - render showcase angles straight from a saved .blend.

The .blend already contains a camera, lights and world, so the cleanest way
to show "the finished product" is to open the .blend and point the camera at
the character from a few angles.  Nothing is modified or re-saved.

  blender -b --python 08_scripts/21_showcase.py -- <blend> <out_dir> <tag>

Angles: front, three-quarter, side, back (to show the removed backpack),
plus a back close-up.
"""
import os
import sys
import math

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
blend = os.path.abspath(argv[0]) if argv else os.path.join(
    PROJ, "03_blender", "commando_nopack_house.blend")
out_dir = os.path.abspath(argv[1]) if len(argv) > 1 else os.path.join(
    PROJ, "02_progress_photos", "10_showcase")
tag = argv[2] if len(argv) > 2 else "house"

os.makedirs(out_dir, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=blend)
print("OPENED", blend)

sc = bpy.context.scene
cam = sc.camera
if cam is None:
    raise SystemExit("no camera in the blend")

sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1200
sc.render.image_settings.file_format = "PNG"

# Where the character stands and how tall it is.
focus = Vector((0.0, 0.0, 1.05))

# (name, azimuth in degrees, elevation in degrees, distance, target height)
ANGLES = [
    ("front", 0.0, 4.0, 4.6, 1.05),
    ("three_quarter", 35.0, 4.0, 4.6, 1.05),
    ("side", 90.0, 4.0, 4.6, 1.05),
    ("back", 180.0, 4.0, 4.6, 1.05),
    ("back_closeup", 180.0, 2.0, 2.4, 1.25),
]

for name, az, el, dist, tz in ANGLES:
    a = math.radians(az)
    e = math.radians(el)
    target = Vector((focus.x, focus.y, tz))
    pos = target + Vector((
        math.sin(a) * math.cos(e),
        -math.cos(a) * math.cos(e),
        math.sin(e),
    )) * dist

    cam.location = pos
    direction = target - pos
    cam.rotation_euler = direction.to_track_quat("-Z", "Y").to_euler()

    out = os.path.join(out_dir, "%s_%s.png" % (tag, name))
    sc.render.filepath = out
    bpy.ops.render.render(write_still=True)
    print("RENDERED", out, os.path.getsize(out), "bytes")
