"""Step 18 - place the Maula rifle in the Commando's right hand.

The game's prefab says:
    "model" Atreide_MaulaRifle   rotationX: -90
    "constraint" -> ...B_rWristJ.B_Gun
so the weapon's own ORIGIN is the grip point and it is rotated -90 about X
relative to the gun bone.  The rig's B_Gun bone itself sits at the armature
origin in the rest pose, so its rest transform is not a usable placement hint
in Blender - the hand position is used instead.

This script:
  * finds the right hand from the BODY MESH (the vertices weighted to the
    wrist bone) - that is the true grip location
  * places the rifle with a few candidate orientations and renders them
  * reports the bbox of each so the one that looks like a held rifle can be
    chosen

  blender -b --python 08_scripts/18_place_rifle.py
"""
import math
import os

import bpy
import numpy as np
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
OUT = os.path.join(PROJ, "02_progress_photos", "08_rifle_placement")
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

# ---- the right hand: vertices whose strongest weight is the wrist bone ----
groups = {g.name: g.index for g in body.vertex_groups}
wrist_idx = groups.get("B_rWristJ")
l_wrist_idx = groups.get("B_lWristJ")
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


r_hand = hand_vertices(wrist_idx)
l_hand = hand_vertices(l_wrist_idx)
print("right-hand verts (B_rWristJ > 0.5): %d" % len(r_hand))
print("left-hand  verts (B_lWristJ > 0.5): %d" % len(l_hand))
if r_hand:
    p = co[r_hand]
    print("  right hand bbox x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f"
          % (p[:, 0].min(), p[:, 0].max(), p[:, 1].min(), p[:, 1].max(),
             p[:, 2].min(), p[:, 2].max()))
    grip = Vector((float(p[:, 0].mean()), float(p[:, 1].mean()), float(p[:, 2].mean())))
    print("  right-hand centroid: %s" % (tuple(round(v, 3) for v in grip),))
else:
    grip = Vector((0.0, 0.0, 1.0))

# ---- the rifle ----------------------------------------------------------
bpy.ops.import_scene.fbx(filepath=RIFLE)
rifle = bpy.data.objects.get("MaulaRifle")
cube = bpy.data.objects.get("Cube")
if cube:
    bpy.data.objects.remove(cube, do_unlink=True)
rifle.rotation_mode = "XYZ"

# the rifle's long axis is its local Z; find which end is the barrel by
# looking at the geometry: the stock end has the pistol grip below it
rco = np.array([v.co[:] for v in rifle.data.vertices])
print("rifle local bbox z %.3f..%.3f" % (rco[:, 2].min(), rco[:, 2].max()))

# ---- lighting / camera -------------------------------------------------
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
cam = bpy.data.objects.new("Cam", cd)
bpy.context.collection.objects.link(cam)
bpy.context.scene.camera = cam
sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = 1000
sc.render.resolution_y = 1300
sc.render.resolution_percentage = 100
sc.view_settings.view_transform = "Standard"

target = Vector((0.0, 0.0, 1.15))
cd.ortho_scale = 2.3

CANDIDATES = {
    "A_rXminus90": (math.radians(-90), 0.0, 0.0),
    "B_rXplus90": (math.radians(90), 0.0, 0.0),
    "C_rZminus90": (0.0, 0.0, math.radians(-90)),
    "D_rZplus90": (0.0, 0.0, math.radians(90)),
}

for name, rot in CANDIDATES.items():
    rifle.rotation_euler = rot
    rifle.location = grip
    bpy.context.view_layer.update()
    bb = [rifle.matrix_world @ Vector(c) for c in rifle.bound_box]
    print("%-14s bbox x %6.2f..%6.2f  y %6.2f..%6.2f  z %6.2f..%6.2f"
          % (name,
             min(b.x for b in bb), max(b.x for b in bb),
             min(b.y for b in bb), max(b.y for b in bb),
             min(b.z for b in bb), max(b.z for b in bb)))
    for view, direction in (("front", Vector((0.0, -1.0, 0.0))),
                            ("side", Vector((1.0, 0.0, 0.0)))):
        d = direction.normalized()
        cam.location = target + d * 4.0
        cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, f"place_{name}_{view}.png")
        bpy.ops.render.render(write_still=True)
    print("   rendered", name)
