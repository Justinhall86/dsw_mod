"""Step 04 - preview the kitbashed purple pieces (coat + topknot) on the base body.

Run inside Blender.
"""
import bpy
import os
import sys
import importlib

sys.path.insert(0, r"C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/ginaz_swordmaster_purple/08_scripts")
import purple_common as pc
importlib.reload(pc)

# preview material for the new parts (matte plum) so they read against the body
coat = bpy.data.objects.get("Coat")
bun = bpy.data.objects.get("Bun")
for ob in (coat, bun):
    if ob is None:
        continue
    ob.data.materials.clear()
    m = bpy.data.materials.get("Mat_PreviewPurple") or bpy.data.materials.new("Mat_PreviewPurple")
    m.use_nodes = True
    nt = m.node_tree
    for n in list(nt.nodes):
        if n.type == 'BSDF_PRINCIPLED':
            nt.nodes.remove(n)
    b = nt.nodes.new("ShaderNodeBsdfPrincipled")
    out = next(n for n in nt.nodes if n.type == 'OUTPUT_MATERIAL')
    b.inputs["Base Color"].default_value = (0.30, 0.13, 0.17, 1.0)
    b.inputs["Roughness"].default_value = 0.6
    nt.links.new(b.outputs["BSDF"], out.inputs["Surface"])
    ob.data.materials.append(m)

paths = pc.render_views("02_coat", azimuths=(0.0, 90.0, 180.0, 270.0))
result = {"renders": paths}
