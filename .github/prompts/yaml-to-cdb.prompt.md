---
description: "Translate a Landsraad mod YAML file into CastleDB JSON and safely append it to res/data.cdb. Use when a YAML design file in mod/ is finalized and ready to be written into the game database."
argument-hint: "Which YAML file to translate? (faction / councillors / units / operations)"
agent: "agent"
---

Translate the specified Landsraad mod YAML file into valid CastleDB JSON and append the result to [res/data.cdb](../res/data.cdb).

## Input

The YAML file to translate is: **`mod/landsraad_{{argument}}.yml`**  
If no argument was given, ask which file before proceeding.

## Pre-flight Checks (do these first, in order)

1. **Confirm YAML is finalized** — read the target YAML file in full. If it contains any `# TODO`, `# TBD`, `# placeholder`, or `notes:` keys that say "subject to balance tuning / pending", stop and ask the user to confirm those values before continuing.

2. **Validate current CDB JSON** — run:
   ```powershell
   $null = Get-Content "res/data.cdb" -Raw | ConvertFrom-Json
   ```
   If this fails, stop immediately — the file is already broken and must not be modified until fixed.

3. **Identify the target sheet** in `res/data.cdb` using the mapping below. Read the sheet's `columns` array to confirm the current schema before writing any row.

## CastleDB Format Rules — MANDATORY

These rules are non-negotiable. Violating any of them corrupts the file.

### ID Constraints
- Every `id` field must match `^[A-Za-z_][A-Za-z0-9_]*$` — **no spaces, no hyphens, no dots**.
- IDs must be unique within their sheet. Before inserting, search the target sheet's `lines` array for any existing row with the same `id`. If found, **do not duplicate** — update only if explicitly authorised.

### JSON Structure
- The `.cdb` file is `JSON.stringify`-formatted with **tab indentation**.
- The top-level object has three keys only: `"sheets"`, `"customTypes"`, `"compress"`.
- **Never add new sheets** — only append rows (`lines` entries) to existing sheets.
- The `lines` arrays inside **sub-sheet definitions** (the `faction@startResources` etc. sheet objects) are **always empty `[]`** — sub-sheet data lives inline inside the parent row, not there.

### typeStr → JSON value mapping (reference when building row objects)

| typeStr | What to write in the row |
|---|---|
| `"0"` Unique ID | `"StringIdentifier"` |
| `"1"` Text | `"any string"` |
| `"2"` Bool | `true` or `false` |
| `"3"` Int | integer literal |
| `"4"` Float | number literal |
| `"5:a,b,c"` Enum | integer index (0 = first value) |
| `"6:sheet"` Reference | `"targetRowId"` string |
| `"8"` List (TList) | inline array `[{...}, ...]` |
| `"10:a,b"` Flags | integer bitmask |
| `"11"` Color | integer (RGB decimal, e.g. `13938999` for `#D4AF37`) |
| `"13"` File | `"path/to/file"` string |
| `"14"` TilePos | `{"file":"...", "size":64, "x":0, "y":0}` |
| `"17"` Properties (TProperties) | inline object `{...}` |

### TList vs TProperties — critical distinction
- `typeStr "8"` columns → the value in the row is an **array** `[...]`
- `typeStr "17"` columns → the value in the row is an **object** `{...}`
- Optional columns (`"opt": true` in the column definition) may be **omitted entirely** from the row object if null — do not write `null` for them unless the column is explicitly required.

## YAML → CDB Sheet Mapping

| YAML file | Primary CDB sheet | Also touches |
|---|---|---|
| `landsraad_faction.yml` | `faction` (append row to `lines`) | Verify `faction@startResources`, `faction@baseProduction`, `faction@characters`, `faction@props` column schemas |
| `landsraad_councillors.yml` | `character` (append rows) | May reference `ability` (do not create ability rows here) |
| `landsraad_units.yml` | `unit` (append rows) | `unit@stats`, `unit@attacks`, `unit@costs`, `unit@effects` inline schemas |
| `landsraad_operations.yml` | `quest` (append rows) | `quest@props`, `quest@effects` inline schemas |

## Translation Steps

1. **Read the YAML file** in full.
2. **Read the target sheet's column definitions** from `res/data.cdb` to confirm field names and types.
3. **Read one complete existing row** from the same sheet (use `Atreides` for `faction`, `Leto` for `character`, any existing unit for `unit`) as a structural template.
4. **Build the new JSON row object(s)** following the typeStr rules above. Match the Atreides/existing row structure field by field. Only include optional fields if the YAML explicitly defines them.
5. **Colour integers**: Convert any hex colour string (e.g. `#D4AF37`) to decimal integer: `[System.Convert]::ToInt32("D4AF37", 16)`.
6. **Append** the new row(s) to the end of the target sheet's `lines` array. Do not insert in the middle.
7. **Write** the modified JSON back to `res/data.cdb` using tab indentation. Preserve all existing content exactly.
8. **Validate** the result:
   ```powershell
   $null = Get-Content "res/data.cdb" -Raw | ConvertFrom-Json
   Write-Host "JSON valid"
   ```
   If validation fails, restore from backup before reporting the error.

## Safety Rules

- **Never edit `res/res/data.cdb`** — that is a packed asset. Only `res/data.cdb`.
- **Never overwrite or remove existing rows** — append only.
- **Create a backup before writing**:
  ```powershell
  Copy-Item "res/data.cdb" "res/backups/data.cdb.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  ```
- If the JSON validation step fails, immediately restore the backup and report the specific parse error.
- Do not create new `character`, `ability`, or `quest` rows as side-effects when translating `faction` — cross-sheet references are separate tasks.

## Output

After successful write, report:
- Which rows were added and to which sheet
- The new row's `id` value
- Confirmation that JSON validation passed
- Any YAML fields that were skipped (with reason)
- Any fields that need follow-up work in separate sheets (e.g. character/ability rows still needed)
