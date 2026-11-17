"""Game-culling see-through fix: shoot a grid of parallel rays from 48 directions; a ray that meets only back faces
(culled in game) and no front face is a see-through line. Every back face on such a ray gets a flipped twin.
One pass (twins coincide with originals, so a second pass would re-flag them).

    blender -b <blend> --python 93_seethrough_fix.py -- <out.blend> [spacing=0.8]
"""
import math, os, sys
import bmesh, bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree

argv = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(argv[0]); SP = float(argv[1]) if len(argv) > 1 else 0.8
objs = [o for o in bpy.data.objects if o.type == "MESH"]
for o in objs:
    o.data.transform(o.matrix_world); o.matrix_world.identity()
dirs = [Vector(d).normalized() for d in ((-0.7, -0.7, 0.55), (0.7, 0.7, 0.55), (0, 0, 1), (0, 0, -1), (0, -1, 0.08),
                                          (0, 1, 0.08), (-1, 0, 0.12), (1, 0, 0.12))]
N = 40
for i in range(N):
    z = 1 - 2 * (i + 0.5) / N; r = math.sqrt(1 - z * z); a = i * math.pi * (3 - math.sqrt(5))
    dirs.append(Vector((r * math.cos(a), r * math.sin(a), z)))
for it in range(1):                 # one pass: twins sit on their originals, so later passes re-flag them
    bms = {}; verts, polys, owner = [], [], []
    for o in objs:
        b = bmesh.new(); b.from_mesh(o.data); b.faces.ensure_lookup_table(); b.verts.index_update(); b.normal_update()
        bms[o.name] = b; off = len(verts); verts += [v.co.copy() for v in b.verts]
        for f in b.faces:
            polys.append([off + v.index for v in f.verts]); owner.append((o.name, f.index))
    tree = BVHTree.FromPolygons(verts, polys)
    normals = [bms[n].faces[i].normal.copy() for n, i in owner]
    pts = [Vector(v) for v in verts]
    c = sum(pts, Vector()) / len(pts); R = max((p - c).length for p in pts) + 1
    bad, rays = set(), 0
    for d in dirs:                                   # rays travel along -d (camera at +d)
        u = d.orthogonal().normalized(); w = d.cross(u)
        n = int(2 * R / SP)
        for i in range(n):
            for j in range(n):
                o_ = c + d * (R + 5) + u * (-R + i * SP) + w * (-R + j * SP)
                back, front, p = [], False, o_
                for _ in range(30):
                    loc, nrm, idx, dist = tree.ray_cast(p, -d, 4 * R)
                    if loc is None:
                        break
                    if normals[idx].dot(-d) < 0:     # faces the camera: visible in game
                        front = True; break
                    back.append(idx); p = loc - d * 1e-3
                if back and not front:
                    bad.update(back); rays += 1
    print("PASS %d: see-through rays %d, faces to make two-sided %d" % (it, rays, len(bad)))
    by = {}
    for idx in bad:
        by.setdefault(owner[idx][0], []).append(owner[idx][1])
    for o in objs:
        b = bms[o.name]
        if o.name in by:
            res = bmesh.ops.duplicate(b, geom=[b.faces[i] for i in by[o.name]])
            bmesh.ops.reverse_faces(b, faces=[g for g in res["geom"] if isinstance(g, bmesh.types.BMFace)])
        b.to_mesh(o.data); b.free(); o.data.update()
    if not bad:
        break
print("TRIS", {o.name: sum(len(p.vertices) - 2 for p in o.data.polygons) for o in objs})
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("SEETHROUGH_OK", OUT)
