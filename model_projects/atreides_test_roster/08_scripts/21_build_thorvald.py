"""Export one Thorvald unit blend and build its game package (HMD + textures + prefab) in the editor's CharMOD folder.
Does NOT touch data.cdb or any pak.

    python 21_build_thorvald.py trooper|demolition|elite|ranged
"""
import glob
import os
import subprocess
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
MP = os.path.dirname(PROJ)
BLENDER = r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"

UNITS = {
    "trooper": ("thorvald_trooper/03_blender/Thorvald_Trooper_v13.blend", "Male01_ThorvaldTrooper", "ThTrp", ["Thorvald_Katana=B_Weapon"]),
    "demolition": ("thorvald_demolition/03_blender/Thorvald_Demolition_v2.blend", "Male01_ThorvaldDemolition", "ThDem", ["Thorvald_Bazooka=B_Gun"]),
    "elite": ("thorvald_elite/03_blender/Thorvald_Elite_v2.blend", "Male01_ThorvaldElite", "ThEli", ["Thorvald_Glaive=B_Weapon", "Thorvald_TowerShield=B_Shield"]),
    "ranged": ("thorvald_ranged/03_blender/Thorvald_Ranged_v2.blend", "Male01_ThorvaldRanged", "ThRng", ["Thorvald_Sniper=B_Gun"]),
}
key = sys.argv[1]
blend, model, prefix, weapons = UNITS[key]
blend = os.path.join(MP, blend)
fbx = os.path.join(PROJ, "05_fbx_export", model + ".fbx")
tex = os.path.join(PROJ, "04_textures", key)
os.makedirs(os.path.dirname(fbx), exist_ok=True)
for f in glob.glob(os.path.join(tex, "*.png")):
    os.remove(f)

cmd = [BLENDER, "-b", blend, "--python", os.path.join(HERE, "20_export_unit.py"), "--", fbx, tex]
for w in weapons:
    cmd += ["--weapon", w]
r = subprocess.run(cmd, capture_output=True, text=True)
for line in r.stdout.splitlines():
    if line.startswith(("PARTS", "LIMITED", "UNWEIGHTED", "MATERIALS", "EXPORTED", "TEX")) or "Error" in line or "Traceback" in line:
        print(line)
if not os.path.exists(fbx):
    print(r.stdout[-3000:], r.stderr[-2000:])
    raise SystemExit("export failed")

mats = sorted({os.path.basename(f).rsplit("_", 1)[0] for f in glob.glob(os.path.join(tex, "*_Albedo.png"))})
# the exporter only writes maps whose node has image data, so scan every suffix, not just Albedo
allmats = sorted({os.path.basename(f).rsplit("_", 1)[0]
                  for suf in ("Albedo", "MetallicGlossAO", "Normal")
                  for f in glob.glob(os.path.join(tex, "*_%s.png" % suf))})
spec = []
for m in allmats:
    a = os.path.join(tex, m + "_Albedo.png")
    size = Image.open(a).size
    mg = os.path.join(tex, m + "_MetallicGlossAO.png")
    nm = os.path.join(tex, m + "_Normal.png")
    if not os.path.exists(mg):
        Image.new("RGB", size, (0, 110, 255)).save(mg)
        print("default MG for", m)
    if not os.path.exists(nm):
        Image.new("RGB", size, (128, 128, 255)).save(nm)
        print("default Normal for", m)
    spec += ["--mat", "%s=%s|%s|%s" % (m, a, mg, nm)]
cmd = [sys.executable, os.path.join(HERE, "14_make_game_package.py"), fbx, model, prefix, "--max", "1024"] + spec
print(">", " ".join(cmd)[:300])
r = subprocess.run(cmd, capture_output=True, text=True)
print(r.stdout[-2500:], r.stderr[-1500:])
