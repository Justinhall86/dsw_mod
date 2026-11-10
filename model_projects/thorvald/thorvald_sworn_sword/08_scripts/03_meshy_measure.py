"""Measure the Meshy Shadow Sentinel's helmet, mask and tail (z-band tables), so the parts can be rebuilt clean on the
Trooper. Prints, per 1.5 cm z band in the head/tail region:
  centre column (|x| < 0.03): min y (face/mask front), max y (back of helmet or tail)
  full width at that band (helmet radius) and the tail's half-width behind the head

    blender -b --factory-startup Meshy_Crimson_Shadow_Sentinel.blend --python 03_meshy_measure.py
"""
import bpy
from mathutils import Vector

ob = bpy.data.objects["mesh_node"]
vs = [ob.matrix_world @ v.co for v in ob.data.vertices]
top = max(v.z for v in vs)
print("TOP", round(top, 3))
z = top
while z > top - 0.75:
    band = [v for v in vs if z - 0.015 < v.z <= z]
    if band:
        cen = [v for v in band if abs(v.x) < 0.03]
        xs = [v.x for v in band]
        line = "z %.3f n %5d  x %.3f..%.3f" % (z, len(band), min(xs), max(xs))
        if cen:
            ys = sorted(v.y for v in cen)
            line += "  centre y %.3f..%.3f" % (ys[0], ys[-1])
            # gaps in the centre column along y: separate shells (face | helmet back | tail)
            gaps = [(round(ys[i], 3), round(ys[i + 1], 3)) for i in range(len(ys) - 1) if ys[i + 1] - ys[i] > 0.02]
            line += "  gaps %s" % gaps
        # tail half width: verts behind y 0.10 (behind the head), their x extent
        back = [v for v in band if v.y > 0.10]
        if back:
            line += "  back(y>.10) x %.3f..%.3f y %.3f..%.3f" % (min(v.x for v in back), max(v.x for v in back),
                                                              min(v.y for v in back), max(v.y for v in back))
        print(line)
    z -= 0.015
