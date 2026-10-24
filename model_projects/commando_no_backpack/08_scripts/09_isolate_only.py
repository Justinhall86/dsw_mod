"""Step 09 - render ONE connected component at a time, with everything else
hidden, so each piece can be identified unambiguously.

(Step 04's "isolated" renders were misleading: the original mesh stayed in the
scene, so each shot still showed the whole model.  Here the other components
are actually removed.)

  blender -b --python 08_scripts/09_isolate_only.py -- <comp> [<comp> ...]
"""
import math
import os
import sys

import bpy
import bmesh
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "03_isolated")
os.makedirs(OUT, exist_ok=True)

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
targets = [int(a) for a in argv] or [4, 5, 6, 7, 41, 42, 43, 44]

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

me = mesh.data
parent = list(range(len(me.vertices)))


def find(a):
    while parent[a] != a:
        parent[a] = parent[parent[a]]
        a = parent[a]
    return a


def union(a, b):
    ra, rb = find(a), find(b)
    if ra != rb:
        parent[rb] = ra


for poly in me.polygons:
    vs = list(poly.vertices)
    for i in range(1, len(vs)):
        union(vs[0], vs[i])
roots = {}
for v in range(len(me.vertices)):
    roots.setdefault(find(v), []).append(v)
order = sorted(roots, key=lambda r: -len(roots[r]))
comp_of = {}
for i, root in enumerate(order):
    for v in roots[root]:
        comp_of[v] = i

wp = np.array([(mesh.matrix_world @ v.co)[:] for v in me.vertices])

# ---- world / light / camera -------------------------------------------
world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.72, 0.74, 0.78, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.5
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 3.0
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 420
sc.render.resolution_y = 520
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

all_comp = set(comp_of.values())

for t in targets:
    keep = set(roots[order[t]])
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.verts.ensure_lookup_table()
    for f in list(bm.faces):
        if f.verts[0].index not in keep:
            bm.faces.remove(f)
    bm.to_mesh(me)
    bm.free()
    me.update()

    co = wp[sorted(keep)]
    centre = Vector(((co[:, 0].min() + co[:, 0].max()) / 2,
                     (co[:, 1].min() + co[:, 1].max()) / 2,
                     (co[:, 2].min() + co[:, 2].max()) / 2))
    h = max(co[:, 2].max() - co[:, 2].min(), 0.10)
    w = max(co[:, 0].max() - co[:, 0].min(), co[:, 1].max() - co[:, 1].min(), 0.10)
    cd.ortho_scale = max(h, w) * 1.4
    cam.location = centre + Vector((0.0, 1.0, 0.0)) * max(h, w) * 2.5
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, "only_comp_%02d.png" % t)
    bpy.ops.render.render(write_still=True)
    print("ONLY comp %02d -> %s  (%d verts, y %.2f..%.2f, z %.2f..%.2f)"
          % (t, sc.render.filepath, len(keep),
             co[:, 1].min(), co[:, 1].max(), co[:, 2].min(), co[:, 2].max()))

    # restore
    bpy.ops.wm.read_homefile(use_empty=False)
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=SRC)
    mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
    for name in ("Cube", "Camera", "Light"):
        ob = bpy.data.objects.get(name)
        if ob:
            bpy.data.objects.remove(ob, do_unlink=True)
    me = mesh.data
    parent = list(range(len(me.vertices)))

    def find(a):
        while parent[a] != a:
            parent[a] = parent[parent[a]]
            a = parent[a]
        return a

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[rb] = ra

    for poly in me.polygons:
        vs = list(poly.vertices)
        for i in range(1, len(vs)):
            union(vs[0], vs[i])
    roots = {}
    for v in range(len(me.vertices)):
        roots.setdefault(find(v), []).append(v)
    order = sorted(roots, key=lambda r: -len(roots[r]))
    comp_of = {}
    for i, root in enumerate(order):
        for v in roots[root]:
            comp_of[v] = i
    wp = np.array([(mesh.matrix_world @ v.co)[:] for v in me.vertices])

    # rebuild the scene bits that read_factory_settings removed
    world = bpy.data.worlds.new("W")
    bpy.context.scene.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.72, 0.74, 0.78, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 2.5
    sd = bpy.data.lights.new("Sun", type="SUN")
    sd.energy = 3.0
    sun = bpy.data.objects.new("Sun", sd)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
    cd = bpy.data.cameras.new("Cam")
    cd.type = "ORTHO"
    cam = bpy.data.objects.new("Cam", cd)
    bpy.context.collection.objects.link(cam)
    bpy.context.scene.camera = cam
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = 420
    sc.render.resolution_y = 520
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"
