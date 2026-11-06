"""Render the recoloured Thorvald buildings: turntable GIF + front still, with the vanilla donor beside it for comparison.

    python 30_render.py                 # all
    python 30_render.py AlloySmelter    # just these

Needs 20_recolour.py first. Output: ../02_progress_photos/02_recolour/<Building>.gif and <Building>_front.png.
Uses the dsw-vehicle-preview renderer (HMD -> FBX, matte game-like light).
"""
import json
import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402

STRUCT = os.path.join(REPO, "model_inputs", "Structure")
TEX = os.path.join(PROJ, "04_textures")
OUT = os.path.join(PROJ, "02_progress_photos", "02_recolour")
SCR = os.path.join(B.SCRATCH, "thv_bld")
os.makedirs(OUT, exist_ok=True)

# name -> donor folder, models (base first), metal/gloss/AO, normal, emissive
MODELS = {
    "ConsignmentTerminal": ("Point_Of_Interest/TrafficHub", ["TrafficHub.fbx"], "TrafficHub_MetallicGlossAO.png",
                            "TrafficHub_Normal.png", None),
    "AlloySmelter": ("Buildings/SpiceCollector", ["SpiceCollector.fbx"], "SpiceCollector_MetallicGlossAO.png",
                     "SpiceCollector_Normal.png", None),
    # both meshes cleaned by 41_clean_oredrill.py (ice piles cut; addon also loses its ground spouts), used as-is
    "OreDrill": ("Buildings/WaterExtractor", ["proj:05_fbx_export/OreDrill_main_clean.fbx",
                                              "proj:05_fbx_export/OreDrill_addon_clean.fbx"],
                 "WaterExtractor_MetallicGlossAO.png", "WaterExtractor_Normal.png", None),
    "WarAcademyAnnex": ("Buildings/IndoctrinationCenter", ["IndoctrinationCenter.fbx"],
                        "IndoctrinationCenter_MetallicGlossAOEmiss.png", "IndoctrinationCenter_Normal.png",
                        "IndoctrinationCenter_Emissive.png"),
    "ContractHall": ("Base/ConquestOutpost", ["ConquestOutpost.fbx"], "ConquestOutpost_MetallicGlossAO.png",
                     "ConquestOutpost_Normal.png", "ConquestOutpost_Emissive.png"),
}


def render(name):
    folder, models, mgao, normal, emissive = MODELS[name]
    d = os.path.join(STRUCT, *folder.split("/"))
    td = os.path.join(SCR, name, "tex")
    os.makedirs(td, exist_ok=True)
    fbx = [os.path.join(PROJ, m[5:]) if m.startswith("proj:") else
           B.convert_model(os.path.join(d, m), os.path.join(td, os.path.splitext(m)[0] + "_real.fbx")) for m in models]
    frames = os.path.join(SCR, name, "frames")
    shutil.rmtree(frames, ignore_errors=True)
    front = os.path.join(OUT, name + "_front.png")
    cfg = dict(fbx=fbx, name=name, front="-Y", albedo=os.path.join(TEX, name, "albedo.png"),
               mgao=B.dds_as_png(os.path.join(d, mgao), os.path.join(td, "mgao.png")),
               normal=B.dds_as_png(os.path.join(d, normal), os.path.join(td, "normal.png")),
               emissive=B.dds_as_png(os.path.join(d, emissive), os.path.join(td, "emissive.png")) if emissive else None,
               flat_colour=None, turntable=True, frames_dir=frames, n_frames=B.N_FRAMES,
               stills={"front": front, "three_quarter": os.path.join(OUT, name + "_3q.png"),
                       "back": os.path.join(OUT, name + "_back.png")})
    cfg_path = os.path.join(SCR, name + ".json")
    json.dump(cfg, open(cfg_path, "w"))
    with open(os.path.join(SCR, name + ".log"), "w") as lg:
        subprocess.run([B.BLENDER, "--background", "--factory-startup", "--python", B.RENDER, "--", cfg_path],
                       stdout=lg, stderr=subprocess.STDOUT, check=True)
    B.make_gif(frames, os.path.join(OUT, name + ".gif"))
    return front


if __name__ == "__main__":
    for n in MODELS:
        if not argv or n in argv:
            try:
                print("OK", render(n))
            except Exception as exc:
                print("FAIL", n, exc)
