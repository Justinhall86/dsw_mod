"""Stage 3 - drop the hand-modelled components; keep only the vanilla hull + edits.

    blender -b --python 03_drop_scratch_parts.py -- <in.blend> <out.blend>

The four TK_* objects were modelled from primitives, which is not the house rule: kitbash elements have to
come from existing game models so the quality is known.  This strips them back out, leaving the copper
recolour and the removed keel fin (stage 1).
"""
import os
import sys

import bpy
import bmesh

src = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
dst = os.path.abspath(sys.argv[sys.argv.index("--") + 2])

SCRATCH = ("TK_Scanner", "TK_Module", "TK_Turret", "TK_SensorDome")
MATS = ("Thorvald_Copper", "Thorvald_Lens")

bpy.ops.wm.open_mainfile(filepath=src)

removed = []
for name in SCRATCH:
    ob = bpy.data.objects.get(name)
    if ob is None:
        print("ABSENT", name)
        continue
    bpy.data.objects.remove(ob, do_unlink=True)
    removed.append(name)
for name in MATS:
    m = bpy.data.materials.get(name)
    if m is not None and m.users == 0:
        bpy.data.materials.remove(m)
        print("dropped unused material", name)

ship = bpy.data.objects["Renegade_Frigate"]
me = ship.data

# the hull itself must be untouched by this pass
bm = bmesh.new()
bm.from_mesh(me)
bm.verts.ensure_lookup_table()
seen = set()
islands = 0
for v in bm.verts:
    if v.index in seen:
        continue
    islands += 1
    stack = [v]
    seen.add(v.index)
    while stack:
        cur = stack.pop()
        for e in cur.link_edges:
            o = e.other_vert(cur)
            if o.index not in seen:
                seen.add(o.index)
                stack.append(o)
boundary = sum(1 for e in bm.edges if len(e.link_faces) == 1)
lo = [min(v.co[i] for v in bm.verts) for i in range(3)]
hi = [max(v.co[i] for v in bm.verts) for i in range(3)]
bm.free()
print("HULL verts %d faces %d islands %d open_edges %d" % (len(me.vertices), len(me.polygons), islands, boundary))
print("HULL rest-space bbox %s .. %s" % ([round(v, 3) for v in lo], [round(v, 3) for v in hi]))
if islands != 190:
    raise SystemExit("hull island count changed (expected 190 = 194 source islands minus the 4 keel-fin islands removed in stage 1) - aborting")

bpy.ops.wm.save_as_mainfile(filepath=dst, compress=True)
print("REMOVED", removed)
print("SAVED", dst)
print("objects:", sorted(o.name for o in bpy.data.objects))
