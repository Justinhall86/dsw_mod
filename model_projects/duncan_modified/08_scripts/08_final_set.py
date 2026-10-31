"""Step 8: detail check - island 0 face colour breakdown, island 26 location, and a red/green overlay render
of island 0 + 26 to confirm the final removal set."""
import bpy, os, numpy as np, bmesh, mathutils

SRC = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
TEX = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\01_input\Duncan_Albedo.png"
OUT = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\02_progress_photos"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
me = next(o for o in bpy.context.scene.objects if o.type == 'MESH')
mesh = me.data

img = bpy.data.images.load(TEX)
W, H = img.size
px = np.array(img.pixels[:], dtype=np.float32).reshape(H, W, 4)
uv = mesh.uv_layers.active.data

bm = bmesh.new(); bm.from_mesh(mesh); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v.index]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x)
        for e in bm.verts[x].link_edges:
            w = e.other_vert(bm.verts[x]).index
            if w not in seen: seen.add(w); st.append(w)
    comps.append(set(c))
bm.free()
comps.sort(key=lambda c: -len(c))

def face_col(p):
    us = [uv[li].uv for li in p.loop_indices]
    u, v = np.mean(us, axis=0)
    c = int(np.clip(u * W, 0, W-1)); r = int(np.clip(v * H, 0, H-1))
    return px[r, c, :3]

for idx in (0, 26):
    faces = [p for p in mesh.polygons if set(p.vertices) & comps[idx]]
    cols = np.array([face_col(p) for p in faces])
    rr, gg, bb = cols[:,0], cols[:,1], cols[:,2]
    green = (gg > rr + 0.08) & (gg > bb + 0.08) & (gg > 0.2)
    print(f"island {idx}: {len(faces)} faces, {int(green.sum())} green, {int((~green).sum())} non-green")
    ng = np.where(~green)[0]
    if len(ng):
        sub = np.array([mesh.vertices[vi].co[:] for fi in ng for vi in mesh.polygons[fi].vertices])
        print(f"  non-green bbox x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}] y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}]")
        # average colour of non-green
        print("  non-green mean rgb", cols[ng].mean(axis=0))

# overlay render: islands 0 and 26 red
CAND = {0, 26}
ca = mesh.color_attributes.get("C") or mesh.color_attributes.new(name="C", type='FLOAT_COLOR', domain='POINT')
for i, c in enumerate(comps):
    col = (0.95, 0.1, 0.1, 1.0) if i in CAND else (0.3, 0.3, 0.3, 1.0)
    for vi in c: ca.data[vi].color = col
scene = bpy.context.scene
scene.render.engine = 'BLENDER_WORKBENCH'
scene.display.shading.light = 'STUDIO'
scene.display.shading.color_type = 'VERTEX'
scene.display.shading.show_cavity = True
scene.render.resolution_x = 800
scene.render.resolution_y = 1000

def cam_at(loc, look_at, name):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    scene.collection.objects.link(cam)
    cam.location = loc
    d = mathutils.Vector(look_at) - mathutils.Vector(loc)
    cam.rotation_euler = d.to_track_quat('-Z', 'Y').to_euler()
    return cam

views = {"front": ((0, -2.4, 1.4), (0, 0, 1.4)), "back": ((0, 2.4, 1.4), (0, 0.05, 1.4)), "left": ((2.4, 0, 1.4), (0, 0.03, 1.4))}
for name, (loc, tgt) in views.items():
    scene.camera = cam_at(loc, tgt, "c" + name)
    scene.render.filepath = os.path.join(OUT, f"finalset_{name}.png")
    bpy.ops.render.render(write_still=True)
    print("rendered", name)
