---
name: sync-unit-from-cdb
description: "Sync a unit entry in mod/landsraad_units.yml with its actual definition in res/data.cdb. Use when: a YAML unit entry has a wrong or placeholder ID, stats that don't match CDB, or needs to be updated from the real CDB data. Handles id rename, stat sync, inherits resolution, gfx, sounds, flags, and cdb_notes. DO NOT USE for: creating brand-new units with no CDB counterpart."
argument-hint: "unit name or current YAML id to sync (e.g. 'LandsraadGuard')"
---

# Sync Unit YAML from CDB

Rewrites a unit block in `mod/landsraad_units.yml` so it accurately reflects what is in `res/data.cdb`, including any inherited base-template fields. Updates the `id`, all stats, texts, inherits chain, gfx, model, sounds, costs, flags, and `cdb_notes`.

## When to Use
- A unit's YAML `id` is a design placeholder that differs from the real CDB id
- Stats in YAML don't match the actual CDB values
- A new unit was added to CDB and needs a YAML record created or refreshed
- Any time the phrase "update from CDB" or "sync from CDB" is used for a unit

## Inputs
- **Target unit**: a YAML `id`, display name, or description that identifies which unit block to change
- **New CDB id** (optional): if already known, speeds up the search step

## Procedure

### Step 1 — Read the YAML unit block
Read `mod/landsraad_units.yml` and locate the unit block to be updated. Note:
- The current `id`
- The display `name`
- Any fields that look like guesses or placeholders (round numbers, made-up trait names, `cdb_notes` saying "mirror Atreides", etc.)

### Step 2 — Find the CDB entry
Search `res/data.cdb` for the correct unit. Try in order:
1. Search for the new/target CDB id directly (`"id": "<newId>"`)
2. If not known, search for the display name string (e.g. `"name": "Landsraad Guard"`)
3. If still not found, search for related keywords (faction prefix + role keyword)

Record the **line number** of the matched entry for the next step.

> **Important:** Never search `res/res/data.cdb` — that is the packed asset copy. Only use `res/data.cdb`.

### Step 3 — Read the CDB unit entry
Read ~200 lines around the matched line. Capture every field present in the entry:
- `id`, `texts` (name, desc, plural)
- `stats` array (health, power, armor, range, trainingTime, maxSupply, safeRegen, maxExpLevel)
- `traits`, `attacks`, `equipment`, `effects` (models, sounds, events)
- `costs`, `props` (squadSize, squadSpacing, excessWeight, radius, etc.)
- `gfx` (file, size, x, y)
- `images` (wheelPortrait)
- `inherits` (base template id)
- `faction`, `flags`
- `aiWeights`

### Step 4 — Resolve the inherited base template (if present)
If the entry has an `"inherits"` field, search for that base template id in `res/data.cdb` and read its entry. Note which fields the child entry **overrides** (present in both child and base) vs. **inherits** (only in base). This determines what to document as "inherited" in `cdb_notes`.

### Step 5 — Rewrite the YAML block
Replace the entire unit block in `mod/landsraad_units.yml` with values from CDB. Use this structure:

```yaml
  - id: <cdb_id>
    name: "<texts.name>"
    name_plural: "<texts.plural.name>"
    role: <keep existing role label>
    unit_class: <keep existing or derive from inherits>
    faction: <cdb faction value>
    inherits: <cdb inherits value>
    description: >
      <texts.desc verbatim from CDB>

    stats:
      health: <stats.health>
      armor: <stats.armor>
      power: <stats.power>
      range: <stats.range>      # 0 = melee
      squad_size: <props.squadSize or inherited>
      max_supply: <stats.maxSupply>
      training_time: <stats.trainingTime>
      safe_regen: <stats.safeRegen>
      max_exp_level: <stats.maxExpLevel>

    combat:
      attack_style: <melee|ranged|ranged_heavy derived from range value>
      attacks:
        - ref: <attacks.combos[0].ref if present>

    traits:
      # List CDB traits; note if empty override vs base traits

    gfx:
      file: "<gfx.file>"
      size: <gfx.size>
      x: <gfx.x>
      y: <gfx.y>
    wheel_portrait:           # omit block if images.wheelPortrait absent
      file: "<images.wheelPortrait.file>"
      size: <images.wheelPortrait.size>
      x: <images.wheelPortrait.x>
      y: <images.wheelPortrait.y>

    model: <effects.models[0].ref if present>

    sounds:
      select: "<voice action=0 event>"
      move:   "<voice action=1 event>"
      attack: "<voice action=2 event>"

    recruitment:
      costs: <{} if empty, else structured values>
      upkeep: <{} if empty, else structured values>

    flags: <flags integer>

    cdb_notes: >
      - Unit exists in data.cdb at line ~<line>.
      - Inherits from <base_template> (<list key inherited fields>).
      - <This entry> overrides: <list overridden fields>.
      - costs/upkeep are <empty/populated>; <populate note if empty>.
      - <Any companion units, start-army references, or cross-references found>.
```

### Step 6 — Verify
- Confirm the old YAML `id` no longer appears in the file
- Confirm all stat values match CDB exactly
- `cdb_notes` references the correct line number in data.cdb

## Quality Checklist
- [ ] `id` matches the CDB `"id"` field exactly (case-sensitive)
- [ ] `stats` values are verbatim from CDB, not rounded or estimated
- [ ] `inherits` field preserved; inherited-only fields noted in `cdb_notes`
- [ ] `faction` matches CDB `"faction"` value
- [ ] `gfx` and `wheel_portrait` coordinates match CDB exactly
- [ ] `sounds` events match CDB voice entries (action 0/1/2)
- [ ] `costs` accurately reflects CDB (`{}` if empty, not Solari/Manpower estimates)
- [ ] `cdb_notes` names the base template, line number, and any cross-references
- [ ] No edits made to `res/res/data.cdb`
