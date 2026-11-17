---
name: dsw-custom-building
description: Put a custom 3D building model (Meshy output, kitbash, recolour, any textured mesh in a .blend) into Dune Spice Wars (D4X) as the look of a building row, and know what a building's click window can and cannot do. Covers Blender export of a static building FBX, HMD conversion without a skeleton (the toolkit's "has no skin" error), the prefab, the StructMOD res folder, the data.cdb model path, staging into the pak, and a round-trip render next to a vanilla building. Also the engine rules for building selection windows (only Guild Branch, Recycling Plant and Nuclear Silo get one, by hard-coded id) and how the Thorvald Consignment Terminal got the Recycling window with its own rates. Use whenever the user wants a new or replaced building model, a building that "still shows the old model", a starport/HQ/structure in the game, a building whose window "only shows text and doesn't do anything", or a custom building window/trade/button, even if they don't say "building skill". Not for units (dsw-new-unit), vehicles (dsw-vehicle-preview / CLAUDE.md vehicle export) or deciding if a building is buildable (dsw-building-audit).
---

# DSW custom building: model into the game, and what its window can do

First built on 2026-11-10 for the Thorvald Consignment Terminal: the user's copper starport (`model_projects/thorvald/thorvald_starport`) replaced the Guild Branch model on row `Th_ConsignmentTerminal`.
The scripts in `scripts/` are the generalised versions of that project's `08_scripts/10-13`.

## Part 1: the model (data-only, low risk)

A vanilla building HMD is simple: **one unskinned model, one material, vertex format position/normal/tangent/uv, no colliders**.
The game places it from a prefab named in `building.visuals.model[0].path`. So the pipeline is:

| Step | Command | Check |
|---|---|---|
| 1 Export | `blender -b <file.blend> --python scripts/export_building.py -- <project> --object <Obj> --name <GameName> --albedo <img> --mga <img> --normal <img>` | `@@scale` and bounds printed; footprint ~5.5 (Guild Branch is 5.2 × 3.5 × 3.3) |
| 2 Convert | `py -3 scripts/convert_building.py <project> <GameName>` | prints 1 model, `skin False`, 3 textures found, the cdb path |
| 3 Round trip | `py -3 scripts/roundtrip_render.py <project> <GameName>` (in the background, minutes) | Read `compare_3q.png` yourself, then SendUserFile it: upright, textured, size and facing comparable to the vanilla building |
| 4 cdb | `py -3 scripts/cdb_model.py <project> <Row> <prefab path>` then `--apply` (`--revert` exists) | only one path changed |
| 5 Stage | add `"StructMOD/<GameName>": <project>/06_game_ready/StructMOD/<GameName>` to `SOURCES` in `mod_files/stage_and_pack.py` (D: PC) or copy into the editor res tree (C: PC) | stage_and_pack: "all vanilla or staged" |
| 6 Validate, pack | `cdb_validate.py` (0 NEW), `engine_preflight.py` (0 FAIL), then pack | install only when the user asks; the game must be closed |

Why each non-obvious bit is there:
- **"has no skin" from convert_fbx**: its `model` mode runs `fbxfix.fix` to rebuild a skeleton from a skinned reference. Buildings have none, so `convert_building.py` monkeypatches `fbxfix.fix` to a plain copy and lets the toolkit do the rest (repack with the game's `D4X.exe`, texture extraction, texture paths rewired to `StructMOD/<name>/`).
- **Material wiring** must be exactly: Albedo → Base Color, MetallicGlossAO → *Specular IOR Level*, Normal → Normal Map node. Anything else and the converter drops textures. One material only.
- **AO lift**: baked/Meshy albedos are already shaded; vanilla AO is bright (mean ~230). Lifting B to `0.55 + 0.45·B` stops the building going muddy in game.
- **Prefab `rotationZ` 90**: vanilla building geometry is Y-up with a node rotation and the vanilla prefab turns it 90°. The script copies the Guild Branch prefab (model, dirt decal, `FX_ConstructionStart`), without the Guild's beacon. If the round trip shows a wrong facing, change `--rot`.
- **No construction model needed**: `StructureModel.makeBuildingObj` loads `<prefab>_Construction.prefab` only if `Loader.exists` says so; otherwise it shows the main prefab.
- **Thumbnail** (the build-menu icon) stays the old row's until replaced separately.
- Blender headless: iterate `bpy.data.objects` when deleting; `view_layer.objects` yields None after removals.

## Part 2: the building's window (needs hlboot.dat)

Clicking a building opens `BuildingUI`, which **only lists attribute texts**: a description that says "trades X for Y" does nothing by itself.
Real windows exist for three buildings, chosen by **hard-coded id strings** in two places:
- `ent.Structure.createBuilding`: `NuclearSilo`, `RecyclingPlant`, `SpacingGuildBranch` become their own classes, and each class's constructor hard-codes its kind string.
- `ui.GameUI.displayBuilding`: opens `NuclearSiloUI`, `RecyclingPlantUI`, `GuildBranchUI` for those ids (owner = you, status ≠ 3).

So a cloned row with a new id (`Th_ConsignmentTerminal`) never gets a window from data alone. The options, cheapest first:
1. **Top-bar Convert line** on a trait the building grants (data-only; `thorvald_faction/08_scripts/57_consignment_terminal.py`). An instant trade, not a window.
2. **Borrow a vanilla window with own rules (an hlboot patch, done).** `tool/thorvald_ticks/thorvald_sworn/thsw_terminal.py` hooks four functions:
   - `createBuilding`: builds a `RecyclingPlant` object for our id (`$Building.__constructor__` + `Logic.onCreate`).
   - `displayBuilding`: jumps to the Recycling branch for our kind.
   - `RecyclingPlant.getTradingRate`: our sell/buy rates.
   - `RecyclingPlantTradesUI.getPossibleResources`: our resource lists.

   Data side: `58_terminal_window.py` (the faction must not `TRes_Block` the middle currency `Scraps`).
   Built with the `dsw-hlboot-patching` flow (`changes.py` registers it). The window titles and the currency name remain the Recycling ones.
3. **Same window, own texts**: hook the `Texts.DATA.recycling_plant` lookup for our kind (not built yet).
4. **Fully custom window**: a new UI class in bytecode. Large, many test rounds, real crash risk. Do it as a *separate* building so it can't break a working one.

The Recycling and Guild designs are one mechanism: a daily `giftRes` → middle currency (`Scraps`/`GuildFavor`, hard-coded) → daily `requestRes`.
- Rates come from resource `stats` columns `recyclingPlantSellVal`/`BuyVal` or `guildSellVal`/`BuyVal`.
- The amount per day comes from constants 532/531.
- There is one such building per faction (`Faction.recyclingPlant`).

Vanilla rates: 30 Solari or 30 Plascrete = 1 Scrap; 1 Scrap = 1 Authority or 6.67 Intel. The full notes are in `dsw-hlboot-reverse/references/engine_findings.md`, under "Building windows and special building classes".

Patching gotchas from that build (Quinn splice framework):
- `tools.splice.insert` only stretches *existing* jumps. Compute offsets inside your own inserted block against the final layout.
- `hlboot.py dis <n>` takes the function-**list index**, not the findex. The new functions sit at the end of the list.
- After building, disassemble every hooked function and check each jump target before installing.

## Status of the worked example (keep honest)
As of 2026-11-10, the model, the window hook and the cdb changes are built (hlboot d444056b, pak 201ccf93) but **not yet seen in game**.
When they are tested, update this section and `thorvald-consignment-terminal` in memory with what really happened.
