"""Step 14 - build a VIEWABLE .blend of the finished Commando (no backpack).

  blender -b --python 08_scripts/14_make_blend.py

Creates
  03_blender/commando_nopack_house.blend   the House Ginaz variant (no pack)
  03_blender/commando_nopack_plain.blend   the original-colour variant (no pack)

Each .blend contains everything needed to SEE the finished product:
  * the Commando body with the backpack removed, skinned to the Male01 rig
  * the House Ginaz albedo / MetallicGlossAO / Normal wired to the material
  * the Atreide Maula rifle, parented and posed on B_Gun (as the prefab does)
  * a camera, a sun and a world so it renders straight away
  * the model posed in a readable A-pose (rest pose)

The rifle's own textures come from the extracted game assets
(C:\\dsw_mod\\extr\\Character\\Atreide\\Unit\\Weapons\\).
"""
import math
import os
import shutil
import sys

import bpy
from mathutils import Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_no_backpack"
BLEND_DIR = os.path.join(PROJ, "03_blender")
os.makedirs(BLEND_DIR, exist_ok=True)

EDITOR_RES = r"C:\dsw_mod\D4XEditor\res\res\CharMOD"
RIFLE_FBX = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons\Atreide_MaulaRifle_TRUE_FBX.fbx"
RIFLE_TEX = r"C:\dsw_mod\extr\Character\Atreide\Unit\Weapons"

VARIANTS = [
    # (fbx, albedo, metallic, normal, output blend name)
    ("Male01_CommandoNoPackHouse.fbx",
     "Male01_CommandoNoPackHouse_Albedo.png",
     "Male01_CommandoNoPackHouse_MetallicGlossAO.png",
     "Male01_CommandoNoPackHouse_Normal.png",
     "commando_nopack_house.blend"),
    ("Male01_CommandoNoPack.fbx",
     "Male01_CommandoNoPack_Albedo.png",
     "Male01_CommandoNoPack_MetallicGlossAO.png",
     "Male01_CommandoNoPack_Normal.png",
     "commando_nopack_plain.blend"),
]

