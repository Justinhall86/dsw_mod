"""Remap every part's UVs into the atlas, merge into ONE mesh with ONE material, save and render.

    blender -b 03_blender/frigate_v10_layers.blend --python 42_apply_atlas.py -- <out.blend> <render_dir> [--turntable N]

Needs 04_textures/Thorvald_Frigate_{Albedo,MetallicGlossAO,Normal}.png from 41_make_atlas.py.
The saved blend uses the toolkit wiring (Albedo->Base Color, MGAO->Specular IOR Level, Normal->Normal Map);
the game-like preview wiring is applied only AFTER saving, for the renders.
"""
import importlib
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
OUT_BLEND, OUT_DIR = os.path.abspath(argv[0]), os.path.abspath(argv[1])
TURN = int(argv[argv.index("--turntable") + 1]) if "--turntable" in argv else 0
os.makedirs(OUT_DIR, exist_ok=True)
TEX = os.path.join(PROJ, "04_textures")
CELLS = {0: (0, 0), 1: (1, 0), 2: (0, 1), 3: (1, 1)}     # (col, row from the top)


def cell_of(name):
    if name.startswith("p0_wraith"):
        return 1
    if "_wraith" in name and name.startswith("g"):
        return 2
    if "spaceshuttle" in name:
        return 3
    return 0


stack_pts = []
for o in bpy.data.objects:
    if o.type == "MESH" and "spaceshuttle" in o.name:
        stack_pts += [o.matrix_world @ v.co for v in o.data.vertices]
meshes = sorted((o for o in bpy.data.objects if o.type == "MESH"), key=lambda o: o.name)

# ---- 1. remap UVs (tiled u > 1 polygons wrap back into 0..1 first)
for o in meshes:
    col, row = CELLS[cell_of(o.name)]
    me = o.data
    layer = me.uv_layers.active.data
    for poly in me.polygons:
        loops = list(poly.loop_indices)
        du = math.floor(min(layer[l].uv[0] for l in loops) + 1e-4)
        dv = math.floor(min(layer[l].uv[1] for l in loops) + 1e-4)
        for l in loops:
            u, v = layer[l].uv[0] - du, layer[l].uv[1] - dv
            layer[l].uv = ((col + u) / 2.0, 1.0 - (row + 1) / 2.0 + v / 2.0)
    me.update()

# ---- 2. one material with the atlas textures
mat = bpy.data.materials.new("Mat_Thorvald_Frigate")
mat.use_nodes = True
nt = mat.node_tree
for n in list(nt.nodes):
    nt.nodes.remove(n)
out = nt.nodes.new("ShaderNodeOutputMaterial")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])


def tex(fname, cs, y):
    n = nt.nodes.new("ShaderNodeTexImage")
    n.location = (-500, y)
    img = bpy.data.images.load(os.path.join(TEX, fname), check_existing=False)
    img.colorspace_settings.name = cs
    img.pack()
    n.image = img
    return n


alb = tex("Thorvald_Frigate_Albedo.png", "sRGB", 250)
mg = tex("Thorvald_Frigate_MetallicGlossAO.png", "Non-Color", -50)
nm = tex("Thorvald_Frigate_Normal.png", "Non-Color", -350)
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
nmap = nt.nodes.new("ShaderNodeNormalMap")
nmap.location = (-200, -350)
nt.links.new(nm.outputs["Color"], nmap.inputs["Color"])
nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])

# ---- 3. join into one object
for o in meshes:
    o.data.materials.clear()
    o.data.materials.append(mat)
bpy.ops.object.select_all(action="DESELECT")
for o in meshes:
    o.select_set(True)
bpy.context.view_layer.objects.active = meshes[0]
bpy.ops.object.join()
ship = bpy.context.view_layer.objects.active
ship.name = "Thorvald_Frigate"
ship.data.name = "Thorvald_Frigate"
ship.data.calc_loop_triangles()
print("JOINED verts=%d tris=%d materials=%d" % (len(ship.data.vertices), len(ship.data.loop_triangles),
                                              len(ship.data.materials)))
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)

# ---- 4. preview renders (game-like MGAO wiring; NOT saved)
pw.soften_world()
pw.ROUGH_FLOOR = 0.32          # polished metal: the usual 0.62 floor makes everything look matte
pw.gamelike(mat)
for o in list(bpy.data.objects):
    if o.type == "CAMERA":
        bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(900, 900)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
mn = Vector((1e9,) * 3)
mx = Vector((-1e9,) * 3)
for v in ship.data.vertices:
    for i in range(3):
        mn[i], mx[i] = min(mn[i], v.co[i]), max(mx[i], v.co[i])
ctr, size = (mn + mx) / 2, max(mx - mn)
cam = bs.setup_camera(target=ctr, ortho_scale=size * 1.24, distance=size * 2.6)
views = {"tq": (0.78, -0.78, 0.34), "top": (-0.001, 0.0, 1.0), "side": (0.0, -1.0, 0.06),
         "tq_rear": (-0.78, -0.78, 0.34), "front": (1.0, 0.0, 0.08), "rear": (-1.0, 0.0, 0.12)}
for name, d in views.items():
    cam.location = ctr + Vector(d).normalized() * size * 2.6
    cam.rotation_euler = (ctr - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(OUT_DIR, "tex_%s.png" % name), cam)

if stack_pts:
    sc = sum(stack_pts, Vector((0, 0, 0))) / len(stack_pts)
    cam.data.ortho_scale = size * 0.42
    for name, d in {"stack_tq": (0.78, -0.78, 0.40), "stack_side": (0.0, -1.0, 0.10),
                    "stack_tq2": (-0.7, 0.7, 0.40)}.items():
        cam.location = sc + Vector(d).normalized() * size * 2.6
        cam.rotation_euler = (sc - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(os.path.join(OUT_DIR, "tex_%s.png" % name), cam)
    cam.data.ortho_scale = size * 1.24

if TURN:
    tdir = os.path.join(OUT_DIR, "turn")
    os.makedirs(tdir, exist_ok=True)
    bs.setup_render(720, 720)
    cam.data.type = "PERSP"
    cam.data.lens = 60
    cam.data.clip_end = 500
    dist = size * 2.45
    el = math.radians(19.0)
    for i in range(TURN):
        az = math.radians(-25.0 + 360.0 * i / TURN)
        d = Vector((math.sin(az) * math.cos(el), -math.cos(az) * math.cos(el), math.sin(el)))
        cam.location = ctr + d * dist
        cam.rotation_euler = (ctr - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(os.path.join(tdir, "f%03d.png" % i), cam)
print("RENDER_DONE")
