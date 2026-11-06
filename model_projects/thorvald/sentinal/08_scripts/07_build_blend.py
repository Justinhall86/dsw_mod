"""Step 07 - build a self-contained .blend of the finished model.

    blender -b --python 07_build_blend.py -- \
        --body <body.fbx> \
        --textures <dir with Name_Albedo.png, Name_MetallicGlossAO.png, Name_Normal.png> \
        --out <out.blend> \
        [--weapon <weapon.fbx>] [--weapon-bone B_Gun] [--weapon-rot 90,0,0] \
        [--grip-bone B_rWristJ] [--title "Commando"]

The .blend contains:
  * the body, still skinned to its rig
  * the albedo / MetallicGlossAO / Normal wired to Base Color /
    Specular IOR Level / Normal Map
  * a weapon, held in the hand and PARENTED to a bone so it follows the hand
  * a camera, a sun, a fill light and a world, so F12 renders immediately
  * every texture PACKED into the file, so it is portable

WEAPON PLACEMENT - the two traps:
  1. `B_Gun` sits at the armature ORIGIN in the rest pose, so its rest
     transform is NOT a usable placement hint.  The grip is derived from the
     MESH instead: the centroid of the vertices whose strongest weight is the
     wrist bone.
  2. The character faces -Y and a weapon's long axis is its local +Z, so
     rotationX = +90 points the barrel forward.  The game's own prefab uses
     -90, which points it BACKWARDS.

  Parenting must use the OPERATOR (`parent_set(type='BONE')`), never
  `matrix_parent_inverse`: Blender's bone parenting uses the bone's TAIL as
  the origin, and hand-setting the inverse matrix puts the weapon ~0.67 m
  too high.
"""
import math
import os
import re
import sys

import bpy
from mathutils import Matrix, Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import cfg, script_args

argv = script_args()


def opt(flag, default=None):
    return argv[argv.index(flag) + 1] if flag in argv else default


body_path = opt("--body")
tex_dir = opt("--textures")
out_path = opt("--out")
weapon_path = opt("--weapon")
weapon_bone = opt("--weapon-bone", "B_Gun")
grip_bone = opt("--grip-bone", "B_rWristJ")
title = opt("--title", "Model")
rot = [float(x) for x in (opt("--weapon-rot", "90,0,0")).split(",")]

if not body_path or not out_path:
    raise SystemExit("usage: 07_build_blend.py -- --body <body.fbx> "
                     "[--textures <dir>] --out <out.blend> [--weapon <fbx>]")


def find_texture_dir(fbx_path):
    """Find the folder holding a weapon's textures.

    A weapon FBX points at its textures with a GAME-RELATIVE path
    (Character/Atreide/Unit/Weapons/MaulaRifle_Albedo.png).  That path only
    resolves when the FBX still lives inside the extracted game tree, so
    anywhere else the weapon renders MAGENTA (missing texture).

    Look, in order:
      1. beside the FBX
      2. in the extracted game tree, at the path the FBX itself names
      3. by searching the extracted tree for <stem>_Albedo.png
    """
    import glob
    stem = os.path.splitext(os.path.basename(fbx_path))[0]
    candidates = [os.path.dirname(os.path.abspath(fbx_path))]

    extr = cfg("extr_dir")
    # the FBX names its own path - strip the leading "Character/" to find it
    for m in re.finditer(r"[A-Za-z0-9_\\/.:-]*%s_Albedo\.png" % re.escape(stem),
                         open(fbx_path, "rb").read().decode("latin-1")):
        rel = m.group(0).replace("\\", "/")
        if rel.lower().endswith(".png"):
            candidates.append(os.path.join(extr, rel))

    for d in candidates:
        if d and os.path.exists(os.path.join(d, stem + "_Albedo.png")):
            return d
    hits = glob.glob(os.path.join(extr, "**", stem + "_Albedo.png"), recursive=True)
    if hits:
        return os.path.dirname(hits[0])
    return None

# ---- scene --------------------------------------------------------------
bs.reset_scene()
body, rig = bs.import_model(body_path)
bpy.context.view_layer.update()
body.name = title
body.data.name = title + "Mesh"
if rig:
    rig.name = "Armature"
print("BODY %s  verts %d tris %d" % (body_path, len(body.data.vertices),
                                     len(body.data.polygons)))
if rig:
    print("RIG  bones %d" % len(rig.data.bones))

# ---- material wiring ----------------------------------------------------
if tex_dir:
    tex_dir = os.path.abspath(tex_dir)
    stem = None
    for f in sorted(os.listdir(tex_dir)):
        if f.endswith("_Albedo.png"):
            stem = f[:-len("_Albedo.png")]
            break
    if stem:
        wanted = {
            "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
            "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
            "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
        }
        for mat in body.data.materials:
            if not mat.use_nodes:
                continue
            for sock, name, path in bs.wire_textures(mat, wanted):
                print("   %-20s <- %s" % (sock, name))
    else:
        print("   no *_Albedo.png in %s - keeping the existing wiring" % tex_dir)

