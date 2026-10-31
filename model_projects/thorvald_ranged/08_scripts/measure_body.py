"""Rest-pose body measurements for the posture / bulk work (this unit vs a vanilla unit).

    blender -b <unit.blend> --python measure_body.py -- [--other AtreidesSoldier]

Per height slice (torso only: |x| < 0.24, so arms are excluded): width (x) and depth (y, front and back).  Plus the top of the shoulder
plates, the head's bounds, and where the hat's axis sits relative to the head (the hat must be centred on the head).
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from units import paths  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
other = a[a.index("--other") + 1] if "--other" in a else "AtreidesSoldier"


def pts_of(objs):
    out = []
    for o in objs:
        out += [o.matrix_world @ v.co for v in o.data.vertices]
    return out


def report(label, pts):
    print("== %s" % label)
    for z in (1.30, 1.38, 1.45, 1.52, 1.58, 1.64):
        s = [p for p in pts if abs(p.z - z) < 0.015 and abs(p.x) < 0.24]
        if s:
            print("   z %.2f  width %.3f  front y %.3f  back y %.3f  depth %.3f" % (
                z, max(p.x for p in s) - min(p.x for p in s), min(p.y for p in s), max(p.y for p in s), max(p.y for p in s) - min(p.y for p in s)))
    sh = [p for p in pts if 0.12 < abs(p.x) < 0.42 and p.z > 1.40]
    if sh:
        print("   shoulder plates: top z %.3f" % max(p.z for p in sh))
    tr = [p for p in pts if abs(p.x) < 0.30 and 1.25 < p.z < 1.62]
    print("   torso+shoulders chest-to-back max depth %.3f  max width (|x|<0.30) %.3f" % (
        max(p.y for p in tr) - min(p.y for p in tr), max(p.x for p in tr) - min(p.x for p in tr)))


mine = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render and "Hat" not in o.name and "Katana" not in o.name
        and "Emblem" not in o.name]
report("this unit (%s)" % ", ".join(o.name for o in mine), pts_of(mine))
head = next((o for o in bpy.data.objects if o.type == "MESH" and o.name.endswith("Head")), None)
hat = next((o for o in bpy.data.objects if o.type == "MESH" and "Hat" in o.name), None)
if head and hat:
    hp = pts_of([head])
    hc = Vector((sum(p.x for p in hp) / len(hp), sum(p.y for p in hp) / len(hp), 0))
    lo = Vector((min(p.x for p in hp), min(p.y for p in hp), min(p.z for p in hp)))
    hi = Vector((max(p.x for p in hp), max(p.y for p in hp), max(p.z for p in hp)))
    print("   head bounds x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f  centre xy (%.3f %.3f)  bbox centre xy (%.3f %.3f)" % (
        lo.x, hi.x, lo.y, hi.y, lo.z, hi.z, hc.x, hc.y, (lo.x + hi.x) / 2, (lo.y + hi.y) / 2))
    tp = pts_of([hat])
    apex = max(tp, key=lambda p: p.z)
    rim = [p for p in tp if p.z < min(q.z for q in tp) + 0.02]
    rc = Vector((sum(p.x for p in rim) / len(rim), sum(p.y for p in rim) / len(rim), 0))
    print("   hat apex xy (%.3f %.3f) z %.3f   rim centre xy (%.3f %.3f)   -> rim centre minus head bbox centre: x %+.3f y %+.3f" % (
        apex.x, apex.y, apex.z, rc.x, rc.y, rc.x - (lo.x + hi.x) / 2, rc.y - (lo.y + hi.y) / 2))

before = set(bpy.data.objects)
fbx, _ = paths(other)
bpy.ops.import_scene.fbx(filepath=fbx)
new = [o for o in bpy.data.objects if o not in before and o.type == "MESH" and o.name.split(".")[0] not in bs.JUNK_NAMES]
body = max(new, key=lambda o: len(o.data.vertices))
report(other, pts_of([body]))
