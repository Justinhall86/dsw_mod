"""Coarse deck height map of the cruiser (raycast down), printed as a grid: rows = y, cols = x.

    blender -b 03_blender/wreck_whole.blend --python 71_deck_map.py
"""
import bpy
from mathutils import Vector

o = bpy.data.objects["thorvald_cruiser"]
dg = bpy.context.evaluated_depsgraph_get()
xs = range(-84, 80, 6)
print("DECK      " + "".join("%4d" % x for x in xs))
for y in range(48, -49, -6):
    row = []
    for x in xs:
        hit, loc, n, i, ob, m = bpy.context.scene.ray_cast(dg, Vector((x, y, 100)), Vector((0, 0, -1)))
        row.append("%4d" % round(loc.z) if hit else "   .")
    print("DECK y%4d " % y + "".join(row))
