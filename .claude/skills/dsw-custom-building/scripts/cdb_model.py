"""Point one building row's model at a new prefab. Changes only visuals.model[0].path of that row.

    py -3 cdb_model.py <project> <BuildingRowId> <prefab path>            # dry run
    py -3 cdb_model.py <project> <BuildingRowId> <prefab path> --apply    # backup <project>/07_data_cdb/data_BEFORE_building_model.cdb, write
    py -3 cdb_model.py <project> <BuildingRowId> --revert                 # put back the path the backup had

The thumbnail (visuals icon fields) is left as it was. No construction prefab is needed:
StructureModel.makeBuildingObj loads <prefab>_Construction.prefab only when it exists.
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
args = [a for a in sys.argv[1:] if not a.startswith("--")]
proj, row_id = os.path.abspath(args[0]), args[1]
BACKUP = os.path.join(proj, "07_data_cdb", "data_BEFORE_building_model.cdb")


def load(p):
    raw = open(p, "rb").read().decode("utf-8")
    return raw, json.loads(raw)


def row_of(data):
    return next(r for s in data["sheets"] if s["name"] == "building" for r in s["lines"] if r["id"] == row_id)


raw, data = load(CDB)
nl = "\r\n" if "\r\n" in raw else "\n"
row = row_of(data)
if "--revert" in sys.argv:
    assert os.path.exists(BACKUP), "no backup " + BACKUP
    want = row_of(load(BACKUP)[1])["visuals"]["model"][0]["path"]
else:
    want = args[2]
cur = row["visuals"]["model"][0]["path"]
print("%s model: %s -> %s" % (row_id, cur, want))
if cur == want:
    raise SystemExit("nothing to do")
if not ("--apply" in sys.argv or "--revert" in sys.argv):
    raise SystemExit("dry run (add --apply)")
if "--apply" in sys.argv and not os.path.exists(BACKUP):
    os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
    shutil.copy2(CDB, BACKUP)
    print("backup", BACKUP)
row["visuals"]["model"][0]["path"] = want
open(CDB, "wb").write(json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", nl).encode("utf-8"))
print("wrote", CDB)
