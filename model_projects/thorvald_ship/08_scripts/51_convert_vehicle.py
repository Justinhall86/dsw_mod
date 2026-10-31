"""FBX (from 50_export_fbx.py) -> game-ready vehicle folder in the editor's res tree, on the Hammer rig.

    python 51_convert_vehicle.py 05_fbx_export/Thorvald_Ship.fbx

 1. toolkit convert_fbx.py model, skeleton restored from the VANILLA Hammer HMD
 2. textures -> RGBA (alpha 255), normals checked/repaired, check_hmd
 3. props.json (Hammer animation path), <stem>.props (Hammer death-fall events), materials.props (PBR)
 4. prefab: the Hammer's, with the model swapped, the constraint re-targeted to our model, and the six
    Muzzle points moved onto our twin chin barrels (spread rotations kept, so the volley still fans out).
    Muzzle coords are B_Body-local: raw = (wx, wz - 0.532, -wy) in the Hammer world frame (B_Body head at 0.532),
    checked against the Hammer's own chin pods (MuzzleA/B land on them).
Output: <editor>/res/res/VehMOD/Thorvald_Ship/ and a copy in 06_game_ready/.
"""
import json
import os
import shutil
import subprocess
import sys

SK = r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts"
sys.path.insert(0, SK)
from dsw_common import cfg, editor_res  # noqa: E402
import fix_normals  # noqa: E402

sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402
import retexture_materials as RM  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
fbx = os.path.abspath(sys.argv[1])
stem = os.path.splitext(os.path.basename(fbx))[0]
resdir = "VehMOD"
outdir = os.path.join(editor_res(), "res", resdir)
folder = os.path.join(outdir, stem)
toolkit = cfg("toolkit_dir")
extr = cfg("extr_dir")
van = os.path.join(extr, "Vehicle", "Imperial", "Hammer")
ref = os.path.join(van, "Hammer.fbx")   # HMD in disguise
d4x = os.path.join(cfg("game_dir"), "D4X.exe")

# barrel tips in our build frame (01_input/final/FINAL_ship.json: muzzle x -2.0, y +-0.13, z -0.185)
# -> Hammer world via 50_export_fbx (GEO 0.84, Rz +90, z +0.39)
GEO, ZC = 0.84, 0.39
TIP = (-2.0, 0.13, -0.185)
B_BODY_Z = 0.532

cmd = [sys.executable, os.path.join(toolkit, "Repackager", "convert_fbx.py"), "model", fbx,
       "--ref", ref, "--outdir", outdir, "--resdir", resdir]
if os.path.exists(d4x):
    cmd += ["--d4x", d4x]
print(">", " ".join(cmd))
r = subprocess.run(cmd, cwd=os.path.join(toolkit, "Repackager"))
hmd = os.path.join(folder, stem + ".hmd")
if r.returncode != 0 or not os.path.exists(hmd):
    sys.exit("conversion failed (exit %s); expected %s" % (r.returncode, hmd))

# ---- textures RGBA
from PIL import Image  # noqa: E402
for f in os.listdir(folder):
    if f.lower().endswith(".png"):
        p = os.path.join(folder, f)
        im = Image.open(p)
        if im.mode != "RGBA":
            im.convert("RGBA").save(p)
            print("  %s: %s -> RGBA" % (f, im.mode))

# ---- normals
d = H.load(hmd)
g = d.geometries[0]
zero, agree = fix_normals.stats(H.decode_vertices(d, g), [i for s in H.decode_indices(d, g) for i in s])
print("normals: %d zero-length of %d, %.1f%% agree" % (zero, g.vertexCount, agree))
if zero > g.vertexCount * 0.01 or agree < 90:
    print("normals broken -> repairing")
    fix_normals.fix(hmd, hmd)
    os.remove(hmd + ".bak")

# ---- props.json + <stem>.props + materials.props
shutil.copyfile(os.path.join(van, "props.json"), os.path.join(folder, "props.json"))
shutil.copyfile(os.path.join(van, "Hammer.props"), os.path.join(folder, stem + ".props"))
mats = [m["name"] for m in RM.list_materials(hmd).values()]
print("HMD materials:", mats)
mp = {"materials": {"PBR": {m: {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back",
                                "depthTest": "Less", "colorMask": 15, "enableStencil": False, "emissive": 1}
                            for m in mats}}}
with open(os.path.join(folder, "materials.props"), "w", encoding="utf-8", newline="\n") as f:
    json.dump(mp, f, indent="\t")

# ---- prefab from the Hammer's
prefab = json.load(open(os.path.join(van, "Prefab_Hammer.prefab"), encoding="utf-8"))
model = next(c for c in prefab["children"] if c.get("type") == "model" and c.get("name") == "Hammer")
model["name"] = stem
model["source"] = "%s/%s/%s.hmd" % (resdir, stem, stem)
con = next(c for c in prefab["children"] if c.get("type") == "constraint")
con["object"] = con["object"].replace("Hammer.", stem + ".", 1)
con["target"] = con["target"].replace("Hammer.", stem + ".", 1)
muz = next(c for c in model["children"] if c.get("name") == "Muzzles")
assert muz.get("rotationX") == 90 and not muz.get("rotationY") and not muz.get("rotationZ")
gx, gy, gz = muz.get("x", 0), muz.get("y", 0), muz.get("z", 0)
for c in muz["children"]:
    side = 1 if c.get("x", 0) > 0 else -1          # B* on +x, A* on -x (Hammer convention)
    lx, ly, lz = TIP[0] * GEO, side * TIP[1] * GEO, TIP[2] * GEO + ZC
    wx, wy, wz = -ly, lx, lz                         # Rz +90: (x, y) -> (-y, x); nose -X -> -Y
    wx = side * abs(wx)
    raw = (wx, wz - B_BODY_Z, -wy)                   # B_Body-local
    # group: rotX +90 maps child (x, y, z) -> (x, -z, y), then + group position
    dx, dy, dz = raw[0] - gx, raw[1] - gy, raw[2] - gz
    c["x"], c["y"], c["z"] = round(dx, 4), round(dz, 4), round(-dy, 4)
    print("  %-8s -> world (%.3f, %.3f, %.3f)  local %s" % (c["name"], wx, wy, wz, (c["x"], c["y"], c["z"])))
ppath = os.path.join(folder, "Prefab_%s.prefab" % stem)
with open(ppath, "w", encoding="utf-8", newline="\n") as f:
    json.dump(prefab, f, indent="\t")
    f.write("\n")
print("prefab:", ppath)

# ---- check + copy into the project
chk = os.path.join(SK, "check_hmd.py")
subprocess.run([sys.executable, chk, hmd])
dst = os.path.join(PROJ, "06_game_ready", resdir, stem)
shutil.copytree(folder, dst, dirs_exist_ok=True)
print("copied to", dst)
print("FILES", sorted(os.listdir(folder)))
