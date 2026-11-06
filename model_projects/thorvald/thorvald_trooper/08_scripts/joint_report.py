"""Print arm joint positions (rest) from the rig and from the mesh weights, to place geometry that must rotate with a joint.
    blender -b <unit.blend> --python joint_report.py"""
import bpy
import numpy as np
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
mw = rig.matrix_world
for side in ("l", "r"):
    for n in ("Clavicle", "Shoulder", "Elbow", "Forearm", "Wrist"):
        b = rig.data.bones["B_%s%sJ" % (side, n)]
        h, t = mw @ b.head_local, mw @ b.tail_local
        print("JR bone %-12s head (%.3f %.3f %.3f) tail (%.3f %.3f %.3f)" % (b.name, *h, *t))
base = bpy.data.objects["Commando"]
names = {g.index: g.name for g in base.vertex_groups}
for bone in ("B_lShoulderJ", "B_lClavicleJ"):
    pts = []
    for v in base.data.vertices:
        if v.groups:
            g = max(v.groups, key=lambda x: x.weight)
            if names[g.group] == bone:
                pts.append(list(base.matrix_world @ v.co))
    pts = np.array(pts)
    print("JR mesh %-13s n %3d  centroid (%.3f %.3f %.3f)  x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f" % (bone, len(pts), *pts.mean(0), pts[:,0].min(), pts[:,0].max(), pts[:,1].min(), pts[:,1].max(), pts[:,2].min(), pts[:,2].max()))
