"""Renegade operations fix (2026-11-10), from the first real playtest of operations v2.

    python 41_operations_fix.py            # dry run
    python 41_operations_fix.py --apply    # backup to 07_data_cdb/data_BEFORE_operations_fix.cdb, then write
    python 41_operations_fix.py --revert   # restore that backup

Findings (game.log + hlboot.dat, build 26405381):
 1. "Still active, can't use again": AbilityManager.activeAbilityIsOver ends an ActiveAbility that has no duration only when its
    target entity is removed (or its trait conditions fail). Our three abilities had no `duration`, so each stayed "ongoing" for as long
    as the target village / main base lived, and the mission could not be started again. Every comparable vanilla operation has
    `duration` (3, in days: HAbility.getDuration -> Time.fromDays). Fix: give ours one.
      - Th_RenegadeStrike: 1.2 days (36 s). The Mark trait lasts 35 s; with an ability duration the traits take the ability's
        duration, so this keeps the one-raid-per-use timing.
      - Th_RenegadeTakeover, GhostMarket (Iron Landfall): 3 days like the vanilla ones.
 2. "Send the crew raiding" hung the shuttle's event at 100%: WorldEventComponent.resolve -> Raids.spawnRaid -> Raid.pickNewTarget
    reads `.posx` of Raid.getLeader() while the raid has no army yet (87,558 "Null access .posx" lines). reward.raid = true is not
    usable for a custom shuttle. The action is removed; "Disembark the company" and "Dismantle" stay.
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
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_operations_fix.cdb")
DURATIONS = {"Th_RenegadeStrike": 1.2, "Th_RenegadeTakeover": 3, "GhostMarket": 3}

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit

raw = open(CDB, encoding="utf-8", newline="").read()
NL = "\r\n" if "\r\n" in raw else "\n"
d = json.loads(raw)
before = copy.deepcopy(d)
S = {s["name"]: s for s in d["sheets"]}
row = lambda sheet, rid: next(r for r in S[sheet]["lines"] if r.get("id") == rid)

for aid, days in DURATIONS.items():
    a = row("ability", aid)
    print("ability %-20s duration %s -> %s" % (aid, a.get("duration"), days))
    a["duration"] = days
shuttle = row("structure", "Th_LandfallShuttle")
acts = shuttle["props"]["worldEvent"]["actions"]
keep = [x for x in acts if not (x.get("reward") or {}).get("raid")]
print("Th_LandfallShuttle actions: %d -> %d (removed: %s)" % (
    len(acts), len(keep), [x["desc"] for x in acts if x not in keep]))
shuttle["props"]["worldEvent"]["actions"] = keep
row("ability", "GhostMarket")["desc"] = row("ability", "GhostMarket")["desc"].replace(
    ", or send its crew raiding", "").replace(" there, or send its crew raiding.", " there.")

out = json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", NL)
b = json.loads(out)
changed = []
for sa, sb in zip(before["sheets"], b["sheets"]):
    ia = {r.get("id"): r for r in sa.get("lines", [])}
    for r in sb.get("lines", []):
        if r.get("id") in ia and ia[r["id"]] != r:
            changed.append((sa["name"], r["id"]))
print("changed rows:", changed)
assert set(changed) == {("ability", "Th_RenegadeStrike"), ("ability", "Th_RenegadeTakeover"), ("ability", "GhostMarket"),
                        ("structure", "Th_LandfallShuttle")}, changed
if "--apply" not in sys.argv:
    print("dry run; --apply to write")
    raise SystemExit
os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
open(CDB, "w", encoding="utf-8", newline="").write(out)
print("written", CDB, "| backup", BACKUP)
