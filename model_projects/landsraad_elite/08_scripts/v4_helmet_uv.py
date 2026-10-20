"""v4 helmet step 3 (Blender): per-quad cell UVs (v4_atlas.py exec'd first). Each quad of the loft (two triangles sharing a `quad` id) owns a square
cell of the atlas; triangle half 0 uses the corners (0,0),(1,0),(1,1), half 1 uses (0,0),(1,1),(0,1) (cell-local s,t; t runs downwards).
The texture baker (v4_helmet_bake.py) fills every cell by sampling the reference pictures at the triangle's 3D positions."""
import json
import numpy as np


def assign_uv(ob, export_path=None):
    me = ob.data
    for u in list(me.uv_layers): me.uv_layers.remove(u)
    uvl = me.uv_layers.new(name="UVMap")
    ql = me.attributes["quad"]; hl = me.attributes["half"]
    corners = {0: [(0.0, 0.0), (1.0, 0.0), (1.0, 1.0)], 1: [(0.0, 0.0), (1.0, 1.0), (0.0, 1.0)]}
    nq = 0
    out = []
    for p in me.polygons:
        q = int(ql.data[p.index].value); h = int(hl.data[p.index].value); nq = max(nq, q + 1)
        for k, li in enumerate(p.loop_indices):
            s, t = corners[h][k]
            uvl.data[li].uv = A_cell_uv(q, s, t)
        # a quad's triangles are (v0,v1,v2) / (v0,v2,v3): export the 3D positions so the baker can rebuild the cell mapping
        out.append(dict(quad=q, half=h, vi=[me.loops[li].vertex_index for li in p.loop_indices], v=[list(me.vertices[me.loops[li].vertex_index].co[:]) for li in p.loop_indices], n=list(p.normal)))
    print("helmet UV: %d quads/cells, %d triangles" % (nq, len(me.polygons)))
    if export_path:
        json.dump(dict(tris=out), open(export_path, "w"))
    return nq


A_cell_uv = lambda q, s, t: tuple(float(x) for x in cell_uv(q, s, t))


def assign_uv_islands(ob, export_path=None, top_z=0.80):
    """alternative: orthographic projection UVs into the front / back / side picture islands (v4_atlas.ISLANDS); each triangle is
    assigned to the view that sees it best; `view` face attribute (0 front, 1 back, 2 side)."""
    me = ob.data
    for u in list(me.uv_layers): me.uv_layers.remove(u)
    uvl = me.uv_layers.new(name="UVMap")
    if "view" in me.attributes: me.attributes.remove(me.attributes["view"])
    va = me.attributes.new("view", "INT", "FACE")
    names = ["front", "back", "side"]; cnt = dict(front=0, back=0, side=0); out = []
    ql = me.attributes["quad"]
    # score per quad (both triangles together), then smooth over neighbouring quads so a view region has no stray triangles
    qscore = {}; qverts = {}
    for poly in me.polygons:
        q = int(ql.data[poly.index].value); n = poly.normal; c = poly.center
        if n.z > top_z: sc = np.array([1.0, 0, 0]) if c.y < 0.02 else np.array([0, 1.0, 0])
        else: sc = np.array([max(-n.y, 0) * (1.6 if c.y < -0.06 else 1.0), max(n.y, 0), abs(n.x) * 1.08])
        qscore[q] = qscore.get(q, 0) + sc * poly.area
        qverts.setdefault(q, set()).update(poly.vertices)
    vq = {}
    for q, vs in qverts.items():
        for v in vs: vq.setdefault(v, set()).add(q)
    nbr = {q: {o for v in vs for o in vq[v] if o != q and len(qverts[o] & vs) >= 2} for q, vs in qverts.items()}
    view_of = {q: int(np.argmax(sc)) for q, sc in qscore.items()}
    for _ in range(2):
        new_view = {}
        for q in qscore:
            votes = np.zeros(3); votes[view_of[q]] += 1.5
            for o in nbr[q]: votes[view_of[o]] += 1.0
            # keep the own best view unless the neighbours clearly disagree and the own score is ambiguous
            sc = qscore[q] / max(qscore[q].sum(), 1e-9)
            new_view[q] = int(np.argmax(votes)) if sc.max() < 0.62 else int(np.argmax(sc))
        view_of = new_view
    for poly in me.polygons:
        q = int(ql.data[poly.index].value); view = names[view_of[q]]
        cnt[view] += 1; va.data[poly.index].value = view_of[q]
        co = np.array([me.vertices[me.loops[li].vertex_index].co[:] for li in poly.loop_indices])
        h, z = loft_to_pic(view, co); u, v = ISLANDS[view].to_uv(h, z)
        for k, li in enumerate(poly.loop_indices): uvl.data[li].uv = (float(u[k]), float(v[k]))
        out.append(dict(view=view, vi=[me.loops[li].vertex_index for li in poly.loop_indices], v=co.tolist(), n=list(poly.normal)))
    print("helmet island UV: faces per view", cnt)
    if export_path: json.dump(dict(tris=out), open(export_path, "w"))
