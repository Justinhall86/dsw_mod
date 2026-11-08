"""Render an OBJ (Z-up, game coords) with one albedo: tq, tq_rear, top, side, front, below.

    blender -b --factory-startup --python 62_render_obj.py -- <obj> <albedo png> <outdir> [skip_substr,...]
"""
import importlib, os, sys
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw
argv = sys.argv[sys.argv.index("--") + 1:]
obj, albedo, outdir = argv[0], argv[1], os.path.abspath(argv[2])
skip = argv[3].split(",") if len(argv) > 3 and argv[3] else []
os.makedirs(outdir, exist_ok=True)

bs.reset_scene()
bpy.ops.wm.obj_import(filepath=obj, forward_axis="Y", up_axis="Z")
m = bpy.data.materials.new("alb"); m.use_nodes = True
bsdf = m.node_tree.nodes.get("Principled BSDF"); bsdf.inputs["Roughness"].default_value = 0.6
n = m.node_tree.nodes.new("ShaderNodeTexImage"); n.image = bpy.data.images.load(albedo)
m.node_tree.links.new(n.outputs["Color"], bsdf.inputs["Base Color"])
objs = []
for o in list(bpy.context.scene.objects):
    if o.type != "MESH":
        continue
    if any(s in o.name for s in skip):
        bpy.data.objects.remove(o); continue
    o.data.materials.clear(); o.data.materials.append(m); objs.append(o)
    print("OBJ", o.name, len(o.data.polygons))
mn, mx = B.bounds(objs); c = (mn + mx) / 2; span = max(mx - mn)
print("DIMS", tuple(round(v, 1) for v in (mx - mn)))
pw.soften_world()
bs.setup_render(1200, 900)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=span * 1.1, distance=span * 3)
views = {"tq": (-0.7, -0.7, 0.45), "tq_rear": (0.7, 0.7, 0.45), "top": (-0.0001, 0, 1),
         "side": (0, -1, 0.05), "front": (-1, 0, 0.05), "below": (0.3, -0.5, -0.8)}
for name, dv in views.items():
    cam.location = c + Vector(dv).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name == "top" else "Y").to_euler()
    bs.render_to(os.path.join(outdir, "%s.png" % name), cam)
print("RENDER_OK")
