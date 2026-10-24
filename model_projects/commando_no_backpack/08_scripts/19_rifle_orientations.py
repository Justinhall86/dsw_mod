"""Step 19 - find the rifle orientation that points the barrel FORWARD.

Candidate A (rotationX -90) put the rifle in the right hand but pointing
BACKWARD: the rifle's long axis is its local +Z, and a -90 rotation about X
maps local +Z to world +Y (behind the character, who faces -Y).

This renders several orientations tightly framed on the upper body so the
right one can be picked by eye.

  blender -b --python 08_scripts/19_rifle_orientations.py
"""
import math
import os

import bpy
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
OUT = os.path.join(PROJ, "02_progress_photos", "09_rifle_orient")
os.makedirs(OUT, exist_ok=True)
FBX = os.path.join(PROJ, "05_fbx_export", "Male01_CommandoNoPackHouse.fbx")
RIFLE = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_MaulaRifle_TRUE_FBX.fbx"

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=FBX)
body = next(o for o in bpy.data.objects if o.type == "MESH")
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for n in ("Cube", "Camera", "Light"):
    o = bpy.data.objects.get(n)
    if o:
        bpy.data.objects.remove(o, do_unlink=True)

groups = {g.name: g.index for g in body.vertex_groups}
co = np.array([(body.matrix_world @ v.co)[:] for v in body.data.vertices])


def hand_vertices(idx):
    out = []
    for v in body.data.vertices:
        best, bw = None, -1.0
        for g in v.groups:
            if g.group == idx and g.weight > bw:
                best, bw = g.group, g.weight
        if best is not None and bw > 0.5:
            out.append(v.index)
    return out


hand = hand_vertices(groups["B_rWristJ"])
p = co[hand]
grip = Vector((float(p[:, 0].mean()), float(p[:, 1].mean()), float(p[:, 2].mean())))
print("grip point: %s" % (tuple(round(v, 3) for v in grip),))

bpy.ops.import_scene.fbx(filepath=RIFLE)
rifle = bpy.data.objects.get("MaulaRifle")
cube = bpy.data.objects.get("Cube")
if cube:
    bpy.data.objects.remove(cube, do_unlink=True)
rifle.rotation_mode = "XYZ"

world = bpy.data.worlds.new("W")
bpy.context.scene.world = world
world.use_nodes = True
world.node_tree.nodes["Background"].inputs[0].default_value = (0.6, 0.63, 0.68, 1)
world.node_tree.nodes["Background"].inputs[1].default_value = 2.2
sd = bpy.data.lights.new("Sun", type="SUN")
sd.energy = 3.2
sun = bpy.data.objects.new("Sun", sd)
bpy.context.collection.objects.link(sun)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
cd = bpy.data.cameras.new("Cam")
cd.type = "ORTHO"
cd.ortho_scale = 1.05
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 900
sc.render.resolution_y = 1000
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

target = Vector((grip.x, grip.y, grip.z + 0.15))

CANDIDATES = {
    "A_xm90": (math.radians(-90), 0, 0),
    "B_xp90": (math.radians(90), 0, 0),
    "E_xp90_z180": (math.radians(90), 0, math.radians(180)),
    "F_xp90_zm90": (math.radians(90), 0, math.radians(-90)),
    "G_xp90_zp90": (math.radians(90), 0, math.radians(90)),
    "H_xp180": (math.radians(180), 0, 0),
}

for name, rot in CANDIDATES.items():
    rifle.rotation_euler = rot
    rifle.location = grip
    bpy.context.view_layer.update()
    bb = [rifle.matrix_world @ Vector(c) for c in rifle.bound_box]
    # which way does the barrel point?  the rifle's local +Z is the barrel
    barrel = (rifle.matrix_world.to_3x3() @ Vector((0.0, 0.0, 1.0))).normalized()
    print("%-14s barrel dir %s   bbox y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (name, tuple(round(v, 2) for v in barrel),
             min(b.y for b in bb), max(b.y for b in bb),
             min(b.z for b in bb), max(b.z for b in bb)))
    for view, direction in (("side", Vector((1.0, 0.0, 0.0))),
                            ("front", Vector((0.0, -1.0, 0.0)))):
        d = direction.normalized()
        cam.location = target + d * 4.0
        cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, f"orient_{name}_{view}.png")
        bpy.ops.render.render(write_still=True)
print("done")
