"""Mount two Thorvald Katanas on B (Foundry Warlord), the way vanilla's Free Company (S_Elite) does it: one sword on
B_Weapon (right hand), the second on B_Weapon_L (left hand), both with the SAME bone-local offset, on the
MilitaryDualSwords clip set (DualSwords_Run / _AttackMelee01 / _FightIdle).

  blender -b --factory-startup --python 22_mount_two_swords.py -- --variant B [--nudge arms_x1.2]

Reads 03_blender/structure/<variant>.blend (20_structure_pass.py's output) and writes
03_blender/weapons/<variant>_two_swords.blend with three actions (DualSwords_Run is the active one;
DualSwords_AttackMelee01 and DualSwords_FightIdle are kept with a fake user for renders).

Round 12 (2026-11-03): how Free Company really does it (Character/Smuggler/Unit/FreeCompany/Prefab_FreeCompany.prefab):
the same sword model twice, Atreide_Sword_01 on ...B_rWristJ.B_Weapon and Atreide_Sword_02 on ...B_lWristJ.B_Weapon_L,
each with the identical local offset (y -0.15, rotX -90). B_Weapon_L is a dedicated left-hand prop bone, and every
DualSwords clip carries a track for it (constant per clip in Run/FightIdle/Idle, moving in the attacks) - the clip,
not the prefab, decides where the off-hand blade points. Rounds 9-11 instead hung sword 2 straight off B_lWristJ
with an offset solved for one frame of the OLD generic Run clip (0.72 m from the wrist), so on the DualSwords clips
it floated loose. Our Male01 body (Iakin) has no B_Weapon_L (only Female01 bodies carry it - checked every HMD in
extr), so this script ADDS it: a child of B_lWristJ, keyed every frame from the clip HMD's own B_Weapon_L track.
The game's local transforms map straight onto Blender pose space with the x-mirror D = diag(-1,1,1) (checked on
B_Weapon vs the same clip's B_Weapon track: identical), so no fitting is involved.

mount_weapon.py (the shared weapons-library tool) clears the rig's action while it resets the pose, so sword 1's
mount (B_Weapon, rest_grip_world [0,0.03,0.12], rot_x_deg 90, grip_local [0,0.144,0] - identical to
thorvald_katana/weapon.json) is reimplemented inline.
"""
import argparse
import math
import os
import sys

import bpy
from mathutils import Matrix, Quaternion, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
sys.path[:0] = [os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations")]
import hmd_anim as HA  # noqa: E402

KATANA_BLEND = os.path.join(REPO, "model_projects", "weapons", "thorvald_katana", "Thorvald_Katana.blend")
KATANA_ALBEDO_B = os.path.join(PROJ, "04_textures", "B_katana", "Katana_Albedo_B.png")   # 25_recolour_katana.py
GRIP_LOCAL = (0.0, 0.144, 0.0)
ANIM_DIR = os.path.join(PROJ, "05_fbx_export", "anim")
CLIP_HMD = r"C:\dsw_mod\extr\Anim\Male01\DualSwords\Anim_Male01_DualSwords_%s.fbx"
CLIPS = ["Run", "AttackMelee01", "FightIdle"]   # first one is the active action
OFFHAND = "B_Weapon_L"

ap = argparse.ArgumentParser()
ap.add_argument("--variant", required=True, choices=["B"])
ap.add_argument("--nudge", help="build on 03_blender/nudge/B_<NUDGE>.blend (23_arm_graft.py) instead of the structure blend")
ap.add_argument("--sword1-tilt", type=float, default=0.0,
                help="extra rotation of the right sword about its grip's X axis, degrees. Round 14 uses -6: at 0 the "
                     "blade tip grazed Karlin's back shell in 13 of the 30 Run frames (33_sword_clearance.py); -6 is "
                     "clear in every Run / Attack / FightIdle frame. Constant, so it ships as the prefab offset")
a = ap.parse_args(sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else sys.argv[1:])

NAMES = {"B": "B_foundry_warlord"}
name = NAMES[a.variant]
if a.nudge:
    BLEND = os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % a.nudge)
    OUT = os.path.join(PROJ, "03_blender", "weapons", "%s_%s_two_swords.blend" % (name, a.nudge))
else:
    BLEND = os.path.join(PROJ, "03_blender", "structure", "%s.blend" % name)
    OUT = os.path.join(PROJ, "03_blender", "weapons", "%s_two_swords.blend" % name)
os.makedirs(os.path.dirname(OUT), exist_ok=True)


def game_local(pos, quat):
    """Game local TRS (row-convention quat x,y,z,w) -> Blender pose-space parent-relative matrix (x-mirrored)."""
    qx, qy, qz, qw = quat
    m = Matrix.Translation((-pos[0], pos[1], pos[2])) @ Quaternion((qw, qx, -qy, -qz)).to_matrix().to_4x4()
    return m


def offhand_track(clip):
    _, anim, tracks = HA.load_animation(CLIP_HMD % clip)
    t = tracks[OFFHAND]
    n = 1 if t.single else anim.frames
    return [game_local(t.position[min(i, len(t.position) - 1)], t.rotation[min(i, len(t.rotation) - 1)])
            for i in range(n)]


