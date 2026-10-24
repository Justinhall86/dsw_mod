"""Step 13 - build a VIEWABLE .blend of the finished Duncan (scarf + cape removed).

  blender -b --python 08_scripts/13_make_preview_blend.py

Creates
  03_blender/duncan_modified_preview.blend

The .blend is the FINISHED PRODUCT as the game will show it:
  * the shipped model - res/data.cdb -> model N_DuncanModified ->
    CharMOD/Male01_DuncanModified/Prefab_DuncanModified.prefab ->
    CharMOD/Male01_DuncanModified/Male01_DuncanModified.hmd
    (4550 verts / 7133 tris, 53-bone Male01+whip skeleton, 36 skin clusters)
  * the SHIPPED albedo / metallic-gloss-AO / normal / emissive maps, wired to
    the material exactly the way step 09 rewired them
  * the two Atreide swords from Prefab_DuncanModified.prefab, parented to
    B_Weapon (right hand) and B_lWristJ (left hand) with the prefab's own
    offsets/rotations
  * the vanilla Duncan FightIdle animation, so the unit can be seen moving
  * a camera, a sun, a fill light and a world, so it renders the moment it opens

Source of truth is the HMD that actually ships, not the intermediate FBX:
the HMD is what the game loads, so the preview cannot drift from it.
"""
import math
import os
import subprocess
import sys

import bpy
from mathutils import Matrix, Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\duncan_modified"
BLEND_DIR = os.path.join(PROJ, "03_blender")
TEX_DIR = os.path.join(PROJ, "04_textures")
PHOTOS = os.path.join(PROJ, "02_progress_photos", "03_final")
WORK = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\duncan_preview"

HMD = os.path.join(PROJ, "06_game_ready", "Male01_DuncanModified", "Male01_DuncanModified.hmd")
SWORD_HMD = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_Sword_01.fbx"
ANIM_HMD = r"C:\dsw_mod\extr\Anim\Male01\Duncan\Anim_Male01_Duncan_FightIdle.fbx"
# the game's textures are DDS files with a .png extension - Blender cannot read
# them, so 04_textures/ holds real PNG conversions of the shipped maps
SWORD_TEX = TEX_DIR

TOOLKIT = r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit"
BODY_FBX = os.path.join(WORK, "preview_body.fbx")
SWORD_FBX = os.path.join(WORK, "preview_sword.fbx")
ANIM_FBX = os.path.join(WORK, "preview_body_anim.fbx")

OUT_BLEND = os.path.join(BLEND_DIR, "duncan_modified_preview.blend")

os.makedirs(WORK, exist_ok=True)
os.makedirs(PHOTOS, exist_ok=True)
os.makedirs(BLEND_DIR, exist_ok=True)


# --------------------------------------------------------------------- tools
def run(cmd, cwd):
    print("RUN:", " ".join(cmd))
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.stdout:
        print(r.stdout.strip())
    if r.returncode != 0:
        print(r.stderr.strip())
        raise SystemExit("failed: %s" % cmd)
    return r.stdout


def ensure_fbx(hmd, out_fbx, anim_hmd=None):
    """HMD -> FBX with the toolkit (mesh+rig, optionally with an animation)."""
    if anim_hmd:
        run([sys.executable, "hmdanim2fbx.py", hmd, anim_hmd, out_fbx],
            os.path.join(TOOLKIT, "Animations"))
    else:
        run([sys.executable, "hmd2fbx.py", hmd, out_fbx],
            os.path.join(TOOLKIT, "Models"))
    return out_fbx


# ------------------------------------------------------------------- helpers
def wipe_scene():
    bpy.ops.wm.read_factory_settings(use_empty=True)
    for name in ("Cube", "Camera", "Light"):
        ob = bpy.data.objects.get(name)
        if ob:
            bpy.data.objects.remove(ob, do_unlink=True)


def only_mesh(objs, min_verts=100):
    return [o for o in objs if o.type == "MESH" and len(o.data.vertices) >= min_verts]


