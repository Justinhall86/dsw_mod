"""Import one registered donor unit (textured, with its rig) and save it as a blend, for comparing against the kitbash in the same animation.
    blender -b --python make_vanilla_blend.py -- <UnitKey> <out.blend>"""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import paths  # noqa: E402

key, out = script_args()[0], os.path.abspath(script_args()[1])
fbx, wanted = paths(key)
bs.reset_scene()
body, rig = bs.import_model(fbx)
for mat in body.data.materials:
    if mat and mat.use_nodes:
        for _ in bs.wire_textures(mat, wanted):
            pass
rig.name = "Armature"
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.pack_all_images()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("VANILLA saved", out)
