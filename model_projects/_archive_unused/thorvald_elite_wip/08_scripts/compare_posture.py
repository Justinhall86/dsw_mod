"""Side-by-side posture check: this unit next to a vanilla unit (default the Atreides Trooper), same clip, same frame, front + side views.

    blender -b <unit.blend> --python compare_posture.py -- <out_dir> <tag> [--other AtreidesSoldier] [--clip Common_FightIdle] [--frames 1,20]

Frame 0 = rest pose (no clip).  Game-style matte preview, back-face culling on.  Also prints, per frame, a few posture numbers for both rigs
(head height, how far the head sits in front of the pelvis, shoulder height) so "hunched" can be measured, not only seen.
"""
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
out, tag = os.path.abspath(a[0]), a[1]
other = a[a.index("--other") + 1] if "--other" in a else "AtreidesSoldier"
clip = a[a.index("--clip") + 1] if "--clip" in a else "Common_FightIdle"
frames = [int(x) for x in a[a.index("--frames") + 1].split(",")] if "--frames" in a else [0, 20]
os.makedirs(out, exist_ok=True)

me_rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
before = set(bpy.data.objects)
fbx, _ = paths(other)
bpy.ops.import_scene.fbx(filepath=fbx)
new = [o for o in bpy.data.objects if o not in before]
for o in list(new):
    if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
        new.remove(o)
ot_rig = next(o for o in new if o.type == "ARMATURE")
for o in new:
    if o.type == "MESH":
        for mat in o.data.materials:
            if mat and mat.use_nodes:
                bs.wire_textures(mat, material_paths(other, mat.name))
ot_rig.location.x += 1.1

b0 = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
nw = [o for o in bpy.data.objects if o not in b0]
act = next(o for o in nw if o.type == "ARMATURE").animation_data.action
act.use_fake_user = True
for o in nw:
    bpy.data.objects.remove(o, do_unlink=True)

PW.apply_all()
for m in bpy.data.materials:
    m.use_backface_culling = True
sc = bpy.context.scene
bs.setup_render(900, 900)


def posture(rig):
    def h(n):
        return rig.matrix_world @ rig.pose.bones[n].head
    head, pel, neck = h("B_HeadJ"), h("B_ROOTJ"), h("B_Neck01J")
    sh = (h("B_lShoulderJ") + h("B_rShoulderJ")) / 2
    return "head z %.3f  head ahead of pelvis %.3f  neck z %.3f  shoulders z %.3f  head-shoulder %.3f" % (
        head.z, -(head.y - pel.y), neck.z, sh.z, head.z - sh.z)


for f in frames:
    for rig in (me_rig, ot_rig):
        rig.animation_data_create()
        if f == 0:
            rig.animation_data.action = None
            for pb in rig.pose.bones:
                pb.matrix_basis.identity()
        else:
            rig.animation_data.action = act
            if getattr(act, "slots", None):
                rig.animation_data.action_slot = act.slots[0]
    sc.frame_set(max(f, 1))
    bpy.context.view_layer.update()
    print("POSTURE f%d %-16s %s" % (f, "this unit", posture(me_rig)))
    print("POSTURE f%d %-16s %s" % (f, other, posture(ot_rig)))
    for vn, d in (("front", (0, -1, 0.05)), ("side", (1, 0, 0.05))):
        cam = bs.setup_camera(target=Vector((0.55, 0.0, 1.0)), ortho_scale=2.6, direction=d, distance=8)
        bs.render_to(os.path.join(out, "%s_f%02d_%s.png" % (tag, f, vn)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
