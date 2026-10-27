"""Point Mat_Thorvald_Trim at the repainted 2048 atlas and save the polish blend.

    blender -b Thorvald_Trooper_v8_polish.blend --python apply_trim.py -- <trim_dir> <out_blend>

Image datablock names are preserved (rename the old ones aside) so downstream export scripts keep working.
"""
import os
import sys

import bpy

argv = sys.argv[sys.argv.index("--") + 1:]
TRIM_DIR, OUT = os.path.abspath(argv[0]), os.path.abspath(argv[1])

NEW = {
    "albedo": (os.path.join(TRIM_DIR, "Trim_Albedo.png"), "sRGB"),
    "mg": (os.path.join(TRIM_DIR, "Trim_MetallicGlossAO.png"), "Non-Color"),
    "nrm": (os.path.join(TRIM_DIR, "Trim_Normal.png"), "Non-Color"),
}

mat = bpy.data.materials["Mat_Thorvald_Trim"]
if mat.node_tree is None:
    raise SystemExit("Mat_Thorvald_Trim has no node tree")

for node in list(mat.node_tree.nodes):
    if node.type != "TEX_IMAGE" or node.image is None:
        continue
    img = node.image
    hint = (img.name + " " + node.label + " " + node.name).lower()
    if "albedo" in hint or "base" in hint or "diffuse" in hint:
        kind = "albedo"
    elif "normal" in hint or "nrm" in hint:
        kind = "nrm"
    elif "metal" in hint or "gloss" in hint or "spec" in hint or "mg" in hint:
        kind = "mg"
    else:
        target = node.outputs[0].links[0].to_socket.name.lower() if node.outputs[0].links else ""
        if "normal" in target:
            kind = "nrm"
        elif "spec" in target or "metal" in target or "rough" in target:
            kind = "mg"
        else:
            kind = "albedo"
    path, cs = NEW[kind]
    old_name = img.name
    if img.users <= 1 or img.name.startswith("Trim"):
        img.name = old_name + "_v8old"
    ni = bpy.data.images.load(path, check_existing=False)
    ni.name = old_name
    ni.colorspace_settings.name = cs
    node.image = ni
    print("APPLIED %-22s -> %s (%s)" % (old_name, os.path.basename(path), cs))

if os.path.abspath(OUT) == os.path.abspath(bpy.data.filepath):
    raise SystemExit("refusing to overwrite the input blend")
bpy.ops.wm.save_as_mainfile(filepath=OUT, compress=True)
print("SAVED", OUT)
