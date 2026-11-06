"""Stage 1 - copper accents + remove the bottom fin from the Renegade frigate.

    blender -b --python 01_fin_and_copper.py -- <in.blend> <out.blend> <albedo.png> <mgao.png>

1. Swaps the packed albedo / MetallicGlossAO images for the copper-recoloured ones (08_scripts/recolour_copper.py).
2. Deletes the four islands that make the long centreline keel fin under the hull (ids by size, largest first,
   the same convention as parts_colour.py: 56, 57, 68, 69).
3. PROOF, two ways:
   - every island that keeps its size also keeps its exact number of boundary (open) edges, so no island was
     nicked by the cut;
   - the boundary loops that existed inside the fin's footprint before the cut are listed; if the fin was closing
     a hull opening there, that loop is filled with a flat plate and the number of faces added is printed.

Island ids assume the input is the untouched Renegade_Frigate_preview.blend.
"""
import os
import sys
from collections import Counter

import bmesh
import bpy

a = sys.argv[sys.argv.index("--") + 1:]
src, dst = os.path.abspath(a[0]), os.path.abspath(a[1])
albedo_p, mg_p = os.path.abspath(a[2]), os.path.abspath(a[3])
KEEL = [56, 57, 68, 69]

bpy.ops.wm.open_mainfile(filepath=src)
ob = bpy.data.objects["Renegade_Frigate"]
me = ob.data

# ---- 1. copper textures ---------------------------------------------------
mat = bpy.data.materials["Mat_Renegade_Frigate"]
for node_name, path in (("Image Texture", albedo_p), ("Image Texture.001", mg_p)):
    node = mat.node_tree.nodes.get(node_name)
    if node is None:
        raise SystemExit("missing node " + node_name)
    img = bpy.data.images.load(path, check_existing=True)
    img.name = os.path.basename(path)
    img.pack()
    node.image = img
for i in [i for i in bpy.data.images if i.users == 0 and not i.name.startswith(("Render", "Viewer"))]:
    bpy.data.images.remove(i)
print("TEXTURES swapped -> %s" % albedo_p)


def islands(mesh):
    bm = bmesh.new()
    bm.from_mesh(mesh)
    bm.verts.ensure_lookup_table()
    seen, out = set(), []
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
        out.append(sorted(v.index for v in mem))
    bm.free()
    out.sort(key=len, reverse=True)
    return out


def open_edges(mesh, isl):
    bm = bmesh.new()
    bm.from_mesh(mesh)
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


def boundary_loops(mesh):
    """Connected boundary-edge loops of the whole mesh -> [(edges, lo, hi), ...]"""
    bm = bmesh.new()
    bm.from_mesh(mesh)
    bm.edges.ensure_lookup_table()
    loops, seen = [], set()
    for e0 in [e for e in bm.edges if len(e.link_faces) == 1]:
        if e0.index in seen:
            continue
        st, mem = [e0], []
        seen.add(e0.index)
        while st:
            e = st.pop()
            mem.append(e)
            for v in e.verts:
                for e2 in v.link_edges:
                    if e2.index not in seen and len(e2.link_faces) == 1:
                        seen.add(e2.index)
                        st.append(e2)
        vs = [v.co for e in mem for v in e.verts]
        loops.append((len(mem),
                      (min(c.x for c in vs), min(c.y for c in vs), min(c.z for c in vs)),
                      (max(c.x for c in vs), max(c.y for c in vs), max(c.z for c in vs))))
    bm.free()
    loops.sort(reverse=True)
    return loops


before = islands(me)
before_open = open_edges(me, before)
pre_loops = boundary_loops(me)
print("ISLANDS before %d, verts %d, faces %d, open edges %d, boundary loops %d"
      % (len(before), len(me.vertices), len(me.polygons), sum(before_open.values()), len(pre_loops)))
for n, lo, hi in pre_loops:
    print("   loop %4d edges  x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (n, lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]))
for i in KEEL:
    print("  fin id %d verts %4d open %d" % (i, len(before[i]), before_open.get(i, 0)))

# ---- 2. cut the fin -------------------------------------------------------
remove = set()
for i in KEEL:
    remove |= set(before[i])
print("REMOVING %d verts (islands %s)" % (len(remove), KEEL))

bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
kill = [f for f in bm.faces if all(v.index in remove for v in f.verts)]
bmesh.ops.delete(bm, geom=kill, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(me)
bm.free()
me.update()

kept_ids = [i for i in range(len(before)) if i not in KEEL]
after = islands(me)
after_open = open_edges(me, after)
print("ISLANDS after %d, verts %d, faces %d" % (len(after), len(me.vertices), len(me.polygons)))

ok = len(after) == len(kept_ids)
if not ok:
    print("PROOF FAILED: island count %d != kept %d" % (len(after), len(kept_ids)))
else:
    for j, i in enumerate(kept_ids):
        if len(after[j]) != len(before[i]):
            print("PROOF FAILED: island %d (was id %d) size %d != %d" % (j, i, len(after[j]), len(before[i])))
            ok = False
            break
ob_before = sum(before_open.get(i, 0) for i in kept_ids)
ob_after = sum(after_open.get(j, 0) for j in range(len(after)))
print("OPEN edges on kept islands: before %d, after %d" % (ob_before, ob_after))
for j in range(len(after)):
    b_, a_ = before_open.get(kept_ids[j], 0), after_open.get(j, 0)
    if b_ != a_:
        print("  island %d (was id %d): open %d -> %d" % (j, kept_ids[j], b_, a_))
print("PROOF islands %s" % ("OK: every kept island keeps its boundary edges" if ob_after == ob_before else "MISMATCH"))

# ---- 3. close an opening the fin was covering, if there is one ------------
FOOT = (lambda lo, hi: (lo[0] >= -4.78 and hi[0] <= 1.45 and lo[1] >= -1.25 and hi[1] <= 1.25 and hi[2] <= 0.62))
pre_in_fin = [L for L in pre_loops if FOOT(L[1], L[2])]
print("boundary loops inside the fin footprint before the cut: %d" % len(pre_in_fin))
filled = 0
if pre_in_fin:
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.edges.ensure_lookup_table()

    def in_foot(v):
        return -4.78 <= v.co.x <= 1.45 and abs(v.co.y) <= 1.25 and v.co.z <= 0.62

    bedges = [e for e in bm.edges if len(e.link_faces) == 1 and all(in_foot(v) for v in e.verts)]
    print("candidate edges to close: %d" % len(bedges))
    if bedges:
        res = bmesh.ops.holes_fill(bm, edges=bedges, sides=0)
        filled = len(res.get("faces", []))
        bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    bm.to_mesh(me)
    bm.free()
    me.update()
print("FILLED %d face(s)" % filled)

final = islands(me)
final_open = open_edges(me, final)
print("ISLANDS final %d, verts %d, faces %d, open edges %d"
      % (len(final), len(me.vertices), len(me.polygons), sum(final_open.values())))

bpy.ops.wm.save_as_mainfile(filepath=dst, compress=True)
print("SAVED", dst)
