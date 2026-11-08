"""Game-like stills of whatever meshes are in the open blend (preview wiring applied, not saved).

    blender -b <blend> --python 73_render_blend.py -- <outdir> [views=tq,tq_rear,top,side,front,rts,close]
"""
import os, sys
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(argv[0]); os.makedirs(out, exist_ok=True)
want = argv[1].split(",") if len(argv) > 1 and argv[1] else ["tq", "tq_rear", "top", "side", "front", "rts", "close"]
# optional 3rd/4th args: swap the cruiser albedo / MGAO for a paint variant (not saved)
for i, stem in ((2, "Thorvald_Cruiser_Albedo"), (3, "Thorvald_Cruiser_MetallicGlossAO")):
    if len(argv) > i:
        for img in bpy.data.images:
            if stem in os.path.basename(img.filepath):
                img.filepath = os.path.abspath(argv[i]); img.reload()
for m in bpy.data.materials:
    if m.use_nodes:
        pw.gamelike(m)
objs = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
pts = [o.matrix_world @ v.co for o in objs for v in o.data.vertices]
mn = Vector([min(p[i] for p in pts) for i in range(3)]); mx = Vector([max(p[i] for p in pts) for i in range(3)])
c = (mn + mx) / 2; span = max(mx - mn)
bs.setup_render(1400, 900)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights(); pw.soften_world()
cam = bs.setup_camera(target=c, ortho_scale=span * 1.1, distance=span * 3)
V = {"tq": (-0.7, -0.7, 0.55), "tq_rear": (0.7, 0.7, 0.55), "top": (-0.0001, 0, 1), "side": (0, -1, 0.08),
     "front": (-1, 0, 0.12)}
for name in want:
    if name in V:
        cam.data.ortho_scale = span * 1.1
        cam.location = c + Vector(V[name]).normalized() * span * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name == "top" else "Y").to_euler()
        bs.render_to(os.path.join(out, name + ".png"), cam)
if "close" in want:                         # shoulder close-up
    t = Vector((27, -38, 3))
    cam.data.ortho_scale = span * 0.38
    cam.location = t + Vector((-0.6, -0.8, 0.55)).normalized() * span * 3
    cam.rotation_euler = (t - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out, "close.png"), cam)
if "rts" in want:
    bs.setup_render(420, 300)
    cam.data.ortho_scale = span * 2.6
    cam.location = c + Vector((-0.35, -0.6, 1.0)).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(out, "rts.png"), cam)
print("RENDER_OK")
