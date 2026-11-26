"""Ronin helm study, step 0: look at the inputs.
    blender -b --factory-startup --python r00_inspect.py
Prints mesh stats of the Meshy helm (.glb) and of the Atreides Ranger (TRUE fbx), and renders the Meshy helm from 4 sides
to 02_progress_photos/50_ronin_helm/00_meshy_*.png"""
import os, sys, bpy
from mathutils import Vector
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "helmet_study"))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

OUT = P.ELITE + "/02_progress_photos/50_ronin_helm/"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.gltf(filepath=P.ELITE + "/01_input/ronin_helm/Meshy_Cyber_Ronin_Helm.glb")
ms = [o for o in bpy.data.objects if o.type == "MESH"]
for o in ms:
    bb = [o.matrix_world @ Vector(c) for c in o.bound_box]
    print("MESHY", o.name, "verts", len(o.data.vertices), "faces", len(o.data.polygons),
          "bbox", tuple(round(min(p[i] for p in bb), 3) for i in range(3)), tuple(round(max(p[i] for p in bb), 3) for i in range(3)),
          "mats", [m.name for m in o.data.materials])
    for m in o.data.materials:
        for n in m.node_tree.nodes:
            if n.type == "TEX_IMAGE" and n.image:
                print("   tex", n.image.name, n.image.size[:])
lo = Vector([min((o.matrix_world @ Vector(c))[i] for o in ms for c in o.bound_box) for i in range(3)])
hi = Vector([max((o.matrix_world @ Vector(c))[i] for o in ms for c in o.bound_box) for i in range(3)])
ctr, sz = (lo + hi) / 2, max(hi - lo)
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(500, 500)
for tg, d in (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.1)), ("side", (1, 0, 0.05)), ("back", (0, 1, 0.05)),
              ("negx", (-1, 0, 0.05)), ("posy", (0, 1, 0.05)), ("top", (0, -0.05, 1))):
    cam = bs.setup_camera(target=ctr, ortho_scale=sz * 1.2, direction=d, distance=sz * 4)
    bs.render_to(OUT + "00_meshy_%s.png" % tg, cam)
    bpy.data.objects.remove(cam, do_unlink=True)

# Ranger donor
for o in list(bpy.data.objects):
    bpy.data.objects.remove(o, do_unlink=True)
bpy.ops.import_scene.fbx(filepath=P.REPO + "/model_inputs/Character/Atreide/A_Ranger/Female01_AtreideRanger_TRUE_FBX.fbx")
for o in bpy.data.objects:
    if o.type == "MESH":
        names = {g.index: g.name for g in o.vertex_groups}
        heads = sum(1 for v in o.data.vertices if v.groups and names[max(v.groups, key=lambda x: x.weight).group] in ("B_HeadJ",))
        print("RANGER", o.name, len(o.data.vertices), "headverts", heads, [m.name for m in o.data.materials])
print("INSPECT DONE")
