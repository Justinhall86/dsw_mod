"""Step 1: level the crashed cruiser. Rotates the hull's own frame (from 63_wreck_axes.py) onto
X = length, Z = up, centres it, drops the debris objects, saves 03_blender/wreck_level.blend and renders.

    blender -b --factory-startup --python 64_wreck_level.py -- [flip_up] [flip_len]
"""
import importlib, os, sys
import bpy
import numpy as np
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw
argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
SRC = os.path.join(R, "model_inputs", "Structure", "Point_Of_Interest", "SpaceCruiserWreck", "preview_textures")

UP = np.array([0.609, 0.172, -0.774]) * (-1 if "flip_up" not in argv else 1)
LEN = np.array([0.104, 0.95, 0.295]) * (1 if "flip_len" not in argv else -1)
X = LEN - UP * (LEN @ UP); X /= np.linalg.norm(X)
Z = UP / np.linalg.norm(UP); Y = np.cross(Z, X)
Rm = Matrix([list(X) + [0], list(Y) + [0], list(Z) + [0], [0, 0, 0, 1]])   # rows = new axes

bs.reset_scene()
bpy.ops.wm.obj_import(filepath=os.path.join(SRC, "SpaceCruiserWreck_02.obj"), forward_axis="Y", up_axis="Z")
hull = None
for o in list(bpy.context.scene.objects):
    if o.name.startswith("SpaceCruiser1"):
        hull = o
    else:
        bpy.data.objects.remove(o)
hull.name = "wreck_hull"
hull.data.transform(Rm)
mn, mx = B.bounds([hull]); c = (mn + mx) / 2
hull.data.transform(Matrix.Translation(-c))
mn, mx = B.bounds([hull])
print("LEVEL dims", tuple(round(v, 1) for v in (mx - mn)))

m = bpy.data.materials.new("alb"); m.use_nodes = True
bsdf = m.node_tree.nodes.get("Principled BSDF"); bsdf.inputs["Roughness"].default_value = 0.6
n = m.node_tree.nodes.new("ShaderNodeTexImage"); n.image = bpy.data.images.load(os.path.join(SRC, "CrashedShip_Albedo.png"))
m.node_tree.links.new(n.outputs["Color"], bsdf.inputs["Base Color"])
hull.data.materials.clear(); hull.data.materials.append(m)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "wreck_level.blend"))

out = os.path.join(PROJ, "02_progress_photos", "wreck_level"); os.makedirs(out, exist_ok=True)
span = max(mx - mn)
pw.soften_world(); bs.setup_render(1200, 800)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
cam = bs.setup_camera(target=Vector(), ortho_scale=span * 1.1, distance=span * 3)
for name, dv in {"tq": (-0.7, -0.7, 0.5), "tq_rear": (0.7, 0.7, 0.5), "top": (-0.0001, 0, 1),
                 "side": (0, -1, 0.0001), "end_minusX": (-1, 0, 0.0001), "end_plusX": (1, 0, 0.0001),
                 "bottom": (-0.0001, 0, -1)}.items():
    cam.location = Vector(dv).normalized() * span * 3
    cam.rotation_euler = (-cam.location).to_track_quat("-Z", "X" if name in ("top", "bottom") else "Z").to_euler()
    bs.render_to(os.path.join(out, name + ".png"), cam)
print("LEVEL_OK")
