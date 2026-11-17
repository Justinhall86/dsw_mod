"""Cruiser FBX (80_export_cruiser.py) -> game-ready VehMOD/Thorvald_Frigate folder (same path the Th_Frigate and
A_Frigate model rows already use, so no model-row edit is needed).

    python 81_convert_cruiser.py 05_fbx_export/Thorvald_Frigate.fbx

1. archive the previous 06_game_ready/VehMOD/Thorvald_Frigate (v13 Renegade kitbash) to 06_game_ready/_archive/
2. toolkit convert_fbx.py, skeleton restored from the vanilla Renegade_Frigate HMD (model_inputs copy)
3. RGBA textures, normals check, props.json (Renegade anim path) + materials.props
4. bind fix (thorvald_ship/08_scripts/53_fix_bind.py logic) against the vanilla Renegade
5. prefab: muzzles as children of the model in RAW HMD coordinates (like the vanilla Kraken prefab), local +X = fire
   direction. Names: MuzzleA-D (Th_Frigate_Attack fires A..E; E = A again) plus E and the Kraken-style names the
   A_Frigate attack uses (MuzzleA_2..4, MuzzleB_2..4), each mapped onto one of the 4 cannons.
"""
import datetime, json, math, os, shutil, struct, subprocess, sys

import numpy as np

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
sys.path.insert(0, os.path.join(TOOLKIT, "Models"))
import hmd_reader as H  # noqa: E402
import retexture_materials as RM  # noqa: E402

fbx = os.path.abspath(sys.argv[1])
stem = "Thorvald_Frigate"
resdir = "VehMOD"
GR = os.path.join(PROJ, "06_game_ready")
outdir = os.path.join(GR, resdir)
folder = os.path.join(outdir, stem)
ref = os.path.join(REPO, "model_inputs", "Vehicle", "Common", "Renegade_Frigate", "Renegade_Frigate.fbx")  # HMD
d4x = r"D:\Steam\steamapps\common\D4X\D4X.exe"

# ---- 1. archive the old build ---------------------------------------------------------------
sys.path.insert(0, os.path.join(REPO, "mod_files"))
import safe_write as SW  # noqa: E402   2026-11-13: stop if any file in the folder was hand-edited (--force to override)
SW.check_dir(folder)
if os.path.isdir(folder):
    arch = os.path.join(GR, "_archive", "Thorvald_Frigate_prev_" + datetime.date.today().isoformat())
    if not os.path.exists(arch):
        shutil.copytree(folder, arch)
        print("archived old build ->", arch)
    for f in os.listdir(folder):
        os.remove(os.path.join(folder, f))          # the copy above is the backup

# ---- 2. convert -------------------------------------------------------------------------------
cmd = [sys.executable, os.path.join(TOOLKIT, "Repackager", "convert_fbx.py"), "model", fbx,
       "--ref", ref, "--outdir", outdir, "--resdir", resdir]
if os.path.exists(d4x):
    cmd += ["--d4x", d4x]
print(">", " ".join(cmd))
r = subprocess.run(cmd, cwd=os.path.join(TOOLKIT, "Repackager"))
hmd = os.path.join(folder, stem + ".hmd")
if not os.path.exists(hmd):
    alt = os.path.join(outdir, stem + ".hmd")
    if os.path.exists(alt):
        os.makedirs(folder, exist_ok=True); shutil.move(alt, hmd)
if r.returncode != 0 or not os.path.exists(hmd):
    sys.exit("conversion failed (exit %s); expected %s" % (r.returncode, hmd))

# ---- 3. textures, normals, props ----------------------------------------------------------
from PIL import Image  # noqa: E402
for key in ("Albedo", "MetallicGlossAO", "Normal"):
    dst = os.path.join(folder, "%s_%s.png" % (stem, key))
    if not os.path.exists(dst):
        shutil.copyfile(os.path.join(PROJ, "04_textures", "%s_%s.png" % (stem, key)), dst)
for f in os.listdir(folder):
    if f.lower().endswith(".png"):
        p = os.path.join(folder, f); im = Image.open(p)
        if im.mode != "RGBA":
            im.convert("RGBA").save(p); print("  %s: %s -> RGBA" % (f, im.mode))
d = H.load(hmd); g = d.geometries[0]
zero, agree = fix_normals.stats(H.decode_vertices(d, g), [i for s in H.decode_indices(d, g) for i in s])
print("normals: %d zero-length of %d, %.1f%% agree" % (zero, g.vertexCount, agree))
if zero > g.vertexCount * 0.01 or agree < 90:
    print("normals broken -> repairing"); fix_normals.fix(hmd, hmd); os.remove(hmd + ".bak")