# ---- weapon -------------------------------------------------------------
if weapon_path:
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(weapon_path))
    # the weapon FBX carries a 2x2x2 m helper mesh named "Cube"; it must go
    cubes = [o for o in bpy.data.objects
             if o.type == "MESH" and o.name == "Cube"]
    for c in cubes:
        print("   deleted the weapon FBX's helper 'Cube' (%d tris)"
              % len(c.data.polygons))
        bpy.data.objects.remove(c, do_unlink=True)
    meshes = [o for o in bpy.data.objects if o.type == "MESH" and o.name != body.name]
    if not meshes:
        raise SystemExit("no weapon mesh in %s" % weapon_path)
    weapon = max(meshes, key=lambda o: len(o.data.polygons))
    weapon.name = "Weapon_" + os.path.splitext(os.path.basename(weapon_path))[0][:24]

    # A weapon FBX references its textures by a GAME-RELATIVE path
    # (Character/Atreide/Unit/Weapons/MaulaRifle_Albedo.png).  Blender only
    # resolves that if the FBX still sits in the extracted game folder;
    # anywhere else the texture is MISSING and the weapon renders MAGENTA.
    # So the weapon's textures are wired explicitly.
    wtex_dir = opt("--weapon-textures")
    if wtex_dir is None:
        wtex_dir = find_texture_dir(weapon_path)
    if wtex_dir:
        wired = 0
        for mat in weapon.data.materials:
            if not mat.use_nodes:
                continue
            wanted = {
                "Base Color": os.path.join(wtex_dir, "MaulaRifle_Albedo.png"),
                "Specular IOR Level": os.path.join(
                    wtex_dir, "MaulaRifle_MetallicGlossAOEmiss.png"),
                "Normal": os.path.join(wtex_dir, "MaulaRifle_Normal.png"),
            }
            for sock, name, path in bs.wire_textures(mat, wanted):
                print("   %-20s <- %s" % (sock, name))
                wired += 1
        if wired == 0:
            print("   WARNING: could not wire the weapon textures from %s - "
                  "the weapon will render MAGENTA" % wtex_dir)
    else:
        print("   WARNING: no weapon texture folder found - the weapon will "
              "render MAGENTA (missing texture)")

    grip = bs.hand_centroid(body, grip_bone)
    if grip is None:
        raise SystemExit("no vertices weighted to %s" % grip_bone)
    print("   grip point (%s): %s" % (grip_bone,
                                     tuple(round(v, 3) for v in grip)))

    weapon.rotation_mode = "XYZ"
    desired = (Matrix.Translation(grip)
               @ Matrix.Rotation(math.radians(rot[0]), 4, "X")
               @ Matrix.Rotation(math.radians(rot[1]), 4, "Y")
               @ Matrix.Rotation(math.radians(rot[2]), 4, "Z"))
    weapon.matrix_world = desired
    bpy.context.view_layer.update()

    if rig and weapon_bone in rig.data.bones:
        bs.parent_to_bone(weapon, rig, weapon_bone)
        print("   parented to bone %s" % weapon_bone)
    else:
        print("   WARNING: no bone %s - the weapon is NOT parented" % weapon_bone)

    bpy.context.view_layer.update()
    mw = weapon.matrix_world
    bb = [mw @ Vector(c) for c in weapon.bound_box]
    print("   weapon bbox x %6.3f..%6.3f  y %6.3f..%6.3f  z %6.3f..%6.3f"
          % (min(b.x for b in bb), max(b.x for b in bb),
             min(b.y for b in bb), max(b.y for b in bb),
             min(b.z for b in bb), max(b.z for b in bb)))
    print("   weapon world translation %s"
          % (tuple(round(v, 3) for v in weapon.matrix_world.translation),))

# ---- world / lights / camera -------------------------------------------
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(1000, 1300)
cam = bs.frame_camera_on(body, margin=1.12, direction=(0.7, -0.7, 0.0))
if rig:
    rig.show_in_front = True

# ---- pack every texture so the .blend is portable ----------------------
packed = bs.pack_all_images()
print("   packed %d images into the .blend" % packed)

os.makedirs(os.path.dirname(os.path.abspath(out_path)), exist_ok=True)
try:
    bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(out_path), compress=True)
    print("SAVED %s (%.2f MB)" % (out_path, os.path.getsize(out_path) / 1e6))
except Exception as e:
    print("SAVE FAILED:", e)
    raise
