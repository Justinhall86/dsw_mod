"""Turntable + fly-by GIFs of the Thorvald cruiser with the Chronos reactor flare (cyan 0,0.9,1; the
real Fx/Meshes_Common/ReactorTriangle(+_Tube) meshes, placed in each engine bell).

    blender -b 03_blender/cruiser_turrets.blend --python 74_gifs.py -- <outdir> [turntable|fly|both]
    python 74_gifs.py <outdir>          (outside Blender: assemble the GIFs from the frames)
"""
import math, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
FLY_N, TURN_N = 60, 36

if "bpy" not in sys.modules and "--" not in sys.argv:
    # ---------------------------------------------------------------- GIF assembly (plain Python)
    from PIL import Image
    import glob
    out = os.path.abspath(sys.argv[1])
    for name, ms in (("turntable", 70), ("fly", 50)):
        fr = sorted(glob.glob(os.path.join(out, name, "f_*.png")))
        if not fr:
            continue
        ims = [Image.open(p).convert("RGB") for p in fr]
        pal = ims[len(ims) // 2].quantize(colors=255, method=Image.Quantize.MEDIANCUT)
        q = [im.quantize(palette=pal, dither=Image.Dither.NONE) for im in ims]
        p = os.path.join(out, "Thorvald_Cruiser_%s.gif" % name)
        q[0].save(p, save_all=True, append_images=q[1:], duration=ms, loop=0, optimize=False)
        print("GIF", p, len(q), "frames")
    sys.exit(0)

import bpy
from mathutils import Matrix, Vector, Euler

sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(argv[0])
mode = argv[1] if len(argv) > 1 else "both"
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
FXM = os.path.join(R, "model_inputs", "Fx", "Meshes_Common", "preview_obj")
CYAN = (0.0, 0.9019607843137255, 1.0)

for m in bpy.data.materials:
    if m.use_nodes:
        pw.gamelike(m)

# ---------------------------------------------------------------- ship rig: everything under one empty
ship = bpy.data.objects.new("SHIP", None); bpy.context.scene.collection.objects.link(ship)
parts = [o for o in bpy.data.objects if o.type == "MESH"]
for o in parts:
    o.parent = ship


def emission_mat(name, strength, alpha, fade_axis=None):
    m = bpy.data.materials.new(name); m.use_nodes = True
    try:
        m.surface_render_method = "BLENDED"
    except AttributeError:
        m.blend_method = "BLEND"
    nt = m.node_tree; nt.nodes.clear()
    o = nt.nodes.new("ShaderNodeOutputMaterial")
    em = nt.nodes.new("ShaderNodeEmission"); em.inputs["Color"].default_value = (*CYAN, 1); em.inputs["Strength"].default_value = strength
    tr = nt.nodes.new("ShaderNodeBsdfTransparent")
    mix = nt.nodes.new("ShaderNodeMixShader")
    tc = nt.nodes.new("ShaderNodeTexCoord")
    grad = nt.nodes.new("ShaderNodeTexGradient")
    ramp = nt.nodes.new("ShaderNodeValToRGB")
    if fade_axis is None:                    # radial: bright core (circGrad, inverted)
        grad.gradient_type = "SPHERICAL"
        mp = nt.nodes.new("ShaderNodeMapping"); mp.inputs["Scale"].default_value = (1.4, 1.1, 1.0)
        nt.links.new(tc.outputs["Object"], mp.inputs["Vector"]); nt.links.new(mp.outputs["Vector"], grad.inputs["Vector"])
    else:                                    # along the tube: strong at the nozzle, gone at the end
        grad.gradient_type = "LINEAR"
        mp = nt.nodes.new("ShaderNodeMapping"); mp.inputs["Rotation"].default_value = (0, math.radians(90), 0)
        mp.inputs["Scale"].default_value = (1 / 1.7, 1, 1)
        nt.links.new(tc.outputs["Object"], mp.inputs["Vector"]); nt.links.new(mp.outputs["Vector"], grad.inputs["Vector"])
    nt.links.new(grad.outputs["Fac"], ramp.inputs["Fac"])
    ramp.color_ramp.elements[0].color = (0, 0, 0, 1); ramp.color_ramp.elements[1].color = (alpha, alpha, alpha, 1)
    nt.links.new(ramp.outputs["Color"], mix.inputs["Fac"])
    nt.links.new(tr.outputs[0], mix.inputs[1]); nt.links.new(em.outputs[0], mix.inputs[2])
    nt.links.new(mix.outputs[0], o.inputs["Surface"])
    return m, em


def load_obj(path, name):
    before = set(bpy.data.objects)
    bpy.ops.wm.obj_import(filepath=path, forward_axis="Y", up_axis="Z")
    o = [x for x in bpy.data.objects if x not in before][0]; o.name = name
    return o


# local x -> -Y, local y -> +Z, local z -> -X  (plate faces aft, tube trails behind the ship, +X)
ORIENT = Matrix(((0, 0, -1, 0), (-1, 0, 0, 0), (0, 1, 0, 0), (0, 0, 0, 1)))
disc_mat, disc_em = emission_mat("reactor_plate", 7.0, 1.0)
tube_mat, tube_em = emission_mat("reactor_tube", 4.0, 0.45, fade_axis="z")
ENGINES = [(80.2, 15.3, 0.6), (80.2, -15.3, 0.6)]
S = 6.0
tubes = []
for i, (x, y, z) in enumerate(ENGINES):
    for k, (alpha_scale, dx) in enumerate(((1.0, 0.0), (0.2, -0.2))):          # the FX stacks two plates
        p = load_obj(os.path.join(FXM, "ReactorTriangle.obj"), "reactor_%d_%d" % (i, k))
        p.data.transform(ORIENT); p.data.materials.clear(); p.data.materials.append(disc_mat)
        p.location = (x + dx, y, z); p.scale = (S * 1.35,) * 3; p.rotation_euler = (math.pi / 2, 0, 0); p.parent = ship
    t = load_obj(os.path.join(FXM, "ReactorTriangle_Tube.obj"), "reactor_tube_%d" % i)
    t.data.materials.clear(); t.data.materials.append(tube_mat)
    t.data.transform(ORIENT)
    t.location = (x, y, z); t.scale = (S * 0.9, S * 0.9, S * 0.9); t.rotation_euler = (math.pi / 2, 0, 0); t.parent = ship
    tubes.append(t)
light_c = bpy.data.lights.new("engine_glow", "POINT"); light_c.color = CYAN; light_c.energy = 6000
lo = bpy.data.objects.new("engine_glow", light_c); lo.location = (92, 0, 2); lo.parent = ship
bpy.context.scene.collection.objects.link(lo)
for t in tubes:
    pass


def flicker(f):
    a = 1.0 + 0.12 * math.sin(f * 2.3) + 0.06 * math.sin(f * 5.7)
    for t in tubes:
        t.scale = (S * 0.9, S * 0.9 * (0.5 + 0.5 * a), S * 0.9)       # length = local y after ORIENT? see below
    tube_em.inputs["Strength"].default_value = 4.0 * a
    disc_em.inputs["Strength"].default_value = 7.0 * (0.92 + 0.08 * a)


# the tube's length runs along local z of the source mesh, which ORIENT mapped onto -X; object scale
# acts on the transformed mesh, so stretch the object's X to lengthen the trail.
def flicker(f):  # noqa: F811
    a = 1.0 + 0.12 * math.sin(f * 2.3) + 0.06 * math.sin(f * 5.7)
    for t in tubes:
        t.scale = (S * 0.9 * 0.5 * (1.6 + 0.6 * (a - 1) * 4), S * 0.9, S * 0.9)
    tube_em.inputs["Strength"].default_value = 4.0 * a
    disc_em.inputs["Strength"].default_value = 7.0 * (0.92 + 0.08 * a)


sc = bpy.context.scene
bs.setup_lights()
pw.soften_world()

# ---------------------------------------------------------------- turntable
if mode in ("turntable", "both"):
    bs.setup_render(720, 540)
    bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
    cam = bs.setup_camera(target=Vector((0, 0, 0)), ortho_scale=230, distance=600)
    cam.location = Vector((-0.75, -0.75, 0.55)).normalized() * 600
    cam.rotation_euler = (-cam.location).to_track_quat("-Z", "Y").to_euler()
    os.makedirs(os.path.join(out, "turntable"), exist_ok=True)
    for f in range(TURN_N):
        ship.rotation_euler = (0, 0, 2 * math.pi * f / TURN_N)
        flicker(f)
        bs.render_to(os.path.join(out, "turntable", "f_%03d.png" % f), cam)
    ship.rotation_euler = (0, 0, 0)

# ---------------------------------------------------------------- fly-by over sand
if mode in ("fly", "both"):
    bs.setup_render(800, 520)
    bpy.ops.mesh.primitive_plane_add(size=6000, location=(0, 0, -60))
    ground = bpy.context.active_object
    gm = bpy.data.materials.new("sand"); gm.use_nodes = True; nt = gm.node_tree
    bsdf = nt.nodes.get("Principled BSDF"); bsdf.inputs["Roughness"].default_value = 0.95
    tc = nt.nodes.new("ShaderNodeTexCoord")
    n1 = nt.nodes.new("ShaderNodeTexNoise"); n1.inputs["Scale"].default_value = 0.004; n1.inputs["Detail"].default_value = 6
    wv = nt.nodes.new("ShaderNodeTexWave"); wv.inputs["Scale"].default_value = 0.012; wv.inputs["Distortion"].default_value = 6
    mixc = nt.nodes.new("ShaderNodeMix"); mixc.data_type = "FLOAT"
    ramp = nt.nodes.new("ShaderNodeValToRGB")
    ramp.color_ramp.elements[0].color = (0.50, 0.33, 0.18, 1); ramp.color_ramp.elements[1].color = (0.86, 0.66, 0.42, 1)
    for n in (n1, wv):
        nt.links.new(tc.outputs["Object"], n.inputs["Vector"])
    nt.links.new(n1.outputs["Fac"], mixc.inputs["A"]); nt.links.new(wv.outputs["Fac"], mixc.inputs["B"])
    mixc.inputs["Factor"].default_value = 0.35
    nt.links.new(mixc.outputs["Result"], ramp.inputs["Fac"]); nt.links.new(ramp.outputs["Color"], bsdf.inputs["Base Color"])
    ground.data.materials.append(gm)
    bs.setup_world(strength=0.9, color=(0.85, 0.72, 0.55))
    cam = bs.setup_camera(target=Vector((0, 0, 0)), ortho_scale=420, distance=900); cam.data.clip_end = 20000
    os.makedirs(os.path.join(out, "fly"), exist_ok=True)
    SPEED, AMP = 14.0, 120.0
    W = 2 * math.pi / FLY_N

    def pos(t):
        return Vector((-SPEED * t * 3, AMP * math.sin(W * t), 0))

    for f in range(FLY_N):
        p = pos(f); d = pos(f + 0.5) - pos(f - 0.5)
        yaw = math.atan2(d.y, d.x) - math.pi            # ship nose is -X
        curv = -AMP * W * W * math.sin(W * f)            # lateral acceleration -> bank
        roll = max(-0.35, min(0.35, curv * 0.12))
        ship.location = p + Vector((0, 0, 4 * math.sin(f * 0.3)))
        ship.rotation_euler = Euler((roll, 0, yaw), "XYZ")
        flicker(f)
        tgt = p + Vector((-40, 0, 0))
        cam.location = tgt + Vector((0.55, -0.75, 0.95)).normalized() * 900
        cam.rotation_euler = (tgt - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(os.path.join(out, "fly", "f_%03d.png" % f), cam)
print("GIF_FRAMES_OK")
