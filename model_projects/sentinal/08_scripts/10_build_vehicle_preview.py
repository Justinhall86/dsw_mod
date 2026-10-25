"""Blender --background script: import a vehicle FBX, wire textures, render a
turntable image sequence, and save a .blend. Run as:
blender --background --python build_vehicle_preview.py -- config.json
"""
import json
import math
import os
import sys

import bpy

argv = sys.argv[sys.argv.index("--") + 1:]
cfg = json.load(open(argv[0]))

FBX = cfg["fbx"]
ALBEDO = cfg.get("albedo")
MGAO = cfg.get("mgao")
NORMAL = cfg.get("normal")
OUT_BLEND = cfg["out_blend"]
FRAMES_DIR = cfg["frames_dir"]
NAME = cfg["name"]
N_FRAMES = cfg.get("n_frames", 24)
RES = cfg.get("res", 480)

bpy.ops.wm.read_factory_settings(use_empty=True)

bpy.ops.import_scene.fbx(filepath=FBX)

meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
if not meshes:
    raise RuntimeError("no mesh imported from " + FBX)

# Parent everything under one empty for easy turntable rotation / bbox calc.
root = bpy.data.objects.new(NAME + "_root", None)
bpy.context.scene.collection.objects.link(root)
for m in meshes:
    if m.parent is None:
        m.parent = root

# ---- material ----
if ALBEDO:
    mat = bpy.data.materials.new("Mat_" + NAME)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(path, loc, non_color=False):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=False)
        img.pack()
        if non_color:
            img.colorspace_settings.name = "Non-Color"
        nd.image = img
        nd.location = loc
        return nd

    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    out.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

    alb = tex(ALBEDO, (-700, 300))
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])

    if MGAO and os.path.exists(MGAO):
        mga = tex(MGAO, (-700, 0), non_color=True)
        nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])

    if NORMAL and os.path.exists(NORMAL):
        nrm = tex(NORMAL, (-700, -300), non_color=True)
        nmap = nt.nodes.new("ShaderNodeNormalMap")
        nmap.location = (-400, -300)
        nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
        nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])

    for m in meshes:
        m.data.materials.clear()
        m.data.materials.append(mat)

# ---- framing ----
bpy.context.view_layer.update()
minc = [1e9, 1e9, 1e9]
maxc = [-1e9, -1e9, -1e9]
from mathutils import Vector
for m in meshes:
    for corner in m.bound_box:
        wc = m.matrix_world @ Vector(corner)
        for i in range(3):
            minc[i] = min(minc[i], wc[i])
            maxc[i] = max(maxc[i], wc[i])
center = [(minc[i] + maxc[i]) / 2 for i in range(3)]
size = max(maxc[i] - minc[i] for i in range(3))
size = max(size, 0.01)

root.location = (-center[0], -center[1], -center[2])

cam_data = bpy.data.cameras.new("Cam")
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.scene.collection.objects.link(cam)
dist = size * 2.2
cam.location = (dist, -dist, size * 0.9)
bpy.context.scene.camera = cam

empty = bpy.data.objects.new("CamTarget", None)
bpy.context.scene.collection.objects.link(empty)
empty.location = (0, 0, size * 0.15)
con = cam.constraints.new("TRACK_TO")
con.target = empty
con.track_axis = "TRACK_NEGATIVE_Z"
con.up_axis = "UP_Y"

sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
sun.data.energy = 3.0
bpy.context.scene.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0, math.radians(35))

fill = bpy.data.objects.new("Fill", bpy.data.lights.new("Fill", "SUN"))
fill.data.energy = 1.0
bpy.context.scene.collection.objects.link(fill)
fill.rotation_euler = (math.radians(70), 0, math.radians(-120))

world = bpy.data.worlds.new("World")
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.08, 0.09, 0.11, 1)
bpy.context.scene.world = world

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items.keys() else "BLENDER_EEVEE"
scene.render.resolution_x = RES
scene.render.resolution_y = RES
scene.render.image_settings.file_format = "PNG"

os.makedirs(FRAMES_DIR, exist_ok=True)
for i in range(N_FRAMES):
    angle = (i / N_FRAMES) * 2 * math.pi
    cam.location = (dist * math.cos(angle), dist * math.sin(angle), size * 0.9)
    scene.render.filepath = os.path.join(FRAMES_DIR, f"frame_{i:03d}.png")
    bpy.ops.render.render(write_still=True)

bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("DONE", OUT_BLEND)
