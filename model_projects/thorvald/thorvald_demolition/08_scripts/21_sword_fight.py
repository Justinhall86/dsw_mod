"""Render a short sword fight: this unit (open blend, katana mounted) against a vanilla unit (Duncan, with his own baked Atreides sword).

    blender -b <unit.blend> --python 21_sword_fight.py -- <out_dir> [--opponent Duncan] [--px 640] [--gap 1.45]

Both rigs play the generic Common clips, sequenced with NLA strips so each fighter has its own timeline (attack <-> hit reactions).
The unit stands at -x facing +x, the opponent at +x facing -x; a fixed orthographic camera from the front-side frames both.
Frames: <out_dir>/fNNN.png (game-style matte preview, back-face culling on).
"""
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402
from units import material_paths, paths  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(a[0])
opp_key = a[a.index("--opponent") + 1] if "--opponent" in a else "Duncan"
px = int(a[a.index("--px") + 1]) if "--px" in a else 640
gap = float(a[a.index("--gap") + 1]) if "--gap" in a else 1.9
os.makedirs(out, exist_ok=True)

me_rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)

# ---- opponent ---------------------------------------------------------------------------------------------------------------------
before = set(bpy.data.objects)
fbx, _ = paths(opp_key)
bpy.ops.import_scene.fbx(filepath=fbx)
new = [o for o in bpy.data.objects if o not in before]
for o in list(new):
    if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
        new.remove(o)
opp_rig = next(o for o in new if o.type == "ARMATURE")
for o in new:
    if o.type == "MESH":
        for mat in o.data.materials:
            if mat and mat.use_nodes:
                bs.wire_textures(mat, material_paths(opp_key, mat.name))

# ---- opponent's sword: the stock Atreides sword (his prefab weapon), same rest-pose mount as the unit's katana ---------------------
from mathutils import Matrix  # noqa: E402
b0 = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "AtreideSword_TRUE_FBX.fbx"))
nw = [o for o in bpy.data.objects if o not in b0]
osw = max([o for o in nw if o.type == "MESH"], key=lambda o: len(o.data.vertices))
for o in nw:
    if o is not osw:
        bpy.data.objects.remove(o, do_unlink=True)
for mat in osw.data.materials:
    if mat and mat.use_nodes:
        for lk in list(mat.node_tree.links):
            if lk.to_socket.name in ("Specular IOR Level", "Normal", "Metallic", "Roughness"):
                mat.node_tree.links.remove(lk)
        bs.wire_textures(mat, {"Base Color": os.path.join(PROJ, "04_textures", "sword", "MetalSword_Albedo.png")})
osw.matrix_world = Matrix.Identity(4)
opp_rig.animation_data_create()
opp_rig.animation_data.action = None
bpy.context.view_layer.update()
osw.parent = opp_rig
osw.parent_type = "BONE"
osw.parent_bone = "B_Weapon"
osw.matrix_parent_inverse = Matrix.Translation((0.0, -opp_rig.pose.bones["B_Weapon"].bone.length, 0.0))
bpy.context.view_layer.update()
osw.matrix_world = (Matrix.Translation((0.0, 0.03, 0.12)) @ Matrix.Rotation(math.radians(90.0), 4, "X") @ Matrix.Translation((0.0, -0.20, 0.0)))
bpy.context.view_layer.update()

# ---- pivots: each fighter hangs under an empty that is turned so it faces the other one --------------------------------------------
bpy.context.preferences.edit.keyframe_new_interpolation_type = "CONSTANT"   # pivot turns snap at clip changes, never spin
PIV = {}
for rig, x in ((me_rig, -gap / 2), (opp_rig, gap / 2)):
    e = bpy.data.objects.new("Pivot_" + rig.name, None)
    bpy.context.collection.objects.link(e)
    e.location = Vector((x, 0.0, 0.0))
    rig.parent = e
    PIV[rig] = e
bpy.context.view_layer.update()


