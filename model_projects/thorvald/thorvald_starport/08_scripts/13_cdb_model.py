"""Point Th_ConsignmentTerminal's model at the copper starport (06_game_ready/StructMOD/ThorvaldConsignmentTerminal).

    py -3 08_scripts/13_cdb_model.py            # dry run: prints the change
    py -3 08_scripts/13_cdb_model.py --apply    # backs up to 07_data_cdb/data_BEFORE_terminal_model.cdb, then writes
    py -3 08_scripts/13_cdb_model.py --revert   # puts the Spacing Guild Branch prefab back

Only visuals.model of the one row changes. The thumbnail stays the Guild Branch's. No construction prefab is needed:
StructureModel.makeBuildingObj loads <prefab>_Construction.prefab only when it exists.
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_terminal_model.cdb")
ROW = "Th_ConsignmentTerminal"
NEW = "StructMOD/ThorvaldConsignmentTerminal/Prefab_ThorvaldConsignmentTerminal.prefab"
OLD = "Structure/Buildings/SpacingGuildBranch/Prefab_SpacingGuildBranch.prefab"

raw = open(CDB, "rb").read().decode("utf-8")
nl = "\r\n" if "\r\n" in raw else "\n"
data = json.loads(raw)
row = next(r for s in data["sheets"] if s["name"] == "building" for r in s["lines"] if r["id"] == ROW)
want = OLD if "--revert" in sys.argv else NEW
cur = row["visuals"]["model"][0]["path"]
print("%s model: %s -> %s" % (ROW, cur, want))
if cur == want:
    print("nothing to do")
    raise SystemExit
if not ("--apply" in sys.argv or "--revert" in sys.argv):
    print("dry run (add --apply)")
    raise SystemExit
if "--apply" in sys.argv and not os.path.exists(BACKUP):
    os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
    shutil.copy2(CDB, BACKUP)
    print("backup", BACKUP)
row["visuals"]["model"][0]["path"] = want
open(CDB, "wb").write(json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", nl).encode("utf-8"))
print("wrote", CDB)
