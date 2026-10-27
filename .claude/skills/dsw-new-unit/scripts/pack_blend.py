"""Pack every image into the .blend and save it under a new name.   blender -b <in.blend> --python pack_blend.py -- <out.blend>"""
import os
import sys

import bpy

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
for im in list(bpy.data.images):
    if im.users == 0:
        bpy.data.images.remove(im)
n = 0
for im in bpy.data.images:
    if im.source == "FILE" and not im.packed_file:
        try:
            im.pack()
            n += 1
        except Exception as e:  # noqa: BLE001
            print("PACKFAIL", im.name, e)
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("PACKED", n, "images ->", out)
