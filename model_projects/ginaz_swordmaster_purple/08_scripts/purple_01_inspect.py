"""Step 01 - inspect the base Ginaz body: part breakdown + front/back renders.

Run inside Blender.
"""
import bpy
import os
import sys

sys.path.insert(0, r"C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/ginaz_swordmaster_purple/08_scripts")
import importlib
import purple_common as pc
importlib.reload(pc)

obj = pc.get_mesh()
arm = pc.get_arm()

groups = ["B_Cape01", "B_Cape02", "B_Cape03", "B_Spine01J", "B_Spine02J", "B_SpineTopJ",
          "B_Neck01J", "B_HeadJ", "B_lClavicleJ", "B_rClavicleJ", "B_lShoulderJ", "B_rShoulderJ",
          "B_lElbowJ", "B_rElbowJ", "B_lForearmJ", "B_rForearmJ", "B_lWristJ", "B_rWristJ",
          "B_lHipJ", "B_rHipJ", "B_lKneeJ", "B_rKneeJ", "B_lAnkleJ", "B_rAnkleJ",
          "B_Scabbard", "B_Weapon", "B_Shield", "B_Gun"]

rep = pc.part_report(obj, groups)

# vertices by dominant group
dom = {}
for v in obj.data.vertices:
    best, bw = None, 0.0
    for g in v.groups:
        if g.weight > bw:
            bw, best = g.weight, obj.vertex_groups[g.group].name
    dom[best] = dom.get(best, 0) + 1

paths = pc.render_views("01_base", azimuths=(0.0, 90.0, 180.0, 270.0))

result = {
    "bbox": pc.mesh_bbox(obj),
    "parts": rep,
    "dominant_group_counts": dict(sorted(dom.items(), key=lambda kv: -kv[1])),
    "renders": paths,
    "images": [(i.name, i.filepath) for i in bpy.data.images if "Ginaz" in i.name],
}
