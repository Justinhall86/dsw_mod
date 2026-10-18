import numpy as np, math
from collections import Counter
from mathutils import Vector, Euler
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]; me = lo.data; sc = bpy.context.scene
def tri_areas(coords, tris):
    a, b, c = coords[tris[:, 0]], coords[tris[:, 1]], coords[tris[:, 2]]
    return np.linalg.norm(np.cross(b - a, c - a), axis=1) / 2
def stretch(frames, tag):
    tris = np.array([p.vertices[:] for p in me.polygons])
    sc.frame_set(sc.frame_start)
    rest = np.empty(len(me.vertices)*3, dtype=np.float32); me.vertices.foreach_get('co', rest); rest = rest.reshape(-1, 3).astype(np.float64)
    a0 = tri_areas(rest, tris)
    gname = {g.index: g.name for g in lo.vertex_groups}
    dom = [max(((g.weight, gname[g.group]) for g in v.groups), default=(0, "-"))[1] for v in me.vertices]
    for f in frames:
        sc.frame_set(f); dg = bpy.context.evaluated_depsgraph_get(); ev = lo.evaluated_get(dg)
        m = ev.to_mesh(); co = np.empty(len(m.vertices)*3, dtype=np.float32); m.vertices.foreach_get('co', co); ev.to_mesh_clear()
        a1 = tri_areas(co.reshape(-1, 3).astype(np.float64), tris); ratio = a1 / np.maximum(a0, 1e-9)
        bad = np.where((ratio > 4.0) & (a1 > 0.004))[0]
        pairs = Counter(tuple(sorted(set(dom[i] for i in tris[t]))) for t in bad)
        print(f"{tag} frame {f}: stretched tris {len(bad)} (extra area {float(a1[bad].sum()):.2f} m2) {pairs.most_common(3)}")
for name, frames, tag, rz, loc in (("AttackMelee01", (25, 40), "16_attack", 35, (0, 0, 0.95)), ("Run", (10, 20), "17_run", 215, (0, 0.2, 0.95))):
    act, out = play(name, (frames[0],), "tmp_" + tag, rz=rz, loc=loc)
    stretch(frames, name)
    sc.frame_set(frames[0]); c = view3d_ctx(); r3d = c['area'].spaces.active.region_3d
    for f in frames:
        sc.frame_set(f); r3d.view_location = Vector(loc)
        print(shot3(f"{tag}_fixed_f{f:02d}", 1000, 900))
