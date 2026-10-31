"""Report how a vehicle mesh decomposes into bone-bound groups and loose parts.

    blender -b <blend> --python 03_split_parts.py -- <report.json>
"""
import bpy
import json
import os
import sys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
OUT = os.path.abspath(argv[0]) if argv else "parts.json"

import bmesh

report = {"objects": []}
dg = bpy.context.evaluated_depsgraph_get()

for ob in [o for o in bpy.data.objects if o.type == "MESH"]:
    oe = ob.evaluated_get(dg)
    me = oe.to_mesh()
    mw = oe.matrix_world
    verts = [mw @ v.co for v in me.vertices]

    entry = {"object": ob.name, "verts": len(me.vertices), "polys": len(me.polygons),
             "materials": [m.name if m else None for m in ob.data.materials],
             "bones": [], "components": []}

    gi2name = {g.index: g.name for g in ob.vertex_groups}
    tot = {}
    for v in ob.data.vertices:
        for g in v.groups:
            if g.weight <= 0.0:
                continue
            n = gi2name.get(g.group)
            tot.setdefault(n, []).append((v.index, g.weight))

    for bone, pairs in sorted(tot.items(), key=lambda kv: -len(kv[1])):
        pts = [verts[i] for i, w in pairs if w > 0.5]
        if not pts:
            pts = [verts[i] for i, w in pairs]
        if not pts:
            continue
        mn = Vector((min(p[i] for p in pts) for i in range(3)))
        mx = Vector((max(p[i] for p in pts) for i in range(3)))
        ctr = (mn + mx) / 2
        entry["bones"].append({
            "bone": bone, "nverts": len(pairs),
            "min": [round(v, 3) for v in mn], "max": [round(v, 3) for v in mx],
            "ctr": [round(v, 3) for v in ctr],
            "size": [round(v, 3) for v in (mx - mn)],
        })

    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    seen = set()
    comps = []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack = [v]
        seen.add(v.index)
        idx = []
        while stack:
            cur = stack.pop()
            idx.append(cur.index)
            for e in cur.link_edges:
                o = e.other_vert(cur)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        pts = [verts[i] for i in idx]
        mn = Vector((min(p[i] for p in pts) for i in range(3)))
        mx = Vector((max(p[i] for p in pts) for i in range(3)))
        comps.append({"nverts": len(idx),
                      "ctr": [round(v, 3) for v in ((mn + mx) / 2)],
                      "size": [round(v, 3) for v in (mx - mn)]})
    bm.free()
    comps.sort(key=lambda c: -(c["size"][0] * c["size"][1] * c["size"][2]))
    entry["components"] = comps[:40]
    entry["ncomponents"] = len(comps)
    oe.to_mesh_clear()
    report["objects"].append(entry)

with open(OUT, "w", encoding="utf-8") as fh:
    json.dump(report, fh, indent=1)
print("REPORT", OUT)
