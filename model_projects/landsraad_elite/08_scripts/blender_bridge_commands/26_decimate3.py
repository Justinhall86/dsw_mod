hi = bpy.data.objects["elite_hi"]
old = bpy.data.objects.get("elite_lo")
if old: bpy.data.objects.remove(old, do_unlink=True)
for m in list(bpy.data.meshes):
    if m.name.startswith("elite_lo") and m.users == 0: bpy.data.meshes.remove(m)
hi.hide_viewport = False; hi.hide_set(False)
n = len(hi.data.vertices)
co = np.empty(n*3, dtype=np.float32); hi.data.vertices.foreach_get('co', co); co = co.reshape(-1,3).astype(np.float64)
lo = hi.copy(); lo.data = hi.data.copy(); lo.name = "elite_lo"; lo.data.name = "elite_lo"
bpy.context.collection.objects.link(lo)
hh = (co[:,2] > 1.66) | ((np.abs(co[:,0]) > 0.66) & (co[:,2] < 1.25) & (co[:,2] > 0.8))
g_hh = lo.vertex_groups.new(name="hh"); g_hh.add([int(i) for i in np.where(hh)[0]], 1.0, "REPLACE")
g_body = lo.vertex_groups.new(name="body"); g_body.add([int(i) for i in np.where(~hh)[0]], 1.0, "REPLACE")
def count_tris():
    hhm = hh
    t_hh = sum(1 for p in hi.data.polygons if all(hhm[v] for v in p.vertices))
    return t_hh
t_hh = count_tris(); N = len(lo.data.polygons)
print("total tris", N, "head+hands tris", t_hh, "body tris", N - t_hh)
def decimate(group, ratio, name):
    m = lo.modifiers.new(name, "DECIMATE"); m.decimate_type = "COLLAPSE"; m.use_collapse_triangulate = True
    m.vertex_group = group; m.invert_vertex_group = True; m.ratio = ratio
    bpy.context.view_layer.objects.active = lo
    bpy.ops.object.modifier_apply(modifier=name)
    print(name, "ratio %.3f ->" % ratio, len(lo.data.polygons), "tris")
HH_TARGET, BODY_TARGET = 2600, 4900
decimate("body", (N - t_hh + 0) and (t_hh * 0 + (N - (t_hh - HH_TARGET))) / N, "DecHeadHands")   # protect body, shrink head/hands
# vertex groups survive the modifier; recompute counts for stage 2
cur = len(lo.data.polygons)
body_now = cur - HH_TARGET
decimate("hh", (HH_TARGET + BODY_TARGET) / cur, "DecBody")                                      # protect head/hands, shrink body
for g in list(lo.vertex_groups): lo.vertex_groups.remove(g)
bm = bmesh.new(); bm.from_mesh(lo.data)
bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=1e-5)
bmesh.ops.triangulate(bm, faces=bm.faces[:])
bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
bm.to_mesh(lo.data); bm.free()
for p in lo.data.polygons: p.use_smooth = True
print("lo:", len(lo.data.vertices), "verts", len(lo.data.polygons), "tris")
hi.hide_render = True; hi.hide_viewport = True
print(cshot("10_lowpoly_front", rz=0, scale=2.3, loc=(0,0,1.0)))
