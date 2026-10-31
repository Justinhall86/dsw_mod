"""v2 step 3: skin elite_lo (20k tris) to the Male01 rig with the fixes found on the 7.5k version:
prop bones non-deform; auto weights; the two pauldron islands -> clavicles (85%) + SpineTop (15%); weights smoothed
(numpy, 5 passes) so the robe does not tear between the legs; the collar band -> Neck + SpineTop; <=3 influences."""
import numpy as np, bmesh
lo = bpy.data.objects["elite_lo"]; rig = bpy.data.objects["Rig"]; me = lo.data
PROPS = ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard")
for m in list(lo.modifiers): lo.modifiers.remove(m)
for g in list(lo.vertex_groups): lo.vertex_groups.remove(g)
lo.parent = None; lo.matrix_world.identity()
if rig.animation_data: rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
for b in rig.data.bones: b.use_deform = b.name not in PROPS
rig.hide_set(False); rig.hide_viewport = False
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); rig.select_set(True); bpy.context.view_layer.objects.active = rig
bpy.ops.object.parent_set(type="ARMATURE_AUTO")
n = len(me.vertices)
unw = [v.index for v in me.vertices if not any(g.weight > 1e-4 for g in v.groups)]
print("auto weights: groups", len(lo.vertex_groups), "| unweighted verts", len(unw))
co = np.empty(n * 3, dtype=np.float32); me.vertices.foreach_get("co", co); co = co.reshape(-1, 3).astype(np.float64)
names = [g.name for g in lo.vertex_groups]; idx = {g.index: k for k, g in enumerate(lo.vertex_groups)}
W = np.zeros((n, len(names)))
for v in me.vertices:
    for g in v.groups: W[v.index, idx[g.group]] = g.weight
# hand bones may only influence vertices near the hand: the rig's wrist bone has a long tail pointing down to the thigh, so auto
# weights gave the lower tabard 85% wrist weight and it flew up with the hand in the run/attack clips
HANDISH = ("WristJ", "PalmJ", "Finger", "Thumb")
pruned = 0
for side in "lr":
    head = np.array(rig.matrix_world @ rig.data.bones[f"B_{side}WristJ"].head_local)
    far = np.linalg.norm(co - head, axis=1) > 0.35
    for k, nm in enumerate(names):
        if nm.startswith(f"B_{side}") and any(h in nm for h in HANDISH):
            pruned += int(((W[:, k] > 0) & far).sum()); W[far, k] = 0
empty = W.sum(1) < 1e-6
print("hand-bone weights pruned from far vertices:", pruned, "| vertices left with nothing:", int(empty.sum()))
for i in np.where(empty)[0]: W[i, names.index("B_ROOTJ")] = 1.0
W /= np.maximum(W.sum(1, keepdims=True), 1e-9)
# islands
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x.index)
        for e in x.link_edges:
            w = e.other_vert(x)
            if w.index not in seen: seen.add(w.index); st.append(w)
    comps.append(c)
nb = [[e.other_vert(v).index for e in v.link_edges] for v in bm.verts]
bm.free(); comps.sort(key=len, reverse=True)
print("islands:", [len(c) for c in comps][:6])
pad = np.zeros(n, bool)
for comp in comps[1:]:
    cx, cz = co[comp, 0].mean(), co[comp, 2].mean()
    if abs(cx) > 0.15 and cz > 1.25:                                   # the two pauldrons
        side = "l" if cx > 0 else "r"
        for i in comp:
            W[i] = 0; W[i, names.index(f"B_{side}ClavicleJ")] = 0.85; W[i, names.index("B_SpineTopJ")] = 0.15; pad[i] = True
print("pauldron verts:", int(pad.sum()))
for it in range(5):
    Wn = W.copy()
    for i in range(n):
        if pad[i] or not nb[i]: continue
        Wn[i] = 0.5 * W[i] + 0.5 * W[nb[i]].mean(0)
    W = Wn
band = (co[:, 2] > 1.56) & (co[:, 2] < 1.84) & (np.abs(co[:, 0]) > 0.12) & (np.abs(co[:, 0]) < 0.32) & ~pad
# gold collar pieces (any x, incl. the back of the standing collar near the centre line): gold colour + neck height
cbuf = np.empty(n * 4, dtype=np.float32); me.color_attributes["Col"].data.foreach_get("color", cbuf); col = cbuf.reshape(-1, 4)[:, :3]
gold_collar = ((col[:, 0] - col[:, 2]) > 0.30) & (co[:, 2] > 1.55) & (co[:, 2] < 1.82) & (np.abs(co[:, 0]) < 0.34) & ~pad
band = band | gold_collar
for i in np.where(band)[0]:
    W[i] = 0; W[i, names.index("B_Neck01J")] = 0.5; W[i, names.index("B_SpineTopJ")] = 0.5
print("collar verts:", int(band.sum()), "(gold-coloured ones:", int(gold_collar.sum()), ")")
top = np.argsort(-W, axis=1)[:, :3]; Wk = np.zeros_like(W)
for i in range(n):
    for k in top[i]: Wk[i, k] = W[i, k]
Wk /= np.maximum(Wk.sum(1, keepdims=True), 1e-9)
for g in lo.vertex_groups: g.remove(list(range(n)))
for k, g in enumerate(lo.vertex_groups):
    for i in np.where(Wk[:, k] > 1e-4)[0]: g.add([int(i)], float(Wk[i, k]), "REPLACE")
inf = [len([g for g in v.groups if g.weight > 1e-4]) for v in me.vertices]
print("max influences", max(inf), "| prop-bone weighted verts:", sum(1 for v in me.vertices for g in v.groups if names[idx[g.group]] in PROPS and g.weight > 0.05))
try:
    bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_projects\landsraad_elite\03_blender\v2_stage3_skinned.blend")
except RuntimeError as e:
    print("save skipped:", str(e)[:60])
