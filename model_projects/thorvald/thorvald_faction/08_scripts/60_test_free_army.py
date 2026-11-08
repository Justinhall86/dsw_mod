"""TEST MODE for House Thorvald: every buildable Thorvald unit is unlocked from the start, free, near-instant and upkeep-free.

    python 60_test_free_army.py            # DRY RUN
    python 60_test_free_army.py --apply    # add trait Th_TestFreeArmy to Thorvald's startingTraits (backup first)
    python 60_test_free_army.py --revert   # remove the trait again (data edit, no file restore needed)

It's one starting trait, so it's easy to see and remove:
  Unlock_TUnit_Force <unit>        for every Thorvald unit that has a recruitment wheel slot
  Unit_ImportCost_MRatio  0        recruitment costs x0
  Unit_ImportTime_MRatio  0.01     recruitment time x0.01
  Army_StockUpkeep_MRatio 0        military upkeep x0
Starting traits are applied permanently (Faction constructor, EPermanent), which is what a test mode wants.
"""
import os
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
APPLY = "--apply" in sys.argv or "--revert" in sys.argv
REVERT = "--revert" in sys.argv
WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)
data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
S = C.sheets(data)
TID = "Th_TestFreeArmy"
traits = S["trait"]["lines"]
fac = C.by_id(S["faction"])["Thorvald"]
st = fac["props"]["startingTraits"]

for i in [i for i, t in enumerate(traits) if t["id"] == TID][::-1]:
    del traits[i]
st[:] = [t for t in st if t.get("trait") != TID]

if not REVERT:
    # every Thorvald unit a player can recruit; most inherit their wheel slot from the parent class, so filter by id
    SKIP = ("_Deployed", "_Conquest", "_Aramsham", "MissileShip", "Nuke_Area", "LazaTiger", "_Scavenged", "_Prototype", "_Lab")
    units = [u for u in S["unit"]["lines"] if u.get("faction") == "Thorvald" and not any(s in u["id"] for s in SKIP)]
    attrs = [{"target": {"unit": u["id"]}, "target2": {}, "ref": "Unlock_TUnit_Force", "displayed": False} for u in units]
    attrs += [
        {"target": {}, "target2": {}, "ref": "Unit_ImportCost_MRatio", "val": 0, "desc": "TEST: units cost nothing"},
        {"target": {}, "target2": {}, "ref": "Unit_ImportTime_MRatio", "val": 0.01, "desc": "TEST: units train almost instantly"},
        {"target": {}, "target2": {}, "ref": "Army_StockUpkeep_MRatio", "val": 0, "desc": "TEST: no military upkeep"},
        {"target": {}, "target2": {}, "ref": "Mission_Cost_MRatio", "val": 0, "desc": "TEST: operations cost nothing"},
        {"target": {}, "target2": {}, "ref": "Mission_PreparationTime_MRatio", "val": 0.01, "desc": "TEST: operations are ready almost at once"},
        {"target": {}, "target2": {}, "ref": "OperationSlot_Flat", "val": 7, "desc": "TEST: 7 extra operation slots"},
    ]
    row = {"id": TID, "name": "TEST: Free Army", "type": 0, "displayed": True,
           "desc": "Test mode: every Thorvald unit is available at once, free, and trains almost instantly.",
           "props": {"tip": {"allowed": True, "padExpand": True}}, "attributes": attrs,
           "gfx": {"file": "UI/Faction/factionButton00.png", "size": 64, "x": 4, "y": 0}}
    at = next(i for i, t in enumerate(traits) if t["id"] == "Thorvald")
    traits.insert(at + 1, row)
    st.append({"trait": TID, "displayed": True})
    print("units unlocked:", [u["id"] for u in units])

if APPLY:
    print("backup:", C.backup(REAL, "before_test_free_army" if not REVERT else "before_test_free_army_revert"))
open(WORK, "wb").write(C.dumps(data))
print(("removed " if REVERT else "added ") + TID, "->", WORK)
