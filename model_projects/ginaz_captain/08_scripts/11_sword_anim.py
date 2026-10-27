"""Give a variant the Ecaz TallSword (Fencer prefab mount) and render animation frames per clip.

    blender -b <variant.blend> --python 11_sword_anim.py -- <out_dir> [--clips Duncan_FightIdle ...] [--step 2]
            [--check] [--save <out.blend>]

Sword mount: bone B_Weapon, grip placed where Duncan's own sword grip sits (the Fencer prefab offsets are for
the Female01 Fencer clips and float the sword away from the hand in Duncan's clips).
Clips are Duncan's (single-sword swordmaster), converted with hmdanim2fbx onto a Male01 body.
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring  # noqa: E402
if "--gamelike" in sys.argv:
    preview_wiring.apply_all()

args = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(args[0])
os.makedirs(out, exist_ok=True)


def opt(flag, default=None, many=False):
    if flag not in args:
        return default
    i = args.index(flag) + 1
    if not many:
        return args[i]
    vals = []
    while i < len(args) and not args[i].startswith("--"):
        vals.append(args[i])
        i += 1
    return vals


clips = opt("--clips", ["Duncan_FightIdle", "Duncan_Run", "Duncan_AttackMelee01", "Duncan_AttackMelee02",
                        "Duncan_Skill"], many=True)
step = int(opt("--step", "2"))
SWORD_FBX = os.path.join(PROJ, "05_fbx_export", "TallSword_TRUE_FBX.fbx")
TEX = os.path.join(PROJ, "04_textures", "sword")
BONE = "B_Weapon"

rig = bpy.data.objects["Armature"]
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)

# ---- sword -----------------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=SWORD_FBX)
new = [o for o in bpy.data.objects if o not in before]
sword = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.vertices))
for o in new:
    if o is not sword:
        bpy.data.objects.remove(o, do_unlink=True)
sword.name = "TallSword"
for mat in sword.data.materials:
    if mat and mat.use_nodes:
        bs.wire_textures(mat, {"Base Color": os.path.join(TEX, "WeaponFencer_Albedo.png"),
                               "Specular IOR Level": os.path.join(TEX, "WeaponFencer_MetallicGlossAO.png"),
                               "Normal": os.path.join(TEX, "WeaponFencer_Normal.png")})
pb = rig.pose.bones[BONE]
sword.parent = rig
sword.parent_type = "BONE"
sword.parent_bone = BONE
sword.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
bpy.context.view_layer.update()
# Duncan's mount (validated with his own sword in his clips): in the REST pose the grip sits at world
# (0, 0.03, ~0.12) - B_Weapon rests at the feet and the clips carry it into the hand - with the blade
# pointing world -Z.  TallSword data: pommel at y 0, handle y -0.13..0, basket -0.41..-0.13, blade -> -Y.
GRIP_LOCAL = Vector((0.0, -0.10, 0.0))
sword.matrix_world = (Matrix.Translation((0.0, 0.03, 0.12)) @ Matrix.Rotation(math.radians(90.0), 4, "X")
                      @ Matrix.Translation(-GRIP_LOCAL))
bpy.context.view_layer.update()
bb = [sword.matrix_world @ Vector(c) for c in sword.bound_box]
hand = rig.matrix_world @ rig.pose.bones["B_rWristJ"].head
print("SWORD verts %d  bbox x %.2f..%.2f y %.2f..%.2f z %.2f..%.2f  hand %s" % (
    len(sword.data.vertices), min(b.x for b in bb), max(b.x for b in bb), min(b.y for b in bb),
    max(b.y for b in bb), min(b.z for b in bb), max(b.z for b in bb), tuple(round(v, 2) for v in hand)))

sc = bpy.context.scene
bs.setup_render(480, 480)
sc.render.film_transparent = False
cd = bpy.data.cameras.new("anim_cam")
cam = bpy.data.objects.new("anim_cam", cd)
bpy.context.collection.objects.link(cam)
cd.type, cd.ortho_scale = "ORTHO", 3.3
sc.camera = cam


def frame_cam():
    pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
    cam.location = Vector((pel.x - 4, pel.y - 3.6, pel.z + 0.55))
    cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.25)) - cam.location).to_track_quat("-Z", "Y").to_euler()


for clip in clips:
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    action = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data_create()
    rig.animation_data.action = action
    if getattr(action, "slots", None):
        rig.animation_data.action_slot = action.slots[0]
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    frames = [f0 + (f1 - f0) // 3] if "--check" in args else list(range(f0, f1 + 1, step))
    d = os.path.join(out, clip)
    os.makedirs(d, exist_ok=True)
    for f in frames:
        sc.frame_set(f)
        frame_cam()
        sc.render.filepath = os.path.join(d, "f%03d.png" % f)
        bpy.ops.render.render(write_still=True)
    print("CLIP", clip, f0, f1, "rendered", len(frames))

if opt("--save"):
    rig.animation_data.action = None
    sc.frame_set(0)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(opt("--save")), compress=True)
    print("SAVED", opt("--save"))
