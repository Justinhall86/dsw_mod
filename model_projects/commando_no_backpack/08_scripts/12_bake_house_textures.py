"""Step 12 - bake the House Ginaz textures onto the no-backpack Commando.

Combines the two pieces of work:
  * model_projects/commando_house/  -> the recoloured House texture set
  * this project                    -> the Commando with the backpack removed

  blender -b --python 08_scripts/12_bake_house_textures.py \
      -- <in_nopack.fbx> <out.fbx>

The texture set is the same 512x512 atlas the full Commando uses: the atlas is
laid out for the whole model, and removing the backpack only removes the
geometry that sampled part of it, so the UVs of the remaining body are unchanged
and the textures need no re-baking.
"""
import os
import sys

import bpy

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
HOUSE_TEX = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_house\04_textures"
OUTDIR = os.path.join(PROJ, "05_fbx_export")
os.makedirs(OUTDIR, exist_ok=True)

DEFAULT_IN = os.path.join(OUTDIR, "Male01_CommandoNoPack.fbx")
DEFAULT_OUT = os.path.join(OUTDIR, "Male01_CommandoNoPackHouse.fbx")

WANT = {
    "Albedo": os.path.join(HOUSE_TEX, "Commando_House_Albedo.png"),
    "MetallicGlossAO": os.path.join(HOUSE_TEX, "Commando_House_MetallicGlossAO.png"),
    "Normal": os.path.join(HOUSE_TEX, "Commando_House_Normal.png"),
}

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
src = os.path.abspath(argv[0]) if len(argv) > 0 else DEFAULT_IN
dst = os.path.abspath(argv[1]) if len(argv) > 1 else DEFAULT_OUT

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=src)
mesh = next(o for o in bpy.data.objects if o.type == "MESH")
rig = next((o for o in bpy.data.objects if o.type == "ARMATURE"), None)
for name in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(name)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)

mat = mesh.data.materials[0]
nt = mat.node_tree
# The source FBX has its textures PACKED (embed_textures=True on export), so
# setting node.image.filepath and calling reload() keeps the OLD packed pixels
# (Blender cannot find the bogus .fbm path it recorded).  Replace the image
# datablock with a freshly loaded one instead.
for node in [n for n in nt.nodes if n.type == "TEX_IMAGE"]:
    old = node.image
    cur = old.name if old else ""
    key = next((k for k in WANT if k in cur), None)
    if key is None:
        # the pack step renamed some nodes; fall back to the node's own name
        key = next((k for k in WANT if k in node.name), None)
    if key is None:
        continue
    new = bpy.data.images.load(WANT[key], check_existing=False)
    new.name = cur or os.path.basename(WANT[key])
    node.image = new
    if old is not None and old.users == 0:
        bpy.data.images.remove(old)
    print("  %-16s %s -> %s" % (node.name, cur, os.path.basename(WANT[key])))

for sock in ("Base Color", "Specular IOR Level", "Normal"):
    if not any(l.to_socket.name == sock for l in nt.links):
        raise SystemExit("material %s: nothing linked to %s" % (mat.name, sock))
    print("  socket %-18s linked" % sock)

if rig:
    if rig.animation_data:
        rig.animation_data.action = None
    for pb in rig.pose.bones:
        pb.matrix_basis.identity()
    for b in rig.data.bones:
        b.use_deform = True
bpy.context.scene.frame_set(1)
for attr in list(mesh.data.color_attributes):
    mesh.data.color_attributes.remove(attr)

if rig:
    rig.hide_set(False)
    rig.hide_viewport = False
mesh.hide_set(False)
mesh.hide_viewport = False
for o in bpy.context.view_layer.objects:
    o.select_set(o in (rig, mesh) if rig else o == mesh)
bpy.context.view_layer.objects.active = rig or mesh

bpy.ops.export_scene.fbx(
    filepath=dst, use_selection=True, axis_forward="Y", axis_up="Z",
    add_leaf_bones=False, bake_anim=False, path_mode="COPY", embed_textures=True,
    apply_scale_options="FBX_SCALE_UNITS", primary_bone_axis="Y", secondary_bone_axis="X",
    mesh_smooth_type="OFF")
print("EXPORTED", dst, os.path.getsize(dst), "bytes;", len(mesh.data.polygons), "faces")
