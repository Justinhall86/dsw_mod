import numpy as np, bmesh
lo = bpy.data.objects["GinazSwordmaster"]; me = lo.data
print("attributes:", [(a.name, a.domain) for a in me.attributes if not a.name.startswith('.')], "| internal:", [a.name for a in me.attributes if a.name.startswith('.')])
print("has_custom_normals:", me.has_custom_normals, "| smooth polys:", sum(p.use_smooth for p in me.polygons), "of", len(me.polygons))
# UV islands -> how many vertices would be duplicated by UV seams alone
uv = me.uv_layers.active.data
per_vert = {}
for p in me.polygons:
    for li in p.loop_indices:
        v = me.loops[li].vertex_index
        per_vert.setdefault(v, set()).add((round(uv[li].uv[0], 5), round(uv[li].uv[1], 5)))
dupes = sum(len(s) for s in per_vert.values())
print("verts:", len(me.vertices), "| vertices after UV-seam splitting alone:", dupes)
# distinct corner normals per vertex
me.calc_loop_triangles()
nrm = np.empty(len(me.corner_normals)*3, dtype=np.float32); me.corner_normals.foreach_get('vector', nrm); nrm = nrm.reshape(-1, 3)
vi = np.empty(len(me.loops), dtype=np.int32); me.loops.foreach_get('vertex_index', vi)
cn = {}
for l in range(len(vi)): cn.setdefault(int(vi[l]), set()).add(tuple(np.round(nrm[l], 3)))
print("vertices x distinct corner normals:", sum(len(s) for s in cn.values()))
