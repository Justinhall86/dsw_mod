"""Step 7: map green (scarf/cape cloth) faces via the albedo texture, group by island, and report.
Green cloth = scarf + cape. The black ponytail must be kept."""
import bpy, os, numpy as np, bmesh

SRC = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
TEX = r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\01_input\Duncan_Albedo.png"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
me = next(o for o in bpy.context.scene.objects if o.type == 'MESH')
mesh = me.data

img = bpy.data.images.load(TEX)
W, H = img.size
px = np.array(img.pixels[:], dtype=np.float32).reshape(H, W, 4)  # row 0 = bottom

uv = mesh.uv_layers.active.data
# per-face UV centroid
face_uv = np.zeros((len(mesh.polygons), 2))
for p in mesh.polygons:
    us = [uv[li].uv for li in p.loop_indices]
    face_uv[p.index] = np.mean(us, axis=0)
# sample (bpy pixels: row 0 = bottom, UV v=0 = bottom -> direct)
cols = np.clip((face_uv[:,0] * W).astype(int), 0, W-1)
rows = np.clip((face_uv[:,1] * H).astype(int), 0, H-1)
samples = px[rows, cols]
r, g, b = samples[:,0], samples[:,1], samples[:,2]
is_green = (g > r + 0.08) & (g > b + 0.08) & (g > 0.2)
print("green faces:", int(is_green.sum()), "of", len(mesh.polygons))

# islands
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
face_verts = [set(mesh.polygons[i].vertices) for i in range(len(mesh.polygons))]

print("--- green faces per island ---")
for i, c in enumerate(comps):
    n = sum(1 for fi in np.where(is_green)[0] if face_verts[fi] & c)
    if n:
        V = np.array([mesh.vertices[vi].co[:] for vi in c])
        print(f"island {i:2d}: {len(c):5d} verts, {n:4d} green faces  "
              f"x[{V[:,0].min():+.3f},{V[:,0].max():+.3f}] y[{V[:,1].min():+.3f},{V[:,1].max():+.3f}] z[{V[:,2].min():+.3f},{V[:,2].max():+.3f}]")

# where are the green faces NOT in those islands?
green_verts = set()
for fi in np.where(is_green)[0]:
    green_verts |= face_verts[fi]
covered = set()
for i, c in enumerate(comps):
    n = sum(1 for fi in np.where(is_green)[0] if face_verts[fi] & c)
    if n: covered |= c
orphan = green_verts - covered
if orphan:
    V = np.array([mesh.vertices[vi].co[:] for vi in orphan])
    print("green verts in mixed islands:", len(orphan),
          f"x[{V[:,0].min():+.3f},{V[:,0].max():+.3f}] y[{V[:,1].min():+.3f},{V[:,1].max():+.3f}] z[{V[:,2].min():+.3f},{V[:,2].max():+.3f}]")
