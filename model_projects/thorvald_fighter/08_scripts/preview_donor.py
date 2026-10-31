"""Render a converted HMD vehicle with game-style preview wiring, plus per-isolation shots.

    blender -b --python preview_donor.py -- <model.fbx|.blend> <out_dir> <tag> [--px 800]

Converts HMD if needed, applies the shared preview wiring (MetallicGlossAO read the way the game reads it,
neutral world), renders standard angles, then renders the N largest islands isolated in red so donors can be
picked by eye.  Preview wiring is never saved.
"""
import os
import sys
import tempfile

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\08_scripts")
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\HMD_toolkit\HMD_toolkit\Models")
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
n_iso = int(a[a.index("--iso") + 1]) if "--iso" in a else 8
os.makedirs(out, exist_ok=True)

bpy.ops.wm.read_factory_settings(use_empty=True)
if src.lower().endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=src)
else:
    with open(src, "rb") as fh:
        head = fh.read(3)
    if head == b"HMD":
        import hmd2fbx
        tmp = tempfile.mktemp(suffix=".fbx")
        hmd2fbx.convert(src, tmp, verbose=False)
        src = tmp
    bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()
for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
for m in meshes:
    m.hide_render = False
PW.apply_all()

lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in meshes:
    for c in o.bound_box:
        p = o.matrix_world @ Vector(c)
        lo = Vector((min(lo.x, p.x), min(lo.y, p.y), min(lo.z, p.z)))
        hi = Vector((max(hi.x, p.x), max(hi.y, p.y), max(hi.z, p.z)))
c = (lo + hi) / 2
dx, dy, dz = hi.x - lo.x, hi.y - lo.y, hi.z - lo.z
ortho = 1.15 * max((dx * dx + dy * dy) ** 0.5, 1.6 * dz, 2.0)
print("BOUNDS lo", tuple(round(v, 2) for v in lo), "hi", tuple(round(v, 2) for v in hi),
      "size", tuple(round(v, 2) for v in (dx, dy, dz)))

VIEWS = [("tq", (0.7, -0.7, 0.35)), ("top", (0.05, -0.15, 1.0)),
         ("left", (-1, 0, 0.08)), ("back", (0, 1, 0.08))]
bs.setup_render(px, int(px * 0.8))
for name, d in VIEWS:
    cam = bs.setup_camera(target=c, ortho_scale=ortho, direction=d, distance=ortho * 3)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)

# isolate the largest islands so donors can be identified by number
import bmesh  # noqa: E402

ob = meshes[0]
bm = bmesh.new()
bm.from_mesh(ob.data)
bm.verts.ensure_lookup_table()
seen = set()
comps = []
for v in bm.verts:
    if v.index in seen:
        continue
    stack = [v]
    comp = []
    seen.add(v.index)
    while stack:
        cur = stack.pop()
        comp.append(cur)
        for e in cur.link_edges:
            o = e.other_vert(cur)
            if o.index not in seen:
                seen.add(o.index)
                stack.append(o)
    comps.append(comp)
comps.sort(key=len, reverse=True)
vert_of = {}
for i, comp in enumerate(comps):
    for vert in comp:
        vert_of[vert.index] = i

red = bpy.data.materials.new("ISO_RED")
red.use_nodes = True
bsdf = next(n for n in red.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
bsdf.inputs["Base Color"].default_value = (0.85, 0.05, 0.05, 1)
if not ob.data.materials:
    ob.data.materials.append(red)
idx_red = len(ob.data.materials)
ob.data.materials.append(red)

# tag every face with its island index in a temp attribute, then render one shot per island
attr = ob.data.attributes.new("island", "INT", "FACE")
for f in bm.faces:
    attr.data[f.index].value = vert_of[f.verts[0].index]
bm.free()
bm = None

for i in range(min(n_iso, len(comps))):
    for f_i, f in enumerate(ob.data.polygons):
        f.material_index = idx_red if attr.data[f_i].value == i else 0
    cam = bs.setup_camera(target=c, ortho_scale=ortho * 0.75, direction=(0.7, -0.7, 0.35), distance=ortho * 3)
    bs.render_to(os.path.join(out, "%s_iso%02d.png" % (tag, i)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("DONE ->", out)
