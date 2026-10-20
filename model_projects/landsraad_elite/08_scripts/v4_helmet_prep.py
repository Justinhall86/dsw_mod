"""v4 helmet step 1 (Blender, via the bridge): trim the sculpt helmet to the helmet proper and make it exactly mirror-symmetric.

Input : object `helmet_hi` (the sculpt piece carved out of elite_hi: dome + face + the gold collar/flanges around the neck)
Output: object `helm_src` - helmet shell only (collar flanges removed), centred on x = 0, symmetric (right half mirrored), ready for facet fitting.

The sculpt is symmetric about x = -0.0025 (mean mirror distance 0.4 mm), so the mirror step only removes noise.
Cut rule (world metres): above CUT_Z everything stays (the collar tops out at ~1.80); below it only the front face stays:
|x| inside the jaw line (a V from the chin corner (0.037, 1.665) to (0.127, 1.734)) and y < FACE_Y.
"""
import numpy as np, bmesh
from mathutils import Vector

XC = -0.0025                      # symmetry plane of the sculpt
CUT_Z, FACE_Y = 1.80, -0.04
CHIN_Z, CHIN_X, JAW_X, JAW_Z = 1.665, 0.037, 0.127, 1.734


def jaw_halfwidth(z):
    if z <= CHIN_Z: return CHIN_X
    if z >= JAW_Z: return 0.135
    return CHIN_X + (z - CHIN_Z) * (JAW_X - CHIN_X) / (JAW_Z - CHIN_Z)


def prep(source="helmet_hi", name="helm_src"):
    src = bpy.data.objects[source]
    old = bpy.data.objects.get(name)
    if old: bpy.data.objects.remove(old, do_unlink=True)
    o = src.copy(); o.data = src.data.copy(); o.name = name; o.data.name = name
    bpy.context.collection.objects.link(o)
    bm = bmesh.new(); bm.from_mesh(o.data)
    for v in bm.verts: v.co.x -= XC                                    # symmetric about x = 0 now
    bm.faces.ensure_lookup_table()
    drop = []
    for f in bm.faces:
        c = f.calc_center_median()
        keep = c.z > CUT_Z or (c.y < FACE_Y and abs(c.x) < jaw_halfwidth(c.z) and c.z > CHIN_Z - 0.01)
        if not keep: drop.append(f)
    bmesh.ops.delete(bm, geom=drop, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    # keep the largest connected piece
    bm.verts.ensure_lookup_table()
    seen = set(); comps = []
    for v in bm.verts:
        if v.index in seen: continue
        st = [v]; c = []; seen.add(v.index)
        while st:
            x = st.pop(); c.append(x)
            for e in x.link_edges:
                w = e.other_vert(x)
                if w.index not in seen: seen.add(w.index); st.append(w)
        comps.append(c)
    comps.sort(key=len, reverse=True)
    for c in comps[1:]: bmesh.ops.delete(bm, geom=[v for v in c if v.is_valid], context="VERTS")
    print("components:", [len(c) for c in comps[:6]])
    # keep x >= 0 and mirror it
    geom = list(bm.verts) + list(bm.edges) + list(bm.faces)
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, 0, 0), plane_no=(1, 0, 0), clear_inner=True, clear_outer=False)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    for v in bm.verts:
        if abs(v.co.x) < 1e-6: v.co.x = 0.0
    geom = list(bm.verts) + list(bm.edges) + list(bm.faces)
    bmesh.ops.mirror(bm, geom=geom, axis="X", merge_dist=2e-4)
    bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=2e-4)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    bmesh.ops.triangulate(bm, faces=bm.faces[:])
    for a in list(o.data.color_attributes): pass
    bm.to_mesh(o.data); bm.free()
    for p in o.data.polygons: p.use_smooth = False
    me = o.data
    co = np.array([v.co[:] for v in me.vertices])
    print("helm_src: %d verts, %d tris | bbox x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f" % (
        len(me.vertices), len(me.polygons), co[:, 0].min(), co[:, 0].max(), co[:, 1].min(), co[:, 1].max(), co[:, 2].min(), co[:, 2].max()))
    return o
