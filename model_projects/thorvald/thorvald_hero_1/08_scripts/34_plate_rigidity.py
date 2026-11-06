"""Round 14: how much each armour plate CRUMPLES in motion. Per mesh component, per frame, fit the best rigid move from
rest (Kabsch) and take the RMS of what is left: 0 = the plate moves as one solid piece, anything over ~1 cm reads as
rubber/cloth at RTS zoom. Plates that span a joint bend a little by design; big shells and lames must not.

  blender -b --factory-startup --python 34_plate_rigidity.py -- <blend> [--min-verts 24] [--top 25]

Prints the worst components (object, component id, centre, dominant bone, worst residual and frame per clip).
"""
import argparse
import sys
from collections import defaultdict

import bpy
import numpy as np

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("blend")
ap.add_argument("--min-verts", type=int, default=24)
ap.add_argument("--top", type=int, default=25)
ap.add_argument("--clips", default="DualSwords_Run,DualSwords_AttackMelee01,DualSwords_FightIdle")
a = ap.parse_args(sys.argv[sys.argv.index("--") + 1:])
bpy.ops.wm.open_mainfile(filepath=a.blend)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
objs = [o for o in bpy.data.objects if o.type == "MESH" and not o.name.startswith("Thorvald_Katana")]
comps = {o.name: [np.array(sorted(c)) for c in P.components(o) if len(c) >= a.min_verts] for o in objs}


def coords():
    dg = bpy.context.evaluated_depsgraph_get()
    out = {}
    for o in objs:
        e = o.evaluated_get(dg)
        m = e.to_mesh()
        mw = np.array(e.matrix_world)
        co = np.array([v.co for v in m.vertices])
        out[o.name] = co @ mw[:3, :3].T + mw[:3, 3]
        e.to_mesh_clear()
    return out


def residual(A, B):
    a0, b0 = A - A.mean(0), B - B.mean(0)
    u, _, vt = np.linalg.svd(a0.T @ b0)
    d = np.sign(np.linalg.det(u @ vt))
    R = u @ np.diag([1, 1, d]) @ vt
    return float(np.sqrt(((a0 @ R - b0) ** 2).sum(1).mean()))


rig.data.pose_position = "REST"
bpy.context.view_layer.update()
rest = coords()
rig.data.pose_position = "POSE"
worst = defaultdict(dict)
for clip in a.clips.split(","):
    act = bpy.data.actions[clip]
    rig.animation_data.action = act
    for f in range(int(act.frame_range[0]), int(act.frame_range[1]) + 1):
        sc.frame_set(f)
        cur = coords()
        for o in objs:
            for k, idx in enumerate(comps[o.name]):
                r = residual(rest[o.name][idx], cur[o.name][idx])
                if r > worst[(o.name, k)].get(clip, (0, 0))[0]:
                    worst[(o.name, k)][clip] = (r, f)
gn = {o.name: {g.index: g.name for g in o.vertex_groups} for o in objs}
rows = []
for (on, k), d in worst.items():
    o = bpy.data.objects[on]
    idx = comps[on][k]
    acc = defaultdict(float)
    for i in idx:
        for g in o.data.vertices[int(i)].groups:
            acc[gn[on][g.group]] += g.weight
    dom = max(acc, key=acc.get) if acc else ""
    c = rest[on][idx].mean(0)
    rows.append((max(v[0] for v in d.values()), on, k, len(idx), c, dom, d))
rows.sort(key=lambda r: -r[0])
for r in rows[:a.top]:
    print("PLATE %-20s c%-3d n%4d at (%5.2f,%5.2f,%5.2f) %-14s worst %.1f cm | %s" % (
        r[1], r[2], r[3], r[4][0], r[4][1], r[4][2], r[5], 100 * r[0],
        " ".join("%s %.1f@f%d" % (cl.split("_")[1][:6], 100 * v[0], v[1]) for cl, v in r[6].items())))
print("TOTAL worst-sum %.1f cm over %d plates" % (100 * sum(r[0] for r in rows), len(rows)))
