"""Step 06 - bake the House Ginaz textures into the Commando FBX and export it
for the HMD Toolkit.

  blender -b --python 08_scripts/06_bake_fbx.py

What it does
  * imports model_inputs/Commando/Male01_Commando_TRUE_FBX.fbx
  * points Mat_Commando at the recoloured texture set in 04_textures
  * re-embeds those textures (path_mode=COPY, embed_textures=True) so the FBX
    carries the new albedo, and exports with the settings the HMD Toolkit
    expects: Forward Y / Up Z, no leaf bones, no animation, Copy + Embed
  * writes 05_fbx_export/Male01_CommandoHouse.fbx

The mesh, rig and skin are untouched: only the texture paths change, so the
model keeps playing every existing animation.
"""
import os
import bpy

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_house"
SRC_FBX = r"C:\Users\justi\Python\dsw_mod\model_inputs\Commando\Male01_Commando_TRUE_FBX.fbx"
TEX = os.path.join(PROJ, "04_textures")
OUTDIR = os.path.join(PROJ, "05_fbx_export")
os.makedirs(OUTDIR, exist_ok=True)
OUT = os.path.join(OUTDIR, "Male01_CommandoHouse.fbx")

WANT = {
    "Albedo": os.path.join(TEX, "Commando_House_Albedo.png"),
    "MetallicGlossAO": os.path.join(TEX, "Commando_House_MetallicGlossAO.png"),
    "Normal": os.path.join(TEX, "Commando_House_Normal.png"),
}

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC_FBX)

mesh = next(o for o in bpy.data.objects if o.type == "MESH" and o.name == "Commando")
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")

for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

# --- point the material at the recoloured textures --------------------
mat = mesh.data.materials[0]
nt = mat.node_tree
images = [n for n in nt.nodes if n.type == "TEX_IMAGE"]
for node in images:
    cur = node.image.name if node.image else ""
    key = next((k for k in WANT if k in cur), None)
    if key is None:
        continue
    node.image.filepath = WANT[key]
    node.image.reload()
    print(f"  {node.name}: {cur} -> {os.path.basename(WANT[key])}")

# the toolkit maps textures by their wiring, so the sockets must stay:
#   Albedo -> Base Color, MetallicGlossAO -> Specular IOR Level, Normal -> Normal Map
for sock in ("Base Color", "Specular IOR Level", "Normal"):
    linked = any(l.to_socket.name == sock for l in nt.links)
    print(f"  socket {sock}: {'linked' if linked else 'MISSING'}")
    if not linked:
        raise SystemExit(f"material {mat.name}: nothing linked to {sock}")

# --- rest pose, no animation, all bones deform ------------------------
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
for b in rig.data.bones:
    b.use_deform = True
bpy.context.scene.frame_set(1)

for attr in list(mesh.data.color_attributes):
    mesh.data.color_attributes.remove(attr)

rig.hide_set(False)
rig.hide_viewport = False
mesh.hide_set(False)
mesh.hide_viewport = False
for o in bpy.context.view_layer.objects:
    o.select_set(o in (rig, mesh))
bpy.context.view_layer.objects.active = rig

# --- export -----------------------------------------------------------
bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z",
    add_leaf_bones=False, bake_anim=False, path_mode="COPY", embed_textures=True,
    apply_scale_options="FBX_SCALE_UNITS", primary_bone_axis="Y", secondary_bone_axis="X",
    mesh_smooth_type="OFF")
print("EXPORTED", OUT, os.path.getsize(OUT), "bytes;", len(mesh.data.polygons), "faces",
      len(rig.data.bones), "bones")
