"""Real kitbash: normalise a donor ship to the HOST's own scale, cut a
recognisable greeble chunk out of it with bmesh (keep-only-inside-box, same
spatial technique as the unwelded-mesh removal note in part-removal.md, just
inverted - keep instead of delete), then graft that chunk onto the host,
EMBEDDED into the hull surface (not floating above it) so it reads as one
built object instead of a toy glued on top.

Config JSON:
{
  "out_blend": "...", "frames_dir": "...", "n_frames": 16, "res": 480,
  "grafts": [
    {"name": "...", "fbx": "...", "albedo": "...", "mgao": "...", "normal": "...",
     "extract": {"x": [-1,1], "y": [-1,1], "z": [-1,1]},   // fractional box of
        // the donor's OWN half-extent, AFTER the donor has been scaled to
        // match the host's size - so these fractions already describe a
        // real, host-scale chunk, not a miniature.
     "mount_frac": [fx, fy, fz],   // where on the HOST's half-extent to place it
     "embed": 0.3,                 // push the chunk this fraction of ITS OWN
        // size into the hull along the mount axis, so it overlaps/interpenetrates
        // instead of floating with a gap - how real kitbash glue joints read.
     "rot_deg": [0,0,0]}
  ]
}
"""
import json
import math
import os
import sys
import bmesh
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


def bake_pose_and_clear_armature(obj):
    """These HMD-converted meshes store BASE data in bind-pose space, not the
    visually-correct shape - the Armature modifier deforms them at render
    time (confirmed on DroneS: raw mesh.data.vertices range doesn't match
    bound_box/evaluated-mesh range at all). Reading m.data directly for a
    per-face box selection picks up the WRONG (garbled) positions. Bake the
    evaluated (deformed) positions into the base mesh, then drop the
    modifier/parent so it isn't deformed a second time - and re-attach where
    the armature was (its own parent), not to None, or the scale/placement
    set on that parent stops reaching this mesh at all."""
    dg = bpy.context.evaluated_depsgraph_get()
    eval_obj = obj.evaluated_get(dg)
    eval_mesh = eval_obj.to_mesh()
    if len(eval_mesh.vertices) == len(obj.data.vertices):
        for i, v in enumerate(obj.data.vertices):
            v.co = eval_mesh.vertices[i].co
    eval_obj.to_mesh_clear()
    obj.data.update()
    for mod in list(obj.modifiers):
        if mod.type == 'ARMATURE':
            obj.modifiers.remove(mod)
    if obj.parent is not None and obj.parent.type == 'ARMATURE':
        armature = obj.parent
        new_parent = armature.parent
        if new_parent is not None:
            obj.matrix_parent_inverse = new_parent.matrix_world.inverted()
        obj.parent = new_parent


def bbox_world(objs):
    mn = Vector((1e9, 1e9, 1e9))
    mx = Vector((-1e9, -1e9, -1e9))
    for o in objs:
        for c in o.bound_box:
            wc = o.matrix_world @ Vector(c)
            mn.x, mn.y, mn.z = min(mn.x, wc.x), min(mn.y, wc.y), min(mn.z, wc.z)
            mx.x, mx.y, mx.z = max(mx.x, wc.x), max(mx.y, wc.y), max(mx.z, wc.z)
    return mn, mx


def reparent_all_new(pre_existing, root):
    new_objs = [o for o in bpy.context.scene.objects if o not in pre_existing]
    for o in new_objs:
        if o.parent is None:
            o.parent = root
    return new_objs


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

