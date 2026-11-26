"""Put a variant's painted textures (41_paint.py) on its built geometry and save the textured, self-contained blend.

    blender -b --factory-startup --python 42_apply_paint.py -- <variant> [<variant> ...]

Reads 03_blender/variants/<variant>_geo.blend and 04_textures/<variant>/<Material>_{Albedo,MetallicGlossAO,Normal}.png,
writes 03_blender/variants/<variant>.blend with the images packed. Wiring is the toolkit's (Albedo -> Base Color,
MGAO -> Specular IOR Level, Normal map); renders apply the game-like preview wiring on top, never saved.
"""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import drone_scene as ds  # noqa: E402

VDIR = os.path.join(ds.PROJ, "03_blender", "variants")
for var in sys.argv[sys.argv.index("--") + 1:]:
    bpy.ops.wm.open_mainfile(filepath=os.path.join(VDIR, var + "_geo.blend"))
    tex = os.path.join(ds.PROJ, "04_textures", var)
    for m in list(bpy.data.materials):
        if not m.users or not m.name.startswith("Mat_ThDrone"):
            continue
        base = m.name.split(".")[0]
        files = [os.path.join(tex, "%s_%s.png" % (base, s)) for s in ("Albedo", "MetallicGlossAO", "Normal")]
        missing = [f for f in files if not os.path.exists(f)]
        if missing:
            raise SystemExit("missing %s" % missing)
        ds.pbr_mat(m.name, *files)
    for img in list(bpy.data.images):
        if img.users == 0:
            bpy.data.images.remove(img)
        elif not img.packed_file:
            img.pack()
    out = os.path.join(VDIR, var + ".blend")
    bpy.ops.wm.save_as_mainfile(filepath=out)
    print("PAINTED", out, sorted(i.name for i in bpy.data.images))
