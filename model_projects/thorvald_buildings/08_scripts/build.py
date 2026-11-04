"""Build one Thorvald building, save .blend + FBX, render stills (+ turntable frames).

    python3 build.py <Name> [--gif]

Outputs (relative to the project folder):
    03_blender/Thorvald_<Name>.blend       materials kept, emblem image packed
    05_fbx_export/Thorvald_<Name>.fbx
    02_progress_photos/<Name>_{front,three_quarter,back,side}.png
    02_progress_photos/<Name>_turntable.gif   (with --gif)
Preview-only extras (sand ground, lights, camera) are added AFTER the model files are saved.
"""
import glob
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import kit as K          # noqa: E402
import buildings as B    # noqa: E402

PROJ = os.path.dirname(HERE)
name = sys.argv[1]
GIF = "--gif" in sys.argv
FAST = "--fast" in sys.argv
PX = 480 if FAST else 720

K.reset()
B.BUILDINGS[name]()
ob = K.join_all("Thorvald_" + name)
tris = K.tri_count(ob)
bpy.context.view_layer.update()
dim = ob.dimensions
print("MODEL", name, "tris", tris, "dims", [round(d, 1) for d in dim], "materials", len(ob.data.materials))

bpy.ops.file.pack_all()
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "Thorvald_%s.blend" % name))
for o in bpy.context.view_layer.objects:
    o.select_set(o == ob)
bpy.ops.export_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "Thorvald_%s.fbx" % name),
                         use_selection=True, apply_scale_options="FBX_SCALE_ALL", path_mode="COPY", embed_textures=True)

# ---- preview-only scene dressing
sc = bpy.context.scene
gm = bpy.data.materials.new("PreviewSand")
gm.use_nodes = True
gb = next(n for n in gm.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
gb.inputs["Base Color"].default_value = K.lin("#B39A72")
gb.inputs["Roughness"].default_value = 0.95
bpy.ops.mesh.primitive_plane_add(size=300, location=(0, 0, -0.01))
ground = bpy.context.active_object
ground.data.materials.append(gm)

centre = Vector((0, 0, dim.z * 0.38))
span = max(math.hypot(dim.x, dim.y), dim.z * 1.5)
ortho = 1.18 * span

w = bpy.data.worlds.new("W")
w.use_nodes = True
sc.world = w
bg = w.node_tree.nodes["Background"]
bg.inputs[0].default_value = (0.62, 0.64, 0.68, 1.0)
bg.inputs[1].default_value = 1.0
sun_d = bpy.data.lights.new("Sun", "SUN")
sun_d.energy = 3.6
sun_d.angle = math.radians(3)
sun = bpy.data.objects.new("Sun", sun_d)
sc.collection.objects.link(sun)
sun.rotation_euler = (math.radians(52), math.radians(8), math.radians(-38))
cam_d = bpy.data.cameras.new("Cam")
cam_d.type = "ORTHO"
cam_d.ortho_scale = ortho
cam_d.clip_end = 1000
cam = bpy.data.objects.new("Cam", cam_d)
sc.collection.objects.link(cam)
sc.camera = cam
sc.render.engine = "CYCLES"
sc.cycles.device = "CPU"
sc.cycles.samples = 14 if FAST else 40
sc.cycles.use_denoising = True
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"


def place(az_deg, elev=0.5):
    a = math.radians(az_deg)
    v = Vector((math.cos(a), math.sin(a), elev)).normalized()
    cam.location = centre + v * ortho * 3
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()


def shoot(path, px):
    sc.render.resolution_x = sc.render.resolution_y = px
    sc.render.filepath = path
    bpy.ops.render.render(write_still=True)


out = os.path.join(PROJ, "02_progress_photos", "_fast") if FAST else os.path.join(PROJ, "02_progress_photos")
os.makedirs(out, exist_ok=True)
VIEWS = (("three_quarter", -50, 0.5), ("front", -90, 0.32), ("back", 90, 0.4), ("side", 0, 0.4))
for view, az, el in (VIEWS[:1] if FAST else VIEWS):
    place(az, el)
    shoot(os.path.join(out, "%s_%s.png" % (name, view)), PX)
if GIF:
    fdir = os.path.join(os.environ.get("TB_FRAMES", "/tmp"), "tb_frames", name)
    os.makedirs(fdir, exist_ok=True)
    sc.cycles.samples = 24
    for i in range(24):
        place(-50 + i * 15.0, 0.5)
        shoot(os.path.join(fdir, "frame_%03d.png" % i), 420)
print("DONE", name)
