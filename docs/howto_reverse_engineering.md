# How-To: Reverse Engineering Mods and Vanilla Game Files

## Overview

When we hit a wall on implementing a complex mechanic — for example, a faction-wide passive
that ignores Landsraad standing penalties, or a unit with assassination immunity — the fastest
path forward is to find an existing game or mod implementation and study its exact JSON.

This guide covers the full pipeline: extracting pak files, comparing against vanilla, and
applying findings to our Landsraad work.

> **See also:**
> - [howto_castledb_workflow.md](./howto_castledb_workflow.md) — for applying extracted data to our CDB entries
> - [howto_visual_kitbashing.md](./howto_visual_kitbashing.md) — for visual asset paths found through extraction

---

## When to Use This Workflow

Use reverse engineering when:
- You cannot find how a vanilla mechanic is implemented by searching `data.cdb` alone
- A mod (Minx, Peter Quinn, etc.) has a feature we want to understand or reference
- You are stuck on a Landsraad trait and need to see how the closest vanilla equivalent works
- You want to confirm which JSON keys trigger a specific in-game behaviour

Examples relevant to our Landsraad work:

| Mechanic We Need              | Vanilla Reference to Examine                     |
|-------------------------------|--------------------------------------------------|
| Assassination immunity        | Corrino leader unit — check for immunity flags   |
| Ignore Landsraad penalties    | Smugglers faction — faction-level rep bypass     |
| GuildFavor resource costs     | Any unit using GuildFavor in `costs` block       |
| Instant deployment ability    | Fremen or Smugglers teleport/deploy operations   |
| Faction bonus starts          | All factions — `faction` sheet starting resources|

---

## Part 1: Understanding the Pipeline

The mod uses Haxe/HashLink to pack `data.cdb` into `res.compressed1.pak` for Dune: Spice Wars.
The same tool can unpack existing `.pak` files.

**Our workspace tools (in `/res/`):**
- `repackage.ps1` — packs our modded `data.cdb` into a `.pak` and deploys to Steam
- `repackage.py` — Python equivalent of the same pipeline
- `res.compressed1.pak` — current packed mod output

---

## Part 2: Extracting a Pak File

### Step 1: Obtain the target pak file

**Vanilla game files:**
- Located at: `C:\Program Files (x86)\Steam\steamapps\common\D4X\`
- Primary data pak is typically named `res.compressed1.pak` or similar (check the game folder)
- Copy it to a working directory — **never modify the original**

**Community mod files (Minx, etc.):**
- Subscribe to the mod on Steam Workshop
- Navigate to: `C:\Program Files (x86)\Steam\steamapps\workshop\content\<game_appid>\<mod_id>\`
  (Replace `<game_appid>` with Dune: Spice Wars's Steam App ID — check SteamDB; `<mod_id>` is the Workshop item ID from the URL)
- The mod's pak file will be there

> **Minx's mod** is one of the most structurally clean community factions. When you need a
> reference implementation for complex mechanics (deployment, unique trait stacking, etc.),
> start there before building from scratch.

### Step 2: Set up extraction

Two methods available — use whichever toolchain you have.

#### Method A: Haxe/HashLink (already installed for the build pipeline)

> **Note:** The extraction flag below is based on the repackage.ps1 build pattern. It has
> **not yet been tested** for extraction. Confirm the `-extract` flag works with your
> HashLink/heaps version before relying on it.

HashLink 1.15.0: `C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe`
Required Haxe libs: `heaps`

Run this PowerShell from the `/res/` directory to extract a pak into a folder:

```powershell
cd c:\dsw_mod\D4XEditor\res

# Compile the extractor
& haxe -hl hxd.fmt.pak.Build.hl -lib heaps -main hxd.fmt.pak.Build

