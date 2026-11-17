"""Export the copper starport as the Consignment Terminal's game model (Blender part).

    blender -b 03_blender/Thorvald_Starport_v1.blend --python 08_scripts/10_export_building.py -- <project>

Writes 05_fbx_export/ThorvaldConsignmentTerminal.fbx: one unskinned mesh, one material Mat_ThorvaldStarport, textures
embedded (Albedo on Base Color, MetallicGlossAO on Specular IOR Level, Normal through a normal-map node), the wiring
the toolkit's converter expects. Sized like the vanilla Spacing Guild Branch (footprint ~5.5 units before the
building row's scale), centred on the origin, base at z = 0. Textures are resized to 1024 and the AO channel lifted
(the albedo is already shaded by AO; vanilla AO is bright, mean ~230).
"""
import os
import sys

import bpy
import numpy as np
from mathutils import Matrix, Vector

PROJECT = sys.argv[sys.argv.index("--") + 1]
OUT = os.path.join(PROJECT, "05_fbx_export", "ThorvaldConsignmentTerminal.fbx")
FOOTPRINT = 5.5
TEX = 1024

ob = bpy.data.objects["Thorvald_Starport"]
for o in list(bpy.data.objects):
    if o is not ob:
        bpy.data.objects.remove(o, do_unlink=True)

# ---- size and place
me = ob.data
me.transform(ob.matrix_world)
ob.matrix_world = Matrix.Identity(4)
co = np.array([v.co[:] for v in me.vertices])
lo, hi = co.min(0), co.max(0)
s = FOOTPRINT / max(hi[0] - lo[0], hi[1] - lo[1])
off = Vector((-(lo[0] + hi[0]) / 2, -(lo[1] + hi[1]) / 2, -lo[2]))
me.transform(Matrix.Diagonal((s, s, s, 1)) @ Matrix.Translation(off))
co = np.array([v.co[:] for v in me.vertices])
print("@@scale %.3f  bounds min %s max %s" % (s, co.min(0).round(3), co.max(0).round(3)))
for a in list(me.color_attributes):
    me.color_attributes.remove(a)

# ---- textures: 1024, AO lifted
mat = me.materials[0]
mat.name = "Mat_ThorvaldStarport"
nt = mat.node_tree
imgs = {n.image.name: n for n in nt.nodes if n.type == "TEX_IMAGE" and n.image}


def resized(name, fn=None):
    img = bpy.data.images[name]
    img.scale(TEX, TEX)
    if fn:
        px = np.array(img.pixels[:], dtype=np.float32).reshape(TEX, TEX, 4)
        fn(px)
        img.pixels.foreach_set(px.ravel())
    img.update()
    img.pack()
    return img


def lift_ao(px):
    px[..., 2] = 0.55 + 0.45 * px[..., 2]


alb = resized("Thorvald_Starport_Albedo")
mga = resized("Thorvald_Starport_MetallicGlossAO", lift_ao)
nrm = resized("Thorvald_Starport_Normal")

# ---- rewire the material exactly as the converter expects
for n in list(nt.nodes):
    nt.nodes.remove(n)
out = nt.nodes.new("ShaderNodeOutputMaterial")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
nt.links.new(bsdf.outputs[0], out.inputs[0])


def tex(img, colorspace):
    n = nt.nodes.new("ShaderNodeTexImage")
    n.image = img
    img.colorspace_settings.name = colorspace
    return n


nt.links.new(tex(alb, "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(tex(mga, "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
nm = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(tex(nrm, "Non-Color").outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
for img, stem in ((alb, "Albedo"), (mga, "MetallicGlossAO"), (nrm, "Normal")):
    img.name = "ThorvaldConsignmentTerminal_" + stem
    img.filepath_raw = "//ThorvaldConsignmentTerminal_%s.png" % stem
    img.file_format = "PNG"

me.name = ob.name = "ThorvaldConsignmentTerminal"
os.makedirs(os.path.dirname(OUT), exist_ok=True)
for o in bpy.data.objects:
    o.select_set(o is ob)
bpy.context.view_layer.objects.active = ob
bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", bake_anim=False, path_mode="COPY",
    embed_textures=True, apply_scale_options="FBX_SCALE_UNITS", mesh_smooth_type="OFF")
print("@@exported", OUT, os.path.getsize(OUT), "bytes,", len(me.polygons), "faces")
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJECT, "03_blender", "ThorvaldConsignmentTerminal_game.blend"))
