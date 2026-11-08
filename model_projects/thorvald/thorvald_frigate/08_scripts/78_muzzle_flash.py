"""Muzzle-flash proof for the cruiser: find the four turret barrel tips, save them as the prefab muzzle
points (01_input/cruiser_muzzles.json, mesh frame + game frame), and render a volley with the parts
of the vanilla launch FX that Th_Frigate_Attack uses (Fx/Vehicle/Ships/FX_MissileLaunch_Ship.fx):
  Flare      white sprite, ColorSet (0.47,0.29,0.19), life 0.1 s
  Fireball   Fx/Meshes_Common/SemiSphere.fbx puffs, ColorSet (1,0.45,0.29), life 1.2 s, thrown along +X(fire dir)
  Smoke      T_Dust_16x16_01 sprite, ColorSet (0.73,0.67,0.59), life 2.5 s
plus the missile leaving the barrel (projectile speed 50 game units/s).

    blender -b 03_blender/cruiser_turrets.blend --python 78_muzzle_flash.py -- <outdir> [albedo] [mgao]
    python 78_muzzle_flash.py <outdir>      (assemble GIF + strip)
"""
import json, math, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
GAME_SCALE = 0.09675            # mesh -> in-game (Chronos length 15.8)
FPS = 20
N = 44
ORDER = ["MuzzleA", "MuzzleB", "MuzzleC", "MuzzleD", "MuzzleA"]   # 5 shots, list cycles like E_Frigate's
SHOT_GAP = 4                    # frames between shots (0.2 s)

