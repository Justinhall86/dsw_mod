"""Verify a kitbash .blend: objects, materials, packed images, armature sharing.

    blender -b --python verify_kitbash.py -- <blend> [out.png]
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
    raise SystemExit("usage: verify_kitbash.py -- <blend> [out.png]")

bpy.ops.wm.open_mainfile(filepath=blend)
print("OPENED", blend)

problems = []

rigs = [o for o in bpy.data.objects if o.type == "ARMATURE"]
meshes = [o for o in bpy.data.objects if o.type == "MESH"]

print("\nOBJECTS:")
for o in bpy.data.objects:
    extra = ""
    if o.type == "MESH":
        extra = " tris %d" % len(o.data.polygons)
    if o.parent:
        extra += "  parent=%s(%s)" % (o.parent.name, o.parent_bone or o.parent_type)
    print("  %-26s %-10s%s" % (o.name, o.type, extra))

print("\nRIGS: %d" % len(rigs))
for r in rigs:
    print("  %s  bones=%d" % (r.name, len(r.data.bones)))

print("\nMESHES: %d" % len(meshes))
for m in meshes:
    arm_mods = [mod for mod in m.modifiers if mod.type == "ARMATURE"]
    print("  %-26s tris=%d  armature_mods=%s  parent=%s" % (
        m.name, len(m.data.polygons),
        [getattr(mod.object, "name", None) for mod in arm_mods],
        m.parent.name if m.parent else None))

if len(rigs) != 1:
    problems.append("expected 1 armature, found %d" % len(rigs))

for m in meshes:
    if not any(mod.type == "ARMATURE" for mod in m.modifiers):
        problems.append("%s has no ARMATURE modifier" % m.name)

print("\nMATERIALS:")
for mat in bpy.data.materials:
    if not mat.use_nodes:
        continue
    print("MATERIAL", mat.name)
    for line in bs.material_report(mat):
        print(line)

print("\nIMAGES:")
for img in bpy.data.images:
    if img.size[0]:
        print("  %-46s %5dx%-5d packed=%-5s %s" % (
            img.name, img.size[0], img.size[1], bool(img.packed_file), img.filepath))
        if not img.packed_file:
            problems.append("image %s is not packed" % img.name)

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