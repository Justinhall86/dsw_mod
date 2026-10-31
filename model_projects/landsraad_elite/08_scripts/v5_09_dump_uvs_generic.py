"""v5 recolour step A for any donor (Blender): add donor parts' UV triangles to v5_uv_tris.json.

  blender -b --python 08_scripts/v5_09_dump_uvs_generic.py

Keys are "<donor>_<component id>" (component id = rank by vertex count, as everywhere in v5).
"""
import json
import os
import sys

import bpy

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
MP = r"C:\Users\justi\Python\dsw_mod\model_projects"
JSON = os.path.join(MP, "landsraad_elite", "08_scripts", "intermediate_data", "v5_uv_tris.json")
HG_PAD = [20, 21, 30, 31, 35, 36, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54]
DONORS = (
    ("gurney", "gurney/03_blender/Male01_AtreidesGurney.blend", "Atreides_Gurney", [17, 18]),
    ("houseguard", "imperial_houseguard/03_blender/Imperial_HouseGuard.blend", "Imperial", HG_PAD),
)

exec(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "v5_04_dump_uvs.py")).read().split("res = {}")[0])
res = json.load(open(JSON))
for key, rel, name, ids in DONORS:
    bpy.ops.wm.open_mainfile(filepath=os.path.join(MP, rel))
    ob = bpy.data.objects[name]
    cs = comps_of(ob)
    for ci in ids:
        res["%s_%d" % (key, ci)] = uv_tris(ob, cs[ci])
    print("U", key, len(ids), "parts")
json.dump(res, open(JSON, "w"))
