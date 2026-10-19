"""v2 upscale, step 1 (run in the GUI Blender via the bridge: exec(open(path).read(), globals())).
Needs the scene from 03_blender/elite_stage1.blend (objects elite_hi with colour attribute "Col", Rig).
 - per-vertex view weights "VW" on elite_hi (R = visible+facing the front view, G = back view, B = side view) used by the
   image-projection bake, so each texel takes its colour from the reference render that can actually see it
 - a new elite_lo at ~20,000 triangles (head+hands protected first, then the body)
"""
import numpy as np, bmesh, os
from mathutils import Vector
from mathutils.bvhtree import BVHTree

TARGET_TRIS = 20000
HH_TARGET = 5200            # head + hands budget; the body gets the rest
hi = bpy.data.objects["elite_hi"]
for nm in ("elite_lo",):
    o = bpy.data.objects.get(nm)
    if o: bpy.data.objects.remove(o, do_unlink=True)
for m in list(bpy.data.meshes):
    if m.name.startswith("elite_lo") and m.users == 0: bpy.data.meshes.remove(m)
hi.hide_viewport = False; hi.hide_render = False; hi.hide_set(False)
me = hi.data; n = len(me.vertices)

# ------------------------------------------------ 1. view weights
bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table(); bm.normal_update()
tree = BVHTree.FromBMesh(bm)
P = np.array([v.co[:] for v in bm.verts]); N = np.array([v.normal[:] for v in bm.verts])
bm.free()
# (direction towards the camera, channel). The reference has one side view (from +x); the model is symmetric, so faces
# on the -x side sample the same picture (same y,z) - the mapping in the bake ignores the sign of x.
views = ((np.array([0, -1.0, 0]), 0), (np.array([0, 1.0, 0]), 1), (np.array([1.0, 0, 0]), 2), (np.array([-1.0, 0, 0]), 2))
VW = np.zeros((n, 3))
for d, k in views:
    dv = Vector(d.tolist())
    for i in range(n):
        w = float(N[i] @ d)
        if w < 0.45: continue
        if tree.ray_cast(Vector(P[i]) + dv * 2e-3, dv, 5.0)[0] is not None: continue
        VW[i, k] = max(VW[i, k], w * w)
seen = VW.sum(1) > 0
print("vertices seen by at least one view:", int(seen.sum()), "of", n)
vw = me.color_attributes.get("VW") or me.color_attributes.new("VW", "FLOAT_COLOR", "POINT")
vw.data.foreach_set("color", np.concatenate([VW, np.ones((n, 1))], 1).astype(np.float32).ravel())

# ------------------------------------------------ 2. low-poly at ~20k triangles
co = P
lo = hi.copy(); lo.data = hi.data.copy(); lo.name = "elite_lo"; lo.data.name = "elite_lo"
lo.hide_viewport = False; lo.hide_render = False
bpy.context.collection.objects.link(lo)
hh = (co[:, 2] > 1.66) | ((np.abs(co[:, 0]) > 0.66) & (co[:, 2] < 1.25) & (co[:, 2] > 0.8))
g_hh = lo.vertex_groups.new(name="hh"); g_hh.add([int(i) for i in np.where(hh)[0]], 1.0, "REPLACE")
g_body = lo.vertex_groups.new(name="body"); g_body.add([int(i) for i in np.where(~hh)[0]], 1.0, "REPLACE")
t_hh = sum(1 for p in hi.data.polygons if all(hh[v] for v in p.vertices)); N0 = len(lo.data.polygons)
print("source tris", N0, "head+hands tris", t_hh)


def decimate(group, ratio, name):
    m = lo.modifiers.new(name, "DECIMATE"); m.decimate_type = "COLLAPSE"; m.use_collapse_triangulate = True
    m.vertex_group = group; m.invert_vertex_group = True; m.ratio = ratio
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.modifier_apply(modifier=name)
    print(name, "ratio %.3f ->" % ratio, len(lo.data.polygons), "tris")


decimate("body", (N0 - (t_hh - HH_TARGET)) / N0, "DecHeadHands")             # protect body, shrink head/hands
cur = len(lo.data.polygons)
decimate("hh", min(1.0, TARGET_TRIS / cur), "DecBody")                       # protect head/hands, shrink body
for g in list(lo.vertex_groups): lo.vertex_groups.remove(g)
b2 = bmesh.new(); b2.from_mesh(lo.data)
bmesh.ops.remove_doubles(b2, verts=b2.verts, dist=1e-5)
bmesh.ops.triangulate(b2, faces=b2.faces[:])
bmesh.ops.recalc_face_normals(b2, faces=b2.faces[:])
b2.to_mesh(lo.data); b2.free()
for p in lo.data.polygons: p.use_smooth = True
print("elite_lo:", len(lo.data.vertices), "verts", len(lo.data.polygons), "tris")
