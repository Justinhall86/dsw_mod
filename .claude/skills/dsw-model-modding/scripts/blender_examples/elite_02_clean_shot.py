import os, math, numpy as np, bmesh
from mathutils import Vector, Euler
PROG = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\progress"
def shot2(name, w=1000, h=900):
    sc = bpy.context.scene; sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w, h, 100
    c = view3d_ctx()
    with bpy.context.temp_override(**c): bpy.ops.render.opengl(view_context=True)
    p = os.path.join(PROG, name + ".png"); bpy.data.images['Render Result'].save_render(p); return p
def look2(rz=0, dist=2.6, color='MATERIAL', loc=(0,0,0.95), name="x", rx=90, shading='SOLID'):
    c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
    sp.shading.type = shading; sp.shading.color_type = color; sp.overlay.show_overlays = False
    r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector(loc); r3d.view_distance = dist
    r3d.view_rotation = Euler((math.radians(rx), 0, math.radians(rz))).to_quaternion()
    return shot2(name)
G = globals(); G.update(shot2=shot2, look2=look2, PROG=PROG)
o = next(o for o in bpy.data.objects if o.type == 'MESH'); me = o.data
bm = bmesh.new(); bm.from_mesh(me)
seen=set(); comps=[]
for v in bm.verts:
    if v.index in seen: continue
    st=[v]; c=[]; seen.add(v.index)
    while st:
        x=st.pop(); c.append(x)
        for e in x.link_edges:
            w=e.other_vert(x)
            if w.index not in seen: seen.add(w.index); st.append(w)
    comps.append(c)
comps.sort(key=len, reverse=True)
bmesh.ops.delete(bm, geom=[v for c in comps[3:] for v in c], context='VERTS')
bm.to_mesh(me); bm.free(); me.update()
for p in me.polygons: p.use_smooth = True
o.name = "elite_src"
co = np.empty(len(me.vertices)*3, dtype=np.float32); me.vertices.foreach_get('co', co); co = co.reshape(-1,3)
print("kept", len(me.vertices), "verts | min", co.min(0).round(3), "max", co.max(0).round(3))
print(look2(rz=0, dist=2.0, loc=(0,0,0.13), name="01_elite_source_front"))
print(look2(rz=90, dist=2.0, loc=(0,0,0.13), name="01_elite_source_side"))
