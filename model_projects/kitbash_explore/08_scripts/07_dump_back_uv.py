"""Dump UV triangles of the Commando's vest-back faces (hidden under the backpack in vanilla) -> json.
    blender -b --python 07_dump_back_uv.py"""
import json, os, sys
import bpy
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs, dsw_parts as P
from units import paths
bs.reset_scene()
body, rig = bs.import_model(paths("Commando")[0])
me = body.data
comps = P.components(body)
comp_of = {}
for ci, c in enumerate(comps):
    for i in c: comp_of[i] = ci
uv = me.uv_layers.active.data
out = {}
for p in me.polygons:
    ci = comp_of[p.vertices[0]]
    c = p.center
    if p.normal.y > 0.25 and 1.2 < c.z < 1.85 and abs(c.x) < 0.3:
        key = "comp%d" % ci
        out.setdefault(key, []).append([list(uv[li].uv) for li in p.loop_indices])
print({k: len(v) for k, v in out.items()})
json.dump(out, open(os.path.join(os.path.dirname(HERE), "04_textures", "commando_back_uv.json"), "w"))
