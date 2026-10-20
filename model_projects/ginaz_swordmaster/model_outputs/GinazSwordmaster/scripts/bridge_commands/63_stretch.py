import numpy as np
from collections import Counter
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]; me = lo.data; sc = bpy.context.scene
def tri_areas(coords, tris):
    a, b, c = coords[tris[:, 0]], coords[tris[:, 1]], coords[tris[:, 2]]
    return np.linalg.norm(np.cross(b - a, c - a), axis=1) / 2
tris = np.array([p.vertices[:] for p in me.polygons])
gname = {g.index: g.name for g in lo.vertex_groups}
dom = []
for v in me.vertices:
    ws = sorted(((g.weight, gname[g.group]) for g in v.groups), reverse=True)
    dom.append(ws[0][1] if ws else "-")
def evaluated(frame):
    sc.frame_set(frame); dg = bpy.context.evaluated_depsgraph_get(); ev = lo.evaluated_get(dg)
    m = ev.to_mesh(); co = np.empty(len(m.vertices)*3, dtype=np.float32); m.vertices.foreach_get('co', co); ev.to_mesh_clear()
    return co.reshape(-1, 3).astype(np.float64)
sc.frame_set(1)
rest = np.empty(len(me.vertices)*3, dtype=np.float32); me.vertices.foreach_get('co', rest); rest = rest.reshape(-1, 3).astype(np.float64)
a0 = tri_areas(rest, tris)
for act_name in ("current",):
    for f in (25, 40):
        co = evaluated(f); a1 = tri_areas(co, tris)
        ratio = a1 / np.maximum(a0, 1e-9)
        bad = np.where((ratio > 4.0) & (a1 > 0.004))[0]
        pairs = Counter()
        zs = []
        for t in bad:
            ds = tuple(sorted(set(dom[i] for i in tris[t])))
            pairs[ds] += 1; zs.append(rest[tris[t]].mean(0)[2])
        print(f"frame {f}: {len(bad)} triangles stretched >4x with area > 0.004 m2 (of {len(tris)}); total extra area {float((a1[bad]).sum()):.2f} m2")
        print("   most common bone sets:", pairs.most_common(8))
        if len(zs): print("   rest heights of those tris: min %.2f median %.2f max %.2f" % (min(zs), float(np.median(zs)), max(zs)))
