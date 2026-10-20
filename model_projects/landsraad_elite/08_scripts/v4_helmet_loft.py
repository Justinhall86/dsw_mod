"""v4 helmet step 2 (Blender, via the bridge): a clean, regular faceted helmet shell lofted from the symmetric sculpt `helm_src`.

The reference helmet is a low-poly shell built from rings (horizontal loops) and columns (vertical creases). This builds the same
topology: RINGS are heights, THETA are azimuths measured from the front (0 = -y, 90 = +x, 180 = back). Every (ring, column) vertex is
found by a ray from outside towards the vertical axis through the helmet centre, using the first hit on the sculpt (so the brow ledge,
the visor recess and the cheek / chin shape come from the sculpt, but every facet is now a clean quad of the loft).
Below the rim ring only the front columns continue down to the chin (the jaw line); the top is closed with a fan.

Outputs: object `helm_loft` (symmetric about x = 0, flat shaded) with integer face attributes `ring`, `col` and the metadata dict
returned by build() (vertex id grid, ring heights, azimuths).
"""
import math
import numpy as np
import bmesh
from mathutils import Vector
from mathutils.bvhtree import BVHTree

PIC2S_Z = lambda zp: 1.655 + (zp - 1.665) * 0.966          # picture z -> sculpt z (the sculpt is ~3 % smaller)
# rings (sculpt z) from the top; the rim ring is RIM_I (everything below it only exists for the front columns)
RINGS = [1.9900, 1.9640, 1.9254, 1.8916, 1.8626, 1.8385, 1.8192, 1.7999, 1.7661, 1.7275, 1.6889, 1.6585]
RIM_I = 7
THETA = [0, 9, 22, 32, 41, 56, 90, 130, 161, 180]  # degrees from the front, right half (the left half mirrors)
JAW_COLS = 5                                                  # columns 0..JAW_COLS (<= 56 deg) continue below the rim
YC = 0.003                                                    # axis of the loft (y)
TOP_Z = 1.9969


def z_jaw(x):
    """height of the jaw line at |x| (sculpt frame): flat chin bottom, then a diagonal up to the side plate"""
    x = abs(x)
    x0, z0, x1, z1, x2, z2 = 0.0355, 1.655, 0.122, 1.7222, 0.150, 1.80
    if x <= x0: return z0
    if x <= x1: return z0 + (x - x0) * (z1 - z0) / (x1 - x0)
    return min(z2, z1 + (x - x1) * (z2 - z1) / (x2 - x1))


