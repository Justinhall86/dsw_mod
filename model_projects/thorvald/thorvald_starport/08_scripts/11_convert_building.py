"""Convert 05_fbx_export/ThorvaldConsignmentTerminal.fbx into the game HMD + textures + prefab (no Blender).

    py -3 08_scripts/11_convert_building.py

The toolkit's convert_fbx.py `model` mode first rebuilds a skeleton from a skinned reference (fbxfix). A building is a
static, unskinned mesh (the vanilla SpacingGuildBranch HMD: one model, one material, no skin), so that step is
replaced by a plain copy; the rest (local repack with the game's D4X.exe, embedded texture extraction to
<name>_{Albedo,MetallicGlossAO,Normal}.png, HMD texture paths rewired to StructMOD/<name>/) is the toolkit's own.

Output: 06_game_ready/StructMOD/ThorvaldConsignmentTerminal/ (HMD, 3 PNGs, materials.props, prefab). The prefab copies
the vanilla Guild Branch's: the model (rotationZ 90), the dirt decal and the construction-start FX; the Guild's
orange beacon is left out.
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
TK = os.path.join(REPO, "HMD_toolkit", "HMD_toolkit")
NAME = "ThorvaldConsignmentTerminal"
RESDIR = "StructMOD"
GAME = os.environ.get("DSW_GAME_DIR", r"D:\Steam\steamapps\common\D4X")
if not os.path.exists(os.path.join(GAME, "D4X.exe")):
    GAME = r"C:\Program Files (x86)\Steam\steamapps\common\D4X"
OUTROOT = os.path.join(PROJ, "06_game_ready", RESDIR)
OUT = os.path.join(OUTROOT, NAME)

sys.path[:0] = [os.path.join(TK, "Repackager"), os.path.join(TK, "Models")]
import fbxfix  # noqa: E402
import convert_fbx  # noqa: E402

fbxfix.fix = lambda src, dst, ref: shutil.copy2(src, dst) or dst      # static mesh: nothing to restore
if os.path.isdir(OUT):
    shutil.rmtree(OUT)
os.makedirs(OUTROOT, exist_ok=True)
sys.argv = ["convert_fbx.py", "model", os.path.join(PROJ, "05_fbx_export", NAME + ".fbx"), "--ref", "static",
            "--outdir", OUTROOT, "--resdir", RESDIR, "--d4x", os.path.join(GAME, "D4X.exe"), "--no-prefab"]
rc = convert_fbx.main()
if rc:
    raise SystemExit(rc)
hmd = os.path.join(OUT, NAME + ".hmd")
assert os.path.exists(hmd), hmd

import hmd_reader as H  # noqa: E402
d = H.load(hmd)
for m in d.models:
    print("model", m.name, "parent", m.parent, "skin", m.skin is not None, m.position)
for g in d.geometries:
    print("geometry", g.vertexCount, "verts, format", [f.name for f in g.vertexFormat.inputs], "bounds", [round(b, 3) for b in g.bounds])
for m in d.materials:
    print("material", m.name, m.diffuseTexture, m.specularTexture, m.normalMap)
    for p in (m.diffuseTexture, m.specularTexture, m.normalMap):
        assert p and os.path.exists(os.path.join(OUTROOT, "..", *p.split("/"))), "texture missing: %s" % p

json.dump({"materials": {"PBR": {d.materials[0].name: {
    "mode": "PBR", "blend": "None", "shadows": True, "culling": "Back", "depthTest": "Less", "colorMask": 15,
    "enableStencil": False, "emissive": 0.1}}}}, open(os.path.join(OUT, "materials.props"), "w"), indent="\t")
src = "%s/%s/%s.hmd" % (RESDIR, NAME, NAME)
prefab = {"type": "prefab", "children": [
    {"type": "model", "name": NAME, "source": src, "rotationZ": 90},
    {"type": "tdecal", "name": "tdecal", "x": -0.34302, "y": 0.78249, "z": -0.21002, "scaleX": 12, "scaleY": 12,
     "scaleZ": 1.01, "rotationZ": -8, "albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
     "normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"},
    {"type": "reference", "name": "FX_ConstructionStart", "source": "Fx/Structure/Common/FX_ConstructionStart.fx",
     "scaleX": 0.7, "scaleY": 0.7, "scaleZ": 0.7},
]}
json.dump(prefab, open(os.path.join(OUT, "Prefab_%s.prefab" % NAME), "w"), indent="\t")
print("game files:", sorted(os.listdir(OUT)))
print("cdb model path: %s/%s/Prefab_%s.prefab" % (RESDIR, NAME, NAME))
