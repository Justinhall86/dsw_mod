"""Report vertices with NO skin weight, per mesh (an unweighted vertex stays at its rest position when the body animates).

    blender -b <file.blend> --python weight_check.py
"""
import bpy

for o in bpy.data.objects:
    if o.type != "MESH" or o.hide_render:
        continue
    bad = [v.index for v in o.data.vertices if not any(g.weight > 1e-6 for g in v.groups)]
    print("WC %-22s verts %5d  unweighted %4d  groups %d" % (o.name, len(o.data.vertices), len(bad), len(o.vertex_groups)))