if "bpy" not in sys.modules and "--" not in sys.argv:
    from PIL import Image, ImageDraw, ImageFont
    import glob
    out = os.path.abspath(sys.argv[1])
    for view, ms in (("close", 50), ("ship", 50)):
        fr = sorted(glob.glob(os.path.join(out, view, "f_*.png")))
        if not fr:
            continue
        ims = [Image.open(p).convert("RGB") for p in fr]
        pal = ims[10].quantize(colors=255, method=Image.Quantize.MEDIANCUT)
        q = [im.quantize(palette=pal, dither=Image.Dither.NONE) for im in ims]
        q[0].save(os.path.join(out, "Cruiser_volley_%s.gif" % view), save_all=True, append_images=q[1:], duration=ms, loop=0)
        print("GIF", view, len(q))
    # strip: one frame per shot, captioned
    try:
        F = ImageFont.truetype("arialbd.ttf", 26)
    except OSError:
        F = ImageFont.load_default()
    picks = [2 + i * SHOT_GAP + 1 for i in range(len(ORDER))]
    tiles = []
    for i, f in enumerate(picks):
        im = Image.open(os.path.join(out, "close", "f_%03d.png" % f)).convert("RGB")
        im.thumbnail((640, 420)); d = ImageDraw.Draw(im)
        d.rectangle((0, 0, im.width, 38), fill=(20, 20, 20))
        d.text((10, 5), "shot %d  t=%.2fs  %s" % (i + 1, f / FPS, ORDER[i]), fill=(255, 200, 150), font=F)
        tiles.append(im)
    strip = Image.new("RGB", (sum(t.width for t in tiles[:3]), tiles[0].height * 2), (30, 30, 30))
    for i, t in enumerate(tiles):
        strip.paste(t, ((i % 3) * t.width, (i // 3) * t.height))
    last = Image.open(os.path.join(out, "ship", "f_%03d.png" % (picks[-1] + 3))).convert("RGB"); last.thumbnail((640, 420))
    strip.paste(last, (2 * tiles[0].width, tiles[0].height))
    strip.save(os.path.join(out, "MUZZLE_STRIP.png")); print("STRIP ok")
    sys.exit(0)

import bpy
from mathutils import Vector, Matrix

sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(argv[0])
for i, stem in ((1, "Thorvald_Cruiser_Albedo"), (2, "Thorvald_Cruiser_MetallicGlossAO")):
    if len(argv) > i:
        for img in bpy.data.images:
            if stem in os.path.basename(img.filepath):
                img.filepath = os.path.abspath(argv[i]); img.reload()
R = PROJ
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
FX = os.path.join(R, "model_inputs", "Fx")
for m in bpy.data.materials:
    if m.use_nodes:
        pw.gamelike(m)

# ---------------------------------------------------------------- muzzle points = barrel tips
mz = {}
turrets = sorted([o for o in bpy.data.objects if o.name.startswith("turret_")], key=lambda o: o.name)
# A,B = fore pair (x 14) L/R, C,D = aft pair (x 40) L/R  -> volley ripples fore to aft
turrets.sort(key=lambda o: (o.location.x, -o.location.y))
for name, o in zip(["MuzzleA", "MuzzleB", "MuzzleC", "MuzzleD"], turrets):
    vs = [o.matrix_world @ v.co for v in o.data.vertices]
    xmin = min(v.x for v in vs)
    tip = [v for v in vs if v.x < xmin + 0.8]
    c = sum(tip, Vector()) / len(tip)
    mz[name] = {"turret": o.name, "mesh": [round(c.x - 0.3, 3), round(c.y, 3), round(c.z, 3)],
                "game": [round((c.x - 0.3) * GAME_SCALE, 4), round(c.y * GAME_SCALE, 4), round(c.z * GAME_SCALE, 4)],
                "fire_dir_mesh": [-1, 0, 0]}
    print("MUZZLE", name, o.name, mz[name]["mesh"])
json.dump({"note": "barrel tips of the 4 shoulder cannons; mesh frame = cruiser_turrets.blend, game = mesh*%g "
                   "(before the export's B_Body transform). Th_Frigate_Attack fires 5: A,B,C,D,A." % GAME_SCALE,
           "muzzles": mz}, open(os.path.join(PROJ, "01_input", "cruiser_muzzles.json"), "w"), indent=1)

# ---------------------------------------------------------------- FX pieces
def fx_mat(name, color, tex=None, obj_radius=None):
    m = bpy.data.materials.new(name); m.use_nodes = True
    try:
        m.surface_render_method = "BLENDED"
    except AttributeError:
        m.blend_method = "BLEND"
    nt = m.node_tree; nt.nodes.clear()
    o = nt.nodes.new("ShaderNodeOutputMaterial")
    em = nt.nodes.new("ShaderNodeEmission"); em.inputs["Color"].default_value = (*color, 1)
    tr = nt.nodes.new("ShaderNodeBsdfTransparent")
    mix = nt.nodes.new("ShaderNodeMixShader")
    alpha = nt.nodes.new("ShaderNodeMath"); alpha.operation = "MULTIPLY"; alpha.inputs[1].default_value = 1.0
    if tex:
        ti = nt.nodes.new("ShaderNodeTexImage"); ti.image = bpy.data.images.load(tex); ti.extension = "CLIP"
        bw = nt.nodes.new("ShaderNodeRGBToBW")              # the dust shape lives in RGB, alpha is solid
        nt.links.new(ti.outputs["Color"], bw.inputs[0]); nt.links.new(bw.outputs[0], alpha.inputs[0])
    else:                                    # soft round sprite (plane UVs) / soft puff (object coords)
        tc = nt.nodes.new("ShaderNodeTexCoord"); gr = nt.nodes.new("ShaderNodeTexGradient"); gr.gradient_type = "SPHERICAL"
        mp = nt.nodes.new("ShaderNodeMapping")
        if obj_radius:
            mp.inputs["Scale"].default_value = (1 / obj_radius,) * 3
            nt.links.new(tc.outputs["Object"], mp.inputs["Vector"])
        else:
            mp.inputs["Scale"].default_value = (2, 2, 1); mp.inputs["Location"].default_value = (-1, -1, 0)
            nt.links.new(tc.outputs["UV"], mp.inputs["Vector"])
        nt.links.new(mp.outputs["Vector"], gr.inputs["Vector"])
        nt.links.new(gr.outputs["Fac"], alpha.inputs[0])
    nt.links.new(alpha.outputs[0], mix.inputs["Fac"])
    nt.links.new(tr.outputs[0], mix.inputs[1]); nt.links.new(em.outputs[0], mix.inputs[2])
    nt.links.new(mix.outputs[0], o.inputs["Surface"])
    return m, em, alpha


SPR = os.path.join(PROJ, "04_textures", "_fx_dust_frame.png")   # frame 0 of T_Dust_16x16_01 (cropped outside Blender)
if not os.path.exists(SPR):
    SPR = None


def plane(name, size, mat):
    me = bpy.data.meshes.new(name)
    h = size / 2
    me.from_pydata([(-h, -h, 0), (h, -h, 0), (h, h, 0), (-h, h, 0)], [], [(0, 1, 2, 3)])
    uv = me.uv_layers.new(); uvd = [(0, 0), (1, 0), (1, 1), (0, 1)]
    for i, l in enumerate(uv.data):
        l.uv = uvd[i]
    me.materials.append(mat)
    o = bpy.data.objects.new(name, me); bpy.context.scene.collection.objects.link(o)
    return o


def load_obj(path, name):
    before = set(bpy.data.objects)
    bpy.ops.wm.obj_import(filepath=path, forward_axis="Y", up_axis="Z")
    o = [x for x in bpy.data.objects if x not in before][0]; o.name = name
    return o


U = 1 / GAME_SCALE              # one game unit in mesh units
shots = []
hemi_src = os.path.join(FX, "Meshes_Common", "preview_obj", "SemiSphere.obj")
for k, name in enumerate(ORDER):
    p = Vector(mz[name]["mesh"])
    fm, fe, fa = fx_mat("flare_%d" % k, (1.0, 0.75, 0.5))
    flare = plane("flare_%d" % k, 1.4 * U, fm)
    puffs = []
    for j in range(3):
        bm, be, ba = fx_mat("fire_%d_%d" % (k, j), (1.0, 0.45, 0.29), obj_radius=15.1)
        h = load_obj(hemi_src, "fire_%d_%d" % (k, j)); h.data.materials.clear(); h.data.materials.append(bm)
        # hemisphere dome along -X (fire direction): source dome is +Z
        h.data.transform(Matrix.Rotation(math.radians(-90), 4, "Y"))
        puffs.append((h, be, ba, j))
    sm_m, sm_e, sm_a = fx_mat("smoke_%d" % k, (0.73, 0.67, 0.59), SPR)
    smoke = plane("smoke_%d" % k, 2.8 * U, sm_m)
    mm, me_, ma = fx_mat("missile_%d" % k, (1.0, 0.85, 0.6))
    missile = plane("missile_%d" % k, 0.9 * U, mm)
    shots.append(dict(p=p, t0=2 + k * SHOT_GAP, flare=(flare, fe, fa), puffs=puffs, smoke=(smoke, sm_e, sm_a),
                      missile=(missile, me_, ma)))


def face_cam(o, cam):
    d = (cam.location - o.location).normalized()
    o.rotation_euler = d.to_track_quat("Z", "Y").to_euler()


def set_frame(f, cam):
    for s in shots:
        t = (f - s["t0"]) / FPS                       # seconds since this shot
        fl, fe, fa = s["flare"]
        on = 0 <= t <= 0.1
        fl.hide_render = not on
        fl.location = s["p"] + Vector((-0.3 * U, 0, 0)); face_cam(fl, cam)
        fe.inputs["Strength"].default_value = 4.0; fa.inputs[1].default_value = 1.0
        for h, be, ba, j in s["puffs"]:
            life = 1.2 * (0.6 + 0.2 * j)
            tt = t - 0.02 * j
            vis = 0 <= tt <= life
            h.hide_render = not vis
            if vis:
                a = tt / life
                h.location = s["p"] + Vector((-(0.4 + 6 * 0.5 * 0.9 * tt * (1 - 0.5 * a)) * U * (0.6 + 0.3 * j), (j - 1) * 0.15 * U, 0))
                r = (0.25 + 0.55 * a ** 0.5) * U / 15.1 * (1.0 - 0.15 * j)
                h.scale = (r, r, r)
                be.inputs["Strength"].default_value = 6.0 * (1 - a) ** 1.5 + 0.3
                ba.inputs[1].default_value = max(0.0, 1 - a) ** 1.2
        sm, se, sa = s["smoke"]
        vis = 0.05 <= t <= 2.5
        sm.hide_render = not vis
        if vis:
            a = (t - 0.05) / 2.45
            sm.location = s["p"] + Vector((0.6 * U + 2 * t * U * 0.3, 0, 0.3 * U * a)); face_cam(sm, cam)
            sm.scale = (0.6 + 0.8 * a,) * 3
            se.inputs["Strength"].default_value = 0.9
            sa.inputs[1].default_value = 0.55 * (1 - a) ** 1.3
        mi, me_, ma = s["missile"]
        vis = 0 <= t <= 0.6
        mi.hide_render = not vis
        if vis:
            mi.location = s["p"] + Vector((-(50 * t + 0.3) * U, 0, 0.15 * U * t)); face_cam(mi, cam)
            me_.inputs["Strength"].default_value = 5.0; ma.inputs[1].default_value = 1.0


bs.setup_lights(); pw.soften_world()
bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
for view in ("close", "ship"):
    bs.setup_render(800, 540)
    if view == "close":
        tgt = Vector((10, -20, 6)); cam = bs.setup_camera(target=tgt, ortho_scale=150, distance=700)
        cam.location = tgt + Vector((-0.45, -0.8, 0.5)).normalized() * 700
    else:
        tgt = Vector((-40, 0, 0)); cam = bs.setup_camera(target=tgt, ortho_scale=320, distance=900)
        cam.location = tgt + Vector((-0.55, -0.7, 0.75)).normalized() * 900
    cam.data.clip_end = 5000
    cam.rotation_euler = (tgt - cam.location).to_track_quat("-Z", "Y").to_euler()
    os.makedirs(os.path.join(out, view), exist_ok=True)
    for f in range(N):
        set_frame(f, cam)
        bs.render_to(os.path.join(out, view, "f_%03d.png" % f), cam)
print("MUZZLE_FRAMES_OK")
