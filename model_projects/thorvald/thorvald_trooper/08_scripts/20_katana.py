"""Give the Trooper the Atreides sword, lengthened into a katana, mounted on B_Weapon, and save the blend.

    blender -b <unit.blend> --python 20_katana.py -- <out.blend> [--blade 1.35] [--curve 0.035] [--grip 0.20]

Sword data (Atreide_Sword_01, converted with 06_convert_weapon.py into 05_fbx_export/AtreideSword_TRUE_FBX.fbx): local +Y is the hilt,
guard at y 0..0.09, grip y 0.12..0.44, pommel to 0.50; the blade runs from y 0 to the tip at y -0.69 (flat in local z).
Katana: only blade vertices (y < 0) are stretched (x --blade), with a gentle curve (sori) that grows with the square of the distance from the
guard.  Mount = the rest-pose placement validated for Duncan's and the Common clips (11_sword_anim.py): grip at world (0, 0.03, 0.12), blade
pointing world -Z; B_Weapon rests at the feet and the clips carry it into the right hand.
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(a[0])
blade_k = float(a[a.index("--blade") + 1]) if "--blade" in a else 1.35
curve = float(a[a.index("--curve") + 1]) if "--curve" in a else 0.035
grip_y = float(a[a.index("--grip") + 1]) if "--grip" in a else 0.20

rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for o in [o for o in bpy.data.objects if o.name.startswith("Katana")]:
    bpy.data.objects.remove(o, do_unlink=True)                  # re-running on a file that already has one must not add a second
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "AtreideSword_TRUE_FBX.fbx"))
new = [o for o in bpy.data.objects if o not in before]
sword = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.vertices))
for o in new:
    if o is not sword:
        bpy.data.objects.remove(o, do_unlink=True)              # the 2x2x2 'Cube' helper and empties
sword.name = sword.data.name = "Katana"
sword.matrix_world = Matrix.Identity(4)

# ---- katana blade --------------------------------------------------------------------------------------------------------------
L0 = -min(v.co.y for v in sword.data.vertices)
for v in sword.data.vertices:
    if v.co.y < 0.0:
        t = -v.co.y / L0
        v.co.y *= blade_k
        v.co.x += curve * t * t
sword.data.update()
print("KATANA blade %.2f m -> %.2f m, curve %.3f m at the tip" % (L0, L0 * blade_k, curve))

tex = os.path.join(PROJ, "04_textures", "sword")
for mat in sword.data.materials:
    if mat and mat.use_nodes:
        # the sword's own map (steel blade, gold hilt).  The weapons folder's MetallicGlossAO is a 64 px map that does not match these UVs, so the
        # blade gets a fixed steel response instead (fully metallic reads black in the matte preview)
        for lk in list(mat.node_tree.links):
            if lk.to_socket.name in ("Specular IOR Level", "Normal", "Metallic", "Roughness"):
                mat.node_tree.links.remove(lk)
        bs.wire_textures(mat, {"Base Color": os.path.join(tex, "MetalSword_Albedo.png")})
        bsdf = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
        bsdf.inputs["Metallic"].default_value = 0.45
        bsdf.inputs["Roughness"].default_value = 0.35
        mat.name = "Mat_Katana"

# ---- mount on B_Weapon --------------------------------------------------------------------------------------------------------
pb = rig.pose.bones["B_Weapon"]
rig.animation_data_create()
rig.animation_data.action = None
for p_ in rig.pose.bones:
    p_.matrix_basis = Matrix.Identity(4)
bpy.context.view_layer.update()
sword.parent = rig
sword.parent_type = "BONE"
sword.parent_bone = "B_Weapon"
sword.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
bpy.context.view_layer.update()
sword.matrix_world = (Matrix.Translation((0.0, 0.03, 0.12)) @ Matrix.Rotation(math.radians(90.0), 4, "X")
                      @ Matrix.Translation(Vector((0.0, -grip_y, 0.0))))
bpy.context.view_layer.update()
bb = [sword.matrix_world @ Vector(c) for c in sword.bound_box]
print("KATANA mounted: world z %.2f..%.2f  verts %d" % (min(b.z for b in bb), max(b.z for b in bb), len(sword.data.vertices)))
bs.pack_all_images()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out)
