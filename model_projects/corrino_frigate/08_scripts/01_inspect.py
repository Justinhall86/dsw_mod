"""Inspect an imported vehicle FBX: objects, bones, materials, bbox, components.

    blender -b --python 01_inspect.py -- <fbx> [texdir]
"""
import bpy
import os
import sys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:]
FBX = os.path.abspath(argv[0])
TEX = os.path.abspath(argv[1]) if len(argv) > 1 else os.path.dirname(FBX)

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)

result = {"objects": [], "images": [], "materials": []}
for o in bpy.data.objects:
    e = {"name": o.name, "type": o.type, "parent": o.parent.name if o.parent else None}
    if o.type == "MESH":
        e["verts"] = len(o.data.vertices)
        e["polys"] = len(o.data.polygons)
        e["materials"] = [m.name for m in o.data.materials if m]
        e["vgroups"] = [g.name for g in o.vertex_groups]
        e["modifiers"] = [(m.name, m.type) for m in o.modifiers]
        dg = bpy.context.evaluated_depsgraph_get()
        oe = o.evaluated_get(dg)
        pts = [oe.matrix_world @ v.co for v in oe.to_mesh().vertices]
        oe.to_mesh_clear()
        if pts:
            mn = Vector((min(p[i] for p in pts) for i in range(3)))
            mx = Vector((max(p[i] for p in pts) for i in range(3)))
            e["bbox_min"] = [round(v, 3) for v in mn]
            e["bbox_max"] = [round(v, 3) for v in mx]
            e["size"] = [round(v, 3) for v in (mx - mn)]
    result["objects"].append(e)

for i in bpy.data.images:
    result["images"].append({"name": i.name, "file": i.filepath, "size": list(i.size)})

for m in bpy.data.materials:
    nodes = []
    if m.use_nodes:
        for n in m.node_tree.nodes:
            if n.type == "TEX_IMAGE":
                nodes.append({"node": n.name, "image": n.image.name if n.image else None,
                              "socket_links": []})
        for n in m.node_tree.nodes:
            if n.type == "BSDF_PRINCIPLED":
                for s in n.inputs:
                    if s.is_linked:
                        nodes.append({"in": s.name, "from": s.links[0].from_node.name})
    result["materials"].append({"name": m.name, "nodes": nodes})

for f in os.listdir(TEX):
    if f.lower().endswith((".png", ".dds")):
        result.setdefault("texdir", []).append(f)

import json
out = os.path.join(os.path.dirname(FBX), os.path.splitext(os.path.basename(FBX))[0] + "_report.json")
with open(out, "w", encoding="utf-8") as fh:
    json.dump(result, fh, indent=1)
print("REPORT", out)
