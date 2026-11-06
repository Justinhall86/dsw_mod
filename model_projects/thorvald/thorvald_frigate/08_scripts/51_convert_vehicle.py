"""FBX (from 50_export_fbx.py) -> game-ready vehicle folder in the editor's res tree.

    python 51_convert_vehicle.py 05_fbx_export/Thorvald_Frigate.fbx

 1. toolkit convert_fbx.py model, skeleton restored from the VANILLA Renegade_Frigate HMD (the "Custom" rig case)
 2. textures -> RGBA (alpha 255), normals checked/repaired, check_hmd
 3. props.json (animation search path of the Renegade rig) + materials.props (PBR + emissive, keyed by our material)
 4. prefab: the Kraken's (A_Frigate's current) prefab with the model swapped; the 8 MuzzleA/B* points the
    A_Frigate attack fires its missiles from are kept, moved to our nose and turned 180 deg about the up axis
    (raw HMD frame: Kraken nose is +Z, ours is -Z).
Output: <editor>/res/res/VehMOD/Thorvald_Frigate/ and a copy in 06_game_ready/.
"""
import json
import math
import os
import shutil
import subprocess
import sys

import numpy as np

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
ref = os.path.join(extr, "Vehicle", "Common", "Renegade_Frigate", "Renegade_Frigate.fbx")   # HMD in disguise
d4x = os.path.join(cfg("game_dir"), "D4X.exe")

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

# ---- props.json + materials.props
with open(os.path.join(folder, "props.json"), "w", encoding="utf-8", newline="\n") as f:
    f.write('{\n\t"hmd.animPaths" : ["/Anim/RenegateFregate/"]\n}')
mats = [m["name"] for m in RM.list_materials(hmd).values()]
print("HMD materials:", mats)
mp = {"materials": {"PBR": {m: {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back",
                                "depthTest": "Less", "colorMask": 15, "enableStencil": False, "emissive": 1}
                            for m in mats}}}
with open(os.path.join(folder, "materials.props"), "w", encoding="utf-8", newline="\n") as f:
    json.dump(mp, f, indent="\t")


# ---- prefab from the Kraken's
def init_rot(x, y, z):
    """Heaps h3d.Matrix.initRotation (row-vector convention), radians."""
    cx, sx, cy, sy, cz, sz = math.cos(x), math.sin(x), math.cos(y), math.sin(y), math.cos(z), math.sin(z)
    return np.array([[cy * cz, cy * sz, -sy],
                     [sx * sy * cz - cx * sz, sx * sy * sz + cx * cz, sx * cy],
                     [cx * sy * cz + sx * sz, cx * sy * sz - sx * cz, cx * cy]])


def euler(m):
    y = math.asin(max(-1, min(1, -m[0, 2])))
    return math.atan2(m[1, 2], m[2, 2]), y, math.atan2(m[0, 1], m[0, 0])


kp = os.path.join(extr, "Vehicle", "Atreide", "Kraken", "Prefab_Kraken.prefab")
prefab = json.load(open(kp, encoding="utf-8"))
model = next(c for c in prefab["children"] if c.get("type") == "model")
model["name"] = stem
model["source"] = "%s/%s/%s.hmd" % (resdir, stem, stem)
muz = next(c for c in model["children"] if c.get("name") == "Muzzles")
m0 = init_rot(*(math.radians(muz.get(k, 0)) for k in ("rotationX", "rotationY", "rotationZ")))
m1 = m0 @ init_rot(0, math.pi, 0)                      # turn the group about the raw up axis (Y)
rx, ry, rz = (math.degrees(a) for a in euler(m1))
assert np.allclose(init_rot(*(math.radians(a) for a in (rx, ry, rz))), m1, atol=1e-6)
# nose-top of the ship in vanilla world (x fwd +, up z) -> raw data (x=-y, y=z, z=-x)
wx, wy, wz = 3.2, 0.0, 2.7
muz["x"], muz["y"], muz["z"] = round(-wy, 5), round(wz, 5), round(-wx, 5)
muz["rotationX"], muz["rotationY"], muz["rotationZ"] = round(rx, 3), round(ry, 3), round(rz, 3)
print("Muzzles group:", {k: muz[k] for k in ("x", "y", "z", "rotationX", "rotationY", "rotationZ")})
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
