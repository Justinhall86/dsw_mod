"""Karlin (B, round 14 C1) -> ONE skinned mesh + FBX for the HMD toolkit, and the per-material game textures.

  blender -b --factory-startup --python 50_assemble_export.py -- [--src B_foundry_warlord_hero_C1_two_swords]

 - both katanas baked into the mesh at their rest placement, the way vanilla units carry weapons: sword 1 skinned 100 %
   to B_Weapon (with round 14's -6 deg tilt already in its placement), sword 2 100 % to B_Weapon_L. B_Weapon_L is the
   bone 22_mount_two_swords.py added under B_lWristJ (rest = the DualSwords_Run clip's frame-0 transform); the toolkit's
   fbxfix keeps bones that are not in the Male01 reference ("left untouched"), and the DualSwords clips carry a
   B_Weapon_L track, so the game drives it exactly like Free Company's
 - materials that use the same textures are merged (Gurney x3, Trim x3, Duncan x2, katana x2), then renamed Mat_<Short>
 - every material's albedo / MetallicGlossAO / normal is written to 06_game_ready/src/<Short>_*.png; the katana has
   only an albedo in Blender, so its MetallicGlossAO is generated from weapon.json (metal 0.45, roughness 0.35) and its
   normal is flat
 - <= 3 influences per vertex, normalised; FBX settings as the Thorvald Elite export
Writes 06_game_ready/Male01_ThorvaldKarlin.fbx and 06_game_ready/src/materials.json (Blender material -> 3 files).
"""
import argparse
import hashlib
import json
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
ap = argparse.ArgumentParser()
ap.add_argument("--src", default="B_foundry_warlord_hero_C1_two_swords")
a = ap.parse_args(sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else [])
OUT = os.path.join(PROJ, "06_game_ready", "Male01_ThorvaldKarlin.fbx")
SRC_DIR = os.path.join(PROJ, "06_game_ready", "src")
os.makedirs(SRC_DIR, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "weapons", a.src + ".blend"))
rig = bpy.data.objects["Rig"]
rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis.identity()
rig.data.pose_position = "POSE"
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

# --- weapons baked into the mesh --------------------------------------------------------------------------------
for name, bone in (("Thorvald_Katana", "B_Weapon"), ("Thorvald_Katana_2", "B_Weapon_L")):
    w = bpy.data.objects[name]
    mw = w.matrix_world.copy()
    w.parent = None
    w.data = w.data.copy()
    w.data.transform(mw)
    w.matrix_world = type(mw)()
    w.vertex_groups.clear()
    w.vertex_groups.new(name=bone).add([v.index for v in w.data.vertices], 1.0, "REPLACE")
    for m in list(w.modifiers):
        w.modifiers.remove(m)
    w.modifiers.new("Armature", "ARMATURE").object = rig
    w.parent = rig
    print("BAKED %s -> %s (%d verts)" % (name, bone, len(w.data.vertices)))
rig.data.bones["B_Weapon_L"].use_deform = True


# --- materials: dedupe by texture content, rename --------------------------------------------------------------
def img_key(img):
    if img is None:
        return None
    data = img.packed_file.data if img.packed_file else open(bpy.path.abspath(img.filepath), "rb").read()
    return hashlib.md5(data).hexdigest()


def base_node(mat):
    bsdf = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    stack = [l.from_node for l in bsdf.inputs["Base Color"].links]
    while stack:
        n = stack.pop()
        if n.type == "TEX_IMAGE":
            return n
        stack += [l.from_node for i in n.inputs for l in i.links]
    return None


def find(mat, word):
    return next((n.image for n in mat.node_tree.nodes if n.type == "TEX_IMAGE" and n.image
                 and word in n.image.name.lower()), None)


meshes = [o for o in bpy.data.objects if o.type == "MESH"]
SHORT = {"Mat_Donor": "Body", "Mat_DuncanSash": "Apron", "Mat_Gurney": "Gurney", "Mat_Thorvald_Trim": "Trim",
         "Mat_Duncan": "Duncan", "Mat_Feydakin": "Face", "Mat_Mercenary": "Mercenary", "Mat_Base": "Base",
         "Mat_Katana": "Katana"}
canon, files = {}, {}
for o in meshes:
    for slot in o.material_slots:
        m = slot.material
        alb = base_node(m).image
        key = (img_key(alb), img_key(find(m, "metallicgloss")), img_key(find(m, "normal")))
        if key not in canon:
            stem = m.name.split(".")[0]
            short = SHORT.get(stem, stem.replace("Mat_", ""))
            while "Mat_" + short in [c.name for c in canon.values()]:
                short += "B"
            other = bpy.data.materials.get("Mat_" + short)
            if other is not None and other is not m:
                other.name = "_dup_" + other.name      # a duplicate still holding the clean name
            m.name = "Mat_" + short
            canon[key] = m
            paths = []
            for kind, img in (("Albedo", alb), ("MetallicGlossAO", find(m, "metallicgloss")), ("Normal", find(m, "normal"))):
                p = os.path.join(SRC_DIR, "%s_%s.png" % (short, kind))
                if img is None:
                    p = None
                elif img.packed_file:
                    open(p, "wb").write(img.packed_file.data)
                else:
                    img.save(filepath=p)
                paths.append(p)
            files[m.name] = paths
        slot.material = canon[key]
