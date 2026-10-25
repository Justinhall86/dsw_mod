import bpy, bmesh, math
o=bpy.data.objects["BannerjeeHead"]
bm=bmesh.new(); bm.from_mesh(o.data)
bnd=[e for e in bm.edges if e.is_boundary]
adj={}
for e in bnd:
    a,b=e.verts; adj.setdefault(a,[]).append(b); adj.setdefault(b,[]).append(a)
seen=set()
for start in list(adj):
    if start in seen: continue
    # walk
    L=[start]; seen.add(start); prev=None; cur=start
    while True:
        nxt=[n for n in adj[cur] if n is not prev and n not in seen]
        if not nxt: break
        prev,cur=cur,nxt[0]; L.append(cur); seen.add(cur)
    if len(L)<40: continue
    print("LOOP",len(L))
    print(" ".join("(%.0f,%.3f,%.3f)"%(math.degrees(math.atan2(v.co.y,v.co.x)),v.co.z,(v.co.x**2+v.co.y**2)**.5) for v in L))
