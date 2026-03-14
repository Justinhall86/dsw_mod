# D4XEditor — Dune: Spice Wars Mod Workspace

## Project Purpose
This workspace is a mod development environment for **Dune: Spice Wars**.  
The goal is to add a custom playable faction — **the Landsraad** — to the game.

## Primary Data File
- **`res/data.cdb`** — the main game database (CastleDB / JSON format). **This is the file we edit.**
- **`res/res/data.cdb`** — a nested copy inside packed resources. **Do NOT confuse or edit this file.**

## CastleDB (.cdb) Format
CastleDB files are plain **JSON** with a specific top-level structure:
```json
{
  "sheets": [
    {
      "name": "sheetName",
      "columns": [ { "typeStr": "0", "name": "id" }, ... ],
      "lines": [ { "id": "rowId", ... } ]
    }
  ],
  "customTypes": [...],
  "compress": false
}
```
- Each "sheet" is a table. Sub-sheets use `@` notation (e.g. `faction@characters`).
- Column `typeStr` codes: `0`=Unique ID, `1`=Text, `2`=Boolean, `3`=Integer, `4`=Float, `5`=Color, `6:`=Reference, `7`=Enum, `8`=List, `9`=Image, `10`=Tile, `17`=Dynamic JSON.
- The editor is a custom NW.js app launched from this workspace.

## Key Sheets in data.cdb (relevant to faction modding)
| Sheet | Purpose |
|---|---|
| `faction` | Playable faction definitions (id, texts, colors, starting resources, etc.) |
| `character` | Leaders, councillors, speakers |
| `unit` | All military units (stats, attacks, costs, effects) |
| `ability` | All abilities (council powers, special actions) |
| `quest` | Quests and operations (espionage missions) |
| `resource` | Resource types (Solari, Influence, Intel, GuildFavor, etc.) |
| `condition` / `effect` | Shared logic building blocks |

## Existing Factions (for reference)
`Atreides`, `Harkonnen`, `Smugglers`, `Fremen`, `Corrino`, `Ecaz`, `Vernius`  
There is already a stub entry `LandsraadFaction` in the sheet — our custom faction extends this.

## Landsraad Faction — Core Design Context
**Identity:** Political, punitive, and wealthy. Relies on CHOAM wealth, Spacing Guild transport, and elite punitive military.  
**Visual theme:** Primary color gold, secondary imperial purple.  
**Global mechanics:**
- Ignores Landsraad standing penalties
- Starts with 10,000 Solari
- Can trade Spice for Influence
- Faction leader is completely immune to assassination

**Councillors:** Jakob (Guild/transport), Siora (Spy/punitive), Herbert (Military), Nier (Diplomacy)  
**Key units:** Karlin Mallenor (leader), Vane Torvver (hero), Landsraad Guard, Landsraad Legionnaire, Punisher, Landsraad Enforcer, Auditor drone  
**Key operation:** Guild Transporters (instant troop deployment, 50 Intel or Influence)

## Mod Design Documents (YAML master reference — do not generate CDB JSON until these are finalized)
Located in `mod/`:
- `mod/landsraad_faction.yml` — core faction identity, mechanics, visuals
- `mod/landsraad_councillors.yml` — four starting advisors
- `mod/landsraad_units.yml` — full military roster
- `mod/landsraad_operations.yml` — espionage missions and operations

## Workflow Rules
1. **Draft in YAML first** — all new faction content goes into the `mod/*.yml` files.
2. **Edit CDB second** — once YAML is approved, translate to CastleDB JSON in `res/data.cdb`.
3. **Never edit `res/res/data.cdb`** — that is a packed asset, not the working file.
4. **Preserve existing entries** — when adding to `data.cdb`, append new rows; do not overwrite existing faction rows.
5. **Validate JSON** — after any edit to `data.cdb`, verify it is valid JSON before saving.
6. **Use the existing faction schema** as a template (see the `Atreides` entry as the gold standard).

## Helper Skills
- **`/sync-unit-from-cdb`** — Reusable workflow to synchronize a unit entry in `mod/landsraad_units.yml` with its definition in `res/data.cdb`. Handles ID renaming, stat sync, inheritance chains, graphics, sounds, and documentation. Use when a YAML unit has a placeholder ID or stats that don't match CDB.
