"""Finish step 2 and dump geometry for the repaint.
Takes the mirrored keep- hull, drops the two loose bow cubes, names it thorvald_cruiser, saves
03_blender/wreck_whole.blend and writes 04_textures/_wreck_geo.npz (triangle pos/uv/normal).

    blender -b 03_blender/wreck_mirror.blend --python 67_wreck_whole.py
"""
import os
import bpy, bmesh
import numpy as np
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
o = bpy.data.objects["wreck_keep-"]
for p in list(bpy.data.objects):
    if p is not o:
        bpy.data.objects.remove(p)
o.name = "thorvald_cruiser"; o.hide_render = False
bm = bmesh.new(); bm.from_mesh(o.data)
bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=0.02)
bm.faces.ensure_lookup_table()
seen, kill = set(), []
for f0 in bm.faces:
    if f0.index in seen:
        continue
    st, isl = [f0], []
    seen.add(f0.index)
    while st:
        f = st.pop(); isl.append(f)
        for e in f.edges:
            for g in e.link_faces:
                if g.index not in seen:
                    seen.add(g.index); st.append(g)
    c = sum((v.co for f in isl for v in f.verts), Vector()) / sum(len(f.verts) for f in isl)
    if c.x < -78 and abs(abs(c.y) - 28.5) < 3:            # the loose cubes off the bow
        kill += isl
bmesh.ops.delete(bm, geom=kill, context="FACES")
print("dropped bow cubes faces", len(kill))

# ---- cap the burn-through holes in the deck (small open loops), copying the surrounding plate's UV
from mathutils.bvhtree import BVHTree
bm.faces.ensure_lookup_table()
tree = BVHTree.FromBMesh(bm)
old = set(bm.faces)
uvl = bm.loops.layers.uv.active
bnd = [e for e in bm.edges if e.is_boundary]
res = bmesh.ops.holes_fill(bm, edges=bnd, sides=12)
new = [f for f in res["faces"]]
drop, keep = [], []
for f in new:
    c = f.calc_center_median()
    hit = tree.find_nearest(c)
    size = max(e.calc_length() for e in f.edges)
    if hit[0] is not None and hit[3] < 0.05:      # coincident with an existing face: panel backside, not a hole
        drop.append(f); continue
    if size > 25:                                  # big loops are panel outlines, not holes
        drop.append(f); continue
    keep.append(f)
bmesh.ops.delete(bm, geom=drop, context="FACES_ONLY")
bm.faces.ensure_lookup_table(); tree_faces = list(old)
for f in keep:
    c = f.calc_center_median()
    # nearest original face sharing an edge with the cap = the plate the hole was torn in
    nb = [g for e in f.edges for g in e.link_faces if g is not f and g in old]
    src_f = max(nb, key=lambda g: g.normal.z) if nb else None
    if src_f is not None:
        uv = sum((l[uvl].uv.copy() for l in src_f.loops), Vector((0.0, 0.0))) / len(src_f.loops)
        for l in f.loops:
            l[uvl].uv = uv
    if f.normal.z < 0 and abs(c.z) > 5 and c.z > 0:   # caps on the deck must face up
        f.normal_flip()
print("CAPPED holes", len(keep), "skipped loops", len(drop))
bm.to_mesh(o.data); bm.free(); o.data.update()
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "wreck_whole.blend"))

me = o.data; me.calc_loop_triangles(); uvl = me.uv_layers.active.data
pos, uv, nrm = [], [], []
for t in me.loop_triangles:
    pos.append([tuple(me.vertices[v].co) for v in t.vertices])
    uv.append([tuple(uvl[l].uv) for l in t.loops])
    nrm.append(tuple(t.normal))
np.savez(os.path.join(PROJ, "04_textures", "_wreck_geo.npz"), pos=np.array(pos, np.float32),
         uv=np.array(uv, np.float32), nrm=np.array(nrm, np.float32))
print("WHOLE_OK tris", len(pos))
