"""Render every island of one object in a variant .blend that touches the neck box, alone, textured.

    blender -b <variant.blend> --python 06_neck_parts.py -- <object name> <out_dir>
"""
import json
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))),
                                ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
from dsw_core import script_args  # noqa: E402

name, out = script_args()[:2]
out = os.path.abspath(out)
os.makedirs(out, exist_ok=True)
body = bpy.data.objects[name]
for o in bpy.data.objects:
    if o.type == "MESH":
        o.hide_render = True
bs.setup_render(300, 300)
listing = []
for ci, comp in enumerate(P.components(body)):
    info = P.comp_info(body, comp)
    lo, hi = info["lo"], info["hi"]
    if hi[2] < 1.52 or lo[2] > 1.95 or min(abs(lo[0]), abs(hi[0])) > 0.22 and lo[0] * hi[0] > 0:
        continue
    part = body.copy()
    part.data = body.data.copy()
    bpy.context.collection.objects.link(part)
    P.delete_verts(part, comp, invert=True)
    part.hide_render = False
    cam = bs.setup_camera(target=Vector((0, 0, 1.62)), ortho_scale=0.7, direction=(0.5, -0.8, 0.25), distance=4)
    bs.render_to(os.path.join(out, "part_%03d.png" % ci), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
    bpy.data.objects.remove(part, do_unlink=True)
    info["id"] = ci
    info["view"] = "tq"
    listing.append(info)
json.dump(listing, open(os.path.join(out, "components.json"), "w"), indent=1)
print("NECKPARTS", len(listing))
