"""Final .blend -> ONE skinned mesh FBX for the HMD toolkit, plus every material's packed textures dumped to disk.
Works for any of the Thorvald infantry finals (Trooper v13, Ranged v2, Demolition v2).

    blender -b <final.blend> --python 90_export_game_fbx.py -- <out Male01_X.fbx> <texture dump dir>

 - every weapon parented to a BONE (katana on B_Weapon, sniper / bazooka on B_Gun) is baked at its rest placement and
   skinned 100 % to that bone (vanilla-style baked weapon: it follows the clips' bone track)
 - every mesh object is joined; materials keep their slots
 - <= 3 influences per vertex, weights normalised, colour attributes removed
 - textures: <dump>/<material>__{Albedo,MetallicGlossAO,Normal}.png (packed images saved as PNG; a missing map is
   simply not written, 91_package_game.py fills it with a flat one)
"""
import os
import sys

import bpy

args = sys.argv[sys.argv.index("--") + 1:]
out, dump = os.path.abspath(args[0]), os.path.abspath(args[1])
os.makedirs(dump, exist_ok=True)

rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

parts = []
for o in [o for o in bpy.data.objects if o.type == "MESH"]:
    if o.parent == rig and o.parent_type == "BONE":
        bone = o.parent_bone
        mw = o.matrix_world.copy()
        o.parent = None
        o.matrix_world = mw
        o.data.transform(o.matrix_world)
        o.matrix_world = type(mw)()
        for g in list(o.vertex_groups):
            o.vertex_groups.remove(g)
        o.vertex_groups.new(name=bone).add([v.index for v in o.data.vertices], 1.0, "REPLACE")
        for m in list(o.modifiers):
            o.modifiers.remove(m)
        o.modifiers.new("Armature", "ARMATURE").object = rig
        o.parent = rig
        print("BAKED WEAPON", o.name, "->", bone, len(o.data.polygons), "faces")
    parts.append(o)
print("PARTS", [(p.name, len(p.data.polygons)) for p in parts])

# texture dump (before the join, materials are the same datablocks either way)
SOCK = {"Base Color": "Albedo", "Specular IOR Level": "MetallicGlossAO"}
mats = {m.name: m for p in parts for m in p.data.materials if m}
for name, m in mats.items():
    for n in m.node_tree.nodes:
        if n.type != "TEX_IMAGE" or not n.image:
            continue
        for l in m.node_tree.links:
            if l.from_node != n:
                continue
            suf = SOCK.get(l.to_socket.name)
            if l.to_socket.name == "Color" and l.to_node.type == "NORMAL_MAP":
                suf = "Normal"
            if not suf:
                continue
            img = n.image
            if not img.has_data and not img.packed_file:
                print("  (no data)", name, suf, img.filepath)
                continue
            p = os.path.join(dump, "%s__%s.png" % (name, suf))
            img.save(filepath=p)          # raw pixels (save_render would colour-manage the normal / MG maps)
            print("  tex", name, suf, tuple(img.size), "->", os.path.basename(p))

# a material without an MG or normal map (the library weapons are albedo-only) gets a flat one, saved to the dump
# and wired in, so the converter gives the HMD material all three texture slots
FLAT = {"MetallicGlossAO": (0.0, 110 / 255, 1.0, 1.0), "Normal": (0.5, 0.5, 1.0, 1.0)}
for name, m in mats.items():
    bsdf = next(n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    for suf, col in FLAT.items():
        p = os.path.join(dump, "%s__%s.png" % (name, suf))
        if os.path.exists(p):
            continue
        img = bpy.data.images.new("%s_%s_flat" % (name, suf), 64, 64, alpha=True)
        img.pixels = list(col) * (64 * 64)
        img.filepath_raw = p
        img.file_format = "PNG"
        img.save()
        img.colorspace_settings.name = "Non-Color"
        tex = m.node_tree.nodes.new("ShaderNodeTexImage")
        tex.image = img
        if suf == "Normal":
            nm = m.node_tree.nodes.new("ShaderNodeNormalMap")
            m.node_tree.links.new(tex.outputs["Color"], nm.inputs["Color"])
            m.node_tree.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
        else:
            m.node_tree.links.new(tex.outputs["Color"], bsdf.inputs["Specular IOR Level"])
        print("  tex", name, suf, "flat placeholder ->", os.path.basename(p))

for o in bpy.context.view_layer.objects:
    o.select_set(False)
for p in parts:
    p.hide_set(False)
    p.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join()
body = bpy.context.view_layer.objects.active
stem = os.path.splitext(os.path.basename(out))[0]
body.name = stem
body.data.name = stem + "Mesh"

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
print("LIMITED", fixed, "verts;", len(body.data.vertices), "verts", len(body.data.polygons), "faces",
      sum(len(p.vertices) - 2 for p in body.data.polygons), "tris")
print("MATERIALS", [m.name for m in body.data.materials])
print("UNWEIGHTED", sum(1 for v in body.data.vertices if not v.groups))
for a in list(body.data.color_attributes):
    body.data.color_attributes.remove(a)
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
