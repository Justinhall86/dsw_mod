"""Render candidate components (box cuts of donor parts) in 3/4 view, plus a labelled contact sheet.
    python 24_component_sheet.py <outdir>      (edit COMPONENTS below)
Each entry: label, donor key, box_abs [x0,x1,y0,y1,z0,z1] in the donor's baked space (strict cut)."""
import json, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
BLENDER = r"D:\Blender Foundation\Blender 5.2\blender.exe"

COMPONENTS = [
    ("hex_nozzle_cluster", "stockdrone", [-0.3, 1.35, -0.7, 0.7, -0.65, -0.05], False),
    ("rocket_pod_4tube",   "kuloncannon", [-0.9, -0.05, -0.9, 1.0, 1.6, 2.4], False),
    ("radar_dish",         "kuloncannon", [0.0, 0.95, 0.05, 0.8, 1.85, 2.75]),
    ("twin_cannon",        "dronecanon", [-1.05, -0.1, -0.5, 0.5, 0.7, 1.5], False),
    ("front_intake_visor", "ravshuttle", [-2.0, -1.0, -0.7, 0.8, 0.6, 1.6]),
    ("engine_pod_pylon",   "carryall", [-3.05, -0.9, 0.55, 1.4, 0.6, 1.8]),
    ("kraken_carapace",    "kraken", [-2.3, 2.3, -3.6, 3.6, 1.15, 2.4]),
    ("hammer_engine_pod",  "hammer", [-0.8, 0.8, -1.2, 0.2, -0.5, 0.3]),
    ("tank_gun",           "tank", [-0.7, 2.2, -0.45, 0.45, 1.05, 2.2]),
]

if "--" in sys.argv:      # running inside blender
    import importlib, bpy
    sys.path.insert(0, HERE)
    B = importlib.import_module("20_build_variant")
    bs, pw = B.bs, B.pw
    from mathutils import Vector
    argv = sys.argv[sys.argv.index("--") + 1:]
    label, key, out = argv[0], argv[1], argv[2]
    box = [float(v) for v in argv[3].split(",")]
    strict = (argv[4] != "0") if len(argv) > 4 else True
    bs.reset_scene()
    rel, stem = B.donor(key)
    objs = B.import_and_flatten(rel, "d")
    kept, total = B.cut_box(objs, box, strict)
    print("KEPT", label, kept, total)
    if kept:
        B.drop_fragments(objs, 4)
        mat = B.make_material("Mat_d", B.texture_paths(stem), "steel")
        B.apply_material(objs, mat); pw.soften_world(); pw.gamelike(mat)
        mn, mx = B.bounds(objs); c = (mn + mx) / 2; span = max(mx - mn)
        bs.setup_render(420, 420); bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64)); bs.setup_lights()
        cam = bs.setup_camera(target=c, ortho_scale=span * 1.3, distance=span * 3)
        cam.location = c + Vector((0.8, -0.8, 0.5)).normalized() * span * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(out, cam)
        print("SIZE", label, [round(v, 2) for v in (mx - mn)])
    sys.exit(0)

from PIL import Image, ImageDraw
out = os.path.abspath(sys.argv[1]); os.makedirs(out, exist_ok=True)
tiles = []
for comp in COMPONENTS:
    label, key, box = comp[:3]
    strict = comp[3] if len(comp) > 3 else True
    png = os.path.join(out, label + ".png")
    r = subprocess.run([BLENDER, "-b", "--factory-startup", "--python", os.path.abspath(__file__), "--",
                        label, key, png, ",".join(map(str, box)), "1" if strict else "0"],
                       capture_output=True, text=True)
    info = [l for l in r.stdout.splitlines() if l.startswith(("KEPT", "SIZE")) or "Error" in l]
    print(label, info)
    if os.path.exists(png):
        tiles.append((label, key, box, png))
cols = 4; W = 420
rows = (len(tiles) + cols - 1) // cols
sheet = Image.new("RGB", (W * cols, W * rows), "white"); d = ImageDraw.Draw(sheet)
for i, (label, key, box, png) in enumerate(tiles):
    x, y = (i % cols) * W, (i // cols) * W
    sheet.paste(Image.open(png).convert("RGB"), (x, y))
    d.rectangle([x, y, x + W, y + 34], fill=(20, 20, 20))
    d.text((x + 6, y + 4), "%d  %s  [%s]" % (i + 1, label, key), fill="white")
    d.text((x + 6, y + 19), "box " + ",".join("%g" % v for v in box), fill=(255, 200, 120))
sp = os.path.join(out, "COMPONENTS_sheet.png"); sheet.save(sp); print(sp)
