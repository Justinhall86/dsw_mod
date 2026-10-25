"""v6 weapon survey, step 2 (Blender): render every surveyed weapon upright, textured, all at the SAME scale
(ortho 2.8 m tall frame) so lengths compare directly. Long axis -> vertical, second-longest -> across.

  blender -b --python 08_scripts/v6_03_weapon_render.py
"""
import json
import math
import os

import bpy
from mathutils import Matrix, Vector

D = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite\05_fbx_export\weapon_survey"
OUT = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite\02_progress_photos\19_weapon_survey"
os.makedirs(OUT, exist_ok=True)
info = []
for w in json.load(open(os.path.join(D, "weapons.json"))):
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=os.path.join(D, w["name"] + ".fbx"))
    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    for o in [o for o in bpy.data.objects if o.type != "MESH"]:
        bpy.data.objects.remove(o, do_unlink=True)
    for o in meshes:
        o.data.transform(o.matrix_world)
        o.matrix_world = Matrix.Identity(4)
    pts = [v.co for o in meshes for v in o.data.vertices]
    lo = Vector([min(p[i] for p in pts) for i in range(3)])
    hi = Vector([max(p[i] for p in pts) for i in range(3)])
    ext = hi - lo
    order = sorted(range(3), key=lambda i: -ext[i])           # longest, second, shortest
    R = Matrix.Identity(4)
    for row, ax in zip((2, 0, 1), order):                     # longest -> Z, second -> X, shortest -> Y (toward camera)
        R[row] = [1.0 if c == ax else 0.0 for c in range(3)] + [0.0]
    if R.to_3x3().determinant() < 0:
        R[1] = [-x for x in R[1][:3]] + [0.0]
    c = (lo + hi) / 2
    for o in meshes:
        o.data.transform(R @ Matrix.Translation(-c))
    length = ext[order[0]]
    if w["albedo"]:
        mat = bpy.data.materials.new("m")
        mat.use_nodes = True
        nt = mat.node_tree
        tex = nt.nodes.new("ShaderNodeTexImage")
        tex.image = bpy.data.images.load(w["albedo"])
        nt.links.new(tex.outputs["Color"], nt.nodes["Principled BSDF"].inputs["Base Color"])
        nt.nodes["Principled BSDF"].inputs["Metallic"].default_value = 0.3
        nt.nodes["Principled BSDF"].inputs["Roughness"].default_value = 0.35
        for o in meshes:
            o.data.materials.clear()
            o.data.materials.append(mat)
    sc = bpy.context.scene
    world = bpy.data.worlds.new("W")
    sc.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    ld = bpy.data.lights.new("Sun", "SUN")
    ld.energy = 3.5
    sun = bpy.data.objects.new("Sun", ld)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(50), 0, math.radians(30))
    cd = bpy.data.cameras.new("cam")
    cam = bpy.data.objects.new("cam", cd)
    bpy.context.collection.objects.link(cam)
    cam.location = (0, -5, 0)
    cam.rotation_euler = (math.radians(90), 0, 0)
    cd.type, cd.ortho_scale = "ORTHO", 2.8
    sc.camera = cam
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 300, 1000
    sc.view_settings.view_transform = "Standard"
    sc.render.filepath = os.path.join(OUT, "%s.png" % w["name"])
    bpy.ops.render.render(write_still=True)
    info.append(dict(name=w["name"], length=round(length, 2), source=w["source"]))
    print("W %-20s %.2f m" % (w["name"], length))
json.dump(info, open(os.path.join(OUT, "lengths.json"), "w"), indent=1)
