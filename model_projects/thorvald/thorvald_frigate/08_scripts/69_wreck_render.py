"""Put the repainted textures on the whole cruiser, save 03_blender/wreck_painted.blend (toolkit wiring:
Albedo->Base Color, MGAO->Specular IOR Level, Normal->Normal Map), then render game-like views.

    blender -b 03_blender/wreck_whole.blend --python 69_wreck_render.py -- <outdir> [albedo] [mgao]
"""
import importlib, os, sys
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402
argv = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(argv[0]); os.makedirs(out, exist_ok=True)
TEX = os.path.join(PROJ, "04_textures")
alb = argv[1] if len(argv) > 1 else os.path.join(TEX, "Thorvald_Cruiser_Albedo.png")
mga = argv[2] if len(argv) > 2 else os.path.join(TEX, "Thorvald_Cruiser_MetallicGlossAO.png")
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
NRM = os.path.join(R, "model_inputs", "Structure", "Point_Of_Interest", "SpaceCruiserWreck", "preview_textures",
                   "CrashedShip_Normal.png")

o = bpy.data.objects["thorvald_cruiser"]
m = bpy.data.materials.new("Thorvald_Cruiser"); m.use_nodes = True
nt = m.node_tree; bsdf = nt.nodes.get("Principled BSDF")
ta = nt.nodes.new("ShaderNodeTexImage"); ta.image = bpy.data.images.load(alb)
nt.links.new(ta.outputs["Color"], bsdf.inputs["Base Color"])
tm = nt.nodes.new("ShaderNodeTexImage"); tm.image = bpy.data.images.load(mga); tm.image.colorspace_settings.name = "Non-Color"
nt.links.new(tm.outputs["Color"], bsdf.inputs["Specular IOR Level"])
tn = nt.nodes.new("ShaderNodeTexImage"); tn.image = bpy.data.images.load(NRM); tn.image.colorspace_settings.name = "Non-Color"
nm = nt.nodes.new("ShaderNodeNormalMap"); nt.links.new(tn.outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
o.data.materials.clear(); o.data.materials.append(m)
bpy.ops.object.select_all(action="DESELECT"); o.select_set(True); bpy.context.view_layer.objects.active = o
bpy.ops.object.shade_flat()
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "wreck_painted.blend"))

pw.gamelike(m)
bs.setup_render(1400, 900)
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
pw.soften_world()
mn = Vector([min((o.matrix_world @ v.co)[i] for v in o.data.vertices) for i in range(3)])
mx = Vector([max((o.matrix_world @ v.co)[i] for v in o.data.vertices) for i in range(3)])
c = (mn + mx) / 2; span = max(mx - mn)
cam = bs.setup_camera(target=c, ortho_scale=span * 1.1, distance=span * 3)
for name, dv in {"tq": (-0.7, -0.7, 0.55), "tq_rear": (0.7, 0.7, 0.55), "top": (-0.0001, 0, 1),
                 "side": (0, -1, 0.08), "bottom": (-0.0001, 0, -1)}.items():
    cam.location = c + Vector(dv).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name in ("top", "bottom") else "Y").to_euler()
    bs.render_to(os.path.join(out, name + ".png"), cam)
# RTS distance: steep game camera, small on screen
bs.setup_render(420, 300)
cam.data.ortho_scale = span * 2.6
cam.location = c + Vector((-0.35, -0.6, 1.0)).normalized() * span * 3
cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
bs.render_to(os.path.join(out, "rts.png"), cam)
print("PAINTED_OK")
