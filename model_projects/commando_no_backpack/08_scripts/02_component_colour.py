"""Step 02 - colour every connected component of the Commando differently and
render it, so the backpack can be identified by eye.

  blender -b --python 08_scripts/02_component_colour.py

Writes 02_progress_photos/01_components/commando_components_<view>.png
"""
import math
import os

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "01_components")
os.makedirs(OUT, exist_ok=True)

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

# order by size so the numbering is stable
order = sorted(roots, key=lambda r: -len(roots[r]))

# ---- give each component its own material + colour --------------------
HUES = [(1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 0), (1, 0, 1), (0, 1, 1),
        (1, 0.5, 0), (0.5, 1, 0), (0, 0.5, 1), (1, 0, 0.5), (0.5, 0, 1), (0, 1, 0.5),
        (1, 1, 1), (0.6, 0.3, 0), (0.3, 0.6, 0), (0, 0.3, 0.6), (0.6, 0, 0.3),
        (0.3, 0, 0.6), (1, 0.9, 0.4), (0.4, 1, 0.9), (0.9, 0.4, 1), (0.2, 0.9, 0.9),
        (0.9, 0.2, 0.9), (0.9, 0.9, 0.2), (0.2, 0.2, 0.9), (0.9, 0.9, 0.9)]

me.materials.clear()
comp_mats = []
for i, root in enumerate(order):
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
    comp_mats.append(mat)
    me.materials.append(mat)          # <- must be appended, or material_index is invalid

# assign per polygon
comp_of_vert = {}
for i, root in enumerate(order):
    for v in roots[root]:
        comp_of_vert[v] = i
for poly in me.polygons:
    poly.material_index = comp_of_vert[poly.vertices[0]]

print("COMPONENTS %d" % len(order))
for i, root in enumerate(order[:20]):
    vs = roots[root]
    co = [mesh.matrix_world @ me.vertices[v].co for v in vs]
    lo = Vector((min(c.x for c in co), min(c.y for c in co), min(c.z for c in co)))
    hi = Vector((max(c.x for c in co), max(c.y for c in co), max(c.z for c in co)))
    print("  comp %02d: %4d verts  x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (i, len(vs), lo.x, hi.x, lo.y, hi.y, lo.z, hi.z))

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
world.node_tree.nodes["Background"].inputs[0].default_value = (0.75, 0.75, 0.75, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.5

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 2.5
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(60), 0.0, math.radians(30))

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
    "front": Vector((0.0, -1.0, 0.0)),
    "three_quarter": Vector((0.7, 0.7, 0.0)),
}.items():
    d = direction.normalized()
    cam.location = centre + d * radius
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUT, f"commando_components_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("RENDERED", scene.render.filepath)
