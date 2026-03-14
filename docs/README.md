# D4XEditor Modding Documentation

This folder contains technical how-to guides for contributors working on the Landsraad faction
mod for Dune: Spice Wars.

---

## Guides

| Guide | Description | When to Use |
|-------|-------------|-------------|
| [howto_castledb_workflow.md](./howto_castledb_workflow.md) | Step-by-step workflow for editing `data.cdb`: finding the Atreides template, copying and renaming entries, field mapping from YAML to CDB JSON, and JSON validation. | Adding or modifying any unit, faction, ability, quest, or resource entry in `data.cdb`. |
| [howto_visual_kitbashing.md](./howto_visual_kitbashing.md) | How to configure unit visuals without 3D software: model/prefab path swapping, faction color masks, GFX icon coords, scale parameters, VFX string substitution, and audio references. | Changing how a unit looks, its icon, its faction color, or its sound effects. |
| [howto_reverse_engineering.md](./howto_reverse_engineering.md) | How to extract and compare `.pak` files from the vanilla game or community mods (e.g. Minx), use VS Code's Compare Files diff to inspect implementations, and translate findings to CDB JSON. | Stuck on how vanilla implements a mechanic; researching a community mod's approach; verifying a JSON structure before writing it. |

---

## Quick Decision Guide

> **Not sure which guide to read?** Start here:

```
What are you trying to do?
├── Write or modify a CDB entry (unit/faction/operation/quest)
│   └── → howto_castledb_workflow.md
├── Change how something looks (model, icon, color, sound)
│   └── → howto_visual_kitbashing.md
├── Figure out how a mechanic works in vanilla or an existing mod
│   └── → howto_reverse_engineering.md
└── Not sure — read all three (they cross-reference each other)
```

---

## Conventions

- All guides reference the **Atreides faction** as the copy template for CDB entries.
- Landsraad-specific unit IDs follow the pattern `Landsraad*_Faufreluches`.
- The faction entry in `data.cdb` is `LandsraadFaction`.
- Master YAML design documents live in `mod/` — edit those first, then translate to CDB JSON.

---

## See Also

- `.github/copilot-instructions.md` — workspace agent instructions including trigger rules
  that auto-route tasks to the relevant guide above
- `mod/landsraad_units.yml` — unit definitions (YAML source of truth)
- `mod/landsraad_faction.yml` — faction mechanics and identity
- `res/repackage.ps1` — build and deploy pipeline (Haxe → HashLink → Steam)
