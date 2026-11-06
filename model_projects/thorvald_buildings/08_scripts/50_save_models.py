"""Save each Thorvald building as a self-contained .blend (textures packed) and an FBX.

    python 50_save_models.py                 # all
    python 50_save_models.py OreDrill        # just these

Needs 20_recolour.py and 30_render.py first (30 converts the donor HMDs and caches the FBX + textures).
Writes ../03_blender/<Building>.blend and ../05_fbx_export/<Building>.fbx. The FBX keeps the donor's node and skin
layout, so it can go back through the HMD toolkit later; that step and the cdb rows are not done (install only when asked).
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
argv, sys.argv = sys.argv[1:], sys.argv[:1]
R = __import__("30_render")
B = R.B

BLENDER_SIDE = r'''
import bpy, json, sys
cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
bpy.ops.wm.read_factory_settings(use_empty=True)
for f in cfg["fbx"]:
    bpy.ops.import_scene.fbx(filepath=f)
# the imported FBX carries the donor's own material and image paths (not on disk); drop them before packing
for o in bpy.context.scene.objects:
    if o.type == "MESH":
        o.data.materials.clear()
for m in list(bpy.data.materials):
    bpy.data.materials.remove(m)
for im in list(bpy.data.images):
    bpy.data.images.remove(im)
mat = bpy.data.materials.new("Mat_" + cfg["name"])
mat.use_nodes = True
nt = mat.node_tree
bsdf = nt.nodes["Principled BSDF"]
def tex(path, cs):
    n = nt.nodes.new("ShaderNodeTexImage")
    n.image = bpy.data.images.load(path)
    n.image.colorspace_settings.name = cs
    return n
nt.links.new(tex(cfg["albedo"], "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
nm = nt.nodes.new("ShaderNodeNormalMap")
nt.links.new(tex(cfg["normal"], "Non-Color").outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.6
if cfg.get("emissive"):
    nt.links.new(tex(cfg["emissive"], "sRGB").outputs["Color"], bsdf.inputs["Emission Color"])
    bsdf.inputs["Emission Strength"].default_value = 1.0
for o in bpy.context.scene.objects:
    if o.type == "MESH":
        o.data.materials.clear()
        o.data.materials.append(mat)
bpy.ops.file.pack_all()
bpy.ops.wm.save_as_mainfile(filepath=cfg["blend"])
bpy.ops.export_scene.fbx(filepath=cfg["out_fbx"], add_leaf_bones=False, bake_anim=False, mesh_smooth_type="FACE")
print("SAVED", cfg["blend"], cfg["out_fbx"])
'''


def save(name):
    folder, models, mgao, normal, emissive = R.MODELS[name]
    d = os.path.join(R.STRUCT, *folder.split("/"))
    td = os.path.join(R.SCR, name, "tex")
    fbx = [os.path.join(PROJ, m[5:]) if m.startswith("proj:") else
           os.path.join(td, os.path.splitext(m)[0] + "_real.fbx") for m in models]
    cfg = dict(name=name, fbx=fbx, albedo=os.path.join(R.TEX, name, "albedo.png"),
               normal=B.dds_as_png(os.path.join(d, normal), os.path.join(td, "normal.png")),
               emissive=B.dds_as_png(os.path.join(d, emissive), os.path.join(td, "emissive.png")) if emissive else None,
               blend=os.path.join(PROJ, "03_blender", name + ".blend"),
               out_fbx=os.path.join(PROJ, "05_fbx_export", name + ".fbx"))
    side = os.path.join(R.SCR, "save_side.py")
    open(side, "w").write(BLENDER_SIDE)
    cp = os.path.join(R.SCR, name + "_save.json")
    json.dump(cfg, open(cp, "w"))
    r = subprocess.run([B.BLENDER, "--background", "--factory-startup", "--python", side, "--", cp],
                       capture_output=True, text=True)
    print(next((ln for ln in r.stdout.splitlines() if ln.startswith("SAVED")), "FAIL " + name + "\n" + r.stdout[-800:]))


if __name__ == "__main__":
    for n in R.MODELS:
        if not argv or n in argv:
            save(n)