# ---- grafts ----
for i, g in enumerate(cfg["grafts"]):
    pre = set(bpy.context.scene.objects)
    bpy.ops.import_scene.fbx(filepath=g["fbx"])
    donor_new = [o for o in bpy.context.scene.objects if o not in pre]
    donor_meshes = [o for o in donor_new if o.type == "MESH"]
    donor_root = bpy.data.objects.new(f"DonorRoot_{i}_{g['name']}", None)
    bpy.context.scene.collection.objects.link(donor_root)
    for o in donor_new:
        if o.parent is None:
            o.parent = donor_root
    wire_material(donor_meshes, f"Mat_DonorSrc_{i}", g["albedo"], g.get("mgao"), g.get("normal"))

    for m in donor_meshes:
        bake_pose_and_clear_armature(m)
    bpy.context.view_layer.update()

    # 1. normalise the WHOLE donor to the host's own scale (centred at origin)
    bpy.context.view_layer.update()
    d_mn, d_mx = bbox_world(donor_meshes)
    d_center = (d_mn + d_mx) / 2
    d_size = max(d_mx.x - d_mn.x, d_mx.y - d_mn.y, d_mx.z - d_mn.z)
    norm_scale = host_size / d_size if d_size > 0 else 1.0
    donor_root.scale = (norm_scale, norm_scale, norm_scale)
    donor_root.location = (-d_center.x * norm_scale, -d_center.y * norm_scale, -d_center.z * norm_scale)
    bpy.context.view_layer.update()
    d_mn, d_mx = bbox_world(donor_meshes)
    d_half = Vector(((d_mx.x - d_mn.x) / 2, (d_mx.y - d_mn.y) / 2, (d_mx.z - d_mn.z) / 2))

    # 2. cut the chunk: keep only faces whose centroid falls inside the
    #    fractional extraction box (now expressed in host-scale units)
    ex = g["extract"]
    box_mn = Vector((ex["x"][0] * d_half.x, ex["y"][0] * d_half.y, ex["z"][0] * d_half.z))
    box_mx = Vector((ex["x"][1] * d_half.x, ex["y"][1] * d_half.y, ex["z"][1] * d_half.z))
    for m in donor_meshes:
        bm = bmesh.new()
        bm.from_mesh(m.data)
        bm.faces.ensure_lookup_table()
        doomed = []
        for f in bm.faces:
            c = f.calc_center_median()  # in donor-mesh LOCAL space (pre-normalise-scale)
            wc = m.matrix_world @ c      # world space (post-normalise-scale, since donor_root already scaled)
            lc = wc  # host/world space == donor-root-local space here since donor_root is still at world top level pre-mount
            if not (box_mn.x <= lc.x <= box_mx.x and box_mn.y <= lc.y <= box_mx.y and box_mn.z <= lc.z <= box_mx.z):
                doomed.append(f)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(m.data)
        bm.free()
        m.data.update()

    # 3. re-measure the CHUNK (now just the extracted faces) and place it on
    #    the host, embedded into the surface instead of floating above it
    bpy.context.view_layer.update()
    c_mn, c_mx = bbox_world(donor_meshes)
    if c_mn.x > c_mx.x:  # nothing survived the cut
        print(f"WARNING: graft '{g['name']}' extraction box kept zero faces - check extract bounds")
        continue
    c_center = (c_mn + c_mx) / 2
    c_size = max(c_mx.x - c_mn.x, c_mx.y - c_mn.y, c_mx.z - c_mn.z, 1e-6)

    fx, fy, fz = g["mount_frac"]
    embed = g.get("embed", 0.25) * c_size
    world_mount = Vector((
        fx * host_half.x - (embed if fx > 0 else -embed if fx < 0 else 0),
        fy * host_half.y - (embed if fy > 0 else -embed if fy < 0 else 0),
        fz * host_half.z - (embed if fz > 0 else -embed if fz < 0 else 0),
    ))
    local_mount = world_mount - host_root.location  # donor_root will be parented under host_root

    rot = g.get("rot_deg", [0, 0, 0])
    rot_euler = Euler((math.radians(rot[0]), math.radians(rot[1]), math.radians(rot[2])), 'XYZ')

    # donor_root currently holds: normalise_scale/translation (already applied
    # via .scale/.location above). We now ADD the mount placement on top by
    # reparenting under host_root and setting a NEW location/rotation that
    # carries the chunk's current (post-normalise, post-cut) world centre to
    # world_mount. Since donor_root's existing transform already bakes in
    # norm_scale, apply rotation/translation as an extra wrapper: use an
    # intermediate empty so we don't have to re-derive norm_scale algebra.
    wrapper = bpy.data.objects.new(f"GraftMount_{i}_{g['name']}", None)
    bpy.context.scene.collection.objects.link(wrapper)
    donor_root.parent = wrapper
    # keep donor_root's current world transform unchanged when reparenting
    donor_root.matrix_parent_inverse = wrapper.matrix_world.inverted()

    wrapper.rotation_euler = rot_euler
    # donor_root's matrix_basis already carries c_center as a "local-to-wrapper"
    # coordinate (matrix_parent_inverse was identity), so feeding it through
    # wrapper's own rotation+translation and demanding the result land on
    # local_mount gives: wrapper.location = local_mount - rot(c_center).
    wrapper.location = local_mount - (rot_euler.to_matrix() @ Vector(c_center))

    wrapper.parent = host_root

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
