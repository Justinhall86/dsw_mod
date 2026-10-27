"""Matte, game-style renders of a vehicle blend (posed, as it is seen), four angles, framed on the evaluated geometry.

    blender -b <file.blend> --python render_kit.py -- <out_dir> <tag> [--px 800]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
os.makedirs(out, exist_ok=True)

bpy.context.scene.frame_set(1)
PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
bs.soften_world() if hasattr(bs, "soften_world") else None
meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
dg = bpy.context.evaluated_depsgraph_get()
pts = []
for o in meshes:
    ev = o.evaluated_get(dg)
    me = ev.to_mesh()
    pts += [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
c = Vector(((max(p.x for p in pts) + min(p.x for p in pts)) / 2, (max(p.y for p in pts) + min(p.y for p in pts)) / 2,
            (max(p.z for p in pts) + min(p.z for p in pts)) / 2))
ext = max(max(p.x for p in pts) - min(p.x for p in pts), max(p.y for p in pts) - min(p.y for p in pts),
          max(p.z for p in pts) - min(p.z for p in pts)) / 2
print("FRAME centre", tuple(round(x, 3) for x in c), "half extent", round(ext, 3), "meshes", [m.name for m in meshes])
bs.setup_render(px, px)
VIEWS = {"front": (0, -1, 0.10), "side": (1, 0, 0.10), "back": (0, 1, 0.10), "tq": (0.7, -0.7, 0.35)}
for vn, d in VIEWS.items():
    cam = bs.setup_camera(target=c, ortho_scale=ext * 2.5, direction=d, distance=ext * 6)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, vn)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("KIT RENDERS DONE", tag)
