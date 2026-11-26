"""Edit stage for redesign variants: fit grafted parts after the builder has assembled them (same scene, before saving).

Each recipe may carry  edits=[(op, kwargs), ...]  run in order by rd_build.py.  Objects are picked by a name substring.
All coordinates are world space, metres (rest pose: x = character's left, -y = front, z = up).

ops
  xform     obj, scale=1|(sx,sy,sz), pivot=(x,y,z), move=(dx,dy,dz), box=None      scale about pivot, then move (box limits the verts)
  radial    obj, factor, centre=(x,y), z=(z0,z1), ramp=0.0                          pull toward / push from a vertical axis (tighten a cowl)
  cut_below obj, z, r=None  /  cut_above obj, z, r                                  straight cuts (builder helpers)
  delete    obj, lo=(x,y,z), hi=(x,y,z), mode="all"|"any"                           delete faces whose verts are inside the box
  clip_in   obj, cover, centre=(x,y,z), margin=0.004                                push obj verts that poke OUT of cover back inside (rays from centre)
  push_out  obj, solid, centre=(x,y,z), margin=0.004                                push obj verts that sink INTO solid out past its outer surface
"""
import bmesh
import bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree


def find(name):
    hits = [o for o in bpy.data.objects if o.type == "MESH" and name in o.name]
    if not hits:
        raise KeyError("no mesh object containing %r: %s" % (name, [o.name for o in bpy.data.objects if o.type == "MESH"]))
    return hits[0]


def _verts(o, box=None):
    mw = o.matrix_world
    for v in o.data.vertices:
        p = mw @ v.co
        if box and not all(box[0][i] <= p[i] <= box[1][i] for i in range(3)):
            continue
        yield v, p


def xform(obj, scale=1.0, pivot=(0, 0, 0), move=(0, 0, 0), box=None, falloff=None):
    """falloff=(axis, a, b): the change is weighted 0 at coordinate a and 1 at b along axis 0/1/2 (soft edit, no tearing)."""
    o = find(obj); inv = o.matrix_world.inverted()
    s = Vector(scale if isinstance(scale, (tuple, list)) else (scale,) * 3); pv = Vector(pivot); mv = Vector(move)
    n = 0
    for v, p in list(_verts(o, box)):
        q = pv + Vector(((p - pv).x * s.x, (p - pv).y * s.y, (p - pv).z * s.z)) + mv
        if falloff:
            ax, a, b = falloff
            w = min(1.0, max(0.0, (p[ax] - a) / (b - a)))
            q = p.lerp(q, w)
        v.co = inv @ q; n += 1
    o.data.update(); return n


def radial(obj, factor, centre=(0, 0), z=(-9, 9), ramp=0.0):
    """Scale the horizontal distance to the axis by `factor` for verts with z0 <= z <= z1; `ramp` (m) fades it in at both ends."""
    o = find(obj); inv = o.matrix_world.inverted(); c = Vector((centre[0], centre[1])); n = 0
    for v, p in list(_verts(o)):
        if not (z[0] - ramp <= p.z <= z[1] + ramp):
            continue
        w = 1.0
        if ramp > 0:
            w = min(1.0, (p.z - (z[0] - ramp)) / ramp, ((z[1] + ramp) - p.z) / ramp)
        f = 1.0 + (factor - 1.0) * max(0.0, w)
        d = Vector((p.x, p.y)) - c
        q = Vector((c.x + d.x * f, c.y + d.y * f, p.z))
        v.co = inv @ q; n += 1
    o.data.update(); return n


def delete(obj, lo, hi, mode="all"):
    o = find(obj)
    bm = bmesh.new(); bm.from_mesh(o.data); mw = o.matrix_world
    inside = lambda v: all(lo[i] <= (mw @ v.co)[i] <= hi[i] for i in range(3))
    test = all if mode == "all" else any
    kill = [f for f in bm.faces if test(inside(v) for v in f.verts)]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(o.data); bm.free(); o.data.update(); return len(kill)


def cut(obj, z, keep="above", r=None):
    """Straight horizontal cut at WORLD height z (the builder's bisect helpers work in object space, wrong for transformed fills);
    keep="above" drops what is below.  r: only faces within |x| < r are cut."""
    o = find(obj); mw = o.matrix_world; inv = mw.inverted()
    co = inv @ Vector((0, 0, z)); no = (mw.to_3x3().transposed() @ Vector((0, 0, 1))).normalized()
    bm = bmesh.new(); bm.from_mesh(o.data)
    fs = [f for f in bm.faces if r is None or abs((mw @ f.calc_center_median()).x) < r]
    geom = list({v for f in fs for v in f.verts}) + list({e for f in fs for e in f.edges}) + fs
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=co, plane_no=no, clear_inner=(keep == "above"), clear_outer=(keep == "below"))
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(o.data); bm.free(); o.data.update()
    return len(o.data.polygons)


