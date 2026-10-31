"""Point the Thorvald frigate slot (model A_Frigate = the Atreides/Thorvald utility frigate, formerly the Kraken)
at the new vehicle. Only the model row changes; the unit row (stats, costs, FX, attack) is untouched.

    python 52_cdb_edit.py [--revert]

model A_Frigate: mesh -> VehMOD prefab, rigName 15 (Kraken) -> 29 (RenegadeFrigate: our skeleton is the Renegade's),
inherit Kraken -> RenegadeFrigate (its Run/Idle/FightIdle/Death animations), scale 1.6 -> 1.2 (our hull is ~10.5 long
vs the Kraken's 8.0, so the on-screen footprint stays about the same).
"""
import json
import os
import sys

SK = r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts"
sys.path.insert(0, SK)
import cdb_tools as C  # noqa: E402
from dsw_common import cdb_path  # noqa: E402

PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NEW = {"mesh": [{"path": "VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab"}],
       "rigName": 29, "inherit": "RenegadeFrigate", "scale": 1.2}
OLD = {"mesh": [{"path": "Vehicle/Atreide/Kraken/Prefab_Kraken.prefab"}],
       "rigName": 15, "inherit": "Kraken", "scale": 1.6}

path = cdb_path()
data, exact = C.load(path)
row = C.by_id(C.sheets(data)["model"])["A_Frigate"]
rows = C.by_id(C.sheets(data)["model"])
assert "RenegadeFrigate" in rows, "model RenegadeFrigate (animation set) missing"
target = OLD if "--revert" in sys.argv else NEW
before = {k: row.get(k) for k in NEW}
row.update(target)
print("model A_Frigate:", json.dumps(before), "->", json.dumps(target))
C.save(path, data, "frigate_revert" if "--revert" in sys.argv else "thorvald_frigate")
os.makedirs(os.path.join(PROJ, "07_data_cdb"), exist_ok=True)
with open(os.path.join(PROJ, "07_data_cdb", "A_Frigate_model_edit.json"), "w") as f:
    json.dump({"model": "A_Frigate", "before": before, "after": target}, f, indent=2)
