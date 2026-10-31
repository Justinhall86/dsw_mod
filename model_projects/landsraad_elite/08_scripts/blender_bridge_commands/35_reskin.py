import numpy as np
lo = bpy.data.objects["elite_lo"]; rig = bpy.data.objects["Rig"]
for m in list(lo.modifiers): lo.modifiers.remove(m)
for g in list(lo.vertex_groups): lo.vertex_groups.remove(g)
lo.parent = None; lo.matrix_world.identity()
for pb in rig.pose.bones: pb.matrix_basis.identity()
for b in rig.data.bones:
    b.use_deform = b.name not in ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard")
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); rig.select_set(True)
bpy.context.view_layer.objects.active = rig
bpy.ops.object.parent_set(type="ARMATURE_AUTO")
me = lo.data; n = len(me.vertices)
bpy.context.view_layer.objects.active = lo
bpy.ops.object.vertex_group_limit_total(group_select_mode="ALL", limit=3)
bpy.ops.object.vertex_group_normalize_all(group_select_mode="ALL", lock_active=False)
inf = [len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices]
tot = np.array([sum(g.weight for g in v.groups) for v in me.vertices])
print("groups", len(lo.vertex_groups), "max influences", max(inf), "weight sums %.3f..%.3f" % (tot.min(), tot.max()), "zero", int((tot < 1e-4).sum()))
use = {}
for v in me.vertices:
    for g in v.groups:
        if g.weight > 0.05: use[lo.vertex_groups[g.group].name] = use.get(lo.vertex_groups[g.group].name, 0) + 1
print("prop-bone weighted verts:", {k: use.get(k, 0) for k in ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard")})
print("cape:", {k: use.get(k, 0) for k in ("B_Cape01", "B_Cape02", "B_Cape03")}, "| bones used", len(use))
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_work\elite_stage3.blend")
