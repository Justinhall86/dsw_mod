"""Add the Consignment Terminal: a Thorvald major building that opens the top-bar Plascrete trade.

Built like Fremen's Recycling Plant (one per faction, a village's major slot). Its building trait
carries a Convert_TRes_To_TRes2 line, and Quinn's resource_trades patch reads lines off a
faction's buildings, so the Convert button shows only while Thorvald owns a terminal.
The trade moves here from Adjutant Nobru, whose passive goes back to what it was.

Needs script 55 first (the Convert_TRes_To_TRes2 row and the convertFrom/convertTo columns), and a
patched hlboot.dat to do anything in game. The model is a placeholder (the Spacing Guild Branch)
until the starport in model_projects/thorvald_starport is exported.

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

BUILDING, TRAIT, ATTRIBUTE = "Th_ConsignmentTerminal", "TTh_ConsignmentTerminal", "Convert_TRes_To_TRes2"
PAY = 100
# what 100 Plascrete buys. Solari at the CHOAM value of Plascrete (1.5). The rest at their CHOAM
# value (Influence: the faction trade value), less a 20% house cut. Water and Fuel Cells are left out:
# they keep no stock, which needs more of Quinn's patch.
GET = (("Solari", 150), ("Manpower", 8), ("Intel", 24), ("Influence", 6), ("Authority", 4))

TRADE_TRAIT = {
    "id": TRAIT,
    "name": "Consignment Terminal",
    "desc": "Thorvald alloy is sold here to whoever pays, in whatever they pay with.",
    "props": {"tip": {"cat": "Buildings"}},
    "attributes": [{
        "target": {"convertFrom": [{"val": PAY, "resource": "Plascrete"}]},
        "target2": {"convertTo": [{"val": v, "resource": r} for r, v in GET]},
        "ref": ATTRIBUTE,
        "desc": "Trade [Plascrete] for other resources in the top bar",
    }],
    "type": 0,
    "displayed": False,
    "gfx": {"file": "UI/icons/buildings_icons.png", "size": 80, "x": 0, "y": 2},
}

TERMINAL = {
    "id": BUILDING,
    "texts": {
        "name": "Consignment Terminal",
        "desc": "A Heighforge freight port. Plascrete goes up to the waiting tenders, and Solari, "
                "recruits, information and favours come back down.",
        "plural": {"name": "Consignment Terminals"},
    },
    "domain": "Economy",
    "states": [{
        "attributes": [{
            "target": {}, "target2": {}, "ref": "CustomProperty",
            "desc": "Allows trading [Plascrete] for [Solari], [Manpower], [Intel], [Influence] "
                    "and [Authority] in the top bar",
        }],
        "cost": [{"res": "Solari", "qty": 1000}, {"qty": 500, "res": "Plascrete"}],
        "upkeep": [{"qty": 20, "res": "Solari"}, {"qty": 10, "res": "Water"}],
        "duration": 8,
        "effects": [],
    }],
    "props": {
        "factionLimit": 1, "isWonder": True, "buildingRadius": 5, "scale": 3, "maxHealth": 2000,
        "onlyForFactions": [{"faction": "Thorvald"}],
        "buildingTrait": TRAIT,
        "tip": {"cat": "MajorBuilding"}, "noFactor": True,
        "lootingValue": [{"qty": 200, "res": "Solari"}],
    },
    # placeholder look until the starport is exported
    "visuals": {
        "model": [{"path": "Structure/Buildings/SpacingGuildBranch/Prefab_SpacingGuildBranch.prefab"}],
        "thumbnail": {"file": "UI/structures/SpacingGuildBranch.png", "size": 1, "x": 0, "y": 0,
                      "width": 592, "height": 168},
    },
    # the AI cannot use the top-bar panel, so it has no reason to build one
    "aiWeights": [{"value": -5}],
}

UNLOCK = {"target": {"building": BUILDING}, "target2": {}, "ref": "Unlock_TBuilding",
          "desc": "Can build the [Th_ConsignmentTerminal]"}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--apply", action="store_true", help="write mod_files/data.cdb (after a backup)")
    args = ap.parse_args()

    data = json.loads(CDB.read_bytes().decode("utf-8"))
    sheets = {s["name"]: s for s in data["sheets"]}
    if not any(r["id"] == ATTRIBUTE for r in sheets["attribute"]["lines"]):
        raise SystemExit("run 55_plascrete_topbar_trade.py --apply first")
    changes = []

    traits, buildings = sheets["trait"]["lines"], sheets["building"]["lines"]
    if not any(t["id"] == TRAIT for t in traits):
        traits.append(TRADE_TRAIT)
        changes.append(f"trait: add {TRAIT}")
    if not any(b["id"] == BUILDING for b in buildings):
        gfx = next(b["gfx"] for b in buildings if b["id"] == "SpacingGuildBranch")
        terminal = dict(TERMINAL, gfx=dict(gfx))
        # before ALLBUILDINGS, the sheet's last row
        at = next((i for i, b in enumerate(buildings) if b["id"] == "ALLBUILDINGS"), len(buildings))
        buildings.insert(at, terminal)
        changes.append(f"building: add {BUILDING}")

    house = next(t for t in traits if t["id"] == "Thorvald")
    if not any(a.get("target", {}).get("building") == BUILDING for a in house["attributes"]):
        house["attributes"].append(UNLOCK)
        changes.append(f"trait Thorvald: unlocks {BUILDING} from the start")

    nobru = next(t for t in traits if t["id"] == "NobruPassive")
    kept = [a for a in nobru["attributes"] if a.get("ref") != ATTRIBUTE]
    if len(kept) != len(nobru["attributes"]):
        nobru["attributes"] = kept
        changes.append("trait NobruPassive: the trade moves to the terminal")

    print("\n".join(changes) or "nothing to do")
    print("100 Plascrete buys: " + ", ".join(f"{v} {r}" for r, v in GET))
    if not args.apply:
        print("dry run: nothing written (use --apply)")
        return
    if not changes:
        return

    backup = BACKUPS / f"data_before_consignment_terminal_{time.strftime('%Y%m%d_%H%M%S')}.cdb"
    shutil.copy2(CDB, backup)
    text = json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", "\r\n")
    CDB.write_bytes(text.encode("utf-8"))
    print(f"backup: {backup}\nwrote: {CDB}")


if __name__ == "__main__":
    main()
