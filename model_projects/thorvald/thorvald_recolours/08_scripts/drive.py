"""Convert inputs, write configs, render before/after stills (+ turntable GIF for the after).

    python3 drive.py harvester|ornithopter [--gif] [--px N] [--tag NAME]
"""
import glob
import json
import os
import subprocess
import sys
import tempfile

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
V = "/home/user/dsw_mod/model_inputs/Vehicle/"
sys.path.insert(0, "/home/user/dsw_mod/HMD_toolkit/HMD_toolkit/Models")
import hmd2fbx  # noqa: E402

args = sys.argv[1:]
unit = args[0]
GIF = "--gif" in args
PX = int(args[args.index("--px") + 1]) if "--px" in args else 800
TAG = args[args.index("--tag") + 1] if "--tag" in args else "after"
CONV = os.path.join(tempfile.gettempdir(), "thorvald_recolours_conv")
os.makedirs(CONV, exist_ok=True)


def png(rel):
    """DDS behind a .png name -> real PNG (Blender cannot read the DDS)."""
    dst = os.path.join(CONV, os.path.basename(rel))
    if not os.path.exists(dst):
        Image.open(V + rel).convert("RGBA").save(dst)
    return dst


def fbx(rel):
    dst = os.path.join(CONV, os.path.basename(rel) + "_real.fbx")
    if not os.path.exists(dst):
        hmd2fbx.convert(V + rel, dst, verbose=False)
    return dst


def recol(name):
    return os.path.join(os.path.dirname(HERE), "04_textures", name)


if unit == "harvester":
    d = "Imperial/Harvester/"
    model, front, name = fbx(d + "ImperialHarvester.fbx"), "-X", "CorrinoHarvester"

    def slots(after):
        return {
            "Harvester_MAT": {"albedo": recol("Harvester_Albedo.png") if after else png(d + "Harvester_Albedo.png"),
                              "mgao": png(d + "Harvester_MetallicGlossAO.png"), "normal": png(d + "Harvester_Normal.png")},
            "Harvester_Track_MAT": {"albedo": recol("Harvester_Track_Albedo.png") if after else png(d + "Harvester_Track_Albedo.png"),
                                    "mgao": png(d + "Harvester_Track_MetallicGlossAO.png"),
                                    "normal": png(d + "Harvester_Track_Normal.png")}}
else:
    d = "Atreide/Ornithopter/"
    model, front, name = fbx(d + "Vehicle_Ornithopter.fbx"), "+X", "Ornithopter"

    def slots(after):
        return {
            "Ornithopter_MAT": {"albedo": recol("Ornithopter_Albedo.png") if after else png(d + "Ornithopter_Albedo.png"),
                                "mgao": png(d + "Ornithopter_MetallicGlossAO.png"), "normal": png(d + "Ornithopter_Normal.png"),
                                "emissive": png(d + "Ornithopter_Emissive.png")},
            "Ornithopter_Glass_MAT": "glass"}

out = os.path.join(os.path.dirname(HERE), "02_progress_photos")
os.makedirs(out, exist_ok=True)
for after in ([False, True] if TAG == "after" else [True]):
    tag = TAG if after else "before"
    cfg = {"fbx": model, "name": name, "front": front, "slots": slots(after), "px": PX,
           "stills": {v: os.path.join(out, "%s_%s_%s.png" % (name, tag, v)) for v in ("front", "three_quarter", "back", "side")}}
    if after and GIF:
        cfg["frames_dir"] = os.path.join(tempfile.gettempdir(), "thorvald_recolours_frames", name)
    cp = os.path.join(out, "%s_%s.json" % (name, tag))
    json.dump(cfg, open(cp, "w"), indent=1)
    r = subprocess.run([sys.executable, os.path.join(HERE, "render.py"), cp], capture_output=True, text=True)
    if r.returncode or "DONE" not in r.stdout:
        print(r.stdout[-2000:], r.stderr[-2000:])
        raise SystemExit("render failed: " + tag)
    print("rendered", tag)
    if after and GIF:
        paths = sorted(glob.glob(os.path.join(cfg["frames_dir"], "frame_*.png")))
        assert len(paths) == 36, len(paths)
        fr = [Image.open(p).convert("RGB") for p in paths]
        sheet = Image.new("RGB", (480 * 4, 480))
        for i, f in enumerate(fr[::9][:4]):
            sheet.paste(f, (i * 480, 0))
        ref = sheet.quantize(colors=256, method=Image.Quantize.MEDIANCUT)
        q = [f.quantize(palette=ref) for f in fr]
        q[0].save(os.path.join(out, name + "_Thorvald_turntable.gif"), save_all=True, append_images=q[1:], duration=60, loop=0)
        print("gif done")
