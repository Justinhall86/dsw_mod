"""Export the finished cruiser (hull + 4 shoulder cannons, AD7 paint) as the Thorvald frigate FBX, skinned to the
vanilla Renegade rig (B_ROOT > B_Body), so the existing model rows (Th_Frigate / A_Frigate: rig 29, inherit
RenegadeFrigate, scale 1.2) keep working unchanged.

    blender -b 03_blender/cruiser_turrets.blend --python 80_export_cruiser.py -- <out.fbx>

1. join hull + turrets into one mesh `Thorvald_Frigate`, one material `Thorvald_Frigate` using
   04_textures/Thorvald_Frigate_{Albedo,MetallicGlossAO,Normal}.png
2. place it in the vanilla Renegade's WORLD frame: nose +X (ours is -X: turn 180 deg), centred on x/y,
   bottom at z 0.45, length 13.17 (x cdb 1.2 = 15.8 in game, the Chronos's length)
3. world -> raw data with the inverse of the vanilla skin matrix (as 50_export_fbx.py), skin all to B_Body
4. muzzles: the 4 barrel tips (01_input/cruiser_muzzles.json) go through the same transform; writes
   05_fbx_export/cruiser_muzzles_raw.json (raw HMD frame + the fire direction) for 81_convert_cruiser.py
"""
import json, math, os, sys

import bpy
import numpy as np
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
OUT = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
REAL = os.path.join(R, "model_inputs", "Vehicle", "Common", "Renegade_Frigate", "preview_textures", "Renegade_Frigate_real.fbx")
TEX = os.path.join(PROJ, "04_textures")
LENGTH, BOTTOM = 13.17, 0.45

# ---- 1. one mesh, one material -------------------------------------------------------------
parts = [o for o in bpy.data.objects if o.type == "MESH"]
for o in parts:
    o.data.transform(o.matrix_world); o.matrix_world = Matrix.Identity(4)
bpy.ops.object.select_all(action="DESELECT")
hull = bpy.data.objects["thorvald_cruiser"]
for o in parts:
    o.select_set(True)
bpy.context.view_layer.objects.active = hull
bpy.ops.object.join()
ship = hull; ship.name = "Thorvald_Frigate"
mat = ship.data.materials[0]; mat.name = "Thorvald_Frigate"
while len(ship.data.materials) > 1:
    ship.data.materials.pop(index=len(ship.data.materials) - 1)
for p in ship.data.polygons:
    p.material_index = 0
for n in mat.node_tree.nodes:
    if n.bl_idname == "ShaderNodeTexImage" and n.image:
        nm = n.image.name
        key = "Albedo" if "Albedo" in nm else "MetallicGlossAO" if "Metallic" in nm else "Normal" if "Normal" in nm else None
        if key:
            img = bpy.data.images.load(os.path.join(TEX, "Thorvald_Frigate_%s.png" % key), check_existing=True)
            if key != "Albedo":
                img.colorspace_settings.name = "Non-Color"
            n.image = img
print("joined:", len(ship.data.polygons), "faces,", len(ship.data.vertices), "verts")

# ---- 2. our frame -> vanilla Renegade world frame ------------------------------------------
co = np.array([tuple(v.co) for v in ship.data.vertices])
mn, mx = co.min(0), co.max(0)
k = LENGTH / (mx[0] - mn[0])
centre = np.array([(mn[0] + mx[0]) / 2, (mn[1] + mx[1]) / 2, mn[2]])
TURN = np.diag([-1.0, -1.0, 1.0])                       # 180 deg about Z: our nose -X -> +X


def to_world(p):
    q = (np.asarray(p, float) - centre) * k
    q = TURN @ q
    return q + np.array([0, 0, BOTTOM])


wco = np.array([to_world(c) for c in co])
print("world bounds", wco.min(0).round(3), wco.max(0).round(3), "scale k", round(k, 5))

