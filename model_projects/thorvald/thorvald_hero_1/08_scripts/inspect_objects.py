"""List objects in a .blend with vertex counts, bbox (world) and dominant bones.

  blender -b --factory-startup --python inspect_objects.py -- --blend <file.blend>
"""
import argparse
import os
import sys

import bpy

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
a = ap.parse_args(P.script_args())
bpy.ops.wm.open_mainfile(filepath=os.path.abspath(a.blend))
for o in bpy.data.objects:
    if o.type == "MESH":
        pts = [o.matrix_world @ v.co for v in o.data.vertices]
        if not pts:
            continue
        lo = [round(min(p[k] for p in pts), 3) for k in range(3)]
        hi = [round(max(p[k] for p in pts), 3) for k in range(3)]
        groups = {}
        for v in o.data.vertices:
            for g in v.groups:
                groups[o.vertex_groups[g.group].name] = groups.get(o.vertex_groups[g.group].name, 0) + g.weight
        top = sorted(groups.items(), key=lambda kv: -kv[1])[:3]
        print("OBJ %-28s verts %6d tris %6d lo %s hi %s mats %s top %s" % (
            o.name, len(o.data.vertices), len(o.data.polygons), lo, hi,
            [m.name if m else None for m in o.data.materials][:4], [(n, round(w)) for n, w in top]))
    elif o.type == "ARMATURE":
        print("ARM", o.name, len(o.data.bones))