def _tree(o):
    bm = bmesh.new(); bm.from_mesh(o.data); bm.transform(o.matrix_world)
    t = BVHTree.FromBMesh(bm); bm.free(); return t


def clip_in(obj, cover, centre=(0, -0.01, 1.80), margin=0.004, box=None):
    """Verts of obj that lie beyond cover's surface (seen from `centre`) are pulled back to (hit - margin)."""
    o = find(obj); c = find(cover); tree = _tree(c); inv = o.matrix_world.inverted(); C = Vector(centre); n = 0
    for v, p in list(_verts(o, box)):
        d = p - C; L = d.length
        if L < 1e-4:
            continue
        d.normalize()
        hit, _nn, _i, t = tree.ray_cast(C, d, L + margin)
        if hit is not None and t < L + margin:
            v.co = inv @ (C + d * max(t - margin, 0.0)); n += 1
    o.data.update(); return n


def push_out(obj, solid, centre=(0, -0.01, 1.80), margin=0.004, box=None, axis=False):
    """Verts of obj that lie INSIDE solid's outer surface (seen from `centre`) are pushed out to (outer hit + margin):
    a cowl or mask that sinks into the head / chest is lifted clear of it."""
    o = find(obj); tree = _tree(find(solid)); inv = o.matrix_world.inverted(); n = 0
    for v, p in list(_verts(o, box)):
        C = Vector((centre[0], centre[1], p.z)) if axis else Vector(centre)    # axis=True: horizontal rays from a vertical axis (no sliding down the chest)
        d = p - C; L = d.length
        if L < 1e-4:
            continue
        d.normalize()
        far, s = None, 0.0
        for _ in range(8):                     # walk to the solid's outermost surface along the ray
            hit, _nn, _i, t = tree.ray_cast(C + d * (s + 1e-4), d, 2.0)
            if hit is None:
                break
            s += 1e-4 + t; far = s
        if far is not None and L < far + margin:
            v.co = inv @ (C + d * (far + margin)); n += 1
    o.data.update(); return n


def snap_to(obj, solid, max_dist=0.025, margin=0.002, boundary_only=True, box=None):
    """Pull obj's verts (open-edge verts only by default) that float within max_dist OUTSIDE solid onto its surface (+margin): closes the slit of
    light under a cloth edge.  Uses the nearest surface point; verts already inside solid are left to clip/push ops."""
    o = find(obj); tree = _tree(find(solid)); inv = o.matrix_world.inverted(); mw = o.matrix_world
    bm = bmesh.new(); bm.from_mesh(o.data); bm.verts.ensure_lookup_table()
    pick = {v.index for v in bm.verts if any(len(e.link_faces) == 1 for e in v.link_edges)} if boundary_only else {v.index for v in bm.verts}
    bm.free(); n = 0
    for v in o.data.vertices:
        if v.index not in pick:
            continue
        p = mw @ v.co
        if box and not all(box[0][i] <= p[i] <= box[1][i] for i in range(3)):
            continue
        hit, nrm, _i, d = tree.find_nearest(p, max_dist)
        if hit is None:
            continue
        if (p - hit).dot(nrm) > 0:                      # outside the solid: bring it down onto the surface
            v.co = inv @ (hit + nrm.normalized() * margin); n += 1
    o.data.update(); return n


def cap(obj, box, weld=0.0015):
    """Close open boundary loops inside box: weld the boundary verts that sit on top of each other (a mirror seam) and fill the loops with
    faces (no new verts, so skinning is unchanged).  New faces take the UVs of their verts' existing corners."""
    o = find(obj); mw = o.matrix_world
    bm = bmesh.new(); bm.from_mesh(o.data)
    inb = lambda v: all(box[0][i] <= (mw @ v.co)[i] <= box[1][i] for i in range(3))
    bverts = [v for v in bm.verts if inb(v) and any(len(e.link_faces) == 1 for e in v.link_edges)]
    bmesh.ops.remove_doubles(bm, verts=bverts, dist=weld)
    edges = [e for e in bm.edges if len(e.link_faces) == 1 and all(inb(v) for v in e.verts)]
    res = bmesh.ops.holes_fill(bm, edges=edges, sides=0)
    uvl = bm.loops.layers.uv.active
    for f in res["faces"]:
        for l in f.loops:                               # borrow a UV from another corner of the same vertex
            other = next((l2 for l2 in l.vert.link_loops if l2.face not in res["faces"]), None)
            if other is not None:
                l[uvl].uv = other[uvl].uv.copy()
        f.material_index = next((l2.face.material_index for l2 in f.loops[0].vert.link_loops if l2.face not in res["faces"]), 0)
    bmesh.ops.recalc_face_normals(bm, faces=res["faces"])
    bm.to_mesh(o.data); bm.free(); o.data.update()
    return len(res["faces"])


