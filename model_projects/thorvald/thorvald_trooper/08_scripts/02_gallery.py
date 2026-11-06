"""Render every component of a unit ALONE (front, or back if it sits behind the body) with its id.

    blender -b --python 02_gallery.py -- <UnitKey> [--min-verts 40]

Writes 02_progress_photos/02_components/<Unit>/part_<id>.png + components.json, then labelled sheet with sheet_parts.py.
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
from units import paths  # noqa: E402

args = script_args()
key = args[0]
min_verts = int(args[args.index("--min-verts") + 1]) if "--min-verts" in args else 40
out = os.path.join(os.path.dirname(HERE), "02_progress_photos", "02_components", key)
os.makedirs(out, exist_ok=True)

fbx, wanted = paths(key)
bs.reset_scene()
body, rig = bs.import_model(fbx)
for mat in body.data.materials:
    if mat and mat.use_nodes:
        bs.wire_textures(mat, wanted)
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(300, 420)
body.hide_render = True

listing = []
for ci, comp in enumerate(P.components(body)):
    if len(comp) < min_verts:
        break
    info = P.comp_info(body, comp)
    part = body.copy()
    part.data = body.data.copy()
    bpy.context.collection.objects.link(part)
    P.delete_verts(part, comp, invert=True)
    part.hide_render = False
    d = (0, 1, 0) if info["centre"][1] > 0.02 else (0, -1, 0)
    cam = bs.setup_camera(target=Vector((0, 0, 1.0)), ortho_scale=2.2, direction=d, distance=6)
    bs.render_to(os.path.join(out, "part_%03d.png" % ci), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
    bpy.data.objects.remove(part, do_unlink=True)
    info["id"] = ci
    info["view"] = "back" if d[1] > 0 else "front"
    listing.append(info)
json.dump(listing, open(os.path.join(out, "components.json"), "w"), indent=1)
print("GALLERY", key, len(listing))
