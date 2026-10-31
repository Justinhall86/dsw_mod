"""Dump the rifle's UV polygons split into 'ochre' (stock frame, handguard, foregrip pad) and 'metal' (everything else) -> sniper_uv.json.

    blender -b --python dump_sniper_uv.py
Parts are connected components ranked by vertex count (see probe_parts.py); long axis = local z (muzzle +z), height = local y.
"""
import json
import os

import bmesh
import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
OCHRE = {5, 6, 11, 12, 13, 14, 15, 16, 17, 18, 23, 26, 45, 46}
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(HERE, "source", "RavagerLeaderSniper_TRUE_FBX.fbx"))
w = max([o for o in bpy.data.objects if o.type == "MESH"], key=lambda o: len(o.data.vertices))
bm = bmesh.new()
bm.from_mesh(w.data)
seen, comps = set(), []
for v in bm.verts:
    if v in seen:
        continue
    st, c = [v], []
    seen.add(v)
    while st:
        x = st.pop()
        c.append(x)
        for e in x.link_edges:
            o = e.other_vert(x)
            if o not in seen:
                seen.add(o)
                st.append(o)
    comps.append(c)
comps.sort(key=len, reverse=True)
part = {v.index: k for k, c in enumerate(comps) for v in c}
uvl = bm.loops.layers.uv.active
out = {"ochre": [], "metal": []}
for f in bm.faces:
    key = "ochre" if part[f.verts[0].index] in OCHRE else "metal"
    out[key].append([tuple(l[uvl].uv) for l in f.loops])
json.dump(out, open(os.path.join(HERE, "sniper_uv.json"), "w"))
print("DUMP", {k: len(v) for k, v in out.items()})
