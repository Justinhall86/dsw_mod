"""Build the House Thorvald tower shield from Gurney's shield and save it as a stand-alone weapon blend.

    blender -b --python make_shield.py -- [--sx 0.74] [--sz 1.14] [--shots]

Source: source/GurneySet_Shield_TRUE_FBX.fbx (Gurney's shield, converted from the game HMD).  Weapon space = the shield's own local space:
x across, z up, the decorated FRONT faces -y (raised Y-chevron and pyramid boss at y < -0.093, flat face plate at y -0.09, bevelled frame
around it), the back plate at y ~0.

  - the energy glow (every face on Mat_GurneyWeaponSet_Emiss: the flat additive halo round the rim) is deleted: no energy at all;
  - the raised chevron and boss (islands reaching in front of y -0.093) are deleted, leaving the flat face plate inside the frame;
  - the rest is stretched into a tower shield: x * --sx, z * --sz (Gurney's 0.76 x 1.05 m metal -> 0.56 x 1.20 m);
  - new UVs, planar: front-facing faces on the left half of the texture, back-facing on the right half, (u, v) from (x, z);
  - writes shield_uv.json (each face's UV polygon + whether it is the face plate) for paint_shield.py; textures/Shield_Albedo.png is
    used when it exists.

Output: Thorvald_TowerShield.blend with one object "Thorvald_TowerShield" at the origin (weapon space).
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
SX = float(a[a.index("--sx") + 1]) if "--sx" in a else 0.74
SZ = float(a[a.index("--sz") + 1]) if "--sz" in a else 1.14
HALF_W, HALF_H = 0.31, 0.64          # UV frame: x in [-HALF_W, HALF_W], z in [-HALF_H, HALF_H] after scaling

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(HERE, "source", "GurneySet_Shield_TRUE_FBX.fbx"))
sh = max([o for o in bpy.data.objects if o.type == "MESH" and o.name.split(".")[0] != "Cube"], key=lambda o: len(o.data.vertices))
for o in list(bpy.data.objects):
    if o is not sh:
        bpy.data.objects.remove(o, do_unlink=True)
sh.name = sh.data.name = "Thorvald_TowerShield"
sh.parent = None
sh.data.transform(sh.matrix_world)
sh.matrix_world.identity()

bm = bmesh.new()
bm.from_mesh(sh.data)
emiss = [i for i, m in enumerate(sh.data.materials) if m and "Emiss" in m.name]
islands, seen = [], set()
for f0 in bm.faces:
    if f0 in seen:
        continue
    stack, comp = [f0], []
    seen.add(f0)
    while stack:
        f = stack.pop()
        comp.append(f)
        for e in f.edges:
            for g in e.link_faces:
                if g not in seen:
                    seen.add(g)
                    stack.append(g)
    islands.append(comp)
gone, plate = set(), set()
for comp in islands:
    ys = [v.co.y for f in comp for v in f.verts]
    if any(f.material_index in emiss for f in comp):
        gone.update(comp)                                  # energy halo
    elif min(ys) < -0.093:
        gone.update(comp)                                  # raised chevron / boss
    elif min(ys) > -0.0925 and max(ys) < -0.085 and len(comp) > 4:
        plate.update(comp)                                 # the flat face plate inside the frame
bmesh.ops.delete(bm, geom=list(gone), context="FACES")
print("SHIELD removed %d faces (energy halo + chevron/boss), plate faces %d, kept %d" % (len(gone), len(plate), len(bm.faces)))
for v in bm.verts:
    v.co.x *= SX
    v.co.z *= SZ
bm.normal_update()
for i in range(len(sh.data.materials)):
    pass
uvl = bm.loops.layers.uv.active
faces = []
for f in bm.faces:
    front = f.normal.y < 0.0
    for lp in f.loops:
        x, z = lp.vert.co.x, lp.vert.co.z
        u = 0.5 * (x + HALF_W) / (2 * HALF_W)
        lp[uvl].uv = (u if front else 1.0 - u, 0.5 + 0.5 * z / HALF_H)   # back half mirrored so both halves read as seen from outside
    f.material_index = 0
    faces.append(dict(uv=[tuple(lp[uvl].uv) for lp in f.loops], plate=f in plate, front=front))
bm.to_mesh(sh.data)
bm.free()
while len(sh.data.materials) > 1:
    sh.data.materials.pop()
lo = [min(v.co[i] for v in sh.data.vertices) for i in range(3)]
hi = [max(v.co[i] for v in sh.data.vertices) for i in range(3)]
print("SHIELD size %.3f x %.3f x %.3f m (x, y, z), %d verts, %d faces" % (hi[0] - lo[0], hi[1] - lo[1], hi[2] - lo[2], len(sh.data.vertices), len(faces)))
json.dump(dict(faces=faces, half_w=HALF_W, half_h=HALF_H), open(os.path.join(HERE, "shield_uv.json"), "w"))

alb = os.path.join(HERE, "textures", "Shield_Albedo.png")
mat = bpy.data.materials.new("Mat_TowerShield")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
if os.path.exists(alb):
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(alb, check_existing=False)
    tex.image.pack()
    nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bsdf.inputs["Metallic"].default_value = 0.35
bsdf.inputs["Roughness"].default_value = 0.55
sh.data.materials.clear()
sh.data.materials.append(mat)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "Thorvald_TowerShield.blend"), compress=True)
print("SAVED Thorvald_TowerShield.blend", "albedo" if os.path.exists(alb) else "(no albedo yet)")

if "--shots" in a:
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 1400, 1000
    w = bpy.data.worlds.new("W")
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.75, 0.75, 0.78, 1)
    sc.world = w
    sun = bpy.data.objects.new("S", bpy.data.lights.new("S", "SUN"))
    sun.data.energy = 3.0
    sun.rotation_euler = (math.radians(50), 0, math.radians(-30))
    sc.collection.objects.link(sun)
    # three copies side by side: front, three-quarter, back
    for k, rz in enumerate((0.0, 35.0, 180.0)):
        ob = sh if k == 0 else sh.copy()
        if k:
            sc.collection.objects.link(ob)
        ob.rotation_euler = (0, 0, math.radians(rz))
        ob.location = ((k - 1) * 0.8, 0, 0)
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = 2.5
    cam.location = (0, -4, 0)
    cam.rotation_euler = (math.radians(90), 0, 0)
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.filepath = os.path.join(HERE, "preview_thorvald_towershield.png")
    bpy.ops.render.render(write_still=True)
