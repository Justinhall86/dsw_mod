"""Convert <project>/05_fbx_export/<Name>.fbx into game files: HMD + 3 PNGs + materials.props + prefab (no Blender).

    py -3 convert_building.py <project> <Name> [--resdir StructMOD] [--rot 90] [--emissive 0.1]

The toolkit's convert_fbx `model` mode first rebuilds a skeleton from a skinned reference (fbxfix.fix) and raises
"has no skin" on a building. A building HMD is static (vanilla SpacingGuildBranch: one unskinned model, one material,
vertex format position/normal/tangent/uv, no colliders), so fbxfix.fix is replaced by a plain copy; everything else
(repack with the game's D4X.exe, texture extraction, HMD texture paths -> <resdir>/<Name>/) is the toolkit's own.

Output: <project>/06_game_ready/<resdir>/<Name>/. The prefab follows the vanilla Guild Branch's: the model with
rotationZ 90 (vanilla building geometry is Y-up with a node rotation; our Z-up export needs the same prefab turn to
face like the vanilla one; check with roundtrip_render.py), a dirt tdecal and the construction-start FX.
cdb model path printed at the end.
"""
import argparse
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
TK = os.path.join(REPO, "HMD_toolkit", "HMD_toolkit")

ap = argparse.ArgumentParser()
ap.add_argument("project")
ap.add_argument("name")
ap.add_argument("--resdir", default="StructMOD")
ap.add_argument("--rot", type=float, default=90)
ap.add_argument("--emissive", type=float, default=0.1)
A = ap.parse_args()
PROJ = os.path.abspath(A.project)
GAME = os.environ.get("DSW_GAME_DIR", "")
for g in (GAME, r"D:\Steam\steamapps\common\D4X", r"C:\Program Files (x86)\Steam\steamapps\common\D4X"):
    if g and os.path.exists(os.path.join(g, "D4X.exe")):
        GAME = g
        break
OUTROOT = os.path.join(PROJ, "06_game_ready", A.resdir)
OUT = os.path.join(OUTROOT, A.name)

sys.path[:0] = [os.path.join(TK, "Repackager"), os.path.join(TK, "Models")]
import fbxfix  # noqa: E402
import convert_fbx  # noqa: E402

fbxfix.fix = lambda src, dst, ref: shutil.copy2(src, dst) or dst      # static mesh: no skeleton to restore
if os.path.isdir(OUT):
    shutil.rmtree(OUT)
os.makedirs(OUTROOT, exist_ok=True)
sys.argv = ["convert_fbx.py", "model", os.path.join(PROJ, "05_fbx_export", A.name + ".fbx"), "--ref", "static",
            "--outdir", OUTROOT, "--resdir", A.resdir, "--d4x", os.path.join(GAME, "D4X.exe"), "--no-prefab"]
rc = convert_fbx.main()
if rc:
    raise SystemExit(rc)
hmd = os.path.join(OUT, A.name + ".hmd")
assert os.path.exists(hmd), hmd

import hmd_reader as H  # noqa: E402
d = H.load(hmd)
for m in d.models:
    print("model", m.name, "parent", m.parent, "skin", m.skin is not None)
for g in d.geometries:
    print("geometry", g.vertexCount, "verts, format", [f.name for f in g.vertexFormat.inputs],
          "bounds", [round(b, 3) for b in g.bounds])
for m in d.materials:
    print("material", m.name, m.diffuseTexture, m.specularTexture, m.normalMap)
    for p in (m.diffuseTexture, m.specularTexture, m.normalMap):
        assert p and os.path.exists(os.path.join(OUTROOT, "..", *p.split("/"))), "texture missing: %s" % p

json.dump({"materials": {"PBR": {d.materials[0].name: {
    "mode": "PBR", "blend": "None", "shadows": True, "culling": "Back", "depthTest": "Less", "colorMask": 15,
    "enableStencil": False, "emissive": A.emissive}}}}, open(os.path.join(OUT, "materials.props"), "w"), indent="\t")
prefab = {"type": "prefab", "children": [
    {"type": "model", "name": A.name, "source": "%s/%s/%s.hmd" % (A.resdir, A.name, A.name), "rotationZ": A.rot},
    {"type": "tdecal", "name": "tdecal", "x": -0.34302, "y": 0.78249, "z": -0.21002, "scaleX": 12, "scaleY": 12,
     "scaleZ": 1.01, "rotationZ": -8, "albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
     "normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"},
    {"type": "reference", "name": "FX_ConstructionStart", "source": "Fx/Structure/Common/FX_ConstructionStart.fx",
     "scaleX": 0.7, "scaleY": 0.7, "scaleZ": 0.7},
]}
json.dump(prefab, open(os.path.join(OUT, "Prefab_%s.prefab" % A.name), "w"), indent="\t")
print("game files:", sorted(os.listdir(OUT)))
print("cdb model path: %s/%s/Prefab_%s.prefab" % (A.resdir, A.name, A.name))
