"""Report the materials and image-texture nodes that survive an import, for donor inspection.

    blender -b --python dump_mats.py -- <model.fbx|.blend>
"""
import os
import sys

import bpy

src = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
bpy.ops.wm.read_factory_settings(use_empty=True)
if src.lower().endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=src)
else:
    bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()

print("objects:", [(o.name, o.type) for o in bpy.data.objects])
for m in bpy.data.materials:
    print("MAT", m.name, "use_nodes", m.use_nodes)
    if not m.use_nodes:
        continue
    for n in m.node_tree.nodes:
        if n.type == "TEX_IMAGE":
            img = n.image
            print("   TEX_IMAGE", n.name, "image", img.name if img else None,
                  "size", tuple(img.size) if img else None,
                  "packed", bool(img.packed_file) if img else None,
                  "source", img.filepath if img else None)
        elif n.type == "BSDF_PRINCIPLED":
            for s in n.inputs:
                if s.is_linked:
                    print("   BSDF input linked:", s.name, "<-", s.links[0].from_node.name)
for o in bpy.data.objects:
    if o.type == "MESH":
        print("MESH", o.name, "verts", len(o.data.vertices), "mats", [s.name for s in o.material_slots])
