"""v4: build a clean low-poly pauldron (Blender, via the bridge). Mirrors the reference design: a polygonal outline, a stepped
two-tier gold band, a faceted dome with creases radiating from a centre point, and a closed shell.

Inputs : intermediate_data/pad_outline.json (ring-plane frame c0,n,e1,e2 + outline polygon in plane coords, from the +x sculpt pauldron)
         the sculpt object `padL_hi` (heights are ray-cast from it so the part follows the real shoulder curve)
Output : object `pad_new` (+x side) with a face attribute `grp` (0 outer wall, 1 outer tier, 2 step wall, 3 inner tier, 4 dome slope,
         5 plateau, 6 underside) used later for colouring, and `padR_new` as its mirror.
"""
import json, math
import numpy as np
import bmesh
from mathutils import Vector
from mathutils.bvhtree import BVHTree

PROJ = r"C:/Users/justi/Python/dsw_mod/model_projects/landsraad_elite"
P = dict(w_outer=0.028, w_inner=0.046, w_plateau=0.085, step=0.009, wall=0.030, under=0.045, dome_lift=0.0, center_lift=0.0,
         major=(0, 2, 4, 6, 8, 10, 12))   # outline vertices that keep their own plateau height; the others lie on the straight edge between them


def offset_polygon(poly, d):
    """inward offset of a CCW polygon (list of (a,b)) by d with mitred corners (miter length clamped)."""
    n = len(poly); out = []
    for i in range(n):
        p0, p1, p2 = np.array(poly[i - 1]), np.array(poly[i]), np.array(poly[(i + 1) % n])
        e0 = p1 - p0; e1 = p2 - p1
        n0 = np.array([-e0[1], e0[0]]) / max(np.linalg.norm(e0), 1e-9)        # inward normals for a CCW polygon
        n1 = np.array([-e1[1], e1[0]]) / max(np.linalg.norm(e1), 1e-9)
        bis = n0 + n1; bl = np.linalg.norm(bis)
        if bl < 1e-6:
            off = n0 * d
        else:
            bis /= bl; cosh = max(float(bis @ n0), 0.45)                           # clamp the miter
            off = bis * (d / cosh)
        out.append((p1 + off).tolist())
    return out


def straighten(ring_ab, ring_h, majors):
    """put every non-major ring vertex on the straight (3D) segment between its neighbouring major vertices -> big planar dome facets"""
    n = len(ring_ab); out_ab = [None] * n; out_h = [None] * n
    ms = sorted(majors)
    for k, m in enumerate(ms):
        m2 = ms[(k + 1) % len(ms)]
        idx = [m]; i = m
        while i != m2:
            i = (i + 1) % n; idx.append(i)
        A = np.array(ring_ab[m]); B = np.array(ring_ab[m2]); d = B - A; L2 = float(d @ d)
        for i in idx:
            t = float(np.clip(((np.array(ring_ab[i]) - A) @ d) / L2, 0, 1)) if L2 > 0 else 0.0
            out_ab[i] = (A + t * d).tolist(); out_h[i] = ring_h[m] + t * (ring_h[m2] - ring_h[m])
    return out_ab, out_h


