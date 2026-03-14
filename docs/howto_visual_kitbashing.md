# How-To: Visual Kitbashing for Landsraad Units

## Overview

Dune: Spice Wars uses a **modular mesh system**. Visual assets are not monolithic — they are
composed of separate model prefabs, animation rigs, faction color masks, VFX string references,
and scale parameters. By editing the JSON config in `data.cdb` and the unitGfx/prefab path
entries, we can create visually distinct Landsraad units **entirely through code**, without
touching 3D software.

> **See also:** [howto_reverse_engineering.md](./howto_reverse_engineering.md) — for examining
> how other mods implement specific visual swaps.

---

## The Four Kitbashing Techniques

### Technique 1: Prefab Path Swap (Model Body)

Every unit references one or more `mesh` entries in the `unitGfx` sheet (sub-sheet of the
`unit` sheet). Each entry has a `"path"` pointing to a Unity prefab.

**To swap a body, edit the `"path"` string:**

```json
"mesh": [
  {
    "path": "Character/Common/Landsraad/Prefab_LandsraadGuard.prefab"
  }
]
```

Replace the path with any valid prefab path from the game. To find available paths, search
`res/data.cdb` for `.prefab"` — every existing unit's model path is listed there.

**Kitbash example — using a Corrino body for Landsraad Enforcer:**
```json
"mesh": [
  {
    "path": "Character/Imperial/Trooper/Prefab_ImperialTrooper.prefab"
  }
]
```

**Limitation:** Weapons baked directly into a character mesh (part of the base geometry)
**cannot be swapped** via path alone without causing animation glitches. Only modular
attachment-point weapons can be changed this way.

---

### Technique 2: Faction Color Masks

The game applies faction colors to mesh materials via color mask channels. Meshes that support
faction coloring have two paintable channels:
- **Primary color** — applied to main armor/clothing
- **Secondary color** — applied to trim, accessories, highlights

These are defined in the **faction sheet** under color values, not in the unit entry itself.
Any mesh that uses the standard faction shader will automatically display the faction's colors.

**For LandsraadFaction, target colors (TBD — verify in CDB before finalizing):**
- Primary: Landsraad Gold (approx. `#D4AF37` — confirm in `faction` sheet entry)
- Secondary: Imperial Purple (approx. `#4B0082` — confirm in `faction` sheet entry)

**To apply faction colors to a kitbashed Corrino/Atreides model:**
1. Verify the source prefab uses the standard faction shader (most `Prefab_Imperial*` and
   `Prefab_Atreides*` meshes do)
2. Set `"faction": "LandsraadFaction"` in the unit's CDB entry
3. The engine will automatically apply LandsraadFaction's primary/secondary colors to the mesh

If a mesh uses a **hardcoded texture** instead of the faction shader, color masking will not
work — the model will display its original faction colors regardless.

---

### Technique 3: Scale Parameter (Hero Size)

The `unitGfx` entry for each unit includes a `"scale"` float parameter. Increasing this value
makes the unit physically larger on the battlefield — a key technique for making hero units
visually imposing.

**Standard infantry scale:** `1.0`
**Landsraad Guard scale:** `1.2` (already set in `N_LR_Guard` unitGfx entry)
**Recommended hero scale range:** `1.3` – `1.5` (above 1.5 can clip terrain/buildings)

**Example — scaling Karlin Mallenor's model:**
```json
{
  "id": "N_KarlinMallenor",
  "scale": 1.45,
  "inherit": "MilitaryLRGuard",
  "mesh": [
    { "path": "Character/Imperial/Commander/Prefab_ImperialCommander.prefab" }
  ]
}
```

---

### Technique 4: VFX String Swap (Weapon Effects)

Attack animations can reference VFX (particle/shader effects) by string path. To give a
kitbashed unit a unique weapon effect, find the VFX string in the unit's `attacks` block and
replace it with a different valid VFX path.

