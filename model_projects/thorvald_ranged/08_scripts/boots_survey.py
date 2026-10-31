"""Lower legs / boots of several donors, three-quarter front, one sheet input per unit.

    blender -b --python boots_survey.py -- <out_dir> Key [Key ...]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from units import paths  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, keys = a[0], a[1:]
os.makedirs(out, exist_ok=True)
for key in keys:
    fbx, wanted = paths(key)
    bs.reset_scene()
    body, rig = bs.import_model(fbx)
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            bs.wire_textures(mat, wanted)
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(420, 520)
    cd = bpy.data.cameras.new("C")
    cd.type = "ORTHO"
    cd.ortho_scale = 0.95
    cam = bpy.data.objects.new("C", cd)
    bpy.context.collection.objects.link(cam)
    tgt = Vector((0.0, 0.0, 0.33))
    cam.location = tgt + Vector((1.4, -3.0, 0.5))
    cam.rotation_euler = (tgt - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out, "boots_%s.png" % key), cam)
    print("BOOTS", key)
