"""Step 03 - render the Commando from behind with a chosen set of connected
components hidden, so the backpack can be isolated by eye.

  blender -b --python 08_scripts/03_hide_test.py -- <tag> [comp indices...]

Example:
  blender -b --python 08_scripts/03_hide_test.py -- test04 4 5 6 7

Component indices are the ones printed by 02_component_colour.py (ordered by
size, largest first).  Renders go to 02_progress_photos/02_hide_test/.
"""
import math
import os
import sys

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "02_hide_test")
os.makedirs(OUT, exist_ok=True)

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
tag = argv[0] if argv else "test"
hide = set(int(a) for a in argv[1:]) if len(argv) > 1 else set()

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC)
mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

me = mesh.data

# ---- connected components --------------------------------------------
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
comp_of_vert = {}
for i, root in enumerate(order):
    for v in roots[root]:
        comp_of_vert[v] = i

# ---- hide the requested components ------------------------------------
hidden_verts = set()
for c in hide:
    for v in roots[order[c]]:
        hidden_verts.add(v)

# delete the faces (and their orphan verts) of the hidden components
import bmesh

bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
bm.faces.ensure_lookup_table()
removed = 0
for f in list(bm.faces):
    if any(v.index in hidden_verts for v in f.verts):
        bm.faces.remove(f)
        removed += 1
bm.to_mesh(me)
bm.free()
print("HIDDEN comps %s -> removed %d faces" % (sorted(hide), removed))

# ---- render ----------------------------------------------------------
bpy.context.view_layer.update()
bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z

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
cam_data.ortho_scale = height * 1.12
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE"
scene.render.resolution_x = 900
scene.render.resolution_y = 1200
scene.render.resolution_percentage = 100
scene.view_settings.view_transform = "Standard"

radius = max(height, hi.x - lo.x, hi.y - lo.y) * 2.5
for name, direction in {
    "back": Vector((0.0, 1.0, 0.0)),
    "three_quarter": Vector((0.7, 0.7, 0.0)),
    "side": Vector((1.0, 0.0, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUT, f"commando_{tag}_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", scene.render.filepath)
