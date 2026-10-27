"""Flat colour per object (emission, back-face culling ON) from several sides, to see which part owns which surface and where there is no surface.

    blender -b <file.blend> --python obj_colours.py -- <out_dir> <tag> [tz] [ortho_scale] [px] [--only name,name]

Prints the colour legend.  Background is white, so any white inside the figure is a hole.
"""
import colorsys
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out, tag = os.path.abspath(a[0]), a[1]
nums = [x for x in a[2:] if not x.startswith("--")]
only = a[a.index("--only") + 1].split(",") if "--only" in a else None
if only:
    nums = [x for x in nums if x not in (",".join(only),)]
tz = float(nums[0]) if len(nums) > 0 else 1.45
sc_ = float(nums[1]) if len(nums) > 1 else 1.0
px = int(nums[2]) if len(nums) > 2 else 700
os.makedirs(out, exist_ok=True)
meshes = sorted([o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render], key=lambda o: o.name)
for i, o in enumerate(meshes):
    if only and not any(k in o.name for k in only):
        o.hide_render = True
        continue
    h = (i * 0.618) % 1.0
    col = colorsys.hsv_to_rgb(h, 0.75, 0.95)
    m = bpy.data.materials.new("flat_" + o.name)
    m.use_nodes = True
    nt = m.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    em = nt.nodes.new("ShaderNodeEmission")
    em.inputs["Color"].default_value = (*col, 1)
    # a little shading so the form reads: mix emission with a diffuse
    df = nt.nodes.new("ShaderNodeBsdfDiffuse")
    df.inputs["Color"].default_value = (*col, 1)
    mx = nt.nodes.new("ShaderNodeAddShader")
    em.inputs["Strength"].default_value = 0.35
    ou = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(em.outputs[0], mx.inputs[0])
    nt.links.new(df.outputs[0], mx.inputs[1])
    nt.links.new(mx.outputs[0], ou.inputs[0])
    m.use_backface_culling = True
    o.data.materials.clear()
    o.data.materials.append(m)
    for p in o.data.polygons:
        p.material_index = 0
    print("LEGEND %-22s rgb(%d,%d,%d)" % (o.name, col[0] * 255, col[1] * 255, col[2] * 255))
w = bpy.context.scene.world or bpy.data.worlds.new("W")
bpy.context.scene.world = w
w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (1, 1, 1, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 1.0
bpy.context.scene.view_settings.view_transform = "Standard"
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
VIEWS = {"front": (0, -1, 0.05), "back": (0, 1, 0.1), "side": (1, 0, 0.05), "tq": (0.7, -0.7, 0.35), "btq": (-0.6, 0.7, 0.4),
         "top": (0.15, -0.35, 1.0)}
for vn, d in VIEWS.items():
    bs.setup_render(px, px)
    cam = bs.setup_camera(target=Vector((0, 0.02, tz)), ortho_scale=sc_, direction=d, distance=6)
    bs.render_to(os.path.join(out, "%s_%s.png" % (tag, vn)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
