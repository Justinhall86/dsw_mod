"""Highlight specific mesh islands (connected parts) in flat red, the rest flat grey, and render views.

    blender -b --python isolate.py -- <src.blend> <out_dir> <tag> --ids 56,57,68,69

Islands are numbered by vertex count (largest first), the same convention as parts_colour.py, so the ids match
02_progress_photos/parts/renegade_labels.json.
"""
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\08_scripts")
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
ids = {int(x) for x in a[a.index("--ids") + 1].split(",")}
px = int(a[a.index("--px") + 1]) if "--px" in a else 800
os.makedirs(out, exist_ok=True)

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.wm.open_mainfile(filepath=src)
bpy.context.view_layer.update()
for o in [o for o in bpy.data.objects if o.name.split(".")[0] in bs.JUNK_NAMES or o.type in ("CAMERA", "LIGHT")]:
    if o.type != "ARMATURE":
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh")

RED = (1.0, 0.08, 0.05, 1)
GREY = (0.42, 0.42, 0.44, 1)


def flat(col, name):
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    nt = m.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    em = nt.nodes.new("ShaderNodeEmission")
    em.inputs["Color"].default_value = col
    ou = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(em.outputs[0], ou.inputs[0])
    return m


mat_red, mat_grey = flat(RED, "sel"), flat(GREY, "rest")

for m in meshes:
    bm = bmesh.new()
    bm.from_mesh(m.data)
    bm.verts.ensure_lookup_table()
    seen, isl = set(), []
    for v0 in bm.verts:
        if v0.index in seen:
            continue
        st, mem = [v0], []
        seen.add(v0.index)
        while st:
            v = st.pop()
            mem.append(v)
            for e in v.link_edges:
                w = e.other_vert(v)
                if w.index not in seen:
                    seen.add(w.index)
                    st.append(w)
        isl.append(mem)
    isl.sort(key=len, reverse=True)
    vmap = {}
    for i, mem in enumerate(isl):
        sel = 1 if i in ids else 0
        for v in mem:
            vmap[v.index] = sel
    bm.free()
    m.data.materials.clear()
    m.data.materials.append(mat_grey)
    m.data.materials.append(mat_red)
    for p in m.data.polygons:
        p.material_index = vmap[p.vertices[0]]
    print("ISLANDS", len(isl), "selected", sum(1 for i in range(len(isl)) if i in ids))

bs.setup_world(strength=1.0, color=(1, 1, 1))
lo, hi = Vector((9, 9, 9)), Vector((-9, -9, -9))
for o in meshes:
    a_, b_ = bs.model_bounds(o)
    lo = Vector((min(lo.x, a_.x), min(lo.y, a_.y), min(lo.z, a_.z)))
    hi = Vector((max(hi.x, b_.x), max(hi.y, b_.y), max(hi.z, b_.z)))
c = (lo + hi) / 2
dx, dy, dz = hi.x - lo.x, hi.y - lo.y, hi.z - lo.z
ortho = 1.12 * max((dx * dx + dy * dy) ** 0.5, 1.6 * dz, 2.0)
bs.setup_render(px, int(px * 0.75))
for name, d in (("front", (0, -1, 0.06)), ("side", (1, 0, 0.06)), ("prow", (-1, 0, 0.06)),
                ("tq", (0.72, -0.72, 0.30)), ("tq_low", (0.72, -0.72, -0.42)), ("below", (0.25, -0.35, -1.0))):
    cam = bs.setup_camera(target=c, ortho_scale=ortho, direction=d, distance=ortho * 3)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("ISOLATED", tag)
