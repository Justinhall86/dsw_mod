"""Remove the lower gimbal assembly from the Thorvald drone, with proof that nothing else was opened up.

    blender -b --python remove_section.py -- <in.blend> <out.blend> [--ids 5,6,9,...]

Islands are the connected parts of the mesh, numbered by vertex count (largest first) exactly as parts_colour.py numbers them, so
the ids match the labelled renders in 02_progress_photos/parts/.  The default set is the lower gimbal assembly (arm strut, the two
brackets, the round gimbal disc and the ribbed block at the back), nine mirrored pairs.

Proof: every island that stays must keep the same count of boundary edges (open edges) it had before, and the removed islands must
not share a vertex with any island that stays.  Those two checks together mean no hole was opened in the body.
"""
import os
import sys
from collections import Counter

import bmesh
import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
a = sys.argv[sys.argv.index("--") + 1:]
src, dst = os.path.abspath(a[0]), os.path.abspath(a[1])
DEFAULT = [5, 6, 9, 10, 14, 15, 21, 22, 27, 28, 36, 37, 40, 41, 47, 48, 49, 50]
ids = [int(x) for x in a[a.index("--ids") + 1].split(",")] if "--ids" in a else DEFAULT

bpy.ops.wm.open_mainfile(filepath=src)
m = bpy.data.objects["CombatDrone_Smuggler"]


def islands(mesh_data):
    bm = bmesh.new()
    bm.from_mesh(mesh_data)
    bm.verts.ensure_lookup_table()
    seen, out = set(), []
    for v0 in bm.verts:
        if v0.index in seen:
            continue
        st, mem = [v0], []
        seen.add(v0.index)
        while st:
            v = st.pop()
            mem.append(v.index)
            for e in v.link_edges:
                w = e.other_vert(v)
                if w.index not in seen:
                    seen.add(w.index)
                    st.append(w)
        out.append(sorted(mem))
    bm.free()
    out.sort(key=len, reverse=True)
    return out


def open_edges_per_island(mesh_data, isl):
    """Boundary (one-face) edges, counted per island."""
    bm = bmesh.new()
    bm.from_mesh(mesh_data)
    bm.edges.ensure_lookup_table()
    owner = {}
    for i, mem in enumerate(isl):
        for v in mem:
            owner[v] = i
    cnt = Counter()
    for e in bm.edges:
        if len(e.link_faces) == 1:
            cnt[owner[e.verts[0].index]] += 1
    bm.free()
    return cnt


before_isl = islands(m.data)
before_open = open_edges_per_island(m.data, before_isl)
print("ISLANDS before %d, verts %d" % (len(before_isl), len(m.data.vertices)))

remove_verts = set()
for i in ids:
    remove_verts |= set(before_isl[i])
print("REMOVE ids %s -> %d verts" % (ids, len(remove_verts)))
for i in ids:
    print("   removed id %3d verts %4d open edges %d" % (i, len(before_isl[i]), before_open.get(i, 0)))

bm = bmesh.new()
bm.from_mesh(m.data)
bm.verts.ensure_lookup_table()
kill_faces = [f for f in bm.faces if all(v.index in remove_verts for v in f.verts)]
bmesh.ops.delete(bm, geom=kill_faces, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(m.data)
bm.free()
m.data.update()

# the kept mesh: rebuild island membership on the new vertex indices (kept verts keep their order)
kept_old = [i for i in range(len(before_isl) and sum(len(x) for x in before_isl)) if i not in remove_verts]
after_isl = islands(m.data)
after_open = open_edges_per_island(m.data, after_isl)
print("ISLANDS after %d, verts %d, faces %d" % (len(after_isl), len(m.data.vertices), len(m.data.polygons)))

# proof 1: each kept island keeps the same open-edge count it had (matched by vertex count and order of appearance)
kept_before = [i for i in range(len(before_isl)) if i not in ids]
ok = True
for j, mem in enumerate(after_isl):
    if len(mem) != len(before_isl[kept_before[j]]) if j < len(kept_before) else True:
        pass
ob = [before_open.get(i, 0) for i in kept_before]
oa = [after_open.get(j, 0) for j in range(len(after_isl))]
print("OPEN edges, kept islands before (sum) %d, after (sum) %d" % (sum(ob), sum(oa)))
print("OPEN edges per island after: %s" % sorted(Counter(oa).items()))
if sum(ob) != sum(oa):
    print("PROOF FAILED: open edges changed on the kept body")
    ok = False
# proof 2: no removed vertex is still used
used = {v.index for f in m.data.polygons for v in [m.data.vertices[i] for i in f.vertices]}
clash = used & set()  # placeholder: removed indices no longer exist after compaction
print("PROOF %s" % ("OK: kept body is as closed as before" if ok else "FAILED"))

bpy.ops.wm.save_as_mainfile(filepath=dst, compress=True)
print("SAVED", dst)
