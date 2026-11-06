"""Orthographic reference renders of the textured ship (nose -X).
    blender -b 03_blender/ship_v3_textured.blend --python 43_ref_sheet.py -- <outdir>"""
import os, sys
import bpy
from mathutils import Vector
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs, preview_wiring as pw
out = os.path.abspath(sys.argv[sys.argv.index("--") + 1]); os.makedirs(out, exist_ok=True)
pw.soften_world(); pw.ROUGH_FLOOR = 0.32
for m in bpy.data.materials:
    if m.use_nodes: pw.gamelike(m)
for o in list(bpy.data.objects):
    if o.type == "CAMERA": bpy.data.objects.remove(o, do_unlink=True)
ship = next(o for o in bpy.data.objects if o.type == "MESH")
vs = [ship.matrix_world @ v.co for v in ship.data.vertices]
mn = Vector([min(v[i] for v in vs) for i in range(3)]); mx = Vector([max(v[i] for v in vs) for i in range(3)])
c, size = (mn + mx) / 2, max(mx - mn)
bs.setup_render(1000, 1000)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.86, 0.87, 0.89))
cam = bs.setup_camera(target=c, ortho_scale=size * 1.12, distance=size * 3)
for name, d in {"front": (-1, 0, 0.001), "rear": (1, 0, 0.001), "side": (0, -1, 0.001), "top": (0, -0.001, 1),
                "bottom": (0, -0.001, -1), "tq": (-0.75, -0.8, 0.5)}.items():
    cam.location = c + Vector(d).normalized() * size * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out, "ref_%s.png" % name), cam)
print("REF_DONE")
