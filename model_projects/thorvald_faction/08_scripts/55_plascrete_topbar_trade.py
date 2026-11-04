"""Give House Thorvald a top-bar Plascrete -> Solari trade through Adjutant Nobru.

Data half of Quinn's resource_trades feature. The other half is a patched hlboot.dat:
    python tool/quinn.py build --base <hlboot.dat> --ticks resource_trades --out <file>
Without that patch these rows do nothing: no button appears.

The attribute row and its use on the trait copy Convert_Authority_To_Manpower on JamisPassive:
no scope and empty props, so the engine's scope check has nothing to complain about.
This also removes the Alloy Sale village button added by 54_plascrete_trade.py.

Dry run by default. --apply backs up mod_files/data.cdb, then writes it. Safe to re-run.
"""
import argparse
import json
import shutil
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CDB = ROOT / "mod_files" / "data.cdb"
BACKUPS = ROOT / "mod_files" / "backups"

# Plascrete's CHOAM value in vanilla is 1.5 Solari
PAY, GET = 100, 150

ATTRIBUTE = "Convert_TRes_To_TRes2"
COUNCILLOR_TRAIT = "NobruPassive"
ROW = {
    "id": ATTRIBUTE,
    "desc": "Trades any resource in target's convertFrom for any in target2's convertTo, at the amounts written",
    "props": {},
    "gfx": {"file": "UI/icons/attribute_icons.png", "size": 32, "x": 3, "y": 0},
    "implemented": True,
    "val": 1,
    "__ignoreLoc__": True,
}
LINE = {
    "target": {"convertFrom": [{"val": PAY, "resource": "Plascrete"}]},
    "target2": {"convertTo": [{"val": GET, "resource": "Solari"}]},
    "ref": ATTRIBUTE,
    "desc": "Trade [Plascrete] for [Solari] in the top bar",
}
# (sheet the column goes on, the column's name)
LIST_COLUMNS = (("trait@attributes@target", "convertFrom"), ("trait@attributes@target2", "convertTo"))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--apply", action="store_true", help="write mod_files/data.cdb (after a backup)")
    args = ap.parse_args()

    data = json.loads(CDB.read_bytes().decode("utf-8"))
    sheets = {s["name"]: s for s in data["sheets"]}
    changes = []

    for parent, column in LIST_COLUMNS:
        if not any(c["name"] == column for c in sheets[parent]["columns"]):
            sheets[parent]["columns"].append({"typeStr": "8", "name": column, "kind": None})
            changes.append(f"{parent}: add list column {column}")
        sub = f"{parent}@{column}"
        if sub not in sheets:
            sheet = {
                "name": sub,
                "columns": [{"typeStr": "4", "name": "val", "kind": None},
                            {"typeStr": "6:resource", "name": "resource", "kind": None}],
                "lines": [],
                "props": {"hide": True},
                "separators": [],
            }
            # a sub-sheet sits right after its parent, as the editor keeps them
            data["sheets"].insert(data["sheets"].index(sheets[parent]) + 1, sheet)
            sheets[sub] = sheet
            changes.append(f"add sheet {sub}")

    rows = sheets["attribute"]["lines"]
    ids = [r["id"] for r in rows]
    if ATTRIBUTE not in ids:
        if ids[-1] != "Invalid":
            raise SystemExit("the last attribute row is not Invalid: check by hand")
        rows.append(ROW)
        changes.append(f"attribute: add {ATTRIBUTE} below Invalid")

    traits = sheets["trait"]["lines"]
    nobru = next(t for t in traits if t["id"] == COUNCILLOR_TRAIT)
    if not any(a.get("ref") == ATTRIBUTE for a in nobru["attributes"]):
        nobru["attributes"].append(LINE)
        changes.append(f"trait: {COUNCILLOR_TRAIT} trades {PAY} Plascrete for {GET} Solari")

    # Alloy Sale goes: one trade, in the top bar
    kept = [a for a in nobru["attributes"] if a.get("target", {}).get("ability") != "Th_AlloySale"]
    if len(kept) != len(nobru["attributes"]):
        nobru["attributes"] = kept
        changes.append(f"trait: {COUNCILLOR_TRAIT} no longer unlocks Th_AlloySale")
    for sheet, row_id in (("ability", "Th_AlloySale"), ("trait", "TTh_AlloySale")):
        lines = sheets[sheet]["lines"]
        if any(l["id"] == row_id for l in lines):
            sheets[sheet]["lines"] = [l for l in lines if l["id"] != row_id]
            changes.append(f"{sheet}: remove {row_id}")

    print("\n".join(changes) or "nothing to do")
    if not args.apply:
        print("dry run: nothing written (use --apply)")
        return
    if not changes:
        return

    backup = BACKUPS / f"data_before_topbar_trade_{time.strftime('%Y%m%d_%H%M%S')}.cdb"
    shutil.copy2(CDB, backup)
    text = json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", "\r\n")
    CDB.write_bytes(text.encode("utf-8"))
    print(f"backup: {backup}\nwrote: {CDB}")


if __name__ == "__main__":
    main()
