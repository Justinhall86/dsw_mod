"""Convert the game's HMD-named-.fbx donor files into real FBX inside THIS project's 05_fbx_export/.

    python convert_hmd_inputs.py            # the four units units.py expects there (Ranger, Warden, HeavyWeapon, Mercenary)
    python convert_hmd_inputs.py <hmd path> <out name>      # any other one, e.g. a weapon:
        python convert_hmd_inputs.py "C:/dsw_mod/extr/Character/Ecaz/Weapon/FencerDoubleKnife/TallSword.fbx" TallSword_TRUE_FBX.fbx

Why: files under model_inputs/Atreide/Unit/* and Smuggler/Unit/* (and all of extr/Character/**/Weapon/*.fbx) start with the
bytes "HMD", Blender cannot import them ("Invalid header").  units.py looks for the converted copies in <project>/05_fbx_export/.
Run it from <project>/08_scripts/ (it finds the repo and the project from its own location).
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PROJ))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd2fbx  # noqa: E402

OUT = os.path.join(PROJ, "05_fbx_export")
os.makedirs(OUT, exist_ok=True)
MI = os.path.join(REPO, "model_inputs")
DEFAULT = {
    "Female01_AtreideRanger_TRUE_FBX.fbx": "Atreide/Unit/Ranger/Female01_AtreideRanger.fbx",
    "Female01_AtreideWarden_TRUE_FBX.fbx": "Atreide/Unit/Warden/Female01_AtreideWarden.fbx",
    "Male01_HeavyWeaponSquad_TRUE_FBX.fbx": "Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
    "Male01_SmugglerMercenary_TRUE_FBX.fbx": "Smuggler/Unit/Mercenary/Male01_SmugglerMercenary.fbx",
}
jobs = [(sys.argv[1], sys.argv[2])] if len(sys.argv) == 3 else [(os.path.join(MI, v), k) for k, v in DEFAULT.items()]
for src, name in jobs:
    hmd2fbx.convert(src, os.path.join(OUT, name), verbose=False)
    print("converted", src, "->", os.path.join(OUT, name))