def load_image(path):
    """Load a texture and PACK it, so the .blend is self-contained."""
    img = bpy.data.images.get(os.path.basename(path))
    if img is None:
        img = bpy.data.images.load(path, check_existing=False)
    else:
        img.filepath = path
        img.reload()
    img.name = os.path.basename(path)
    try:
        img.pack()
    except Exception as e:
        print("   pack failed for", img.name, e)
    return img


def wire_material(mesh_obj, mat_name, maps):
    """Rebuild the material the way the game reads it:
       albedo -> Base Color, MGAO -> Specular IOR Level, normal -> Normal Map,
       emissive -> Emission Color."""
    mat = bpy.data.materials.get(mat_name) or bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(path, label, loc):
        nd = nt.nodes.new("ShaderNodeTexImage")
        nd.image = load_image(path)
        nd.label = label
        nd.location = loc
        return nd

    alb = tex(maps["albedo"], "Albedo", (-700, 300))
    mga = tex(maps["mgao"], "MetallicGlossAO", (-700, 0))
    nrm = tex(maps["normal"], "Normal", (-700, -300))
    emi = tex(maps["emissive"], "Emissive", (-700, -600))

    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    out.location = (200, 0)
    nmap = nt.nodes.new("ShaderNodeNormalMap")
    nmap.location = (-400, -300)
    nmap.inputs["Strength"].default_value = 1.0

    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    if "Emission Color" in bsdf.inputs:
        nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission Color"])
        bsdf.inputs["Emission Strength"].default_value = 1.0
    elif "Emission" in bsdf.inputs:
        nt.links.new(emi.outputs["Color"], bsdf.inputs["Emission"])
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

    # data maps are colour data, not colour - keep them out of sRGB
    mga.image.colorspace_settings.name = "Non-Color"
    nrm.image.colorspace_settings.name = "Non-Color"
    emi.image.colorspace_settings.name = "Non-Color"

    mesh_obj.data.materials.clear()
    mesh_obj.data.materials.append(mat)
    return mat


def attach_to_bone(obj, rig, bone_name):
    """Parent obj to a bone so it follows the hand.

    Blender's bone parenting evaluates
        world = bone_matrix @ T(0, bone_length, 0) @ mpi @ basis
    and the DEFAULT mpi (= identity) puts the child on the bone TAIL, in the
    bone's own axes (measured empirically: a bone along world +Z with head at
    (1,2,3) and tail at (1,2,4) puts an identity-basis child at (1,2,4)).

    To put the child on the bone HEAD instead, mpi has to cancel the tail
    offset. The tail sits at bone_matrix @ (0, length, 0) in bone space, so
        mpi = inv(bone_matrix @ Translation(0, length, 0))
    puts an identity-basis child exactly on the head.
    """
    pb = rig.pose.bones[bone_name]
    obj.parent = rig
    obj.parent_type = "BONE"
    obj.parent_bone = bone_name
    bone_matrix = rig.matrix_world @ pb.matrix
    obj.matrix_parent_inverse = (
        bone_matrix @ Matrix.Translation((0.0, pb.bone.length, 0.0))).inverted()
    obj.matrix_basis = Matrix.Identity(4)


