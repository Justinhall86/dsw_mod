"""Survey the candidate donor vehicles for the Thorvald Interceptor.

    blender -b --factory-startup --python 01_inventory.py

Writes a JSON report of every donor's world-space size, island count, material
list and per-bone vertex weighting into 01_input/donor_inventory.json.

Why this matters: HMD-converted meshes keep the FBX import's rest space, so
`mesh.data.vertices` are NOT where the part appears on screen. Everything here
reads the *evaluated* object (armature modifier applied), which is the only
honest source for sizes and placement boxes.
"""
import json
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PROJ))
OUT = os.path.join(PROJ, "01_input", "donor_inventory.json")

# name -> path relative to model_inputs/Vehicle
# *_real.fbx are the true-FBX conversions; the plain .fbx start with "HMD" bytes
# and Blender refuses them.
DONORS = {
    "Chronos":     "Imperial/Chronos/preview_textures/Chronos_real.fbx",
    "CarryAll":    "Atreide/CarryAll/preview_textures/CarryAll_real.fbx",
    "Wraith":      "Smuggler/Wraith/preview_textures/Wraith_real.fbx",
    "Banshee":     "Smuggler/Banshee/preview_textures/Banshee_real.fbx",
    "Ravager":     "Common/Ravager/preview_textures/Ravager_real.fbx",
    "Kraken":      "Atreide/Kraken/preview_textures/Kraken_real.fbx",
    "Hawk":        "Atreide/Hawk/preview_textures/Hawk_real.fbx",
    "Overlord":    "Harkonnen/Overlord/preview_textures/Overlord_real.fbx",
    "Hammer":      "Imperial/Hammer/preview_textures/Hammer_real.fbx",
    "DroneS":      "Smuggler/DroneS/preview_textures/DroneS_real.fbx",
    "DroneA":      "Atreide/DroneA/preview_textures/DroneA_real.fbx",
    "Harvester":   "Atreide/Harvester/preview_textures/Harvester_real.fbx",
    "Frigate":     "Common/Renegade_Frigate/preview_textures/Renegade_Frigate_real.fbx",
    "Harpy":       "Harkonnen/Harpy/preview_textures/Harpy_real.fbx",
    "Tank":        "Atreide/Tank/preview_textures/Tank_real.fbx",
    "Thopter":     "Atreide/Ornithopter/preview_textures/Ornithopter_real.fbx",
}

VEH = os.path.join(REPO, "model_inputs", "Vehicle")


def evaluated_bounds(obj):
    """World-space bounds of the object WITH modifiers applied.

    `obj.bound_box` is the pre-modifier box for skinned meshes, and reading it
    is what produced the earlier "part lands off the ship" bugs.
    """
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    mw = ev.matrix_world
    pts = [mw @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    if not pts:
        return None
    lo = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
    hi = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
    return lo, hi


def evaluated_vertices(obj):
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    mw = ev.matrix_world
    pts = [mw @ v.co for v in me.vertices]
    tris = len(me.loop_triangles) if me.loop_triangles else 0
    me.calc_loop_triangles()
    tris = len(me.loop_triangles)
    verts = len(me.vertices)
    polys = len(me.polygons)
    ev.to_mesh_clear()
    return pts, verts, polys, tris


def bone_weights(obj):
    """bone name -> number of vertices it dominates. Tells us which donors carry
    a rig (so a part can keep its own skinning) and which are static meshes."""
    groups = {g.index: g.name for g in obj.vertex_groups}
    counts = {}
    for v in obj.data.vertices:
        if not v.groups:
            counts["NONE"] = counts.get("NONE", 0) + 1
            continue
        # VertexGroupElement exposes .group (the index), not .index.
        g = max(v.groups, key=lambda g: g.weight)
        name = groups.get(g.group, "?")
        counts[name] = counts.get(name, 0) + 1
    return counts


def survey(name, rel):
    path = os.path.join(VEH, rel.replace("/", os.sep))
    rec = {"name": name, "path": rel, "exists": os.path.exists(path)}
    if not rec["exists"]:
        rec["error"] = "missing"
        return rec

    bpy.ops.wm.read_factory_settings(use_empty=True)
    try:
        bpy.ops.import_scene.fbx(filepath=path)
    except RuntimeError as exc:
        rec["error"] = "import: %s" % exc
        return rec

    # Game FBXs carry a `Cube` 2m bounds helper - it would dominate every measurement.
    for junk in ("Cube", "Camera", "Light", "Lamp"):
        o = bpy.data.objects.get(junk)
        if o and o.type == "MESH":
            bpy.data.objects.remove(o, do_unlink=True)

    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    rigs = [o for o in bpy.data.objects if o.type == "ARMATURE"]
    if not meshes:
        rec["error"] = "no mesh"
        return rec

    body = max(meshes, key=lambda o: len(o.data.polygons))
    bpy.context.view_layer.update()

    bounds = evaluated_bounds(body)
    if bounds is None:
        rec["error"] = "empty mesh"
        return rec
    lo, hi = bounds
    pts, verts, polys, tris = evaluated_vertices(body)

    rec.update({
        "mesh_objects": [o.name for o in meshes],
        "body": body.name,
        "armature": rigs[0].name if rigs else None,
        "materials": [m.name for m in body.data.materials if m],
        "verts": verts,
        "polys": polys,
        "tris": tris,
        "lo": [round(v, 4) for v in lo],
        "hi": [round(v, 4) for v in hi],
        "size": [round(hi.x - lo.x, 4), round(hi.y - lo.y, 4), round(hi.z - lo.z, 4)],
        "centre": [round((lo.x + hi.x) / 2, 4), round((lo.y + hi.y) / 2, 4), round((lo.z + hi.z) / 2, 4)],
    })
    bw = bone_weights(body)
    rec["bones"] = dict(sorted(bw.items(), key=lambda kv: -kv[1])[:12])
    return rec


def main():
    report = []
    for name, rel in DONORS.items():
        rec = survey(name, rel)
        report.append(rec)
        if "error" in rec:
            print("FAIL %-12s %s" % (name, rec["error"]))
        else:
            print("OK   %-12s size=%s  tris=%-6d mats=%d bones=%d"
                  % (name, rec["size"], rec["tris"], len(rec["materials"]),
                     len([b for b in rec["bones"] if b != "NONE"])))
    with open(OUT, "w") as fh:
        json.dump(report, fh, indent=2)
    print("\nWROTE", OUT)


main()
