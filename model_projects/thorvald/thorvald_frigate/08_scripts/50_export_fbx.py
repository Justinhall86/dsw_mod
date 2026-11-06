"""Skin the textured frigate to the vanilla Renegade armature (single bone B_Body) and export an FBX.

    blender -b 03_blender/frigate_v13_textured.blend --python 50_export_fbx.py -- <out.fbx>

Why this is needed: the game's vehicle FBX stores the BIND pose in mesh.data and the skin matrix M (data -> world)
is a pure axis permutation + translation that differs per model. Our kitbash lives in baked WORLD space, so each
vertex is converted back:   data = M^-1 (world + offset)   where `offset` (scene["frigate_offset"]) undoes the
centring the builder did, so the ship sits in the vanilla Renegade's frame (nose +X, bottom ~0.45).
The vanilla armature/bone is reused untouched; the toolkit's fbxfix restores the skeleton from the vanilla HMD.
"""
import os
import sys

import bpy
import numpy as np
from mathutils import Matrix, Vector

OUT = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
VEH = r"C:\Users\justi\Python\dsw_mod\model_inputs\Vehicle"
REAL = os.path.join(VEH, "Common", "Renegade_Frigate", "preview_textures", "Renegade_Frigate_real.fbx")

ship = bpy.data.objects["Thorvald_Frigate"]
offset = Vector(bpy.context.scene["frigate_offset"])
print("offset", tuple(offset))

# ---- vanilla armature + mesh (for the skin transform)
pre = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=REAL)
new = [o for o in bpy.data.objects if o not in pre]
for o in list(new):
    if o.type == "MESH" and o.name.split(".")[0] == "Cube":
        bpy.data.objects.remove(o, do_unlink=True)
new = [o for o in new if o.name in bpy.data.objects]
arm = next(o for o in new if o.type == "ARMATURE")
orig = next(o for o in new if o.type == "MESH")
bpy.context.view_layer.update()
print("orig mesh", orig.name, len(orig.data.vertices), "armature", arm.name,
      [b.name for b in arm.data.bones])

# ---- solve data -> world:  world = A @ [data, 1]
dg = bpy.context.evaluated_depsgraph_get()
ev = orig.evaluated_get(dg)
me = ev.to_mesh()
mw = orig.matrix_world
world = np.array([tuple(mw @ v.co) for v in me.vertices])
ev.to_mesh_clear()
data = np.array([tuple(v.co) for v in orig.data.vertices])
X = np.hstack([data, np.ones((len(data), 1))])
sol, res, _, _ = np.linalg.lstsq(X, world, rcond=None)           # (4,3)
A = np.eye(4)
A[:3, :3] = sol[:3].T
A[:3, 3] = sol[3]
err = np.abs(X @ sol - world).max()
print("skin matrix (data->world):\n", np.round(A, 4), "\nmax fit error", err)
assert err < 1e-3, "skin transform is not affine"
Ainv = np.linalg.inv(A)

# ---- our vertices (final frame) -> vanilla world frame -> raw data frame
mws = ship.matrix_world
for v in ship.data.vertices:
    w = mws @ v.co + offset
    d = Ainv @ np.array([w.x, w.y, w.z, 1.0])
    v.co = Vector((d[0], d[1], d[2]))
ship.data.update()
ship.matrix_world = Matrix.Identity(4)
ship.data.validate()

# ---- skin: one group B_Body weight 1, parented to the vanilla armature exactly like the original
for vg in list(ship.vertex_groups):
    ship.vertex_groups.remove(vg)
vg = ship.vertex_groups.new(name="B_Body")
vg.add(list(range(len(ship.data.vertices))), 1.0, "REPLACE")
for m in list(ship.modifiers):
    ship.modifiers.remove(m)
mod = ship.modifiers.new("Armature", "ARMATURE")
mod.object = arm
ship.parent = arm
ship.parent_type = "OBJECT"
ship.matrix_parent_inverse = orig.matrix_parent_inverse.copy()
ship.matrix_basis = orig.matrix_basis.copy()
bpy.context.view_layer.update()

# ---- verify: evaluated ship == final frame + offset
dg = bpy.context.evaluated_depsgraph_get()
ev = ship.evaluated_get(dg)
me = ev.to_mesh()
got = np.array([tuple(ship.matrix_world @ v.co) for v in me.vertices])
ev.to_mesh_clear()
print("evaluated bounds min", got.min(0).round(3), "max", got.max(0).round(3), "(vanilla Renegade z 0.45..2.54, x -4.81..5.39)")

bpy.data.objects.remove(orig, do_unlink=True)
ship.data.name = "Thorvald_Frigate"

# ---- export (same settings as dsw-model-modding/scripts/blender_export_fbx.py)
mat = ship.data.materials[0]
linked = {l.to_socket.name for l in mat.node_tree.links}
for sock in ("Base Color", "Specular IOR Level", "Normal"):
    assert sock in linked, "material wiring missing " + sock
for a in list(ship.data.color_attributes):
    ship.data.color_attributes.remove(a)
if arm.animation_data:
    arm.animation_data.action = None
for b in arm.data.bones:
    b.use_deform = True
arm.hide_set(False)
arm.hide_viewport = False
ship.hide_set(False)
ship.hide_viewport = False
for o in bpy.context.view_layer.objects:
    o.select_set(o in (arm, ship))
bpy.context.view_layer.objects.active = arm
os.makedirs(os.path.dirname(OUT), exist_ok=True)
bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
    bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
    primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="OFF")
print("EXPORTED", OUT, os.path.getsize(OUT), "bytes;", len(ship.data.polygons), "faces")
