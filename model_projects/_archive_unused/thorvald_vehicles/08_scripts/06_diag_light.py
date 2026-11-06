"""Diagnose why the previews render dark: A/B the metallic and AO multiply."""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

fbx = os.path.join(PROJ, "05_fbx_export", "Wraith_TRUE_FBX.fbx")
texdir = os.path.join(PROJ, "04_textures", "fighter")
out_dir = os.path.join(PROJ, "02_progress_photos", "_diag")
os.makedirs(out_dir, exist_ok=True)

bs.reset_scene()
bpy.ops.import_scene.fbx(filepath=fbx)
for n in bs.JUNK_NAMES:
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)

for m in bpy.data.materials:
    for node in [n for n in m.node_tree.nodes if n.type == "TEX_IMAGE"]:
        if node.image:
            mine = os.path.join(texdir, os.path.basename(node.image.filepath))
            if os.path.exists(mine):
                node.image = bpy.data.images.load(mine, check_existing=False)

PW.apply_all()
bs.setup_render(640, 500)
bs.setup_world()
bs.setup_lights()
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
lo, hi = bs.model_bounds(max(meshes, key=lambda o: len(o.data.polygons)))
centre = (lo + hi) / 2
scale = max(hi.x - lo.x, hi.y - lo.y, hi.z - lo.z) * 1.15
cam = bs.setup_camera(target=centre, ortho_scale=scale, distance=scale * 3.0)

mat = next(m for m in bpy.data.materials if m.use_nodes)
bsdf = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")

bs.render_to(os.path.join(out_dir, "a_asis.png"), cam)

for l in [l for l in mat.node_tree.links if l.to_socket.name == "Metallic"]:
    mat.node_tree.links.remove(l)
bsdf.inputs["Metallic"].default_value = 0.0
bs.render_to(os.path.join(out_dir, "b_metal0.png"), cam)

img = next(i for i in bpy.data.images if i.name.startswith("Wraith_Albedo"))
tex = mat.node_tree.nodes.new("ShaderNodeTexImage")
tex.image = img
mat.node_tree.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bs.render_to(os.path.join(out_dir, "c_noao.png"), cam)

tex2 = mat.node_tree.nodes.new("ShaderNodeTexImage")
img2 = next((i for i in bpy.data.images if i.name.startswith("Wraith_Metallic")), None)
if img2:
    tex2.image = img2
    bsdf.inputs["Roughness"].default_value = 0.45
bs.render_to(os.path.join(out_dir, "d_noao_rough045.png"), cam)
print("DIAG DONE")
