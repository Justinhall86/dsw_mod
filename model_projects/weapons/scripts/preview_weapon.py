"""Render a library weapon on its own (side and three-quarter), in weapon space, for the library index.

    blender -b --python preview_weapon.py -- <weapon_dir> <out.png>
"""
import json
import os
import sys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
wdir, out = os.path.abspath(a[0]), os.path.abspath(a[1])
spec = json.load(open(os.path.join(wdir, "weapon.json")))
bpy.ops.wm.read_factory_settings(use_empty=True)
if "blend" in spec:
    with bpy.data.libraries.load(os.path.join(wdir, spec["blend"]), link=False) as (src, dst):
        dst.objects = [spec["object"]]
    w = dst.objects[0]
    bpy.context.collection.objects.link(w)
else:
    bpy.ops.import_scene.fbx(filepath=os.path.join(wdir, spec["fbx"]))
    w = max([o for o in bpy.data.objects if o.type == "MESH"], key=lambda o: len(o.data.vertices))
    for o in [o for o in bpy.data.objects if o is not w]:
        bpy.data.objects.remove(o, do_unlink=True)
w.parent = None
w.matrix_world.identity()
for mat in w.data.materials:
    if mat and mat.use_nodes:
        for sock, rel in spec.get("textures", {}).items():
            for lk in mat.node_tree.links:
                if lk.to_socket.name == sock and lk.from_node.type == "TEX_IMAGE":
                    lk.from_node.image = bpy.data.images.load(os.path.join(wdir, rel), check_existing=False)
        if sock_ok := mat.node_tree.nodes.get("Principled BSDF"):
            for lk in [lk for lk in mat.node_tree.links if lk.to_socket.name == "Specular IOR Level"]:
                mat.node_tree.links.remove(lk)
            sock_ok.inputs["Specular IOR Level"].default_value = 0.3
# longest local axis -> world x (a landscape frame shows it whole), middle axis -> world z (up), thinnest -> toward the camera
from mathutils import Matrix  # noqa: E402
ext = [max(v.co[i] for v in w.data.vertices) - min(v.co[i] for v in w.data.vertices) for i in range(3)]
order = sorted(range(3), key=lambda i: -ext[i])
R = Matrix(((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 0.0)))
R[0][order[0]] = R[2][order[1]] = R[1][order[2]] = 1.0
if R.determinant() < 0:
    R[1][order[2]] = -1.0
w.matrix_world = R.to_4x4()
bpy.context.view_layer.update()
pts = [w.matrix_world @ v.co for v in w.data.vertices]
c = Vector(((max(p.x for p in pts) + min(p.x for p in pts)) / 2, (max(p.y for p in pts) + min(p.y for p in pts)) / 2,
            (max(p.z for p in pts) + min(p.z for p in pts)) / 2))
size = max(max(p.x for p in pts) - min(p.x for p in pts), max(p.y for p in pts) - min(p.y for p in pts))
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 1400, 500
sc.view_settings.view_transform = "Standard"
world = bpy.data.worlds.new("W")
sc.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.82, 0.83, 0.85, 1)
sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
sun.data.energy = 3.0
sun.rotation_euler = (0.7, 0.2, 0.6)
sc.collection.objects.link(sun)
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cd.ortho_scale = size * 1.12
cam = bpy.data.objects.new("Cam", cd)
sc.collection.objects.link(cam)
cam.location = c + Vector((0.0, -3.0, 1.2))
cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
sc.camera = cam
sc.render.filepath = out
bpy.ops.render.render(write_still=True)
print("PREVIEW", out, "length %.3f m" % size)
