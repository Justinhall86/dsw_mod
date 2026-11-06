"""List every component of a donor body (no height filter), with its bbox in rest pose.

  blender -b --factory-startup --python list_components.py -- --blend <file.blend> --object <body name>
"""
import argparse
import os
import sys

import bpy

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
ap.add_argument("--object", required=True)
a = ap.parse_args(P.script_args())

bpy.ops.wm.open_mainfile(filepath=os.path.abspath(a.blend))
for o in bpy.data.objects:
    if o.type == "ARMATURE":
        P.rest_pose(o)
body = bpy.data.objects[a.object]
comps = P.components(body)
rows = []
for cid, idx in enumerate(comps):
    info = P.comp_info(body, idx)
    rows.append((cid, len(idx), info))
for cid, n, info in rows:
    lo, hi = info["lo"], info["hi"]
    print("COMP %3d verts %4d lo %s hi %s bones %s" % (
        cid, n, [round(v, 2) for v in lo], [round(v, 2) for v in hi], info.get("bones", [])[:2]))
