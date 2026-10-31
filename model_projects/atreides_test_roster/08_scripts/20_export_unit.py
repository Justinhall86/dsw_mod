"""Bake a finished unit blend (body parts + mounted weapons) into ONE skinned mesh, export the FBX and dump each material's three maps.

    blender -b <unit.blend> --python 20_export_unit.py -- <out.fbx> <texdir> [--weapon Obj=Bone ...]

Each --weapon object is baked at its REST placement and skinned 100% to that bone (vanilla-style baked weapon). Everything else that is a mesh is a body part.
Textures: <texdir>/<Material>_{Albedo,MetallicGlossAO,Normal}.png (only the maps the material actually has; the driver fills defaults).
"""
import glob
import os
import sys

import bpy

args = sys.argv[sys.argv.index("--") + 1:]
out, texdir = os.path.abspath(args[0]), os.path.abspath(args[1])
os.makedirs(texdir, exist_ok=True)
weapons = dict(args[i + 1].split("=", 1) for i, x in enumerate(args) if x == "--weapon")
WEAPONS = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__)))), "weapons")

rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
parts = []
for o in meshes:
    o.hide_set(False)
    o.hide_viewport = False
    if o.name in weapons:
        mw = o.matrix_world.copy()
        o.parent = None
        o.matrix_world = mw
        o.data.transform(o.matrix_world)
        o.matrix_world = type(mw)()
        for g in list(o.vertex_groups):
            o.vertex_groups.remove(g)
        o.vertex_groups.new(name=weapons[o.name]).add([v.index for v in o.data.vertices], 1.0, "REPLACE")
        for m in list(o.modifiers):
            o.modifiers.remove(m)
        o.modifiers.new("Armature", "ARMATURE").object = rig
        o.parent = rig
    parts.append(o)
missing = set(weapons) - {o.name for o in meshes}
assert not missing, "weapon objects not found: %s" % missing
print("PARTS", [(p.name, len(p.data.polygons), [m.name for m in p.data.materials if m]) for p in parts])

for o in bpy.context.view_layer.objects:
    o.select_set(False)
for p in parts:
    p.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join()
body = bpy.context.view_layer.objects.active
body.name = "UnitMesh"
body.data.name = "UnitMeshData"

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
print("UNWEIGHTED", sum(1 for v in body.data.vertices if not v.groups))
for a in list(body.data.color_attributes):
    body.data.color_attributes.remove(a)


def img_of(sock):
    for lk in sock.links:
        n = lk.from_node
        if n.type == "TEX_IMAGE":
            return n.image
        if n.type == "NORMAL_MAP":
            return img_of(n.inputs["Color"])
    return None


# some weapon materials point at a map whose file is missing from the source tree (empty image, no
# data). The shared weapon library keeps a good copy, so load it from there instead of shipping a
# default flat normal.
def rescue(im):
    if im is None or im.has_data:
        return im
    base = os.path.basename(im.filepath.replace("\\", "/"))
    for cand in glob.glob(os.path.join(WEAPONS, "*", "textures", base)):
        try:
            im.filepath = cand
            im.reload()
        except RuntimeError:
            continue
        if im.has_data:
            print("RESCUED", im.name, "->", cand)
            return im
    return im


mats = []
for m in body.data.materials:
    if m is None or m.name in mats:
        continue
    mats.append(m.name)
    bsdf = next(n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    for suf, sk in (("Albedo", "Base Color"), ("MetallicGlossAO", "Specular IOR Level"), ("Normal", "Normal")):
        im = rescue(img_of(bsdf.inputs[sk]))
        if im is None:
            continue
        try:                                  # a source map can still have no loaded data - the driver
            c = im.copy()                     # fills a flat default instead of failing the export
            c.filepath_raw = os.path.join(texdir, "%s_%s.png" % (m.name, suf))
            c.file_format = "PNG"
            c.save()
        except RuntimeError as e:
            print("NODATA", m.name, suf, "-", e)
            continue
        print("TEX", m.name, suf, im.size[0], "x", im.size[1])
print("MATERIALS", mats)

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
