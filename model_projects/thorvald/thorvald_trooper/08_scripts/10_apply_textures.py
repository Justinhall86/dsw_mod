"""Swap a variant's albedo textures for recoloured ones, repack, save, render showcase + close-ups.

    blender -b <variant.blend> --python 10_apply_textures.py -- <texture_map.json> <out.blend> <shots_dir> <tag>
"""
import json
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
mapping = {os.path.normcase(os.path.abspath(k)): v for k, v in json.load(open(args[0])).items()}
out_blend, shots, tag = os.path.abspath(args[1]), os.path.abspath(args[2]), args[3]
os.makedirs(shots, exist_ok=True)

swapped = 0
for mat in bpy.data.materials:
    if not mat.use_nodes:
        continue
    for l in list(mat.node_tree.links):
        if l.to_socket.name == "Base Color" and l.from_node.type == "TEX_IMAGE" and l.from_node.image:
            src = os.path.normcase(os.path.abspath(bpy.path.abspath(l.from_node.image.filepath)))
            if src in mapping:
                img = bpy.data.images.load(mapping[src], check_existing=True)
                l.from_node.image = img
                swapped += 1
print("SWAPPED", swapped)


def game_like_mg(mat):
    """Preview MetallicGlossAO the way the game reads it (R metallic, G gloss, B AO) instead of the FBX import's
    'whole colour -> Specular IOR Level', which over-brightens textures with a high AO channel."""
    nt = mat.node_tree
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        return False
    link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Specular IOR Level"
                 and l.from_node.type == "TEX_IMAGE"), None)
    if link is None:
        return False
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
    # AO darkens the albedo
    base_link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Base Color"), None)
    if base_link is not None:
        mix = nt.nodes.new("ShaderNodeMix")
        mix.data_type = "RGBA"
        mix.blend_type = "MULTIPLY"
        mix.inputs["Factor"].default_value = 1.0
        nt.links.new(base_link.from_socket, mix.inputs["A"])
        nt.links.new(sep.outputs["Blue"], mix.inputs["B"])
        nt.links.new(mix.outputs["Result"], bsdf.inputs["Base Color"])
    return True


# NOT used: the channel layout differs per unit (the Mercenary's map turned the coat metallic grey) - keep the
# FBX import's wiring, which matches the vanilla renders.
# print("GAME-LIKE MG", sum(game_like_mg(m) for m in bpy.data.materials if m.use_nodes))
for img in list(bpy.data.images):
    if img.users == 0:
        bpy.data.images.remove(img)
bs.pack_all_images()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
lo = Vector((min(bs.model_bounds(o)[0].x for o in meshes), 0, min(bs.model_bounds(o)[0].z for o in meshes)))
hi = Vector((max(bs.model_bounds(o)[1].x for o in meshes), 0, max(bs.model_bounds(o)[1].z for o in meshes)))
centre = Vector((0, 0, (lo.z + hi.z) / 2))
scale = (hi.z - lo.z) * 1.08
for name, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0.05)), ("back", (0, 1, 0)), ("side", (1, 0, 0))):
    bs.setup_render(600, 840)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
    bs.render_to(os.path.join(shots, "%s_%s.png" % (tag, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
bs.setup_render(600, 600)
cam = bs.setup_camera(target=Vector((0, 0, 1.62)), ortho_scale=0.8, direction=(0.55, -0.83, 0.1), distance=4)
bs.render_to(os.path.join(shots, "%s_closeup.png" % tag), cam)
bpy.data.objects.remove(cam, do_unlink=True)
cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=(0.7, -0.7, 0.05), distance=scale * 2.5)
bs.setup_render(1000, 1300)
bpy.ops.wm.save_as_mainfile(filepath=out_blend, compress=True)
print("SAVED", out_blend)