Search `res/data.cdb` for `"fxs"` arrays within attack combo entries to find available VFX
paths. Common patterns:
- `"FX/Weapons/Melee/FX_MeleeSlash"` — generic melee slash
- `"FX/Weapons/Ranged/FX_LaserBeam"` — energy weapon beam
- `"FX/Weapons/Explosive/FX_RocketTrail"` — missile/rocket

**Example — swapping a guard's baton VFX for an energy strike:**
```json
"fxs": [
  { "path": "FX/Weapons/Melee/FX_EnergyStrike" }
]
```

---

## GFX Icon Configuration

Every unit needs a UI icon (the small portrait shown in the unit wheel and selection panel).
This is set in the `"gfx"` block of the unit entry — it references a sprite sheet and an x/y
grid position:

```json
"gfx": {
  "file": "UI/Faction/unitsSmall_Common.png",
  "size": 80,
  "x": 0,
  "y": 3
}
```

The existing Landsraad units use `unitsSmall_Common.png`. Use the same sprite sheet and find
an unoccupied grid cell, or reuse the closest matching vanilla icon for prototyping.

For the wheel portrait (larger icon in the command wheel):
```json
"images": {
  "wheelPortrait": {
    "file": "UI/console/wheel_units_misc.png",
    "size": 358,
    "x": 7,
    "y": 0
  }
}
```

---

## Landsraad Unit Visual Plans

Based on the faction theme (gold armor, imperial authority, punitive force):

| Unit                       | Suggested Base Mesh            | Scale | Notes                              |
|----------------------------|-------------------------------|-------|------------------------------------|
| Landsraad Guard            | `Prefab_LandsraadGuard`       | 1.2   | Already in CDB — use as-is         |
| Landsraad Judge (ranged)   | `Prefab_LandsraadGuard_Gun`   | 1.2   | Already in CDB — use as-is         |
| Landsraad Punisher         | `Prefab_LandsraadGuard_Bazooka` | 1.2 | Already in CDB — use as-is         |
| Karlin Mallenor (leader)   | Imperial Commander prefab      | 1.45  | Kitbash target — TBD               |
| Vane Torvver (hero)        | Imperial Ranger/Enforcer       | 1.35  | Kitbash target — TBD               |
| Landsraad Enforcer (elite) | Corrino Elite / Sardaukar      | 1.3   | Faction colors will apply          |
| Auditor Drone              | Existing drone/ornithopter     | 0.8   | Smaller — support unit feel        |

---

## Animation Rig Compatibility

When swapping prefab paths between unit types, the `"rigName"` field must be compatible with
the target mesh's skeleton. Mismatched rigs cause T-pose bugs.

The Landsraad Guard uses `"rigName": 0` (standard humanoid rig). Most infantry prefabs share
this rig. Vehicles, ornithopters, and sandworms use different rig IDs and **cannot** be
cross-swapped with infantry meshes.

Check `"rigName"` in the source template before swapping prefab paths:
```json
"rigName": 0   // humanoid infantry
"rigName": 1   // vehicle/ornithopter (do not mix with infantry)
```

---

## Troubleshooting Visual Issues

| Symptom                        | Likely Cause                              | Fix                                      |
|-------------------------------|-------------------------------------------|------------------------------------------|
| Unit shows wrong faction color | Mesh uses hardcoded texture, not shader   | Choose a different base prefab           |
| T-pose / broken animation      | rigName mismatch between mesh and entry   | Match rigName to source prefab's value   |
| Unit invisible on battlefield  | Invalid / missing prefab path             | Verify path exists in another CDB entry  |
| Weapon effect missing          | VFX path string typo or missing asset     | Copy VFX string verbatim from vanilla    |
| Unit clipping through terrain  | Scale too high (above ~1.5)               | Reduce scale to 1.3–1.45                 |
| Weapon appears floating/wrong  | Weapon baked into mesh, not attachable    | Use a different base prefab              |

---

## Cross-References

- **CastleDB field structure** for gfx/mesh entries → [howto_castledb_workflow.md](./howto_castledb_workflow.md)
- **Finding paths in other mods** for kitbash inspiration → [howto_reverse_engineering.md](./howto_reverse_engineering.md)
