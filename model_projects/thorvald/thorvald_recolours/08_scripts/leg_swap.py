"""Swap leg kits between Thorvald infantry finals (owner 2026-11-13).
    blender -b <target.blend> --python leg_swap.py -- <donor.blend> <add obj,obj> <remove obj,obj> <out.blend>
Appended objects are re-bound to the target rig (parent + Armature modifier); a material whose name already exists
in the target is remapped to the target's own copy (same vanilla UV layout), so no Mat_X.001 slots appear."""
import bpy, sys
donor, add, rem, out = sys.argv[sys.argv.index('--') + 1:]
rig = next(o for o in bpy.data.objects if o.type == 'ARMATURE')
for n in rem.split(','):
    if n: bpy.data.objects.remove(bpy.data.objects[n], do_unlink=True); print('REMOVED', n)
before = set(bpy.data.materials)
with bpy.data.libraries.load(donor, link=False) as (src, dst):
    dst.objects = [n for n in add.split(',')]
for o in dst.objects:
    bpy.context.scene.collection.objects.link(o)
    mw = o.matrix_world.copy(); o.parent = rig; o.matrix_world = mw
    for m in o.modifiers:
        if m.type == 'ARMATURE': m.object = rig
    for s in o.material_slots:
        base = s.material.name.split('.')[0]
        if s.material not in before and base in bpy.data.materials and bpy.data.materials[base] in before:
            s.material = bpy.data.materials[base]
    print('ADDED', o.name, [s.material.name for s in o.material_slots])
for m in [m for m in bpy.data.materials if m.users == 0]: bpy.data.materials.remove(m)
try:
    bpy.ops.file.pack_all()
except RuntimeError as e:
    print("PACK WARNING", str(e)[:160])
bpy.ops.wm.save_as_mainfile(filepath=out)
print('SAVED', out)
