"""Ronin helm step 1: matte-grey renders of the Meshy helm with a 10 cm grid of section lines, to choose the cuts.
    blender -b --factory-startup --python r01_meshy_grey.py"""
import os, sys, bpy
from mathutils import Vector
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "helmet_study"))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

OUT = P.ELITE + "/02_progress_photos/50_ronin_helm/"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.gltf(filepath=P.ELITE + "/01_input/ronin_helm/Meshy_Cyber_Ronin_Helm.glb")
o = next(o for o in bpy.data.objects if o.type == "MESH")
m = bpy.data.materials.new("grey")
m.use_nodes = True
b = m.node_tree.nodes["Principled BSDF"]
b.inputs["Base Color"].default_value = (0.18, 0.18, 0.2, 1)
b.inputs["Roughness"].default_value = 0.6
o.data.materials.append(m)
for p in o.data.polygons:
    p.use_smooth = True
bs.setup_world(strength=0.6, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=60)
bs.setup_render(600, 600)
for tg, d in (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.1)), ("side", (1, 0, 0.05)), ("back", (0, 1, 0.05)), ("below", (0, -0.4, -1))):
    cam = bs.setup_camera(target=Vector((0, 0, 0)), ortho_scale=2.0, direction=d, distance=8)
    bs.render_to(OUT + "01_grey_%s.png" % tg, cam)
    bpy.data.objects.remove(cam, do_unlink=True)
