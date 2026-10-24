"""Build CaravanKulon.blend - both Kulon variants from the CaravanKulon unit folder.

    blender -b --python 07_build_kulon.py -- \
        --k1 <Kulon01_TRUE_FBX.fbx> --k2 <Kulon02_TRUE_FBX.fbx> \
        --textures <dir> --out <out.blend> [--title "Caravan Kulon"]

The folder Character/Fremen/Unit/CaravanKulon/Kulon/ holds two variants of the
same rigged beast:
  * Kulon01 - caravan pack animal (saddle bags + orange blanket)
  * Kulon02 - mobile-turret carrier (ammo crates + missiles)
The game's model F_Special_Kulon lists BOTH meshes.  This scene puts them side
by side, each wired to its own albedo / MetallicGlossAO / Normal set, and packs
every texture into the .blend.
"""
import os
import sys

import bpy
from mathutils import Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import script_args

argv = script_args()


def opt(flag, default=None):
    return argv[argv.index(flag) + 1] if flag in argv else default


k1 = opt("--k1")
k2 = opt("--k2")
tex_dir = os.path.abspath(opt("--textures"))
out_path = os.path.abspath(opt("--out"))
title = opt("--title", "Caravan Kulon")

if not k1 or not k2 or not out_path:
    raise SystemExit("usage: 07_build_kulon.py -- --k1 <fbx> --k2 <fbx> "
                     "--textures <dir> --out <blend>")

TEXTURES = {
    "Kulon01": "Fremen_Kulon_01",
    "Kulon02": "Fremen_Kulon_02",
}

bs.reset_scene()


def load_variant(path, key, x_offset, display):
    body, rig = bs.import_model(path)
    body.name = display
    body.data.name = display + "Mesh"
    if rig:
        rig.name = "Armature_" + key
        rig.data.name = "Armature_" + key
    if rig:
        rig.location.x += x_offset
    else:
        body.location.x += x_offset
    bpy.context.view_layer.update()

    stem = TEXTURES[key]
    wanted = {
        "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
        "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
        "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
    }
    for mat in body.data.materials:
        if not mat.use_nodes:
            continue
        for sock, name, path in bs.wire_textures(mat, wanted):
            print("   %-6s %-20s <- %s" % (key, sock, name))
    print("%s  verts %d tris %d  nodes %d"
          % (path, len(body.data.vertices), len(body.data.polygons),
             len(rig.data.bones) if rig else 0))
    return body, rig


b1, r1 = load_variant(k1, "Kulon01", -1.05, "Kulon01_Caravan")
b2, r2 = load_variant(k2, "Kulon02", 1.05, "Kulon02_TurretCarrier")

# ---- face both animals slightly inward for a readable group shot -----------
r1.rotation_euler.z = 0.0
r2.rotation_euler.z = 0.0
bpy.context.view_layer.update()

# ---- world / lights / camera ----------------------------------------------
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)

lo = Vector((1e9, 1e9, 1e9))
hi = Vector((-1e9, -1e9, -1e9))
for b in (b1, b2):
    blo, bhi = bs.model_bounds(b)
    lo = Vector((min(lo.x, blo.x), min(lo.y, blo.y), min(lo.z, blo.z)))
    hi = Vector((max(hi.x, bhi.x), max(hi.y, bhi.y), max(hi.z, bhi.z)))
centre = (lo + hi) / 2
scale = max(hi.z - lo.z, hi.x - lo.x, hi.y - lo.y) * 1.14
cam = bs.setup_camera(target=centre, ortho_scale=scale,
                      direction=(0.35, -1.0, 0.0), distance=scale * 3.0)
bs.setup_render(1600, 1000)

# ---- pack every texture so the .blend is portable -------------------------
packed = bs.pack_all_images()
print("   packed %d images into the .blend" % packed)

os.makedirs(os.path.dirname(out_path), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=out_path, compress=True)
print("SAVED %s (%.2f MB)" % (out_path, os.path.getsize(out_path) / 1e6))