for fbx_name, alb, met, nrm, out_name in VARIANTS:
    fbx = os.path.join(PROJ, "05_fbx_export", fbx_name)
    tex_dir = os.path.join(EDITOR_RES, os.path.splitext(fbx_name)[0])
    out = os.path.join(BLEND_DIR, out_name)
    print("\n=== %s" % out_name)

    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=fbx)
    body = next(o for o in bpy.data.objects if o.type == "MESH")
    rig = next((o for o in bpy.data.objects if o.type == "ARMATURE"), None)
    for name in ("Cube", "Camera", "Light"):
        ob = bpy.data.objects.get(name)
        if ob:
            bpy.data.objects.remove(ob, do_unlink=True)
    body.name = "Commando"
    if rig:
        rig.name = "Armature"

    # ---- material: point the three maps at the real texture files ------
    # The toolkit's import names the image nodes after the ORIGINAL textures
    # (Commando_Albedo.png, Commando_Normal.png, ...), so match on the SOCKET
    # each node feeds, not on the node name - the alpha node is also an albedo
    # image and would otherwise be picked up first.
    mat = body.data.materials[0]
    mat.name = "Mat_Commando"
    nt = mat.node_tree

    def socket_of(node):
        # NB: compare by NAME, not identity - Blender hands out a fresh Python
        # wrapper for the same node on every access, so `is` is always False.
        # The normal map is NOT linked straight to the BSDF: it goes through a
        # "Normal Map" node, so walk one hop further.
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
        "Base Color": os.path.join(tex_dir, alb),
        "Specular IOR Level": os.path.join(tex_dir, met),
        "Normal": os.path.join(tex_dir, nrm),
    }
    for node in [n for n in nt.nodes if n.type == "TEX_IMAGE"]:
        sock = socket_of(node)
        if sock == "Alpha":
            # the alpha copy of the albedo: keep it in step with Base Color
            path = wanted["Base Color"]
            if os.path.exists(path):
                img = bpy.data.images.load(path, check_existing=False)
                img.name = os.path.basename(path)
                node.image = img
            continue
        path = wanted.get(sock)
        if not path:
            continue
        if os.path.exists(path):
            img = bpy.data.images.load(path, check_existing=False)
            img.name = os.path.basename(path)
            node.image = img
            print("   %-20s <- %s" % (sock, os.path.basename(path)))
        else:
            print("   %-20s <- MISSING %s" % (sock, path))

    # ---- the rifle, as the prefab has it -------------------------------
    rifle = None
    if os.path.exists(RIFLE_FBX):
        try:
            bpy.ops.import_scene.fbx(filepath=RIFLE_FBX)
            rifle = next((o for o in bpy.data.objects
                          if o.type == "MESH" and "Rifle" in o.name), None)
            if rifle is None:
                rifle = next((o for o in bpy.data.objects
                              if o.type == "MESH" and o is not body), None)
        except Exception as e:
            print("   rifle import failed:", e)
    if rifle is not None:
        rifle.name = "Atreide_MaulaRifle"
        # the prefab rotates the rifle -90 deg on X and constrains it to
        # ...B_rWristJ.B_Gun
        rifle.rotation_euler = (math.radians(-90), 0.0, 0.0)
        if rig:
            rifle.parent = rig
            rifle.parent_type = "BONE"
            rifle.parent_bone = "B_Gun"
            rifle.matrix_parent_inverse = (
                rig.matrix_world @ rig.pose.bones["B_Gun"].matrix
            ).inverted() @ rifle.matrix_world
        # wire the rifle's own textures
        for m in rifle.data.materials:
            if not m or not m.use_nodes:
                continue
            for node in [n for n in m.node_tree.nodes if n.type == "TEX_IMAGE"]:
                cur = node.image.name if node.image else ""
                want = None
                for key, pat in (("Albedo", "Albedo"), ("Metallic", "Metallic"),
                                 ("Normal", "Normal")):
                    if pat in cur and want is None:
                        cand = [f for f in os.listdir(RIFLE_TEX)
                                if pat in f and not f.endswith("_Emissive.png")]
                        if cand:
                            want = os.path.join(RIFLE_TEX, cand[0])
                if want:
                    img = bpy.data.images.load(want, check_existing=False)
                    node.image = img
        print("   rifle added:", rifle.name)

    # ---- world / sun / camera ------------------------------------------
    world = bpy.data.worlds.new("World")
    bpy.context.scene.world = world
    world.use_nodes = True
    world.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    world.node_tree.nodes["Background"].inputs[1].default_value = 1.8

    sun_data = bpy.data.lights.new("Sun", type="SUN")
    sun_data.energy = 3.0
    sun_data.angle = math.radians(3)
    sun = bpy.data.objects.new("Sun", sun_data)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

    fill_data = bpy.data.lights.new("Fill", type="AREA")
    fill_data.energy = 120
    fill_data.size = 3.0
    fill = bpy.data.objects.new("Fill", fill_data)
    bpy.context.collection.objects.link(fill)
    fill.location = (-1.6, -2.2, 1.6)
    fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))

    bpy.context.view_layer.update()
    bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
    lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
    hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
    centre = (lo + hi) / 2
    height = hi.z - lo.z

    cam_data = bpy.data.cameras.new("Camera")
    cam_data.type = "ORTHO"
    cam_data.ortho_scale = height * 1.1
    cam = bpy.data.objects.new("Camera", cam_data)
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

    # tidy the outliner
    if rig:
        rig.show_in_front = True
    body.data.name = "CommandoMesh"

    try:
        bpy.ops.wm.save_as_mainfile(filepath=out)
        print("   SAVED %s (%.1f MB)" % (out, os.path.getsize(out) / 1e6))
    except Exception as e:
        print("   SAVE FAILED:", e)
