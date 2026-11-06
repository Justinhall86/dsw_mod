"""Close-up diagnostic of a variant .blend: neck/shoulders, textured and with one flat colour per object.

    blender -b <variant.blend> --python 05_diag.py -- <out_dir> [tag]

Colours: base body = grey, head = blue, every fill = orange.  Views: front, 3/4 left, 3/4 right, side, back.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402

args = script_args()
out = os.path.abspath(args[0])
tag = args[1] if len(args) > 1 else "diag"
os.makedirs(out, exist_ok=True)

VIEWS = {"front": (0, -1, 0.05), "tqL": (0.7, -0.7, 0.1), "tqR": (-0.7, -0.7, 0.1),
         "sideL": (1, 0, 0.05), "back": (0, 1, 0.05), "high": (0.3, -0.6, 0.75)}
target = Vector((0, 0.0, 1.60))


def shoot(prefix):
    bs.setup_render(600, 600)
    for name, d in VIEWS.items():
        cam = bs.setup_camera(target=target, ortho_scale=0.8, direction=d, distance=4)
        bs.render_to(os.path.join(out, "%s_%s_%s.png" % (tag, prefix, name)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)


shoot("tex")

flat = {}
for o in bpy.data.objects:
    if o.type != "MESH":
        continue
    col = (0.55, 0.55, 0.55, 1)
    if "Head" in o.name:
        col = (0.15, 0.35, 0.95, 1)
    elif "Fill" in o.name:
        col = (1.0, 0.45, 0.05, 1)
    key = col
    if key not in flat:
        m = bpy.data.materials.new("flat%d" % len(flat))
        m.use_nodes = True
        m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = col
        flat[key] = m
    o.data.materials.clear()
    o.data.materials.append(flat[key])
shoot("flat")
