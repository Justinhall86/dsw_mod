"""Data side of the Consignment Terminal's trade window (engine side: tool/thorvald_ticks/thorvald_sworn/thsw_terminal.py).

The hlboot hook makes Th_ConsignmentTerminal a Recycling-type building: its window pays a resource per day for Scraps and
spends Scraps per day on another resource. Two cdb changes go with it:
  1. trait Thorvald: drop its `TRes_Block Scraps` line (copied from Corrino; every house but the Fremen blocks Scraps),
     so Thorvald can hold the Scraps the window makes.
  2. building Th_ConsignmentTerminal: the state's description names both ways to trade (the window and the top-bar
     Convert button from TTh_ConsignmentTerminal, which stays).

    py -3 58_terminal_window.py            # dry run
    py -3 58_terminal_window.py --apply    # backup to 07_data_cdb/data_BEFORE_terminal_window.cdb, then write
    py -3 58_terminal_window.py --revert   # put both back
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_terminal_window.cdb")
BLOCK = {"target": {"resource": "Scraps"}, "ref": "TRes_Block", "displayed": False, "target2": {}}
OLD_DESC = ("Allows trading [Plascrete] for [Solari], [Manpower], [Intel], [Influence] and [Authority] in the top bar")
NEW_DESC = ("Select it to send [Plascrete] up each day for [Scraps], and trade the [Scraps] for [Solari], [Manpower], "
            "[Intel], [Influence] or [Authority]. [Plascrete] can also be traded at once in the top bar")

raw = open(CDB, "rb").read().decode("utf-8")
nl = "\r\n" if "\r\n" in raw else "\n"
data = json.loads(raw)
S = {s["name"]: s for s in data["sheets"]}
house = next(t for t in S["trait"]["lines"] if t["id"] == "Thorvald")
term = next(b for b in S["building"]["lines"] if b["id"] == "Th_ConsignmentTerminal")
line = term["states"][0]["attributes"][0]
revert = "--revert" in sys.argv
changes = []
blocked = [a for a in house["attributes"] if a.get("ref") == "TRes_Block" and a.get("target", {}).get("resource") == "Scraps"]
if revert:
    if not blocked:
        at = next((i for i, a in enumerate(house["attributes"]) if a.get("ref") == "TRes_Block"), len(house["attributes"]))
        house["attributes"].insert(at, dict(BLOCK))
        changes.append("trait Thorvald: Scraps blocked again")
    if line.get("desc") != OLD_DESC:
        line["desc"] = OLD_DESC
        changes.append("terminal description: back to the top-bar text")
else:
    if blocked:
        house["attributes"] = [a for a in house["attributes"] if a not in blocked]
        changes.append("trait Thorvald: Scraps no longer blocked")
    if line.get("desc") != NEW_DESC:
        line["desc"] = NEW_DESC
        changes.append("terminal description: names the window and the top bar")
print("\n".join(changes) or "nothing to do")
if not changes or not ("--apply" in sys.argv or revert):
    if changes:
        print("dry run (add --apply)")
    raise SystemExit
if not revert and not os.path.exists(BACKUP):
    os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
    shutil.copy2(CDB, BACKUP)
    print("backup", BACKUP)
open(CDB, "wb").write(json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", nl).encode("utf-8"))
print("wrote", CDB)
