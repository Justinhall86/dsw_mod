"""Round-trip proof for a Thorvald infantry game package: the CONVERTED HMD (06_game_ready/CharMOD/<X>) played with the
game's own Male01 clips (model_inputs/Anim, HMD files), textured from the packaged game textures, rendered at 4 frames
per clip. If the baked weapon, the weights, the bind pose or the textures broke in conversion, it shows here.

    python 93_roundtrip.py <trooper|ranged|demolition>
      -> <project>/02_progress_photos/game_ready_roundtrip/{<clip>_f*.png, roundtrip_sheet.png}
(runs hmdanim2fbx, then Blender on itself, then assembles the sheet)
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
T = os.path.dirname(os.path.dirname(HERE))
REPO = os.path.dirname(os.path.dirname(T))
ANIM = os.path.join(REPO, "model_inputs", "Anim", "Male01")
UNITS = {
    "sworn": ("thorvald_sworn_sword", "Male01_ThorvaldSwornSword", "ThSws",
              [("FightIdle", "Anim_Male01_FightIdle.fbx"), ("AttackMelee01", "Anim_Male01_AttackMelee01.fbx"),
               ("Run", "Anim_Male01_Run.fbx")]),
    "trooper": ("thorvald_trooper", "Male01_ThorvaldTrooper", "ThTro",
                [("FightIdle", "Anim_Male01_FightIdle.fbx"), ("AttackMelee01", "Anim_Male01_AttackMelee01.fbx"),
                 ("Run", "Anim_Male01_Run.fbx")]),
    "ranged": ("thorvald_ranged", "Male01_ThorvaldRanged", "ThRan",
               [("Sniper_FightIdle", "Sniper/Anim_Male01_Sniper_FightIdle.fbx"),
                ("Sniper_AttackRange", "Sniper/Anim_Male01_Sniper_AttackRange.fbx"), ("Sniper_Run", "Sniper/Anim_Male01_Sniper_Run.fbx")]),
    "demolition": ("thorvald_demolition", "Male01_ThorvaldDemolition", "ThDem",
                   [("Bazooka_FightIdle", "LandsraadGuard_Bazooka/Anim_Male01_LandsraadGuard_Bazooka_FightIdle.fbx"),
                    ("Bazooka_AttackRange", "LandsraadGuard_Bazooka/Anim_Male01_LandsraadGuard_Bazooka_AttackRange.fbx"),
                    ("Bazooka_Run", "LandsraadGuard_Bazooka/Anim_Male01_LandsraadGuard_Bazooka_Run.fbx")]),
}
BLENDER = os.environ.get("DSW_BLENDER", r"D:\Blender Foundation\Blender 5.2\blender.exe")
NFRAMES = 4

try:
    import bpy  # noqa: F401
    IN_BLENDER = True
except ImportError:
    IN_BLENDER = False

if not IN_BLENDER:
    unit = sys.argv[1]
    proj, model, prefix, clips = UNITS[unit]
    P = os.path.join(T, proj)
    res = os.path.join(P, "06_game_ready", "CharMOD", model)
    rt = os.path.join(P, "05_fbx_export", "roundtrip")
    out = os.path.join(P, "02_progress_photos", "game_ready_roundtrip")
    os.makedirs(rt, exist_ok=True)
    os.makedirs(out, exist_ok=True)
    tk = os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations")
    for name, f in clips:
        dst = os.path.join(rt, "%s_HMD_%s.fbx" % (model, name))
        subprocess.run([sys.executable, "hmdanim2fbx.py", os.path.join(res, model + ".hmd"), os.path.join(ANIM, f), dst],
                       cwd=tk, check=True, capture_output=True)
        r = subprocess.run([BLENDER, "-b", "--factory-startup", "--python", os.path.abspath(__file__), "--",
                            dst, res, prefix, os.path.join(out, name)], capture_output=True, text=True)
        print("\n".join(l for l in r.stdout.splitlines() if l.startswith(("ROUNDTRIP", "Traceback", "Error"))) or r.stderr[-800:])
    from PIL import Image, ImageDraw
    w, h = 260, 340
    sheet = Image.new("RGB", (150 + w * NFRAMES, h * len(clips)), (235, 237, 242))
    dr = ImageDraw.Draw(sheet)
    for r_, (name, _) in enumerate(clips):
        dr.text((8, r_ * h + h // 2), name, fill=(20, 20, 20))
        fs = sorted(f for f in os.listdir(out) if f.startswith(name + "_f"))
        for c, f in enumerate(fs[:NFRAMES]):
            im = Image.open(os.path.join(out, f)).convert("RGBA").resize((w, h))
            sheet.paste(im, (150 + c * w, r_ * h), im)
    dr.text((8, 8), "%s: converted game HMD + vanilla clips" % model, fill=(20, 20, 20))
    p = os.path.join(out, "roundtrip_sheet.png")
    sheet.save(p)
    print("saved", p)
    raise SystemExit

from mathutils import Vector  # noqa: E402

fbx, res, prefix, outbase = sys.argv[sys.argv.index("--") + 1:]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
sc = bpy.context.scene
arm = next(o for o in sc.objects if o.type == "ARMATURE")
mesh = next(o for o in sc.objects if o.type == "MESH")
for slot in mesh.material_slots:
    m = slot.material
    short = m.name.split(".")[0].replace("Mat_", "").replace("MAT_", "")
    nt = m.node_tree
    nt.nodes.clear()
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    o = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(bsdf.outputs[0], o.inputs[0])
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(os.path.join(res, "%s%s_Albedo.png" % (prefix, short)))
    nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
    bsdf.inputs["Roughness"].default_value = 0.7
act = arm.animation_data.action
f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 440, 580
sc.render.film_transparent = True
sc.view_settings.view_transform = "Standard"
for kind, rot, e in (("SUN", (0.8, 0.2, 0.6), 3.5), ("SUN", (1.2, 0.0, -2.4), 1.2)):
    L = bpy.data.objects.new(kind, bpy.data.lights.new(kind, kind))
    L.data.energy = e
    L.rotation_euler = rot
    sc.collection.objects.link(L)
sc.world = bpy.data.worlds.new("W")
sc.world.color = (0.45, 0.45, 0.47)
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = 3.0
sc.collection.objects.link(cam)
sc.camera = cam
frames = [round(f0 + (f1 - f0) * i / (NFRAMES - 1)) for i in range(NFRAMES)] if f1 > f0 else [f0]
fwd = None
for f in frames:
    sc.frame_set(f)
    dg = bpy.context.evaluated_depsgraph_get()
    e = mesh.evaluated_get(dg)
    ps = [e.matrix_world @ v.co for v in e.to_mesh().vertices]
    e.to_mesh_clear()
    c = sum(ps, Vector()) / len(ps)
    c.z = (min(p.z for p in ps) + max(p.z for p in ps)) / 2
    if fwd is None:   # the side the face is on (the HMD import can face -Y or +Y)
        hb = arm.pose.bones["B_HeadJ"]
        fwd = 1 if (arm.matrix_world @ hb.tail - arm.matrix_world @ hb.head).y > 0 else -1
    d = Vector((0.75, -0.75 * fwd, 0.3)).normalized()      # (+fwd showed the back on the Trooper test)
    cam.location = c + d * 6
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = "%s_f%03d.png" % (outbase, f)
    bpy.ops.render.render(write_still=True)
print("ROUNDTRIP %s: frames %s, %d verts, materials %s" % (os.path.basename(outbase), frames, len(mesh.data.vertices),
                                                         [s.material.name for s in mesh.material_slots]))
