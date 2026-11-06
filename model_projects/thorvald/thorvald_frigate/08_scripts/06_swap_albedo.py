"""Swap the ship's albedo and save a working .blend.

    blender -b <in.blend> --python 06_swap_albedo.py -- <albedo.png> <out.blend> [pack]
"""
import bpy
import os
import sys

argv = sys.argv[sys.argv.index("--") + 1:]
ALBEDO, OUTBLEND = argv[0], argv[1]
PACK = "--nopack" not in argv

scene = bpy.context.scene
mat = bpy.data.materials["Mat_Renegade_Frigate"]
nodes = mat.node_tree.nodes
bsdf = next(n for n in nodes if n.type == "BSDF_PRINCIPLED")
base_link = next(l for l in mat.node_tree.links
                 if l.to_node == bsdf and l.to_socket.name == "Base Color")
tex = base_link.from_node

img = bpy.data.images.load(ALBEDO, check_existing=False)
img.name = os.path.splitext(os.path.basename(ALBEDO))[0]
if PACK:
    img.pack()
tex.image = img

# make sure the old packed albedo is not left dangling
for i in list(bpy.data.images):
    if i.users == 0:
        bpy.data.images.remove(i)

os.makedirs(os.path.dirname(OUTBLEND), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=OUTBLEND)
print("SAVED", OUTBLEND, "albedo", ALBEDO)