def _weights(o, v):
    names = {g.index: g.name for g in o.vertex_groups}
    return {names[g.group]: g.weight for g in v.groups if g.weight > 0}


def _set_weights(o, v, w):
    for g in list(v.groups):
        o.vertex_groups[g.group].remove([v.index])
    for name, val in w.items():
        vg = o.vertex_groups.get(name) or o.vertex_groups.new(name=name)
        vg.add([v.index], val, "REPLACE")


def weld_weights(obj, box, radius=0.025, boundary_only=True):
    """Edges of two panels that meet at rest but pull apart in motion (different bones): every (boundary) vert in box gets the average
    skin weights of all (boundary) verts within radius, so neighbouring edges move together.  Geometry is not touched."""
    o = find(obj); mw = o.matrix_world
    bm = bmesh.new(); bm.from_mesh(o.data)
    bset = {v.index for v in bm.verts if any(len(e.link_faces) == 1 for e in v.link_edges)} if boundary_only else None
    bm.free()
    pts = [(v, mw @ v.co) for v in o.data.vertices if (bset is None or v.index in bset)
           and all(box[0][i] <= (mw @ v.co)[i] <= box[1][i] for i in range(3))]
    new = []
    for v, p in pts:
        acc = {}; n = 0
        for v2, p2 in pts:
            if (p2 - p).length <= radius:
                n += 1
                for k, val in _weights(o, v2).items():
                    acc[k] = acc.get(k, 0.0) + val
        tot = sum(acc.values()) or 1.0
        new.append((v, {k: val / tot for k, val in acc.items()}))
    for v, w in new:
        _set_weights(o, v, w)
    return len(new)


def rigid_weights(obj, src):
    """Every island of obj gets ONE weight set: src's weights at the vertex nearest the island's centre (a pouch moves as a block with what
    it hangs on, its strap cannot bend away from it)."""
    o = find(obj); s_ = find(src); mw = o.matrix_world; smw = s_.matrix_world
    from mathutils.kdtree import KDTree
    kd = KDTree(len(s_.data.vertices))
    for v in s_.data.vertices:
        kd.insert(smw @ v.co, v.index)
    kd.balance()
    bm = bmesh.new(); bm.from_mesh(o.data); bm.verts.ensure_lookup_table()
    seen = set(); islands = []
    for v0 in bm.verts:
        if v0.index in seen: continue
        stack = [v0]; comp = []
        while stack:
            v = stack.pop()
            if v.index in seen: continue
            seen.add(v.index); comp.append(v.index)
            stack += [e.other_vert(v) for e in v.link_edges if e.other_vert(v).index not in seen]
        islands.append(comp)
    bm.free()
    for comp in islands:
        c = sum((mw @ o.data.vertices[i].co for i in comp), Vector()) / len(comp)
        _co, si, _d = kd.find(c)
        w = _weights(s_, s_.data.vertices[si])
        for i in comp:
            _set_weights(o, o.data.vertices[i], w)
    return len(islands)


def run(edits, g):
    for op, kw in edits:
        kw = dict(kw)
        if op in ("cut_below", "cut_above"):
            o = find(kw.pop("obj"))
            (g["bisect_below"](o, kw["z"], kw.get("r")) if op == "cut_below" else g["bisect_above"](o, kw["z"], kw.get("r", 9.0)))
            print("   edit %s %s z=%.3f" % (op, o.name, kw["z"])); continue
        if op == "transfer_weights":                   # builder helper: nearest-surface skin weights from src onto obj
            g["transfer_weights"](find(kw["src"]), find(kw["obj"])); print("   edit weights   %s <- %s" % (kw["obj"], kw["src"])); continue
        n = globals()[op](**kw)
        print("   edit %-8s %-28s %s" % (op, kw.get("obj"), n))
