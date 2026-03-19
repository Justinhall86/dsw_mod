"""
inject_councillors_infiltration.py
Performs ALL data.cdb injections for:
  1. Four new LandsraadFaction councillor character rows
  2. LandsraadFaction.characters.councilors update (+ speaker + infiltrationResource)
  3. LandsraadFaction_Infiltration resource row
  4. Infiltration node slot fixes (IField/ISpaceGuild/IChoam/ILandsraad/ICounterIntel)
"""
import json, sys, copy
from pathlib import Path

CDB = Path(r"c:\dsw_mod\D4XEditor\res\data.cdb")

with open(CDB, encoding="utf-8-sig") as f:
    data = json.load(f)

def sheet(name):
    return next(s for s in data["sheets"] if s["name"] == name)

errors = []

# ─────────────────────────────────────────────────────────
# 1.  Four new character rows
# ─────────────────────────────────────────────────────────

NEW_CHARS = [
    {
        "id": "Councillor_Landsraad_Herbert",
        "title": "",
        "firstname": "Herbert",
        "lastname": "",
        "desc": "Herbert rose through thirty years of Imperial military campaigns. "
                "His presence alone inspires Landsraad soldiers to hold the line "
                "where others would break.",
        "gender": 0,   # Male
        "color": 10592673,
        "complexity": 0,
        "passiveTrait": "GurneyPasssive",
        "aiTypes": [{"domain": "Military"}],
        "props": {},
        "flags": 0,
        # Borrow Gurney Halleck's sprite tile (confirmed valid coordinates)
        "gfx": {"file": "UI/Faction/councillors_all.png", "size": 128, "x": 1, "y": 0},
        "images": {
            "menuGfx": {
                "file": "UI/Faction/Menu/menuCouncilors.png",
                "size": 1, "x": 0, "y": 0, "width": 336, "height": 624
            },
            "tutoGfx": {
                "file": "UI/Faction/Menu/councillorsAtreides.png",
                "size": 1, "x": 540, "y": 0, "width": 180, "height": 320
            }
        }
    },
    {
        "id": "Councillor_Landsraad_Jakob",
        "title": "",
        "firstname": "Jakob",
        "lastname": "",
        "desc": "Jakob spent decades brokering contracts between the noble houses "
                "and the Spacing Guild. His connections ensure the Landsraad forces "
                "can move across the stars faster and cheaper than any rival.",
        "gender": 0,   # Male
        "color": 10592673,
        "complexity": 1,
        "passiveTrait": "WensiciaPassive",
        "aiTypes": [{"domain": "Economy"}],
        "props": {},
        "flags": 0,
        # Borrow Wensicia's sprite tile
        "gfx": {"file": "UI/Faction/councillors_all.png", "size": 128, "x": 1, "y": 4},
        "images": {
            "menuGfx": {
                "file": "UI/Faction/Menu/menuCouncilors.png",
                "size": 1, "x": 336, "y": 2496, "width": 336, "height": 624
            },
            "tutoGfx": {
                "file": "UI/Faction/Menu/councillorsCorrino.png",
                "size": 1, "x": 180, "y": 0, "width": 180, "height": 320
            }
        }
    },
    {
        "id": "Councillor_Landsraad_Siora",
        "title": "",
        "firstname": "Siora",
        "lastname": "",
        "desc": "Siora maintains an invisible web of informants across Arrakis. "
                "Factions who cross the Landsraad find their territories suddenly "
                "patrolled by Landsraad Guards — without warning, and without mercy.",
        "gender": 1,   # Female
        "color": 10592673,
        "complexity": 2,
        "passiveTrait": "ThufirPassive",
        "aiTypes": [{"domain": "Statecraft"}],
        "props": {},
        "flags": 0,
        # Borrow Thufir's sprite tile
        "gfx": {"file": "UI/Faction/councillors_all.png", "size": 128, "x": 2, "y": 0},
        "images": {
            "menuGfx": {
                "file": "UI/Faction/Menu/menuCouncilors.png",
                "size": 1, "x": 336, "y": 0, "width": 336, "height": 624
            },
            "tutoGfx": {
                "file": "UI/Faction/Menu/councillorsAtreides.png",
                "size": 1, "x": 360, "y": 0, "width": 180, "height": 320
            }
        }
    },
    {
        "id": "Councillor_Landsraad_Nier",
        "title": "",
        "firstname": "Nier",
        "lastname": "",
        "desc": "Nier has negotiated more treaties than most nobles have fought battles. "
                "Under her guidance, the Landsraad political reach extends far beyond "
                "military force. Rival factions find it increasingly expensive to "
                "oppose her council will.",
        "gender": 1,   # Female
        "color": 10592673,
        "complexity": 1,
        "passiveTrait": "CammarPassive",
        "aiTypes": [{"domain": "Statecraft"}],
        "props": {},
        "flags": 0,
        # Borrow Irulan's sprite tile
        "gfx": {"file": "UI/Faction/councillors_all.png", "size": 128, "x": 0, "y": 4},
        "images": {
            "menuGfx": {
                "file": "UI/Faction/Menu/menuCouncilors.png",
                "size": 1, "x": 0, "y": 2496, "width": 336, "height": 624
            },
            "tutoGfx": {
                "file": "UI/Faction/Menu/councillorsCorrino.png",
                "size": 1, "x": 0, "y": 0, "width": 180, "height": 320
            }
        }
    }
]

char_sheet = sheet("character")
existing_ids = {r["id"] for r in char_sheet["lines"]}