def place_in_bone(obj, rig, bone_name, offset, rot_deg, anchor_y=0.0):
    """Attach obj to a bone and apply the prefab's own offset/rotation.

    The preview runs in Blender's RIGHT-handed space. The prefab's
    x/y/z and rotationX/Y/Z are the game's model-node transform, but the
    FBX we import already has the model node's rotation baked into the
    vertices (the HMD model node has qx=0.707, a 90° X rotation that maps
    the weapon's local +Y to +Z). The prefab transform is applied in the
    bone's space on top of that.

    For the Atreide sword: the FBX has the blade along local +Z (because the
    model node's qx=0.707 rotated the sword's +Y to +Z). The prefab says
    rotX = -90, which in RIGHT-handed space rotates +Z to +Y (forward along
    the arm). No D-conjugation needed - the preview is in Blender's space.

    The sword's local frame in the FBX: blade along +Z, hilt at +Z, tip at -Z.
    The grip is at local z ≈ -0.019 (center of the narrow shaft).
    anchor_y slides the sword along its local +Y, but the sword's blade is
    along +Z, so we actually need to slide along +Z. However, the prefab
    rotation maps the sword's +Z to the bone's +Y, so anchor_y along the
    sword's +Y becomes an offset along the bone's +Y after rotation.

    For the Atreide sword, anchor_y = 0.019 puts the grip on the hand bone.
    """
    attach_to_bone(obj, rig, bone_name)
    pb = rig.pose.bones[bone_name]

    # Prefab transform in Blender's RIGHT-handed space (no D-conjugation)
    rot = (Matrix.Rotation(math.radians(rot_deg[0]), 4, "X")
           @ Matrix.Rotation(math.radians(rot_deg[1]), 4, "Y")
           @ Matrix.Rotation(math.radians(rot_deg[2]), 4, "Z"))
    prefab = Matrix.Translation(offset) @ rot

    # slide the sword along its own local +Y so the chosen anchor lands on
    # the bone head
    obj.matrix_basis = Matrix.Translation(Vector((0.0, anchor_y, 0.0))) @ prefab
    bpy.context.view_layer.update()
    return obj


def add_camera(name, loc, target, ortho_scale=None, lens=85.0):
    cam_data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, cam_data)
    bpy.context.collection.objects.link(cam)
    cam.location = loc
    d = Vector(target) - Vector(loc)
    cam.rotation_euler = d.to_track_quat("-Z", "Y").to_euler()
    if ortho_scale:
        cam_data.type = "ORTHO"
        cam_data.ortho_scale = ortho_scale
    else:
        cam_data.lens = lens
    return cam


# =========================================================== 1. build the FBXs
print("=" * 70)
print("1. HMD -> FBX (shipped model + animation, and the prefab sword)")
print("=" * 70)
ensure_fbx(HMD, BODY_FBX, anim_hmd=ANIM_HMD)
ensure_fbx(SWORD_HMD, SWORD_FBX)

# ============================================================ 2. build the scene
print("=" * 70)
print("2. building the scene")
print("=" * 70)
wipe_scene()

bpy.ops.import_scene.fbx(filepath=BODY_FBX)
body = only_mesh(bpy.context.scene.objects)[0]
rig = next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
body.name = "DuncanModified"
body.data.name = "DuncanModifiedMesh"
rig.name = "Male01_Duncan"
rig.show_in_front = True
print("   body:", body.name, len(body.data.vertices), "verts,",
      len(body.data.polygons), "faces,", len(body.vertex_groups), "groups")
print("   rig :", rig.name, len(rig.data.bones), "bones")

# ------------------------------------------------- 3. wire the shipped maps
body_maps = {
    "albedo": os.path.join(TEX_DIR, "Male01_DuncanModified_Albedo.png"),
    "mgao": os.path.join(TEX_DIR, "Male01_DuncanModified_MetallicGlossAO.png"),
    "normal": os.path.join(TEX_DIR, "Male01_DuncanModified_Normal.png"),
    "emissive": os.path.join(TEX_DIR, "Duncan_Emissive.png"),
}
for k, p in body_maps.items():
    if not os.path.exists(p):
        raise SystemExit("missing texture: %s" % p)
wire_material(body, "Mat_Duncan", body_maps)
print("   material Mat_Duncan wired to the 4 shipped maps")

# ------------------------------------------------ 4. the prefab's two swords
# Prefab_DuncanModified.prefab:
#   Atreide_Sword_01  y -0.16362  z 0.05084  rotX -90   -> B_Weapon
#   Atreide_Sword_02  x -0.16553  y -0.03469  z 0.26002
#                      rotY -179.5  rotZ -84.8            -> B_lWristJ
sword_maps = {
    "albedo": os.path.join(SWORD_TEX, "AtreideSoldier01_Albedo.png"),
    "mgao": os.path.join(SWORD_TEX, "AtreideSoldier01_MetallicGlossAO.png"),
    "normal": os.path.join(SWORD_TEX, "AtreideSoldier01_Normal.png"),
    "emissive": os.path.join(SWORD_TEX, "AtreideSoldier01_Emissive.png"),
}

