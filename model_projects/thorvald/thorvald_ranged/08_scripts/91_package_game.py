"""Exported FBX (90_export_game_fbx.py) -> self-contained game-ready CharMOD folder in the PROJECT (no editor res tree,
no pak, no extracted vanilla assets needed; works on the D: PC).

    python 91_package_game.py <Male01_X.fbx> <texture dump dir> <TexPrefix> <props.json template> [--max 1024]

Writes <project>/06_game_ready/CharMOD/<Male01_X>/ (the same relative path the pak needs: copy 06_game_ready/CharMOD/*
into <editor>/res/res/CharMOD/):
 1. toolkit convert_fbx.py (skeleton restored from HMD_toolkit/Rigs/Male01.hmd)
 2. every material pointed at its own textures CharMOD/<X>/<TexPrefix><Mat>_{Albedo,MetallicGlossAO,Normal}.png
    (RGBA, alpha 255, <= --max px; a missing MG map -> flat (0, 110, 255), a missing normal -> flat (128, 128, 255),
    as the Elite's glaive); converter strays moved to 06_game_ready/_converter_strays/<X>/
 3. normals check (fix_normals), prefab Prefab_<X without Male01_> from the vanilla Mercenary prefab (model + ground
    decal + its constraint; the hidden smuggler Gun dropped: our weapon is baked into the mesh), props.json (animation
    folders) copied from the given vanilla template, materials.props (PBR, culling Back, emissive 0.1, as the Elite)
 4. check_hmd.py against 06_game_ready as the res root must say OK
An existing folder is archived to 06_game_ready/_archive/<X>_<date>/ first.
"""
import datetime
import json
import os
import shutil
import subprocess
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
os.environ.setdefault("DSW_PROJECT_DIR", REPO)
TOOLKIT = os.path.join(REPO, "HMD_toolkit", "HMD_toolkit")
os.environ.setdefault("DSW_TOOLKIT_DIR", TOOLKIT)
SK = os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts")
sys.path.insert(0, SK)
import fix_normals  # noqa: E402
import retexture_materials as RM  # noqa: E402
sys.path.insert(0, os.path.join(TOOLKIT, "Models"))
import hmd_reader as H  # noqa: E402

a = sys.argv[1:]
fbx, dump, prefix, props_tpl = os.path.abspath(a[0]), os.path.abspath(a[1]), a[2], os.path.abspath(a[3])
MAX = int(a[a.index("--max") + 1]) if "--max" in a else 1024
stem = os.path.splitext(os.path.basename(fbx))[0]
short = stem.split("_", 1)[1]
GR = os.path.join(PROJ, "06_game_ready")
outdir = os.path.join(GR, "CharMOD")
folder = os.path.join(outdir, stem)
D4X = os.path.join(os.environ.get("DSW_GAME_DIR", r"D:\Steam\steamapps\common\D4X"), "D4X.exe")
TEMPLATE = os.path.join(REPO, "model_inputs", "Character", "Smuggler", "Unit", "Mercenary", "Prefab_SmugglerMercenary.prefab")

if os.path.isdir(folder):
    arch = os.path.join(GR, "_archive", "%s_%s" % (stem, datetime.date.today().isoformat()))
    if not os.path.exists(arch):
        shutil.copytree(folder, arch)
        print("archived ->", arch)
    shutil.rmtree(folder)                       # the copy above is the backup
os.makedirs(outdir, exist_ok=True)

cmd = [sys.executable, os.path.join(TOOLKIT, "Repackager", "convert_fbx.py"), "model", fbx,
       "--ref", os.path.join(TOOLKIT, "Rigs", "Male01.hmd"), "--outdir", outdir, "--resdir", "CharMOD"]
if os.path.exists(D4X):
    cmd += ["--d4x", D4X]
print(">", " ".join(cmd))
subprocess.run(cmd, cwd=os.path.join(TOOLKIT, "Repackager"))
hmd = os.path.join(folder, stem + ".hmd")
if not os.path.exists(hmd):
    raise SystemExit("conversion failed: no " + hmd)

