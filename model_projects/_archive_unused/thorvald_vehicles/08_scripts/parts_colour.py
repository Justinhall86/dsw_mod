"""Colour every connected part (island) of a vehicle differently, print a legend, and render the views.

    blender -b --python parts_colour.py -- <file.fbx|.blend> <out_dir> <tag> [--px 700] [--min 0]

Islands are found on the mesh (shared vertices), numbered by size (largest first, the same convention as 02_gallery.py), and each
gets its own flat colour.  The legend line per island gives the id, triangle count, world bounds and the dominant bone.  The
colouring replaces the materials of the copy that is rendered; the source file is not saved.
"""
import colorsys
import os
import sys
from collections import Counter

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
src, out, tag = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2]
px = int(a[a.index("--px") + 1]) if "--px" in a else 700
os.makedirs(out, exist_ok=True)

bpy.ops.wm.read_factory_settings(use_empty=True)
if src.endswith(".blend"):
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

def world_pts(m):
    """Evaluated (posed, as rendered) world positions, index-aligned with m.data.vertices."""
    dg = bpy.context.evaluated_depsgraph_get()
    ev = m.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


lines = []
for m in meshes:
    WP = world_pts(m)
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
    names = {g.index: g.name for g in m.vertex_groups}
    mw = m.matrix_world
    mats = []
    for i in range(len(isl)):
        h = (i * 0.618) % 1.0
        col = colorsys.hsv_to_rgb(h, 0.78, 0.96)
        mat = bpy.data.materials.new("part_%03d" % i)
        mat.use_nodes = True
        nt = mat.node_tree
        for n in list(nt.nodes):
            nt.nodes.remove(n)
        em = nt.nodes.new("ShaderNodeEmission")
        em.inputs["Color"].default_value = (*col, 1)
        ou = nt.nodes.new("ShaderNodeOutputMaterial")
        nt.links.new(em.outputs[0], ou.inputs[0])
        mats.append(mat)
    m.data.materials.clear()
    for mat in mats:
        m.data.materials.append(mat)
    vmap = {}
    for i, mem in enumerate(isl):
        for v in mem:
            vmap[v.index] = i
    for p in m.data.polygons:
        p.material_index = vmap[p.vertices[0]]
    for i, mem in enumerate(isl):
        if len(mem) < 3:
            continue
        ws = [WP[v.index] for v in mem]
        lo = Vector((min(p.x for p in ws), min(p.y for p in ws), min(p.z for p in ws)))
        hi = Vector((max(p.x for p in ws), max(p.y for p in ws), max(p.z for p in ws)))
        tris = sum(len(f.verts) - 2 for f in [f for v in mem for f in v.link_faces]) // 1
        cnt = Counter()
        for v in mem:
            for g in m.data.vertices[v.index].groups:
                cnt[names.get(g.group, "?")] += g.weight
        bone = cnt.most_common(1)[0][0] if cnt else "-"
        lines.append("PART %-22s id %3d verts %5d faces %5d  x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f  bone %s" % (
            m.name, i, len(mem), len(set(f.index for v in mem for f in v.link_faces)),
            lo.x, hi.x, lo.y, hi.y, lo.z, hi.z, bone))
    bm.free()
for ln in lines:
    print(ln)

# matte flat views
bs.setup_world(strength=1.0, color=(1, 1, 1))
for mt in bpy.data.materials:
    if mt.users == 0:
        continue
bs.setup_render(px, px)
allv = [mw.translation for mw in []]
pts = [p for o in meshes for p in world_pts(o)]
c = Vector((sum(p.x for p in pts) / len(pts), sum(p.y for p in pts) / len(pts), sum(p.z for p in pts) / len(pts)))
ext = max(max(abs(p.x - c.x), abs(p.y - c.y), abs(p.z - c.z)) for p in pts)
print("FRAME centre", tuple(round(x, 3) for x in c), "ext", round(ext, 3), "pts", len(pts), "meshes", [m.name for m in meshes])
VIEWS = {"front": (0, -1, 0.1), "side": (1, 0, 0.1), "back": (0, 1, 0.1), "tq": (0.7, -0.7, 0.35)}
import json  # noqa: E402
from bpy_extras.object_utils import world_to_camera_view  # noqa: E402
LABELS = {}
cents = []                                   # (part name, id, world centre of the island, size)
for m in meshes:
    WP = world_pts(m)
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
    for i, mem in enumerate(isl):
        if len(mem) < 3:
            continue
        ws = [WP[v.index] for v in mem]
        cc = sum(ws, Vector()) / len(ws)
        cents.append((i, cc, len(mem)))
    bm.free()
for vn, d in VIEWS.items():
    cam = bs.setup_camera(target=c, ortho_scale=ext * 2.4, direction=d, distance=ext * 6)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, vn)), cam)
    LABELS[vn] = [[i, round(world_to_camera_view(bpy.context.scene, cam, cc).x * px, 1),
                   round((1 - world_to_camera_view(bpy.context.scene, cam, cc).y) * px, 1), nv]
                  for i, cc, nv in cents]
    bpy.data.objects.remove(cam, do_unlink=True)
json.dump(LABELS, open(os.path.join(out, "%s_labels.json" % tag), "w"))
print("PARTS DONE", tag)
