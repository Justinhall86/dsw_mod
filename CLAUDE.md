# Dune: Spice Wars (D4X) modding: House Thorvald and House Ginaz

This repo makes custom units and whole factions for Dune: Spice Wars. Two playable factions are cloned into the game:
**House Ginaz** (from Atreides) and **House Thorvald** (from Corrino). Units are kitbashed from vanilla game models in
Blender, converted with the HMD toolkit, wired into `data.cdb`, packed into a pak and installed into the Steam game.

## How to work with this user

- **Do the work; don't hand over instructions.** Run the Blender, toolkit, cdb and pak steps yourself. Give manual steps only as a fallback.
- **Show progress as you go.** Save progress PNGs and GIFs under `model_projects/<unit>/02_progress_photos/<stage>/` and open them with
  `Start-Process` (or send them with SendUserFile) as each one is made, not only at the end.
- **Use existing game parts.** Kitbash from vanilla meshes, so texel density and style match. Hand-modelled primitives are a last resort.
  Hand-built cloth (hoods, aprons) has been rejected as unlike vanilla.
- **Never use Sardaukar parts** as a donor or base. Kitbashes should also *remove* parts (backpacks, belts, scarves, capes), not only add them.
- **Never delete the user's files** unless asked. Archive instead. Some removals outside the repo are blocked by the harness; report them and leave them to the user.
- Show several variants side by side when a design choice is open, with your favourites and why. Judge looks in a game-like matte preview at RTS distance:
  fine detail and thin copper lines vanish when zoomed out.
- **Install only when asked.** Slot and stat choices are the user's. "Put it in the game" means: export, cdb edit, validate, repackage.

## Paths

| What | Where |
|---|---|
| Repo | `C:\Users\justi\Python\dsw_mod` (moved off OneDrive 2026-10-30; if a script misses a path, grep it for `OneDrive`) |
| Working data.cdb | `mod_files/data.cdb`; vanilla references `mod_files/data_vanilla_<date>.cdb`; backups `mod_files/backups/` |
| Editor and res tree | `C:\dsw_mod\D4XEditor` (`res\res\CharMOD\...`, `res\res\VehMOD\...`) |
| Pack and install | `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` |
| Extracted vanilla assets | `C:\dsw_mod\extr` (the `.fbx` files there are HMDs in disguise) |
| Game | `C:\Program Files (x86)\Steam\steamapps\common\D4X`. Always this path: its `steamapps` is a junction to a different physical copy than `C:\Users\justi\OneDrive\steamapps` |
| HMD toolkit | `HMD_toolkit/HMD_toolkit` (`Repackager/convert_fbx.py`, `Models/hmd_reader.py`, `Models/fbxfix.py`, patched for bare-root vehicle rigs) |
| Blender | `C:\Program Files\Blender Foundation\Blender 5.2\blender.exe` |
| Vanilla vehicle previews and donor FBX | `model_inputs/Vehicle/<Faction>/<Model>/preview_textures/<Model>_real.fbx` |
| Old paks | `pak_archive/` (never in the game folder) |
| Knowledge base | `modeling.md` (add findings to it) |

## Skills (start here)

- `dsw-new-unit`: the whole kitbash-to-game recipe for a new character unit. Copy its scripts into the project's `08_scripts/`.
  Add lessons to `references/lessons.md` and donor ids to `references/catalog.md`.
- `dsw-part-kitbash` (part-level grafts, elite looks), `dsw-model-workshop` (remove or repaint parts), `dsw-unit-upscale` (polish),
  `dsw-model-modding` (cdb, HMD, pak mechanics; also `cdb_tools.py`, `cdb_validate.py`, `check_hmd.py`), `dsw-vehicle-preview` (vehicle turntables and HMD round-trip renders),
  `dsw-hlboot-reverse` (read the engine code in `hlboot.dat`: what a cdb attribute or effect really does, engine findings, the hlbc notes in `hlbc/`).

## Project layout

Every unit has its own folder `model_projects/<unit>/` with `01_input`, `02_progress_photos/<stage>`, `03_blender`, `04_textures`,
`05_fbx_export`, `06_game_ready`, `07_data_cdb`, `08_scripts`, plus `SPEC.md` or `HANDOFF.md`. Custom weapons live in `model_projects/weapons/<weapon>/`
(`weapon.json` records the mount and who uses it) and are mounted with `weapons/scripts/mount_weapon.py`. Index: `weapons/README.md`.

