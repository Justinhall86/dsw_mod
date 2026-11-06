"""Assemble named parts into ONE skinned mesh and export the FBX the HMD toolkit expects (generalised 12_assemble_export.py).

    blender -b <variant.blend> --python 12b_assemble_export.py -- <out.fbx> --parts Mercenary,BannerjeeHead,... [--sword TallSword]
                                                                  [--rename-mat "old name=new name" ...]

 - parts are joined into one object, every material keeps its slot
 - --sword <object>: that object is baked into the mesh at its REST placement and skinned 100 % to B_Weapon (a vanilla-style baked weapon)
 - --rename-mat: materials whose names contain odd characters (the Idualis head has "Male01_IdualisTrooper05:MAT_...") get a clean name
 - <= 3 bone influences per vertex, weights normalised, colour attributes removed
"""
import os
import sys

import bpy

args = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(args[0])


def opt(flag, many=False):
    if flag not in args:
        return [] if many else None
    vals = []
    i = 0
    while i < len(args):
        if args[i] == flag:
            vals.append(args[i + 1])
        i += 1
    return vals if many else vals[0]


part_names = opt("--parts").split(",")
sword_name = opt("--sword")
renames = dict(r.split("=", 1) for r in opt("--rename-mat", many=True))

rig = bpy.data.objects["Armature"]
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

parts = [bpy.data.objects[n] for n in part_names]
if sword_name:
    sword = bpy.data.objects[sword_name]
    mw = sword.matrix_world.copy()
    sword.parent = None
    sword.matrix_world = mw
    sword.data.transform(sword.matrix_world)
    sword.matrix_world = type(mw)()
    for g in list(sword.vertex_groups):
        sword.vertex_groups.remove(g)
    sword.vertex_groups.new(name="B_Weapon").add([v.index for v in sword.data.vertices], 1.0, "REPLACE")
    for m in list(sword.modifiers):
        sword.modifiers.remove(m)
    sword.modifiers.new("Armature", "ARMATURE").object = rig
    sword.parent = rig
    parts.append(sword)
print("PARTS", [(p.name, len(p.data.polygons), [m.name for m in p.data.materials]) for p in parts])
for p in parts:
    for m in p.data.materials:
        if m and m.name in renames:
            m.name = renames[m.name]

for o in bpy.context.view_layer.objects:
    o.select_set(False)
for p in parts:
    p.hide_set(False)
    p.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join()
body = bpy.context.view_layer.objects.active
body.name = "GinazUnit"
body.data.name = "GinazUnitMesh"

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
print("LIMITED", fixed, "verts;", len(body.data.vertices), "verts", len(body.data.polygons), "faces")
print("MATERIALS", [m.name for m in body.data.materials])
print("UNWEIGHTED", sum(1 for v in body.data.vertices if not v.groups))
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
