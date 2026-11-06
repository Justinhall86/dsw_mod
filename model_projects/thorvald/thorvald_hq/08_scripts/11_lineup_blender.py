"""Blender side of 11_lineup.py."""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import hq_scene as S  # noqa: E402
from mathutils import Vector  # noqa: E402

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
S.reset()
allm = []
for it in cfg["items"]:
    mats = {k: S.material(k, **v) for k, v in it["mats"].items()}
    ms = []
    for f in it["fbx"]:
        _, m = S.load(f, mats, loc=(it["x"], 0, 0), rot_z=it["rot"], scale=it["scale"])
        ms += m
    lo, hi = S.bounds(ms)
    print("SIZE", it["label"], "x %.1f y %.1f z %.1f" % tuple(hi - lo))
    allm += ms
lo, hi = S.bounds(allm)
c = (lo + hi) / 2
c.z = 4
cam = S.lights_and_camera(c, 150)
S.shoot(cam, c, -60, 35, cfg["out_3q"], px=(1800, 900))
cam.data.ortho_scale = 160
S.shoot(cam, c, -90, 89.5, cfg["out_top"], px=(1800, 900))
