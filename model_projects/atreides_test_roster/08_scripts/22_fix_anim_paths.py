"""Add the animation-clip folders a unit's cdb animation set needs to its CharMOD props.json.

convert_model.py copies props.json from the prefab template (Smuggler Mercenary), whose hmd.animPaths
covers only /Anim/Male01 plus the generic Rifle/Pistol/Shield/MissileLauncher sets. A unit whose
model.inherit is MilitarySniper / MilitaryBazooka / Gurney keeps its clips in their own folder, so
without the entry the game has no source for Idle/Run/Attack and the unit freezes or T-poses.

    python 22_fix_anim_paths.py            # patch every Thorvald package + the 06_game_ready copy
"""
import json
import os
import shutil

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
EDITOR = r"C:\dsw_mod\D4XEditor\res\res\CharMOD"

# anim set (model.inherit) -> folders it reads clips from
SETS = {
    "MilitaryCommon": [],
    "MilitarySniper": ["/Anim/Male01/Sniper"],
    "MilitaryBazooka": ["/Anim/Male01/LandsraadGuard_Bazooka"],
    "MilitaryLRGuard": ["/Anim/Male01/LandsraadGuard", "/Anim/Male01/LandsraadGuard_Bazooka",
                        "/Anim/Male01/LandsraadGuard_Gun"],
    "Gurney": ["/Anim/Male01/Gurney"],
}

# model folder -> animation set from the cdb model row
UNITS = {
    "Male01_ThorvaldTrooper": "MilitaryCommon",
    "Male01_ThorvaldDemolition": "MilitaryBazooka",
    "Male01_ThorvaldElite": "Gurney",
    "Male01_ThorvaldRanged": "MilitarySniper",
}

for model, animset in UNITS.items():
    extra = SETS[animset]
    if not extra:
        print(model, "-> nothing to add")
        continue
    for folder in (os.path.join(EDITOR, model), os.path.join(PROJ, "06_game_ready", model)):
        p = os.path.join(folder, "props.json")
        if not os.path.exists(p):
            continue
        d = json.load(open(p, encoding="utf-8"))
        paths = d["hmd.animPaths"]
        for e in extra:
            if e not in paths:
                paths.insert(paths.index("/Anim/Female01"), e)
        d["hmd.animPaths"] = paths
        json.dump(d, open(p, "w", encoding="utf-8"), indent="\t")
        print(model, animset, "->", os.path.basename(folder) or folder, "paths:", len(paths))
        if folder.startswith(PROJ):
            shutil.copy2(p, os.path.join(EDITOR, model, "props.json"))
