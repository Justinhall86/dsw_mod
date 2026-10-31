"""Step 20 - build the FINAL, self-contained .blend of the finished Commando.

  blender -b --python 08_scripts/20_make_final_blend.py

Outputs
  03_blender/commando_nopack_house.blend   House Ginaz colours, no backpack
  03_blender/commando_nopack_plain.blend   original colours, no backpack

Each .blend holds:
  * the Commando body with the backpack removed, skinned to the Male01 rig
  * the House Ginaz (or vanilla) albedo / MetallicGlossAO / Normal, wired to the
    Base Color / Specular IOR Level / Normal Map sockets
  * the Atreide Maula rifle, held in the right hand and PARENTED to the B_Gun
    bone, so it follows the hand when the rig is posed
  * a camera, a sun, a fill light and a world, so F12 renders immediately
  * every texture PACKED into the .blend, so the file is portable

The rifle's placement was worked out in steps 16-19:
  * the rifle FBX carries a helper mesh "Cube" (2x2x2 m) that must be deleted
  * the grip point is the centroid of the body vertices weighted to B_rWristJ
  * rotationX = +90 puts the barrel along -Y = the direction the character faces
"""
import math
import os
import sys

import bpy
import numpy as np
from mathutils import Matrix, Vector

PROJ = r"C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack"
BLEND_DIR = os.path.join(PROJ, "03_blender")
os.makedirs(BLEND_DIR, exist_ok=True)
EDITOR_RES = r"C:\dsw_mod\D4XEditor\res\res\CharMOD"
RIFLE_FBX = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_MaulaRifle_TRUE_FBX.fbx"

VARIANTS = [
    ("Male01_CommandoNoPackHouse.fbx", "Male01_CommandoNoPackHouse", "commando_nopack_house.blend"),
    ("Male01_CommandoNoPack.fbx", "Male01_CommandoNoPack", "commando_nopack_plain.blend"),
]

RIFLE_ROT = (math.radians(90), 0.0, 0.0)     # barrel towards -Y = facing


def hand_centroid(body, bone_name):
    groups = {g.name: g.index for g in body.vertex_groups}
    idx = groups.get(bone_name)
    if idx is None:
        return None
    mw = body.matrix_world
    pts = []
    for v in body.data.vertices:
        best, bw = None, -1.0
        for g in v.groups:
            if g.group == idx and g.weight > bw:
                best, bw = g.group, g.weight
        if best is not None and bw > 0.5:
            pts.append(mw @ v.co)
    if not pts:
        return None
    arr = np.array([p[:] for p in pts])
    return Vector((float(arr[:, 0].mean()), float(arr[:, 1].mean()), float(arr[:, 2].mean())))


