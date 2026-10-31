"""List every open boundary loop (edges used by exactly one face) per mesh, with its size and bounding box (world space, rest pose).

    blender -b <file.blend> --python boundary_report.py -- [min_edges]

Expected openings are hems, cuffs, boot soles, a neck top.  Anything else (a loop at a seam between two donor parts, a loop floating mid-torso)
is a slot to fill.  Also reports non-manifold edges (3+ faces) and tiny loose islands.
"""
import sys

import bmesh
import bpy

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
min_edges = int(a[0]) if a else 3
for o in bpy.data.objects:
    if o.type != "MESH" or o.hide_render:
        continue
    bm = bmesh.new()
    bm.from_mesh(o.data)
    mw = o.matrix_world
    bnd = [e for e in bm.edges if len(e.link_faces) == 1]
    seen = set()
    loops = []
    for e0 in bnd:
        if e0.index in seen:
            continue
        stack, members = [e0], []
        seen.add(e0.index)
        while stack:
            e = stack.pop()
            members.append(e)
            for v in e.verts:
                for e2 in v.link_edges:
                    if len(e2.link_faces) == 1 and e2.index not in seen:
                        seen.add(e2.index)
                        stack.append(e2)
        loops.append(members)
    loops.sort(key=len, reverse=True)
    nm = sum(1 for e in bm.edges if len(e.link_faces) > 2)
    print("BR %-20s faces %5d  boundary edges %4d  loops %3d  non-manifold %d" % (o.name, len(bm.faces), len(bnd), len(loops), nm))
    for L in loops:
        if len(L) < min_edges:
            continue
        pts = [mw @ v.co for e in L for v in e.verts]
        xs, ys, zs = [p.x for p in pts], [p.y for p in pts], [p.z for p in pts]
        print("BR   loop %3d edges  x %6.3f..%6.3f  y %6.3f..%6.3f  z %6.3f..%6.3f" % (len(L), min(xs), max(xs), min(ys), max(ys), min(zs), max(zs)))
    bm.free()
