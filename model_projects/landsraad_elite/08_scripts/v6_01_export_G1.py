"""v6 step 1: G1 (vanilla guard + Sardaukar collar + Gurney pads) -> one skinned mesh, three materials -> FBX for the toolkit.

  blender -b --python 08_scripts/v6_01_export_G1.py

Input: 03_blender/v6_G1_export_base.blend (dsw-part-kitbash build_variant.py, spec examples/landsraad_elite_G1.json, --mode rest).
Materials (names = HMD material names; convert_model.py --vanilla-material repoints each one's textures):
  Mat_LandsraadGuard1  vanilla guard body      -> Character/Common/Landsraad/LandsraadGuard_*
  Mat_EliteCollar      Sardaukar collar 18/19  -> CharMOD/Male01_LandsraadEliteG1/EliteCollar_*   (recoloured albedo)
  Mat_ElitePads        Gurney pads 17/18       -> CharMOD/Male01_LandsraadEliteG1/ElitePads_*     (recoloured albedo)
Placeholder 8x8 images keep the toolkit's Albedo/MetallicGlossAO/Normal wiring; custom normals are NOT cleared
(clearing them once gave an all-black model).
"""
import os

import bpy

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite"
SRC = os.path.join(PROJ, "03_blender", "v6_G1_export_base.blend")
OUT = os.path.join(PROJ, "05_fbx_export", "Male01_LandsraadEliteG1.fbx")
TMP = os.path.join(PROJ, "05_fbx_export", "v6_placeholders")
os.makedirs(TMP, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=SRC)
rig = bpy.data.objects["Male01_LandsraadGuard"]
body = bpy.data.objects["LandsraadGuard"]
parts = [o for o in bpy.data.objects if o.type == "MESH" and o is not body]
for o in [o for o in bpy.data.objects if o.type in ("CAMERA", "LIGHT")]:
    bpy.data.objects.remove(o, do_unlink=True)
print("parts:", [(o.name, len(o.data.vertices)) for o in parts])


def placeholder_material(name, stem):
    for m in list(bpy.data.materials):
        if m.name == name:
            m.name = "old_" + name
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    nt = mat.node_tree
    for nd in list(nt.nodes):
        nt.nodes.remove(nd)

    def img(suffix, noncolor):
        im = bpy.data.images.new("%s_%s.png" % (stem, suffix), 8, 8, alpha=True)
        im.filepath_raw = os.path.join(TMP, "%s_%s.png" % (stem, suffix))
        im.file_format = "PNG"
        im.pixels = [0.5, 0.5, 0.5, 1.0] * 64
        im.save()
        im.colorspace_settings.name = "Non-Color" if noncolor else "sRGB"
        nd = nt.nodes.new("ShaderNodeTexImage")
        nd.image = im
        return nd

    alb, mga, nrm = img("Albedo", False), img("MetallicGlossAO", True), img("Normal", True)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    nmap = nt.nodes.new("ShaderNodeNormalMap")
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    return mat


def assign(obj, mat):
    obj.data.materials.clear()
    obj.data.materials.append(mat)
    for p in obj.data.polygons:
        p.material_index = 0


assign(body, placeholder_material("Mat_LandsraadGuard1", "LandsraadGuard"))
m_collar = placeholder_material("Mat_EliteCollar", "EliteCollar")
m_pads = placeholder_material("Mat_ElitePads", "ElitePads")
for o in parts:
    assign(o, m_pads if "Gurney" in o.name else m_collar)
    o.data.uv_layers[0].name = body.data.uv_layers[0].name
    for a in list(o.data.color_attributes):
        o.data.color_attributes.remove(a)
for a in list(body.data.color_attributes):
    body.data.color_attributes.remove(a)

for o in bpy.context.view_layer.objects:
    o.select_set(False)
for o in parts + [body]:
    o.select_set(True)
bpy.context.view_layer.objects.active = body
bpy.ops.object.join()
me = body.data
per_slot = {}
for p in me.polygons:
    per_slot[p.material_index] = per_slot.get(p.material_index, 0) + 1
infl = max(len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices)
print("joined: %d verts, %d faces, materials %s, faces per slot %s, uv layers %s, max influences %d" % (
    len(me.vertices), len(me.polygons), [m.name for m in me.materials], per_slot, [u.name for u in me.uv_layers], infl))
if infl > 3:
    raise SystemExit("more than 3 bone influences on a vertex - the game allows 3")

body.name = me.name = "LandsraadEliteG1"
rig.name = rig.data.name = "Armature"
if rig.animation_data:
    rig.animation_data.action = None
rig.data.pose_position = "POSE"
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
for bn in rig.data.bones:
    bn.use_deform = True
bpy.context.scene.frame_set(1)
for o in bpy.context.view_layer.objects:
    o.select_set(o in (rig, body))
bpy.context.view_layer.objects.active = rig
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
                         bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
                         primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="FACE")
print("EXPORTED", OUT, os.path.getsize(OUT), "bytes")
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "v6_G1_export_joined.blend"))
