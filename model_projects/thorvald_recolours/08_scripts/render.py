"""Render one vehicle with per-material-slot textures (bpy module, not the Blender exe).

    python3 render.py <config.json>

Same lights, world, camera and MetallicGlossAO wiring as the dsw-vehicle-preview skill's
render_vehicle.py, but each material slot keeps its own texture set (Harvester body + tracks,
Ornithopter body + glass) and the emissive map is masked by its alpha channel.
config: fbx, name, front, slots{mat_name: {albedo, mgao, normal, emissive} | "glass"},
        stills{view: path}, px, gif (path or null), frames_dir
"""
import json
import math
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, "/home/user/dsw_mod/.claude/skills/dsw-vehicle-preview/scripts")
import preview_wiring as PW  # noqa: E402

cfg = json.load(open(sys.argv[1], encoding="utf-8"))
FRONT_AZ = {"-Y": -90.0, "+Y": 90.0, "+X": 0.0, "-X": 180.0}
ELEV = 0.12

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=cfg["fbx"])
for o in list(bpy.data.objects):
    if o.name.split(".")[0] in ("Cube", "Camera", "Light", "Lamp") or o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]


def tex(nt, path, colour_space):
    nd = nt.nodes.new("ShaderNodeTexImage")
    img = bpy.data.images.load(path, check_existing=False)
    img.colorspace_settings.name = colour_space
    nd.image = img
    return nd


def build(name, t):
    mat = bpy.data.materials.new("Prev_" + name)
    mat.use_nodes = True
    nt = mat.node_tree
    bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
    if t == "glass":
        bsdf.inputs["Base Color"].default_value = (0.03, 0.035, 0.04, 1.0)
        bsdf.inputs["Roughness"].default_value = 0.15
        bsdf.inputs["Specular IOR Level"].default_value = 0.6
        return mat
    alb = tex(nt, t["albedo"], "sRGB")
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    if t.get("mgao"):
        nt.links.new(tex(nt, t["mgao"], "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if t.get("normal"):
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(tex(nt, t["normal"], "Non-Color").outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
    if t.get("emissive"):
        e = tex(nt, t["emissive"], "sRGB")
        mul = nt.nodes.new("ShaderNodeMix")
        mul.data_type = "RGBA"
        mul.blend_type = "MULTIPLY"
        mul.inputs["Factor"].default_value = 1.0
        nt.links.new(e.outputs["Color"], mul.inputs["A"])
        nt.links.new(e.outputs["Alpha"], mul.inputs["B"])
        nt.links.new(mul.outputs["Result"], bsdf.inputs["Emission Color"])
        bsdf.inputs["Emission Strength"].default_value = 1.5
    PW.gamelike(mat)
    return mat


for m in meshes:
    for slot in m.material_slots:
        key = slot.material.name.split(".")[0] if slot.material else None
        if key not in cfg["slots"]:
            raise SystemExit("unmapped material slot %r" % key)
        slot.material = build(key, cfg["slots"][key])

bpy.context.view_layer.update()
lo = Vector((1e9,) * 3)
hi = Vector((-1e9,) * 3)
for m in meshes:
    for c in m.bound_box:
        w = m.matrix_world @ Vector(c)
        for i in range(3):
            lo[i] = min(lo[i], w[i])
            hi[i] = max(hi[i], w[i])
centre = (lo + hi) / 2
dx, dy, dz = hi - lo
ortho = cfg.get("zoom", 1.0) * 1.1 * max(math.hypot(dx, dy), 1.6 * dz, 0.2)

world = bpy.data.worlds.new("World")
world.use_nodes = True
bpy.context.scene.world = world
PW.soften_world()
sun_d = bpy.data.lights.new("Sun", type="SUN")
sun_d.energy = 3.0
sun_d.angle = math.radians(3)
sun = bpy.data.objects.new("Sun", sun_d)
bpy.context.scene.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
fill_d = bpy.data.lights.new("Fill", type="AREA")
fill_d.energy = 120.0
fill_d.size = 3.0
fill = bpy.data.objects.new("Fill", fill_d)
bpy.context.scene.collection.objects.link(fill)
fill.location = (-1.6, -2.2, 1.6)
fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))

cam_d = bpy.data.cameras.new("Cam")
cam_d.type = "ORTHO"
cam_d.ortho_scale = ortho
cam_d.clip_end = 1000.0
cam = bpy.data.objects.new("Cam", cam_d)
bpy.context.scene.collection.objects.link(cam)
sc = bpy.context.scene
sc.camera = cam
sc.render.engine = "CYCLES"          # no GPU/EGL in this container; EEVEE cannot start
sc.cycles.device = "CPU"
sc.cycles.samples = cfg.get("samples", 48)
sc.cycles.use_denoising = True
sc.render.film_transparent = False
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"


def place(az, elev=ELEV):
    a = math.radians(az)
    v = Vector((math.cos(a), math.sin(a), elev)).normalized()
    cam.location = centre + v * ortho * 3.0
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()


def shoot(path, px):
    sc.render.resolution_x = sc.render.resolution_y = px
    sc.render.filepath = os.path.abspath(path)
    bpy.ops.render.render(write_still=True)


faz = FRONT_AZ[cfg["front"]]
VIEWS = {"front": (0, ELEV), "back": (180, ELEV), "three_quarter": (45, 0.35), "side": (90, ELEV)}
for view, path in cfg["stills"].items():
    off, el = VIEWS[view]
    place(faz + off, el)
    shoot(path, cfg.get("px", 800))
if cfg.get("frames_dir"):
    os.makedirs(cfg["frames_dir"], exist_ok=True)
    for i in range(36):
        place(faz + i * 10.0, 0.3)
        shoot(os.path.join(cfg["frames_dir"], "frame_%03d.png" % i), 480)
print("DONE", cfg["name"])