# Extract the pak (replace SOURCE.pak and output/ with your paths)
& "C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe" hxd.fmt.pak.Build.hl -extract SOURCE.pak output/
```

After extraction, `output/` will contain a folder tree including `data.cdb`.

#### Method B: Standalone PAK Tool (alternative if Haxe is not available)

Some Dune: Spice Wars modders distribute standalone command-line pak tools. Check the
**Dune: Spice Wars Modding** Discord and **Nexus Mods** for current utilities. When found:
1. Place the tool in any working folder
2. Run: `pak-tool.exe extract SOURCE.pak --out output/`
3. The resulting folder tree will contain `data.cdb`

Prefer Method A if Haxe/HashLink is already configured — it uses the same code that built
the original pak, minimizing path mismatches.

### Step 4: Using repackage.ps1 for our mod

To pack our changes and deploy to the game, simply run:

```powershell
cd c:\dsw_mod\D4XEditor\res
.\repackage.ps1
```

This script:
1. Clears old mod files
2. Copies `data.cdb` into the resource folder
3. Compiles the Haxe build tool
4. Builds `res.compressed1.pak` using HashLink (`-diff` mode for smaller output)
5. Deploys `res.compressed1.pak` to `C:\Program Files (x86)\Steam\steamapps\common\D4X\`

---

## Part 3: Comparing Against Vanilla with VS Code

Once you have an extracted `data.cdb`, use VS Code's built-in file comparison:

### Method A: Compare Files (single mechanic)
1. Open the extracted file in VS Code
2. Right-click the file in Explorer → **Select for Compare**
3. Open our `res/data.cdb`
4. Right-click → **Compare with Selected**
5. VS Code opens a diff view — red = vanilla, green = mod changes

### Method B: Search specific mechanic

For targeted extraction without full diff, use **Ctrl+F** across the extracted file:

```
Search terms for Landsraad mechanics:
- "assassin"        → finds all assassination-related conditions/effects
- "immune"          → finds immunity flags and conditions
- "GuildFavor"      → finds all GuildFavor cost/effect references
- "Landsraad"       → finds all Landsraad standing references
- "standing"        → finds faction standing modifiers
- "reputation"      → finds reputation mechanic entries
```

### Method C: Grep across the entire extraction

For comprehensive research, use PowerShell to search all extracted files:

```powershell
# Find every JSON reference to a mechanic keyword
Get-ChildItem -Path "output/" -Recurse -Filter "*.cdb" |
  Select-String -Pattern "assassination|immune|Untouchable" |
  Select-Object Filename, LineNumber, Line
```

---

## Part 4: Applying Findings

### The Standard Method

1. Identify the exact JSON block implementing the mechanic in the reference file
2. Copy the minimal required fields (not the entire unit — just the relevant sub-block)
3. In our `mod/landsraad_units.yml` or `mod/landsraad_faction.yml`, document the pattern in
   `cdb_notes` with the source reference
4. When ready to generate CDB JSON, use the copied pattern as the template
   (see [howto_castledb_workflow.md](./howto_castledb_workflow.md))

### Example: Finding Assassination Immunity

The Corrino emperor likely has an assassination immunity flag. After extracting:

```powershell
Get-Content "output/data.cdb" | Select-String "assassin" -Context 3,3
```

This returns surrounding lines — giving us the full JSON structure implementing the mechanic.
We then copy that pattern to Karlin Mallenor's unit entry in `data.cdb`.

**Expected JSON skeleton we're looking for** (illustrative — actual IDs vary):

```json
{
  "id": "CorrinoEmperor",
  "traits": ["AssassinationImmune", "Leader"],
  "conditions": [
    { "id": "cond_IsLeader", "effect": "eff_AssassinImmune" }
  ]
}
```

Once found, translate to our YAML `cdb_notes` and apply the equivalent `traits`/`conditions`
block to `Karlin_Mallenor` in `data.cdb`.

### Example: GuildFavor Resource Costs

Any operation costing `GuildFavor` follows this JSON pattern in the `quest` sheet:

```json
{
  "id": "SomeGuildOperation",
  "cost": [
    { "resource": "GuildFavor", "amount": 2 }
  ]
}
```

For our Landsraad Guild Transporters operation, search for `"GuildFavor"` in any extracted
vanilla `.cdb` to confirm the exact resource ID string and cost field name before writing
our CDB entry.

---

## Part 5: Data Modding vs Advanced Scripting

### What We Are Doing (Data Modding — 99% of faction work)

Everything we build for LandsraadFaction is **data modding**:
- Editing `data.cdb` JSON to add units, abilities, operations, and faction mechanics
- All new mechanics are achieved by **creatively linking existing vanilla traits and operations**
- No compiled code, no DLLs, no engine hacking

This is safe, reversible, and works with game updates as long as core sheet structures don't change.

### What Advanced Modders Do (C# / DLL Injection)

When modders use C# or DLL injection, they are creating:
- **Hardcoded mechanics** not supported by the database (new UI menus, custom event hooks)
- **Runtime patches** to game logic that can't be changed through CDB alone

**This is out of scope for the Landsraad faction mod.** Our entire faction is built on data
modding — CDB JSON editing only. Any mechanic that seems impossible at first should be
re-examined: in almost all cases, a combination of vanilla traits, conditions, and effects
can approximate the intended behavior without runtime patching.

### Decision Tree: Stuck on an Implementation?

```
Can I find an analogous mechanic in vanilla data.cdb?
├── YES → Copy that pattern and adapt it
└── NO  → Extract a community mod that has it
        ├── Found it → Copy and study the pattern
        └── Not found → Redesign the mechanic using
                        existing vanilla building blocks
                        (traits + conditions + effects)
