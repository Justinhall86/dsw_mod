"""Visibility-based normal fix: ray-trace every face of every mesh from 400 directions around the ship (all meshes
occlude). A face seen mostly from its back is flipped; one seen a lot from both sides (thin fin/plate) gets a
flipped duplicate so it renders two-sided in game (backface culling). Unseen faces are left alone.

    blender -b <blend> --python 91_fix_normals.py -- <out.blend>
"""
import math, os, sys
import bmesh, bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree

OUT = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
objs = [o for o in bpy.data.objects if o.type == "MESH"]
bms = {}
for o in objs:
    o.data.transform(o.matrix_world); o.matrix_world.identity()
    b = bmesh.new(); b.from_mesh(o.data); b.faces.ensure_lookup_table(); b.normal_update(); bms[o.name] = b
# one BVH over everything; map polygon index -> (object, face)
verts, polys, owner = [], [], []
for o in objs:
    b = bms[o.name]; off = len(verts)
    verts += [v.co.copy() for v in b.verts]; b.verts.index_update()
    for f in b.faces:
        polys.append([off + v.index for v in f.verts]); owner.append((o.name, f.index))
tree = BVHTree.FromPolygons(verts, polys)
N = int(os.environ.get("NDIRS", "400"))
dirs = []
for i in range(N):                                   # Fibonacci sphere
    z = 1 - 2 * (i + 0.5) / N; r = math.sqrt(1 - z * z); a = i * math.pi * (3 - math.sqrt(5))
    dirs.append(Vector((r * math.cos(a), r * math.sin(a), z)))
front = [0] * len(polys); back = [0] * len(polys)
cent = []
for o in objs:
    for f in bms[o.name].faces:
        cent.append((f.calc_center_median(), f.normal.copy()))
for i, (c, n) in enumerate(cent):
    for d in dirs:
        o_ = c + d * 400
        loc, nrm, idx, dist = tree.ray_cast(o_, -d, 800)
        if idx == i:
            if n.dot(d) >= 0: front[i] += 1
            else: back[i] += 1
flip, dup = {}, {}
for i, (name, fi) in enumerate(owner):
    fr, bk = front[i], back[i]
    if bk > 0 and (fr == 0 or bk >= 4 * fr):
        flip.setdefault(name, []).append(fi)
    elif bk > 0:                               # seen from both sides: make it two-sided
        dup.setdefault(name, []).append(fi)
for o in objs:
    b = bms[o.name]; b.faces.ensure_lookup_table()
    fl = [b.faces[i] for i in flip.get(o.name, [])]
    dp = [b.faces[i] for i in dup.get(o.name, [])]
    if fl:
        bmesh.ops.reverse_faces(b, faces=fl)
    if dp:
        res = bmesh.ops.duplicate(b, geom=dp)
        nf = [g for g in res["geom"] if isinstance(g, bmesh.types.BMFace)]
        bmesh.ops.reverse_faces(b, faces=nf)
    print("NORMALS %-18s faces %4d  flipped %3d  two-sided %3d" % (o.name, len(polys and b.faces), len(fl), len(dp)))
    b.to_mesh(o.data); b.free(); o.data.update()
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("NORMALS_OK", OUT)
