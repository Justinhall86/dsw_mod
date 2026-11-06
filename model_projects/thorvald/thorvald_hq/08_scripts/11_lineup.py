"""True-scale lineup of the HQ donors: Arrakeen (Atreides HQ), the Corrino lighter (Thorvald's HQ today) and the
Conquest Outpost (the Contract Hall donor), each at its model-row scale, on one ground, same camera.

    python 11_lineup.py          # needs 10_convert_donors.py first

Output: ../02_progress_photos/01_survey/lineup_3q.png and lineup_top.png
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402

BASE = os.path.join(REPO, "model_inputs", "Structure", "Base")
SCR = os.path.join(B.SCRATCH, "thv_hq")
OUT = os.path.join(PROJ, "02_progress_photos", "01_survey")
TX = os.path.join(SCR, "tex")
os.makedirs(TX, exist_ok=True)


def texset(folder, prefix, emissive=True):
    d = os.path.join(BASE, folder)
    r = {}
    for key, suf, need in (("albedo", "_Albedo", 1), ("normal", "_Normal", 1), ("mgao", "_MetallicGlossAO", 1),
                           ("emissive", "_Emissive", emissive)):
        src = os.path.join(d, prefix + suf + ".png")
        if need and os.path.exists(src):
            r[key] = B.dds_as_png(src, os.path.join(TX, prefix + suf + ".png"))
    return r


def main():
    arr = {"Arrakeen_Assets": texset("Arrakeen", "ArrakeenAsset"),
           "Arrakeen_Fortification": texset("Arrakeen", "ArrakeenFortification"),
           "Arrakeen_Ground": texset("Arrakeen", "ArrakeenGround"),
           "Buildings01": texset("Arrakeen", "Buildings01"), "*": texset("Arrakeen", "ArrakeenAsset")}
    # x offsets: three ~50 m bases with a gap; rotations from the prefabs (Arrakeen 26.3, Corrino -150, Outpost -101.3)
    items = [
        dict(fbx=[os.path.join(SCR, "Arrakeen.fbx"), os.path.join(SCR, "ArrakeenAddon.fbx")],
             mats=arr, scale=1.2, rot=26.3, x=-58, label="Arrakeen (Atreides HQ)"),
        dict(fbx=[os.path.join(SCR, "Corrino.fbx")], mats={"*": texset("Corrino", "CorrinoBase")},
             scale=0.8, rot=-150.0, x=0, label="Corrino lighter (Thorvald HQ today)"),
        dict(fbx=[os.path.join(SCR, "Outpost.fbx")], mats={"*": texset("ConquestOutpost", "ConquestOutpost")},
             scale=1.0, rot=-101.3, x=55, label="Conquest Outpost (Contract Hall)"),
    ]
    cfg = dict(items=items, out_3q=os.path.join(OUT, "lineup_3q.png"), out_top=os.path.join(OUT, "lineup_top.png"))
    cp = os.path.join(SCR, "lineup.json")
    json.dump(cfg, open(cp, "w"))
    r = subprocess.run([B.BLENDER, "-b", "--factory-startup", "--python", os.path.join(HERE, "11_lineup_blender.py"),
                        "--", cp], capture_output=True, text=True)
    print("\n".join(ln for ln in r.stdout.splitlines() if ln.startswith(("RENDERED", "SIZE", "Error", "Traceback")))
          or r.stdout[-1500:] + r.stderr[-1500:])


if __name__ == "__main__":
    main()
