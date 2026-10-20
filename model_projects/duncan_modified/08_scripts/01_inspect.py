"""Step 1: import the converted FBX and report the structure (objects, vertex groups, weighted bone extents)
so the scarf/cape geometry can be identified."""
import bpy, os, numpy as np

SRC = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx"
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=SRC, use_anim=False)

for o in bpy.context.scene.objects:
    print("OBJ", o.type, repr(o.name), "verts", len(o.data.vertices) if o.type == 'MESH' else "-")

me = next(o for o in bpy.context.scene.objects if o.type == 'MESH')
print("mesh", me.name, len(me.data.vertices), "verts", len(me.data.polygons), "faces")
print("materials", [m.name if m else None for m in me.data.materials])
print("uv layers", [u.name for u in me.data.uv_layers])

rig = next(o for o in bpy.context.scene.objects if o.type == 'ARMATURE')
print("armature", rig.name, "bones", len(rig.data.bones))

V = np.array([v.co[:] for v in me.data.vertices])
print("mesh bbox min", V.min(axis=0), "max", V.max(axis=0), "nverts", len(V))

# per-vertex-group stats: count verts with weight > threshold, bbox, mean weight
print("--- vertex groups ---")
for vg in me.vertex_groups:
    idxs = [v.index for v in me.data.vertices if any(g.group == vg.index and g.weight > 1e-4 for g in v.groups)]
    if not idxs:
        print(f"{vg.name:16s} 0 verts")
        continue
    w = []
    for i in idxs:
        v = me.data.vertices[i]
        w.append(next(g.weight for g in v.groups if g.group == vg.index))
    sub = V[idxs]
    print(f"{vg.name:16s} {len(idxs):5d} verts  w[min={min(w):.2f} max={max(w):.2f}]  "
          f"x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}] y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}]")

# dominant bone per vertex, histogram
print("--- dominant bone histogram ---")
bone_names = [b.name for b in rig.data.bones]
hist = {}
for v in me.data.vertices:
    if not v.groups:
        hist.setdefault("(none)", []).append(v.index); continue
    g = max(v.groups, key=lambda g: g.weight)
    hist.setdefault(me.vertex_groups[g.group].name, []).append(v.index)
for k in sorted(hist, key=lambda k: -len(hist[k])):
    idxs = hist[k]
    sub = V[idxs]
    print(f"{k:16s} {len(idxs):5d}  z[{sub[:,2].min():+.3f},{sub[:,2].max():+.3f}] y[{sub[:,1].min():+.3f},{sub[:,1].max():+.3f}] x[{sub[:,0].min():+.3f},{sub[:,0].max():+.3f}]")
