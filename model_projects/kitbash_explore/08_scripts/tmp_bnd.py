import bpy, bmesh, math
o=bpy.data.objects["BannerjeeHead"]
bm=bmesh.new(); bm.from_mesh(o.data)
vs=sorted({v for e in bm.edges if e.is_boundary for v in e.verts if v.co.y>-0.03 and v.co.z<1.80},key=lambda v:(round(v.co.z,2),math.atan2(v.co.y,v.co.x)))
for v in vs: print("B ang %4.0f z %.3f r %.3f x %.3f y %.3f nlinkf %d"%(math.degrees(math.atan2(v.co.y,v.co.x)),v.co.z,math.hypot(v.co.x,v.co.y),v.co.x,v.co.y,len(v.link_faces)))
print("MATRIX", [list(map(lambda x: round(x,3), r)) for r in o.matrix_world])
