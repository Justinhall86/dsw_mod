"""Fix three House Thorvald bugs in data.cdb.

Iron Guard (Th_Special): a real bazooka unit instead of the Corrino flamer. It takes its template,
stats, gear and effects from A_Demo, which has the same model and animation set. Costs, squad and
AI weight stay as they were.

Frigate: the deploy animation ids Chronos has, aliased to the Renegade rig's own clips. The other
users of that table (A_Frigate, N_Renegade_Ship1) never deploy, so they never ask for these ids.

Thorvald_Megalopolis: shows as "Megalopolis", not its raw id.

Dry run by default. --apply backs up mod_files/data.cdb, then writes it. Safe to re-run.
"""
import argparse
import copy
import json
import shutil
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CDB = ROOT / "mod_files" / "data.cdb"
BACKUPS = ROOT / "mod_files" / "backups"

IRON_GUARD_DESC = ("Heavy weapon troopers of House Thorvald armed with a shoulder-fired launcher, "
                   "for opening up armour and fortifications.")
FIGHT_IDLE, IDLE = "RenegadeFrigate_FightIdle", "RenegadeFrigate_Idle"
DEPLOY_ANIMS = (
    {"id": "AirfieldIdle", "loop": True, "lock": False, "animName": FIGHT_IDLE},
    {"id": "Opening", "lock": False, "animName": IDLE, "loop": False},
    {"id": "Closing", "lock": False, "animName": IDLE, "loop": False},
    {"id": "Idle_Airfield", "lock": False, "animName": FIGHT_IDLE, "loop": True},
)


def row(sheets, sheet, row_id):
    return next(l for l in sheets[sheet]["lines"] if l.get("id") == row_id)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--apply", action="store_true", help="write mod_files/data.cdb (after a backup)")
    args = ap.parse_args()

    data = json.loads(CDB.read_bytes().decode("utf-8"))
    sheets = {s["name"]: s for s in data["sheets"]}
    changes = []

    guard, demo = row(sheets, "unit", "Th_Special"), row(sheets, "unit", "A_Demo")
    if guard.get("inherits") != "Demo":
        guard["inherits"] = "Demo"
        guard["stats"] = copy.deepcopy(demo["stats"])
        guard["stats"][0].pop("trainingTime", None)  # A_Demo's is a test-roster value
        guard["traits"] = []
        guard["equipment"] = copy.deepcopy(demo["equipment"])
        for key in ("events", "sound"):
            guard["effects"][key] = copy.deepcopy(demo["effects"][key])
        guard["texts"]["desc"] = IRON_GUARD_DESC
        changes.append("unit Th_Special: bazooka template, stats, gear, effects and description")

    rig = row(sheets, "model", "RenegadeFrigate")
    have = {a["id"] for a in rig["anim"]}
    for anim in DEPLOY_ANIMS:
        if anim["id"] not in have:
            rig["anim"].append(dict(anim))
            changes.append(f"model RenegadeFrigate: add {anim['id']} -> {anim['animName']}")

    city = row(sheets, "development", "Thorvald_Megalopolis")
    if city.get("name") != "Megalopolis":
        city["name"] = "Megalopolis"
        changes.append("development Thorvald_Megalopolis: name Megalopolis")

    print("\n".join(changes) or "nothing to do")
    if not args.apply:
        print("dry run: nothing written (use --apply)")
        return
    if not changes:
        return

    backup = BACKUPS / f"data_before_thorvald_fixes_{time.strftime('%Y%m%d_%H%M%S')}.cdb"
    shutil.copy2(CDB, backup)
    text = json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", "\r\n")
    CDB.write_bytes(text.encode("utf-8"))
    print(f"backup: {backup}\nwrote: {CDB}")


if __name__ == "__main__":
    main()
