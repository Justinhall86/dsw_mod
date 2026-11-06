"""Make a game-budget, textured starport from the untextured Meshy mesh.

Steps: decimate, unwrap, bake normal and AO from the high mesh, then paint the albedo by projecting
the colour reference from the view found by 01_fit_camera.py. Surfaces the reference does not show
get a charcoal and copper fill built from the reference's own colours.

Run: blender --background --disable-autoexec <input.blend> --python 02_build_game_mesh.py -- <project> [target_tris]
"""
import json
import math
import os
import sys

import bpy
import mathutils
import numpy as np

args = sys.argv[sys.argv.index("--") + 1:]
PROJECT = args[0]
TARGET_TRIS = int(args[1]) if len(args) > 1 else 15000
TEX = 2048
TEXDIR = os.path.join(PROJECT, "04_textures")
VIEW = json.load(open(os.path.join(PROJECT, "08_scripts", "camera.json")))
os.makedirs(TEXDIR, exist_ok=True)

scene = bpy.context.scene
high = bpy.data.objects["mesh_node"]
high.name = "Starport_High"

# ---- low poly ----
low = high.copy()
low.data = high.data.copy()
low.name = "Thorvald_Starport"
low.data.name = "Thorvald_Starport"
scene.collection.objects.link(low)
bpy.ops.object.select_all(action="DESELECT")
low.select_set(True)
bpy.context.view_layer.objects.active = low
mod = low.modifiers.new("dec", "DECIMATE")
mod.ratio = TARGET_TRIS / len(high.data.polygons)
bpy.ops.object.modifier_apply(modifier=mod.name)
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(55), island_margin=0.001)
bpy.ops.uv.select_all(action="SELECT")
bpy.ops.uv.pack_islands(rotate=True, margin_method="FRACTION", margin=0.002, shape_method="CONCAVE")
bpy.ops.object.mode_set(mode="OBJECT")
bpy.ops.object.shade_smooth_by_angle(angle=math.radians(40))
tris = sum(len(p.vertices) - 2 for p in low.data.polygons)
print("@@low tris", tris, "verts", len(low.data.vertices))

# ---- bake normal and AO from high ----
scene.render.engine = "CYCLES"
scene.cycles.device = "CPU"
scene.cycles.samples = 16


def bake(name, kind, colorspace, **kw):
    img = bpy.data.images.new(name, TEX, TEX, alpha=False)
    img.colorspace_settings.name = colorspace
    mat = low.active_material
    nodes = mat.node_tree.nodes
    node = nodes.new("ShaderNodeTexImage")
    node.image = img
    nodes.active = node
    bpy.ops.object.select_all(action="DESELECT")
    high.select_set(True)
    low.select_set(True)
    bpy.context.view_layer.objects.active = low
    bpy.ops.object.bake(type=kind, use_selected_to_active=True, cage_extrusion=0.02,
                        max_ray_distance=0.04, margin=8, **kw)
    nodes.remove(node)
    return img


mat = bpy.data.materials.new("Mat_Thorvald_Starport")
mat.use_nodes = True
low.data.materials.clear()
low.data.materials.append(mat)
high.data.materials.clear()
high.data.materials.append(bpy.data.materials.new("High"))
high.data.materials[0].use_nodes = True
normal_img = bake("Thorvald_Starport_Normal", "NORMAL", "Non-Color")
ao_img = bake("Thorvald_Starport_AO", "AO", "Non-Color")
ao = np.array(ao_img.pixels[:], dtype=np.float32).reshape(TEX, TEX, 4)[:, :, 0]