def build_pauldron(params=None, source="padL_hi", name="pad_new", mirror=False):
    p = dict(P); p.update(params or {})
    fr = json.load(open(PROJ + "/08_scripts/intermediate_data/pad_outline.json"))
    c0 = Vector(fr["c0"]); nrm = Vector(fr["n"]); e1 = Vector(fr["e1"]); e2 = Vector(fr["e2"])
    O = fr["outline_ab"]
    src = bpy.data.objects[source]
    bm0 = bmesh.new(); bm0.from_mesh(src.data); bvh = BVHTree.FromBMesh(bm0); bm0.free()

    def to3d(a, b, h): return c0 + e1 * a + e2 * b + nrm * h

    def sample_h(a, b, default=0.0):
        """height of the sculpt's outer surface above the ring plane at plane coords (a, b)"""
        hit = bvh.ray_cast(to3d(a, b, 0.5), -nrm, 1.0)
        if hit[0] is None:
            return default
        return float((hit[0] - c0) @ nrm)

    # height of a layer vertex: sample the sculpt a little inside the outline (the rim edge itself rounds off)
    def layer_h(a, b, inside):
        return sample_h(a, b, 0.0) if inside is None else sample_h(inside[0], inside[1], 0.0)

    I1 = offset_polygon(O, p["w_outer"]); I2 = offset_polygon(O, p["w_inner"]); PL = offset_polygon(O, p["w_plateau"])
    # a point well inside each outline vertex to read the rim height from
    Oin = offset_polygon(O, 0.018)
    n = len(O)
    cen = np.mean(np.array(PL), axis=0)
    me = bpy.data.meshes.new(name); bm = bmesh.new()
    grp_layer = bm.faces.layers.int.new("grp")

    ab = {}

    def vert(a, b, h):
        q = to3d(a, b, h)
        if mirror: q = Vector((-q.x, q.y, q.z))
        v = bm.verts.new(q); ab[v] = (a, b); return v

    hO = [sample_h(*Oin[i]) for i in range(n)]
    h_band = [h for h in hO]                                   # rim height follows the sculpt
    # every band layer follows the shell: sample the sculpt at the layer's own position (never lower than the layer outside it)
    hI1 = [max(sample_h(*I1[i], default=hO[i]), hO[i]) for i in range(n)]
    hI2 = [max(sample_h(*I2[i], default=hI1[i]), hI1[i]) for i in range(n)]
    top_O = [vert(*O[i], hO[i] - 0.004) for i in range(n)]
    bot_O = [vert(*O[i], hO[i] - 0.004 - p["wall"]) for i in range(n)]
    top_I1 = [vert(*I1[i], hI1[i]) for i in range(n)]
    up_I1 = [vert(*I1[i], hI1[i] + p["step"]) for i in range(n)]
    up_I2 = [vert(*I2[i], hI2[i] + p["step"]) for i in range(n)]
    hP = [max(sample_h(*PL[i], default=hI2[i] + 0.04) + p["step"] + p["dome_lift"], hI2[i] + p["step"] + 0.008) for i in range(n)]
    if p.get("major"):
        PL, hP = straighten(PL, hP, p["major"])
        cen = np.mean(np.array(PL), axis=0)
    top_P = [vert(*PL[i], hP[i]) for i in range(n)]
    hC = max(sample_h(*cen, default=float(np.mean(hP))), float(np.mean(hP))) + p["center_lift"]
    ctop = vert(cen[0], cen[1], hC)
    under_c = vert(cen[0], cen[1], float(np.mean(h_band)) - 0.004 - p["wall"] - p["under"])
    under_ring = [vert(*(np.array(O[i]) * 0.93 + cen * 0.07), h_band[i] - 0.004 - p["wall"] - p["under"] * 0.6) for i in range(n)]

    def quad(a, b, c, d, g):
        f = bm.faces.new((d, c, b, a) if mirror else (a, b, c, d)); f[grp_layer] = g

    def tri(a, b, c, g):
        f = bm.faces.new((c, b, a) if mirror else (a, b, c)); f[grp_layer] = g

    for i in range(n):
        j = (i + 1) % n
        quad(bot_O[i], bot_O[j], top_O[j], top_O[i], 0)           # outer wall (faces outward for a CCW outline seen from +n)
        quad(top_O[i], top_O[j], top_I1[j], top_I1[i], 1)         # outer tier
        quad(top_I1[i], top_I1[j], up_I1[j], up_I1[i], 2)         # step wall
        quad(up_I1[i], up_I1[j], up_I2[j], up_I2[i], 3)           # inner tier
        quad(up_I2[i], up_I2[j], top_P[j], top_P[i], 4)           # dome slope
        tri(top_P[i], top_P[j], ctop, 5)                          # plateau fan -> creases radiate from the centre
        quad(under_ring[i], under_ring[j], bot_O[j], bot_O[i], 6)  # underside ring
        tri(under_ring[j], under_ring[i], under_c, 6)             # underside cap
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    if "pad_to_uv" in globals():                                  # planar UVs into the parts atlas (v4_atlas.py exec'd first)
        uvl = bm.loops.layers.uv.new("UVMap")
        for f in bm.faces:
            for lp in f.loops:
                a_, b_ = ab[lp.vert]
                lp[uvl].uv = pad_dark_uv() if f[grp_layer] == 6 else tuple(float(x) for x in pad_to_uv(a_, b_))
    bm.to_mesh(me); bm.free()
    old = bpy.data.objects.get(name)
    if old: bpy.data.objects.remove(old, do_unlink=True)
    ob = bpy.data.objects.new(name, me); bpy.context.collection.objects.link(ob)
    for q in me.polygons: q.use_smooth = False
    return ob, dict(center_h=hC, h_band=h_band, hP=hP)