def build_helmet(rings=None, theta=None, rim_i=None, jaw_cols=None, source="helm_src", name="helm_loft", spread=1.2e-3):
    rings = rings or RINGS; theta = theta or THETA; rim_i = RIM_I if rim_i is None else rim_i
    jaw_cols = JAW_COLS if jaw_cols is None else jaw_cols
    src = bpy.data.objects[source]
    bmx = bmesh.new(); bmx.from_mesh(src.data); bvh = BVHTree.FromBMesh(bmx); bmx.free()
    J = len(theta)

    def hit(z, th):
        pts = []
        for dz in (-spread, 0.0, spread):
            for dth in (-1.0, 0.0, 1.0):
                a = math.radians(th + dth)
                dd = Vector((math.sin(a), -math.cos(a), 0.0))
                o = Vector((0.0, YC, z + dz)) + dd * 0.7
                h = bvh.ray_cast(o, -dd, 1.5)
                if h[0] is not None: pts.append(h[0])
        if not pts: return None
        return np.median(np.array([p[:] for p in pts]), axis=0)

    P = {}                                   # (ring, j) -> position, upper part (rings 0..rim_i), right half
    for i in range(0, rim_i + 1):
        for j, th in enumerate(theta):
            p = hit(rings[i], th)
            if p is None: print("no hit ring %d col %d (z %.3f th %d)" % (i, j, rings[i], th)); continue
            P[(i, j)] = p
    L = {}                                   # j -> [positions below the rim], last one on the jaw line
    for j in range(0, jaw_cols + 1):
        zj = z_jaw(P[(rim_i, j)][0])
        zs = [z for z in rings[rim_i + 1:] if z > zj + 0.010] + [zj]
        pts = []
        for k, z in enumerate(zs):
            last = (k == len(zs) - 1)
            p = hit(z + (0.004 if last else 0.0), theta[j])
            if p is None:
                p = pts[-1].copy() if pts else P[(rim_i, j)].copy()
            p = p.copy()
            if last: p[2] = zj
            pts.append(p)
        L[j] = pts
    R = max(len(v) for v in L.values())
    bm = bmesh.new()
    ring_l = bm.faces.layers.int.new("ring"); col_l = bm.faces.layers.int.new("col")
    quad_l = bm.faces.layers.int.new("quad"); half_l = bm.faces.layers.int.new("half")
    NQ = [0]
    V = {}

    def mk(key, p, side):
        p = np.array(p, dtype=float)
        if key[1] == 0 or key[1] == J - 1: p[0] = 0.0
        elif side < 0: p[0] = -p[0]
        if key not in V: V[key] = bm.verts.new(p)
        return V[key]

    def vert(i, j, side):
        if j == 0 or j == J - 1: side = 1
        k = ("u", i, j, side)
        return V[k] if k in V else mk(k, P[(i, j)], side)

    def lvert(r, j, side):                   # lower patch row r (1..R), column j; clamped to the column's own bottom
        if j == 0: side = 1
        n = len(L[j]); rr = min(r, n)
        k = ("l", rr, j, side)
        return V[k] if k in V else mk(k, L[j][rr - 1], side)

    def add(vs, ring, col):
        out = []
        for v in vs:
            if not out or out[-1] is not v: out.append(v)
        if len(out) > 1 and out[0] is out[-1]: out.pop()
        if len({id(v) for v in out}) < 3: return
        tris = [(out[0], out[1], out[2])] if len(out) == 3 else [(out[0], out[1], out[2]), (out[0], out[2], out[3])]
        for h, t in enumerate(tris):
            f = bm.faces.new(t); f[ring_l] = ring; f[col_l] = col; f[quad_l] = NQ[0]; f[half_l] = h
        NQ[0] += 1

    seq_full = [(j, 1) for j in range(0, J)] + [(j, -1) for j in range(J - 2, 0, -1)]
    n = len(seq_full)
    for i in range(0, rim_i):
        for k in range(n):
            a, b = seq_full[k], seq_full[(k + 1) % n]
            add([vert(i, *a), vert(i, *b), vert(i + 1, *b), vert(i + 1, *a)], i, a[0] if a[1] > 0 else -a[0])
    seq_low = [(j, -1) for j in range(jaw_cols, 0, -1)] + [(j, 1) for j in range(0, jaw_cols + 1)]
    for r in range(0, R):
        for k in range(len(seq_low) - 1):
            a, b = seq_low[k], seq_low[k + 1]
            va = vert(rim_i, *a) if r == 0 else lvert(r, *a)
            vb = vert(rim_i, *b) if r == 0 else lvert(r, *b)
            va2, vb2 = lvert(r + 1, *a), lvert(r + 1, *b)
            add([va, vb, vb2, va2], rim_i + r, a[0])
    apex = bm.verts.new((0.0, YC + 0.004, TOP_Z))
    for k in range(n):
        a, b = seq_full[k], seq_full[(k + 1) % n]
        f = bm.faces.new([vert(0, *a), vert(0, *b), apex]); f[ring_l] = -1; f[col_l] = a[0]; f[quad_l] = NQ[0]; f[half_l] = 0; NQ[0] += 1
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    cen = Vector((0.0, YC, 1.82))
    if sum(f.normal.dot(f.calc_center_median() - cen) for f in bm.faces) < 0:      # make sure the faces point outwards
        bmesh.ops.reverse_faces(bm, faces=bm.faces[:])
    old = bpy.data.objects.get(name)
    if old: bpy.data.objects.remove(old, do_unlink=True)
    me = bpy.data.meshes.new(name); bm.to_mesh(me); bm.free()
    ob = bpy.data.objects.new(name, me); bpy.context.collection.objects.link(ob)
    for q in me.polygons: q.use_smooth = False
    co = np.array([v.co[:] for v in me.vertices])
    print("%s: %d verts, %d faces | bbox x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f" % (
        name, len(me.vertices), len(me.polygons), co[:, 0].min(), co[:, 0].max(), co[:, 1].min(), co[:, 1].max(), co[:, 2].min(), co[:, 2].max()))
    return ob, dict(P=P, L=L)


def scale_to_design(ob, sx=1.09, sy=1.025, sz=1.035, y0=YC, z0=1.655):
    """the sculpt helmet is a few % smaller than the designed one (silhouette fit against the reference): scale it up about the chin
    anchor so it has the design's proportions but keeps its place on the body"""
    for v in ob.data.vertices:
        v.co.x *= sx; v.co.y = y0 + (v.co.y - y0) * sy; v.co.z = z0 + (v.co.z - z0) * sz
    ob.data.update()
    return ob
