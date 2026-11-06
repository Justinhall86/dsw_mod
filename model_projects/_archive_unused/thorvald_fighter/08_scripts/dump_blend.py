"""Dump materials / images / object info from the opened blend.

    blender -b <blend> --python inspect.py --
"""
import sys

import bpy

a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
if a:
    bpy.ops.wm.open_mainfile(filepath=a[0])
for o in bpy.data.objects:
    print("OBJ", o.name, o.type, "loc", tuple(round(v, 3) for v in o.location),
          "mats", [m.name if m else None for m in getattr(o.data, "materials", [])])
for m in bpy.data.materials:
    imgs = []
    if m.use_nodes:
        for n in m.node_tree.nodes:
            if n.type == "TEX_IMAGE":
                imgs.append((n.name, n.image.name if n.image else None,
                             bool(n.image.packed_file) if n.image else None))
    print("MAT", m.name, imgs)
for i in bpy.data.images:
    print("IMG", i.name, i.size[:], "packed" if i.packed_file else "file:" + str(i.filepath))
