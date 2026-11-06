"""Round-trip proof for the game package: the CONVERTED HMD (res tree) played with the game's own Male01 DualSwords clips
(hmdanim2fbx, 05_fbx_export/roundtrip/Karlin_HMD_<clip>.fbx), textured from the staged game textures, rendered frame by frame.
If B_Weapon_L, the baked swords, the weights or the textures broke in conversion, it shows here.

  (HMD_toolkit/HMD_toolkit/Animations) python hmdanim2fbx.py <res>/CharMOD/Male01_ThorvaldKarlin/Male01_ThorvaldKarlin.hmd
        C:/dsw_mod/extr/Anim/Male01/DualSwords/Anim_Male01_DualSwords_<clip>.fbx <proj>/05_fbx_export/roundtrip/Karlin_HMD_<clip>.fbx
  blender -b --factory-startup --python 52_roundtrip_render.py -- <clip> [step]
  python 52_roundtrip_render.py --assemble
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
OUT = os.path.join(PROJ, "02_progress_photos", "22_game_package")
RES = r"C:\dsw_mod\D4XEditor\res\res\CharMOD\Male01_ThorvaldKarlin"

if "--assemble" in sys.argv:
    from PIL import Image, ImageDraw
    rows = []
    for clip in ("Run", "AttackMelee01", "FightIdle"):
        d = os.path.join(OUT, clip)
        if os.path.isdir(d):
            rows.append((clip, [os.path.join(d, f) for f in sorted(os.listdir(d)) if f.endswith(".png")]))
    w, h = 220, 300
    cols = max(len(r[1]) for r in rows)
    sheet = Image.new("RGB", (90 + w * cols, h * len(rows)), (235, 237, 242))
    dr = ImageDraw.Draw(sheet)
    for r, (clip, fs) in enumerate(rows):
        dr.text((6, r * h + h // 2), clip, fill=(20, 20, 20))
        for c, f in enumerate(fs):
            im = Image.open(f).convert("RGBA").resize((w, h))
            sheet.paste(im, (90 + c * w, r * h), im)
    sheet.save(os.path.join(OUT, "roundtrip_sheet.png"))
    print("saved", os.path.join(OUT, "roundtrip_sheet.png"))
    raise SystemExit

import bpy  # noqa: E402
from mathutils import Vector  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
clip = a[0]
step = int(a[1]) if len(a) > 1 else 4
out = os.path.join(OUT, clip)
os.makedirs(out, exist_ok=True)
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "roundtrip", "Karlin_HMD_%s.fbx" % clip))
sc = bpy.context.scene
arm = next(o for o in sc.objects if o.type == "ARMATURE")
mesh = next(o for o in sc.objects if o.type == "MESH")
for slot in mesh.material_slots:
    m = slot.material
    short = m.name.split(".")[0].replace("Mat_", "")
    m.use_nodes = True
    nt = m.node_tree
    nt.nodes.clear()
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    o = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(bsdf.outputs[0], o.inputs[0])
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(os.path.join(RES, "ThKar%s_Albedo.png" % short))
    nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
    bsdf.inputs["Roughness"].default_value = 0.6
act = arm.animation_data.action
f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 440, 600
sc.render.film_transparent = True
sc.view_settings.view_transform = "Standard"
for kind, rot, e in (("SUN", (0.8, 0.2, 0.6), 3.5), ("SUN", (1.2, 0.0, -2.4), 1.2)):
    L = bpy.data.objects.new(kind, bpy.data.lights.new(kind, kind))
    L.data.energy = e
    L.rotation_euler = rot
    sc.collection.objects.link(L)
sc.world = bpy.data.worlds.new("W")
sc.world.color = (0.4, 0.4, 0.42)
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = 3.4
sc.collection.objects.link(cam)
sc.camera = cam
for f in range(f0, f1 + 1, step):
    sc.frame_set(f)
    dg = bpy.context.evaluated_depsgraph_get()
    e = mesh.evaluated_get(dg)
    ps = [e.matrix_world @ v.co for v in e.to_mesh().vertices]
    e.to_mesh_clear()
    c = sum(ps, Vector()) / len(ps)
    c.z = (min(p.z for p in ps) + max(p.z for p in ps)) / 2
    d = Vector((0.75, -0.75, 0.3)).normalized()
    if f == f0:
        # the game's forward axis: the HMD faces -Y or +Y depending on the importer - pick the side the face is on
        head = arm.matrix_world @ arm.pose.bones["B_HeadJ"].head
        nose = arm.matrix_world @ arm.pose.bones["B_HeadJ"].tail
        fwd = 1 if (nose - head).y > 0 else -1
    cam.location = c + Vector((d.x, d.y * -fwd if fwd > 0 else d.y, d.z)) * 5
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(out, "f%03d.png" % f)
    bpy.ops.render.render(write_still=True)
print("ROUNDTRIP %s: %d frames, %d verts, materials %s" % (clip, len(range(f0, f1 + 1, step)), len(mesh.data.vertices),
                                                        [s.material.name for s in mesh.material_slots]))
