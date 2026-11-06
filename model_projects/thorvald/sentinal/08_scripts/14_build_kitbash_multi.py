"""Generalised kitbash builder: host (Sentinal frigate) + N donor grafts,
each independently positioned/scaled/rotated. Config is a JSON file:

{
  "out_blend": "...", "frames_dir": "...", "n_frames": 16, "res": 480,
  "mounts": [
    {"name": "pod1", "fbx": "...", "albedo": "...", "mgao": "...", "normal": "...",
     "frac": [0.0, 0.0, 1.0],   // position as a fraction of host half-extent per axis, from centre
     "margin": 0.05,             // extra push outward along the dominant (|frac| closest to 1) axis, in host-size units
     "scale_frac": 0.22,         // donor's target size as a fraction of host's own size
     "rot_deg": [0, 0, 0]}
  ]
}

Fixes already baked in from the v1/v2 debugging history (see
model_projects/sentinal/SPEC.md and the workshop skill's traps.md):
  - reparent EVERY object the donor import creates with no parent (catches
    the donor's own armature, not just its mesh)
  - a mount point computed in WORLD space must be converted to the donor
    root's PARENT-local space before being assigned to .location
"""
import json
import math
import os
import sys
import bpy
from mathutils import Vector, Euler

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))

HOST_FBX = r"C:\Users\justi\Python\dsw_mod\model_projects\sentinal\01_input\Renegade_Frigate_real.fbx"
HOST_ALB = r"C:\Users\justi\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_Albedo.png"
HOST_MGAO = r"C:\Users\justi\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_MetallicGlossAO.png"
HOST_NRM = r"C:\Users\justi\Python\dsw_mod\model_projects\sentinal\04_textures\Sentinal_Normal.png"

OUT_BLEND = cfg["out_blend"]
FRAMES_DIR = cfg["frames_dir"]
N_FRAMES = cfg.get("n_frames", 16)
RES = cfg.get("res", 480)


def wire_material(meshes, mat_name, albedo, mgao, normal):
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
    for m in meshes:
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

# ---- host ----
bpy.ops.import_scene.fbx(filepath=HOST_FBX)
host_meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
host_root = bpy.data.objects.new("Sentinal_root", None)
bpy.context.scene.collection.objects.link(host_root)
for o in list(bpy.context.scene.objects):
    if o not in host_meshes and o.parent is None and o != host_root:
        o.parent = host_root
wire_material(host_meshes, "Mat_Sentinal", HOST_ALB, HOST_MGAO, HOST_NRM)

host_mn, host_mx = bbox_world(host_meshes)
host_center = (host_mn + host_mx) / 2
host_root.location = (-host_center.x, -host_center.y, -host_center.z)
bpy.context.view_layer.update()
host_mn, host_mx = bbox_world(host_meshes)
host_half = Vector(((host_mx.x - host_mn.x) / 2, (host_mx.y - host_mn.y) / 2, (host_mx.z - host_mn.z) / 2))
host_size = max(host_mx.x - host_mn.x, host_mx.y - host_mn.y, host_mx.z - host_mn.z)

# ---- donors ----
for i, mnt in enumerate(cfg["mounts"]):
    pre_existing = set(bpy.context.scene.objects)
    bpy.ops.import_scene.fbx(filepath=mnt["fbx"])
    donor_new = [o for o in bpy.context.scene.objects if o not in pre_existing]
    donor_meshes = [o for o in donor_new if o.type == "MESH"]
    donor_root = bpy.data.objects.new(f"Donor_{i}_{mnt['name']}", None)
    bpy.context.scene.collection.objects.link(donor_root)
    for o in donor_new:
        if o.parent is None:
            o.parent = donor_root
    wire_material(donor_meshes, f"Mat_Donor_{i}", mnt["albedo"], mnt.get("mgao"), mnt.get("normal"))

    bpy.context.view_layer.update()
    d_mn, d_mx = bbox_world(donor_meshes)
    d_center = (d_mn + d_mx) / 2
    d_size = max(d_mx.x - d_mn.x, d_mx.y - d_mn.y, d_mx.z - d_mn.z)
    scale = (host_size * mnt["scale_frac"]) / d_size if d_size > 0 else 1.0

    fx, fy, fz = mnt["frac"]
    margin = mnt.get("margin", 0.05) * host_size
    world_mount = Vector((
        fx * host_half.x + (margin if fx > 0 else -margin if fx < 0 else 0),
        fy * host_half.y + (margin if fy > 0 else -margin if fy < 0 else 0),
        fz * host_half.z + (margin if fz > 0 else -margin if fz < 0 else 0),
    ))
    # donor_root is parented under host_root, so .location is in host_root's
    # LOCAL space. host_root itself is NOT at the world origin - it carries
    # the recentring translation that brings the HULL to the origin - so a
    # world-space target must have that translation subtracted first. (Same
    # bug as v1, reintroduced when this was generalised; see traps.md.)
    local_mount = world_mount - host_root.location

    donor_root.scale = (scale, scale, scale)
    rot = mnt.get("rot_deg", [0, 0, 0])
    donor_root.rotation_euler = Euler((math.radians(rot[0]), math.radians(rot[1]), math.radians(rot[2])), 'XYZ')
    donor_root.parent = host_root
    # rotation_euler is applied about the donor's own origin (its mesh centre
    # is NOT at that origin), so translate using the rotated offset.
    rotated_offset = donor_root.rotation_euler.to_matrix() @ (Vector(d_center) * scale)
    donor_root.location = local_mount - rotated_offset

bpy.context.view_layer.update()

# ---- camera / lights / world ----
cam_data = bpy.data.cameras.new("Cam")
cam = bpy.data.objects.new("Cam", cam_data)
bpy.context.scene.collection.objects.link(cam)
dist = host_size * 1.7
cam.location = (dist, -dist, host_size * 0.6)
bpy.context.scene.camera = cam

empty = bpy.data.objects.new("CamTarget", None)
bpy.context.scene.collection.objects.link(empty)
empty.location = (0, 0, host_size * 0.1)
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
    cam.location = (dist * math.cos(angle), dist * math.sin(angle), host_size * 0.6)
    scene.render.filepath = os.path.join(FRAMES_DIR, f"frame_{i:03d}.png")
    bpy.ops.render.render(write_still=True)

bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("DONE", OUT_BLEND)
