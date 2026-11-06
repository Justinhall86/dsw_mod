"""Blender: remove the Ice Extractor's ice piles from the Ore Drill so nothing looks like it is meant to pour out.

    blender --background --factory-startup --python 41_clean_oredrill.py -- <in.fbx> <src_albedo.png> <out.fbx> [spouts]

A loose part is ice when it sits on the ground (max z <= ICE_TOP) and the source albedo under it is cyan
(blue > 1.4 x red). That catches the three piles (front under the wheel, right side, and the loose cubes front-left);
the base plate is grey, so it stays. The remaining parts are joined back into one mesh with their skin weights.

With the extra word "spouts" (used on WaterExtractor_Addon), the discharge elbows that bend down to the ground are cut
too, by bounding box (SPOUT_BOXES, metres, building-local; found with 40_parts_survey.py): the two elbows off the
right-hand tanks and the one at the front-left drum. Without them nothing on the drill looks like it should pour out.
"""
import sys

import bpy

ICE_TOP = 0.14
SPOUT_BOXES = [((0.90, 0.30, -0.05), (1.10, 0.75, 0.20)),      # right tanks: two elbows down to the ground
               ((-0.73, -0.92, -0.05), (-0.52, -0.80, 0.18))]  # front-left drum: elbow down to the ground
args = sys.argv[sys.argv.index("--") + 1:]
src, albedo, out = args[:3]
SPOUTS = "spouts" in args[3:]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=src)
img = bpy.data.images.load(albedo)
W, H = img.size
px = img.pixels[:]


def mean_rgb(o):
    uv = o.data.uv_layers.active
    if not uv:
        return (0, 0, 0)
    step = max(1, len(o.data.loops) // 60)
    cols = []
    for li in range(0, len(o.data.loops), step):
        u, v = uv.data[li].uv
        i = (int((v % 1) * (H - 1)) * W + int((u % 1) * (W - 1))) * 4
        cols.append(px[i:i + 3])
    return tuple(sum(c[k] for c in cols) / len(cols) for k in range(3))


meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
removed = kept = 0
for ob in meshes:
    name = ob.name
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    bpy.ops.object.mode_set(mode="EDIT")
    bpy.ops.mesh.select_all(action="SELECT")
    bpy.ops.mesh.separate(type="LOOSE")
    bpy.ops.object.mode_set(mode="OBJECT")
    parts = list(bpy.context.selected_objects)
    keep = []
    for p in parts:
        ws = [p.matrix_world @ v.co for v in p.data.vertices]
        zmax = max(w.z for w in ws)
        lo = [min(w[k] for w in ws) for k in range(3)]
        hi = [max(w[k] for w in ws) for k in range(3)]
        in_box = SPOUTS and any(all(a[k] <= lo[k] and hi[k] <= b[k] for k in range(3)) for a, b in SPOUT_BOXES)
        r, g, b = mean_rgb(p)
        if in_box or (zmax <= ICE_TOP and b > 1.4 * r and g > 1.25 * r):
            bpy.data.objects.remove(p, do_unlink=True)
            removed += 1
        else:
            keep.append(p)
    kept += len(keep)
    bpy.ops.object.select_all(action="DESELECT")
    for p in keep:
        p.select_set(True)
    bpy.context.view_layer.objects.active = keep[0]
    bpy.ops.object.join()
    keep[0].name = name
print("REMOVED", removed, "KEPT", kept)
bpy.ops.export_scene.fbx(filepath=out, use_selection=False, add_leaf_bones=False, bake_anim=False,
                         mesh_smooth_type="FACE")
