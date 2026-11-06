"""Pack every material of a unit into ONE material with ONE 2048 atlas (four 1024 quadrants) so the unit costs a single draw call.

    blender -b <in.blend> --python atlas_pack.py -- <out.blend> <out_dir> [--layout Mat_Commando,Mat_Duncan,Mat_Mercenary,Mat_Thorvald_Trim]

Each material's images (albedo, MetallicGlossAO, normal) are resized to 1024 and pasted into a quadrant (layout order: bottom-left, bottom-right,
top-left, top-right, in Blender UV space with v up).  Every UV loop of the faces that used that material is scaled by 0.5 and offset into the quadrant,
so the texel density does not change.  Materials with no faces are dropped.  Writes <out_dir>/Thorvald_{Albedo,MetallicGlossAO,Normal}.png, one material
`Mat_Thorvald` wired to them, and the packed blend.  Aborts if any UV lies outside 0..1 (tiled UVs cannot be packed this way).
"""
import os
import sys

import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import polish_lib as PL  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
OUT_BLEND, OUT_DIR = os.path.abspath(args[0]), os.path.abspath(args[1])
layout = ["Mat_Commando", "Mat_Duncan", "Mat_Mercenary", "Mat_Thorvald_Trim"]
if "--layout" in args:
    layout = args[args.index("--layout") + 1].split(",")
os.makedirs(OUT_DIR, exist_ok=True)
Q, SIZE = 1024, 2048
OFFS = {name: ((i % 2) * 0.5, (i // 2) * 0.5) for i, name in enumerate(layout)}

# 1. which materials are actually used, and UV range check
used = {}
for o in bpy.data.objects:
    if o.type != "MESH":
        continue
    uvl = o.data.uv_layers.active.data
    for p in o.data.polygons:
        m = o.data.materials[p.material_index]
        if m is None:
            continue
        used.setdefault(m.name, 0)
        used[m.name] += 1
        for li in p.loop_indices:
            u, v = uvl[li].uv
            if u < -0.002 or u > 1.002 or v < -0.002 or v > 1.002:
                raise SystemExit("UV outside 0..1 on %s / %s (%.3f, %.3f): tiled UVs cannot be packed" % (o.name, m.name, u, v))
print("PACK materials used:", used)
missing = [m for m in used if m not in OFFS]
if missing:
    raise SystemExit("materials without a quadrant: %s (use --layout)" % missing)

# 2. compose the atlas
atlas = {k: np.zeros((SIZE, SIZE, 4), np.float32) for k in ("Albedo", "MetallicGlossAO", "Normal")}
atlas["Normal"][..., 0:2] = 0.5
atlas["Normal"][..., 2] = 1.0
atlas["MetallicGlossAO"][..., 1] = 0.3
atlas["MetallicGlossAO"][..., 2] = 0.9
for k in atlas:
    atlas[k][..., 3] = 1.0
for name, (ou, ov) in OFFS.items():
    if name not in used:
        continue
    mat = bpy.data.materials[name]
    nodes = PL.material_images(mat)
    for kind, node in zip(("Albedo", "MetallicGlossAO", "Normal"), nodes):
        arr = PL.img_to_array(node.image)
        arr = PL.resize(arr, Q, Q)
        arr[..., 3] = 1.0
        x0 = int(round(ou * SIZE))
        y0 = int(round(ov * SIZE))
        atlas[kind][SIZE - y0 - Q:SIZE - y0, x0:x0 + Q] = arr
    print("PACK", name, "-> quadrant offset", (ou, ov))

# 3. write the atlas and wire ONE material
paths = {}
for kind, cs in (("Albedo", None), ("MetallicGlossAO", "Non-Color"), ("Normal", "Non-Color")):
    p = os.path.join(OUT_DIR, "Thorvald_%s.png" % kind)
    PL.array_to_img("Thorvald_%s" % kind, atlas[kind], p, cs)
    paths[kind] = p
proto = bpy.data.materials[layout[0]]
newmat = proto.copy()
newmat.name = "Mat_Thorvald"
bs.wire_textures(newmat, {"Base Color": paths["Albedo"], "Specular IOR Level": paths["MetallicGlossAO"], "Normal": paths["Normal"]})

# 4. remap UVs and materials
for o in bpy.data.objects:
    if o.type != "MESH":
        continue
    me = o.data
    uvl = me.uv_layers.active.data
    for p in me.polygons:
        m = me.materials[p.material_index]
        ou, ov = OFFS[m.name]
        for li in p.loop_indices:
            u, v = uvl[li].uv
            uvl[li].uv = (u * 0.5 + ou, v * 0.5 + ov)
        p.material_index = 0
    me.materials.clear()
    me.materials.append(newmat)
for m in list(bpy.data.materials):
    if m.users == 0:
        bpy.data.materials.remove(m)
for im in list(bpy.data.images):
    if im.users == 0:
        bpy.data.images.remove(im)
bs.pack_all_images()
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND, compress=True)
print("PACKED one material, atlas", SIZE, "->", OUT_BLEND)
