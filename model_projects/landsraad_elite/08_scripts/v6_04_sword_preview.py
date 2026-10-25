"""v6: TallSword (Ecaz Fencer blade) in G1's right hand with the Trooper's animations - placement check + preview .blend.

  blender -b --python 08_scripts/v6_04_sword_preview.py -- [A1 A2 B] [--save NAME]

Candidates (prefab transform on bone B_Weapon, applied on top of the weapon's imported model-node basis):
  A1 the Fencer prefab's own transform, rotations composed X @ Y @ Z
  A2 the same, composed Z @ Y @ X  (engine order unknown -> render both)
  B  the Atreides sword's transform from Duncan's prefab (y -0.16362, z 0.05084, rotX -90)
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

LE = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
BASE = os.path.join(LE, "03_blender", "landsraad_elite_v5_G1_halberd_preview.blend")
SWORD = os.path.join(LE, "05_fbx_export", "weapon_survey", "TallSword.fbx")
SWORD_ALB = os.path.join(LE, "05_fbx_export", "weapon_survey", "TallSword_Albedo.png")
CLIPS = os.path.join(LE, "05_fbx_export", "anim_tests")
OUT = os.path.join(LE, "02_progress_photos", "20_tallsword")
os.makedirs(OUT, exist_ok=True)
FENCER = ((0.02183, -0.16015, 0.07623), (34, -97.4, -121.2))
CAND = {
    "A1": (FENCER[0], FENCER[1], "XYZ"),
    "A2": (FENCER[0], FENCER[1], "ZYX"),
    "B": ((0.0, -0.16362, 0.05084), (-90, 0, 0), "XYZ"),
}


def rot(r, order):
    m = {a: Matrix.Rotation(math.radians(v), 4, a) for a, v in zip("XYZ", r)}
    return m[order[0]] @ m[order[1]] @ m[order[2]]


def load_action(fbx):
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o not in before]
    act = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    return act


def build(key, save=None):
    off, r, order = CAND[key]
    bpy.ops.wm.open_mainfile(filepath=BASE)
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    for o in [o for o in bpy.data.objects if o.name.startswith("Landsraad_Halberd")]:
        bpy.data.objects.remove(o, do_unlink=True)
    acts = {c: load_action(os.path.join(CLIPS, "Trooper_%s.fbx" % c)) for c in ("FightIdle", "AttackMelee01", "Idle")}
    rig.animation_data.action = acts["FightIdle"]
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=SWORD)
    new = [o for o in bpy.data.objects if o not in before]
    sw = max((o for o in new if o.type == "MESH"), key=lambda o: len(o.data.vertices))
    for o in new:
        if o is not sw:
            bpy.data.objects.remove(o, do_unlink=True)
    sw.name = "TallSword"
    mat = bpy.data.materials.new("Mat_TallSword")
    mat.use_nodes = True
    tex = mat.node_tree.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(SWORD_ALB)
    tex.image.pack()
    bsdf = mat.node_tree.nodes["Principled BSDF"]
    mat.node_tree.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
    bsdf.inputs["Metallic"].default_value = 0.4
    bsdf.inputs["Roughness"].default_value = 0.3
    sw.data.materials.clear()
    sw.data.materials.append(mat)
    imported = sw.matrix_basis.copy()
    pb = rig.pose.bones["B_Weapon"]
    sw.parent, sw.parent_type, sw.parent_bone = rig, "BONE", "B_Weapon"
    sw.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
    sw.matrix_basis = Matrix.Translation(off) @ rot(r, order) @ imported
    bpy.context.view_layer.update()
    # where is the grip? the sword's mesh extends along its long axis; report both ends' distance to the hand
    pts = [sw.matrix_world @ v.co for v in sw.data.vertices]
    hand = rig.matrix_world @ pb.head
    far = max(pts, key=lambda p: (p - hand).length)
    print("C %s blade tip %s, hand %s, tip-hand %.2f m, tip dir %s" % (
        key, tuple(round(x, 2) for x in far), tuple(round(x, 2) for x in hand), (far - hand).length,
        tuple(round(x, 2) for x in (far - hand).normalized())))
    for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
        bpy.data.objects.remove(o, do_unlink=True)
    sc.render.resolution_x = sc.render.resolution_y = 600
    for clip, frames in (("FightIdle", (1, 20)), ("AttackMelee01", (15, 28)), ("Idle", (1,))):
        rig.animation_data.action = acts[clip]
        for f in frames:
            sc.frame_set(f)
            pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
            cd = bpy.data.cameras.new("c")
            cam = bpy.data.objects.new("c", cd)
            bpy.context.collection.objects.link(cam)
            cam.location = Vector((pel.x - 4, pel.y - 3.4, pel.z + 0.4))
            cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.3)) - cam.location).to_track_quat("-Z", "Y").to_euler()
            cd.type, cd.ortho_scale = "ORTHO", 2.6
            sc.camera = cam
            sc.render.filepath = os.path.join(OUT, "%s_%s_f%03d.png" % (key, clip, f))
            bpy.ops.render.render(write_still=True)
    if save:
        rig.animation_data.action = acts["FightIdle"]
        sc.frame_start, sc.frame_end = 1, int(acts["FightIdle"].frame_range[1])
        sc.frame_set(1)
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(LE, "03_blender", save))


args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else list(CAND)
save = None
if "--save" in args:
    save = args[args.index("--save") + 1]
    args = args[:args.index("--save")]
for k in args:
    build(k, save)
