"""Round trip: render the CONVERTED game HMD (not the blend) next to the vanilla Spacing Guild Branch, same camera
framing, so size and orientation can be compared. Output 02_progress_photos/03_game_ready/.

    py -3 08_scripts/12_roundtrip_render.py
"""
import json
import os
import shutil
import subprocess
import sys

from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
for exe in (os.environ.get("BLENDER_EXE"), r"D:\Blender Foundation\Blender 5.2\blender.exe",
            r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"):
    if exe and os.path.exists(exe):
        os.environ["BLENDER_EXE"] = exe
        break
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402

NAME = "ThorvaldConsignmentTerminal"
GR = os.path.join(PROJ, "06_game_ready", "StructMOD", NAME)
GUILD = os.path.join(REPO, "model_inputs", "Structure", "Buildings", "SpacingGuildBranch")
OUT = os.path.join(PROJ, "02_progress_photos", "03_game_ready")
SCR = os.path.join(B.SCRATCH, "thv_terminal")
os.makedirs(OUT, exist_ok=True)

JOBS = {
    NAME: (os.path.join(GR, NAME + ".hmd"), os.path.join(GR, NAME + "_Albedo.png"),
           os.path.join(GR, NAME + "_MetallicGlossAO.png"), os.path.join(GR, NAME + "_Normal.png")),
    "SpacingGuildBranch": (os.path.join(GUILD, "SpacingGuildBranch.fbx"),
                           os.path.join(GUILD, "SpacingGuildBranch_Corrino_Albedo.png"),
                           os.path.join(GUILD, "SpacingGuildBranch_MetallicGlossAO.png"),
                           os.path.join(GUILD, "SpacingGuildBranch_Normal.png")),
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
               turntable=True, frames_dir=frames, n_frames=B.N_FRAMES, stills=stills, fixed_extent=7.0)
    cp = os.path.join(td, "cfg.json")
    json.dump(cfg, open(cp, "w"))
    with open(os.path.join(td, "render.log"), "w") as lg:
        subprocess.run([B.BLENDER, "--background", "--factory-startup", "--python", B.RENDER, "--", cp],
                       stdout=lg, stderr=subprocess.STDOUT, check=True)
    B.make_gif(frames, os.path.join(OUT, name + ".gif"))
    return stills


got = {n: render(n) for n in JOBS}
tiles = [Image.open(got[n]["three_quarter"]).convert("RGB") for n in (NAME, "SpacingGuildBranch")]
w, h = tiles[0].size
sheet = Image.new("RGB", (w * 2, h + 40), (30, 30, 30))
dr = ImageDraw.Draw(sheet)
for i, (t, label) in enumerate(zip(tiles, ("Thorvald Consignment Terminal (converted HMD)", "vanilla Spacing Guild Branch"))):
    sheet.paste(t.resize((w, h)), (i * w, 40))
    dr.text((i * w + 12, 12), label, fill=(230, 230, 230))
p = os.path.join(OUT, "compare_3q.png")
sheet.save(p)
print("sheet", p)
