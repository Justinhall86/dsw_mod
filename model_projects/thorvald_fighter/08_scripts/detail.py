"""Close-up renders of each kitbash component, framed on its own bounding box.

    blender -b --python detail.py -- <src.blend> <out_dir> <tag>
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\08_scripts")
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
os.makedirs(out, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=src)
bpy.context.view_layer.update()
PW.apply_all()
for o in bpy.data.objects:
    o.hide_render = False

bs.setup_render(900, 900)
TARGETS = [("scanner", "TK_Scanner", (0.8, -0.8, 0.45)),
           ("module", "TK_Module", (0.8, -0.8, 0.40)),
           ("turret", "TK_Turret", (0.9, -0.6, 0.35)),
           ("dome", "TK_SensorDome", (0.7, -0.7, 0.55))]
for name, obname, d in TARGETS:
    ob = bpy.data.objects[obname]
    pts = [ob.matrix_world @ Vector(c) for c in ob.bound_box]
    lo = Vector(tuple(min(p[i] for p in pts) for i in range(3)))
    hi = Vector(tuple(max(p[i] for p in pts) for i in range(3)))
    c = (lo + hi) / 2
    span = max((hi - lo).length, 0.6)
    cam = bs.setup_camera(target=c, ortho_scale=span * 1.5, direction=d, distance=span * 4)
    p = os.path.join(out, "%s_%s.png" % (tag, name))
    bs.render_to(p, cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("DONE detail views ->", out)
