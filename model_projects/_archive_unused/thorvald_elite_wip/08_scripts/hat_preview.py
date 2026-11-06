"""Render a single-mesh .blend (the extracted hat) as grey clay from side, front, below and above.

    blender -b <hat.blend> --python hat_preview.py -- <out_dir>
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
os.makedirs(out, exist_ok=True)
ob = next(o for o in bpy.data.objects if o.type == "MESH")
mat = bpy.data.materials.new("clay")
mat.use_nodes = True
b = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
b.inputs["Base Color"].default_value = (0.35, 0.33, 0.32, 1)
b.inputs["Roughness"].default_value = 0.8
ob.data.materials.clear()
ob.data.materials.append(mat)
bs.setup_world(strength=1.6, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(600, 600)
lo = Vector(ob.bound_box[0])
hi = Vector(ob.bound_box[6])
centre = (Vector(ob.bound_box[0]) + Vector(ob.bound_box[6])) / 2
for tag, d in (("side", (1, 0, 0.05)), ("front", (0, -1, 0.05)), ("below", (0.5, -0.5, -0.75)), ("above", (0.5, -0.5, 0.75))):
    cam = bs.setup_camera(target=centre, ortho_scale=0.7, direction=d, distance=3)
    bs.render_to(os.path.join(out, "hat_%s.png" % tag), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("HATPREVIEW done")
