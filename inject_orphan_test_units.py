"""
inject_orphan_test_units.py
Injects 3 orphaned-asset test models + units into data.cdb for the LandsraadFaction.
Appends them to LandsraadHQ.startUnits for immediate t=0 render test.

Prefabs used (all confirmed orphaned via hidden_assets_scanner.py):
  - Character/Common/Landsraad/Prefab_Sardaukar.prefab
  - Character/Fremen/Unit/Feydakin/Prefab_Feydakin.prefab
  - Structure/Buildings/Construction/prefab_GrueDrone.prefab

Constraints enforced:
  - NO weapon-only prefabs (Prefab_RavagerLeaderSniper excluded)
  - NO preload blocks (stripped entirely per dynamic-load requirement)
  - flags=0 on all test units (player-controllable)
"""

import json
import shutil
from datetime import datetime
from pathlib import Path

CDB_PATH = Path("res/data.cdb")
BACKUP_DIR = Path("res/backups")

# ── 1. Load ────────────────────────────────────────────────────────────────────
with open(CDB_PATH, encoding="utf-8-sig") as f:
    data = json.load(f)

# ── 2. Define new MODEL entries ────────────────────────────────────────────────
# Template pattern from C_Elite (MilitarySardaukar inheritor) — preload stripped.
new_models = [
    {
        "id": "ZO_Sardaukar",
        "radius": 2.4,
        "height": 5.5,
        "props": {},
        "mesh": [{"path": "Character/Common/Landsraad/Prefab_Sardaukar.prefab"}],
        "inherit": "MilitarySardaukar",
        "rigName": 0,          # Male01 — humanoid bipedal rig
        "scale": 1.15,
        "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 3, "y": 4},
        "audio": {},
        "anim": []
    },
    {
        "id": "ZO_Feydakin",
        "radius": 0,
        "height": 0,
        "props": {},
        "mesh": [{"path": "Character/Fremen/Unit/Feydakin/Prefab_Feydakin.prefab"}],
        "inherit": "Fedaykins",
        "rigName": 0,          # Male01 — humanoid bipedal rig
        "scale": 1.0,
        "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 5, "y": 2},
        "audio": {}
    },
    {
        "id": "ZO_Drone",
        "radius": 2,
        "height": 2,
        "props": {},
        "mesh": [{"path": "Structure/Buildings/Construction/prefab_GrueDrone.prefab"}],
        "inherit": "DroneCommon",
        "rigName": 7,          # DroneA — standard aerial drone rig
        "scale": 1.8,
        "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 4, "y": 0},
        "audio": {}
    }
]

# ── 3. Define new UNIT entries ─────────────────────────────────────────────────
# Infantry units inherit LandsraadSoldiers_Faufreluches; drone inherits Drone.
# effects.models overrides the visual reference to the ZO_ model entries.
new_units = [
    {
        "id": "Test_Orphan_Sardaukar",
        "faction": "LandsraadFaction",
        "flags": 0,
        "inherits": "LandsraadSoldiers_Faufreluches",
        "effects": {
            "models": [{"ref": "ZO_Sardaukar", "flags": 0}]
        }
    },
    {
        "id": "Test_Orphan_Feydakin",
        "faction": "LandsraadFaction",
        "flags": 0,
        "inherits": "LandsraadSoldiers_Faufreluches",
        "effects": {
            "models": [{"ref": "ZO_Feydakin", "flags": 0}]
        }
    },
    {
        "id": "Test_Orphan_Drone",
        "faction": "LandsraadFaction",
        "flags": 0,
        "inherits": "Drone",          # Aerial movement physics base
        "effects": {
            "models": [{"ref": "ZO_Drone", "flags": 0}]
        }
    }
]

# ── 4. Inject into sheets ──────────────────────────────────────────────────────
def get_sheet(name):
    return next(s for s in data["sheets"] if s["name"] == name)

model_sheet = get_sheet("model")
unit_sheet  = get_sheet("unit")
struct_sheet = get_sheet("structure")

# Guard: skip already-injected IDs to make script idempotent
existing_model_ids = {l["id"] for l in model_sheet["lines"]}
existing_unit_ids  = {l["id"] for l in unit_sheet["lines"]}

injected_models = 0
for m in new_models:
    if m["id"] not in existing_model_ids:
        model_sheet["lines"].append(m)
        injected_models += 1
        print(f"  + model injected: {m['id']}")
    else:
        print(f"  ~ model already present (skipped): {m['id']}")

injected_units = 0
for u in new_units:
    if u["id"] not in existing_unit_ids:
        unit_sheet["lines"].append(u)
        injected_units += 1
        print(f"  + unit injected: {u['id']}")
    else:
        print(f"  ~ unit already present (skipped): {u['id']}")

# ── 5. Patch LandsraadHQ.startUnits ───────────────────────────────────────────
landsraad_hq = next((l for l in struct_sheet["lines"] if l["id"] == "LandsraadHQ"), None)
if landsraad_hq is None:
    raise RuntimeError("LandsraadHQ not found in structure sheet!")

existing_start_ids = {e["unit"] for e in landsraad_hq.get("startUnits", [])}
injected_start = 0
for u in new_units:
    if u["id"] not in existing_start_ids:
        landsraad_hq["startUnits"].append({"unit": u["id"]})
        injected_start += 1
        print(f"  + startUnit appended to LandsraadHQ: {u['id']}")
    else:
        print(f"  ~ startUnit already in LandsraadHQ (skipped): {u['id']}")

# ── 6. Backup & save ──────────────────────────────────────────────────────────
BACKUP_DIR.mkdir(exist_ok=True)
ts = datetime.now().strftime("%Y%m%d_%H%M%S")
backup_path = BACKUP_DIR / f"data_pre_orphan_inject_{ts}.cdb"
shutil.copy2(CDB_PATH, backup_path)
print(f"\n  Backup saved: {backup_path}")

with open(CDB_PATH, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, separators=(",", ":"))

print(f"\nDone. Injected: {injected_models} models, {injected_units} units, {injected_start} startUnits.")
print("data.cdb written successfully.")
