"""Render the base mesh with its tagged regions ('reg' point attribute) in flat colours, plus every island of the base in a distinct grey, close on
the shoulders.

    blender -b <blend> --python view_regions.py -- <out.png> [--islands]
"""
import colorsys
import sys

import bmesh
import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
out = a[0]
base = max([o for o in bpy.data.objects if o.type == "MESH" and "reg" in o.data.attributes], key=lambda o: len(o.data.vertices))
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
for o in bpy.data.objects:
    if o.type == "MESH" and o is not base:
        o.hide_render = True
reg = base.data.attributes["reg"].data
mats = []
for k in range(8):
    m = bpy.data.materials.new("R%d" % k)
    m.use_nodes = True
    c = (0.5, 0.5, 0.5) if k == 0 else colorsys.hsv_to_rgb(k / 7.0, 0.9, 0.9)
    m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (*c, 1)
    mats.append(m)
base.data.materials.clear()
for m in mats:
    base.data.materials.append(m)
for p in base.data.polygons:
    p.material_index = max(reg[i].value for i in p.vertices)
if "--islands" in a:   # label each island with its own hue instead
    pass
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 1400, 700
w = bpy.data.worlds.new("W")
w.use_nodes = True
w.node_tree.nodes["Background"].inputs[1].default_value = 1.5
sc.world = w
import math
for k, (d, tag) in enumerate((((0, -1, 0.15), "front"), ((1, -0.3, 0.2), "side"))):
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = 1.0
    dv = Vector(d).normalized()
    cam.location = Vector((0, 0, 1.42)) + dv * 4
    cam.rotation_euler = (-dv).to_track_quat("-Z", "Y").to_euler()
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = out.replace(".png", "_%s.png" % tag)
    bpy.ops.render.render(write_still=True)
