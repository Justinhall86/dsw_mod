"""Point the drone and cannon materials at the clean Thorvald albedos and save a new blend.

    blender -b <in.blend> --python swap_albedo.py -- <out.blend>
"""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
drone_tex = os.path.join(PROJ, "04_textures", "drone", "CombatDrone_Thorvald_Clean_Albedo.png")
cannon_tex = os.path.join(PROJ, "04_textures", "banshee", "Banshee_Thorvald_Albedo.png")
for mat in bpy.data.materials:
    if not mat.use_nodes:
        continue
    if mat.name == "CombatDrone_mat":
        # the albedo feeds an AO Mix node, so wire_textures cannot tell its socket: replace that image node's datablock directly
        for n in mat.node_tree.nodes:
            if n.type == "TEX_IMAGE" and n.image and "Albedo" in n.image.name:
                img = bpy.data.images.load(drone_tex, check_existing=False)
                img.name = os.path.basename(drone_tex)
                n.image = img
                print("DRONE albedo ->", drone_tex)
    elif mat.name.startswith("Mat_ThorvaldCannon"):
        print("CANNON", bs.wire_textures(mat, {"Base Color": cannon_tex}))
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out)
