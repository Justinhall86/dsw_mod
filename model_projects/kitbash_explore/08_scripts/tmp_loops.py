import bpy, bmesh
o=bpy.data.objects["BannerjeeHead"]
bm=bmesh.new(); bm.from_mesh(o.data)
bnd=[e for e in bm.edges if e.is_boundary]
seen=set(); loops=[]
for e in bnd:
    if e.index in seen: continue
    st=[e]; seen.add(e.index); L=[]
    while st:
        x=st.pop(); L.append(x)
        for v in x.verts:
            for e2 in v.link_edges:
                if e2.is_boundary and e2.index not in seen: seen.add(e2.index); st.append(e2)
    loops.append(L)
for L in sorted(loops,key=len,reverse=True):
    vs={v for e in L for v in e.verts}
    xs=[v.co.x for v in vs]; ys=[v.co.y for v in vs]; zs=[v.co.z for v in vs]
    print("LOOP edges %d x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f"%(len(L),min(xs),max(xs),min(ys),max(ys),min(zs),max(zs)))
