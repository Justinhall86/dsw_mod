"""Render standard textured views of the Renegade kitbash.

    blender -b --python views.py -- <src.blend|.fbx> <out_dir> <tag> [--px 900] [--no-wire]

Wiring is preview-only (MetallicGlossAO read the way the game reads it, neutral world) and is never saved.
Views: front (-Y), back (+Y), right (+X), left (-X), tq, below_tq, top.
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(os.path.dirname(HERE), "..", "..", "thorvald_vehicles", "08_scripts"))
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\08_scripts")
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
px = int(a[a.index("--px") + 1]) if "--px" in a else 900
os.makedirs(out, exist_ok=True)

bpy.ops.wm.read_factory_settings(use_empty=True)
if src.lower().endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=src)
else:
    bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()
for o in [o for o in bpy.data.objects if o.name.split(".")[0] in bs.JUNK_NAMES or o.type in ("CAMERA", "LIGHT")]:
    if o.type != "ARMATURE":
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh")
for m in meshes:
    m.hide_render = False
if "--no-wire" not in a:
    PW.apply_all()

lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in meshes:
    a_, b_ = bs.model_bounds(o)
    lo = Vector((min(lo.x, a_.x), min(lo.y, a_.y), min(lo.z, a_.z)))
    hi = Vector((max(hi.x, b_.x), max(hi.y, b_.y), max(hi.z, b_.z)))
c = (lo + hi) / 2
dx, dy, dz = hi.x - lo.x, hi.y - lo.y, hi.z - lo.z
ortho = 1.12 * max((dx * dx + dy * dy) ** 0.5, 1.6 * dz, 2.0)
print("BOUNDS lo", tuple(round(v, 3) for v in lo), "hi", tuple(round(v, 3) for v in hi), "ortho", round(ortho, 3))

VIEWS = [
    ("front", (0, -1, 0.06)),
    ("back", (0, 1, 0.06)),
    ("right", (1, 0, 0.06)),
    ("left", (-1, 0, 0.06)),
    ("tq", (0.72, -0.72, 0.30)),
    ("tq_low", (0.72, -0.72, -0.42)),
    ("below", (0.25, -0.35, -1.0)),
    ("top", (0.1, -0.2, 1.0)),
]
bs.setup_render(px, int(px * 0.75))
written = []
for name, d in VIEWS:
    cam = bs.setup_camera(target=c, ortho_scale=ortho, direction=d, distance=ortho * 3)
    p = os.path.join(out, "%s_%s.png" % (tag, name))
    bs.render_to(p, cam)
    written.append(p)
    bpy.data.objects.remove(cam, do_unlink=True)
print("WROTE", len(written), "views ->", out)
