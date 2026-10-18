import math, numpy as np
from mathutils import Matrix, Vector, Euler
G = globals()
rig = bpy.data.objects["Rig"]; lo = bpy.data.objects["ginaz_lo"]; me = lo.data
for pb in rig.pose.bones: pb.matrix_basis.identity()
def sstep(a, l, h):
    t = np.clip((a - l) / (h - l), 0, 1); return t * t * (3 - 2 * t)
# ---- hands: palm bone only beyond the wrist, short blend at the wrist
n = len(me.vertices); co = np.empty(n*3, dtype=np.float32); me.vertices.foreach_get('co', co); co = co.reshape(-1, 3)
x, z = co[:, 0], co[:, 2]; ax = np.abs(x)
t_wrist = (ax - 0.625) * 0.7071 + (z - 1.163) * -0.7071
hand = (ax > 0.36) & (z < 1.52) & (z > 0.85) & (t_wrist > -0.03)
palm = sstep(t_wrist, -0.03, 0.04)
cnt = 0
for i in np.where(hand)[0]:
    i = int(i); side = 'l' if x[i] > 0 else 'r'
    for g in list(me.vertices[i].groups): lo.vertex_groups[g.group].remove([i])
    lo.vertex_groups[f"B_{side}PalmJ"].add([i], float(palm[i]), 'REPLACE')
    if palm[i] < 0.999: lo.vertex_groups[f"B_{side}WristJ"].add([i], float(1 - palm[i]), 'REPLACE')
    cnt += 1
print("hand vertices rebound to palm/wrist:", cnt)
# ---- load a real game animation onto the rig and render frames
def play(name, frames, tag, rz=210, dist=2.6, loc=(0, 0.2, 0.95)):
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=rf"{BRIDGE}\..\anim\guard_{name}.fbx", use_anim=True, use_manual_orientation=False,
                             automatic_bone_orientation=False, primary_bone_axis='Y', secondary_bone_axis='X')
    new = [o for o in bpy.data.objects if o not in before]
    src = next(o for o in new if o.type == 'ARMATURE'); act = src.animation_data.action
    for o in new: bpy.data.objects.remove(o, do_unlink=True)
    rig.animation_data_create(); rig.animation_data.action = act
    if hasattr(rig.animation_data, "action_slot") and act.slots: rig.animation_data.action_slot = act.slots[0]
    sc = bpy.context.scene; sc.frame_start, sc.frame_end = map(int, act.frame_range); sc.render.fps = 30
    c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
    sp.shading.type = 'MATERIAL'; sp.overlay.show_overlays = False
    out = []
    for f in frames:
        sc.frame_set(f)
        r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector(loc); r3d.view_distance = dist
        r3d.view_rotation = Euler((math.radians(90), 0, math.radians(rz))).to_quaternion()
        out.append(shot3(f"{tag}_f{f:02d}"))
    return act, out
rig.hide_set(True)
act, out = play("Run", (1, 10, 20), "14_run", rz=215)
print(act.name, out)
act, out = play("AttackMelee01", (1, 25, 40), "15_attack", rz=35, loc=(0, 0, 0.95))
print(act.name, out)
