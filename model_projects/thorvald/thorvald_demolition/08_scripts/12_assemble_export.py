"""Assemble the Ginaz captain into ONE skinned mesh and export the FBX the HMD toolkit expects.

    blender -b 03_blender/V6c_GinazCaptain_TallSword.blend --python 12_assemble_export.py -- <out.fbx>

 - body pieces (Mercenary+collar, Raider tunic, Gurney coat, Bannerjee head) joined into one object, each keeping its
   material (6 slots incl. the sword)
 - the TallSword is baked into the mesh at its REST placement and skinned 100% to B_Weapon (a vanilla-style baked
   weapon: it follows the clips' B_Weapon track exactly like the Mercenary's own sword did)
 - <= 3 bone influences per vertex, weights normalised
"""
import os
import sys

import bpy

out = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
rig = bpy.data.objects["Armature"]
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

sword = bpy.data.objects["TallSword"]
mw = sword.matrix_world.copy()
sword.parent = None
sword.matrix_world = mw
sword.data.transform(sword.matrix_world)          # bake the rest placement into the vertices
sword.matrix_world = type(mw)()                   # identity
for g in list(sword.vertex_groups):
    sword.vertex_groups.remove(g)
vg = sword.vertex_groups.new(name="B_Weapon")
vg.add([v.index for v in sword.data.vertices], 1.0, "REPLACE")
for m in list(sword.modifiers):
    sword.modifiers.remove(m)
sword.modifiers.new("Armature", "ARMATURE").object = rig
sword.parent = rig

body_names = ["Mercenary", "BannerjeeHead", "RaiderFill_tunic", "GurneyFill_coat"]
parts = [bpy.data.objects[n] for n in body_names if n in bpy.data.objects] + [sword]
print("PARTS", [(p.name, len(p.data.polygons), [m.name for m in p.data.materials]) for p in parts])

# every part needs every bone group (join merges by name; missing ones are simply empty)
for o in bpy.context.view_layer.objects:
    o.select_set(False)
for p in parts:
    p.hide_set(False)
    p.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join()
body = bpy.context.view_layer.objects.active
body.name = "GinazCaptain"
body.data.name = "GinazCaptainMesh"

# max 3 influences, normalised
fixed = 0
for v in body.data.vertices:
    gs = sorted(v.groups, key=lambda g: -g.weight)
    if len(gs) > 3:
        for g in gs[3:]:
            body.vertex_groups[g.group].remove([v.index])
        fixed += 1
    gs = list(v.groups)
    tot = sum(g.weight for g in gs)
    if tot > 0 and abs(tot - 1.0) > 1e-4:
        for g in gs:
            body.vertex_groups[g.group].add([v.index], g.weight / tot, "REPLACE")
print("LIMITED", fixed, "vertices to 3 influences;", len(body.data.vertices), "verts", len(body.data.polygons), "faces")
print("MATERIALS", [m.name for m in body.data.materials])
unw = sum(1 for v in body.data.vertices if not v.groups)
print("UNWEIGHTED", unw)

for a in list(body.data.color_attributes):
    body.data.color_attributes.remove(a)
for o in [o for o in bpy.data.objects if o.type == "MESH" and o is not body]:
    bpy.data.objects.remove(o, do_unlink=True)
for o in [o for o in bpy.data.objects if o.type in ("LIGHT", "CAMERA")]:
    bpy.data.objects.remove(o, do_unlink=True)
for b in rig.data.bones:
    b.use_deform = True
rig.hide_set(False)
rig.hide_viewport = False
for o in bpy.context.view_layer.objects:
    o.select_set(o in (rig, body))
bpy.context.view_layer.objects.active = rig
bpy.ops.export_scene.fbx(
    filepath=out, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
    bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
    primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="OFF")
print("EXPORTED", out, os.path.getsize(out), "bytes")
