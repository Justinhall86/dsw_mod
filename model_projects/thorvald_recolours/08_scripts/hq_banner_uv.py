"""Find where the two Atreides banners are painted into the HQ tower wall's texture.

    blender -b --factory-startup --python hq_banner_uv.py -- <ConquestOutpost.fbx> <out.json>

The banner cloth is separate quads (islands 271/1244-1247 and 284/1415-1418), but the same banner shape and emblem are also painted
into the wall texture behind them. Each banner quad corner (plus a dense grid across the quad) is projected onto the wall along the
quad's normal; the wall's UV at the hit point gives the texture area to repaint. Writes, per banner, the UV points (0..1) of the
projected grid and the wall faces they land on.
"""
import json
import sys

import bmesh
import bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree
from mathutils.geometry import barycentric_transform

a = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=a[0])
m = next(o for o in bpy.data.objects if o.type == "MESH" and "Conquest" in o.name)
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

BANNERS = {"front": [1246, 1247], "side": [1417, 1418]}
ALL = [271, 284, 1244, 1245, 1246, 1247, 1415, 1416, 1417, 1418]
banner_verts = {v.index for i in ALL for v in isl[i]}
mw = m.matrix_world
uv = bm.loops.layers.uv.active

# BVH of everything except the banners, in world space
keep_faces = [f for f in bm.faces if not any(v.index in banner_verts for v in f.verts)]
verts = [mw @ v.co for v in bm.verts]
polys = [[v.index for v in f.verts] for f in keep_faces]
bvh = BVHTree.FromPolygons(verts, polys)

out = {}
for name, ids in BANNERS.items():
    pts_uv, faces = [], set()
    for i in ids:
        fs = {f for v in isl[i] for f in v.link_faces}
        for f in fs:
            n = (mw.to_3x3() @ f.normal).normalized()
            c = [mw @ v.co for v in f.verts]
            for s in range(21):
                for t in range(21):
                    # bilinear grid over the quad (works for the triangles too: corners repeat)
                    a0 = c[0].lerp(c[1], s / 20)
                    a1 = c[-1].lerp(c[2 % len(c)], s / 20)
                    p = a0.lerp(a1, t / 20)
                    for d in (-n, n):
                        loc, nrm, fi, dist = bvh.ray_cast(p + d * -0.05, d, 1.5)
                        if loc is not None:
                            break
                    if loc is None:
                        continue
                    wf = keep_faces[fi]
                    faces.add(wf.index)
                    tri = [mw @ l.vert.co for l in wf.loops[:3]]
                    uvs = [l[uv].uv.to_3d() for l in wf.loops[:3]]
                    if len(wf.loops) > 3:          # pick the triangle of the n-gon that contains the hit
                        for k in range(1, len(wf.loops) - 1):
                            tri = [mw @ wf.loops[j].vert.co for j in (0, k, k + 1)]
                            uvs = [wf.loops[j][uv].uv.to_3d() for j in (0, k, k + 1)]
                            if (barycentric_transform(loc, *tri, Vector((0, 0, 0)), Vector((1, 0, 0)), Vector((0, 1, 0))).x >= -1e-3):
                                break
                    q = barycentric_transform(loc, *tri, *uvs)
                    pts_uv.append([q.x, q.y])
    out[name] = {"uv": pts_uv, "wall_faces": sorted(faces)}
    xs = [p[0] for p in pts_uv]
    ys = [p[1] for p in pts_uv]
    print("BANNER", name, len(pts_uv), "pts, faces", sorted(faces), "u", round(min(xs), 4), round(max(xs), 4),
          "v", round(min(ys), 4), round(max(ys), 4))
json.dump(out, open(a[1], "w"))
