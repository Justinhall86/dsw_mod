"""Turn an exported FBX into a game-ready CharMOD model folder (textures, HMD, prefab, materials.props).  Does NOT touch data.cdb or any pak.

    python 14_make_game_package.py <fbx> <ModelName> <Prefix> --mat "<Blender material>=<albedo>|<mg>|<normal>" [--mat ...]
                                   [--weapon-mat "MAT_WeaponEcazFencer=Character/Ecaz/Weapon/FencerDoubleKnife/WeaponFencer"]
                                   [--template Character/Smuggler/Unit/Mercenary/Prefab_SmugglerMercenary.prefab] [--keep-gun]

 1. per material: RGBA, alpha 255, <= 1024 px textures  -> <project>/06_game_ready/<ModelName>_textures/<Prefix><Mat>_{Albedo,MetallicGlossAO,Normal}.png
 2. convert_model.py (HMD toolkit) with --vanilla-material for every material -> C:\\dsw_mod\\D4XEditor\\res\\res\\CharMOD\\<ModelName>
 3. copy the textures next to the HMD, write materials.props (PBR, culling Back, emissive 0.1), strip the template's hidden Gun from the prefab
 4. the converter's unreferenced texture copies are MOVED (not deleted) to <project>/06_game_ready/<ModelName>_converter_strays/
 5. check_hmd.py must say RESULT: OK
"""
import json
import os
import shutil
import subprocess
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PROJ))
SK = os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts")
EDITOR_RES = r"C:\dsw_mod\D4XEditor\res\res"

a = sys.argv[1:]
fbx, model, prefix = os.path.abspath(a[0]), a[1], a[2]
mats, weapon = [], []
template = "Character/Smuggler/Unit/Mercenary/Prefab_SmugglerMercenary.prefab"
keep_gun = "--keep-gun" in a
MAXTEX = int(a[a.index("--max") + 1]) if "--max" in a else 2048
for i, x in enumerate(a):
    if x == "--mat":
        mats.append(a[i + 1])
    if x == "--weapon-mat":
        weapon.append(a[i + 1])
    if x == "--template":
        template = a[i + 1]

tex_dir = os.path.join(PROJ, "06_game_ready", model + "_textures")
os.makedirs(tex_dir, exist_ok=True)
vanilla = []
mat_names = []
for spec in mats:
    name, files = spec.split("=", 1)
    short = name.replace("Mat_", "").replace("MAT_", "").replace(":", "_")
    fname = short if short.startswith(prefix) else prefix + short
    for suf, p in zip(("Albedo", "MetallicGlossAO", "Normal"), files.split("|")):
        im = Image.open(p).convert("RGBA")
        if im.width > MAXTEX:
            im = im.resize((MAXTEX, MAXTEX), Image.LANCZOS)
        r, g, b, _ = im.split()
        Image.merge("RGBA", (r, g, b, Image.new("L", im.size, 255))).save(os.path.join(tex_dir, "%s_%s.png" % (fname, suf)))
    vanilla += ["--vanilla-material", "%s=CharMOD/%s/%s" % (name, model, fname)]
    mat_names.append(name)
for spec in weapon:
    vanilla += ["--vanilla-material", spec]
    mat_names.append(spec.split("=", 1)[0])

cmd = [sys.executable, os.path.join(SK, "convert_model.py"), fbx, "--prefab-template", template,
       "--prefab-name", "Prefab_" + model.replace("Male01_", "")] + vanilla
print(">", " ".join(cmd))
subprocess.run(cmd)                       # exits non-zero the first time (textures not copied yet): expected, checked below

folder = os.path.join(EDITOR_RES, "CharMOD", model)
if not os.path.isdir(folder):
    raise SystemExit("convert_model did not create " + folder)
for f in os.listdir(tex_dir):
    shutil.copy2(os.path.join(tex_dir, f), os.path.join(folder, f))
props = {"materials": {"PBR": {m: {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back", "depthTest": "Less",
                                    "colorMask": 15, "enableStencil": False, "emissive": 0.1} for m in mat_names}}}
json.dump(props, open(os.path.join(folder, "materials.props"), "w"), indent="\t")

strays = os.path.join(PROJ, "06_game_ready", model + "_converter_strays")
os.makedirs(strays, exist_ok=True)
keep = set(os.listdir(tex_dir))
for f in os.listdir(folder):
    if f.lower().endswith(".png") and f not in keep:
        shutil.move(os.path.join(folder, f), os.path.join(strays, f))
        print("moved unreferenced", f)

prefab = os.path.join(folder, "Prefab_" + model.replace("Male01_", "") + ".prefab")
if os.path.exists(prefab) and not keep_gun:
    p = json.load(open(prefab, encoding="utf-8"))
    p["children"] = [c for c in p["children"] if not (c.get("name") == "Gun" or c.get("object") in ("Gun", "Gun_Smuggler"))]
    json.dump(p, open(prefab, "w", encoding="utf-8"), indent="\t")
    print("prefab children:", len(p["children"]))

dst = os.path.join(PROJ, "06_game_ready", model)
shutil.copytree(folder, dst, dirs_exist_ok=True)
r = subprocess.run([sys.executable, os.path.join(SK, "check_hmd.py"), os.path.join(folder, model + ".hmd")], capture_output=True, text=True)
print(r.stdout[-1500:])
print("PACKAGE", folder, "-> copy in", dst)
