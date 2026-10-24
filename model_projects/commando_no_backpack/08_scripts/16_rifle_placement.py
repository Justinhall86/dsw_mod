"""Step 16 - work out the correct placement of the Atreide Maula rifle.

Findings so far
  * the rifle FBX carries a helper mesh called "Cube" (2x2x2 m, 6 tris) that
    the toolkit uses as a bounds reference - it must be deleted or it renders
    as a giant slab over the character
  * the game's prefab puts the weapon at the weapon's own origin with
    rotationX: -90, constrained to the B_Gun bone:
        "model" Atreide_MaulaRifle  rotationX: -90
        "constraint" -> ...B_rWristJ.B_Gun
    i.e. the weapon's ORIGIN is the grip point and it is placed in the bone's
    local space, rotated -90 about X (so the barrel, which runs along +Z in
    the weapon's own space, ends up pointing along +Y = forward)

This script measures B_Gun's world transform and prints where the rifle would
land with that convention, so the placement can be verified rather than guessed.

  blender -b --python 08_scripts/16_rifle_placement.py
"""
import math
import os

import bpy
from mathutils import Matrix, Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
FBX = os.path.join(PROJ, "05_fbx_export", "Male01_CommandoNoPackHouse.fbx")
RIFLE = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_MaulaRifle_TRUE_FBX.fbx"

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
body = next(o for o in bpy.data.objects if o.type == "MESH")
for n in ("Cube", "Camera", "Light"):
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)

gun = rig.data.bones["B_Gun"]
gun_world = rig.matrix_world @ gun.matrix_local
print("B_Gun matrix_local translation: %s"
      % (tuple(round(v, 4) for v in gun.matrix_local.translation),))
print("B_Gun world translation:         %s"
      % (tuple(round(v, 4) for v in gun_world.translation),))
print("B_Gun world X axis (length dir): %s"
      % (tuple(round(v, 4) for v in gun_world.col[0][:3]),))

wrist = rig.data.bones["B_rWristJ"]
wrist_world = rig.matrix_world @ wrist.matrix_local
print("B_rWristJ world translation:     %s"
      % (tuple(round(v, 4) for v in wrist_world.translation),))

# the weapon's own origin is the grip; the prefab rotates it -90 about X
place = gun_world @ Matrix.Rotation(math.radians(-90), 4, "X")
print("\nweapon world matrix if placed by the prefab convention:")
for row in place:
    print("   %s" % (tuple(round(v, 4) for v in row[:3]),))
p = place.translation
print("   origin (grip) would sit at %s" % (tuple(round(v, 4) for v in p),))

# where does the rifle geometry go then?
bpy.ops.import_scene.fbx(filepath=RIFLE)
rifle = bpy.data.objects.get("MaulaRifle")
cube = bpy.data.objects.get("Cube")
if cube:
    print("\nhelper 'Cube' present: %d tris, bbox %s -> DELETING"
          % (len(cube.data.polygons),
             tuple(round(v, 2) for v in cube.dimensions)))
    bpy.data.objects.remove(cube, do_unlink=True)

rifle.matrix_world = place
bpy.context.view_layer.update()
bb = [rifle.matrix_world @ Vector(c) for c in rifle.bound_box]
print("\nrifle bbox after placement:")
print("   x %7.3f..%7.3f" % (min(b.x for b in bb), max(b.x for b in bb)))
print("   y %7.3f..%7.3f" % (min(b.y for b in bb), max(b.y for b in bb)))
print("   z %7.3f..%7.3f" % (min(b.z for b in bb), max(b.z for b in bb)))
print("   body bbox: x %7.3f..%7.3f  z %7.3f..%7.3f"
      % (min((body.matrix_world @ Vector(c)).x for c in body.bound_box),
         max((body.matrix_world @ Vector(c)).x for c in body.bound_box),
         min((body.matrix_world @ Vector(c)).z for c in body.bound_box),
         max((body.matrix_world @ Vector(c)).z for c in body.bound_box)))