## data.cdb rules

- `mod_files/data.cdb` = the current vanilla plus only the requested edits. A cdb built on old vanilla broke game startup after a Steam update (2026-10-22).
  After a game update, extract the new vanilla (`dsw-model-modding/scripts/pak_extract_one.py`) and rebase.
- Every edit script backs up first and has a dry run or `--revert`. Keep `07_data_cdb/data_BEFORE_<change>.cdb` in the project.
- Before every pak build: `python .claude/skills/dsw-model-modding/scripts/cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb`. The target is 0 NEW problems.
  Then `python .claude/skills/dsw-hlboot-reverse/scripts/engine_preflight.py`: 0 FAIL. Insert new cdb rows next to a vanilla sibling, never at the end:
  row position decides the engine's `group` (an appended mission landed in "Deprecated" and was hidden).
- After a test game, `save_inspect.py` (same folder) shows what really spawned. `hlboot.dat` in the game folder is **patched**
  (`thorvald_renegades/08_scripts/30_patch_hlboot_drop_timer.py`, then `31_patch_hlboot_keep_first_threshold.py`; vanilla backup in `pak_archive/`).
  Re-apply both, in order, after a Steam update or file verification.
- Thorvald test mode: `thorvald_faction/08_scripts/60_test_free_army.py` (`--revert` removes it). With it, all Thorvald units are unlocked, free and near-instant.
- Prefer changing one model row (mesh path) over touching unit rows: keep the slot's rig, `inherit` animation set, scale and audio when the mesh is skinned to that rig.
- After a game test, `game.log` must contain `[DataCache] Modified data.cdb`. If it is missing, the game ran vanilla data.
- The game loads every `res*.pak` in the game folder alphabetically, and later ones override earlier ones. Only `res.compressed.pak` and `res.compressed1.pak` may be there.

## House Ginaz (faction `Ginaz`, ids `G_*`)

- Design docs in `house_ginaz/` (README is the index). Faction build: `model_projects/ginaz_faction/` (`SPEC.md`, `16_add_ginaz_faction.py`, `18_fix_ginaz_roster.py`).
  Revert: `ginaz_faction/07_data_cdb/data_BEFORE_ginaz_faction.cdb`.
- Cloned from Atreides (2026-10-25): wine colour 0x7A1F3D, HQ `GinazKeep` "Ginaz Sword-School", region `GinazBase`, territory `PlainsOfGinaz`.
  Leader Lord Severin Ginaz (a placeholder), heroes Cassian Vos (Duncan clone) and Dorian Vale (Gurney clone). Portraits, UI art and bonuses are still Atreides'.
- Custom units: `G_Elite` = Ginaz Captain (squad 5; confirmed working in game), `G_Trooper` (Swordmaster slot; its model row currently points at the Captain prefab),
  `G_GinazNeophyte` (wheel group 1 pos 5, replaced the Ranger), `G_GinazMaster` (group 0 pos 0, unverified). The start company is Ornithopter, Swordmasters and Captains.
  Polished versions (gold hardware, x2 textures) are from `model_projects/ginaz_polish`. Sword: `weapons/ginaz_tallsword`.
- Never put Ginaz units on Atreides again; add them through the Ginaz faction.
- **The Landsraad Elite is a separate project** (`model_projects/landsraad_elite`). Keep it out of Ginaz entirely: data, scripts and docs.

## House Thorvald (faction `Thorvald`, ids `Th_*`; `T_` is taken)

- **Thorvald unit ids are `TH_*` (uppercase)**: models, traits, abilities and combos stay `Th_*`. The engine finds a faction's unit with
  `initials.toUpperCase() + "_" + type`, so `Th_Ornithopter` crashed every Thorvald game at load (fixed 2026-10-31 by
  `thorvald_faction/08_scripts/54_rename_units_TH.py`). Any new faction's unit-id prefix must equal its uppercase initials.
  Older scripts (`53_add_thorvald_faction.py`, project `52_cdb_edit.py` files) still say `Th_` for units: update them before re-running.

