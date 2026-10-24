"""Step 04 - render each connected component ISOLATED, from behind, with its
index, so the backpack can be identified unambiguously.

  blender -b --python 08_scripts/04_isolate_components.py

Writes one PNG per component to 02_progress_photos/03_isolated/ and a contact
sheet (grid of all of them) to 02_progress_photos/03_isolated/contact_sheet.png
"""
import math
import os

import bpy
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
OUT = os.path.join(PROJ, "02_progress_photos", "03_isolated")
os.makedirs(OUT, exist_ok=True)

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

# world position of every vertex, for the spatial report
wp = np.array([(mesh.matrix_world @ v.co)[:] for v in me.vertices])

print("COMPONENTS %d" % len(order))
print("%-5s %6s %6s   %-18s %-18s %-18s" % ("id", "verts", "tris", "x range", "y range", "z range"))
comps = []
for i, root in enumerate(order):
    vs = roots[root]
    p = wp[vs]
    tris = sum(1 for poly in me.polygons if find(poly.vertices[0]) == root)
    comps.append({"id": i, "verts": vs, "tris": tris,
                  "lo": p.min(axis=0), "hi": p.max(axis=0)})
    if i < 26:
        print("%-5d %6d %6d   %6.2f..%6.2f  %6.2f..%6.2f  %6.2f..%6.2f"
              % (i, len(vs), tris, p[:, 0].min(), p[:, 0].max(),
                 p[:, 1].min(), p[:, 1].max(), p[:, 2].min(), p[:, 2].max()))

# ---- which components are BEHIND the body and in the upper back? ------
# (the body itself spans roughly y -0.26..0.20 around the torso)
print("\nCANDIDATES (behind the torso, z 1.05..1.75):")
for c in comps:
    if c["hi"][1] > 0.26 and c["lo"][2] < 1.75 and c["hi"][2] > 1.05:
        print("  comp %2d  %4d verts  %4d tris  y %6.2f..%6.2f  z %6.2f..%6.2f  x %6.2f..%6.2f"
              % (c["id"], len(c["verts"]), c["tris"],
                 c["lo"][1], c["hi"][1], c["lo"][2], c["hi"][2], c["lo"][0], c["hi"][0]))

# ---- render each candidate in isolation, from behind ------------------
world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.7, 0.72, 0.75, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.5

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.0
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
scene.render.resolution_x = 400
scene.render.resolution_y = 500
scene.render.resolution_percentage = 100
scene.view_settings.view_transform = "Standard"

candidates = [c for c in comps
               if c["hi"][1] > 0.26 and c["lo"][2] < 1.75 and c["hi"][2] > 1.05]

for c in candidates:
    keep = set(c["verts"])
    bm_faces = [p for p in me.polygons if p.vertices[0] in keep or all(v in keep for v in p.vertices)]
    # simpler: keep faces whose FIRST vertex is in the component
    bm_faces = [p for p in me.polygons if p.vertices[0] in keep]
    tmp = me.copy()
    bm = __import__("bmesh").new()
    bm.from_mesh(tmp)
    for f in list(bm.faces):
        if f.verts[0].index not in keep:
            bm.faces.remove(f)
    bm.to_mesh(tmp)
    bm.free()
    tmp.update()

    obj = bpy.data.objects.new("Iso_%02d" % c["id"], tmp)
    bpy.context.collection.objects.link(obj)

    co = wp[c["verts"]]
    centre = Vector(((co[:, 0].min() + co[:, 0].max()) / 2,
                     (co[:, 1].min() + co[:, 1].max()) / 2,
                     (co[:, 2].min() + co[:, 2].max()) / 2))
    h = max(co[:, 2].max() - co[:, 2].min(), 0.12)
    w = max(co[:, 0].max() - co[:, 0].min(), co[:, 1].max() - co[:, 1].min(), 0.12)
    cam_data.ortho_scale = max(h, w) * 1.35
    cam.location = centre + Vector((0.0, 1.2, 0.0)) * max(h, w) * 2.0
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(OUT, "comp_%02d.png" % c["id"])
    bpy.ops.render.render(write_still=True)
    print("ISOLATED comp %02d -> %s" % (c["id"], scene.render.filepath))

    bpy.data.objects.remove(obj, do_unlink=True)
    bpy.data.meshes.remove(tmp)
