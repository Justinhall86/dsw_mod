#!/usr/bin/env python3
"""
DSW Preview Blend Builder — reusable template.

Copy this to your project's 08_scripts/ as 13_make_preview_blend.py
and adapt the PATHS section at the top.

Usage:
    blender -b --python 13_make_preview_blend.py
"""
import math
import os
import subprocess
import sys

import bpy
from mathutils import Matrix, Vector

# ============================================================ PATHS — EDIT THESE
PROJ = r"C:\path\to\model_projects\YourCharacter"
BLEND_DIR = os.path.join(PROJ, "03_blender")
TEX_DIR = os.path.join(PROJ, "04_textures")
PHOTOS = os.path.join(PROJ, "02_progress_photos", "03_final")
WORK = r"C:\path\to\model_work\preview"

HMD = os.path.join(PROJ, "06_game_ready", "CharName", "CharName.hmd")
SWORD_HMD = r"C:\dsw_mod\extr\Character\Faction\Unit\Weapons\Weapon.fbx"
ANIM_HMD = r"C:\dsw_mod\extr\Anim\Male01\Variant\Anim_Male01_Anim.fbx"
SWORD_TEX = TEX_DIR

TOOLKIT = r"C:\path\to\HMD_toolkit\HMD_toolkit"
BODY_FBX = os.path.join(WORK, "preview_body.fbx")
SWORD_FBX = os.path.join(WORK, "preview_sword.fbx")
ANIM_FBX = os.path.join(WORK, "preview_body_anim.fbx")
OUT_BLEND = os.path.join(BLEND_DIR, "character_preview.blend")

os.makedirs(WORK, exist_ok=True)
os.makedirs(PHOTOS, exist_ok=True)
os.makedirs(BLEND_DIR, exist_ok=True)
# ============================================================

def run(cmd, cwd):
    print("RUN:", " ".join(cmd))
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.stdout: print(r.stdout.strip())
    if r.returncode != 0:
        print(r.stderr.strip())
        raise SystemExit("failed: %s" % cmd)

def ensure_fbx(hmd, out_fbx, anim_hmd=None):
    if anim_hmd:
        run([sys.executable, "hmdanim2fbx.py", hmd, anim_hmd, out_fbx],
            os.path.join(TOOLKIT, "Animations"))
    else:
        run([sys.executable, "hmd2fbx.py", hmd, out_fbx],
            os.path.join(TOOLKIT, "Models"))

def wipe_scene():
    bpy.ops.wm.read_factory_settings(use_empty=True)
    for name in ("Cube", "Camera", "Light"):
        ob = bpy.data.objects.get(name)
        if ob: bpy.data.objects.remove(ob, do_unlink=True)

def only_mesh(objs, min_verts=100):
    return [o for o in objs if o.type == "MESH" and len(o.data.vertices) >= min_verts]

def load_image(path):
    img = bpy.data.images.get(os.path.basename(path))
    if img is None:
        img = bpy.data.images.load(path, check_existing=False)
    else:
        img.filepath = path; img.reload()
    img.name = os.path.basename(path)
    try: img.pack()
    except Exception as e: print("   pack failed:", e)
    return img

def wire_material(mesh_obj, mat_name, maps):
    mat = bpy.data.materials.get(mat_name) or bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes): nt.nodes.remove(n)
    def tex(path, label, loc):
        nd = nt.nodes.new("ShaderNodeTexImage")
        nd.image = load_image(path)
        nd.label = label; nd.location = loc
        return nd
    alb = tex(maps["albedo"], "Albedo", (-700, 300))
    mga = tex(maps["mgao"], "MetallicGlossAO", (-700, 0))
    nrm = tex(maps["normal"], "Normal", (-700, -300))
    emi = tex(maps["emissive"], "Emissive", (-700, -600))
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled"); bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial"); out.location = (200, 0)
    nmap = nt.nodes.new("ShaderNodeNormalMap"); nmap.location = (-400, -300)
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
    bsdf.inputs["Emission Strength"].default_value = 1.0
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    mga.image.colorspace_settings.name = "Non-Color"
    nrm.image.colorspace_settings.name = "Non-Color"
    emi.image.colorspace_settings.name = "Non-Color"
    mesh_obj.data.materials.clear()
    mesh_obj.data.materials.append(mat)

