"""Kitbash v2: graft DroneS (the Smuggler combat drone - the asset already
earmarked as this house's own Drone unit in house/units.md) onto the
Sentinal frigate's dorsal spine as a mounted recon/turret pod. Same
whole-object-graft technique as v1 (DroneA), swapped to the donor that's
actually staying in the roster, so the Frigate and Drone units share a
silhouette family on purpose.
"""
import math
import os
import sys
import bpy
from mathutils import Vector, Matrix

HOST_FBX = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\01_input\Renegade_Frigate_real.fbx"
HOST_ALB = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_Albedo.png"
HOST_MGAO = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_MetallicGlossAO.png"
HOST_NRM = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_Normal.png"

DONOR_FBX = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\01_input\DroneS_preview_textures\DroneS_real.fbx"
DONOR_ALB = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\01_input\DroneS_preview_textures\albedo.png"
DONOR_MGAO = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\01_input\DroneS_preview_textures\mgao.png"
DONOR_NRM = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\01_input\DroneS_preview_textures\normal.png"

OUT_BLEND = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\03_blender\sentinal_kitbash_v2_droneS.blend"
FRAMES_DIR = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\sentinal\02_progress_photos\01_components\kitbash_v2_renders"
N_FRAMES = 16
RES = 480


def wire_material(mesh_obj, mat_name, albedo, mgao, normal):
    mat = bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(path, loc, non_color=False):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=False)
        img.pack()
        if non_color:
            img.colorspace_settings.name = "Non-Color"
        nd.image = img
        nd.location = loc
        return nd

    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    out.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    alb = tex(albedo, (-700, 300))
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    if mgao and os.path.exists(mgao):
        mga = tex(mgao, (-700, 0), non_color=True)
        nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if normal and os.path.exists(normal):
        nrm = tex(normal, (-700, -300), non_color=True)
        nmap = nt.nodes.new("ShaderNodeNormalMap")
        nmap.location = (-400, -300)
        nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
        nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    for m in [mesh_obj] if not isinstance(mesh_obj, list) else mesh_obj:
        m.data.materials.clear()
        m.data.materials.append(mat)


def bbox_world(objs):
    mn = Vector((1e9, 1e9, 1e9))
    mx = Vector((-1e9, -1e9, -1e9))
    for o in objs:
        for c in o.bound_box:
            wc = o.matrix_world @ Vector(c)
            mn.x, mn.y, mn.z = min(mn.x, wc.x), min(mn.y, wc.y), min(mn.z, wc.z)
            mx.x, mx.y, mx.z = max(mx.x, wc.x), max(mx.y, wc.y), max(mx.z, wc.z)
    return mn, mx


bpy.ops.wm.read_factory_settings(use_empty=True)

# ---- host (frigate) ----
bpy.ops.import_scene.fbx(filepath=HOST_FBX)
host_meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
host_root = bpy.data.objects.new("Sentinal_root", None)
bpy.context.scene.collection.objects.link(host_root)
for m in host_meshes:
    if m.parent is None:
        m.parent = host_root
wire_material(host_meshes, "Mat_Sentinal", HOST_ALB, HOST_MGAO, HOST_NRM)

host_mn, host_mx = bbox_world(host_meshes)
host_center = (host_mn + host_mx) / 2
host_size = max(host_mx.x - host_mn.x, host_mx.y - host_mn.y, host_mx.z - host_mn.z)
host_root.location = (-host_center.x, -host_center.y, -host_center.z)
bpy.context.view_layer.update()
host_mn, host_mx = bbox_world(host_meshes)

# ---- donor (drone pod) ----
pre_existing = set(bpy.context.scene.objects)
bpy.ops.import_scene.fbx(filepath=DONOR_FBX)
donor_new = [o for o in bpy.context.scene.objects if o not in pre_existing]
donor_meshes = [o for o in donor_new if o.type == "MESH"]
donor_root = bpy.data.objects.new("Pod_root", None)
bpy.context.scene.collection.objects.link(donor_root)
for o in donor_new:
    if o.parent is None:
        o.parent = donor_root
wire_material(donor_meshes, "Mat_Pod", DONOR_ALB, DONOR_MGAO, DONOR_NRM)

bpy.context.view_layer.update()
d_mn, d_mx = bbox_world(donor_meshes)
d_center = (d_mn + d_mx) / 2
d_size = max(d_mx.x - d_mn.x, d_mx.y - d_mn.y, d_mx.z - d_mn.z)

# scale the drone down to a "mounted pod" proportion (~22% of hull span)
target_size = host_size * 0.22
scale = target_size / d_size if d_size > 0 else 1.0

# dorsal mount point: hull-space top-centre, nudged toward the nose (frame_12
# showed the raised sensor spine sits slightly forward of hull centre)
mount = Vector((
    host_center.x * 0 + (host_mn.x + host_mx.x) / 2,
    (host_mn.y + host_mx.y) / 2 - (host_mx.y - host_mn.y) * 0.08,
    host_mx.z + target_size * 0.02,
))

# donor_root is parented under host_root, so its .location is in host_root's
# LOCAL space, not world space - subtract host_root's own (pure-translation)
# offset before placing it, or the mount point lands wrong by that offset.
local_mount = mount - host_root.location

donor_root.scale = (scale, scale, scale)
donor_root.location = local_mount - Vector(d_center) * scale
# face the pod's nose forward (match host orientation; drone's own forward
# already reads fine front-on from the earlier vehicle preview, so identity)
donor_root.parent = host_root

bpy.context.view_layer.update()

# ---- camera / lights / world (same recipe as the single-vehicle preview) ----
cam_data = bpy.data.cameras.new("Cam")
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.scene.collection.objects.link(cam)
dist = host_size * 1.6
cam.location = (dist, -dist, host_size * 0.55)
bpy.context.scene.camera = cam

empty = bpy.data.objects.new("CamTarget", None)
bpy.context.scene.collection.objects.link(empty)
empty.location = (0, 0, host_size * 0.08)
con = cam.constraints.new("TRACK_TO")
con.target = empty
con.track_axis = "TRACK_NEGATIVE_Z"
con.up_axis = "UP_Y"

sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
sun.data.energy = 3.0
bpy.context.scene.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0, math.radians(35))

fill = bpy.data.objects.new("Fill", bpy.data.lights.new("Fill", "SUN"))
fill.data.energy = 1.0
bpy.context.scene.collection.objects.link(fill)
fill.rotation_euler = (math.radians(70), 0, math.radians(-120))

world = bpy.data.worlds.new("World")
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.08, 0.09, 0.11, 1)
bpy.context.scene.world = world

scene = bpy.context.scene
scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items.keys() else "BLENDER_EEVEE"
scene.render.resolution_x = RES
scene.render.resolution_y = RES
scene.render.image_settings.file_format = "PNG"

os.makedirs(FRAMES_DIR, exist_ok=True)
for i in range(N_FRAMES):
    angle = (i / N_FRAMES) * 2 * math.pi
    cam.location = (dist * math.cos(angle), dist * math.sin(angle), host_size * 0.55)
    scene.render.filepath = os.path.join(FRAMES_DIR, f"frame_{i:03d}.png")
    bpy.ops.render.render(write_still=True)

bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("DONE", OUT_BLEND)