# ---- position and normal per texel ----
mesh = low.data
mesh.calc_loop_triangles()
n_tris = len(mesh.loop_triangles)
loops = np.zeros(n_tris * 3, dtype=np.int32)
mesh.loop_triangles.foreach_get("loops", loops)
verts = np.zeros(n_tris * 3, dtype=np.int32)
mesh.loop_triangles.foreach_get("vertices", verts)
uv_all = np.zeros(len(mesh.loops) * 2, dtype=np.float32)
mesh.uv_layers.active.data.foreach_get("uv", uv_all)
uv = uv_all.reshape(-1, 2)[loops].reshape(-1, 3, 2)
co = np.zeros(len(mesh.vertices) * 3, dtype=np.float32)
mesh.vertices.foreach_get("co", co)
world = np.array(low.matrix_world, dtype=np.float32)
co = co.reshape(-1, 3) @ world[:3, :3].T + world[:3, 3]
tri_pos = co[verts].reshape(-1, 3, 3)
edge_a, edge_b = tri_pos[:, 1] - tri_pos[:, 0], tri_pos[:, 2] - tri_pos[:, 0]
tri_n = np.cross(edge_a, edge_b)
tri_n /= np.maximum(np.linalg.norm(tri_n, axis=1, keepdims=True), 1e-9)

all_pts = np.zeros(len(high.data.vertices) * 3, dtype=np.float32)
high.data.vertices.foreach_get("co", all_pts)
all_pts = all_pts.reshape(-1, 3)
# the same centre the camera fit used: its face samples span the mesh bounds
centre = (all_pts.max(axis=0) + all_pts.min(axis=0)) / 2


def view_axes():
    a, e, r = map(math.radians, (VIEW["az"], VIEW["el"], VIEW["roll"]))
    fwd = -np.array((math.cos(a) * math.cos(e), math.sin(a) * math.cos(e), math.sin(e)))
    right = np.cross(fwd, (0, 0, 1))
    right /= np.linalg.norm(right)
    up = np.cross(right, fwd)
    return right * math.cos(r) + up * math.sin(r), -right * math.sin(r) + up * math.cos(r), fwd


X_AX, Y_AX, FWD = view_axes()


def project(points):
    p = points - centre
    return (p @ X_AX * VIEW["scale"] + 0.5 + VIEW["dx"],
            0.5 - p @ Y_AX * VIEW["scale"] + VIEW["dy"],
            p @ FWD)


def raster(points2d, size, emit):
    """Call emit(tri, ys, xs, w0, w1, w2) for the pixels of each triangle (points2d in 0..1)."""
    px = points2d * size
    for t in range(len(px)):
        a, b, c = px[t]
        x0, x1 = int(max(min(a[0], b[0], c[0]) - 1, 0)), int(min(max(a[0], b[0], c[0]) + 2, size))
        y0, y1 = int(max(min(a[1], b[1], c[1]) - 1, 0)), int(min(max(a[1], b[1], c[1]) + 2, size))
        if x0 >= x1 or y0 >= y1:
            continue
        area = (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])
        if abs(area) < 1e-9:
            continue
        ys, xs = np.mgrid[y0:y1, x0:x1]
        fx, fy = xs + 0.5, ys + 0.5
        w1 = ((fx - a[0]) * (c[1] - a[1]) - (fy - a[1]) * (c[0] - a[0])) / area
        w2 = ((b[0] - a[0]) * (fy - a[1]) - (b[1] - a[1]) * (fx - a[0])) / area
        w0 = 1 - w1 - w2
        inside = (w0 >= -0.02) & (w1 >= -0.02) & (w2 >= -0.02)
        if inside.any():
            emit(t, ys[inside], xs[inside], w0[inside], w1[inside], w2[inside])


# depth from the reference's view, so hidden surfaces do not take the paint in front of them
DEPTH_SIZE = 1400
depth = np.full((DEPTH_SIZE, DEPTH_SIZE), np.inf, dtype=np.float32)
u, v, d = project(tri_pos.reshape(-1, 3))
tri_view = np.stack((u, v), axis=1).reshape(-1, 3, 2)
tri_depth = d.reshape(-1, 3)


def depth_emit(t, ys, xs, w0, w1, w2):
    z = tri_depth[t, 0] * w0 + tri_depth[t, 1] * w1 + tri_depth[t, 2] * w2
    np.minimum.at(depth, (ys, xs), z)


raster(tri_view, DEPTH_SIZE, depth_emit)

pos = np.zeros((TEX, TEX, 3), dtype=np.float32)
nor = np.zeros((TEX, TEX, 3), dtype=np.float32)
covered = np.zeros((TEX, TEX), dtype=bool)