# ---- 3. vanilla rig + skin matrix ------------------------------------------------------------
pre = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=REAL)
new = [o for o in bpy.data.objects if o not in pre]
arm = next(o for o in new if o.type == "ARMATURE")
origs = [o for o in new if o.type == "MESH"]
orig = max(origs, key=lambda o: len(o.data.vertices))
bpy.context.view_layer.update()
dg = bpy.context.evaluated_depsgraph_get()
ev = orig.evaluated_get(dg); me = ev.to_mesh()
world = np.array([tuple(orig.matrix_world @ v.co) for v in me.vertices]); ev.to_mesh_clear()
data = np.array([tuple(v.co) for v in orig.data.vertices])
X = np.hstack([data, np.ones((len(data), 1))])
sol, *_ = np.linalg.lstsq(X, world, rcond=None)
A = np.eye(4); A[:3, :3] = sol[:3].T; A[:3, 3] = sol[3]
err = np.abs(X @ sol - world).max()
print("skin matrix data->world\n", np.round(A, 4), "\nfit err", err, " vanilla world bounds", world.min(0).round(2), world.max(0).round(2))
assert err < 1e-3
Ainv = np.linalg.inv(A)
raw = (Ainv @ np.hstack([wco, np.ones((len(wco), 1))]).T).T[:, :3]
for v, r in zip(ship.data.vertices, raw):
    v.co = Vector(r)
ship.data.update(); ship.data.validate()

for vg in list(ship.vertex_groups):
    ship.vertex_groups.remove(vg)
vg = ship.vertex_groups.new(name="B_Body"); vg.add(list(range(len(ship.data.vertices))), 1.0, "REPLACE")
for m in list(ship.modifiers):
    ship.modifiers.remove(m)
mod = ship.modifiers.new("Armature", "ARMATURE"); mod.object = arm
ship.parent = arm; ship.parent_type = "OBJECT"
ship.matrix_parent_inverse = orig.matrix_parent_inverse.copy()
ship.matrix_basis = orig.matrix_basis.copy()
bpy.context.view_layer.update()
dg = bpy.context.evaluated_depsgraph_get()
ev = ship.evaluated_get(dg); me = ev.to_mesh()
got = np.array([tuple(ship.matrix_world @ v.co) for v in me.vertices]); ev.to_mesh_clear()
print("evaluated world bounds", got.min(0).round(3), got.max(0).round(3), " max dev from target", np.abs(got - wco).max().round(5))

# ---- 4. muzzles in the raw frame -------------------------------------------------------------
mz = json.load(open(os.path.join(PROJ, "01_input", "cruiser_muzzles.json")))["muzzles"]
fire_world = TURN @ np.array([-1.0, 0, 0])                 # our barrels point -X -> +X in vanilla world
fire_raw = Ainv[:3, :3] @ fire_world; fire_raw /= np.linalg.norm(fire_raw)
up_raw = Ainv[:3, :3] @ np.array([0, 0, 1.0]); up_raw /= np.linalg.norm(up_raw)
out = {"fire_dir_raw": fire_raw.round(5).tolist(), "up_raw": up_raw.round(5).tolist(), "muzzles": {}}
for name, m in mz.items():
    w = to_world(m["mesh"])
    r = (Ainv @ np.append(w, 1.0))[:3]
    out["muzzles"][name] = {"world": w.round(4).tolist(), "raw": r.round(4).tolist()}
    print("MUZZLE", name, "world", w.round(3), "raw", r.round(3))
eng = [to_world(p) for p in ([80.2, 15.3, 0.6], [80.2, -15.3, 0.6])]
out["engines_world"] = [e.round(4).tolist() for e in eng]
out["engines_raw"] = [(Ainv @ np.append(e, 1.0))[:3].round(4).tolist() for e in eng]
out["scale_k"] = k
os.makedirs(os.path.dirname(OUT), exist_ok=True)
json.dump(out, open(os.path.join(os.path.dirname(OUT), "cruiser_muzzles_raw.json"), "w"), indent=1)

# ---- export ------------------------------------------------------------------------------------
for o in origs:
    bpy.data.objects.remove(o, do_unlink=True)
ship.data.name = "Thorvald_Frigate"
linked = {l.to_socket.name for l in mat.node_tree.links}
for sock in ("Base Color", "Specular IOR Level", "Normal"):
    assert sock in linked, "material wiring missing " + sock
for a in list(ship.data.color_attributes):
    ship.data.color_attributes.remove(a)
while len(ship.data.uv_layers) > 1:
    ship.data.uv_layers.remove(ship.data.uv_layers[-1])
if arm.animation_data:
    arm.animation_data.action = None
for b in arm.data.bones:
    b.use_deform = True
for o in bpy.context.view_layer.objects:
    o.select_set(o in (arm, ship))
bpy.context.view_layer.objects.active = arm
bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
    bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
    primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="OFF")
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "cruiser_export.blend"))
print("EXPORTED", OUT, os.path.getsize(OUT), "bytes;", len(ship.data.polygons), "faces")
