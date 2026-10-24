"""Step 3 - verify the preview .blends (packed textures, weapon follows the hand).

  blender -b --python 08_scripts/03_verify_preview_blends.py
"""
import os

import bpy

BLEND_DIR = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_guard\03_blender"
BONE = {"halberd": "B_Weapon", "gun": "B_Gun", "bazooka": "B_Gun"}
ok = True
for tag, bone in BONE.items():
    bpy.ops.wm.open_mainfile(filepath=os.path.join(BLEND_DIR, "landsraad_guard_%s_preview.blend" % tag))
    sc = bpy.context.scene
    rig = bpy.data.objects["Male01_LandsraadGuard"]
    body = bpy.data.objects["LandsraadGuard"]
    wp = [o for o in bpy.data.objects if o.type == "MESH" and o is not body][0]
    imgs = list(bpy.data.images)
    unpacked = [i.name for i in imgs if i.source == "FILE" and not i.packed_file]
    print("V", tag, "| images", len(imgs), "unpacked", unpacked, "| groups", len(body.vertex_groups),
          "| frames", sc.frame_start, sc.frame_end, "| weapon", wp.name, "parent", wp.parent_bone,
          "| cams", sorted(o.name for o in bpy.data.objects if o.type == "CAMERA"))
    dists = []
    for f in (sc.frame_start, (sc.frame_start + sc.frame_end) // 2, sc.frame_end):
        sc.frame_set(f)
        bpy.context.view_layer.update()
        hand = rig.matrix_world @ rig.pose.bones[bone].head
        origin = wp.matrix_world.translation
        dists.append(round((origin - hand).length, 3))
        print("V    frame %3d  hand %s  weapon origin %s  dist %.3f" % (
            f, tuple(round(v, 2) for v in hand), tuple(round(v, 2) for v in origin), dists[-1]))
    moved = len({round(rig.pose.bones[bone].head.x, 3) for _ in [0]}) > 0
    if unpacked or wp.parent_bone != bone or max(dists) - min(dists) > 0.02:
        ok = False
print("V RESULT", "OK" if ok else "PROBLEM")
