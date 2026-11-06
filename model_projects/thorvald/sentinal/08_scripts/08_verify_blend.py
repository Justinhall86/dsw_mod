"""Step 08 - verify a saved .blend: report what is inside and render it.

    blender -b --python 08_verify_blend.py -- <blend> [out.png]

Checks
  * the objects present, their types, their parents
  * the material wiring, socket by socket
  * the image datablocks and the file each one points at
  * the mesh's triangle count (compare it with the expected count!)
  * the rig's bones and that the body is still bound to it
  * the weapon is parented to the right bone
  * whether every image is PACKED (a portable .blend needs that)

This is the script to run before shipping a .blend to the user.
"""
import os
import sys

import bpy

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import script_args

argv = script_args()
blend = os.path.abspath(argv[0]) if argv else ""
out = os.path.abspath(argv[1]) if len(argv) > 1 else None
if not blend:
    raise SystemExit("usage: 08_verify_blend.py -- <blend> [out.png]")

bpy.ops.wm.open_mainfile(filepath=blend)
print("OPENED", blend)

problems = []

print("\nOBJECTS:")
for o in bpy.data.objects:
    extra = ""
    if o.type == "MESH":
        extra = " tris %d" % len(o.data.polygons)
    if o.parent:
        extra += "  parent=%s(%s)" % (o.parent.name, o.parent_bone or o.parent_type)
    print("  %-26s %-10s%s" % (o.name, o.type, extra))
    if o.type == "MESH" and o.parent and o.parent.type == "ARMATURE" \
            and o.parent_bone and o.parent_bone not in o.parent.data.bones:
        problems.append("%s: parent bone %s missing" % (o.name, o.parent_bone))

print("\nMATERIALS:")
for m in bpy.data.materials:
    if not m.use_nodes:
        continue
    print("MATERIAL", m.name)
    for line in bs.material_report(m):
        print(line)

print("\nIMAGES:")
for i in bpy.data.images:
    if i.size[0]:
        print("  %-46s %5dx%-5d packed=%-5s %s"
              % (i.name, i.size[0], i.size[1], bool(i.packed_file), i.filepath))
        if not i.packed_file and i.filepath:
            problems.append("image %s is not packed" % i.name)

for o in bpy.data.objects:
    if o.type == "MESH" and o.data.vertices and len(o.data.polygons) > 100:
        print("\nBODY %s tris %d verts %d" % (o.name, len(o.data.polygons),
                                               len(o.data.vertices)))
        print("BODY modifiers: %s" % [(m.type, getattr(m, "object", None).name
                                       if getattr(m, "object", None) else "")
                                      for m in o.modifiers])
        # A weapon parented to a BONE is driven by the bone, not skinned, so it
        # legitimately has no ARMATURE modifier.  Only flag an unskinned body.
        if not any(m.type == "ARMATURE" for m in o.modifiers):
            if o.parent is None:
                problems.append("%s has no ARMATURE modifier and no parent - "
                                "is it still skinned?" % o.name)
            elif o.parent_bone:
                print("      (parented to bone %s - not skinned, which is correct)"
                      % o.parent_bone)
            else:
                problems.append("%s has no ARMATURE modifier - is it still skinned?" % o.name)
    if o.type == "ARMATURE":
        print("\nRIG %s bones %d  B_Gun present: %s"
              % (o.name, len(o.data.bones),
                 "B_Gun" in [b.name for b in o.data.bones]))

if problems:
    print("\nPROBLEMS:")
    for p in problems:
        print("  ! %s" % p)
else:
    print("\nPROBLEMS: none")

if out:
    sc = bpy.context.scene
    if not sc.camera:
        print("NO CAMERA in the blend - cannot render")
    else:
        sc.render.filepath = out
        sc.render.engine = "BLENDER_EEVEE"
        sc.render.resolution_x = 1000
        sc.render.resolution_y = 1300
        sc.view_settings.view_transform = "Standard"
        bpy.ops.render.render(write_still=True)
        print("RENDERED", out, os.path.getsize(out), "bytes")
