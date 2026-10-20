from mathutils.bvhtree import BVHTree
o = bpy.data.objects["elite_src"]; me = o.data
def passes(thr, region_only=True):
    bm = bmesh.new(); bm.from_mesh(me); bm.verts.ensure_lookup_table(); bm.normal_update()
    tree = BVHTree.FromBMesh(bm)
    kill = []
    for v in bm.verts:
        c = v.co
        inzone = (abs(c.x) > 0.33 and 0.05 < c.z < 0.47) or c.z < -0.49
        if region_only and not inzone: continue
        n = v.normal
        if n.length < 0.5: kill.append(v); continue
        d = -n
        hit = tree.ray_cast(c + d * 1e-4, d, 0.05)
        if hit[0] is not None and hit[3] < thr: kill.append(v)
    bmesh.ops.delete(bm, geom=kill, context='VERTS')
    seen=set(); comps=[]
    for v in bm.verts:
        if v.index in seen: continue
        st=[v]; cc=[]; seen.add(v.index)
        while st:
            x=st.pop(); cc.append(x)
            for e in x.link_edges:
                w=e.other_vert(x)
                if w.index not in seen: seen.add(w.index); st.append(w)
        comps.append(cc)
    comps.sort(key=len, reverse=True)
    bmesh.ops.delete(bm, geom=[v for cc in comps[3:] for v in cc], context='VERTS')
    bm.to_mesh(me); bm.free(); me.update()
    print("thr", thr, "deleted", len(kill), "-> verts", len(me.vertices), "comps(before cleanup)", [len(c) for c in comps[:6]])
passes(0.004); passes(0.006)
bpy.context.view_layer.update()
print(cshot("06_elite_front_cleaned", rz=0))
print(cshot("06_elite_zoom_hand", rz=0, scale=0.7, loc=(0.42, 0, 0.25), w=900, h=900))
