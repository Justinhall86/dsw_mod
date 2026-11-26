"""Remove the soldier drop operations and four test drones (owner, 2026-11-21, after the 2026-11-20 playtest).

Owner: "Remove the unit drop operations and the drones I didn't like." Kept: the Spotter Drone TH_Drone3 (it worked; the owner
was unsure of its use but did not ask to remove it) and everything else in data.cdb.

    py -3.14 20_remove_drop_ops_and_drones.py            # dry run
    py -3.14 20_remove_drop_ops_and_drones.py --apply    # backup to 07_data_cdb/data_BEFORE_remove_drops_drones.cdb, then write
    py -3.14 20_remove_drop_ops_and_drones.py --revert   # restore that backup

Removed:
  - every row thorvald_drop_ops/08_scripts/10_add_drop_ops.py added (6 missions Th_MOp_*, 6 abilities Th_Op_*, 6 raids Th_Drop_*,
    units TH_Turret_Sniper / TH_Turret_Rocket, trait Th_Turret_Trait);
  - drones Thumper (TH_Drone1), Quartermaster (TH_Drone2), Signal (TH_Drone4), Smoke-Layer (TH_Drone5): their units, traits,
    abilities, and their Unlock_TUnit_Force lines on Th_TestFreeArmy.
Rows are deleted, not restored from an old backup, so later edits (Hammerfall removal, 2026-11-20) are kept.
"""
import json
import os
import re
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_remove_drops_drones.cdb")

OPS = ("SniperNest", "RocketBattery", "FieldDepot", "ThumperSwarm", "BlackHulls", "Firebase")
ROWS = {
    "mission": ["Th_MOp_" + o for o in OPS],
    "ability": ["Th_Op_" + o for o in OPS] + ["ThDrone1Install", "ThDrone1Leave", "ThDrone2Install", "ThDrone2Leave",
                                              "ThDrone4_Rally", "ThDrone4_Jam", "ThDrone5_Burst"],
    "raid": ["Th_Drop_" + o for o in OPS],
    "unit": ["TH_Turret_Sniper", "TH_Turret_Rocket", "TH_Drone1", "TH_Drone1_Deployed", "TH_Drone2", "TH_Drone2_Deployed",
             "TH_Drone4", "TH_Drone5"],
    "trait": ["Th_Turret_Trait", "Th_Drone1_Trait", "Th_Drone2_Buff", "Th_Drone2_Trait", "Th_Drone2_Depot",
              "Th_Drone4_Rally_Buff", "Th_Drone4_Jam_Debuff", "Th_Drone4_Trait", "Th_Drone4_Rally", "Th_Drone4_Jam",
              "Th_Drone5_Debuff", "Th_Drone5_Choke", "Th_Drone5_Buff", "Th_Drone5_Trait"],
}
GONE = {i for v in ROWS.values() for i in v}

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit

raw = open(CDB, encoding="utf-8", newline="").read()
NL = "\r\n" if "\r\n" in raw else "\n"
d = json.loads(raw.lstrip("﻿"))
S = {s["name"]: s for s in d["sheets"]}


def remove(sheet, rid):
    lines = S[sheet]["lines"]
    hits = [i for i, r in enumerate(lines) if r.get("id") == rid]
    if not hits:
        raise SystemExit("%s.%s not found (already removed?)" % (sheet, rid))
    i = hits[0]
    seps = S[sheet].get("separators") or []
    for k, sep in enumerate(seps):
        if isinstance(sep, dict):
            assert sep.get("id") != rid, "%s.%s starts a group" % (sheet, rid)
            if "index" in sep and sep["index"] > i:
                sep["index"] -= 1
        elif isinstance(sep, int) and sep > i:
            seps[k] = sep - 1
    del lines[i]


for sheet, ids in ROWS.items():
    for rid in ids:
        remove(sheet, rid)
    print("removed %d %s rows" % (len(ids), sheet))

# the test trait's unlock lines for the removed drones
tfa = next(r for r in S["trait"]["lines"] if r.get("id") == "Th_TestFreeArmy")
before = len(tfa["attributes"])
tfa["attributes"] = [a for a in tfa["attributes"] if not (set(re.findall(r'"([A-Za-z0-9_]+)"', json.dumps(a))) & GONE)]
print("Th_TestFreeArmy: removed %d unlock line(s)" % (before - len(tfa["attributes"])))
assert before - len(tfa["attributes"]) == 4, "expected 4 drone unlock lines"

text = json.dumps(d)
left = sorted({m for m in re.findall(r'"([A-Za-z0-9_]+)"', text) if m in GONE})
assert not left, "references left: %s" % left
assert '"TH_Drone3"' in text, "the Spotter Drone must stay"
print("no references left; TH_Drone3 kept")

if "--apply" not in sys.argv:
    print("dry run; pass --apply to write")
    raise SystemExit
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
    print("backup", BACKUP)
open(CDB, "w", encoding="utf-8", newline="").write(json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", NL))
print("wrote", CDB)
