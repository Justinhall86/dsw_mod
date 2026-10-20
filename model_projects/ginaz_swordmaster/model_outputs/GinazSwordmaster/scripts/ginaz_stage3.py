"""Stage 3: skin ginaz_lo to the Male01 rig (taken from the Landsraad Guard export).

Needs the scene from ginaz_stage2.py. Result: ginaz_lo parented to armature "Rig" with an
Armature modifier, max 3 influences per vertex, cape weighted to the B_Cape01..03 chain.
Saves model_work/ginaz_stage3.blend.
"""
import os
import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
GUARD = os.path.join(ROOT, "model_outputs", "Male01_LandsraadGuard.fbx")
lo = bpy.data.objects["ginaz_lo"]


def sstep(a, lo_, hi_):
    t = np.clip((a - lo_) / (hi_ - lo_), 0, 1)
    return t * t * (3 - 2 * t)


# ---------------------------------------------------------------- 1. bring in the rig, drop the guard's mesh
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=GUARD, use_anim=False, use_manual_orientation=False,
                         automatic_bone_orientation=False, primary_bone_axis="Y", secondary_bone_axis="X")
new = [o for o in bpy.data.objects if o not in before]
rig = next(o for o in new if o.type == "ARMATURE")
rig.name = "Rig"
for o in new:
    if o.type == "MESH":
        bpy.data.objects.remove(o, do_unlink=True)
for nm in ("B_Cape01", "B_Cape02", "B_Cape03", "B_HeadJ", "B_Neck01J", "B_SpineTopJ"):
    b = rig.data.bones[nm]
    print(f"  {nm:12s} head=({b.head_local.x:+.3f},{b.head_local.y:+.3f},{b.head_local.z:+.3f}) tail=({b.tail_local.x:+.3f},{b.tail_local.y:+.3f},{b.tail_local.z:+.3f})")

# ---------------------------------------------------------------- 2. automatic weights
for o in bpy.context.view_layer.objects:
    o.select_set(False)
lo.hide_set(False)
rig.hide_set(False)
lo.select_set(True)
rig.select_set(True)
bpy.context.view_layer.objects.active = rig
bpy.ops.object.parent_set(type="ARMATURE_AUTO")
groups = {g.index: g.name for g in lo.vertex_groups}
me = lo.data
n = len(me.vertices)
unweighted = sum(1 for v in me.vertices if not any(g.weight > 1e-4 for g in v.groups))
print("auto weights: vertex groups", len(lo.vertex_groups), "| vertices with no weight:", unweighted, "of", n)

# ---------------------------------------------------------------- 3. cape -> cape bone chain
co = np.empty(n * 3, dtype=np.float32)
me.vertices.foreach_get("co", co)
co = co.reshape(-1, 3).astype(np.float64)
buf = np.empty(n * 4, dtype=np.float32)
me.color_attributes["Col"].data.foreach_get("color", buf)
colr = buf.reshape(-1, 4)[:, :3].astype(np.float64)
is_cape_col = np.linalg.norm(colr - np.array((0.055, 0.060, 0.085)), axis=1) < 0.035
cape = is_cape_col & (co[:, 1] > 0.10) & (co[:, 2] < 1.55) & (co[:, 2] > 0.30)
print("cape vertices:", int(cape.sum()))
CAPE = ["B_Cape01", "B_Cape02", "B_Cape03"]
CZ = np.array([rig.data.bones[b].head_local.z for b in CAPE])   # descending heights
for b in CAPE:
    if b not in lo.vertex_groups:
        lo.vertex_groups.new(name=b)
gidx = {g.name: g.index for g in lo.vertex_groups}
c_amt = sstep(-co[:, 2], -1.40, -1.10)           # 0 near the shoulders (stay on the body), 1 from the waist down
for i in (int(k) for k in np.where(cape)[0]):
    z = co[i, 2]
    # linear interpolation along the chain by height
    wts = np.zeros(3)
    if z >= CZ[0]:
        wts[0] = 1.0
    elif z >= CZ[1]:
        t = (CZ[0] - z) / (CZ[0] - CZ[1]); wts[0], wts[1] = 1 - t, t
    elif z >= CZ[2]:
        t = (CZ[1] - z) / (CZ[1] - CZ[2]); wts[1], wts[2] = 1 - t, t
    else:
        wts[2] = 1.0
    wts *= c_amt[i] * 0.95
    keep = 1.0 - wts.sum()
    v = me.vertices[i]
    cur = {groups[g.group]: g.weight for g in v.groups}
    tot = sum(cur.values()) or 1.0
    for name in list(cur):
        lo.vertex_groups[name].add([i], cur[name] / tot * keep, "REPLACE")
    for j, b in enumerate(CAPE):
        if wts[j] > 1e-4:
            lo.vertex_groups[b].add([i], float(wts[j]), "REPLACE")

# ---------------------------------------------------------------- 4. cap at 3 influences + normalize + sanity report
bpy.context.view_layer.objects.active = lo
bpy.ops.object.vertex_group_limit_total(group_select_mode="ALL", limit=3)
bpy.ops.object.vertex_group_normalize_all(group_select_mode="ALL", lock_active=False)
inf = [len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices]
tot = np.array([sum(g.weight for g in v.groups) for v in me.vertices])
print("max influences:", max(inf), "| weight sums min/max: %.3f / %.3f" % (tot.min(), tot.max()), "| zero-weight verts:", int((tot < 1e-4).sum()))
use = {}
for v in me.vertices:
    for g in v.groups:
        if g.weight > 0.05:
            use[lo.vertex_groups[g.group].name] = use.get(lo.vertex_groups[g.group].name, 0) + 1
print("bones with weighted vertices:", len(use), "of", len(rig.data.bones))
print("  top:", sorted(use.items(), key=lambda kv: -kv[1])[:12])
print("  head/neck:", {k: use.get(k, 0) for k in ("B_HeadJ", "B_Neck01J", "B_SpineTopJ")}, "| cape:", {k: use.get(k, 0) for k in CAPE})
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "ginaz_stage3.blend"))
print("saved ginaz_stage3.blend")
