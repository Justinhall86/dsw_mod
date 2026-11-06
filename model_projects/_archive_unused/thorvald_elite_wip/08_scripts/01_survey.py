"""Render every candidate unit front + back (one Blender run, fresh scene each).

    blender -b --python 01_survey.py -- [Key ...]
"""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import UNITS, paths  # noqa: E402

OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "01_survey")
os.makedirs(OUT, exist_ok=True)
keys = script_args() or list(UNITS)

for key in keys:
    fbx, wanted = paths(key)
    bs.reset_scene()
    body, rig = bs.import_model(fbx)
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            for sock, name, _ in bs.wire_textures(mat, wanted):
                pass
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(500, 700)
    print("UNIT", key, "tris", len(body.data.polygons), "mats", [m.name for m in body.data.materials])
    for tag, d in (("front", (0, -1, 0)), ("back", (0, 1, 0))):
        cam = bs.frame_camera_on(body, margin=1.1, direction=d)
        bs.render_to(os.path.join(OUT, "%s_%s.png" % (key, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