def texel_emit(t, ys, xs, w0, w1, w2):
    pos[ys, xs] = (tri_pos[t, 0][None] * w0[:, None] + tri_pos[t, 1][None] * w1[:, None]
                   + tri_pos[t, 2][None] * w2[:, None])
    nor[ys, xs] = tri_n[t]
    covered[ys, xs] = True


raster(uv, TEX, texel_emit)

# ---- paint ----
ref = bpy.data.images.load(os.path.join(PROJECT, "01_input", "colour_reference.jpg"))
rw, rh = ref.size
ref_px = np.array(ref.pixels[:], dtype=np.float32).reshape(rh, rw, 4)[::-1, :, :3]
lit = ref_px.max(axis=2) > 0.06
is_copper = lit & (ref_px[:, :, 0] > ref_px[:, :, 2] * 1.5)
copper = np.median(ref_px[is_copper & (ref_px[:, :, 0] < 0.8)], axis=0)
charcoal = np.median(ref_px[lit & ~is_copper], axis=0)
print("@@palette copper", copper.round(3), "charcoal", charcoal.round(3))

iy, ix = np.nonzero(covered)
p, n = pos[iy, ix], nor[iy, ix]
pu, pv, pd = project(p)
du = np.clip((pu * DEPTH_SIZE).astype(int), 0, DEPTH_SIZE - 1)
dv = np.clip((pv * DEPTH_SIZE).astype(int), 0, DEPTH_SIZE - 1)
ru = np.clip((pu * rw).astype(int), 0, rw - 1)
rv = np.clip((pv * rh).astype(int), 0, rh - 1)
facing = (n @ -FWD) > 0.25
front = pd <= depth[dv, du] + 0.03
painted = ref_px[rv, ru]
visible = facing & front & (painted.max(axis=1) > 0.06)
print("@@texels %d, from the reference %.1f%%" % (len(p), 100 * visible.mean()))

# the fill: charcoal plate, copper bands on walls, copper undersides, darkened by AO
rng = np.random.default_rng(3)
fill = np.tile(charcoal, (len(p), 1))
wall = np.abs(n[:, 2]) < 0.5
bands = np.sin(p[:, 2] * 34.0) > 0.72
fill[wall & bands] = copper
fill[n[:, 2] < -0.4] = copper * 0.55
fill *= (0.92 + 0.16 * rng.random((len(p), 1)))
fill *= (0.45 + 0.55 * ao[iy, ix])[:, None]
color = np.where(visible[:, None], painted, fill)

albedo = np.zeros((TEX, TEX, 4), dtype=np.float32)
albedo[..., 3] = 1
albedo[iy, ix, :3] = color

# metal, gloss, AO and glow, read off the painted colour
hot = visible & (color[:, 0] > 0.75) & (color[:, 1] > 0.38) & (color[:, 2] < 0.45)
coppery = color[:, 0] > color[:, 2] * 1.5
mga = np.zeros((TEX, TEX, 4), dtype=np.float32)
mga[..., 3] = 1
mga[iy, ix, 0] = np.where(coppery, 0.9, 0.55)
mga[iy, ix, 1] = np.where(coppery, 0.5, 0.32)
mga[..., 2] = ao
glow = np.zeros((TEX, TEX), dtype=np.float32)
glow[iy[hot], ix[hot]] = 1.0
print("@@glowing texels %.2f%%" % (100 * hot.mean()))


def dilate(rgba, mask, rounds=8):
    """Grow the painted texels into the gaps, so mip maps do not bleed black along the seams."""
    out, have = rgba.copy(), mask.copy()
    for _ in range(rounds):
        grown = have.copy()
        for axis, step in ((0, 1), (0, -1), (1, 1), (1, -1)):
            src = np.roll(have, step, axis) & ~grown
            out[src] = np.roll(out, step, axis)[src]
            grown |= src
        have = grown
    return out


def save(name, rgba, colorspace):
    img = bpy.data.images.new(name, TEX, TEX, alpha=False)
    img.colorspace_settings.name = colorspace
    img.pixels.foreach_set(rgba.ravel())
    img.filepath_raw = os.path.join(TEXDIR, name + ".png")
    img.file_format = "PNG"
    img.save()
    return img


