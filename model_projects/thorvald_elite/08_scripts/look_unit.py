"""Render a converted unit FBX with its albedo, close on a region, from several directions (reference look at another unit's parts).

    blender -b --python look_unit.py -- <unit.fbx> <albedo.png> <out.png> [z_centre] [ortho_scale]
Writes <out>_front.png, _side.png, _tq.png, _back.png.
"""
import sys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
fbx, alb, out = a[:3]
zc = float(a[3]) if len(a) > 3 else 1.4
osc = float(a[4]) if len(a) > 4 else 0.9
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
img = bpy.data.images.load(alb, check_existing=False)
mat = bpy.data.materials.new("A")
mat.use_nodes = True
t = mat.node_tree.nodes.new("ShaderNodeTexImage")
t.image = img
b = mat.node_tree.nodes["Principled BSDF"]
mat.node_tree.links.new(t.outputs["Color"], b.inputs["Base Color"])
b.inputs["Roughness"].default_value = 0.7
for o in bpy.data.objects:
    if o.type == "MESH":
        if o.name.split(".")[0] == "Cube":
            o.hide_render = True
            continue
        o.data.materials.clear()
        o.data.materials.append(mat)
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = sc.render.resolution_y = 800
w = bpy.data.worlds.new("W")
w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.8, 0.8, 0.82, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 1.6
sc.world = w
sun = bpy.data.objects.new("S", bpy.data.lights.new("S", "SUN"))
sun.data.energy = 2.5
sun.rotation_euler = (0.9, 0, -0.5)
sc.collection.objects.link(sun)
for tag, d in (("front", (0, -1, 0.1)), ("side", (1, 0, 0.1)), ("tq", (0.7, -0.7, 0.2)), ("back", (0, 1, 0.1))):
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = osc
    dv = Vector(d).normalized()
    cam.location = Vector((0, 0, zc)) + dv * 4
    cam.rotation_euler = (-dv).to_track_quat("-Z", "Y").to_euler()
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = out.replace(".png", "_%s.png" % tag)
    bpy.ops.render.render(write_still=True)
