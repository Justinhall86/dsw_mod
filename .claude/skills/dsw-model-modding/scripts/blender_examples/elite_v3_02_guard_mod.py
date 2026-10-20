"""v3 step 2: guard_mod = the vanilla Landsraad guard body with its hooded head removed.
 - taper the cowl under the head into a neck (so the new helmet sits on a neck, not on a wide ring)
 - delete the faces of the head above CUT_Z, cap the opening (hidden inside the new helmet)
Keeps the vanilla UVs / vertex groups / armature modifier; the vanilla head was weighted to B_SpineTopJ (it never moved on its own)."""
import numpy as np, bmesh

CUT_Z, TAPER_Z0, TAPER_Z1, NECK_FACTOR = 1.74, 1.55, 1.72, 0.64
src = bpy.data.objects["guard_vanilla"]
old = bpy.data.objects.get("guard_mod")
if old: bpy.data.objects.remove(old, do_unlink=True)
g = src.copy(); g.data = src.data.copy(); g.name = "guard_mod"; g.data.name = "guard_mod"
bpy.context.collection.objects.link(g)
bm = bmesh.new(); bm.from_mesh(g.data); bm.verts.ensure_lookup_table()


def sstep(t):
    t = min(1.0, max(0.0, t)); return t * t * (3 - 2 * t)


for v in bm.verts:
    x, y, z = v.co.x, v.co.y, v.co.z
    if z > TAPER_Z0 and abs(x) < 0.34:
        f = 1 - (1 - NECK_FACTOR) * sstep((z - TAPER_Z0) / (TAPER_Z1 - TAPER_Z0)) * (1 - sstep((abs(x) - 0.20) / 0.14))
        v.co.x = x * f; v.co.y = (y - 0.0) * f
bm.verts.ensure_lookup_table(); bm.faces.ensure_lookup_table()
dele = [f for f in bm.faces if all(v.co.z > CUT_Z for v in f.verts)]
bmesh.ops.delete(bm, geom=dele, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
edges = [e for e in bm.edges if e.is_boundary and all(v.co.z > CUT_Z - 0.08 for v in e.verts)]
res = bmesh.ops.holes_fill(bm, edges=edges, sides=0)
print("deleted head faces:", len(dele), "| boundary edges capped:", len(edges), "| cap faces:", len(res["faces"]))
bm.to_mesh(g.data); bm.free()
for p in g.data.polygons: p.use_smooth = True
me = g.data
co = np.array([v.co[:] for v in me.vertices])
print("guard_mod:", len(me.vertices), "verts", len(me.polygons), "faces | top z", co[:, 2].max().round(3))
src.hide_viewport = True; src.hide_render = True
