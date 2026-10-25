"""v6 weapon survey, step 1 (system python): every blade / polearm weapon HMD in the game -> FBX + a real-PNG albedo.

  python 08_scripts/v6_02_weapon_prep.py

Writes 05_fbx_export/weapon_survey/<name>.fbx and <name>_Albedo.png, plus weapons.json (name, source, albedo).
The albedo path is read from the HMD's own material (check_hmd.py), resolved under the extracted assets.
"""
import json
import os
import re
import subprocess
import sys

from PIL import Image

EXTR = r"C:\dsw_mod\extr"
TOOLKIT = r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit\Models"
CHECK = r"C:\Users\justi\OneDrive\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts\check_hmd.py"
OUT = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite\05_fbx_export\weapon_survey"
os.makedirs(OUT, exist_ok=True)
WEAPONS = [
    "Character/Common/Weapon/Landsraad_halberd/Landsraad_Halberd.fbx",
    "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
    "Character/Imperial/Weapon/SardaukarSword/SardaukarSword.fbx",
    "Character/Imperial/Weapon/SardaukarSword_02/SardaukarSword02.fbx",
    "Character/Imperial/Weapon/AramshamSword/Aramsham_Sword.fbx",
    "Character/Ecaz/Weapon/SwordKnight/SwordKnight.fbx",
    "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
    "Character/Ecaz/Weapon/FencerDoubleKnife/TallSword.fbx",
    "Character/Ecaz/Weapon/FencerDoubleKnife/LittleSword.fbx",
    "Character/Vernius/Weapon/CtairSword/CtairSword.fbx",
    "Character/Idualis/Weapon/LongKnife.fbx",
    "Character/Idualis/Weapon/DoubleKnife.fbx",
    "Character/Harkonnen/Weapon/KindJal_Harkonnen.fbx",
    "Character/Harkonnen/Weapon/Knife/Knife01.fbx",
    "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
    "Character/Ecaz/Weapon/SpearSquire/SpearSquire.fbx",
    "Character/Vernius/Weapon/EngineerSpear/EngineerSpear.fbx",
    "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
    "Character/Idualis/Weapon/MetalBar.fbx",
    "Character/Harkonnen/Weapon/NefudMace.fbx",
]
res = []
for rel in WEAPONS:
    src = os.path.join(EXTR, rel)
    name = os.path.splitext(os.path.basename(rel))[0]
    fbx = os.path.join(OUT, name + ".fbx")
    r = subprocess.run([sys.executable, "hmd2fbx.py", src, fbx], cwd=TOOLKIT, capture_output=True, text=True)
    if r.returncode:
        print("FAIL", name, r.stderr[-300:])
        continue
    chk = subprocess.run([sys.executable, CHECK, src], capture_output=True, text=True).stdout
    m = re.search(r"diffuseTexture: (\S+)", chk)
    alb = None
    if m:
        p = os.path.join(EXTR, m.group(1).replace("/", os.sep))
        if os.path.exists(p):
            alb = os.path.join(OUT, name + "_Albedo.png")
            Image.open(p).convert("RGBA").save(alb)
    print("%-20s albedo %s" % (name, m.group(1) if m else None))
    res.append(dict(name=name, source=rel, albedo=alb))
json.dump(res, open(os.path.join(OUT, "weapons.json"), "w"), indent=1)
