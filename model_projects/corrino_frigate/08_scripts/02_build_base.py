"""Build the base Chronos (Corrino frigate) blend: import, clean, wire, light, save.

    blender -b --factory-startup --python 02_build_base.py -- <real.fbx> <texdir> <out.blend>
"""
import bpy
import math
import os
import sys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:]
FBX = os.path.abspath(argv[0])
TEX = os.path.abspath(argv[1])
OUT = os.path.abspath(argv[2])

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)

JUNK = ("Cube", "Camera", "Light", "Lamp")
for o in list(bpy.data.objects):
    if o.name.split(".")[0] in JUNK:
        bpy.data.objects.remove(o, do_unlink=True)

KEEP = ("Albedo", "MetallicGlossAO", "Normal", "Emissive")
for img in bpy.data.images:
    if img.name.endswith(".png"):
        continue
print("IMAGES", [(i.name, i.filepath) for i in bpy.data.images])

for img in bpy.data.images:
    if not img.filepath:
        continue
    base = os.path.basename(img.filepath)
    p = os.path.join(TEX, base)
    if os.path.exists(p):
        img.filepath = p
        img.reload()

SPEC = 0.12
ROUGH_FLOOR = 0.62


def gamelike(mat):
    nt = mat.node_tree
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        return
    link = next((l for l in nt.links if l.to_node == bsdf
                 and l.to_socket.name == "Specular IOR Level"
                 and l.from_node.type == "TEX_IMAGE"), None)
    if link is None:
        print("NOWIRE", mat.name)
        return
    tex = link.from_node
    nt.links.remove(link)
    sep = nt.nodes.new("ShaderNodeSeparateColor")
    inv = nt.nodes.new("ShaderNodeMath")
    inv.operation = "SUBTRACT"
    inv.inputs[0].default_value = 1.0
    nt.links.new(tex.outputs["Color"], sep.inputs["Color"])
    nt.links.new(sep.outputs["Red"], bsdf.inputs["Metallic"])
    nt.links.new(sep.outputs["Green"], inv.inputs[1])
    inv.use_clamp = True
    flo = nt.nodes.new("ShaderNodeMath")
    flo.operation = "MAXIMUM"
    flo.inputs[1].default_value = ROUGH_FLOOR
    nt.links.new(inv.outputs["Value"], flo.inputs[0])
    nt.links.new(flo.outputs["Value"], bsdf.inputs["Roughness"])
    bsdf.inputs["Specular IOR Level"].default_value = SPEC
    base_link = next((l for l in nt.links if l.to_node == bsdf
                      and l.to_socket.name == "Base Color"), None)
    if base_link is not None:
        mix = nt.nodes.new("ShaderNodeMix")
        mix.data_type = "RGBA"
        mix.blend_type = "MULTIPLY"
        mix.inputs["Factor"].default_value = 1.0
        nt.links.new(base_link.from_socket, mix.inputs["A"])
        nt.links.new(sep.outputs["Blue"], mix.inputs["B"])
        nt.links.new(mix.outputs["Result"], bsdf.inputs["Base Color"])


for m in bpy.data.materials:
    if m.use_nodes:
        gamelike(m)

for img in bpy.data.images:
    if img.filepath:
        img.pack()

scene = bpy.context.scene
try:
    scene.render.engine = "BLENDER_EEVEE_NEXT"
except Exception:
    scene.render.engine = "BLENDER_EEVEE"
scene.view_settings.view_transform = "AgX"

world = bpy.data.worlds.new("PreviewWorld")
world.use_nodes = True
bg = world.node_tree.nodes["Background"]
bg.inputs[0].default_value = (0.08, 0.09, 0.11, 1.0)
bg.inputs[1].default_value = 1.0
scene.world = world


def add_sun(name, energy, rot, angle=0.05):
    d = bpy.data.lights.new(name, "SUN")
    d.energy = energy
    d.angle = angle
    o = bpy.data.objects.new(name, d)
    o.rotation_euler = rot
    scene.collection.objects.link(o)
    return o


add_sun("Sun", 3.0, (math.radians(52), 0.0, math.radians(38)))
add_sun("Fill", 1.0, (math.radians(66), 0.0, math.radians(215)))

for o in bpy.data.objects:
    if o.type == "MESH":
        o.select_set(True)
        bpy.context.view_layer.objects.active = o
        break

bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("SAVED", OUT)
