"""Clay renders of a Meshy sculpt: full body (front / three-quarter / side / back) and head close-ups.

    blender -b --factory-startup <meshy.blend> --python 01_meshy_views.py -- <out_dir> <tag>
"""
import math
import os
import sys

import bpy
from mathutils import Vector

args = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG = args[0], args[1]
os.makedirs(OUT, exist_ok=True)
sc = bpy.context.scene
for o in [o for o in bpy.data.objects if o.type != "MESH"]:
    bpy.data.objects.remove(o, do_unlink=True)
ob = bpy.data.objects["mesh_node"]
mat = bpy.data.materials.new("clay")
mat.use_nodes = True
b = mat.node_tree.nodes["Principled BSDF"]
b.inputs["Base Color"].default_value = (0.55, 0.55, 0.57, 1)
b.inputs["Roughness"].default_value = 0.8
ob.data.materials.clear()
ob.data.materials.append(mat)
for p in ob.data.polygons:
    p.use_smooth = True
ws = [ob.matrix_world @ Vector(c) for c in ob.bound_box]
lo = Vector([min(v[i] for v in ws) for i in range(3)])
hi = Vector([max(v[i] for v in ws) for i in range(3)])
print("BOUNDS", tuple(round(x, 3) for x in lo), tuple(round(x, 3) for x in hi))
sc.render.engine = "BLENDER_EEVEE"
sc.render.film_transparent = False
sc.world = sc.world or bpy.data.worlds.new("w")
sc.world.use_nodes = True
sc.world.node_tree.nodes["Background"].inputs[0].default_value = (0.75, 0.76, 0.78, 1)
sc.world.node_tree.nodes["Background"].inputs[1].default_value = 0.7
sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
sun.data.energy = 3.5
sun.rotation_euler = (math.radians(50), 0, math.radians(30))
sc.collection.objects.link(sun)
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
sc.collection.objects.link(cam)
sc.camera = cam


def shot(name, target, scale, d, w, h):
    sc.render.resolution_x, sc.render.resolution_y = w, h
    cam.data.ortho_scale = scale
    cam.location = target + Vector(d).normalized() * 6
    cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (TAG, name))
    bpy.ops.render.render(write_still=True)


ctr = (lo + hi) / 2
H = hi.z - lo.z
# Meshy faces -Y? render all four sides; the sheet shows which is the front
for name, d in (("a_negY", (0, -1, 0)), ("b_tq", (0.7, -0.7, 0.05)), ("c_posX", (1, 0, 0)), ("d_posY", (0, 1, 0))):
    shot(name, ctr, H * 1.05, d, 600, 900)
head = Vector((ctr.x, ctr.y, hi.z - 0.17 * H))
for name, d in (("h_negY", (0, -1, 0.05)), ("h_tq", (0.7, -0.7, 0.1)), ("h_posX", (1, 0, 0.05)), ("h_posY", (0, 1, 0.1))):
    shot(name, head, 0.42 * H, d, 600, 600)
print("DONE")
