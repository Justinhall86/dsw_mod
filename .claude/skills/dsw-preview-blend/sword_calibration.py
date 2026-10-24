#!/usr/bin/env python3
"""
Sword Placement Calibration — find the correct anchor_y so the grip lands in the hand.

Run inside Blender (Scripting tab) after loading the preview scene with body + sword.
"""
import bpy
from mathutils import Matrix, Vector

# ============================================================ CONFIG — EDIT THESE
SWORD_NAME = "Weapon_01"          # name of the sword object in the scene
BONE_NAME = "B_Weapon"            # hand bone the sword is parented to
GRIP_LOCAL = Vector((0.0, -0.095, 0.0))  # grip center in sword LOCAL space (y ≈ -0.095 for Atreide sword)
ANCHOR_SWEEP = [0.0, 0.02, 0.04, 0.06, 0.08, 0.10, 0.12, 0.14, 0.16, 0.18, 0.20]
# ============================================================

rig = bpy.data.objects.get("Rig") or bpy.data.objects.get("Armature") or \
      next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
sw = bpy.data.objects[SWORD_NAME]
pb = rig.pose.bones[BONE_NAME]
hand = rig.matrix_world @ pb.head

# Get the prefab transform (without anchor_y)
# This is what place_in_bone() computes as `prefab`
# For Atreide sword: offset=(0, -0.16362, 0.05084), rot=(-90, 0, 0)
OFFSET = Vector((0.0, -0.16362, 0.05084))
ROT_DEG = (-90.0, 0.0, 0.0)

rot = (Matrix.Rotation(math.radians(ROT_DEG[0]), 4, "X")
       @ Matrix.Rotation(math.radians(ROT_DEG[1]), 4, "Y")
       @ Matrix.Rotation(math.radians(ROT_DEG[2]), 4, "Z"))
prefab = Matrix.Translation(OFFSET) @ rot

print("Sword calibration for %s on %s" % (SWORD_NAME, BONE_NAME))
print("Hand world pos:", tuple(round(v, 4) for v in hand))
print("Prefab transform:", [round(v, 4) for r in prefab for v in r])
print()

best = []
for anchor_y in ANCHOR_SWEEP:
    basis = Matrix.Translation(Vector((0.0, anchor_y, 0.0))) @ prefab
    sw.matrix_basis = basis
    bpy.context.view_layer.update()
    grip = sw.matrix_world @ GRIP_LOCAL
    dist = (grip - hand).length
    print("  anchor %+0.3f  grip %s  dist %.4f" % (
        anchor_y, tuple(round(v, 4) for v in grip), dist))
    best.append((dist, anchor_y, grip))

best.sort()
print("\nBEST:")
for dist, anchor, grip in best[:5]:
    print("   %.4f  anchor %+0.3f  grip %s" % (dist, anchor, tuple(round(v, 4) for v in grip)))

# Apply the best one
if best:
    best_anchor = best[0][1]
    sw.matrix_basis = Matrix.Translation(Vector((0.0, best_anchor, 0.0))) @ prefab
    bpy.context.view_layer.update()
    print("\nApplied best anchor_y = %.3f" % best_anchor)
    print("Grip now at:", tuple(round(v, 4) for v in (sw.matrix_world @ GRIP_LOCAL)))
    print("Distance to hand:", (sw.matrix_world @ GRIP_LOCAL - hand).length)