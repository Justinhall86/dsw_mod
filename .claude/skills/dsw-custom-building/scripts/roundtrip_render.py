"""Round trip: render the CONVERTED HMD (not the .blend) next to a vanilla building with the same camera, so size,
orientation and textures can be judged. Writes stills, GIFs and compare_3q.png to <project>/02_progress_photos/03_game_ready/.

    py -3 roundtrip_render.py <project> <Name> [--resdir StructMOD] [--ref SpacingGuildBranch] [--extent 7]

--ref is a folder under model_inputs/Structure/Buildings (its <ref>.fbx is an HMD in disguise; textures are found
by suffix, preferring *_Corrino_Albedo). Uses dsw-vehicle-preview's build_previews (HMD -> FBX, Blender turntable).
Takes a few minutes: run it in the background.
"""
import argparse
import glob
import json
import os
import shutil
import subprocess
import sys

from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
for exe in (os.environ.get("BLENDER_EXE"), r"D:\Blender Foundation\Blender 5.2\blender.exe",
            r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"):
    if exe and os.path.exists(exe):
        os.environ["BLENDER_EXE"] = exe
        break
ap = argparse.ArgumentParser()
ap.add_argument("project")
ap.add_argument("name")
ap.add_argument("--resdir", default="StructMOD")
ap.add_argument("--ref", default="SpacingGuildBranch")
ap.add_argument("--extent", type=float, default=7.0)
A = ap.parse_args()
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
sys.argv = sys.argv[:1]
import build_previews as B  # noqa: E402

PROJ = os.path.abspath(A.project)
GR = os.path.join(PROJ, "06_game_ready", A.resdir, A.name)
RD = os.path.join(REPO, "model_inputs", "Structure", "Buildings", A.ref)
OUT = os.path.join(PROJ, "02_progress_photos", "03_game_ready")
SCR = os.path.join(B.SCRATCH, "building_rt")
os.makedirs(OUT, exist_ok=True)


def pick(suffix):
    c = sorted(glob.glob(os.path.join(RD, "*" + suffix)))
    pref = [p for p in c if "_Corrino_" in p] or [p for p in c if os.path.basename(p) == A.ref + suffix] or c
    assert pref, "no *%s in %s" % (suffix, RD)
    return pref[0]


JOBS = {
    A.name: (os.path.join(GR, A.name + ".hmd"), os.path.join(GR, A.name + "_Albedo.png"),
             os.path.join(GR, A.name + "_MetallicGlossAO.png"), os.path.join(GR, A.name + "_Normal.png")),
    A.ref: (os.path.join(RD, A.ref + ".fbx"), pick("_Albedo.png"), pick("_MetallicGlossAO.png"), pick("_Normal.png")),
}


def render(name):
    hmd, alb, mgao, nrm = JOBS[name]
    td = os.path.join(SCR, name)
    os.makedirs(td, exist_ok=True)
    fbx = B.convert_model(hmd, os.path.join(td, name + "_real.fbx"))
    frames = os.path.join(td, "frames")
    shutil.rmtree(frames, ignore_errors=True)
    stills = {k: os.path.join(OUT, "%s_%s.png" % (name, k)) for k in ("front", "three_quarter", "back")}
    cfg = dict(fbx=[fbx], name=name, front="-Y", albedo=alb, mgao=B.dds_as_png(mgao, os.path.join(td, "mgao.png")),
               normal=B.dds_as_png(nrm, os.path.join(td, "normal.png")), emissive=None, flat_colour=None,
               turntable=True, frames_dir=frames, n_frames=B.N_FRAMES, stills=stills, fixed_extent=A.extent)
    cp = os.path.join(td, "cfg.json")
    json.dump(cfg, open(cp, "w"))
    with open(os.path.join(td, "render.log"), "w") as lg:
        subprocess.run([B.BLENDER, "--background", "--factory-startup", "--python", B.RENDER, "--", cp],
                       stdout=lg, stderr=subprocess.STDOUT, check=True)
    B.make_gif(frames, os.path.join(OUT, name + ".gif"))
    return stills


got = {n: render(n) for n in JOBS}
tiles = [Image.open(got[n]["three_quarter"]).convert("RGB") for n in JOBS]
w, h = tiles[0].size
sheet = Image.new("RGB", (w * 2, h + 40), (30, 30, 30))
dr = ImageDraw.Draw(sheet)
for i, (t, label) in enumerate(zip(tiles, ("%s (converted HMD)" % A.name, "vanilla " + A.ref))):
    sheet.paste(t.resize((w, h)), (i * w, 40))
    dr.text((i * w + 12, 12), label, fill=(230, 230, 230))
p = os.path.join(OUT, "compare_3q.png")
sheet.save(p)
print("sheet", p)
