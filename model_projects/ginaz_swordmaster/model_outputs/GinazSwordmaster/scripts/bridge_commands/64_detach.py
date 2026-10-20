import bmesh, numpy as np
from collections import Counter
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]; me = lo.data; sc = bpy.context.scene
sc.frame_set(1)
for pb in rig.pose.bones: pb.matrix_basis.identity()
rig.animation_data.action = None if rig.animation_data else None
gname = {g.index: g.name for g in lo.vertex_groups}
CAPE = ("B_Cape01", "B_Cape02", "B_Cape03")
dom = []
for v in me.vertices:
    ws = sorted(((g.weight, gname[g.group]) for g in v.groups), reverse=True)
    dom.append(ws[0][1] if ws else "-")
is_cape = np.array([d in CAPE for d in dom])
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table(); bm.faces.ensure_lookup_table()
kill = []
for f in bm.faces:
    idx = [v.index for v in f.verts]
    zc = sum(v.co.z for v in f.verts) / 3
    cs = [is_cape[i] for i in idx]
    if zc < 0.95 and any(cs) and not all(cs):
        kill.append(f)
print("bridge faces between cape and legs/body (z<0.95):", len(kill), "of", len(bm.faces))
bmesh.ops.delete(bm, geom=kill, context='FACES_ONLY')
loose = [v for v in bm.verts if not v.link_faces]
bmesh.ops.delete(bm, geom=loose, context='VERTS')
print("loose verts removed:", len(loose), "| faces now:", len(bm.faces), "| open edges:", sum(1 for e in bm.edges if e.is_boundary))
bm.to_mesh(me); bm.free(); me.update()
for p in me.polygons: p.use_smooth = True
print("lo now:", len(me.vertices), "verts", len(me.polygons), "tris; uv layers", [u.name for u in me.uv_layers], "groups", len(lo.vertex_groups))
