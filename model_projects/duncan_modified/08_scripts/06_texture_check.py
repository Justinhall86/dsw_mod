"""Step 6: render textured views (albedo) to check whether the hanging back piece is hair or scarf/cape cloth."""
import bpy, os, mathutils

SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
TEX = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\01_input"
OUT = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\02_progress_photos"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
scene = bpy.context.scene
me = next(o for o in scene.objects if o.type == 'MESH')

mat = bpy.data.materials.new("TexCheck"); mat.use_nodes = True
nt = mat.node_tree
for n in list(nt.nodes): nt.nodes.remove(n)
img = bpy.data.images.load(os.path.join(TEX, "Duncan_Albedo.png"))
tex = nt.nodes.new("ShaderNodeTexImage"); tex.image = img
em = nt.nodes.new("ShaderNodeEmission"); em.inputs["Strength"].default_value = 1.0
out = nt.nodes.new("ShaderNodeOutputMaterial")
nt.links.new(tex.outputs["Color"], em.inputs["Color"])
nt.links.new(em.outputs["Emission"], out.inputs["Surface"])
me.data.materials.clear(); me.data.materials.append(mat)

scene.render.engine = 'BLENDER_WORKBENCH'
scene.display.shading.light = 'FLAT'
scene.display.shading.color_type = 'TEXTURE'
scene.render.resolution_x = 800
scene.render.resolution_y = 1000

def cam_at(loc, look_at, name):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    scene.collection.objects.link(cam)
    cam.location = loc
    d = mathutils.Vector(look_at) - mathutils.Vector(loc)
    cam.rotation_euler = d.to_track_quat('-Z', 'Y').to_euler()
    return cam

views = {
    "back":      ((0, 2.6, 1.4), (0, 0.05, 1.4)),
    "backclose": ((0.8, 1.6, 1.7), (0, 0.1, 1.55)),
    "left":      ((2.6, 0.2, 1.45), (0, 0.03, 1.45)),
    "front":     ((0, -2.6, 1.35), (0, 0, 1.35)),
}
for name, (loc, tgt) in views.items():
    cam = cam_at(loc, tgt, "cam_" + name)
    scene.camera = cam
    scene.render.filepath = os.path.join(OUT, f"tex_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered", name)
