"""Blender part: turn a textured mesh in a .blend into the static FBX the game converter expects.

    blender -b <file.blend> --python export_building.py -- <project> --object <BlendObject> --name <GameName>
            --albedo <img> --mga <img> --normal <img> [--footprint 5.5] [--tex 1024] [--ao-lift 0.55]

<img> are image datablock names in the .blend. Writes <project>/05_fbx_export/<GameName>.fbx and
<project>/03_blender/<GameName>_game.blend. What it does, and why:
  - keeps only --object, bakes its transform, scales the larger XY extent to --footprint (Guild Branch ~5.2-5.5),
    centres it, base at z = 0 (the building row's own scale applies on top);
  - drops colour attributes (an extra vertex input the static format does not have);
  - resizes textures to --tex and lifts the AO (blue) channel of MetallicGlossAO: B = lift + (1-lift)*B,
    because baked albedos are already AO-shaded and vanilla AO is bright (mean ~230);
  - rewires ONE material exactly as HMD_toolkit convert_fbx reads it: Albedo -> Base Color (sRGB),
    MetallicGlossAO -> Specular IOR Level (Non-Color), Normal -> Normal Map node -> Normal; images named
    <GameName>_{Albedo,MetallicGlossAO,Normal};
  - exports Z-up, forward Y, embedded textures, no animation.
"""
import argparse
import os
import sys

import bpy
import numpy as np
from mathutils import Matrix, Vector

ap = argparse.ArgumentParser()
ap.add_argument("project")
ap.add_argument("--object", required=True)
ap.add_argument("--name", required=True)
ap.add_argument("--albedo", required=True)
ap.add_argument("--mga", required=True)
ap.add_argument("--normal", required=True)
ap.add_argument("--footprint", type=float, default=5.5)
ap.add_argument("--tex", type=int, default=1024)
ap.add_argument("--ao-lift", type=float, default=0.55)
A = ap.parse_args(sys.argv[sys.argv.index("--") + 1:])
OUT = os.path.join(A.project, "05_fbx_export", A.name + ".fbx")

ob = bpy.data.objects[A.object]
for o in list(bpy.data.objects):          # iterate bpy.data, not view_layer: view_layer yields None after removals
    if o is not ob:
        bpy.data.objects.remove(o, do_unlink=True)

me = ob.data
me.transform(ob.matrix_world)
ob.matrix_world = Matrix.Identity(4)
co = np.array([v.co[:] for v in me.vertices])
lo, hi = co.min(0), co.max(0)
s = A.footprint / max(hi[0] - lo[0], hi[1] - lo[1])
off = Vector((-(lo[0] + hi[0]) / 2, -(lo[1] + hi[1]) / 2, -lo[2]))
me.transform(Matrix.Diagonal((s, s, s, 1)) @ Matrix.Translation(off))
co = np.array([v.co[:] for v in me.vertices])
print("@@scale %.3f  bounds min %s max %s" % (s, co.min(0).round(3), co.max(0).round(3)))
for a in list(me.color_attributes):
    me.color_attributes.remove(a)
while len(me.materials) > 1:              # the static format: one material
    me.materials.pop(index=len(me.materials) - 1)

mat = me.materials[0]
mat.name = "Mat_" + A.name
nt = mat.node_tree
T = A.tex


def resized(name, fn=None):
    img = bpy.data.images[name]
    img.scale(T, T)
    if fn:
        px = np.array(img.pixels[:], dtype=np.float32).reshape(T, T, 4)
        fn(px)
        img.pixels.foreach_set(px.ravel())
    img.update()
    img.pack()
    return img


def lift_ao(px):
    px[..., 2] = A.ao_lift + (1 - A.ao_lift) * px[..., 2]


alb = resized(A.albedo)
mga = resized(A.mga, lift_ao if A.ao_lift > 0 else None)
nrm = resized(A.normal)

for n in list(nt.nodes):
    nt.nodes.remove(n)
out = nt.nodes.new("ShaderNodeOutputMaterial")
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
nt.links.new(bsdf.outputs[0], out.inputs[0])


def tex(img, cs):
    n = nt.nodes.new("ShaderNodeTexImage")
    n.image = img
    img.colorspace_settings.name = cs
    return n


nt.links.new(tex(alb, "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
nt.links.new(tex(mga, "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
nm = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(tex(nrm, "Non-Color").outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
for img, stem in ((alb, "Albedo"), (mga, "MetallicGlossAO"), (nrm, "Normal")):
    img.name = "%s_%s" % (A.name, stem)
    img.filepath_raw = "//%s_%s.png" % (A.name, stem)
    img.file_format = "PNG"

me.name = ob.name = A.name
os.makedirs(os.path.dirname(OUT), exist_ok=True)
for o in bpy.data.objects:
    o.select_set(o is ob)
bpy.context.view_layer.objects.active = ob
bpy.ops.export_scene.fbx(
    filepath=OUT, use_selection=True, axis_forward="Y", axis_up="Z", bake_anim=False, path_mode="COPY",
    embed_textures=True, apply_scale_options="FBX_SCALE_UNITS", mesh_smooth_type="OFF")
print("@@exported", OUT, os.path.getsize(OUT), "bytes,", len(me.polygons), "faces")
os.makedirs(os.path.join(A.project, "03_blender"), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(A.project, "03_blender", A.name + "_game.blend"))
