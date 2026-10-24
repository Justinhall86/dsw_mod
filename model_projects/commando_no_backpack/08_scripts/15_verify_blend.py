"""Step 15 - verify a saved .blend: open it, report what is inside, and render
it.  This proves the .blend shows the finished product.

  blender -b --python 08_scripts/15_verify_blend.py -- <blend> <out.png>

Checks
  * the objects present, their types, the material wiring
  * the image datablocks and the file each one points at
  * the mesh's triangle count (should be the no-backpack count)
  * the rig's bones and that the body is still bound to it
  * the rifle is parented to B_Gun
"""
import os
import sys

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"

argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
blend = os.path.abspath(argv[0]) if argv else os.path.join(
    PROJ, "03_blender", "commando_nopack_house.blend")
out = os.path.abspath(argv[1]) if len(argv) > 1 else os.path.join(
    PROJ, "02_progress_photos", "06_final", "blend_check.png")

bpy.ops.wm.open_mainfile(filepath=blend)
print("OPENED", blend)

print("OBJECTS:")
for o in bpy.data.objects:
    extra = ""
    if o.type == "MESH":
        extra = " tris %d" % len(o.data.polygons)
    if o.parent:
        extra += "  parent=%s(%s)" % (o.parent.name, o.parent_bone or o.parent_type)
    print("  %-22s %-10s%s" % (o.name, o.type, extra))

for m in bpy.data.materials:
    if not m.use_nodes:
        continue
    print("MATERIAL", m.name)
    for l in m.node_tree.links:
        if l.from_node.type == "TEX_IMAGE":
            img = l.from_node.image
            print("   %-20s <- %-42s %s" % (l.to_socket.name,
                                           img.name if img else "None",
                                           (img.filepath if img else "")))

print("IMAGES:")
for i in bpy.data.images:
    if i.size[0]:
        print("  %-46s %5dx%-5d %s" % (i.name, i.size[0], i.size[1], i.filepath))

for o in bpy.data.objects:
    if o.type == "MESH" and o.name == "Commando":
        print("BODY tris %d verts %d" % (len(o.data.polygons), len(o.data.vertices)))
        print("BODY modifiers:", [(mo.type, getattr(mo, 'object', None).name
                                  if getattr(mo, 'object', None) else "") for mo in o.modifiers])
    if o.type == "ARMATURE":
        print("RIG bones %d  B_Gun present: %s"
              % (len(o.data.bones), "B_Gun" in [b.name for b in o.data.bones]))

# ---- render -----------------------------------------------------------
sc = bpy.context.scene
if not sc.camera:
    raise SystemExit("no camera in the blend")
sc.render.filepath = out
sc.render.resolution_x = 1000
sc.render.resolution_y = 1300
sc.render.engine = "BLENDER_EEVEE"
bpy.ops.render.render(write_still=True)
print("RENDERED", out, os.path.getsize(out), "bytes")
