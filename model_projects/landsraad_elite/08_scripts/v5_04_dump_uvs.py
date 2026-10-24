"""v5 recolour step A (Blender): dump the UV triangles of the grafted Sardaukar pauldron (comp 14)
and of the guard parts used as colour reference (comps 11/12 chest plates, 17/18 helmet hood),
so v5_05_recolour.py can rasterize masks on the real textures.

  blender -b --python 08_scripts/v5_04_dump_uvs.py
"""
import json
import os

import bmesh
import bpy

MP = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects"
OUT = os.path.join(MP, "landsraad_elite", "08_scripts", "intermediate_data", "v5_uv_tris.json")


def comps_of(obj):
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack, c = [v], []
        seen.add(v.index)
        while stack:
            x = stack.pop()
            c.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(c)
    bm.free()
    return sorted(comps, key=len, reverse=True)


def uv_tris(obj, comp):
    me = obj.data
    uv = me.uv_layers.active.data
    keep = set(comp)
    tris = []
    me.calc_loop_triangles()
    for t in me.loop_triangles:
        if all(me.loops[l].vertex_index in keep for l in t.loops):
            tris.append([[uv[l].uv[0], uv[l].uv[1]] for l in t.loops])
    return tris


res = {}
for key, rel, name, ids in (
        ("sardaukar", "imperial_sardaukar/03_blender/Imperial_Sardaukar.blend", "Imperial", [14, 18, 19]),
        ("guard", "landsraad_guard/03_blender/landsraad_guard_halberd_preview.blend", "LandsraadGuard", [11, 12, 17, 18, 7, 21])):
    bpy.ops.wm.open_mainfile(filepath=os.path.join(MP, rel))
    ob = bpy.data.objects[name]
    cs = comps_of(ob)
    for ci in ids:
        res["%s_%d" % (key, ci)] = uv_tris(ob, cs[ci])
        print("U", key, ci, len(res["%s_%d" % (key, ci)]), "tris")
os.makedirs(os.path.dirname(OUT), exist_ok=True)
json.dump(res, open(OUT, "w"))
