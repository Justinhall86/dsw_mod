"""Step 05 - remove the backpack components and test whether a HOLE is left in
the torso, then report how to close it.

The backpack is made of separate connected components (a rigid shell that sits
on the back), so removing it can leave the torso open.  This script:

  * deletes the backpack components
  * ray-casts from behind into the remaining mesh over the region the pack
    occupied; a ray that hits NOTHING means there is a hole
  * finds the boundary loop of the torso if there is one
  * renders front / back / three-quarter for review

  blender -b --python 08_scripts/05_closure_test.py
"""
import math
import os
import sys

import bpy
import bmesh
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "04_no_backpack")
os.makedirs(OUT, exist_ok=True)

# the backpack: pack body (left/right), shoulder straps (left/right) and the
# small buckle hardware at the bottom of the straps
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

before_verts = len(me.vertices)
before_tris = len(me.polygons)

pack_verts = set()
for c in BACKPACK:
    for v in roots[order[c]]:
        pack_verts.add(v)

bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
bm.faces.ensure_lookup_table()
removed_faces = 0
for f in list(bm.faces):
    if any(v.index in pack_verts for v in f.verts):
        bm.faces.remove(f)
        removed_faces += 1
bm.to_mesh(me)
bm.free()
me.update()

after_verts = len(me.vertices)
after_tris = len(me.polygons)
print("REMOVED pack comps %s" % BACKPACK)
print("  verts %d -> %d   tris %d -> %d  (%d faces removed)"
      % (before_verts, after_verts, before_tris, after_tris, removed_faces))

# ---- boundary (hole) detection ---------------------------------------
bm = bmesh.new()
bm.from_mesh(me)
boundary = [e for e in bm.edges if len(e.link_faces) == 1]
print("BOUNDARY edges (open hole): %d" % len(boundary))
if boundary:
    bverts = sorted({v.index for e in boundary for v in e.verts})
    co = np.array([(mesh.matrix_world @ me.vertices[i].co)[:] for i in bverts])
    print("  hole verts %d  x %.2f..%.2f  y %.2f..%.2f  z %.2f..%.2f"
          % (len(bverts), co[:, 0].min(), co[:, 0].max(),
             co[:, 1].min(), co[:, 1].max(), co[:, 2].min(), co[:, 2].max()))
bm.free()

# ---- ray test: is the upper back open? --------------------------------
from mathutils.bvhtree import BVHTree

bvh = BVHTree.FromPolygons(
    [mesh.matrix_world @ v.co for v in me.vertices],
    [list(p.vertices) for p in me.polygons],
    all_triangles=False)

hits = 0
misses = 0
miss_pts = []
for xi in np.linspace(-0.18, 0.18, 9):
    for zi in np.linspace(1.15, 1.55, 9):
        origin = Vector((float(xi), 1.2, float(zi)))
        direction = Vector((0.0, -1.0, 0.0))
        loc, nor, idx, dist = bvh.ray_cast(origin, direction, 3.0)
        if loc is None:
            misses += 1
            miss_pts.append((float(xi), float(zi)))
        else:
            hits += 1
print("RAY TEST from behind over the pack area: %d hits, %d MISSES (miss = hole)"
      % (hits, misses))
if miss_pts:
    xs = [p[0] for p in miss_pts]
    zs = [p[1] for p in miss_pts]
    print("  hole region x %.2f..%.2f  z %.2f..%.2f" % (min(xs), max(xs), min(zs), max(zs)))

# ---- render ----------------------------------------------------------
world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.62, 0.64, 0.68, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.2

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.2
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

cam_data = bpy.data.cameras.new("Cam")
cam_data.type = "ORTHO"
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE"
scene.render.resolution_x = 900
scene.render.resolution_y = 1200
scene.render.resolution_percentage = 100
scene.view_settings.view_transform = "Standard"

bpy.context.view_layer.update()
bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z
cam_data.ortho_scale = height * 1.12

radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
for name, direction in {
    "back": Vector((0.0, 1.0, 0.0)),
    "front": Vector((0.0, -1.0, 0.0)),
    "three_quarter": Vector((0.7, 0.7, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUT, f"commando_no_backpack_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", scene.render.filepath)