swords = []
for idx, (bone, offset, rot, anchor_y) in enumerate((
        ("B_Weapon", (-0.0, -0.16362, 0.05084), (-90.0, 0.0, 0.0), 0.019),
        ("B_lWristJ", (-0.16553, -0.03469, 0.26002), (0.0, -179.5, -84.8), 0.019),
), start=1):
    bpy.ops.import_scene.fbx(filepath=SWORD_FBX)
    sw = only_mesh(bpy.context.scene.objects, min_verts=50)
    sw = [o for o in sw if o.name.startswith("Sword")][0]
    sw.name = "Atreide_Sword_%02d" % idx
    sw.data.name = "Atreide_Sword_%02dMesh" % idx
    wire_material(sw, "Mat_AtreideSoldier", sword_maps)
    place_in_bone(sw, rig, bone, offset, rot, anchor_y)
    swords.append(sw)

    # diagnostic: the sword's grip is the narrow shaft behind the guard
    # (local y between -0.094 and +0.006, center ~ -0.044)
    grip = None
    for v in sw.data.vertices:
        if -0.094 < v.co.y < 0.006:
            grip = sw.matrix_world @ v.co
            break
    pb = rig.pose.bones[bone]
    hand = rig.matrix_world @ pb.head
    print("   %s -> %-10s offset %s rot %s anchor %s" % (sw.name, bone, offset, rot, anchor_y))
    if grip is not None:
        print("      grip %s  hand %s  distance %.3f" % (
            tuple(round(v, 3) for v in grip),
            tuple(round(v, 3) for v in hand),
            (grip - hand).length))

# ------------------------------------------------------ 5. world / lights
world = bpy.data.worlds.new("World")
bpy.context.scene.world = world
world.use_nodes = True
bg = world.node_tree.nodes["Background"]
bg.inputs[0].default_value = (0.55, 0.58, 0.64, 1.0)
bg.inputs[1].default_value = 1.6

sun_data = bpy.data.lights.new("Sun", type="SUN")
sun_data.energy = 3.5
sun_data.angle = math.radians(4)
sun = bpy.data.objects.new("Sun", sun_data)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(52), 0.0, math.radians(35))

fill_data = bpy.data.lights.new("Fill", type="AREA")
fill_data.energy = 160
fill_data.size = 3.0
fill = bpy.data.objects.new("Fill", fill_data)
bpy.context.collection.objects.link(fill)
fill.location = (-1.8, -2.4, 1.8)
fill.rotation_euler = (math.radians(68), 0.0, math.radians(-40))

rim_data = bpy.data.lights.new("Rim", type="AREA")
rim_data.energy = 120
rim_data.size = 2.0
rim = bpy.data.objects.new("Rim", rim_data)
bpy.context.collection.objects.link(rim)
rim.location = (1.6, 2.6, 2.2)
rim.rotation_euler = (math.radians(115), 0.0, math.radians(200))

# ------------------------------------------------------------ 6. cameras
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()
bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
centre = (lo + hi) / 2
height = hi.z - lo.z
print("   body bbox: %s .. %s  (height %.3f)" % (tuple(round(v, 3) for v in lo),
                                                 tuple(round(v, 3) for v in hi), height))

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

# --------------------------------------------------------- 7. render setup
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

# open the file in a readable state: material preview, framed on the unit
for screen in bpy.data.screens:
    for area in screen.areas:
        if area.type == "VIEW_3D":
            space = area.spaces.active
            space.shading.type = "MATERIAL"
            space.overlay.show_overlays = True
            space.region_3d.view_distance = height * 2.0
            space.region_3d.view_location = centre
            space.region_3d.view_rotation = cam_34.rotation_euler.to_quaternion()

# ------------------------------------------------------- 8. sanity + save
print("=" * 70)
print("3. verification renders")
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
