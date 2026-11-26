"""Close-up check of the Ronin helmet surface (jaggedness hunt): textured and clay renders of the head kit, 900 px.
    blender -b <blend> --python r30_closeup.py -- <outdir> [prefix]"""
import os, sys, bpy
from mathutils import Vector
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "helmet_study"))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

a = sys.argv[sys.argv.index("--") + 1:]
OUT, PFX = a[0], (a[1] if len(a) > 1 else "")
os.makedirs(OUT, exist_ok=True)
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
rig.data.pose_position = "REST"
for o in [o for o in bpy.data.objects if o.type in ("LIGHT", "CAMERA")]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
kit = [bpy.data.objects[n] for n in ("Kit_roninhelm", "Kit_rangermask")]
hv = [o.matrix_world @ v.co for o in kit for v in o.data.vertices]
hc = Vector([(min(p[i] for p in hv) + max(p[i] for p in hv)) / 2 for i in range(3)])
hs = max(max(p[i] for p in hv) - min(p[i] for p in hv) for i in range(3))
bs.setup_render(900, 900)
VIEWS = (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.15)), ("side", (1, 0, 0.05)), ("back", (0.3, 1, 0.1)), ("low", (0.5, -0.6, -0.5)))
for tg, d in VIEWS:
    cam = bs.setup_camera(target=hc, ortho_scale=hs * 1.2, direction=d, distance=4)
    bs.render_to(os.path.join(OUT, PFX + "tex_" + tg + ".png"), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
clay = bpy.data.materials.new("clay")
clay.use_nodes = True
clay.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (0.5, 0.5, 0.52, 1)
clay.node_tree.nodes["Principled BSDF"].inputs["Roughness"].default_value = 0.45
for o in bpy.data.objects:
    if o.type == "MESH":
        for i in range(len(o.material_slots)):
            o.material_slots[i].material = clay
for tg, d in VIEWS[:4]:
    cam = bs.setup_camera(target=hc, ortho_scale=hs * 1.2, direction=d, distance=4)
    bs.render_to(os.path.join(OUT, PFX + "clay_" + tg + ".png"), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("CLOSEUP DONE")
