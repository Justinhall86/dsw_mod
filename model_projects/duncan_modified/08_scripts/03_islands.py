"""Step 3: island (connected component) analysis with bounding boxes, to identify the scarf and cape shells."""
import bpy, os, numpy as np, bmesh

SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)
me = next(o for o in bpy.context.scene.objects if o.type == 'MESH')

bm = bmesh.new(); bm.from_mesh(me.data); bm.verts.ensure_lookup_table()
seen = set(); comps = []
for v in bm.verts:
    if v.index in seen: continue
    st = [v.index]; c = []; seen.add(v.index)
    while st:
        x = st.pop(); c.append(x)
        for e in bm.verts[x].link_edges:
            w = e.other_vert(bm.verts[x]).index
            if w not in seen: seen.add(w); st.append(w)
    comps.append(sorted(c))
bm.free()
V = np.array([v.co[:] for v in me.data.vertices])
comps.sort(key=lambda c: -len(c))
print(f"{len(comps)} islands")
for i, c in enumerate(comps):
    sub = V[c]
    print(f"island {i:2d}: {len(c):5d} verts  "
          f"x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}] "
          f"y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] "
          f"z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}]")
