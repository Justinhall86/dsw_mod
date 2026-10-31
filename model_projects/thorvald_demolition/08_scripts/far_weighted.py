"""List verts that are weighted to a joint but rest far away from it (stretch candidates).  blender -b <blend> --python far_weighted.py -- <object> <min_dist>"""
import sys, bpy
a = sys.argv[sys.argv.index("--") + 1:]
o = bpy.data.objects[a[0]]; md = float(a[1])
rig = next(x for x in bpy.data.objects if x.type == "ARMATURE")
mw = o.matrix_world
out = {}
for v in o.data.vertices:
    for g in v.groups:
        if g.weight < 0.5: continue
        nm = o.vertex_groups[g.group].name
        b = rig.data.bones.get(nm)
        if not b: continue
        d = (mw @ v.co - rig.matrix_world @ b.head_local).length
        if d > md:
            out.setdefault(nm, []).append((v.index, round(d, 2), tuple(round(c, 2) for c in (mw @ v.co))))
for nm, l in out.items():
    print("FAR", nm, len(l), "verts; sample", l[:4])