print("MATERIALS", {k: [os.path.basename(p) if p else None for p in v] for k, v in files.items()})

# katana: generated MetallicGlossAO (R metal, G gloss, B AO) and a flat normal, 64 px like the vanilla weapon maps
km = next(n for n in files if "Katana" in n)
for kind, rgba in (("MetallicGlossAO", (0.45, 0.65, 1.0, 1.0)), ("Normal", (0.5, 0.5, 1.0, 1.0))):
    if files[km][1 if kind == "MetallicGlossAO" else 2] is None:
        img = bpy.data.images.new("Katana_" + kind, 64, 64, alpha=True)
        img.pixels = list(rgba) * (64 * 64)
        p = os.path.join(SRC_DIR, "Katana_%s.png" % kind)
        img.filepath_raw = p
        img.file_format = "PNG"
        img.save()
        files[km][1 if kind == "MetallicGlossAO" else 2] = p
        # wire it like the body materials (MGA -> Specular IOR Level, normal -> Normal Map -> Normal), so the FBX carries
        # it and the converter gives the HMD material a specular and normal texture (the first export had none)
        mat = bpy.data.materials[km]
        nt = mat.node_tree
        bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
        tex = nt.nodes.new("ShaderNodeTexImage")
        tex.image = img
        img.pack()
        if kind == "MetallicGlossAO":
            nt.links.new(tex.outputs["Color"], bsdf.inputs["Specular IOR Level"])
        else:
            nm = nt.nodes.new("ShaderNodeNormalMap")
            nt.links.new(tex.outputs["Color"], nm.inputs["Color"])
            nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
json.dump(files, open(os.path.join(SRC_DIR, "materials.json"), "w"), indent=1)

# --- join, weights ---------------------------------------------------------------------------------------------
for o in bpy.context.view_layer.objects:
    o.select_set(False)
for o in meshes:
    o.hide_set(False)
    o.hide_render = False
    o.select_set(True)
body = bpy.data.objects["Iakin_H_Hero_2_00"]
bpy.context.view_layer.objects.active = body
bpy.ops.object.join()
body.name = body.data.name = "ThorvaldKarlin"
fixed = 0
for v in body.data.vertices:
    gs = sorted(v.groups, key=lambda g: -g.weight)
    for g in gs[3:]:
        body.vertex_groups[g.group].remove([v.index])
    fixed += len(gs) > 3
    gs = list(v.groups)
    tot = sum(g.weight for g in gs)
    if tot > 0 and abs(tot - 1.0) > 1e-4:
        for g in gs:
            body.vertex_groups[g.group].add([v.index], g.weight / tot, "REPLACE")
# drop material slots no face uses (Mat_Base, Kit_leg_0's second slot): the toolkit skips an unused material but keeps
# the faces' indices, so every later material slid down one slot in the HMD (face got Gurney's texture, shins the
# apron's) - caught by the 52_roundtrip_render.py face count per material
used = {p.material_index for p in body.data.polygons}
for i in reversed(range(len(body.material_slots))):
    if i not in used:
        print("UNUSED material slot removed:", body.material_slots[i].material.name)
        files.pop(body.material_slots[i].material.name, None)
        body.active_material_index = i
        bpy.ops.object.material_slot_remove()
json.dump(files, open(os.path.join(SRC_DIR, "materials.json"), "w"), indent=1)
unw = sum(1 for v in body.data.vertices if not v.groups)
print("JOINED %d verts %d faces, %d limited to 3 influences, %d unweighted, materials %s" % (
    len(body.data.vertices), len(body.data.polygons), fixed, unw, [m.name for m in body.data.materials]))
if unw:
    raise SystemExit("unweighted vertices - fix before export")
for c in list(body.data.color_attributes):
    body.data.color_attributes.remove(c)
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
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", add_leaf_bones=False,
    bake_anim=False, path_mode="COPY", embed_textures=True, apply_scale_options="FBX_SCALE_UNITS",
    primary_bone_axis="Y", secondary_bone_axis="X", mesh_smooth_type="OFF")
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "06_game_ready", "Male01_ThorvaldKarlin_export.blend"))
print("EXPORTED", OUT, os.path.getsize(OUT), "bytes")
