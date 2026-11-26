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


def push_out(obj, solid, centre=(0, -0.01, 1.80), margin=0.004, box=None):
    """Verts of obj that lie INSIDE solid's outer surface (seen from `centre`) are pushed out to (outer hit + margin):
    a cowl or mask that sinks into the head / chest is lifted clear of it."""
    o = find(obj); tree = _tree(find(solid)); inv = o.matrix_world.inverted(); C = Vector(centre); n = 0
    for v, p in list(_verts(o, box)):
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


def run(edits, g):
    for op, kw in edits:
        kw = dict(kw)
        if op in ("cut_below", "cut_above"):
            o = find(kw.pop("obj"))
            (g["bisect_below"](o, kw["z"], kw.get("r")) if op == "cut_below" else g["bisect_above"](o, kw["z"], kw.get("r", 9.0)))
            print("   edit %s %s z=%.3f" % (op, o.name, kw["z"])); continue
        n = globals()[op](**kw)
        print("   edit %-8s %-28s %s" % (op, kw.get("obj"), n))
