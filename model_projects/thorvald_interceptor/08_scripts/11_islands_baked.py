"""List connected islands of a donor in EVALUATED (posed) space, as fractions of
the model's half-extent, so extract boxes can be written as exact numbers.

    blender -b --factory-startup --python 11_islands_baked.py -- <donor.fbx> [--min-faces 4]

`survey_islands.py` reads raw `mesh.data` coordinates, which for HMD-converted
meshes are BIND pose and do not match what you see rendered. This bakes the
evaluated shape into the vertices first, so every number here is in the same
space the builder's extract boxes are measured in.
"""
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

a = sys.argv[sys.argv.index("--") + 1:]
src = os.path.abspath(a[0])
min_faces = int(a[a.index("--min-faces") + 1]) if "--min-faces" in a else 4

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs  # noqa: E402

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=src)
for junk in bs.JUNK_NAMES:
    o = bpy.data.objects.get(junk)
    if o and o.type == "MESH":
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
bpy.context.view_layer.update()

baked = []
for o in meshes:
    dg = bpy.context.evaluated_depsgraph_get()
    ev = o.evaluated_get(dg)
    me = ev.to_mesh()
    mw = o.matrix_world.copy()
    coords = [(mw @ me.vertices[i].co) for i in range(len(me.vertices))]
    ev.to_mesh_clear()
    for i, v in enumerate(o.data.vertices):
        v.co = coords[i]
    o.data.update()
    for mod in list(o.modifiers):
        if mod.type == "ARMATURE":
            o.modifiers.remove(mod)
    o.parent = None
    o.matrix_world = Matrix.Identity(4)
    baked.append(o)
bpy.context.view_layer.update()

# global bounds
mn = Vector((1e18,) * 3)
mx = Vector((-1e18,) * 3)
for o in baked:
    for v in o.data.vertices:
        p = v.co
        mn.x, mn.y, mn.z = min(mn.x, p.x), min(mn.y, p.y), min(mn.z, p.z)
        mx.x, mx.y, mx.z = max(mx.x, p.x), max(mx.y, p.y), max(mx.z, p.z)
half = (mx - mn) / 2
centre = (mn + mx) / 2
print("MODEL %s  dims %.3f %.3f %.3f  half %.3f %.3f %.3f"
      % (os.path.basename(src), mx.x - mn.x, mx.y - mn.y, mx.z - mn.z, half.x, half.y, half.z))

rows = []
for o in baked:
    bm = bmesh.new()
    bm.from_mesh(o.data)
    bm.verts.ensure_lookup_table()
    seen = set()
    for v in bm.verts:
        if v.index in seen:
            continue
        stack = [v]
        comp = []
        seen.add(v.index)
        while stack:
            cur = stack.pop()
            comp.append(cur)
            for e in cur.link_edges:
                ov = e.other_vert(cur)
                if ov.index not in seen:
                    seen.add(ov.index)
                    stack.append(ov)
        faces = set()
        for vert in comp:
            for f in vert.link_faces:
                faces.add(f.index)
        if len(faces) < min_faces:
            continue
        pts = [(o.matrix_world @ vert.co) - centre for vert in comp]
        lo = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
        hi = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
        rows.append({
            "faces": len(faces), "verts": len(comp),
            "lo": lo, "hi": hi,
            "c": (lo + hi) / 2, "s": hi - lo,
        })
    bm.free()

rows.sort(key=lambda r: -r["faces"])
print("%4s %6s  %6s %6s %6s | %6s %6s %6s | %s"
      % ("#", "faces", "fx", "fy", "fz", "sx", "sy", "sz", "frac_box"))
for i, r in enumerate(rows[:40]):
    fc = Vector((r["c"].x / half.x, r["c"].y / half.y, r["c"].z / half.z))
    fs = Vector((r["s"].x / half.x, r["s"].y / half.y, r["s"].z / half.z))
    box = "%s:%s:%s" % (
        "%.2f,%.2f" % (r["lo"].x / half.x, r["hi"].x / half.x),
        "%.2f,%.2f" % (r["lo"].y / half.y, r["hi"].y / half.y),
        "%.2f,%.2f" % (r["lo"].z / half.z, r["hi"].z / half.z),
    )
    print("%4d %6d  %6.2f %6.2f %6.2f | %6.2f %6.2f %6.2f | %s"
          % (i, r["faces"], fc.x, fc.y, fc.z, fs.x, fs.y, fs.z, box))
print("TOTAL islands", len(rows))
