"""Print, per unit, how many faces each dominant bone owns and their height range (to pick arm / leg faces by bone).

    blender -b --python bone_faces.py -- Unit [Unit ...]
"""
import os
import sys
from collections import defaultdict

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import paths  # noqa: E402

for key in script_args():
    bs.reset_scene()
    body, rig = bs.import_model(paths(key)[0])
    names = {g.index: g.name for g in body.vertex_groups}
    dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
    stats = defaultdict(lambda: [0, 9, -9, 9, -9])
    for p in body.data.polygons:
        ds = [dom.get(v) for v in p.vertices]
        b = max(set(ds), key=ds.count)
        c = body.matrix_world @ p.center
        s = stats[b]
        s[0] += 1
        s[1], s[2] = min(s[1], c.z), max(s[2], c.z)
        s[3], s[4] = min(s[3], abs(c.x)), max(s[4], abs(c.x))
    print("BONES", key, "faces", len(body.data.polygons))
    for b, s in sorted(stats.items(), key=lambda kv: -kv[1][2]):
        print("  %-18s faces %4d  z %.2f..%.2f  |x| %.2f..%.2f" % (b, *s))