```

---

## Quick Reference: Common Extraction Scenarios

| Goal                                        | What to Extract/Search                           |
|---------------------------------------------|--------------------------------------------------|
| Understand assassination immunity           | Corrino faction leader unit entry                |
| Understand faction standing bypass          | Smugglers faction entry + related conditions     |
| Understand GuildFavor mechanics             | GuildFavor resource sheet + operations using it  |
| Copy a unique ability structure             | Search ability sheet for closest vanilla ability |
| Find a valid model/prefab path              | Search unitGfx sheet for `"path"` entries        |
| Learn from Minx's mod                       | Extract Workshop pak → Compare vs vanilla CDB    |
| Understand a trait's effect chain           | Search `condition` and `effect` sheets           |

---

## Part 6: Worked Example — Full Extraction → Compare → Apply Cycle

This walkthrough uses a hypothetical reference mod as a concrete illustration:

**Goal:** Find how a reference mod implements a faction-wide trait that prevents Landsraad
standing loss.

1. **Extract the reference mod pak:**
   ```powershell
   cd c:\dsw_mod\D4XEditor\res
   & haxe -hl hxd.fmt.pak.Build.hl -lib heaps -main hxd.fmt.pak.Build
   & "C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe" hxd.fmt.pak.Build.hl -extract reference_mod.pak C:\Temp\ref_extracted\
   ```

2. **Search for the standing mechanic:**
   ```powershell
   Get-Content "C:\Temp\ref_extracted\data.cdb" | Select-String "standing|reputation|penalty" -Context 5,5
   ```

3. **Compare key sections against vanilla:**
   - Open `C:\Temp\ref_extracted\data.cdb` in VS Code
   - Right-click → Select for Compare
   - Open `res/data.cdb` (our file) → Right-click → Compare with Selected
   - Diff reveals exactly which fields the mod added/changed

4. **Extract the relevant JSON pattern:**
   ```json
   {
     "id": "RefFactionId",
     "traits": ["IgnoreLandsraadPenalties"],
     "passives": [
       { "id": "p_NoStandingLoss", "condition": null, "effect": "eff_LandsraadImmune" }
     ]
   }
   ```

5. **Translate to our YAML (`mod/landsraad_faction.yml`):**
   ```yaml
   cdb_notes: |
     Pattern sourced from reference mod faction sheet.
     Uses 'IgnoreLandsraadPenalties' trait + 'eff_LandsraadImmune' effect chain.
     Verify trait ID exists in vanilla data.cdb before applying.
   ```

6. **Apply to data.cdb** using the CastleDB workflow in
   [howto_castledb_workflow.md](./howto_castledb_workflow.md)

---

## Safety Rules

- **Never modify extracted files in place** — always work on copies
- **Never commit extracted vanilla .cdb files** to our repo — copyright
- **Never distribute extracted vanilla game assets** in the mod release — extracted assets
  belong to Shiro Games and may not be redistributed
- **Document sources in cdb_notes** — "Pattern from Corrino leader unit, line ~XXXX"
- **Only reference patterns, do not copy IDs** — always rename before using
