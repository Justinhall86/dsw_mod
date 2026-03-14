# How-To: CastleDB Workflow for Landsraad Faction Modding

## Overview

`data.cdb` is the heart of the Dune: Spice Wars game database. It behaves like a relational
spreadsheet but is stored as plain JSON. All faction stats, unit definitions, council abilities,
operations, and resource costs live here. **All our Landsraad work starts here.**

---

## Rule Zero: Never Write From Scratch

> **Always copy a vanilla block. Change the ID. Modify stats. Never invent structure.**

The game engine validates CDB entries against an internal schema. Hand-written blocks will fail
silently or crash on load. Copying an Atreides block guarantees valid structure from the start.

---

## Step 1: Find Your Template Block (Atreides Gold Standard)

The Atreides faction is our reference template. Before creating any Landsraad asset, locate the
Atreides equivalent in `res/data.cdb`:

| Landsraad Asset             | Atreides Template to Copy             |
|-----------------------------|---------------------------------------|
| Landsraad Guard (infantry)  | Atreides infantry soldier unit        |
| Karlin Mallenor (leader)    | Paul / Leto hero leader unit          |
| Vane Torvver (hero)         | Duncan Idaho / hero unit              |
| Landsraad operation         | Atreides espionage quest entry        |
| Council ability             | Atreides council ability              |
| Starting resources          | Atreides faction starting lines       |

### How to Find the Atreides Block

1. Open `res/data.cdb` in VS Code
2. Use **Ctrl+F** and search for `"faction": "Atreides"` or `"id": "Atreides"` to locate faction root
3. For a specific unit, search for the unit's display name string, e.g. `"name": "Atreides Trooper"`
4. Copy the entire JSON object (from `{` to matching `}`) including all nested fields

---

## Step 2: Paste and Rename the ID

Paste the copied block into the correct sheet array. Then change the `"id"` field immediately —
this is the most critical step. IDs are the primary key; duplicate IDs will corrupt the database.

**Example — creating LandsraadSoldiers_Faufreluches from an Atreides troop:**

```json
{
  "id": "LandsraadSoldiers_Faufreluches",
  "texts": {
    "name": "Landsraad Guard",
    "desc": "[Landsraad-longname] maintains a professional troop of peacekeepers...",
    "plural": { "name": "Landsraad Guards" }
  },
  "stats": [{ "health": 600, "power": 18, "armor": 6, "range": 0, "trainingTime": 3, "maxSupply": 100 }],
  "inherits": "Landsraad_Soldier",
  "faction": "LandsraadFaction",
  "flags": 1
}
```

**Fields to always change after copying:**
- `"id"` — must be unique across the entire sheet
- `"faction"` — set to `"LandsraadFaction"`
- `"texts.name"` / `"texts.desc"` — match the YAML design doc
- `"stats"` — update to match `mod/landsraad_units.yml` values
- `"inherits"` — set to the appropriate Landsraad base template if one exists

**Fields to keep from template (unless intentionally changing):**
- `"costs"` structure (keys must match valid resource IDs)
- `"effects"` structure (model refs, sound event format)
- `"props"` structure (squadSize, squadSpacing, etc.)

---

## Step 3: Understand the `inherits` System

Many Landsraad units inherit from a shared base template (e.g. `Landsraad_Soldier`,
`Landsraad_Ranged`, `Landsraad_Demo`). The child entry **overrides** only the fields it specifies;
everything else is pulled from the base.

**Practical rule:** If a field is not in the child entry, look at the base template. Document in
`cdb_notes` what is inherited vs. what is overridden. See `mod/landsraad_units.yml` for examples.

---

## Step 4: Edit in VS Code, Validate in CastleDB GUI

### VS Code (editing)
- Use VS Code's JSON syntax highlighting and bracket matching to catch structural errors
- Install the **JSON** language support extension for schema-aware autocomplete
- Use **Format Document** (`Shift+Alt+F`) to keep the JSON readable after edits
- Use **Ctrl+Shift+\`** to jump to matching bracket when navigating large objects

### CastleDB GUI (validation)
After editing `res/data.cdb`:
1. Launch the CastleDB editor from the workspace (see `package.json` for the NW.js app command)
2. Open `res/data.cdb` — the GUI will report broken reference IDs (e.g. a unit referencing a
   non-existent trait ID) in red
3. Fix any reported broken references before proceeding
4. Close without saving from CastleDB (save only from VS Code to preserve formatting)

---

## Step 5: Validate JSON Before Every Commit

Run this PowerShell check before committing any change to `res/data.cdb`:

```powershell
# In workspace root:
Get-Content "res/data.cdb" | ConvertFrom-Json | Out-Null
Write-Host "JSON is valid"
```

If `ConvertFrom-Json` throws, the file has a syntax error. Use VS Code's **Problems** panel
(`Ctrl+Shift+M`) to locate it.

---

## Step 6: Matching the YAML Design Docs to CDB Fields

The `mod/landsraad_units.yml` file is the source of truth for design intent. When translating
to CDB JSON, use this field mapping:

| YAML Field         | CDB JSON Path                          |
|--------------------|----------------------------------------|
| `id`               | `"id"`                                 |
| `name`             | `"texts.name"`                         |
| `name_plural`      | `"texts.plural.name"`                  |
| `description`      | `"texts.desc"`                         |
| `stats.health`     | `"stats[0].health"`                    |
| `stats.armor`      | `"stats[0].armor"`                     |
| `stats.power`      | `"stats[0].power"`                     |
| `stats.range`      | `"stats[0].range"` (0 = melee)         |
| `stats.training_time` | `"stats[0].trainingTime"`           |
| `stats.max_supply` | `"stats[0].maxSupply"`                 |
| `faction`          | `"faction"`                            |
| `inherits`         | `"inherits"`                           |
| `gfx.file`         | `"gfx.file"`                           |
| `flags`            | `"flags"`                              |

---

## Landsraad-Specific Notes

### Faction ID
Always use `"LandsraadFaction"` (not `"Landsraad"`) for units that belong exclusively to our
playable faction. `"Landsraad"` refers to the neutral/NPC Landsraad faction in the base game.

### Faufreluches Unit IDs
The three core infantry units use the `_Faufreluches` suffix as their CDB row IDs, matching
the game's existing Landsraad base templates:
- `LandsraadSoldiers_Faufreluches` — melee guard
- `LandsraadRanged_Faufreluches` — ranged judge
- `LandsraadDemo_Faufreluches` — siege punisher

### GuildFavor Resources
The Landsraad faction uses `GuildFavor` as a resource cost for certain deployment abilities
(e.g. Adjudicator Drop). When referencing this in ability `costs`, use exactly `"GuildFavor"`
as the resource key — verify it exists in the `resource` sheet before using.

### Assassination Immunity
Karlin Mallenor's assassination immunity is implemented as a permanent effect/flag, not as a
standard ability. When generating the leader unit block, look for existing immunity flag
implementations in Corrino leader units as a reference pattern.

---

## Quick Reference Checklist

Before committing a new or modified CDB entry:
- [ ] `"id"` is unique within its sheet
- [ ] `"faction"` is set to `"LandsraadFaction"` (not `"Landsraad"`)
- [ ] All referenced IDs (traits, abilities, models, sounds) exist in their respective sheets
- [ ] JSON validates with `ConvertFrom-Json`
- [ ] Stats match `mod/landsraad_units.yml` values exactly
- [ ] `cdb_notes` in YAML updated with the correct line number reference
- [ ] Never edited `res/res/data.cdb` (the packed asset copy)