for fbx_name, stem, out_name in VARIANTS:
    fbx = os.path.join(PROJ, "05_fbx_export", fbx_name)
    tex_dir = os.path.join(EDITOR_RES, stem)
    out = os.path.join(BLEND_DIR, out_name)
    print("\n=== %s" % out_name)

    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=fbx)
    body = next(o for o in bpy.data.objects if o.type == "MESH")
    rig = next((o for o in bpy.data.objects if o.type == "ARMATURE"), None)
    for n in ("Cube", "Camera", "Light"):
        o = bpy.data.objects.get(n)
        if o:
            bpy.data.objects.remove(o, do_unlink=True)
    body.name = "Commando"
    body.data.name = "CommandoMesh"
    if rig:
        rig.name = "Armature"

    # ---- material wiring, matched by SOCKET ----------------------------
    mat = body.data.materials[0]
    mat.name = "Mat_Commando"
    nt = mat.node_tree

    def socket_of(node):
        for l in nt.links:
            if l.from_node.name == node.name:
                sock = l.to_socket.name
                if sock == "Color" and l.to_node.type == "NORMAL_MAP":
                    for l2 in nt.links:
                        if l2.from_node.name == l.to_node.name:
                            return "Normal"
                return sock
        return None

    wanted = {
        "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
        "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
        "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
    }
    for node in [n for n in nt.nodes if n.type == "TEX_IMAGE"]:
        sock = socket_of(node)
        path = wanted["Base Color"] if sock == "Alpha" else wanted.get(sock)
        if not path:
            continue
        if os.path.exists(path):
            img = bpy.data.images.load(path, check_existing=False)
            img.name = os.path.basename(path)
            node.image = img
            print("   %-20s <- %s" % (sock, os.path.basename(path)))
        else:
            print("   %-20s <- MISSING %s" % (sock, path))

    # ---- the rifle ------------------------------------------------------
    grip = hand_centroid(body, "B_rWristJ")
    print("   grip point: %s" % (tuple(round(v, 3) for v in grip),))
    bpy.ops.import_scene.fbx(filepath=RIFLE_FBX)
    rifle = bpy.data.objects.get("MaulaRifle")
    cube = bpy.data.objects.get("Cube")
    if cube:
        print("   deleted the rifle FBX's helper 'Cube' (%d tris)" % len(cube.data.polygons))
        bpy.data.objects.remove(cube, do_unlink=True)
    rifle.name = "Atreide_MaulaRifle"
    rifle.rotation_mode = "XYZ"
    # the desired WORLD placement of the rifle (its own origin is the grip)
    desired = (Matrix.Translation(grip)
               @ Matrix.Rotation(RIFLE_ROT[0], 4, "X")
               @ Matrix.Rotation(RIFLE_ROT[1], 4, "Y")
               @ Matrix.Rotation(RIFLE_ROT[2], 4, "Z"))
    rifle.matrix_world = desired
    bpy.context.view_layer.update()
    if rig:
        # Parent to the gun bone so the rifle follows the hand when the rig is
        # posed.  Use the operator, not matrix_parent_inverse: Blender's bone
        # parenting uses the bone's TAIL as the origin, and only the operator
        # gets that right.  The active bone must be set first.
        for o2 in bpy.context.view_layer.objects:
            o2.select_set(False)
        rifle.select_set(True)
        rig.select_set(True)
        bpy.context.view_layer.objects.active = rig
        rig.data.bones.active = rig.data.bones["B_Gun"]
        bpy.ops.object.parent_set(type="BONE", keep_transform=True)
        rig.data.bones["B_Gun"].use_deform = True
    bpy.context.view_layer.update()
    rw = rifle.matrix_world
    bb = [rw @ Vector(c) for c in rifle.bound_box]
    print("   rifle world bbox x %6.3f..%6.3f  y %6.3f..%6.3f  z %6.3f..%6.3f"
          % (min(b.x for b in bb), max(b.x for b in bb),
             min(b.y for b in bb), max(b.y for b in bb),
             min(b.z for b in bb), max(b.z for b in bb)))
    print("   rifle parented to bone B_Gun (world %s)"
          % (tuple(round(v, 3) for v in rifle.matrix_world.translation),))

    # ---- world / lights / camera ---------------------------------------
    world = bpy.data.worlds.new("World")
    bpy.context.scene.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 1.8

    sd = bpy.data.lights.new("Sun", type="SUN")
    sd.energy = 3.0
    sd.angle = math.radians(3)
    sun = bpy.data.objects.new("Sun", sd)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

    fd = bpy.data.lights.new("Fill", type="AREA")
    fd.energy = 120
    fd.size = 3.0
    fill = bpy.data.objects.new("Fill", fd)
    bpy.context.collection.objects.link(fill)
    fill.location = (-1.6, -2.2, 1.6)
    fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))

    bpy.context.view_layer.update()
    bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
    lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
    hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
    centre = (lo + hi) / 2
    height = hi.z - lo.z

    cd = bpy.data.cameras.new("Camera")
    cd.type = "ORTHO"
    cd.ortho_scale = height * 1.12
    cam = bpy.data.objects.new("Camera", cd)
    bpy.context.collection.objects.link(cam)
    cam.location = centre + Vector((0.7, -0.7, 0.0)).normalized() * height * 2.2
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    bpy.context.scene.camera = cam

    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = 1000
    sc.render.resolution_y = 1300
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"
    sc.render.filepath = os.path.join(PROJ, "02_progress_photos", "06_final",
                                      os.path.splitext(out_name)[0] + "_blend.png")

    if rig:
        rig.show_in_front = True

    # ---- pack every texture so the .blend is self-contained -------------
    packed = 0
    for img in bpy.data.images:
        if img.size[0] and not img.packed_file:
            try:
                img.pack()
                packed += 1
            except Exception as e:
                print("   could not pack %s: %s" % (img.name, e))
    print("   packed %d images into the .blend" % packed)

    try:
        bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
        print("   SAVED %s (%.2f MB)" % (out, os.path.getsize(out) / 1e6))
    except Exception as e:
        print("   SAVE FAILED:", e)
