"""Render one vehicle inside Blender: a turntable plus front / back / three-quarter stills.

    blender -b --factory-startup --python render_vehicle.py -- <config.json>

Normally called by build_previews.py, one config per vehicle. Config keys:
    fbx          list of real FBX paths; the first is the base model, the rest are attached parts
    name         vehicle name, used for the material name
    front        the side the vehicle faces: "-Y" (default), "+Y", "+X" or "-X"
    albedo, mgao, normal, emissive   texture PNG paths, or null
    flat_colour  [r, g, b] used when there is no albedo
    turntable    true to write frames_dir/frame_000.png .. frame_NNN.png
    frames_dir   where the turntable frames go
    stills       {"front": path, "back": path, "three_quarter": path}; extra keys
                 "x_pos" / "x_neg" are world-fixed +X / -X views (diagnostics)
    n_frames, gif_px, still_px
"""
import json
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import preview_wiring as PW  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
cfg = json.load(open(argv[0], encoding="utf-8"))

ELEV = 0.12                 # small downward tilt, the same for every view
N_FRAMES = cfg.get("n_frames", 36)
GIF_PX = cfg.get("gif_px", 480)
STILL_PX = cfg.get("still_px", 800)
JUNK_NAMES = ("Cube", "Camera", "Light", "Lamp")   # reference helpers the game's FBX exports carry
# Camera azimuth in degrees (XY plane) that looks straight at the side named by "front".
FRONT_AZ = {"-Y": -90.0, "+Y": 90.0, "+X": 0.0, "-X": 180.0}


# --- scene -----------------------------------------------------------------

bpy.ops.wm.read_factory_settings(use_empty=True)
for path in cfg["fbx"]:
    bpy.ops.import_scene.fbx(filepath=path)

for o in list(bpy.data.objects):
    if o.name.split(".")[0] in JUNK_NAMES or o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh imported for " + cfg["name"])


# --- materials -------------------------------------------------------------

def tex(nt, path, loc, colour_space):
    nd = nt.nodes.new("ShaderNodeTexImage")
    img = bpy.data.images.load(path, check_existing=False)
    img.name = os.path.basename(path)
    img.colorspace_settings.name = colour_space   # data maps must be Non-Color or they decode wrong
    nd.image = img
    nd.location = loc
    return nd


mat = bpy.data.materials.new("Mat_" + cfg["name"])
mat.use_nodes = True
nt = mat.node_tree
for n in list(nt.nodes):
    nt.nodes.remove(n)
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
bsdf.location = (-200, 0)
out = nt.nodes.new("ShaderNodeOutputMaterial")
out.location = (200, 0)
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

if cfg.get("albedo"):
    alb = tex(nt, cfg["albedo"], (-700, 300), "sRGB")
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
else:
    bsdf.inputs["Base Color"].default_value = tuple(cfg.get("flat_colour", [0.4, 0.4, 0.38])) + (1.0,)

if cfg.get("mgao"):
    # Linked to "Specular IOR Level" on purpose: PW.gamelike() finds this link and rewires it
    # to Metallic / Roughness / AO the way the game reads the packed map.
    mga = tex(nt, cfg["mgao"], (-700, 0), "Non-Color")
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])

if cfg.get("normal"):
    nrm = tex(nt, cfg["normal"], (-700, -300), "Non-Color")
    nmap = nt.nodes.new("ShaderNodeNormalMap")
    nmap.location = (-400, -300)
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])

if cfg.get("emissive"):
    emi = tex(nt, cfg["emissive"], (-700, -600), "sRGB")
    nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
    bsdf.inputs["Emission Strength"].default_value = 1.0

PW.gamelike(mat)
for m in meshes:
    m.data.materials.clear()
    m.data.materials.append(mat)


# --- framing ---------------------------------------------------------------

bpy.context.view_layer.update()
lo = Vector((1e9, 1e9, 1e9))
hi = Vector((-1e9, -1e9, -1e9))
for m in meshes:
    corners = [m.matrix_world @ Vector(c) for c in m.bound_box]
    for i in range(3):
        lo[i] = min(lo[i], min(c[i] for c in corners))
        hi[i] = max(hi[i], max(c[i] for c in corners))
centre = (lo + hi) / 2
dx, dy, dz = hi.x - lo.x, hi.y - lo.y, hi.z - lo.z
# Ortho frame big enough for the vehicle from any turntable azimuth.
ortho = 1.1 * max(math.hypot(dx, dy), 1.6 * dz, 0.2)
print("BOUNDS", cfg["name"], round(dx, 3), round(dy, 3), round(dz, 3), "ortho", round(ortho, 3))

world = bpy.data.worlds.new("World")
world.use_nodes = True
bpy.context.scene.world = world
PW.soften_world()                       # neutral grey world; the default bluish 1.8 veils everything

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.0
sun_data.angle = math.radians(3)
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.scene.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

fill_data = bpy.data.lights.new("Fill", type="AREA")
fill_data.energy = 120.0
fill_data.size = 3.0
fill = bpy.data.objects.new("Fill", fill_data)
bpy.context.scene.collection.objects.link(fill)
fill.location = (-1.6, -2.2, 1.6)
fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))

cam_data = bpy.data.cameras.new("PreviewCam")
cam_data.type = "ORTHO"
cam_data.ortho_scale = ortho
cam_data.clip_end = 1000.0
cam = bpy.data.objects.new("PreviewCam", cam_data)
bpy.context.scene.collection.objects.link(cam)
bpy.context.scene.camera = cam
DIST = ortho * 3.0


def place(az_deg):
    a = math.radians(az_deg)
    v = Vector((math.cos(a), math.sin(a), ELEV)).normalized()
    cam.location = centre + v * DIST
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()


def setup_render(px):
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"      # Blender 5.x: no BLENDER_EEVEE_NEXT name
    sc.render.resolution_x = px
    sc.render.resolution_y = px
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"
    sc.render.image_settings.file_format = "PNG"


def render_to(path):
    bpy.context.scene.render.filepath = os.path.abspath(path)
    bpy.ops.render.render(write_still=True)


# --- render ----------------------------------------------------------------

front_az = FRONT_AZ[cfg.get("front", "-Y")]

setup_render(GIF_PX)
if cfg.get("turntable", True):
    os.makedirs(cfg["frames_dir"], exist_ok=True)
    for i in range(N_FRAMES):
        place(front_az + i * 360.0 / N_FRAMES)       # frame 0 starts facing the camera at the front
        bpy.context.scene.render.filepath = os.path.join(cfg["frames_dir"], "frame_%03d.png" % i)
        bpy.ops.render.render(write_still=True)

STILL_AZ = {
    "front": front_az,
    "back": front_az + 180.0,
    "three_quarter": front_az + 45.0,
    "x_pos": 0.0,
    "x_neg": 180.0,
}
setup_render(STILL_PX)
for view, path in cfg["stills"].items():
    place(STILL_AZ[view])
    render_to(path)
    print("RENDERED", view, path)

print("DONE", cfg["name"])
