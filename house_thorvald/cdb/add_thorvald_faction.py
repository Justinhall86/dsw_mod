"""Add the House Thorvald faction row to data.cdb, with its burnt-orange colour and gear-and-star emblem.

    python add_thorvald_faction.py [--apply]     (without --apply: dry run, prints the row and writes nothing)

Safe to re-run: if the Thorvald row exists, only its colour, emblem and button icon are brought back in line.

What the row is: an INERT stub, modelled on the Renegades row (house 2 = "Unknown", no landmarks, no
characters, no start traits). It carries the faction colour, the emblem, the names and the description, and
nothing else, so every reference in it resolves today. Making it a playable Great House is a later step:
set house to 0 and fill landmarks, characters, startingTraits, hegemonyBonuses and conquest (see Ginaz).

The emblem file is NOT inside data.cdb. The row points at UI/Faction/ThorvaldEmblem.png; that file
(house_thorvald/pak_assets/UI/Faction/ThorvaldEmblem.png, made by make_emblem.py) has to be copied into the
folder the pak builder packs, keeping the UI/Faction path, or the game finds no image.
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

CDB = os.environ.get("DSW_CDB", os.path.join(REPO, "mod_files", "data.cdb"))
BURNT_ORANGE = 0xCC5500          # 13391104; faction.color is 0xRRGGBB (Ginaz wine 0x7A1F3D, Atreides green 0x26734C)
EMBLEM = {"file": "UI/Faction/ThorvaldEmblem.png", "size": 64, "x": 0, "y": 0}

data, exact = C.load(CDB)
sh = C.sheets(data)
factions = sh["faction"]["lines"]
row = next((f for f in factions if f["id"] == "Thorvald"), None)

if row is None:
    row = {
        "id": "Thorvald",
        "images": {"emblem": dict(EMBLEM)},
        "color": BURNT_ORANGE,
        "texts": {
            "name": "House Thorvald",
            "shortName": "Thorvald",
            "longName": "House|Thorvald",
            "adjective": "Thorvald",
            "plural": {"name": "House Thorvald", "shortName": "Thorvald", "longName": "House|Thorvald"},
            "desc": ("The Industrial Hegemon. House Thorvald buys its wars with the exotic alloys of Heighforge, "
                     "a factory so vast that CHOAM resents it, and hires mercenaries to fight them."),
        },
        "startResourcesByDifficulty": [],
        "baseProductionsByDifficulty": [],
        "props": {"initials": "TH"},
        "gfx": dict(EMBLEM),
        "landmarks": {},
        "characters": {},
        "conquest": {},
        "house": 2,
    }
    at = next(i for i, f in enumerate(factions) if f["id"] == "Ginaz") + 1     # next to the other custom house
    factions.insert(at, row)
    print("adding faction row Thorvald at index", at)
else:
    row["color"] = BURNT_ORANGE
    row.setdefault("images", {})["emblem"] = dict(EMBLEM)
    row["gfx"] = dict(EMBLEM)
    print("Thorvald row exists; colour, emblem and button icon refreshed")

print(json.dumps(row, indent=1, ensure_ascii=False))
print("color: %d = #%06X" % (row["color"], row["color"]))

if "--apply" in sys.argv:
    C.save(CDB, data, "thorvald_faction_colour_emblem")
    print("SAVED")
else:
    print("(dry run - nothing written)")