albedo_img = save("Thorvald_Starport_Albedo", dilate(albedo, covered), "sRGB")
mga_img = save("Thorvald_Starport_MetallicGlossAO", dilate(mga, covered), "Non-Color")
glow_rgba = np.zeros((TEX, TEX, 4), dtype=np.float32)
glow_rgba[..., 0], glow_rgba[..., 1], glow_rgba[..., 2], glow_rgba[..., 3] = glow, glow, glow, 1
glow_img = save("Thorvald_Starport_Glow", glow_rgba, "Non-Color")
normal_img.filepath_raw = os.path.join(TEXDIR, "Thorvald_Starport_Normal.png")
normal_img.file_format = "PNG"
normal_img.save()

# ---- preview material, matte like the game ----
nt = mat.node_tree
nt.nodes.clear()
out = nt.nodes.new("ShaderNodeOutputMaterial")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
nt.links.new(bsdf.outputs[0], out.inputs[0])


def tex(img):
    node = nt.nodes.new("ShaderNodeTexImage")
    node.image = img
    return node


base, spec, nrm, lamp = tex(albedo_img), tex(mga_img), tex(normal_img), tex(glow_img)
nt.links.new(base.outputs[0], bsdf.inputs["Base Color"])
split = nt.nodes.new("ShaderNodeSeparateColor")
nt.links.new(spec.outputs[0], split.inputs[0])
nt.links.new(split.outputs[0], bsdf.inputs["Metallic"])
invert = nt.nodes.new("ShaderNodeMath")
invert.operation = "SUBTRACT"
invert.inputs[0].default_value = 1
nt.links.new(split.outputs[1], invert.inputs[1])
nt.links.new(invert.outputs[0], bsdf.inputs["Roughness"])
nmap = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(nrm.outputs[0], nmap.inputs["Color"])
nt.links.new(nmap.outputs[0], bsdf.inputs["Normal"])
nt.links.new(base.outputs[0], bsdf.inputs["Emission Color"])
nt.links.new(lamp.outputs[0], bsdf.inputs["Emission Strength"])

high.hide_render = True
high.hide_viewport = True
high.hide_set(True)

# ---- renders ----
scene.render.engine = "BLENDER_EEVEE"
scene.render.resolution_x = scene.render.resolution_y = 1000
scene.render.image_settings.file_format = "PNG"
world_data = bpy.data.worlds.new("Preview")
scene.world = world_data
world_data.use_nodes = True
background = world_data.node_tree.nodes["Background"]
background.inputs[0].default_value = (0.35, 0.33, 0.31, 1)
background.inputs[1].default_value = 0.9
cam_data = bpy.data.cameras.new("Cam")
cam_data.type = "ORTHO"
cam_obj = bpy.data.objects.new("Cam", cam_data)
scene.collection.objects.link(cam_obj)
scene.camera = cam_obj
sun_data = bpy.data.lights.new("Sun", "SUN")
sun_data.energy = 3.5
sun_obj = bpy.data.objects.new("Sun", sun_data)
scene.collection.objects.link(sun_obj)
sun_obj.rotation_euler = (math.radians(45), 0, math.radians(-30))
centre_v = mathutils.Vector(centre.tolist())
photos = os.path.join(PROJECT, "02_progress_photos")
os.makedirs(photos, exist_ok=True)
cam_data.ortho_scale = 2.4
for name, az, el in (("reference_view", VIEW["az"], VIEW["el"]), ("front_right", 300, 30),
                     ("back_left", 110, 30), ("back_right", 30, 30), ("top", 246, 80)):
    a, e = math.radians(az), math.radians(el)
    cam_obj.location = centre_v + mathutils.Vector(
        (math.cos(a) * math.cos(e), math.sin(a) * math.cos(e), math.sin(e))) * 6
    cam_obj.rotation_euler = (centre_v - cam_obj.location).to_track_quat("-Z", "Y").to_euler()
    scene.render.filepath = os.path.join(photos, "starport_" + name + ".png")
    bpy.ops.render.render(write_still=True)

for img in (albedo_img, mga_img, normal_img, glow_img):
    img.pack()
blend = os.path.join(PROJECT, "03_blender", "Thorvald_Starport_v1.blend")
os.makedirs(os.path.dirname(blend), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=blend)
print("@@saved", blend)