def clip_yaw(rig, act):
    """Mean facing (radians, atan2 of the forward vector in xy) of a clip on an unrotated rig: forward = Z x (right shoulder - left shoulder)."""
    rig.animation_data.action = act
    if getattr(act, "slots", None):
        rig.animation_data.action_slot = act.slots[0]
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
    sx = sy = 0.0
    for f in range(f0, f1 + 1, 3):
        bpy.context.scene.frame_set(f)
        l_ = rig.matrix_basis.to_3x3() @ rig.pose.bones["B_lShoulderJ"].head      # shoulders, not hips: the fight stance turns the hips side-on; relative to the pivot (whatever it is turned to)
        r_ = rig.matrix_basis.to_3x3() @ rig.pose.bones["B_rShoulderJ"].head
        fw = Vector((0, 0, 1)).cross(r_ - l_)
        sx += fw.x
        sy += fw.y
    rig.animation_data.action = None
    return math.atan2(sy, sx)


# ---- clips -----------------------------------------------------------------------------------------------------------------------
ACT = {}


def action(clip):
    if clip in ACT:
        return ACT[clip]
    b0 = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
    nw = [o for o in bpy.data.objects if o not in b0]
    act = next(o for o in nw if o.type == "ARMATURE").animation_data.action
    act.use_fake_user = True
    for o in nw:
        bpy.data.objects.remove(o, do_unlink=True)
    ACT[clip] = act
    return act


def sequence(rig, plan, face):
    """plan: [(clip, timeline start, length or None)].  One NLA track, strips back to back; the pivot is turned at every strip so the
    fighter faces `face` (radians) whatever the clip's own stance angle."""
    rig.animation_data_create()
    rig.animation_data.action = None
    piv = PIV[rig]
    prev = None
    for clip, start, length in plan:
        yaw = clip_yaw(rig, action("Common_" + clip))
        r = face - yaw
        if prev is not None:
            r = prev + (r - prev + math.pi) % (2 * math.pi) - math.pi      # shortest equivalent angle: never spins the long way round
            piv.rotation_euler = (0.0, 0.0, prev)
            piv.keyframe_insert("rotation_euler", index=2, frame=int(start) - 1)   # hold key: the turn snaps at the clip change
        piv.rotation_euler = (0.0, 0.0, r)
        piv.keyframe_insert("rotation_euler", index=2, frame=int(start))
        prev = r
    rig.animation_data.action = None
    tr = rig.animation_data.nla_tracks.new()
    for i, (clip, start, length) in enumerate(plan):
        act = action("Common_" + clip)
        st = tr.strips.new("%s_%d" % (clip, i), int(start), act)
        if getattr(act, "slots", None):
            st.action_slot = act.slots[0]
        if length:
            st.action_frame_end = st.action_frame_start + length - 1
            st.frame_end = st.frame_start + length - 1
        st.extrapolation = "HOLD_FORWARD" if i == len(plan) - 1 else "NOTHING"
        st.blend_type = "REPLACE"
    return max(s.frame_end for s in tr.strips)


# the unit attacks, the opponent is hit; the opponent strikes back, the unit is hit; the unit finishes with the second combo
end1 = sequence(me_rig, [("FightIdle", 1, 12), ("AttackMelee01", 13, None), ("FightIdle", 56, 30), ("FightHitFront", 86, None),
                         ("AttackMelee02", 117, None), ("FightIdle", 170, 20)], 0.0)
end2 = sequence(opp_rig, [("FightIdle", 1, 30), ("FightHitFront", 31, None), ("FightIdle", 62, 14), ("AttackMelee01", 76, None),
                          ("FightIdle", 119, 15), ("FightHitFront", 134, None), ("FightIdle", 165, 25)], math.pi)
last = int(min(end1, end2, 189))

# ---- look -----------------------------------------------------------------------------------------------------------------------
PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
sc = bpy.context.scene
bs.setup_render(px, int(px * 0.72))
cam = bs.setup_camera(target=Vector((0.0, 0.0, 0.95)), ortho_scale=3.4, direction=(0.25, -1.0, 0.18), distance=8)
only = [int(x) for x in a[a.index("--frames") + 1].split(",")] if "--frames" in a else range(1, last + 1)
for f in only:
    sc.frame_set(f)
    bs.render_to(os.path.join(out, "f%03d.png" % f), cam)
print("FIGHT frames", last)