# ---- textures -------------------------------------------------------------------------------------------------
FLAT = {"MetallicGlossAO": (0, 110, 255), "Normal": (128, 128, 255)}
mats = [m["name"] for m in RM.list_materials(hmd).values()]
print("HMD materials:", mats)
asg, keep = {}, set()
for m in mats:
    sm = m.replace("Mat_", "").replace("MAT_", "").replace(":", "_")
    fname = prefix + sm
    for suf in ("Albedo", "MetallicGlossAO", "Normal"):
        src = os.path.join(dump, "%s__%s.png" % (m, suf))
        dst = os.path.join(folder, "%s_%s.png" % (fname, suf))
        if os.path.exists(src):
            im = Image.open(src).convert("RGBA")
            if im.width > MAX:
                im = im.resize((MAX, MAX), Image.LANCZOS)
            r, g, b, _ = im.split()
            Image.merge("RGBA", (r, g, b, Image.new("L", im.size, 255))).save(dst)
            print("  %-26s %-16s %s" % (m, suf, im.size))
        else:
            if suf == "Albedo":
                raise SystemExit("no albedo for " + m)
            Image.new("RGBA", (64, 64), FLAT[suf] + (255,)).save(dst)
            print("  %-26s %-16s flat %s" % (m, suf, FLAT[suf]))
        keep.add(os.path.basename(dst))
    asg[m] = "CharMOD/%s/%s" % (stem, fname)
for c in RM.set_material_textures(hmd, asg):
    print("  texture %s %s: %s -> %s" % c)
strays = os.path.join(GR, "_converter_strays", stem)
for f in os.listdir(folder):
    if f.lower().endswith(".png") and f not in keep:
        os.makedirs(strays, exist_ok=True)
        shutil.move(os.path.join(folder, f), os.path.join(strays, f))
        print("  moved unreferenced", f, "-> _converter_strays")

# ---- normals, prefab, props ---------------------------------------------------------------------------------------
d = H.load(hmd)
g = d.geometries[0]
zero, agree = fix_normals.stats(H.decode_vertices(d, g), [i for s in H.decode_indices(d, g) for i in s])
print("normals: %d zero-length, %.1f%% agree" % (zero, agree))
if zero > g.vertexCount * 0.01 or agree < 90:
    fix_normals.fix(hmd, hmd)
    os.remove(hmd + ".bak")
    print("  normals repaired")

tpl = json.load(open(TEMPLATE, encoding="utf-8"))
kids = []
for c in tpl["children"]:
    if c.get("name") == "Gun" or c.get("object") in ("Gun", "Gun_Smuggler"):
        continue
    c = dict(c)
    if c["type"] == "model":
        c["name"], c["source"] = stem, "CharMOD/%s/%s.hmd" % (stem, stem)
    if "target" in c:
        c["target"] = c["target"].replace("Male01_SmugglerMercenary", stem)
    kids.append(c)
prefab = os.path.join(folder, "Prefab_%s.prefab" % short)
with open(prefab, "w", encoding="utf-8", newline="\n") as fh:
    json.dump({"type": "prefab", "children": kids}, fh, indent="\t")
    fh.write("\n")
shutil.copy2(props_tpl, os.path.join(folder, "props.json"))
props = {"materials": {"PBR": {m: {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back", "depthTest": "Less",
                                    "colorMask": 15, "enableStencil": False, "emissive": 0.1} for m in mats}}}
with open(os.path.join(folder, "materials.props"), "w", encoding="utf-8", newline="\n") as fh:
    json.dump(props, fh, indent="\t")

r = subprocess.run([sys.executable, os.path.join(SK, "check_hmd.py"), hmd, "--rig", "Male01", "--res-root", GR],
                   capture_output=True, text=True)
print(r.stdout[-2500:], r.stderr[-1500:])
print("PACKAGE", folder, "files:", sorted(os.listdir(folder)))
print("cdb mesh path: CharMOD/%s/Prefab_%s.prefab" % (stem, short))
