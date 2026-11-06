"""Inspect the four vehicle/ship sources before recolouring.

    blender -b --python 01_inspect.py

Reports, per source: every object, its material(s), the textures each material
wires and to which socket, triangle counts and the world bounds (after a view
layer update, since bound_box/matrix_world are cached - see traps.md).
"""
import json
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

PROJ = os.path.dirname(HERE)
SOURCES = {
    "fighter_wraith": os.path.join(PROJ, "05_fbx_export", "Wraith_TRUE_FBX.fbx"),
    "drone_drones": os.path.join(PROJ, "05_fbx_export", "DroneS_TRUE_FBX.fbx"),
    "claw_harvester": os.path.join(PROJ, "05_fbx_export", "Harvester_TRUE_FBX.fbx"),
    "carryall": os.path.join(PROJ, "05_fbx_export", "CarryAll_TRUE_FBX.fbx"),
}


def vec_min(a, b):
    return Vector((min(a.x, b.x), min(a.y, b.y), min(a.z, b.z)))


def vec_max(a, b):
    return Vector((max(a.x, b.x), max(a.y, b.y), max(a.z, b.z)))


def tex_report():
    """socket -> image filepath for every image node, grouped by material."""
    out = {}
    for m in bpy.data.materials:
        if not m.use_nodes:
            continue
        links = {}
        for l in m.node_tree.links:
            if l.from_node.type == "TEX_IMAGE" and l.from_node.image:
                links.setdefault(l.to_socket.name, os.path.basename(l.from_node.image.filepath))
        out[m.name] = links
    return out


report = {}
for key, path in SOURCES.items():
    bs.reset_scene()
    bpy.ops.import_scene.fbx(filepath=path)
    bpy.context.view_layer.update()
    bpy.context.evaluated_depsgraph_get().update()
    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    junk = [o.name for o in meshes if o.name in bs.JUNK_NAMES]
    meshes = [o for o in meshes if o.name not in bs.JUNK_NAMES]
    objs = []
    lo = hi = None
    for o in meshes:
        a, b = bs.model_bounds(o)
        lo = a if lo is None else vec_min(lo, a)
        hi = b if hi is None else vec_max(hi, b)
        objs.append({
            "name": o.name,
            "verts": len(o.data.vertices),
            "tris": len(o.data.loop_triangles),
            "materials": [ms.material.name if ms.material else None for ms in o.material_slots],
            "loc": [round(v, 3) for v in o.location],
        })
    report[key] = {
        "path": os.path.relpath(path, os.path.dirname(PROJ)),
        "junk_removed": junk,
        "objects": objs,
        "bounds": None if lo is None else {
            "lo": [round(v, 3) for v in lo],
            "hi": [round(v, 3) for v in hi],
            "size": [round(hi[i] - lo[i], 3) for i in range(3)],
        },
        "materials": tex_report(),
        "images": sorted({os.path.basename(i.filepath) for i in bpy.data.images if i.filepath}),
    }

print("=== INSPECT_JSON ===")
print(json.dumps(report, indent=1))
