"""Give House Thorvald a Plascrete -> Solari trade, unlocked by Adjutant Nobru.

The Fremen top-bar trade (Convert_Authority_To_Manpower on JamisPassive) cannot be
copied: that attribute and its resource pair are compiled into hlboot.dat, so a new
Convert_* row would do nothing. This uses the village-ability system instead, modelled
on vanilla Oppression (cost + duration + timed trait) and unlocked the way EcazPride is
(Unlock_TAbility on a trait).

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

# 100 Plascrete pays 150 Solari: the CHOAM value of Plascrete in vanilla (choamValueMin/Max 1.5).
PLASCRETE_COST = 100
DURATION_DAYS = 5
SOLARI_PER_DAY = 30
COOLDOWN_DAYS = 5

ABILITY_ID = "Th_AlloySale"
TRAIT_ID = "TTh_AlloySale"
COUNCILLOR_TRAIT = "NobruPassive"

ABILITY = {
    "id": ABILITY_ID,
    "flags": 256,  # NotInCombat, same as Oppression
    "cooldowns": {"onEnd": COOLDOWN_DAYS},
    "traits": [{"trait": TRAIT_ID, "apply": 0, "comments": "", "props": {"hideApplyTarget": True}}],
    "otherEffects": [],
    "display": {"where": 512, "alignment": 1},  # button on own villages
    "apply": {"need": 3, "alignment": 1},
    "props": {
        "onlyForFactions": [{"faction": "Thorvald"}],
        "cost": [{"qty": PLASCRETE_COST, "res": "Plascrete"}],
        "tip": {"allowed": True, "padExpand": True, "cat": "VillageAbility"},
    },
    "implemented": True,
    "gfx": {"file": "UI/icons/actionIcons.png", "size": 40, "x": 18, "y": 0},
    "name": "Alloy Sale",
    "desc": "Sell [Plascrete] from this [!Village] on the open market. The [Solari] arrive over the following days.",
    "duration": DURATION_DAYS,
}

TRAIT = {
    "id": TRAIT_ID,
    "desc": "This [!Village] is shipping alloy to buyers off-world.",
    "props": {"tip": {"cat": "VillageInspiration"}},
    "attributes": [{
        "target": {"resource": "Solari"},
        "target2": {},
        "ref": "TRes_Prod_Flat",
        "val": SOLARI_PER_DAY,
        "scope": 0,
        "desc": "::s_value:: [Solari] production",
    }],
    "type": 0,
    "displayed": True,
    "gfx": {"file": "UI/icons/resourceIcons.png", "size": 32, "x": 0, "y": 0},
    "name": "Alloy Sale",
}

UNLOCK = {
    "target": {"ability": ABILITY_ID},
    "target2": {},
    "ref": "Unlock_TAbility",
    "desc": "Trade [Plascrete] for [Solari] with the [Th_AlloySale] [!Village] ability",
}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--apply", action="store_true", help="write mod_files/data.cdb (after a backup)")
    args = ap.parse_args()

    raw = CDB.read_bytes()
    data = json.loads(raw.decode("utf-8"))
    sheets = {s["name"]: s for s in data["sheets"]}
    changes = []

    def add_row(sheet, row):
        lines = sheets[sheet]["lines"]
        if any(l.get("id") == row["id"] for l in lines):
            print(f"already present: {sheet}.{row['id']}")
        else:
            lines.append(row)
            changes.append(f"{sheet}: add {row['id']}")

    add_row("ability", ABILITY)
    add_row("trait", TRAIT)

    nobru = next(l for l in sheets["trait"]["lines"] if l["id"] == COUNCILLOR_TRAIT)
    if any(a.get("target", {}).get("ability") == ABILITY_ID for a in nobru["attributes"]):
        print(f"already present: {COUNCILLOR_TRAIT} unlock")
    else:
        nobru["attributes"].append(UNLOCK)
        changes.append(f"trait: {COUNCILLOR_TRAIT} unlocks {ABILITY_ID}")

    print("\n".join(changes) or "nothing to do")
    print(f"trade: {PLASCRETE_COST} Plascrete -> {SOLARI_PER_DAY * DURATION_DAYS} Solari over {DURATION_DAYS} days")

    if not args.apply:
        print("dry run: nothing written (use --apply)")
        return
    if not changes:
        return

    backup = BACKUPS / f"data_before_plascrete_trade_{time.strftime('%Y%m%d_%H%M%S')}.cdb"
    shutil.copy2(CDB, backup)
    text = json.dumps(data, ensure_ascii=False, indent="\t").replace("\n", "\r\n")
    CDB.write_bytes(text.encode("utf-8"))
    print(f"backup: {backup}\nwrote: {CDB}")


if __name__ == "__main__":
    main()
