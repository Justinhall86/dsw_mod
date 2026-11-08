"""Measure how deep the hat (or any named part) sinks into the rest of the body in every frame of the real clips.

    blender -b <unit.blend> --python clip_test.py -- <part name contains> [--step N] [--json out.json] [clip ...]

For each frame: evaluate the posed meshes, and for every vertex of the part find the nearest surface point on the OTHER meshes; a vertex is "inside" when
it lies behind that surface (signed distance along the face normal < 0) and within 6 cm.  Reports the worst penetration depth (cm) and the count of inside
vertices per clip, and the frame where it is worst.  Needs outward-facing normals on the body (the unit's are).
"""
import json
import os
import sys

import bpy
from mathutils.bvhtree import BVHTree

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
a = sys.argv[sys.argv.index("--") + 1:]
part_key = a[0]
step = int(a[a.index("--step") + 1]) if "--step" in a else 3
jpath = a[a.index("--json") + 1] if "--json" in a else None
clips = [x for x in a[1:] if not x.startswith("--") and not x.isdigit() and not x.endswith(".json")] or \
    ["Common_Run", "Common_AttackMelee01", "Common_AttackMelee02", "Common_FightHitFront", "Common_FightIdle"]
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
part = [o for o in meshes if part_key in o.name]
others = [o for o in meshes if part_key not in o.name and "Emblem" not in o.name]
sc = bpy.context.scene
result = {}
for clip in clips:
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    action = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data_create()
    rig.animation_data.action = action
    if getattr(action, "slots", None):
        rig.animation_data.action_slot = action.slots[0]
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    worst = (0.0, 0, 0)
    for f in range(f0, f1 + 1, step):
        sc.frame_set(f)
        dg = bpy.context.evaluated_depsgraph_get()
        trees = []
        for o in others:
            ev = o.evaluated_get(dg)
            trees.append((BVHTree.FromObject(ev, dg), ev.matrix_world.copy(), ev.matrix_world.inverted()))
        depth, n_in = 0.0, 0
        for po in part:
            pe = po.evaluated_get(dg)
            me = pe.to_mesh()
            for v in me.vertices:
                p = pe.matrix_world @ v.co
                best = None
                for t, mw_, inv_ in trees:      # the BVH is in the object's own space: query there, bring the answer back to world space
                    loc, nrm, idx, dist = t.find_nearest(inv_ @ p)
                    if loc is None:
                        continue
                    wl = mw_ @ loc
                    wn = (mw_.to_3x3() @ nrm).normalized()
                    wd = (wl - p).length
                    if best is None or wd < best[3]:
                        best = (wl, wn, idx, wd)
                if best and best[3] < 0.06:
                    sd = (p - best[0]).dot(best[1])
                    if sd < 0:
                        n_in += 1
                        depth = max(depth, -sd)
            pe.to_mesh_clear()
        if depth > worst[0]:
            worst = (depth, n_in, f)
    result[clip] = {"worst_cm": round(worst[0] * 100, 2), "verts_inside": worst[1], "frame": worst[2]}
    print("CLIPTEST %-24s worst %.2f cm  (%d verts inside) at frame %d" % (clip, worst[0] * 100, worst[1], worst[2]))
if jpath:
    json.dump(result, open(jpath, "w"), indent=1)