def place_in_bone(obj, rig, bone_name, offset, rot_deg, anchor_y=0.0):
    """Parent obj to a bone HEAD and apply the prefab transform in the bone's frame.

    Blender evaluates world = rig @ pose_bone @ T(0, length, 0) @ parent_inverse @ basis,
    so a bone-parented child sits on the bone TAIL; parent_inverse = T(0, -length, 0)
    moves it to the head while still following the pose bone every frame (inverting the
    whole bone matrix would freeze the object where it was attached).

    The imported weapon object already carries its HMD model-node transform, so the
    prefab's offset/rotation goes ON TOP of it: basis = prefab @ imported_basis.
    (Replacing the imported basis drops the weapon at the feet. No handedness
    conjugation needed. Verified on the Landsraad Guard halberd / rifle / bazooka.)"""
    pb = rig.pose.bones[bone_name]
    obj.parent = rig
    obj.parent_type = "BONE"
    obj.parent_bone = bone_name
    obj.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
    rot = (Matrix.Rotation(math.radians(rot_deg[0]), 4, "X")
           @ Matrix.Rotation(math.radians(rot_deg[1]), 4, "Y")
           @ Matrix.Rotation(math.radians(rot_deg[2]), 4, "Z"))
    obj.matrix_basis = (Matrix.Translation((0.0, anchor_y, 0.0)) @ Matrix.Translation(offset)
                        @ rot @ obj.matrix_basis)
    bpy.context.view_layer.update()


def add_camera(name, loc, target, ortho_scale=None, lens=85.0):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    bpy.context.collection.objects.link(cam)
    cam.location = loc
    d = Vector(target) - Vector(loc)
    cam.rotation_euler = d.to_track_quat("-Z", "Y").to_euler()
    if ortho_scale:
        cam_data.type = "ORTHO"; cam_data.ortho_scale = ortho_scale
    else:
        cam_data.lens = lens
    return cam

# ============================================================ MAIN
print("=" * 70)
print("1. HMD -> FBX (shipped model + animation, and prefab weapons)")
print("=" * 70)
ensure_fbx(HMD, BODY_FBX, anim_hmd=ANIM_HMD)
ensure_fbx(SWORD_HMD, SWORD_FBX)

print("=" * 70)
print("2. Building the scene")
print("=" * 70)
wipe_scene()

bpy.ops.import_scene.fbx(filepath=BODY_FBX)
body = only_mesh(bpy.context.scene.objects)[0]
rig = next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
body.name = "Character"
body.data.name = "CharacterMesh"
rig.name = "Rig"
rig.show_in_front = True
print("   body:", body.name, len(body.data.vertices), "verts,",
      len(body.data.polygons), "faces,", len(body.vertex_groups), "groups")
print("   rig :", rig.name, len(rig.data.bones), "bones")

# --- wire shipped textures ---
body_maps = {
    "albedo": os.path.join(TEX_DIR, "CharName_Albedo.png"),
    "mgao": os.path.join(TEX_DIR, "CharName_MetallicGlossAO.png"),
    "normal": os.path.join(TEX_DIR, "CharName_Normal.png"),
    "emissive": os.path.join(TEX_DIR, "CharName_Emissive.png"),
}
for k, p in body_maps.items():
    if not os.path.exists(p):
        raise SystemExit("missing texture: %s" % p)
wire_material(body, "Mat_Character", body_maps)
print("   material Mat_Character wired to 4 shipped maps")

# --- prefab weapons ---
sword_maps = {
    "albedo": os.path.join(SWORD_TEX, "Weapon_Albedo.png"),
    "mgao": os.path.join(SWORD_TEX, "Weapon_MetallicGlossAO.png"),
    "normal": os.path.join(SWORD_TEX, "Weapon_Normal.png"),
    "emissive": os.path.join(SWORD_TEX, "Weapon_Emissive.png"),
}

