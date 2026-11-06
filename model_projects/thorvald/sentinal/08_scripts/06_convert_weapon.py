"""Step 06 - convert a game weapon file into a real FBX, ready for Blender.

    python 06_convert_weapon.py -- <weapon.file> <out.fbx>

The game stores weapons as **HMD files with an `.fbx` extension**.  Blender
cannot open them, and the toolkit's `hmd2fbx` only handles a single-model
HMD - it raises:

    NotImplementedError: expected 1 model, got 2

A weapon HMD typically holds TWO models: the real mesh and a geometry-less
helper (for the Maula rifle: `Maula_RiffleG` with `geometry = -1`, and
`MaulaRifle` with the real geometry).  This script drops the geometry-less
models and converts the one that has geometry.

It also reports the `Cube` helper mesh, which the weapon FBX carries as a
2x2x2 m bounds reference.  It must be DELETED after import or it renders as
a giant slab over the character.

This is the same fix the main `hmd_to_true_fbx.py` applies, but scoped to a
single weapon file and with the geometry-less model handling made explicit.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from dsw_core import cfg, script_args  # noqa: E402

TK = cfg("toolkit_dir")
sys.path.insert(0, os.path.join(TK, "Models"))
import hmd_reader as H  # noqa: E402
import hmd2fbx  # noqa: E402

argv = script_args()
if len(argv) < 2:
    raise SystemExit("usage: 06_convert_weapon.py -- <weapon.file> <out.fbx>")

src = os.path.abspath(argv[0])
dst = os.path.abspath(argv[1])
os.makedirs(os.path.dirname(dst), exist_ok=True)

head = open(src, "rb").read(16)
if not head.startswith(b"HMD"):
    print("%s is not an HMD (magic %r) - Blender can open it directly."
          % (src, head[:8]))
    raise SystemExit(0)

d = H.load(src)
print("HMD models: %d   geometries: %d" % (len(d.models), len(d.geometries)))
for i, m in enumerate(d.models):
    print("   model %d  %-20r geometry %d  parent %d"
          % (i, m.name, m.geometry, m.parent))

real = [i for i, m in enumerate(d.models) if m.geometry >= 0]
if not real:
    raise SystemExit("no model with geometry - nothing to convert")
if len(real) > 1:
    print("  %d models have geometry; converting the first (%r)"
          % (len(real), d.models[real[0]].name))

# Keep only the models that have geometry, so hmd2fbx sees exactly one.
# hmd2fbx.convert() re-loads the file itself, so the loader is what has to be
# patched - filtering d.models in place would have no effect.
if len(d.models) > 1:
    keep = real[0]
    print("  dropping the geometry-less helper model(s)")

    _orig_load = H.load

    def _filtered_load(path, *a, **kw):
        data = _orig_load(path, *a, **kw)
        data.models = [data.models[keep]]
        data.models[0].parent = -1
        return data

    hmd2fbx.H.load = _filtered_load
    try:
        hmd2fbx.convert(src, dst, verbose=True)
    finally:
        hmd2fbx.H.load = _orig_load
else:
    hmd2fbx.convert(src, dst, verbose=True)
print("SAVED", dst, os.path.getsize(dst), "bytes")
print("REMINDER: delete the 'Cube' helper mesh after importing this FBX "
      "into Blender - it is a 2x2x2 m bounds box and renders as a slab.")
