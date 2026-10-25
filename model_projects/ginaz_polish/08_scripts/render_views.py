"""Render standard views of whatever is in the opened blend.

    blender -b <blend> --python render_views.py -- <out_dir> <tag> [--no-sword-cam]
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG = os.path.abspath(args[0]), args[1]
os.makedirs(OUT, exist_ok=True)


def gamelike(mat):
    """PREVIEW ONLY (never saved): wire MetallicGlossAO the way the game reads it: R metallic, G gloss (roughness = 1 - G), B ambient occlusion."""
    nt = mat.node_tree
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        return
    link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Specular IOR Level" and l.from_node.type == "TEX_IMAGE"), None)
    if link is None:
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
    nt.links.new(inv.outputs["Value"], bsdf.inputs["Roughness"])
    bsdf.inputs["Specular IOR Level"].default_value = 0.5
    base_link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Base Color"), None)
    if base_link is not None:
        mix = nt.nodes.new("ShaderNodeMix")
        mix.data_type = "RGBA"
        mix.blend_type = "MULTIPLY"
        mix.inputs["Factor"].default_value = 1.0
        nt.links.new(base_link.from_socket, mix.inputs["A"])
        nt.links.new(sep.outputs["Blue"], mix.inputs["B"])
        nt.links.new(mix.outputs["Result"], bsdf.inputs["Base Color"])


if "--gamelike" in args:
    for m in bpy.data.materials:
        if m.use_nodes and m.name != "Mat_GinazGold":
            gamelike(m)
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
objs = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
lo = Vector((9, 9, 9))
hi = Vector((-9, -9, -9))
for o in objs:
    a, b = bs.model_bounds(o)
    lo = Vector((min(lo.x, a.x), min(lo.y, a.y), min(lo.z, a.z)))
    hi = Vector((max(hi.x, b.x), max(hi.y, b.y), max(hi.z, b.z)))
centre = (lo + hi) / 2
scale = (hi.z - lo.z) * 1.08
for name, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0.05)), ("back", (0, 1, 0)), ("side", (1, 0, 0))):
    bs.setup_render(600, 840)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
    bs.render_to(os.path.join(OUT, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
for name, tgt, sc_, d in (("closeup", (0, 0, 1.62), 0.85, (0.45, -0.88, 0.1)), ("chest", (0, 0, 1.38), 0.7, (0, -1, 0.1)),
                          ("hem", (0, 0, 0.75), 1.0, (0.3, -0.95, 0.05)), ("capeback", (0, 0, 1.1), 1.2, (0.2, 1, 0.1))):
    bs.setup_render(800, 800)
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc_, direction=d, distance=4)
    bs.render_to(os.path.join(OUT, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("RENDERED")
