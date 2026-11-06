"""Convert the four HMD-named vehicle/ship .fbx inputs into real FBX.

    python 00_convert_inputs.py

Game files under model_inputs/ start with the bytes "HMD" and Blender cannot
import them ("Invalid header" - see dsw-new-unit lessons.md). Output goes to
<project>/05_fbx_export/, the same convention convert_hmd_inputs.py uses.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PROJ))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd2fbx  # noqa: E402

OUT = os.path.join(PROJ, "05_fbx_export")
os.makedirs(OUT, exist_ok=True)

JOBS = {
    "Wraith_TRUE_FBX.fbx": "Vehicle/Smuggler/Wraith/Wraith.fbx",
    "DroneS_TRUE_FBX.fbx": "Vehicle/Smuggler/DroneS/DroneS.fbx",
    "Harvester_TRUE_FBX.fbx": "Vehicle/Atreide/Harvester/Vehicule_Harvester.fbx",
    "CarryAll_TRUE_FBX.fbx": "Vehicle/Atreide/CarryAll/CarryAll.fbx",
}

for name, rel in JOBS.items():
    src = os.path.join(REPO, "model_inputs", rel.replace("/", os.sep))
    dst = os.path.join(OUT, name)
    hmd2fbx.convert(src, dst, verbose=False)
    with open(dst, "rb") as fh:
        magic = fh.read(18)
    size = os.path.getsize(dst)
    print("CONVERTED %-24s %8d bytes  header=%r" % (name, size, magic[:16]))
    if not magic.startswith(b"Kaydara FBX Binary"):
        print("   !! not a real FBX")
