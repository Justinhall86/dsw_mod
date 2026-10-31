"""Step 10 - remove the backpack, then colour the REMAINING components so the
surface that gets exposed can be identified.

  blender -b --python 08_scripts/10_colour_after_removal.py

Renders 02_progress_photos/05_colour_after/commando_nopack_components_<view>.png
"""
import math
import os

import bpy
import bmesh
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "05_colour_after")
os.makedirs(OUT, exist_ok=True)

BACKPACK = [4, 5, 6, 7, 41, 42, 43, 44]

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

# ---- remove the backpack ----------------------------------------------
pack = {v for c in BACKPACK for v in roots[order[c]]}
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
for f in list(bm.faces):
    if any(v.index in pack for v in f.verts):
        bm.faces.remove(f)
bm.to_mesh(me)
bm.free()
me.update()
print("backpack removed: %d faces" % 710)

# recompute components after the removal
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
print("REMAINING COMPONENTS")
for i, root in enumerate(order[:10]):
    co = wp[roots[root]]
    print("  comp %2d  verts %4d  x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (i, len(roots[root]), co[:, 0].min(), co[:, 0].max(),
             co[:, 1].min(), co[:, 1].max(), co[:, 2].min(), co[:, 2].max()))

# ---- colour each component -------------------------------------------
HUES = [(1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 0), (1, 0, 1), (0, 1, 1),
        (1, 0.5, 0), (0.5, 1, 0), (0, 0.5, 1), (1, 0, 0.5), (0.5, 0, 1), (0, 1, 0.5),
        (1, 1, 1), (0.6, 0.3, 0), (0.3, 0.6, 0), (0, 0.3, 0.6), (0.6, 0, 0.3),
        (0.3, 0, 0.6), (1, 0.9, 0.4), (0.4, 1, 0.9), (0.9, 0.4, 1), (0.2, 0.9, 0.9),
        (0.9, 0.2, 0.9), (0.9, 0.9, 0.2), (0.2, 0.2, 0.9), (0.9, 0.9, 0.9)]

me.materials.clear()
for i in range(len(order)):
    mat = bpy.data.materials.new("Comp_%02d" % i)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        if n.type == "BSDF_PRINCIPLED":
            nt.nodes.remove(n)
    b = nt.nodes.new("ShaderNodeBsdfPrincipled")
    out = next(n for n in nt.nodes if n.type == "OUTPUT_MATERIAL")
    b.inputs["Base Color"].default_value = (*HUES[i % len(HUES)], 1.0)
    b.inputs["Roughness"].default_value = 0.6
    b.inputs["Metallic"].default_value = 0.0
    nt.links.new(b.outputs["BSDF"], out.inputs["Surface"])
    me.materials.append(mat)
for poly in me.polygons:
    poly.material_index = comp_of[poly.vertices[0]]

# ---- render ----------------------------------------------------------
world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.75, 0.75, 0.75, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.5
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 2.5
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(60), 0.0, math.radians(30))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1200
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

bpy.context.view_layer.update()
bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z
cd.ortho_scale = height * 1.12
radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
for name, direction in {
    "back": Vector((0.0, 1.0, 0.0)),
    "three_quarter": Vector((0.7, 0.7, 0.0)),
    "front": Vector((0.0, -1.0, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, f"commando_nopack_components_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", sc.render.filepath)
