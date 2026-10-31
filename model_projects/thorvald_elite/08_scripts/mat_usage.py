"""Faces per material per object, with the height range each material covers.   blender -b <file.blend> --python mat_usage.py"""
import bpy
for o in bpy.data.objects:
    if o.type != "MESH" or o.hide_render:
        continue
    use = {}
    for p in o.data.polygons:
        m = o.data.materials[p.material_index].name if o.data.materials and o.data.materials[p.material_index] else "?"
        c = o.matrix_world @ p.center
        a = use.setdefault(m, [0, 9, -9, 9, -9])
        a[0] += 1
        a[1], a[2] = min(a[1], c.z), max(a[2], c.z)
        a[3], a[4] = min(a[3], abs(c.x)), max(a[4], abs(c.x))
    for m, a in use.items():
        print("MU %-20s %-18s faces %4d  z %.2f..%.2f  |x| %.2f..%.2f" % (o.name, m, a[0], a[1], a[2], a[3], a[4]))
