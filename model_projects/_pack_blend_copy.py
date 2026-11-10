"""Blender helper for build_final_folders.py: save a SELF-CONTAINED copy of a .blend (every image packed).

    blender -b <src.blend> --python _pack_blend_copy.py -- <dst.blend>
"""
import sys

import bpy

dst = sys.argv[sys.argv.index("--") + 1]
packed = missing = 0
for img in bpy.data.images:
    if img.packed_file or img.source not in ("FILE", "SEQUENCE", "TILED"):
        continue
    try:
        img.pack()
        packed += 1
    except RuntimeError:
        missing += 1
        print("  MISSING image", img.name, img.filepath)
bpy.ops.wm.save_as_mainfile(filepath=dst, copy=True, compress=True)
print("PACKED_COPY %s packed=%d missing=%d" % (dst, packed, missing))
