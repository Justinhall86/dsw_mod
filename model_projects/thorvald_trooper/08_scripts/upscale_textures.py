"""Generic texture upscale for any unit blend: sharper textures, relief, metal flags, optional per-unit painting hook.

    blender -b <unit.blend> --python upscale_textures.py -- <out_dir> <tag> [options]

    --scale N              default for every material (2 = 512 -> 1024).  Default 2.
    --scale-mat NAME=N     override per material name (substring match), e.g. --scale-mat Raider=1 for an already 2048 map.
    --max-size N           never go beyond N px on an edge (default 2048; vanilla ships 512-2048).
    --sharpen A            unsharp amount after the resize (default 0.55; 0 = off).
    --weave S              fabric twill micro-normal strength (default 0 = off; 0.035 is subtle). Needs --weave-mat.
    --weave-mat NAME       material names (substring) that are cloth; repeatable.
    --no-auto-metal        do not flag gold-coloured paint as metal in MetallicGlossAO.
    --skip-mat NAME        leave a material alone (the generated gold, a vanilla part you do not want to change); repeatable.
    --hook FILE.py         per-unit painting, see below.
    --save-blend PATH      write the upscaled blend (default <blend dir>/<name>_<tag>.blend; never overwrites the input).

The pass, per material, per map:
  albedo  -> resized, unsharp mask, optional painting (anti-aliased, with relief), emboss + contact shade from the relief
  MetallicGlossAO -> resized; gold-hued paint raised to metallic 0.9 / gloss 0.72; alpha forced to 255
  normal  -> resized, relief from painting (and twill) added to the ORIGINAL normal map, renormalised; alpha 255
Every PNG is written RGBA with alpha 255 (what the game converter wants) and the material nodes are re-pointed at the new images.

HOOK FILE (optional).  A module-level script that may define:
    def region_of(obj, tri): -> int        region id (>0) for a triangle; default 1 for everything
    def paint(ctx): -> dict | None         called once per (object, material) AFTER rasterising the mesh into the texture
          ctx.obj, ctx.mat, ctx.slot, ctx.cv (polish_lib.Canvas), ctx.P (H,W,3 rest-pose position in metres), ctx.R (H,W region ids),
          ctx.fp (texel size in metres), ctx.PL (polish_lib), ctx.np.
          Paint with ctx.cv.paint(coverage, rgb, height_m, gold_bool); set ctx.cv.cloth = mask for twill.
          Return {"weave": s, "relief": 1.0, "emboss": 0.3} to override for this material.
See examples/hook_example.py.  Hooks make the pass unit-specific; without one it is a clean, sharper, metal-aware x2.
"""
import importlib.util
import os
import sys
import types

import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import polish_lib as PL  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG = os.path.abspath(argv[0]), argv[1]
opts = argv[2:]


def opt(name, default=None, many=False):
    vals = [opts[i + 1] for i, a in enumerate(opts) if a == name and i + 1 < len(opts)]
    if many:
        return vals
    return vals[0] if vals else default


SCALE = int(opt("--scale", 2))
MAX_SIZE = int(opt("--max-size", 2048))
SHARPEN = float(opt("--sharpen", 0.55))
WEAVE = float(opt("--weave", 0.0))
WEAVE_MATS = opt("--weave-mat", many=True)
SKIP = opt("--skip-mat", many=True) + ["Mat_GinazGold"]
SCALE_MAT = {}
for kv in opt("--scale-mat", many=True):
    k, v = kv.split("=")
    SCALE_MAT[k] = int(v)
AUTO_METAL = "--no-auto-metal" not in opts
HOOK = None
if opt("--hook"):
    spec = importlib.util.spec_from_file_location("upscale_hook", os.path.abspath(opt("--hook")))
    HOOK = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(HOOK)
os.makedirs(OUT, exist_ok=True)


def scale_for(mat, w, h):
    s = SCALE
    for k, v in SCALE_MAT.items():
        if k in mat.name:
            s = v
    while s > 1 and max(w, h) * s > MAX_SIZE:
        s -= 1
    return max(s, 1)


def region_default(obj, tri):
    return 1


region_of = getattr(HOOK, "region_of", region_default) if HOOK else region_default
done = {}
log = []
for obj in sorted((o for o in bpy.data.objects if o.type == "MESH"), key=lambda o: o.name):
    for mi, mat in enumerate(obj.data.materials):
        if mat is None or not mat.use_nodes or any(k in mat.name for k in SKIP):
            continue
        a_node, m_node, n_node = PL.material_images(mat)
        if a_node is None or a_node.image is None:
            continue
        key = mat.name
        if key in done:            # one material shared by two objects: textures were already rewritten, the nodes point at them
            continue
        w, h = a_node.image.size
        s = scale_for(mat, w, h)
        nodes, A, MG, NM = PL.load_material_arrays(mat, s, SHARPEN)
        H, W = A.shape[:2]
        needs_raster = HOOK is not None or (WEAVE > 0 and any(k in mat.name for k in WEAVE_MATS))
        if needs_raster:
            P, R = PL.rasterise(obj, W, H, region_of)[mi]
            fp = PL.footprint(P, R)
        else:
            P, R, fp = np.zeros((H, W, 3), np.float32), np.ones((H, W), np.int16), 0.002
        cv = PL.Canvas(A, MG, NM, P, R, fp)
        settings = dict(weave=0.0, relief=1.0, emboss=0.32)
        if WEAVE > 0 and any(k in mat.name for k in WEAVE_MATS):
            cv.cloth = (R != 0).astype(np.float32)
            settings["weave"] = WEAVE
        if HOOK is not None and hasattr(HOOK, "paint"):
            ctx = types.SimpleNamespace(obj=obj, mat=mat, slot=mi, cv=cv, P=P, R=R, fp=fp, PL=PL, np=np)
            ret = HOOK.paint(ctx)
            if ret:
                settings.update(ret)
        cv.finalize(relief=settings["relief"], emboss=settings["emboss"], ao=0.5, weave=settings["weave"], auto_gold=AUTO_METAL)
        PL.store_material(mat, nodes, cv.arrays(), OUT, "%s_%d_%s" % (obj.name, mi, TAG))
        done[key] = (W, H)
        log.append("%-22s %-20s %4dx%-4d -> %4dx%-4d (x%d)%s" % (obj.name, mat.name, w, h, W, H, s, "  painted" if HOOK else ""))
        print("UPSCALED", log[-1])

src = bpy.data.filepath
dst = opt("--save-blend") or os.path.join(os.path.dirname(src), "%s_%s.blend" % (os.path.splitext(os.path.basename(src))[0], TAG))
if os.path.abspath(dst) == os.path.abspath(src):
    raise SystemExit("refusing to overwrite the input blend")
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(dst), compress=True)
print("SAVED", dst)
print("MATERIALS", len(done))
