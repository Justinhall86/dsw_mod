import numpy as np
lo = bpy.data.objects["elite_lo"]; rig = bpy.data.objects["Rig"]
rig.hide_set(False); rig.hide_viewport = False
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); rig.select_set(True)
bpy.context.view_layer.objects.active = rig
bpy.ops.object.parent_set(type="ARMATURE_AUTO")
me = lo.data; n = len(me.vertices)
unw = [v.index for v in me.vertices if not any(g.weight > 1e-4 for g in v.groups)]
print("vertex groups", len(lo.vertex_groups), "| vertices with no weight:", len(unw), "of", n)
# give unweighted vertices (separate islands / failed heat solve) the weights of their nearest weighted vertex
if unw:
    co = np.empty(n*3, dtype=np.float32); me.vertices.foreach_get('co', co); co = co.reshape(-1,3)
    ok = np.array([i for i in range(n) if i not in set(unw)])
    from mathutils.kdtree import KDTree
    kd = KDTree(len(ok))
    for k, i in enumerate(ok): kd.insert(co[i].tolist(), int(i))
    kd.balance()
    names = {g.index: g.name for g in lo.vertex_groups}
    for i in unw:
        _, j, _ = kd.find(co[i].tolist())
        for g in me.vertices[j].groups:
            if g.weight > 1e-4: lo.vertex_groups[names[g.group]].add([i], g.weight, "REPLACE")
bpy.context.view_layer.objects.active = lo
bpy.ops.object.vertex_group_limit_total(group_select_mode="ALL", limit=3)
bpy.ops.object.vertex_group_normalize_all(group_select_mode="ALL", lock_active=False)
inf = [len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices]
tot = np.array([sum(g.weight for g in v.groups) for v in me.vertices])
print("max influences", max(inf), "| weight sums min/max %.3f / %.3f" % (tot.min(), tot.max()), "| zero-weight verts", int((tot < 1e-4).sum()))
use = {}
for v in me.vertices:
    for g in v.groups:
        if g.weight > 0.05: use[lo.vertex_groups[g.group].name] = use.get(lo.vertex_groups[g.group].name, 0) + 1
print("bones used:", len(use), "of", len(rig.data.bones))
print("top:", sorted(use.items(), key=lambda kv: -kv[1])[:14])
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_work\elite_stage3.blend")
