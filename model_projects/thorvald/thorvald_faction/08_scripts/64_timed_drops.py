"""Playtest round 3b (2026-11-13): timed Renegade drops, three extra Renegade Strike variants to compare in one game.

    py -3.14 64_timed_drops.py            # dry run
    py -3.14 64_timed_drops.py --apply    # backup to 07_data_cdb/data_BEFORE_timed_drops.cdb, then write
    py -3.14 64_timed_drops.py --revert   # restore that backup

Needs the hlboot tick tool/thorvald_ticks/thorvald_sworn/thsw_drops.py (troops stay aboard until the ship lands, then the
band marches; unit field thArrive = descent seconds, raid field thStagger = seconds between ships).

  Renegade Strike                (existing)  every ship lands together after 3 s, troops out, band marches
  Renegade Strike: Slow Descent  ThR_DropShipSlow (thArrive 7): a slower, heavier landing
  Renegade Strike: Wave          thStagger 1.5: ships come down one after another, band marches after the last
  Renegade Strike: Slow Wave     both (thArrive 7, thStagger 2.5)
Renegade Takeover and the natural Renegade drops get the base fix only (no extra fields).
"""
import copy
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_timed_drops.cdb")

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit

raw = open(CDB, encoding="utf-8", newline="").read()
NL = "\r\n" if "\r\n" in raw else "\n"
d = json.loads(raw)
S = {s["name"]: s for s in d["sheets"]}


def row(sheet, rid):
    return next(r for r in S[sheet]["lines"] if r.get("id") == rid)


def insert_after(sheet, after_id, new):
    lines = S[sheet]["lines"]
    assert not any(r.get("id") == new["id"] for r in lines), "%s.%s exists already (already applied?)" % (sheet, new["id"])
    i = next(i for i, r in enumerate(lines) if r.get("id") == after_id)
    lines.insert(i + 1, new)
    print("  + %s.%s" % (sheet, new["id"]))


# the slow ship
slow = copy.deepcopy(row("unit", "ThR_DropShip"))
slow["id"] = "ThR_DropShipSlow"
slow["texts"]["name"] = "Renegade Heavy Drop Ship"
slow["texts"]["plural"]["name"] = "Renegade Heavy Drop Ships"
slow["thArrive"] = 7.0
insert_after("unit", "ThR_DropShip", slow)

VARIANTS = [  # suffix, display name, ship, stagger, description
    ("Slow", "Renegade Strike: Slow Descent", "ThR_DropShipSlow", None,
     "Test variant. Heavy drop ships take 7 seconds to come down; the raiders step out once they land and then march on the village."),
    ("Wave", "Renegade Strike: Wave", "ThR_DropShip", 1.5,
     "Test variant. Drop ships come down one after another; the raiders gather and march once the last ship has landed."),
    ("SlowWave", "Renegade Strike: Slow Wave", "ThR_DropShipSlow", 2.5,
     "Test variant. Heavy drop ships come down slowly, one after another; the raiders march once the last has landed."),
]
prev_r, prev_a, prev_m = "Th_RenegadeStrike", "Th_RenegadeStrikeC", "Th_MRenegadeStrikeC"
base_r, base_a, base_m = row("raid", prev_r), row("ability", prev_a), row("mission", prev_m)
for suf, name, ship, stagger, desc in VARIANTS:
    r = copy.deepcopy(base_r)
    r["id"] = "Th_RenegadeStrike" + suf
    r["thShip"] = ship
    if stagger:
        r["thStagger"] = stagger
    insert_after("raid", prev_r, r)
    a = copy.deepcopy(base_a)
    a["id"] = "Th_RenegadeStrike" + suf
    a["name"], a["desc"], a["thRaid"] = name, desc, r["id"]
    insert_after("ability", prev_a, a)
    m = copy.deepcopy(base_m)
    m["id"] = "Th_MRenegadeStrike" + suf
    m["effects"]["ope"] = a["id"]
    insert_after("mission", prev_m, m)
    prev_r, prev_a, prev_m = r["id"], a["id"], m["id"]

base_a["desc"] = ("Target an enemy village: Renegade drop ships land on it together, the raiders step out, "
                  "then they pillage it.")
print("  ~ ability.Th_RenegadeStrikeC desc")

if "--apply" not in sys.argv:
    print("dry run: nothing written (add --apply)")
    raise SystemExit
os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
assert not os.path.exists(BACKUP), "backup exists already: " + BACKUP
shutil.copy2(CDB, BACKUP)
out = json.dumps(d, indent="\t", ensure_ascii=False)
open(CDB, "w", encoding="utf-8", newline="").write(out.replace("\n", NL))
print("written; backup", BACKUP)
