"""Point the House Thorvald fighter (model Th_Ship, a Hammer clone) at our Thorvald_Ship vehicle.
Only the mesh path changes: rig (21 Hammer), inherit (Hammer animations), scale (1.6), audio and the unit row
stay, because the HMD is skinned to the Hammer's own B_ROOT/B_Body skeleton.

    python 52_cdb_edit.py [--revert]
"""
import json
import os
import sys

SK = r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts"
sys.path.insert(0, SK)
import cdb_tools as C  # noqa: E402
from dsw_common import cdb_path  # noqa: E402

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NEW = {"mesh": [{"path": "VehMOD/Thorvald_Ship/Prefab_Thorvald_Ship.prefab"}]}
OLD = {"mesh": [{"path": "Vehicle/Imperial/Hammer/Prefab_Hammer.prefab"}]}

path = cdb_path()
data, exact = C.load(path)
row = C.by_id(C.sheets(data)["model"])["Th_Ship"]
assert row.get("rigName") == 21 and row.get("inherit") == "Hammer", "Th_Ship is no longer on the Hammer rig"
target = OLD if "--revert" in sys.argv else NEW
before = {k: row.get(k) for k in NEW}
row.update(target)
print("model Th_Ship:", json.dumps(before), "->", json.dumps(target))
C.save(path, data, "thship_revert" if "--revert" in sys.argv else "thorvald_ship")
os.makedirs(os.path.join(PROJ, "07_data_cdb"), exist_ok=True)
with open(os.path.join(PROJ, "07_data_cdb", "Th_Ship_model_edit.json"), "w") as f:
    json.dump({"model": "Th_Ship", "before": before, "after": target}, f, indent=2)
