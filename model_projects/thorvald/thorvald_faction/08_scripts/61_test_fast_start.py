"""TEST START for House Thorvald: big starting stockpile and army, free Renegade operations.

    python 61_test_fast_start.py            # DRY RUN
    python 61_test_fast_start.py --apply    # edit data.cdb (backup first)
    python 61_test_fast_start.py --revert   # put the original values back (data edit, no file restore needed)

Changes:
  faction Thorvald startResources   Solari 10000, Intel 10000, Authority 500, Knowledge 500 (Skirmish and Kanly entries)
  structure ThorvaldCitadel startUnits   10 ornithopters, 10 Iron Rangers (TH_Soldier), 5 troopers, 3 Iron Guards, 2 Vanguards
  missions Th_MRenegadeStrike / Th_MIronLandfall / Th_MRenegadeTakeover   cost []
The frigate and the fighter are not start units: no vanilla structure starts with a ship, so a bad spawn could crash
every game start. With the test trait (60_test_free_army.py) they are free and near-instant to recruit.
"""
import copy
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

# original values (Corrino clone), used by --revert
ORIG_RES = [{"res": "Solari", "qty": 1000}, {"res": "Plascrete", "qty": 500}, {"res": "Manpower", "qty": 160},
            {"res": "Authority", "qty": 60}, {"qty": 50, "res": "Influence"}, {"qty": 50, "res": "Intel"},
            {"res": "Standing", "qty": 250}, {"qty": 50, "res": "CHOAMShare"}, {"qty": 40, "res": "GuildFavor"},
            {"qty": 3000, "res": "Solari", "gameMode": "Kanly"}, {"qty": 1500, "res": "Plascrete", "gameMode": "Kanly"},
            {"qty": 250, "res": "Manpower", "gameMode": "Kanly"}, {"qty": 100, "res": "Influence", "gameMode": "Kanly"},
            {"qty": 50, "res": "Intel", "gameMode": "Kanly"}]
ORIG_UNITS = [{"unit": "TH_Ornithopter"}]
MISSIONS = {"Th_MRenegadeStrike": [{"qty": 100, "res": "Intel"}, {"qty": 300, "res": "Solari"}],
            "Th_MIronLandfall": [{"qty": 100, "res": "Intel"}, {"qty": 200, "res": "Solari"}],
            "Th_MRenegadeTakeover": [{"qty": 150, "res": "Intel"}, {"qty": 500, "res": "Solari"}]}

fac = C.by_id(S["faction"])["Thorvald"]
cit = C.by_id(S["structure"])["ThorvaldCitadel"]
mis = C.by_id(S["mission"])

if REVERT:
    fac["startResources"] = copy.deepcopy(ORIG_RES)
    cit["startUnits"] = copy.deepcopy(ORIG_UNITS)
    for k, cost in MISSIONS.items():
        mis[k]["cost"] = copy.deepcopy(cost)
else:
    BIG = {"Solari": 10000, "Intel": 10000, "Authority": 500, "Knowledge": 500}
    res = [r for r in ORIG_RES if r["res"] not in BIG]
    for name, qty in BIG.items():
        res.append({"res": name, "qty": qty})
        res.append({"res": name, "qty": qty, "gameMode": "Kanly"})
    fac["startResources"] = res
    cit["startUnits"] = [{"unit": u} for u, n in (("TH_Ornithopter", 10), ("TH_Soldier", 10), ("TH_Trooper", 5),
                                                  ("TH_Special", 3), ("TH_Elite", 2)) for _ in range(n)]
    for k in MISSIONS:
        mis[k]["cost"] = []
print("startResources:", fac["startResources"])
print("startUnits:", len(cit["startUnits"]), "entries")
print("mission costs:", {k: mis[k]["cost"] for k in MISSIONS})

if APPLY:
    print("backup:", C.backup(REAL, "before_fast_start" if not REVERT else "before_fast_start_revert"))
open(WORK, "wb").write(C.dumps(data))
print(("reverted " if REVERT else "wrote ") + WORK)
