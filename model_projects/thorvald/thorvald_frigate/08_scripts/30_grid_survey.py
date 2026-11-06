"""Render a donor in orthographic top / side / front views and write the pixel->world
mapping, so 31_grid_overlay.py can draw a labelled coordinate grid for choosing cut boxes.

    blender -b --factory-startup --python 30_grid_survey.py -- <donor> <outdir> [--box x0,x1,y0,y1,z0,z1] [--cyl c1,c2,r,lo,hi,axis] [--px 900]

Coordinates are the donor's baked space (the same numbers cut_box / box_abs use).
--box keeps only faces whose centroid is in the box, to check a cut before committing.
"""
import importlib
import json
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw

argv = sys.argv[sys.argv.index("--") + 1:]
key, outdir = argv[0], os.path.abspath(argv[1])
px = int(argv[argv.index("--px") + 1]) if "--px" in argv else 900
box = None
if "--box" in argv:
    box = [float(t) for t in argv[argv.index("--box") + 1].split(",")]
cyl = None
if "--cyl" in argv:
    t = argv[argv.index("--cyl") + 1].split(",")
    cyl = [float(v) for v in t[:5]] + [t[5]]
os.makedirs(outdir, exist_ok=True)

bs.reset_scene()
rel, stem = B.donor(key)
objs = B.import_and_flatten(rel, "d")
bpy.context.view_layer.update()
if box:
    kept, total = B.cut_box(objs, box, "--strict" in argv)
    print("BOXCUT kept %d/%d" % (kept, total))
if cyl:
    kept, total = B.cut_cyl(objs, cyl, "--strict" in argv)
    print("CYLCUT kept %d/%d" % (kept, total))
mat = B.make_material("Mat_d", B.texture_paths(stem), "steel")
B.apply_material(objs, mat)
pw.soften_world()
pw.gamelike(mat)
mn, mx = B.bounds(objs)
c, size = (mn + mx) / 2, mx - mn
span = max(size.x, size.y, size.z)
scale = span * 1.12

bs.setup_render(px, px)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=scale, distance=span * 3)
meta = {"donor": key, "scale": scale, "px": px, "centre": list(c), "bounds": [list(mn), list(mx)], "views": {}}
# name: (camera direction from target, image-right world axis, image-up world axis)
views = {"top": ((0, -0.0001, 1), "x", "y"), "side": ((0, -1, 0.0001), "x", "z"),
         "front": ((-1, 0, 0.0001), "-y", "z")}
for name, (d, rx, ry) in views.items():
    cam.location = c + Vector(d).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(outdir, "%s_%s.png" % (key, name)), cam)
    meta["views"][name] = {"right": rx, "up": ry}
json.dump(meta, open(os.path.join(outdir, key + "_meta.json"), "w"))
print("GRID_OK", key, [round(v, 2) for v in mn], [round(v, 2) for v in mx])
