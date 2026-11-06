"""Write a render config for one asset and run render_asset.py in Blender.

    python run.py <asset> <stage> [--tex before|thorvald] [--parts 0,1] [--views front,back,three_quarter]
                  [--delete '<json list>'] [--blend] [--zoom 1.6]

Stills go to 02_progress_photos/<asset>/<stage>/<asset>_<view>.png; --blend saves 03_blender/<asset>_<stage>.blend.
--tex thorvald uses 04_textures/<asset>/<source albedo name> (made by 02_recolour.py).
"""
import json
import os
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from assets import ASSETS, PROJ, input_dir  # noqa: E402

BLENDER = os.environ.get("BLENDER_EXE", r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe")
HERE = os.path.dirname(os.path.abspath(__file__))


def opt(flag, default=None):
    return sys.argv[sys.argv.index(flag) + 1] if flag in sys.argv else default


def run(name, stage, tex="before", parts=None, views=("front", "back", "three_quarter"), delete=(), blend=False, zoom=1.0):
    a = ASSETS[name]
    ind = input_dir(name)
    models = [os.path.join(ind, os.path.splitext(m)[0] + ".fbx") for m in a["models"]]
    if parts is not None:
        models = [models[i] for i in parts]
    alb = (os.path.join(ind, a["before"]) if tex == "before"
           else os.path.join(PROJ, "04_textures", name, a["source"]))
    def mp(key):                   # data maps: the cleaned copy (04_textures/<asset>/clean/) when there is one
        if not a.get(key):
            return None
        c = os.path.join(PROJ, "04_textures", name, "clean", a[key])
        return c if tex != "before" and os.path.exists(c) else os.path.join(ind, a[key])

    photos = os.path.join(PROJ, "02_progress_photos", name, stage)
    cfg = dict(fbx=models, name=name, albedo=alb,
               mgao=mp("mgao"), normal=mp("normal"), emissive=mp("emissive"),
               front=a.get("front", "-Y"), delete=list(delete), zoom=zoom,
               stills={v: os.path.join(photos, "%s_%s.png" % (name, v)) for v in views})
    if blend:
        cfg["blend"] = os.path.join(PROJ, "03_blender", "%s_%s.blend" % (name, stage))
    os.makedirs(photos, exist_ok=True)
    cpath = os.path.join(photos, "_config.json")
    json.dump(cfg, open(cpath, "w"), indent=1)
    log = os.path.join(photos, "_render.log")
    with open(log, "w") as fh:
        subprocess.run([BLENDER, "-b", "--factory-startup", "--python", os.path.join(HERE, "render_asset.py"), "--", cpath],
                       stdout=fh, stderr=subprocess.STDOUT, check=True)
    for ln in open(log, encoding="utf-8", errors="replace"):
        if ln.startswith(("DELETED", "KEPT_OPEN", "BOUNDS", "SAVED", "Error", "Traceback")):
            print(name, stage, ln.rstrip())
    return cfg["stills"]


if __name__ == "__main__":
    p = opt("--parts")
    run(sys.argv[1], sys.argv[2], tex=opt("--tex", "before"),
        parts=[int(x) for x in p.split(",")] if p else None,
        views=opt("--views", "front,back,three_quarter").split(","),
        delete=json.loads(opt("--delete", "[]")), blend="--blend" in sys.argv, zoom=float(opt("--zoom", "1")))