for nc in NEW_CHARS:
    if nc["id"] in existing_ids:
        print(f"  SKIP character {nc['id']} (already exists)")
    else:
        char_sheet["lines"].append(nc)
        existing_ids.add(nc["id"])
        print(f"  ADD character {nc['id']}")

# ─────────────────────────────────────────────────────────
# 2.  Update LandsraadFaction row
# ─────────────────────────────────────────────────────────

faction_sheet = sheet("faction")
lf = next((r for r in faction_sheet["lines"] if r["id"] == "LandsraadFaction"), None)
if lf is None:
    errors.append("LandsraadFaction not found in faction sheet!")
else:
    # Update councilors
    if "characters" not in lf:
        lf["characters"] = {}
    lf["characters"]["councilors"] = [
        {"id": "Councillor_Landsraad_Herbert"},
        {"id": "Councillor_Landsraad_Jakob"},
        {"id": "Councillor_Landsraad_Siora"},
        {"id": "Councillor_Landsraad_Nier"}
    ]
    # Keep leader (Leto placeholder) but fix speaker to Irulan (has voice lines)
    lf["characters"]["speaker"] = "Irulan"
    print("  UPDATE LandsraadFaction.characters.councilors")

    # Fix infiltrationResource
    if "props" not in lf:
        lf["props"] = {}
    lf["props"]["infiltrationResource"] = "LandsraadFaction_Infiltration"
    print("  UPDATE LandsraadFaction.props.infiltrationResource -> LandsraadFaction_Infiltration")

# ─────────────────────────────────────────────────────────
# 3.  Add LandsraadFaction_Infiltration resource
# ─────────────────────────────────────────────────────────

res_sheet = sheet("resource")
res_ids = {r["id"] for r in res_sheet["lines"]}

LF_INFILTRATION_RES = {
    "id": "LandsraadFaction_Infiltration",
    "texts": {
        "name": "Landsraad Information",
        "desc": "Spying field relative to [LandsraadFaction-longname].",
        "plural": {"name": "Landsraad Information"}
    },
    "stats": [{"baseStock": 1000}],
    "props": {
        "associatedFaction": "LandsraadFaction",
        "tip": {"cat": "InfiltrationField", "allowed": True, "padExpand": True}
    },
    # Reuse tile x=3 (same as NPC Landsraad_Infiltration) as a safe placeholder
    "gfx": {
        "file": "UI/icons/resourceInfiltrationIcons.png",
        "size": 32, "x": 3, "y": 0
    },
    "color": 10716415,
    "flags": 516,
    "aiRelatedBuildings": []
}

if "LandsraadFaction_Infiltration" in res_ids:
    print("  SKIP LandsraadFaction_Infiltration resource (already exists)")
else:
    res_sheet["lines"].append(LF_INFILTRATION_RES)
    print("  ADD resource LandsraadFaction_Infiltration")

# ─────────────────────────────────────────────────────────
# 4.  Fix infiltration node agent slots
#
#  IField, ISpaceGuild, IChoam, ILandsraad:
#    slots.base  LandsraadFaction  0  →  2
#    slots.max   add LandsraadFaction nb=3
#
#  ICounterIntel:
#    slots.base  LandsraadFaction  3  (already correct — keep)
#    slots.max   add LandsraadFaction nb=3
#
#  IFaction: already correct — skip
# ─────────────────────────────────────────────────────────

INF_FIXES = {
    "IField":        {"base": 2, "max": 3},
    "ISpaceGuild":   {"base": 2, "max": 3},
    "IChoam":        {"base": 2, "max": 3},
    "ILandsraad":    {"base": 2, "max": 3},
    "ICounterIntel": {"base": None, "max": 3},   # None = keep existing base
}

inf_sheet = sheet("infiltration")
for row in inf_sheet["lines"]:
    nid = row["id"]
    if nid not in INF_FIXES:
        continue
    fix = INF_FIXES[nid]
    slots = row.get("slots", {})

    # Fix base slot count
    if fix["base"] is not None:
        base_arr = slots.get("base", [])
        entry = next((e for e in base_arr if e.get("faction") == "LandsraadFaction"), None)
        if entry:
            old = entry["nb"]
            entry["nb"] = fix["base"]
            print(f"  FIX {nid}.slots.base  LandsraadFaction: {old} -> {fix['base']}")
        else:
            base_arr.append({"nb": fix["base"], "faction": "LandsraadFaction"})
            slots["base"] = base_arr
            print(f"  ADD {nid}.slots.base  LandsraadFaction: {fix['base']}")

    # Add max slot entry if missing
    max_arr = slots.get("max", [])
    existing_max = next((e for e in max_arr if e.get("faction") == "LandsraadFaction"), None)
    if existing_max:
        existing_max["nb"] = fix["max"]
        print(f"  FIX {nid}.slots.max   LandsraadFaction already present -> nb={fix['max']}")
    else:
        max_arr.append({"nb": fix["max"], "faction": "LandsraadFaction"})
        slots["max"] = max_arr
        print(f"  ADD {nid}.slots.max   LandsraadFaction: {fix['max']}")

    row["slots"] = slots

# ─────────────────────────────────────────────────────────
# Error check + write
# ─────────────────────────────────────────────────────────

if errors:
    print("\nERRORS — file NOT saved:")
    for e in errors:
        print("  " + e)
    sys.exit(1)

# Validate JSON round-trip before writing
try:
    serialized = json.dumps(data, ensure_ascii=False, separators=(", ", ": "))
    json.loads(serialized)
except Exception as ex:
    print(f"\nJSON VALIDATION FAILED: {ex}")
    sys.exit(1)

with open(CDB, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print("\nOK — data.cdb saved successfully.")
