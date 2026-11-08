"""Scratch: render the best sword placement (conjneg, anchor +0.15)."""
import math
import os

import bpy
from mathutils import Matrix, Vector

WORK = r"C:\Users\justi\Python\dsw_mod\model_work\duncan_preview"
OUT = os.path.join(WORK, "placement_test")
os.makedirs(OUT, exist_ok=True)

BODY = os.path.join(WORK, "preview_body.fbx")
SWORD = os.path.join(WORK, "preview_sword.fbx")

OFFSET = Vector((0.0, -0.16362, 0.05084))
ROT = (-90.0, 0.0, 0.0)
BONE = "B_Weapon"
D = Matrix.Diagonal(Vector((-1.0, 1.0, 1.0, 1.0)))

GRIP_LOCAL = Vector((0.0, -0.095, 0.0))

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=BODY, use_anim=True)
for n in ("Cube", "Camera", "Light"):
    ob = bpy.data.objects.get(n)
    if ob:
        bpy.data.objects.remove(ob, do_unlink=True)
body = [o for o in bpy.context.scene.objects
        if o.type == "MESH" and len(o.data.vertices) > 100][0]
bpy.ops.import_scene.fbx(filepath=SWORD, use_anim=False)
sw = [o for o in bpy.context.scene.objects
      if o.type == "MESH" and len(o.data.vertices) > 50][0]
sw.name = "Sword"

rig = next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()

pb = rig.pose.bones[BONE]
bone_matrix = rig.matrix_world @ pb.matrix
head = bone_matrix.to_translation()

rot = (Matrix.Rotation(math.radians(ROT[0]), 4, "X")
       @ Matrix.Rotation(math.radians(ROT[1]), 4, "Y")
       @ Matrix.Rotation(math.radians(ROT[2]), 4, "Z"))
nrot = (Matrix.Rotation(math.radians(-ROT[0]), 4, "X")
        @ Matrix.Rotation(math.radians(-ROT[1]), 4, "Y")
        @ Matrix.Rotation(math.radians(-ROT[2]), 4, "Z"))

# conjneg: D-conjugated with negated rotation
prefab = D @ (Matrix.Translation(OFFSET) @ nrot) @ D
anchor_y = 0.15
basis = Matrix.Translation(Vector((0.0, anchor_y, 0.0))) @ prefab

sw.parent = rig
sw.parent_type = "BONE"
sw.parent_bone = BONE
sw.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
sw.matrix_basis = basis
bpy.context.view_layer.update()

grip = sw.matrix_world @ GRIP_LOCAL
print("FINAL: hand %s  grip %s  dist %.3f" % (
    tuple(round(v, 3) for v in head),
    tuple(round(v, 3) for v in grip),
    (grip - head).length))

# full-body render
sc = bpy.context.scene
bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
ctr = Vector((sum(v.x for v in bb) / 8, sum(v.y for v in bb) / 8,
              sum(v.z for v in bb) / 8))
cd = bpy.data.cameras.new("c")
cam = bpy.data.objects.new("c", cd)
bpy.context.collection.objects.link(cam)
cam.location = ctr + Vector((2.2, -2.2, 0.7))
cam.rotation_euler = (ctr - cam.location).to_track_quat("-Z", "Y").to_euler()
cd.lens = 50
sc.camera = cam
sc.render.engine = "BLENDER_WORKBENCH"
sc.display.shading.light = "STUDIO"
sc.render.resolution_x = 600
sc.render.resolution_y = 800
sc.render.filepath = os.path.join(OUT, "FINAL_sword.png")
bpy.ops.render.render(write_still=True)