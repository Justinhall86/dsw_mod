"""Height comparison: our cruiser at Z-stretch 0.88 (Kraken height), 1.0 (current), 1.39 (Chronos height) beside the
vanilla Kraken (cdb scale 1.6) and Chronos (1.7). Ours are exported with 80_export_cruiser.py's logic + env ZS (scale 1.2).
    blender -b --factory-startup --python 85_height_lineup.py -- <outdir> <dir_with_var_0.88_1.0_1.39>
"""
import math, os, sys
import bpy
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
sys.path.insert(0, HERE)
import blender_scene as bs, preview_wiring as pw
out, vd = [os.path.abspath(a) for a in sys.argv[sys.argv.index("--") + 1:][:2]]
os.makedirs(out, exist_ok=True)
V = os.path.join(REPO, "model_inputs", "Vehicle")
OURTEX = os.environ.get("OURTEX") or os.path.join(PROJ, "06_game_ready", "VehMOD", "Thorvald_Frigate", "Thorvald_Frigate_Albedo.png")
bs.reset_scene()

def load(path, tex, scale, rotz, x):
    pre = set(bpy.data.objects); bpy.ops.import_scene.fbx(filepath=path)
    new = [o for o in bpy.data.objects if o not in pre]
    for o in new:
        if o.type == "MESH" and o.name.split(".")[0] == "Cube": bpy.data.objects.remove(o, do_unlink=True)
    new = [o for o in new if o.name in bpy.data.objects]
    m = bpy.data.materials.new("m"); m.use_nodes = True
    im = m.node_tree.nodes.new("ShaderNodeTexImage"); im.image = bpy.data.images.load(tex)
    m.node_tree.links.new(im.outputs["Color"], m.node_tree.nodes["Principled BSDF"].inputs["Base Color"])
    for o in new:
        if o.type == "MESH": o.data.materials.clear(); o.data.materials.append(m)
        if o.parent is None:
            o.scale = (scale,) * 3; o.rotation_euler[2] += rotz; o.location = (x, 0, 0)
    return new

row = [("Kraken x1.6", os.path.join(V, "Atreide/Kraken/preview_textures/Kraken_real.fbx"), os.path.join(V, "Atreide/Kraken/preview_textures/albedo.png"), 1.6, math.pi / 2),
       ("ours Z0.88 (Kraken h)", os.path.join(vd, "var_0.88/ship.fbx"), OURTEX, 1.2, 0),
       ("ours Z1.0 (current)", os.path.join(vd, "var_1.0/ship.fbx"), OURTEX, 1.2, 0),
       ("ours Z1.39 (Chronos h)", os.path.join(vd, "var_1.39/ship.fbx"), OURTEX, 1.2, 0),
       ("Chronos x1.7", os.path.join(V, "Imperial/Chronos/preview_textures/Chronos_real.fbx"), os.path.join(V, "Imperial/Chronos/preview_textures/albedo.png"), 1.7, math.pi / 2)]
for i, (n, f, t, s, r) in enumerate(row):
    load(f, t, s, r, i * 19.0)
bpy.context.view_layer.update(); dg = bpy.context.evaluated_depsgraph_get()
for i, (n, *_ ) in enumerate(row): pass
pts = []
for o in bpy.data.objects:
    if o.type == "MESH":
        ev = o.evaluated_get(dg); me = ev.to_mesh(); pts += [o.matrix_world @ v.co for v in me.vertices]; ev.to_mesh_clear()
for i, (n, *_ ) in enumerate(row):
    p = [q for q in pts if abs(q.x - i * 19.0) < 9.5]
    print(n, "in-game size", tuple(round(max(q[k] for q in p) - min(q[k] for q in p), 2) for k in range(3)))
mn = Vector([min(p[i] for p in pts) for i in range(3)]); mx = Vector([max(p[i] for p in pts) for i in range(3)]); c = (mn + mx) / 2
bs.setup_render(2400, 520); bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=(mx.x - mn.x) * 1.04, distance=200)
for name, d in {"side": (-1, 0, 0.0001), "front": (0.0001, 0, 0)}.items():
    pass
cam.location = c + Vector((0, -1, 0.0001)).normalized() * 200
cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
bs.render_to(os.path.join(out, "heights_side.png"), cam)
bs.setup_render(2400, 800)
cam.data.ortho_scale = (mx.x - mn.x) * 1.04
cam.location = c + Vector((0.15, -0.8, 0.45)).normalized() * 200
cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
bs.render_to(os.path.join(out, "heights_tq.png"), cam)
print("DONE")
