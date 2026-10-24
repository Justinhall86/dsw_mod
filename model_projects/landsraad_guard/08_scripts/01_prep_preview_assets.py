"""Step 1 (system python, not Blender): DDS-as-.png -> real PNG, HMD -> FBX.

  python 08_scripts/01_prep_preview_assets.py

Writes real PNGs to 04_textures/ and rigged FBXs (body+idle animation, weapons)
to 05_fbx_export/preview/ for 02_make_preview_blends.py to import.
"""
import os
import subprocess
import sys

from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_guard"
IN = os.path.join(PROJ, "01_input")
TEX = os.path.join(PROJ, "04_textures")
OUT = os.path.join(PROJ, "05_fbx_export", "preview")
TOOLKIT = r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit"
ANIM = r"C:\dsw_mod\extr\Anim\Male01"
os.makedirs(TEX, exist_ok=True)
os.makedirs(OUT, exist_ok=True)

TEXTURES = {  # real png name -> shipped DDS (.png) file
    "LandsraadGuard_Albedo.png": "LandsraadGuard_Albedo.png",
    "LandsraadGuard_MetallicGlossAO.png": "LandsraadGuard_MetallicGlossAO.png",
    "LandsraadGuard_Normal.png": "LandsraadGuard_Normal.png",
    "Landsraad_gun_Albedo.png": "Weapon/Landsraad_gun_Albedo.png",
    "Landsraad_gun_MetallicGlossAOEmiss.png": "Weapon/Landsraad_gun_MetallicGlossAOEmiss.png",
    "Landsraad_gun_Normal.png": "Weapon/Landsraad_gun_Normal.png",
    "Landsraad_Halberd_Albedo.png": "Weapon_Halberd/Landsraad_Halberd_Albedo.png",
    "Landsraad_Halberd_MetallicGlossAO.png": "Weapon_Halberd/Landsraad_Halberd_MetallicGlossAO.png",
    "Landsraad_Halberd_Normal.png": "Weapon_Halberd/Landsraad_Halberd_Normal.png",
    "Bazooka_Albedo.png": "Weapon_Bazooka/Bazooka_Albedo.png",
    "Bazooka_MetallicGlossAO.png": "Weapon_Bazooka/Bazooka_MetallicGlossAO.png",
    "Bazooka_Normal.png": "Weapon_Bazooka/Bazooka_Normal.png",
}
for out_name, rel in TEXTURES.items():
    im = Image.open(os.path.join(IN, rel))
    print(out_name, im.size, im.mode)
    im.convert("RGBA").save(os.path.join(TEX, out_name))


def run(script_dir, *args):
    print("RUN", script_dir, [os.path.basename(a) for a in args])
    r = subprocess.run([sys.executable, script_dir[1], *args], cwd=os.path.join(TOOLKIT, script_dir[0]),
                       capture_output=True, text=True)
    print(r.stdout[-400:])
    if r.returncode:
        print(r.stderr)
        raise SystemExit(1)


BODY = os.path.join(IN, "Male01_LandsraadGuard.hmd")
MODEL = ("Models", "hmd2fbx.py")
ANIMT = ("Animations", "hmdanim2fbx.py")
run(MODEL, BODY, os.path.join(OUT, "body.fbx"))
run(MODEL, os.path.join(IN, "Weapon_Halberd", "Landsraad_Halberd.fbx"), os.path.join(OUT, "halberd.fbx"))
run(MODEL, os.path.join(IN, "Weapon", "Gun_Landsraad.fbx"), os.path.join(OUT, "gun.fbx"))
run(MODEL, os.path.join(IN, "Weapon_Bazooka", "Bazooka.fbx"), os.path.join(OUT, "bazooka.fbx"))
for tag, folder, clip in (
        ("halberd", "LandsraadGuard", "Anim_Male01_LandsraadGuard_FightIdle.fbx"),
        ("gun", "LandsraadGuard_Gun", "Anim_Male01_LandsraadGuard_Gun_FightIdle.fbx"),
        ("bazooka", "LandsraadGuard_Bazooka", "Anim_Male01_LandsraadGuard_Bazooka_FightIdle.fbx")):
    run(ANIMT, BODY, os.path.join(ANIM, folder, clip), os.path.join(OUT, "body_%s_anim.fbx" % tag))
