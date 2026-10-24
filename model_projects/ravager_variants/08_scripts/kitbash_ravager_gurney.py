"""Kitbash Ravager Melee + Gurney into one textured .blend scene.

Both models are on the Male01 rig, so they share one armature. Each mesh keeps
its own material/texture set. Junk objects (Cube, Camera, Light) are removed.
"""
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import script_args

argv = script_args()
ravager_path = argv[0] if len(argv) > 0 else ""
gurney_path = argv[1] if len(argv) > 1 else ""
out_path = argv[2] if len(argv) > 2 else ""
if not ravager_path or not gurney_path or not out_path:
    raise SystemExit(
        "usage: kitbash_ravager_gurney.py -- <ravager.fbx> <gurney.fbx> <out.blend>"
    )

ravager_path = os.path.abspath(ravager_path)
gurney_path = os.path.abspath(gurney_path)
out_path = os.path.abspath(out_path)

bs.reset_scene()

# ---- import Ravager Melee --------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=ravager_path)
new_objects = [o for o in bpy.data.objects if o not in before]
new_meshes = [o for o in new_objects if o.type == "MESH"]
new_rigs = [o for o in new_objects if o.type == "ARMATURE"]
if not new_meshes:
    raise SystemExit("no mesh imported from %s" % ravager_path)
ravager_body = max(new_meshes, key=lambda o: len(o.data.polygons))
ravager_body.name = "Ravager Melee"
ravager_body.data.name = "Ravager Melee Mesh"
ravager_rig = new_rigs[0] if new_rigs else None
if ravager_rig:
    ravager_rig.name = "Armature"

# ---- import Gurney ---------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=gurney_path)
new_objects = [o for o in bpy.data.objects if o not in before]
new_meshes = [o for o in new_objects if o.type == "MESH"]
new_rigs = [o for o in new_objects if o.type == "ARMATURE"]
if not new_meshes:
    raise SystemExit("no mesh imported from %s" % gurney_path)
gurney_body = max(new_meshes, key=lambda o: len(o.data.polygons))
gurney_body.name = "Gurney"
gurney_body.data.name = "Gurney Mesh"
gurney_rig = new_rigs[0] if new_rigs else None

# Share one armature: parent Gurney to the Ravager armature and drop its rig.
if gurney_rig is not None and gurney_rig is not ravager_rig:
    gurney_body.parent = ravager_rig
    gurney_body.parent_type = "OBJECT"
    bpy.data.objects.remove(gurney_rig, do_unlink=True)
elif ravager_rig is None and gurney_rig is not None:
    ravager_rig = gurney_rig
    ravager_rig.name = "Armature"

# ---- remove junk -----------------------------------------------------------
for n in bs.JUNK_NAMES:
    o = bpy.data.objects.get(n)
    if o and o.type == "MESH":
        bpy.data.objects.remove(o, do_unlink=True)

# ---- wire textures for both bodies -----------------------------------------
ravager_tex_dir = os.path.dirname(ravager_path)
gurney_tex_dir = os.path.dirname(gurney_path)

for body, tex_dir, stem in (
    (ravager_body, ravager_tex_dir, "Ravager"),
    (gurney_body, gurney_tex_dir, "Gurney"),
):
    wanted = {
        "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
        "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
        "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
    }
    if stem == "Gurney":
        wanted["Emissive"] = os.path.join(tex_dir, stem + "_Emissive.png")
    for mat in body.data.materials:
        if not mat.use_nodes:
            continue
        for sock, name, path in bs.wire_textures(mat, wanted):
            print("   %-20s <- %s" % (sock, name))

# ---- scene setup -----------------------------------------------------------
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(1000, 1300)
cam = bs.frame_camera_on(ravager_body, margin=1.12, direction=(0.7, -0.7, 0.0))
if ravager_rig:
    ravager_rig.show_in_front = True

# ---- pack ------------------------------------------------------------------
packed = bs.pack_all_images()
print("   packed %d images into the .blend" % packed)

os.makedirs(os.path.dirname(out_path), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=out_path, compress=True)
print("SAVED %s (%.2f MB)" % (out_path, os.path.getsize(out_path) / 1e6))
print("BODIES: Ravager Melee tris=%d  Gurney tris=%d" % (
    len(ravager_body.data.polygons), len(gurney_body.data.polygons)))