"""Mount a weapon from the shared library (model_projects/weapons/<weapon>/) on a unit and save the result.

    blender -b <unit.blend> --python mount_weapon.py -- <weapon_dir> <out.blend> [--remove Name1,Name2]

<weapon_dir>/weapon.json describes the weapon:
    "object":  object name inside "blend" (a stand-alone weapon blend in weapon space)   or
    "fbx":     a converted game weapon (the 2x2x2 'Cube' helper and empties are dropped on import)
    "textures": {"Base Color": "textures/...png", ...}   relative to <weapon_dir>; replaces the image of the node feeding that socket
    "material": {"metallic": .., "roughness": ..}       optional fixed values
    "bone":  "B_Weapon"                                  the Male01 weapon bone: it RESTS at the feet and the clips carry it into the hand
    "rest_grip_world": [0, 0.03, 0.12]                   where the grip sits in the REST pose (validated for Duncan's and the Common clips)
    "rot_x_deg": 90                                      local -Y (the blade) -> world -Z in the rest pose
    "grip_local": [0, y, 0]                              the grip point in the weapon's own space
Existing objects named in --remove (or already carrying the same object name) are deleted first, so running it twice never gives two weapons.
"""
import json
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

a = sys.argv[sys.argv.index("--") + 1:]
wdir, out = os.path.abspath(a[0]), os.path.abspath(a[1])
remove = a[a.index("--remove") + 1].split(",") if "--remove" in a else []
spec = json.load(open(os.path.join(wdir, "weapon.json")))
name = spec["name"]

rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
for o in [o for o in bpy.data.objects if o.type == "MESH" and (o.name.split(".")[0] == name or o.name.split(".")[0] in remove)]:
    print("REMOVED old weapon", o.name)
    bpy.data.objects.remove(o, do_unlink=True)

if "blend" in spec:
    with bpy.data.libraries.load(os.path.join(wdir, spec["blend"]), link=False) as (src, dst):
        dst.objects = [spec["object"]]
    w = dst.objects[0]
    bpy.context.collection.objects.link(w)
else:
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(wdir, spec["fbx"]))
    new = [o for o in bpy.data.objects if o not in before]
    w = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.vertices))
    for o in new:
        if o is not w:
            bpy.data.objects.remove(o, do_unlink=True)
w.name = name
w.parent = None
w.matrix_world.identity()

for mat in w.data.materials:
    if not (mat and mat.use_nodes):
        continue
    nt = mat.node_tree
    for sock, rel in spec.get("textures", {}).items():
        for lk in nt.links:
            if lk.to_socket.name == sock and lk.from_node.type == "TEX_IMAGE":
                img = bpy.data.images.load(os.path.join(wdir, rel), check_existing=False)
                img.name = os.path.basename(rel)
                lk.from_node.image = img
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    for k, val in spec.get("material", {}).items():
        if bsdf is not None:
            for lk in [lk for lk in nt.links if lk.to_socket == bsdf.inputs[k.capitalize()]]:
                nt.links.remove(lk)
            bsdf.inputs[k.capitalize()].default_value = val

# mount: rest pose, bone parent (Blender's bone parenting uses the bone TAIL, hence the inverse), rest placement in world space
rig.animation_data_create()
rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis = Matrix.Identity(4)
bpy.context.view_layer.update()
bone = spec.get("bone", "B_Weapon")
w.parent = rig
w.parent_type = "BONE"
w.parent_bone = bone
w.matrix_parent_inverse = Matrix.Translation((0.0, -rig.pose.bones[bone].bone.length, 0.0))
bpy.context.view_layer.update()
if spec.get("mount") == "bone_local":
    # guns: placed in the bone's OWN frame (origin at the bone head), like the game prefab's constraint to B_Gun; "rot_deg" XYZ, "offset" metres
    rx, ry, rz = (math.radians(d) for d in spec.get("rot_deg", (0.0, 0.0, 0.0)))
    w.matrix_basis = (Matrix.Translation(Vector(spec.get("offset", (0.0, 0.0, 0.0)))) @ Matrix.Rotation(rx, 4, "X") @ Matrix.Rotation(ry, 4, "Y")
                      @ Matrix.Rotation(rz, 4, "Z") @ Matrix.Translation(-Vector(spec.get("grip_local", (0.0, 0.0, 0.0)))))
else:
    w.matrix_world = (Matrix.Translation(Vector(spec["rest_grip_world"])) @ Matrix.Rotation(math.radians(spec.get("rot_x_deg", 90.0)), 4, "X")
                      @ Matrix.Translation(-Vector(spec["grip_local"])))
bpy.context.view_layer.update()
bb = [w.matrix_world @ Vector(c) for c in w.bound_box]
print("MOUNTED %s on %s: rest z %.3f..%.3f, verts %d" % (name, bone, min(b.z for b in bb), max(b.z for b in bb), len(w.data.vertices)))
for img in bpy.data.images:
    if img.source == "FILE" and not img.packed_file and os.path.exists(bpy.path.abspath(img.filepath)):
        img.pack()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out)
