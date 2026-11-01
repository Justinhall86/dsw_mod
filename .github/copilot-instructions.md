# Dune: Spice Wars (D4X) Mod Workspace

This repo makes custom units and whole factions for **Dune: Spice Wars**. Two playable factions are
cloned into the game: **House Ginaz** (from Atreides) and **House Thorvald** (from Corrino). Units are
kitbashed from vanilla game models in Blender, converted with the HMD toolkit, wired into `data.cdb`,
packed into a pak, and installed into the Steam game.

## How to work with this user

- **Do the work; don't hand over instructions.** Run the Blender, toolkit, cdb and pak steps yourself.
  Give manual steps only as a fallback.
- **Show progress as you go.** Save progress PNGs and GIFs under
  `model_projects/<unit>/02_progress_photos/<stage>/` and open them with `Start-Process` (or send them
  with SendUserFile) as each one is made, not only at the end.
- **Use existing game parts.** Kitbash from vanilla meshes so texel density and style match.
  Hand-modelled primitives are a last resort — hand-built cloth (hoods, aprons) has been rejected as unlike vanilla.
- **Never use Sardaukar parts** as a donor or base. Kitbashes should also *remove* parts
  (backpacks, belts, scarves, capes), not only add them.
- **Never delete the user's files** unless asked. Archive instead. Some removals outside the repo are
  blocked by the harness; report them and leave them to the user.
- Show several variants side by side when a design choice is open, with your favourites and why.
  Judge looks in a game-like matte preview at RTS distance: fine detail and thin copper lines vanish when zoomed out.
- **Install only when asked.** Slot and stat choices are the user's. "Put it in the game" means:
  export, cdb edit, validate, repackage.

## Paths

| What | Where |
|---|---|
| Repo | `C:\Users\justi\Python\dsw_mod` (moved off OneDrive 2026-10-30; if a script misses a path, grep it for `OneDrive`) |
| Working data.cdb | `mod_files/data.cdb`; vanilla references `mod_files/data_vanilla_<date>.cdb`; backups `mod_files/backups/` |
| Editor and res tree | `C:\dsw_mod\D4XEditor` (`res\res\CharMOD\...`, `res\res\VehMOD\...`) |
| Pack and install | `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` |
| Extracted vanilla assets | `C:\dsw_mod\extr` (the `.fbx` files there are HMDs in disguise) |
| Game | `C:\Program Files (x86)\Steam\steamapps\common\D4X` — always this path; its `steamapps` is a junction to a different physical copy than `C:\Users\justi\OneDrive\steamapps` |
| HMD toolkit | `HMD_toolkit/HMD_toolkit` (`Repackager/convert_fbx.py`, `Models/hmd_reader.py`, `Models/fbxfix.py`, patched for bare-root vehicle rigs) |
| Blender | `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe` |
| Vanilla vehicle previews and donor FBX | `model_inputs/Vehicle/<Faction>/<Model>/preview_textures/<Model>_real.fbx` |
| Old paks | `pak_archive/` (never in the game folder) |
| Knowledge base | `modeling.md` (add findings to it) |

## Skills (start here)

- `dsw-new-unit` — the whole kitbash-to-game recipe for a new character unit. Copy its scripts into the
  project's `08_scripts/`. Add lessons to `references/lessons.md` and donor ids to `references/catalog.md`.
- `dsw-part-kitbash` (part-level grafts, elite looks), `dsw-model-workshop` (remove or repaint parts),
  `dsw-unit-upscale` (polish), `dsw-model-modding` (cdb, HMD, pak mechanics; also `cdb_tools.py`,
  `cdb_validate.py`, `check_hmd.py`), `dsw-vehicle-preview` (vehicle turntables and HMD round-trip renders).

## Project layout

Every unit has its own folder `model_projects/<unit>/` with `01_input`, `02_progress_photos/<stage>`,
`03_blender`, `04_textures`, `05_fbx_export`, `06_game_ready`, `07_data_cdb`, `08_scripts`, plus
`SPEC.md` or `HANDOFF.md`. Custom weapons live in `model_projects/weapons/<weapon>/` (`weapon.json`
records the mount and who uses it) and are mounted with `weapons/scripts/mount_weapon.py`.
Index: `weapons/README.md`.

## data.cdb rules

- `mod_files/data.cdb` = the current vanilla plus only the requested edits. A cdb built on old vanilla
  broke game startup after a Steam update (2026-10-22). After a game update, extract the new vanilla
  (`dsw-model-modding/scripts/pak_extract_one.py`) and rebase.
