# Prompt: Orphan Asset Render Diagnostics — LandsraadFaction

**Purpose:** Force-inject three confirmed orphaned `.prefab` assets into the LandsraadFaction
starting roster to verify whether the engine can render them at all, without UI gating.

**Status:** Saved for future use. Revert was applied after initial run due to potential instability.

---

## Constraints (do not relax these)

1. **Exclude All Weapon Assets.** Do not use `Prefab_RavagerLeaderSniper` or any bare weapon mesh.
2. **Dynamic Loading Only.** Strip all `"preload"` blocks entirely — no `props.preload.*` keys.
3. **Immediate Spawn.** Append units to `LandsraadHQ.startUnits` so they appear at 0:00 with no recruitment or tech tree gate.
4. **Player-Controllable.** Set `"flags": 0` on all test units.

## Prefabs to Test

| Alias | Orphaned Prefab Path |
|---|---|
| `ZO_Sardaukar` | `Character/Common/Landsraad/Prefab_Sardaukar.prefab` |
| `ZO_Feydakin` | `Character/Fremen/Unit/Feydakin/Prefab_Feydakin.prefab` |
| `ZO_Drone` | `Structure/Buildings/Construction/prefab_GrueDrone.prefab` |

## CDB Injection Steps

### Step 1 — model sheet: three new visual reference objects

```json
{
  "id": "ZO_Sardaukar",
  "radius": 2.4, "height": 5.5,
  "props": {},
  "mesh": [{"path": "Character/Common/Landsraad/Prefab_Sardaukar.prefab"}],
  "inherit": "MilitarySardaukar",
  "rigName": 0,
  "scale": 1.15,
  "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 3, "y": 4},
  "audio": {}, "anim": []
}
```

```json
{
  "id": "ZO_Feydakin",
  "radius": 0, "height": 0,
  "props": {},
  "mesh": [{"path": "Character/Fremen/Unit/Feydakin/Prefab_Feydakin.prefab"}],
  "inherit": "Fedaykins",
  "rigName": 0,
  "scale": 1.0,
  "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 5, "y": 2},
  "audio": {}
}
```

```json
{
  "id": "ZO_Drone",
  "radius": 2, "height": 2,
  "props": {},
  "mesh": [{"path": "Structure/Buildings/Construction/prefab_GrueDrone.prefab"}],
  "inherit": "DroneCommon",
  "rigName": 7,
  "scale": 1.8,
  "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 4, "y": 0},
  "audio": {}
}
```

### Step 2 — unit sheet: three new playable unit blocks

```json
{"id": "Test_Orphan_Sardaukar", "faction": "LandsraadFaction", "flags": 0,
 "inherits": "LandsraadSoldiers_Faufreluches",
 "effects": {"models": [{"ref": "ZO_Sardaukar", "flags": 0}]}}
```

```json
{"id": "Test_Orphan_Feydakin",  "faction": "LandsraadFaction", "flags": 0,
 "inherits": "LandsraadSoldiers_Faufreluches",
 "effects": {"models": [{"ref": "ZO_Feydakin", "flags": 0}]}}
```

```json
{"id": "Test_Orphan_Drone",     "faction": "LandsraadFaction", "flags": 0,
 "inherits": "Drone",
 "effects": {"models": [{"ref": "ZO_Drone", "flags": 0}]}}
```

### Step 3 — structure sheet: patch LandsraadHQ.startUnits

Append to `LandsraadHQ.startUnits`:
```json
{"unit": "Test_Orphan_Sardaukar"},
{"unit": "Test_Orphan_Feydakin"},
{"unit": "Test_Orphan_Drone"}
```

## Re-injection Script

The idempotent Python3 injection script is saved at:
`inject_orphan_test_units.py` (workspace root)

To re-run:
```powershell
cd c:\dsw_mod\D4XEditor
python3 inject_orphan_test_units.py
```

## What to Watch for In-Engine

- **Clean spawn** = prefab renders correctly, unit is selectable, moves normally
- **T-pose / no mesh** = prefab loaded but animation rig mismatch (try a different `inherit`)
- **Hard crash on load** = prefab is a static prop, not a character rig; swap `inherit` to a building base
- **Invisible unit** = prefab loaded but mesh path casing wrong (Linux-style case sensitivity in engine)
