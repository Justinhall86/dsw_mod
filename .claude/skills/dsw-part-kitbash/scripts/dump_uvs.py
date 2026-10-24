"""Dump the UV triangles of chosen components into a JSON file (merged), for recolour_parts.py / pick_uv_patches.py.

  blender -b --python dump_uvs.py -- --blend <file.blend> --object <name> --components 14 18 19 --key sardaukar --json uv_tris.json

Each component is stored under "<key>_<id>". Run once for the donor parts and once for the reference body islands
(the parts of the target unit whose colours you want to match, e.g. the guard's hood: --key guard --components 17 18).
"""
import argparse
import json
import os
import sys

import bpy

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dsw_parts as P  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--blend", required=True)
ap.add_argument("--object", required=True)
ap.add_argument("--components", type=int, nargs="+", required=True)
ap.add_argument("--key", required=True)
ap.add_argument("--json", required=True)
a = ap.parse_args(P.script_args())

bpy.ops.wm.open_mainfile(filepath=a.blend)
ob = bpy.data.objects[a.object]
me = ob.data
uv = me.uv_layers.active.data
me.calc_loop_triangles()
comps = P.components(ob)
res = json.load(open(a.json)) if os.path.exists(a.json) else {}
for ci in a.components:
    keep = set(comps[ci])
    res["%s_%d" % (a.key, ci)] = [[[uv[l].uv[0], uv[l].uv[1]] for l in t.loops]
                                  for t in me.loop_triangles if all(me.loops[l].vertex_index in keep for l in t.loops)]
    print("UV %s_%d: %d tris" % (a.key, ci, len(res["%s_%d" % (a.key, ci)])))
os.makedirs(os.path.dirname(os.path.abspath(a.json)), exist_ok=True)
json.dump(res, open(a.json, "w"))