with open(os.path.join(folder, "props.json"), "w", encoding="utf-8", newline="\n") as f:
    f.write('{\n\t"hmd.animPaths" : ["/Anim/RenegateFregate/"]\n}')
mats = [m["name"] for m in RM.list_materials(hmd).values()]
print("HMD materials:", mats, " models:", [m.name for m in d.models])
mp = {"materials": {"PBR": {m: {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back",
                                "depthTest": "Less", "colorMask": 15, "enableStencil": False, "emissive": 1}
                            for m in mats}}}
with open(os.path.join(folder, "materials.props"), "w", encoding="utf-8", newline="\n") as f:
    json.dump(mp, f, indent="\t")


# ---- 4. bind fix ------------------------------------------------------------------------------
def binds(path):
    out = {}
    for m in H.load(path).models:
        if getattr(m, "skin", None):
            for j in m.skin.joints:
                if j.transpos is not None:
                    out[j.name] = j.transpos
    return out


pack = lambda p: struct.pack("<6f", p.x, p.y, p.z, p.qx, p.qy, p.qz)
want, have = binds(ref), binds(hmd)
raw = bytearray(open(hmd, "rb").read())
for name, p in have.items():
    q = want[name]
    if pack(p) == pack(q):
        print("  bind %-7s already matches" % name); continue
    assert raw.count(pack(p)) == 1, "bind bytes for %s not unique" % name
    i = raw.find(pack(p)); raw[i:i + 24] = pack(q)
    print("  bind %-7s q (%.3f %.3f %.3f) -> (%.3f %.3f %.3f)" % (name, p.qx, p.qy, p.qz, q.qx, q.qy, q.qz))
open(hmd, "wb").write(raw)
after = binds(hmd)
assert all(pack(after[n]) == pack(want[n]) for n in after), "bind verify failed"
print("binds match vanilla Renegade")


# ---- 5. prefab --------------------------------------------------------------------------------
def init_rot(x, y, z):
    """Heaps h3d.Matrix.initRotation (row-vector convention), radians: row 0 = image of local X."""
    cx, sx, cy, sy, cz, sz = math.cos(x), math.sin(x), math.cos(y), math.sin(y), math.cos(z), math.sin(z)
    return np.array([[cy * cz, cy * sz, -sy],
                     [sx * sy * cz - cx * sz, sx * sy * sz + cx * cz, sx * cy],
                     [cx * sy * cz + sx * sz, cx * sy * sz - sx * cz, cx * cy]])


M = json.load(open(os.path.join(os.path.dirname(fbx), "cruiser_muzzles_raw.json")))
fire = np.array(M["fire_dir_raw"])
best = None                                   # find the rotationY that points local +X along the fire direction
for deg in range(-180, 181):
    v = init_rot(0, math.radians(deg), 0)[0]
    e = np.abs(v - fire).max()
    if best is None or e < best[1]:
        best = (deg, e)
assert best[1] < 1e-6, "fire direction is not a pure yaw in the raw frame: %s" % fire
ROTY = best[0]
print("muzzle rotationY", ROTY, "(local +X ->", fire, ")")
alias = {"MuzzleA": "MuzzleA", "MuzzleB": "MuzzleB", "MuzzleC": "MuzzleC", "MuzzleD": "MuzzleD", "MuzzleE": "MuzzleA",
         "MuzzleA_2": "MuzzleC", "MuzzleA_3": "MuzzleA", "MuzzleA_4": "MuzzleC",
         "MuzzleB_2": "MuzzleD", "MuzzleB_3": "MuzzleB", "MuzzleB_4": "MuzzleD"}
kids = []
for name, src in alias.items():
    x, y, z = M["muzzles"][src]["raw"]
    kids.append({"type": "object", "name": name, "x": round(x, 5), "y": round(y, 5), "z": round(z, 5),
                 "rotationY": ROTY})
prefab = {"type": "prefab", "children": [
    {"type": "model", "name": stem, "source": "%s/%s/%s.hmd" % (resdir, stem, stem),
     "children": [{"type": "object", "name": "Muzzles", "children": kids}]}]}
ppath = os.path.join(folder, "Prefab_%s.prefab" % stem)
with open(ppath, "w", encoding="utf-8", newline="\n") as f:
    json.dump(prefab, f, indent="\t"); f.write("\n")
print("prefab:", ppath, len(kids), "muzzles")
subprocess.run([sys.executable, os.path.join(SK, "check_hmd.py"), hmd])
print("FILES", sorted(os.listdir(folder)))
SW.record_dir(folder)
print("CONVERT_OK")