- Design docs in `house_thorvald/` (units, lore, heroes, counsellors, art direction). Faction build: `model_projects/thorvald_faction/`
  (`SPEC.md`, `53_add_thorvald_faction.py`). Revert: `thorvald_faction/07_data_cdb/data_BEFORE_thorvald_faction.cdb`.
- Cloned from Corrino (2026-10-29): copper 0xB26E3C, HQ `ThorvaldCitadel`, region `ThorvaldBase`, territory `ReachOfThorvald`, leader Earl Memnon Thorvald.
  Stats, abilities, faction bonuses and UI art are still Corrino's. The design bonuses in `house_thorvald/faction_design.md` are not implemented.
- Look: polished charcoal or gunmetal, bold copper trim, oxblood accents. No rust, no bone patches. Copper must be bold enough to read at RTS zoom.
- Units built and installed. The four infantry models and the frigate also sit on the Atreides-slot rows `A_Trooper`, `A_Soldier`, `A_Demo`, `A_Elite` and `A_Frigate`:

| Unit | Project | Notes |
|---|---|---|
| `Th_Trooper` | `thorvald_trooper` (v13) | Gurney upper body, Duncan legs and sash, Commando head; `weapons/thorvald_katana`. User prefers v11's bulk, not skin-tight |
| `Th_Soldier` Iron Ranger | `thorvald_ranged` (v2) | `weapons/thorvald_sniper` on B_Gun, MilitarySniper anims |
| `Th_Special` Iron Guard | `thorvald_demolition` (v2) | `weapons/thorvald_bazooka`; the attack is still Corrino's flamer |
| `Th_Elite` Heavy Vanguard | `thorvald_elite` (v2; see its SPEC.md) | Hand-built tower shield and glaive; Gurney anim set (no Idle or death clips) |
| `Th_Frigate` | `thorvald_frigate` (v13) | Renegade hull, rig RenegadeFrigate 29; no deploy animations |
| `Th_Ship` fighter | `thorvald_ship` (v6, formerly f11; see its SPEC.md) | Ravager host, Hawk wings and belly, twin chin barrels; Hammer rig 21, scale 1.6 |

None of the Thorvald units has been seen in game yet.

## Vehicle kitbash and export (thorvald_frigate, thorvald_ship)

- Builder: `08_scripts/20_build_variant.py -- <spec.json>`. A declarative spec has a host plus `host_remove`, `host_squash` and `host_center`, and `grafts` from donors.
  Graft options: `box_abs`/`cyl_abs` cuts, `strict`, `scale`, `rot_deg`, `at` (host-centred), `mirror`, `remove_abs`, `clamp_abs`.
- Gotchas:
  - HMD FBX files store the bind pose, so bake evaluated coordinates before cutting.
  - Use `strict` cuts, or big triangles make spikes.
  - Unwelded panel donors need `min_island_faces: 0`.
  - Removing big host parts shifts the centre, so pin `host_center`.
  - Nose directions: Renegade +X, Ravager −X, Hawk, Hammer and Banshee −Y.
- Gap check: `thorvald_ship/08_scripts/47_diag_parts.py` (flat colour per part; true holes show green). Donor surveys: `thorvald_frigate/08_scripts/30_grid_survey.py` and `31_grid_overlay.py`.
- Textures: `40_dump_geo` → `41_make_atlas` (3D-placed copper and oxblood bands; ship env `THV_PAL`, `THV_CU`, `THV_UPONLY`) → `42_apply_atlas`.
- Export: `50_export_fbx.py` (fit the vanilla skin matrix, skin everything to B_Body) → `51_convert_vehicle.py` (toolkit convert, vanilla prefab with the muzzles moved;
  muzzle coordinates are B_Body-local) → **`thorvald_ship/08_scripts/53_fix_bind.py <hmd> <vanilla ref>` (required: the toolkit writes a wrong B_Body bind rotation
  that pitches or rolls the ship in game)** → `52_cdb_edit.py` (`--revert`) → validate → repackage.
- Verify with a round trip: render the converted HMD with the vehicle-preview skill's `build()` next to the vanilla ship. Both must sit level, facing the same way.
