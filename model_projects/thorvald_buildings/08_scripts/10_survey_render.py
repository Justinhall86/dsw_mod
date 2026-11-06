"""Turntable GIFs + front stills of unused vanilla building models, as donors for House Thorvald buildings.

    python 10_survey_render.py                # every entry
    python 10_survey_render.py TrafficHub     # just these

Reuses the dsw-building-audit renderer; output goes to ../02_progress_photos/01_survey/.
"""
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-building-audit", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import render_buildings as R  # noqa: E402

OUT = os.path.join(HERE, "..", "02_progress_photos", "01_survey")
os.makedirs(OUT, exist_ok=True)
R.OUT = OUT

EXTRA = [
    dict(name="TrafficHub", folder="Point_Of_Interest/TrafficHub", models=["TrafficHub.fbx"],
         albedo="TrafficHub_Albedo.png", mgao="TrafficHub_MetallicGlossAO.png", normal="TrafficHub_Normal.png"),
    dict(name="ConquestOutpost", folder="Base/ConquestOutpost", models=["ConquestOutpost.fbx"],
         albedo="ConquestOutpost_Albedo.png", mgao="ConquestOutpost_MetallicGlossAO.png",
         normal="ConquestOutpost_Normal.png", emissive="ConquestOutpost_Emissive.png"),
    dict(name="TowerConquestOutpost", folder="Base/ConquestOutpost/TowerOutpostConquest", models=["TowerConquestOutpost.fbx"],
         albedo="TowerConquestOutpost_Albedo.png", mgao="TowerConquestOutpost_MetallicGlossAO.png",
         normal="TowerConquestOutpost_Normal.png", emissive="TowerConquestOutpost_Emissive.png"),
]
# Stash_Smuggler has no textures of its own; its material is Mat_SmugglingCenter, so borrow those files
STASH = dict(name="Stash_Smuggler", folder="Point_Of_Interest/Stash_Smuggler", models=["Stash_Smuggler.fbx"],
             tex_folder="Buildings/SmugglingCenter", albedo="SmugglingCenter_Albedo.png",
             mgao="SmugglingCenter_MetallicGlossAO.png", normal="SmugglingCenter_Normal.png")

ALL = R.BUILDINGS + EXTRA


def build_stash(e):
    # copy the borrowed textures next to the model in a scratch folder so R.build finds them
    src = os.path.join(R.ROOT, *e["folder"].split("/"))
    tex = os.path.join(R.ROOT, *e["tex_folder"].split("/"))
    tmp = os.path.join(R.SCR, "stash_src")
    os.makedirs(tmp, exist_ok=True)
    for f in e["models"]:
        shutil.copy2(os.path.join(src, f), tmp)
    for k in ("albedo", "mgao", "normal"):
        shutil.copy2(os.path.join(tex, e[k]), tmp)
    e = dict(e, folder=os.path.relpath(tmp, R.ROOT).replace(os.sep, "/"))
    return R.build(e)


if __name__ == "__main__":
    failed = []
    for e in ALL + [STASH]:
        if argv and e["name"] not in argv:
            continue
        try:
            print("OK", build_stash(e) if e is STASH else R.build(e))
            still = os.path.join(R.SCR, e["name"], "front.png")
            if os.path.exists(still):
                shutil.copy2(still, os.path.join(OUT, e["name"] + "_front.png"))
        except Exception as exc:
            failed.append(e["name"])
            print("FAIL", e["name"], "-", exc)
    print("FAILED:", failed or "none")
