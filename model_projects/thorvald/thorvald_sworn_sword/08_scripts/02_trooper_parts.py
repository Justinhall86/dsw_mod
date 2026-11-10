"""Which piece of the Thorvald Trooper v13 is which: every mesh component of the head, sash and legs objects in its own
flat colour (front / three-quarter / side / back), plus a table of component bounds.

    blender -b <Thorvald_Trooper_v13.blend> --python 02_trooper_parts.py -- <out_dir>
"""
import colorsys
import math
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, r"D:\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

OUT = sys.argv[sys.argv.index("--") + 1]
os.makedirs(OUT, exist_ok=True)
sc = bpy.context.scene
rig = bpy.data.objects["Armature"]
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
bpy.data.objects["Thorvald_Katana"].hide_render = True

STUDY = ("CommandoHead", "DuncanFill_sash", "DuncanFill_legs", "TrooperNeck")
k = 0
for name in STUDY:
    ob = bpy.data.objects[name]
    me = ob.data
    comps = [c for c in P.components(ob)]
    comps.sort(key=lambda c: -len(c))
    col = me.color_attributes.new("part", "BYTE_COLOR", "POINT")
    for ci, idx in enumerate(comps):
        h = (k * 0.618) % 1.0
        r, g, b = colorsys.hsv_to_rgb(h, 0.75, 0.95)
        for i in idx:
            col.data[i].color = (r, g, b, 1)
        ws = [ob.matrix_world @ me.vertices[i].co for i in idx]
        lo = [min(v[j] for v in ws) for j in range(3)]
        hi = [max(v[j] for v in ws) for j in range(3)]
        print("COMP %-16s %2d hue %.2f n=%4d lo=%s hi=%s" % (name, ci, h, len(idx), [round(x, 3) for x in lo],
                                                           [round(x, 3) for x in hi]))
        k += 1
    mat = bpy.data.materials.new("flat_" + name)
    mat.use_nodes = True
    nt = mat.node_tree
    a = nt.nodes.new("ShaderNodeAttribute")
    a.attribute_name = "part"
    nt.links.new(a.outputs["Color"], nt.nodes["Principled BSDF"].inputs["Base Color"])
    me.materials.clear()
    me.materials.append(mat)
for o in bpy.data.objects:
    if o.type == "MESH" and o.name not in STUDY and o.name != "Thorvald_Katana":
        m = bpy.data.materials.new("grey")
        m.use_nodes = True
        m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (0.25, 0.25, 0.25, 1)
        o.data.materials.clear()
        o.data.materials.append(m)

cam = bpy.data.objects.get("Camera")
sc.camera = cam
cam.data.type = "ORTHO"
sc.render.engine = "BLENDER_EEVEE"
for name, tgt, scale, d, w, h in (
        ("body_front", (0, 0, 1.0), 2.3, (0, -1, 0), 500, 800), ("body_tq", (0, 0, 1.0), 2.3, (0.7, -0.7, 0), 500, 800),
        ("body_side", (0, 0, 1.0), 2.3, (1, 0, 0), 500, 800), ("body_back", (0, 0, 1.0), 2.3, (0, 1, 0), 500, 800),
        ("head_front", (0, 0, 1.78), 0.6, (0, -1, 0.05), 500, 500), ("head_side", (0, 0, 1.78), 0.6, (1, 0, 0.05), 500, 500),
        ("head_back", (0, 0, 1.78), 0.6, (0, 1, 0.05), 500, 500), ("head_tq", (0, 0, 1.78), 0.6, (0.7, -0.7, 0.1), 500, 500)):
    sc.render.resolution_x, sc.render.resolution_y = w, h
    cam.data.ortho_scale = scale
    t = Vector(tgt)
    cam.location = t + Vector(d).normalized() * 5
    cam.rotation_euler = (t - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, name + ".png")
    bpy.ops.render.render(write_still=True)
print("DONE")
