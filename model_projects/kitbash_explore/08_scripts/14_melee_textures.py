"""Map each converted melee weapon FBX to its albedo / metallic-gloss / normal PNG.

    python -I 14_melee_textures.py

The weapon FBX files name their textures with a game-relative path ("Character/Ecaz/Weapon/...png").
Those files are DDS data behind a .png extension, so they are read with PIL and written as real PNG
into 04_textures/melee/<weapon>/.  The manifest for 15_melee_gallery.py is written to
05_fbx_export/melee/melee_weapons.json.
"""
import json
import os
import re

from PIL import Image

EXTR = "C:/dsw_mod/extr"
PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FBX_DIR = os.path.join(PROJ, "05_fbx_export", "melee")
TEX_DIR = os.path.join(PROJ, "04_textures", "melee")
MANIFEST = os.path.join(FBX_DIR, "melee_weapons.json")
KINDS = ("Albedo", "MetallicGlossAO", "Normal")
PAT = re.compile(rb"Character/[A-Za-z0-9_./-]+?_(Albedo|MetallicGlossAO|Normal)\.png")

jobs = {os.path.splitext(f)[0]: os.path.join(FBX_DIR, f)
        for f in sorted(os.listdir(FBX_DIR)) if f.endswith(".fbx")}
# The tall sword was converted earlier by the hmd_to_true_fbx pass (11_sword_anim.py uses it too).
jobs["TallSword"] = os.path.join(PROJ, "05_fbx_export", "TallSword_TRUE_FBX.fbx")

result = {}
for name, fbx in sorted(jobs.items()):
    found = {}
    for m in PAT.finditer(open(fbx, "rb").read()):
        kind = m.group(1).decode()
        found.setdefault(kind, m.group(0).decode())
    out_dir = os.path.join(TEX_DIR, name)
    os.makedirs(out_dir, exist_ok=True)
    entry = {"fbx": fbx.replace("\\", "/")}
    for kind in KINDS:
        entry[kind] = None
        if kind not in found:
            continue
        src = os.path.join(EXTR, found[kind])
        if not os.path.exists(src):
            print("MISSING", name, kind, src)
            continue
        dst = os.path.join(out_dir, os.path.basename(found[kind]))
        Image.open(src).convert("RGBA").save(dst)
        entry[kind] = dst.replace("\\", "/")
    result[name] = entry
    print("%-16s albedo=%s mg=%s normal=%s" % (name, bool(entry["Albedo"]),
                                                bool(entry["MetallicGlossAO"]), bool(entry["Normal"])))

with open(MANIFEST, "w") as f:
    json.dump(result, f, indent=2)
print("WROTE", MANIFEST, len(result), "weapons")