bpy.ops.wm.open_mainfile(filepath=BLEND)
rig = bpy.data.objects["Rig"]
pose_mode = rig.data.pose_position

# both mounts are done with the rig fully reset (identity pose bones), matching mount_weapon.py's own method
rig.animation_data_create()
rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis = Matrix.Identity(4)

# --- add B_Weapon_L under B_lWristJ, rest = the Run clip's frame-0 offhand transform ---------------------------
tracks = {c: offhand_track(c) for c in CLIPS}
rest_rel = tracks[CLIPS[0]][0]
bpy.context.view_layer.objects.active = rig
bpy.ops.object.mode_set(mode="EDIT")
eb = rig.data.edit_bones
if OFFHAND in eb:
    eb.remove(eb[OFFHAND])
wl = eb.new(OFFHAND)
wl.head, wl.tail = (0, 0, 0), (0, 0.1, 0)
wl.parent = eb["B_lWristJ"]
wl.use_deform = False
wl.matrix = eb["B_lWristJ"].matrix @ rest_rel
bpy.ops.object.mode_set(mode="OBJECT")
bpy.context.view_layer.update()

# --- mount the swords: sword 1 as weapon.json says, sword 2 with sword 1's exact bone-local placement ------------
def load_katana(obj_name):
    old = bpy.data.objects.get(obj_name)
    if old:
        bpy.data.objects.remove(old, do_unlink=True)
    with bpy.data.libraries.load(KATANA_BLEND, link=False) as (src, dst):
        dst.objects = ["Thorvald_Katana"]
    w = dst.objects[0]
    bpy.context.collection.objects.link(w)
    w.name = obj_name
    if os.path.exists(KATANA_ALBEDO_B):     # B-only copper guard/pommel; the library katana file is untouched
        img = bpy.data.images.get("Katana_Albedo_B") or bpy.data.images.load(KATANA_ALBEDO_B)
        img.name = "Katana_Albedo_B"
        img.pack()
        for slot in w.material_slots:
            slot.material = slot.material.copy()
            for nd in slot.material.node_tree.nodes:
                if nd.type == "TEX_IMAGE" and nd.image and "albedo" in nd.image.name.lower():
                    nd.image = img
    return w


def bone_parent(w, bone):
    w.parent = rig
    w.parent_type = "BONE"
    w.parent_bone = bone
    w.matrix_parent_inverse = Matrix.Translation((0.0, -rig.data.bones[bone].length, 0.0))


w1 = load_katana("Thorvald_Katana")
w1.parent = None
bone_parent(w1, "B_Weapon")
bpy.context.view_layer.update()
mount = Matrix.Translation(Vector((0.0, 0.03, 0.12))) @ Matrix.Rotation(math.radians(90.0), 4, "X")
w1.matrix_world = mount @ Matrix.Translation(-Vector(GRIP_LOCAL))
bpy.context.view_layer.update()
basis = w1.matrix_basis.copy()      # the untilted mount, shared with sword 2
if a.sword1_tilt:
    w1.matrix_world = (mount @ Matrix.Rotation(math.radians(a.sword1_tilt), 4, "X")
                       @ Matrix.Translation(-Vector(GRIP_LOCAL)))
    bpy.context.view_layer.update()
print("MOUNTED Thorvald_Katana on B_Weapon (tilt %.1f deg)" % a.sword1_tilt)

w2 = load_katana("Thorvald_Katana_2")
bone_parent(w2, OFFHAND)
w2.matrix_basis = basis
print("MOUNTED Thorvald_Katana_2 on %s (same local offset as sword 1)" % OFFHAND)

# --- bring in the DualSwords actions and key B_Weapon_L in each from its own clip track --------------------------
rig.data.pose_position = pose_mode
pb_l = rig.pose.bones[OFFHAND]
pb_l.rotation_mode = "QUATERNION"
actions = {}
for clip in CLIPS:
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(ANIM_DIR, "Iakin_DualSwords_%s.fbx" % clip))
    new = [o for o in bpy.data.objects if o not in before]
    act = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    act.name = "DualSwords_%s" % clip
    act.use_fake_user = True
    rig.animation_data.action = act
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
    mats = tracks[clip]
    for i, f in enumerate(range(f0, f1 + 1)):
        pb_l.matrix_basis = rest_rel.inverted() @ mats[min(i, len(mats) - 1)]
        pb_l.keyframe_insert("location", frame=f)
        pb_l.keyframe_insert("rotation_quaternion", frame=f)
    actions[clip] = act
    print("ACTION %s frames %d-%d, %s keyed from %d track samples" % (act.name, f0, f1, OFFHAND, len(mats)))

rig.animation_data.action = actions[CLIPS[0]]
bpy.context.scene.frame_set(int(actions[CLIPS[0]].frame_range[0]))

for img in bpy.data.images:
    if img.source == "FILE" and not img.packed_file and os.path.exists(bpy.path.abspath(img.filepath)):
        img.pack()
bpy.ops.wm.save_as_mainfile(filepath=OUT, compress=True)
print("SAVED", OUT)
