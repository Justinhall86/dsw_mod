"""Render candidate weapons side by side (stacked rows, longest axis horizontal), each with its own albedo.

    blender -b --python weapon_lineup.py -- <out.png> name=fbx=albedo [name=fbx=albedo ...]
"""
import sys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
out, items = a[0], [x.split("=") for x in a[1:]]
bpy.ops.wm.read_factory_settings(use_empty=True)
row = 0.0
ROW = float(__import__("os").environ.get("LINEUP_ROW", "0.62"))   # row pitch in metres (launchers are taller than rifles)
for k, (name, fbx, alb) in enumerate(items):
    col, row = (k % 2) * 2.4, -(k // 2) * ROW
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o not in before]
    meshes = [o for o in new if o.type == "MESH" and o.name.split(".")[0] != "Cube"]
    for o in new:
        if o not in meshes:
            bpy.data.objects.remove(o, do_unlink=True)
    for o in meshes:
        o.parent = None
    bpy.context.view_layer.update()
    pts = [o.matrix_world @ v.co for o in meshes for v in o.data.vertices]
    lo = Vector([min(p[i] for p in pts) for i in range(3)])
    hi = Vector([max(p[i] for p in pts) for i in range(3)])
    ext = hi - lo
    ax = max(range(3), key=lambda i: ext[i])
    print("WEAPON %-22s length %.3f m  axis %s  size %s" % (name, ext[ax], "xyz"[ax], tuple(round(e, 3) for e in ext)))
    img = bpy.data.images.load(alb, check_existing=False)
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    t = mat.node_tree.nodes.new("ShaderNodeTexImage")
    t.image = img
    mat.node_tree.links.new(t.outputs["Color"], mat.node_tree.nodes["Principled BSDF"].inputs["Base Color"])
    mat.node_tree.nodes["Principled BSDF"].inputs["Roughness"].default_value = 0.6
    from mathutils import Matrix
    c = (lo + hi) / 2
    order = sorted(range(3), key=lambda i: -ext[i])  # long, mid, thin
    R = Matrix(((0, 0, 0), (0, 0, 0), (0, 0, 0)))
    R[0][order[0]] = 1.0   # long axis -> world X
    R[2][order[1]] = 1.0   # mid axis (height of the gun) -> world Z
    R[1][order[2]] = 1.0   # thin axis -> world Y (toward the camera)
    M = Matrix.Translation((col, 0, row)) @ R.to_4x4() @ Matrix.Translation(-c)
    for o in meshes:
        o.data.transform(M @ o.matrix_world)
        o.matrix_world = Matrix.Identity(4)
        o.data.materials.clear()
        o.data.materials.append(mat)
    txt = bpy.data.curves.new(name + "_t", "FONT")
    txt.body = "%s  %.2f m" % (name, ext[ax])
    tob = bpy.data.objects.new(name + "_t", txt)
    tob.scale = (0.06, 0.06, 0.06)
    tob.location = (col - 1.1, -0.3, row + 0.22)
    tob.rotation_euler = (1.5708, 0, 0)
    bpy.context.collection.objects.link(tob)
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
nrow = (len(items) + 1) // 2
sc.render.resolution_x, sc.render.resolution_y = 2000, int(2000 * (nrow * ROW + 0.1) / 4.8)
sc.view_settings.view_transform = "Standard"
w = bpy.data.worlds.new("W")
sc.world = w
w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.8, 0.8, 0.82, 1)
sun = bpy.data.objects.new("S", bpy.data.lights.new("S", "SUN"))
sun.data.energy = 3.5
sun.rotation_euler = (0.9, 0.1, 0.3)
sc.collection.objects.link(sun)
cd = bpy.data.cameras.new("C")
cd.type = "ORTHO"
cd.ortho_scale = 4.8
cam = bpy.data.objects.new("C", cd)
cam.location = (1.2, -4.0, -(nrow - 1) * ROW / 2 + 0.03)
cam.rotation_euler = (1.5708, 0, 0)
sc.collection.objects.link(cam)
sc.camera = cam
sc.render.filepath = out
bpy.ops.render.render(write_still=True)
