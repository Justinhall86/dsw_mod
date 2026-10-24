"""Render every component of a DSW body ALONE (front, rest pose) and list them, so parts can be picked by eye.

  blender -b --python part_gallery.py -- --blend <file.blend> --object <body name> --out <dir>
          [--min-verts 12] [--zmin 1.3] [--zmax 2.1] [--xmin 0.0] [--skip-hands]

Writes <out>/part_<id>_<verts>v_<bone>.png and <out>/components.json (id, verts, bbox, top bones).
Then: python contact_sheet.py <out> to get one labelled sheet.
Keep --min-verts low (~12): composite parts (the HouseGuard pauldron = frame + 2 plates + 10 studs) are mostly
small components and a 50-vert cut-off hides them.
"""
import argparse
import json
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
ap.add_argument("--object", required=True)
ap.add_argument("--out", required=True)
ap.add_argument("--min-verts", type=int, default=12)
ap.add_argument("--zmin", type=float, default=1.3, help="keep components whose centre z is above this (upper body)")
ap.add_argument("--zmax", type=float, default=9.0)
ap.add_argument("--xmin", type=float, default=0.0, help="keep components whose |centre x| is at least this")
ap.add_argument("--skip-hands", action="store_true")
a = ap.parse_args(P.script_args())
a.out = os.path.abspath(a.out)   # Blender resolves relative render paths against the drive root

bpy.ops.wm.open_mainfile(filepath=a.blend)
sc = bpy.context.scene
for o in bpy.data.objects:
    if o.type == "ARMATURE":
        P.rest_pose(o)
body = bpy.data.objects[a.object]
for o in bpy.data.objects:
    if o.type == "MESH":
        o.hide_render = True
P.setup_scene(sc, res=360)
cd = bpy.data.cameras.new("cam")
cam = bpy.data.objects.new("cam", cd)
bpy.context.collection.objects.link(cam)
centre = Vector((0, 0, 1.5))
cam.location = centre + Vector((0, -4, 0))
cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
cd.type, cd.ortho_scale = "ORTHO", 1.25
sc.camera = cam
os.makedirs(a.out, exist_ok=True)

listing = []
for ci, comp in enumerate(P.components(body)):
    if len(comp) < a.min_verts:
        continue
    info = P.comp_info(body, comp)
    cx, cz = abs(info["centre"][0]), info["centre"][2]
    if not (a.zmin <= cz <= a.zmax) or cx < a.xmin:
        continue
    top = info["bones"][0][0].replace("B_", "").replace("J", "") if info["bones"] else "none"
    if a.skip_hands and top[:1] in "lr" and top[1:3] in ("Wr", "Fi", "Th"):
        continue
    part = body.copy()
    part.data = body.data.copy()
    bpy.context.collection.objects.link(part)
    P.delete_verts(part, comp, invert=True)
    part.hide_render = False
    sc.render.filepath = os.path.join(a.out, "part_%03d_%03dv_%s.png" % (ci, len(comp), top))
    bpy.ops.render.render(write_still=True)
    bpy.data.objects.remove(part, do_unlink=True)
    info["id"] = ci
    listing.append(info)
json.dump(listing, open(os.path.join(a.out, "components.json"), "w"), indent=1)
print("GALLERY", a.object, len(listing), "parts ->", a.out)
