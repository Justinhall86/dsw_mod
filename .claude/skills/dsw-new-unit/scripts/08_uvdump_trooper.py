"""Dump every face of a variant .blend as (texture, region, UV polygon) so a recolour can be done PER BODY REGION.

    blender -b <variant.blend> --python 08_uvdump.py -- <out.json>

Hue alone cannot separate parts that share a colour (the Mercenary's terracotta mantle and its brown boots), so each
face gets a region from WHERE it is on the body (object + rest-pose height + dominant bone).
"""
import json
import os
import sys

import bpy

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])


def albedo_of(mat):
    """Path of the image feeding Base Color (the packed image keeps its source filepath)."""
    for l in mat.node_tree.links:
        if l.to_socket.name == "Base Color" and l.from_node.type == "TEX_IMAGE" and l.from_node.image:
            return bpy.path.abspath(l.from_node.image.filepath)
    return None


def region(obj, face, dom):
    c = obj.matrix_world @ face.center
    name = obj.name
    if "Emblem" in name:
        return "emblem"
    if "Yoke" in name:
        return "upper"
    if "Cuff" in name or "Waist" in name:
        return "skirt"
    if "Hat" in name:
        return "hat"
    if name == "GurneyHead":
        return "g_head"            # only the eye band survives under the hood: leave the skin as painted
    if "Head" in name:
        return "head"
    if "Fill_skirt" in name:
        return "skirt"
    if "Fill_legs" in name:
        return "legs"
    bones = [dom.get(v) for v in face.vertices]
    if "Fill_arms" in name:
        b = max(set(bones), key=bones.count) or ""
        if "Finger" in b or "Thumb" in b:
            return "hands"
        return "arm_up" if ("Shoulder" in b or "Clavicle" in b) else "arm_low"
    b0 = max(set(bones), key=bones.count) or ""
    if name == "Gurney" and not any(k in b0 for k in ("Wrist", "Finger", "Thumb")):
        if "Shoulder" in b0:
            return "g_arm_up"
        if "Elbow" in b0 or "Forearm" in b0:
            return "g_arm_low"
        if c.z > 1.60 and abs(c.x) < 0.20:
            return "g_collar"
        return "g_upper"
    if any(b and ("Wrist" in b or "Finger" in b or "Thumb" in b) for b in bones):
        return "hands"
    if c.z > 1.28:
        return "upper"
    if c.z > 0.98:
        return "belt"
    return "legs"


data = {}
for obj in bpy.data.objects:
    if obj.type != "MESH" or obj.hide_render:
        continue
    names = {g.index: g.name for g in obj.vertex_groups}
    dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}
    uv = obj.data.uv_layers.active.data
    for face in obj.data.polygons:
        mat = obj.data.materials[face.material_index]
        tex = albedo_of(mat)
        if not tex or "Trim_Albedo" in tex:
            continue
        reg = region(obj, face, dom)
        poly = [tuple(uv[li].uv) for li in face.loop_indices]
        data.setdefault(tex, {}).setdefault(reg, []).append(poly)
json.dump(data, open(out, "w"))
for tex, regs in data.items():
    print("UVDUMP", os.path.basename(tex), {r: len(p) for r, p in regs.items()})
