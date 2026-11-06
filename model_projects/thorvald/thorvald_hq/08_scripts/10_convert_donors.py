"""Convert the HQ donor HMDs (the game's .fbx files are HMDs) to real FBX in the scratch folder.

    python 10_convert_donors.py

Writes %TEMP%/dsw_vehicle_preview/thv_hq/<name>.fbx and the textures as real PNGs, then prints each donor's bounds
(Blender, in metres, before the model-row scale) so the kitbash can be sized against Arrakeen and the Corrino base.
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
argv, sys.argv = sys.argv[1:], sys.argv[:1]
import build_previews as B  # noqa: E402

BASE = os.path.join(REPO, "model_inputs", "Structure", "Base")
BLD = os.path.join(REPO, "model_inputs", "Structure", "Buildings")
SCR = os.path.join(B.SCRATCH, "thv_hq")
os.makedirs(SCR, exist_ok=True)

# name -> (hmd path, textures prefix in the same folder)
DONORS = {
    "Outpost": (os.path.join(BASE, "ConquestOutpost", "ConquestOutpost.fbx"), "ConquestOutpost"),
    "Arrakeen": (os.path.join(BASE, "Arrakeen", "BaseArrakeen.fbx"), "ArrakeenAsset"),
    "ArrakeenAddon": (os.path.join(BASE, "Arrakeen", "BaseArrakeen_Addon.fbx"), "ArrakeenAsset"),
    "ArrakeenShips": (os.path.join(BASE, "Arrakeen", "RIG_BaseArrakeen_Ships.fbx"), "ArrakeenAsset"),
    "ArrakeenDoors": (os.path.join(BASE, "Arrakeen", "RIG_BaseArrakeen_Doors.fbx"), "ArrakeenAsset"),
    "Corrino": (os.path.join(BASE, "Corrino", "CorrinoBase.fbx"), "CorrinoBase"),
    "Indoctrination": (os.path.join(BLD, "IndoctrinationCenter", "IndoctrinationCenter.fbx"), "IndoctrinationCenter"),
}

BOUNDS_SIDE = r'''
import bpy, sys, json
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=sys.argv[sys.argv.index("--") + 1])
from mathutils import Vector
ms = [o for o in bpy.data.objects if o.type == "MESH"]
lo = [min((o.matrix_world @ Vector(c))[i] for o in ms for c in o.bound_box) for i in range(3)]
hi = [max((o.matrix_world @ Vector(c))[i] for o in ms for c in o.bound_box) for i in range(3)]
print("BOUNDS", json.dumps(dict(meshes=len(ms), verts=sum(len(o.data.vertices) for o in ms),
      arm=[o.name for o in bpy.data.objects if o.type == "ARMATURE"],
      lo=[round(v, 2) for v in lo], hi=[round(v, 2) for v in hi])))
'''


def main():
    side = os.path.join(SCR, "bounds_side.py")
    open(side, "w").write(BOUNDS_SIDE)
    for name, (hmd, _) in DONORS.items():
        if argv and name not in argv:
            continue
        out = os.path.join(SCR, name + ".fbx")
        try:
            B.convert_model(hmd, out)
        except Exception as exc:
            print("FAIL", name, exc)
            continue
        r = subprocess.run([B.BLENDER, "-b", "--factory-startup", "--python", side, "--", out],
                           capture_output=True, text=True)
        line = next((ln for ln in r.stdout.splitlines() if ln.startswith("BOUNDS")), "no bounds " + r.stdout[-400:])
        print(name, line)


if __name__ == "__main__":
    main()
