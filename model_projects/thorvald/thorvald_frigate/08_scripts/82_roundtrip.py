"""Round-trip check of the game HMD: convert 06_game_ready/.../Thorvald_Frigate.hmd back to FBX and render it beside
the vanilla Renegade_Frigate (same rig), both evaluated through their armatures. Both must sit level, nose the
same way (+X), and the muzzle points must sit on the barrel tips.

    python 82_roundtrip.py <outdir>                (converts, then runs Blender on itself)
"""
import json, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
HMD = os.path.join(PROJ, "06_game_ready", "VehMOD", "Thorvald_Frigate", "Thorvald_Frigate.hmd")
VAN = os.path.join(REPO, "model_inputs", "Vehicle", "Common", "Renegade_Frigate", "preview_textures", "Renegade_Frigate_real.fbx")
BLENDER = r"D:\Blender Foundation\Blender 5.2\blender.exe"

if "bpy" not in sys.modules:
    out = os.path.abspath(sys.argv[1]); os.makedirs(out, exist_ok=True)
    sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
    import build_previews as bp
    rt = os.path.join(PROJ, "05_fbx_export", "Thorvald_Frigate_roundtrip_real.fbx")
    bp.convert_model(HMD, rt)
    print("round-trip fbx", rt)
    subprocess.run([BLENDER, "-b", "--factory-startup", "--python", os.path.abspath(__file__), "--", out, rt], check=True)
    sys.exit(0)

import bpy
from mathutils import Vector

sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

out, rt = sys.argv[sys.argv.index("--") + 1:][:2]
GR = os.path.join(PROJ, "06_game_ready", "VehMOD", "Thorvald_Frigate")
bs.reset_scene()


def load(path, tex=None, shift=0.0):
    pre = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=path)
    new = [o for o in bpy.data.objects if o not in pre]
    for o in new:
        if o.type == "MESH" and o.name.split(".")[0] == "Cube":
            bpy.data.objects.remove(o, do_unlink=True)
    new = [o for o in new if o.name in bpy.data.objects]
    meshes = [o for o in new if o.type == "MESH"]
    if tex:
        m = bpy.data.materials.new("rt"); m.use_nodes = True
        b = m.node_tree.nodes.get("Principled BSDF")
        im = m.node_tree.nodes.new("ShaderNodeTexImage"); im.image = bpy.data.images.load(tex)
        m.node_tree.links.new(im.outputs["Color"], b.inputs["Base Color"])
        for o in meshes:
            o.data.materials.clear(); o.data.materials.append(m)
    for o in new:
        if o.parent is None:
            o.location.y += shift
    return meshes


ours = load(rt, os.path.join(GR, "Thorvald_Frigate_Albedo.png"), shift=0.0)
van = load(VAN, os.path.join(REPO, "model_inputs", "Vehicle", "Common", "Renegade_Frigate", "preview_textures", "albedo.png"), shift=11.0)
bpy.context.view_layer.update()
dg = bpy.context.evaluated_depsgraph_get()


def bounds(objs):
    pts = []
    for o in objs:
        ev = o.evaluated_get(dg); me = ev.to_mesh()
        pts += [o.matrix_world @ v.co for v in me.vertices]; ev.to_mesh_clear()
    return Vector([min(p[i] for p in pts) for i in range(3)]), Vector([max(p[i] for p in pts) for i in range(3)])


for lab, objs in (("OURS", ours), ("RENEGADE", van)):
    mn, mx = bounds(objs)
    print(lab, "bounds", tuple(round(v, 2) for v in mn), tuple(round(v, 2) for v in mx))
# muzzle markers: the prefab's raw coords -> world through the same data->world map (x=-z, y=-x, z=y)
pre = json.load(open(os.path.join(GR, "Prefab_Thorvald_Frigate.prefab")))
kids = pre["children"][0]["children"][0]["children"]
for k in kids:
    if k["name"] in ("MuzzleA", "MuzzleB", "MuzzleC", "MuzzleD"):
        w = Vector((-k["z"], -k["x"], k["y"]))
        bpy.ops.mesh.primitive_uv_sphere_add(radius=0.18, location=w)
        s = bpy.context.active_object; s.name = k["name"]
        m = bpy.data.materials.new("mz"); m.use_nodes = True
        m.node_tree.nodes.get("Principled BSDF").inputs["Emission Color"].default_value = (0, 1, 0.3, 1)
        m.node_tree.nodes.get("Principled BSDF").inputs["Emission Strength"].default_value = 5
        s.data.materials.append(m)
        print("muzzle marker", k["name"], tuple(round(v, 2) for v in w))
allo = [o for o in bpy.data.objects if o.type == "MESH"]
mn, mx = bounds(allo); c = (mn + mx) / 2; span = max(mx - mn)
bs.setup_render(1400, 800); bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=span * 1.15, distance=span * 3)
for name, d in {"tq": (0.7, -0.6, 0.5), "side": (0, -1, 0.0001), "front": (1, 0, 0.0001), "top": (0.0001, 0, 1)}.items():
    cam.location = c + Vector(d).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name == "top" else "Y").to_euler()
    bs.render_to(os.path.join(out, "rt_%s.png" % name), cam)
print("ROUNDTRIP_OK")
