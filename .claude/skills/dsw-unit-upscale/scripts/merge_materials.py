"""Point every object at ONE material per texture set: 'Mat_Commando.001' -> 'Mat_Commando', and so on.  Kitbashing imports each donor again, so the same
material exists several times (one draw call each in the game, and the upscale would process each copy separately).

    blender -b <in.blend> --python merge_materials.py -- <out.blend>
"""
import os
import re
import sys

import bpy

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
base = {}
for m in bpy.data.materials:
    if not re.search(r"\.\d{3}$", m.name):
        base[m.name] = m
n = 0
for o in bpy.data.objects:
    if o.type != "MESH":
        continue
    for i, m in enumerate(o.data.materials):
        if m is None:
            continue
        root = re.sub(r"\.\d{3}$", "", m.name)
        if root != m.name and root in base:
            o.data.materials[i] = base[root]
            n += 1
for m in list(bpy.data.materials):
    if m.users == 0:
        bpy.data.materials.remove(m)
for im in list(bpy.data.images):
    if im.users == 0:
        bpy.data.images.remove(im)
print("MERGED", n, "slots; materials now", sorted(m.name for m in bpy.data.materials))
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
