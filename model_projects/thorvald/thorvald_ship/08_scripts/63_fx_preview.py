"""Render a ship's hull (raw HMD geometry) with markers where an FX file puts its emitters.

    py -3.14 63_fx_preview.py <name> <hmd> <fx> [<fx2> ...] [--bone B_Body] [--out <dir>]

Orange = reactors (sized by their scale), white = lights, blue = trails, red = muzzles. Views: top, side, rear, three-quarter.
Output: <out>/<name>_fx.png (default out: ../02_progress_photos/fx_check).
"""
import importlib.util, json, os, subprocess, sys
import numpy as np
from PIL import Image, ImageDraw
HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("fxlib", os.path.join(HERE, "60_fx_lib.py")); L = importlib.util.module_from_spec(spec); spec.loader.exec_module(L)
args = [a for a in sys.argv[1:]]
bone = "B_Body"; out = os.path.join(os.path.dirname(HERE), "02_progress_photos", "fx_check")
if "--bone" in args: i = args.index("--bone"); bone = args[i + 1]; del args[i:i + 2]
if "--out" in args: i = args.index("--out"); out = args[i + 1]; del args[i:i + 2]
name, hmd, fxs = args[0], args[1], args[2:]
os.makedirs(out, exist_ok=True)
d = L.H.load(hmd)
V, T = [], []
for g in d.geometries:
    base = len(V)
    V += [list(v["position"]) for v in L.H.decode_vertices(d, g)]
    for grp in L.H.decode_indices(d, g):
        T += [[base + grp[k], base + grp[k + 1], base + grp[k + 2]] for k in range(0, len(grp) - 2, 3)]
bm = L.bone_matrix(d, bone)
marks = []
for fx in fxs:
    for n, q, s in L.anchors(L.load_fx(fx)):
        leaf = n.rsplit("/", 1)[-1]
        if leaf in ("Reactor", "Lights") or leaf.startswith(("Reactor_Little", "Reactor_Big", "ReactorHexagone", "polygon")):
            continue
        kind = "trail" if "trail" in leaf.lower() else "light" if "Light" in leaf else "muzzle" if "uzzle" in leaf else "reactor"
        p = L.to_model(q, bm)
        marks.append({"p": [float(x) for x in p], "kind": kind, "s": s, "name": leaf})
        print("  %-8s %-18s model (%.2f, %.2f, %.2f) scale %.2f" % (kind, leaf, p[0], p[1], p[2], s))
v = np.array(V); print("hull bounds", v.min(0).round(2), v.max(0).round(2))
job = os.path.join(out, name + "_job.json")
json.dump({"V": V, "T": T, "marks": marks, "out": out, "name": name}, open(job, "w"))
blender = next(e for e in (os.environ.get("BLENDER_EXE"), r"D:\Blender Foundation\Blender 5.2\blender.exe", r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe") if e and os.path.exists(e))
for attempt in range(4):
    try:
        subprocess.run([blender, "-b", "--factory-startup", "--python", os.path.join(HERE, "64_fx_preview_blender.py"), "--", job],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True, timeout=150); break
    except subprocess.TimeoutExpired:
        print("  blender timeout, retry")
tiles = [Image.open(os.path.join(out, "%s_%s.png" % (name, k))).convert("RGB") for k in ("top", "side", "rear", "tq")]
w, h = tiles[0].size
sheet = Image.new("RGB", (w * 4, h + 34), (28, 28, 32)); dr = ImageDraw.Draw(sheet)
for i, (t, cap) in enumerate(zip(tiles, ("top", "side", "rear", "three-quarter"))):
    sheet.paste(t, (i * w, 34)); dr.text((i * w + 8, 10), "%s  %s" % (name, cap), fill=(235, 235, 235))
sheet.save(os.path.join(out, name + "_fx.png")); print("sheet", os.path.join(out, name + "_fx.png"))
for k in ("top", "side", "rear", "tq"): os.remove(os.path.join(out, "%s_%s.png" % (name, k)))
os.remove(job)