- Every edit script backs up first and has a dry run or `--revert`. Keep
  `07_data_cdb/data_BEFORE_<change>.cdb` in the project.
- Before every pak build:
  `python .claude/skills/dsw-model-modding/scripts/cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb`.
  The target is **0 NEW problems**.
- Prefer changing one model row (mesh path) over touching unit rows: keep the slot's rig, `inherit`
  animation set, scale and audio when the mesh is skinned to that rig.
- After a game test, `game.log` must contain `[DataCache] Modified data.cdb`. If it is missing, the game
  ran vanilla data.
- The game loads every `res*.pak` in the game folder alphabetically, and later ones override earlier
  ones. Only `res.compressed.pak` and `res.compressed1.pak` may be there.
- Never edit the packed `res/res/data.cdb`; it is a build artifact, not the working file.

## CastleDB format

`data.cdb` is plain JSON:
`{ "sheets": [ { "name", "columns": [{ "typeStr", "name" }], "lines": [...] } ], "customTypes": [...], "compress": false }`.
Sub-sheets use `@` notation (`faction@characters`). A column's `typeStr` is a code, optionally followed by
`:` and a comma-separated name list (e.g. `10:Controllable,MainBase,...` is a flag set). **Do not guess a
column's meaning — copy the shape from the Atreides template row** (see `docs/howto_castledb_workflow.md`).

## Factions

- **House Ginaz** (`Ginaz`, ids `G_*`) — design docs in `house_ginaz/` (README is the index); build in
  `model_projects/ginaz_faction/`. Cloned from Atreides, wine colour `0x7A1F3D`. Custom units `G_Elite`
  (Ginaz Captain, confirmed in game), `G_Trooper`, `G_GinazNeophyte`, `G_GinazMaster`. Never put Ginaz
  units on Atreides again. The Landsraad Elite is a **separate** project (`model_projects/landsraad_elite`) —
  keep it out of Ginaz entirely.
- **House Thorvald** (`Thorvald`, ids `Th_*`; `T_` is taken) — design docs in `house_thorvald/`; build in
  `model_projects/thorvald_faction/`. Cloned from Corrino, copper `0xB26E3C`. Look: polished charcoal or
  gunmetal, bold copper trim, oxblood accents; no rust, no bone patches; copper must read at RTS zoom.
  Units built and installed but **none has been seen in game yet**.

## Vehicle kitbash and export

- Builder: `08_scripts/20_build_variant.py -- <spec.json>`. A declarative spec has a host plus
  `host_remove`, `host_squash`, `host_center`, and `grafts` from donors. Graft options: `box_abs`/`cyl_abs`
  cuts, `strict`, `scale`, `rot_deg`, `at`, `mirror`, `remove_abs`, `clamp_abs`.
- Gotchas: HMD FBX files store the bind pose, so bake evaluated coordinates before cutting; use `strict`
  cuts or big triangles make spikes; unwelded panel donors need `min_island_faces: 0`; removing big host
  parts shifts the centre, so pin `host_center`. Nose directions: Renegade +X, Ravager −X, Hawk, Hammer and
  Banshee −Y.
- Export chain: `50_export_fbx.py` → `51_convert_vehicle.py` → **`53_fix_bind.py <hmd> <vanilla ref>`**
  (required — the toolkit writes a wrong `B_Body` bind rotation that pitches or rolls the ship in game)**
  → `52_cdb_edit.py` (`--revert`) → validate → repackage.
- Verify with a round trip: render the converted HMD next to the vanilla ship. Both must sit level, facing
  the same way.

## Reference guides

Read the relevant guide **before** generating CDB JSON or changing unit/faction/asset data.

| Trigger | Read first |
|---|---|
| "generate unit JSON" / "write CDB entry" / "add unit to data.cdb" / "add operation" / "add quest" | `docs/howto_castledb_workflow.md` |
| "how does X look" / "change unit appearance" / "kitbash" / "unit model" / "unit icon" / colour masks | `docs/howto_visual_kitbashing.md` |
| Correct JSON structure unknown / how does vanilla do it | `docs/howto_reverse_engineering.md` |
| Unsure which applies | Check all three |

- Any request involving new CDB JSON → open `docs/howto_castledb_workflow.md` first and confirm the
  Atreides template pattern is followed before writing any JSON.
- Any request where the correct JSON structure is unknown → open `docs/howto_reverse_engineering.md` and
  explain the extraction/compare workflow before writing any speculative JSON.
