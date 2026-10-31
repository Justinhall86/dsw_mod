"""List a weapon's mesh islands (verts, material, bbox) and render it face-on, coloured per island.

    blender -b --python shield_islands.py -- <weapon.fbx> <albedo.png> <out.png>
"""
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

fbx, alb, out = sys.argv[sys.argv.index("--") + 1:][:3]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
for o in list(bpy.data.objects):
    if o.type != "MESH" or o.name.split(".")[0] == "Cube":
        bpy.data.objects.remove(o, do_unlink=True)
objs = [o for o in bpy.data.objects]
for o in objs:
    o.parent = None
bpy.context.view_layer.update()
for o in objs:
    o.data.transform(o.matrix_world)
    o.matrix_world = Matrix.Identity(4)
    bm = bmesh.new()
    bm.from_mesh(o.data)
    seen, isl = set(), []
    for v in bm.verts:
        if v in seen:
            continue
        stack, comp = [v], []
        seen.add(v)
        while stack:
            a = stack.pop()
            comp.append(a)
            for e in a.link_edges:
                b = e.other_vert(a)
                if b not in seen:
                    seen.add(b)
                    stack.append(b)
        isl.append(comp)
    isl.sort(key=len, reverse=True)
    for i, c in enumerate(isl):
        lo = [round(min(v.co[k] for v in c), 3) for k in range(3)]
        hi = [round(max(v.co[k] for v in c), 3) for k in range(3)]
        mats = {f.material_index for v in c for f in v.link_faces}
        print("ISLAND %s %2d verts %4d mats %s lo %s hi %s" % (o.name, i, len(c), sorted(o.data.materials[m].name for m in mats if m < len(o.data.materials)), lo, hi))
    bm.free()
    print("MATS", o.name, [m.name for m in o.data.materials])

img = bpy.data.images.load(alb, check_existing=False)
mat = bpy.data.materials.new("A")
mat.use_nodes = True
t = mat.node_tree.nodes.new("ShaderNodeTexImage")
t.image = img
mat.node_tree.links.new(t.outputs["Color"], mat.node_tree.nodes["Principled BSDF"].inputs["Base Color"])
for o in objs:
    o.data.materials.clear()
    o.data.materials.append(mat)
pts = [v.co for o in objs for v in o.data.vertices]
lo = Vector([min(p[i] for p in pts) for i in range(3)])
hi = Vector([max(p[i] for p in pts) for i in range(3)])
c, ext = (lo + hi) / 2, hi - lo
thin = min(range(3), key=lambda i: ext[i])
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = sc.render.resolution_y = 900
sc.render.film_transparent = False
w = bpy.data.worlds.new("W")
w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.8, 0.8, 0.82, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 1.2
sc.world = w
outs = []
for sign in (1, -1):
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = max(ext) * 1.15
    d = Vector((0, 0, 0))
    d[thin] = sign * 3
    cam.location = c + d
    cam.rotation_euler = (-d).to_track_quat("-Z", "Z" if thin != 2 else "Y").to_euler()
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = out.replace(".png", "_%s.png" % ("a" if sign > 0 else "b"))
    bpy.ops.render.render(write_still=True)