# EDIT THESE from your Prefab_Character.prefab:
#   "Weapon_01"  x 0.0  y -0.16362  z 0.05084  rotX -90  -> B_Weapon
#   "Weapon_02"  x -0.16553  y -0.03469  z 0.26002  rotY -179.5 rotZ -84.8  -> B_lWristJ
swords = []
for idx, (bone, offset, rot, anchor_y) in enumerate((
        ("B_Weapon", (-0.0, -0.16362, 0.05084), (-90.0, 0.0, 0.0), 0.019),
        ("B_lWristJ", (-0.16553, -0.03469, 0.26002), (0.0, -179.5, -84.8), 0.019),
), start=1):
    bpy.ops.import_scene.fbx(filepath=SWORD_FBX)
    sw = only_mesh(bpy.context.scene.objects, min_verts=50)[0]
    sw.name = "Weapon_%02d" % idx
    sw.data.name = "Weapon_%02dMesh" % idx
    wire_material(sw, "Mat_Weapon", sword_maps)
    place_in_bone(sw, rig, bone, offset, rot, anchor_y)
    swords.append(sw)
    print("   %s -> %s  offset %s rot %s anchor %s" % (sw.name, bone, offset, rot, anchor_y))

# --- world / lights ---
world = bpy.data.worlds.new("World")
bpy.context.scene.world = world
world.use_nodes = True
bg = world.node_tree.nodes["Background"]
bg.inputs[0].default_value = (0.55, 0.58, 0.64, 1.0)
bg.inputs[1].default_value = 1.6

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.5; sun_data.angle = math.radians(4)
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(52), 0.0, math.radians(35))

fill_data = bpy.data.lights.new("Fill", type="AREA")
fill_data.energy = 160; fill_data.size = 3.0
fill = bpy.data.objects.new("Fill", fill_data)
bpy.context.collection.objects.link(fill)
fill.location = (-1.8, -2.4, 1.8)
fill.rotation_euler = (math.radians(68), 0.0, math.radians(-40))

rim_data = bpy.data.lights.new("Rim", type="AREA")
rim_data.energy = 120; rim_data.size = 2.0
rim = bpy.data.objects.new("Rim", rim_data)
bpy.context.collection.objects.link(rim)
rim.location = (1.6, 2.6, 2.2)
rim.rotation_euler = (math.radians(115), 0.0, math.radians(200))

# --- cameras ---
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()
bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z
print("   body bbox: %s .. %s  (height %.3f)" % (tuple(round(v,3) for v in lo),
                                                 tuple(round(v,3) for v in hi), height))

cam_front = add_camera("Camera_Front", centre + Vector((0.0, -height * 2.4, 0.10)),
                        centre, ortho_scale=height * 1.15)
cam_34 = add_camera("Camera_ThreeQuarter",
                     centre + Vector((0.80, -1.15, 0.12)).normalized() * height * 2.4,
                     centre, ortho_scale=height * 1.15)
cam_side = add_camera("Camera_Side", centre + Vector((height * 2.4, 0.0, 0.10)),
                      centre, ortho_scale=height * 1.15)
cam_back = add_camera("Camera_Back", centre + Vector((0.0, height * 2.4, 0.10)),
                      centre, ortho_scale=height * 1.15)
bpy.context.scene.camera = cam_34

# --- render setup ---
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1200
sc.render.resolution_percentage = 100
sc.render.film_transparent = False
sc.view_settings.view_transform = "Standard"
sc.frame_start = 1
sc.frame_end = 40
sc.render.filepath = os.path.join(PHOTOS, "final_preview.png")

for screen in bpy.data.screens:
    for area in screen.areas:
        if area.type == "VIEW_3D":
            space = area.spaces.active
            space.shading.type = "MATERIAL"
            space.overlay.show_overlays = True
            space.region_3d.view_distance = height * 2.0
            space.region_3d.view_location = centre
            space.region_3d.view_rotation = cam_34.rotation_euler.to_quaternion()

# --- verification renders ---
print("=" * 70)
print("3. Verification renders")
print("=" * 70)
for cam, tag in ((cam_front, "front"), (cam_34, "threequarter"),
                 (cam_side, "side"), (cam_back, "back")):
    sc.camera = cam
    sc.render.filepath = os.path.join(PHOTOS, "final_%s.png" % tag)
    bpy.ops.render.render(write_still=True)
    print("   rendered", tag)

sc.camera = cam_34
sc.render.filepath = os.path.join(PHOTOS, "final_preview.png")

bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("=" * 70)
print("SAVED %s (%.2f MB)" % (OUT_BLEND, os.path.getsize(OUT_BLEND) / 1e6))
print("=" * 70)