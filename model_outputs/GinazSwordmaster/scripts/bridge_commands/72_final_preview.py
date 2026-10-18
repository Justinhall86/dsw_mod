import math, os, numpy as np
from mathutils import Vector, Euler, Matrix
rig = bpy.data.objects["Armature"]; lo = bpy.data.objects["GinazSwordmaster"]; sc = bpy.context.scene
# ---- attach the Sardaukar sword to B_Weapon the way the prefab does (y -0.1107, rotX -90, scale 0.95)
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=rf"{BRIDGE}\..\anim\sword_conv.fbx")
new = [o for o in bpy.data.objects if o not in before]
sword = next(o for o in new if o.type == 'MESH')
for o in new:
    if o is not sword: bpy.data.objects.remove(o, do_unlink=True)
sword.parent = None; sword.name = "SardaukarSword"
print("sword dims", tuple(round(v, 3) for v in sword.dimensions), "mats", [m.name for m in sword.data.materials])
sword.parent = rig; sword.parent_type = 'BONE'; sword.parent_bone = "B_Weapon"
sword.matrix_parent_inverse = Matrix.Identity(4)
sword.location = (0, -0.1107, 0); sword.rotation_euler = (math.radians(-90), 0, 0); sword.scale = (0.95, 0.95, 0.95)
bpy.context.view_layer.update()
print("sword world loc", tuple(round(v, 3) for v in sword.matrix_world.translation), "| B_Weapon head", tuple(round(v, 3) for v in (rig.matrix_world @ rig.data.bones['B_Weapon'].head_local)))
rig.hide_set(True)
def play(name, frames, tag, rz, dist=2.6, loc=(0, 0, 0.95)):
    b = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=rf"{BRIDGE}\..\anim\sard_{name}.fbx", use_anim=True, use_manual_orientation=False,
                             automatic_bone_orientation=False, primary_bone_axis='Y', secondary_bone_axis='X')
    nw = [o for o in bpy.data.objects if o not in b]
    src = next(o for o in nw if o.type == 'ARMATURE'); act = src.animation_data.action
    for o in nw: bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data_create(); rig.animation_data.action = act
    if hasattr(rig.animation_data, "action_slot") and act.slots: rig.animation_data.action_slot = act.slots[0]
    sc.frame_start, sc.frame_end = map(int, act.frame_range)
    c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
    sp.shading.type = 'MATERIAL'; sp.overlay.show_overlays = False
    outs = []
    for f in frames:
        sc.frame_set(f)
        r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector(loc); r3d.view_distance = dist
        r3d.view_rotation = Euler((math.radians(90), 0, math.radians(rz))).to_quaternion()
        outs.append(shot3(f"{tag}_f{f:02d}"))
    return act.name, outs
rig.animation_data_create(); rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
sp.shading.type = 'MATERIAL'; sp.overlay.show_overlays = False
r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector((0, 0, 0.95)); r3d.view_distance = 2.4
r3d.view_rotation = Euler((math.radians(90), 0, math.radians(20))).to_quaternion()
print(shot3("20_final_rest_with_sword"))
print(play("AttackMelee01", (1, 22, 34, 50), "21_sword_attack", rz=35, dist=3.2, loc=(0, 0, 0.95)))
print(play("Run", (6, 18), "22_sword_run", rz=215, dist=3.0, loc=(0, 0.2, 0.95)))
print(play("Idle", (1,), "23_sword_idle", rz=30, dist=2.4))
