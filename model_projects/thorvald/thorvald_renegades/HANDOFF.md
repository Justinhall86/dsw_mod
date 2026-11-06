# Thorvald Renegades: hand-off (written 2026-10-31, evening)

Read this first, then `SPEC.md` (what each piece does) and `.claude/skills/dsw-hlboot-reverse/references/engine_findings.md` (engine facts).
Nothing from this work is committed to git; every change is a working-tree change.

## Goal (the user's words, still in force)
Renegades arrive about 1 minute into a game wearing House Thorvald's soldiers; Thorvald gets operations to call Renegades down,
choose where they land, and install just a Renegade base on a village. Everything is for House Thorvald's benefit.
The user also wants a fast test setup, and has asked for a turret-style drop and several bases on an enemy.
The user allows `hlboot.dat` edits as a last resort (two are applied). Never delete their files, never use Sardaukar parts.

## State of the game install (as of the last launch, 19:17)
| Piece | State |
|---|---|
| Pak `res.compressed1.pak` | Built from the current `mod_files/data.cdb` (0 new problems, 0 preflight fails). Game was left open at the menu. |
| `hlboot.dat` patch 30 | Applied. First drop threshold -1.0 -> 2.0 days (60 s). |
| `hlboot.dat` patch 31 | Applied. `set_renegadesEnabled` no longer re-rolls the threshold to 20-40 days. |
| Test mode | On: `60_test_free_army.py` (units unlocked, free, instant, no upkeep; operations free, ready in ~1 s, +7 slots) and `61_test_fast_start.py` (10,000 Solari/Intel, 500 Authority/Knowledge, 30 start units, three operations cost nothing). |

## What is confirmed working (from saves in the game's `save/` folder)
- **Renegade drop at 1:00-2:00 of a new game**: a drop, a Renegade base, `RenegadeControl` on villages, ThR_* troops in Thorvald models.
  It needs all three of: constant `Raid_Renegades_HegemonyUnlock` = **-1** (`11_renegade_unlock_fix.py`; the engine check is a strict `unlock < Hegemony`, 0 never fires),
  patch 30 and patch 31. Later drops come every 20-40 game days.
- **Renegade Takeover** (ability id `GhostMarket`): a base appears where clicked; `Th_RenegadeBase` and `RenegadeControl` counts rise in the saves.
  (The user said "the renegade strike, where they land" worked. I read that as Takeover; it is worth one confirming question.)
- The three operations appear in the **operations bar** (not the special-missions panel) and can be started and used.
- Ginaz loaded as an AI in an earlier match (log showed `GinazBase`). The user's "Ginaz isn't loaded in the skirmish" is unexplained: ask exactly what they see.

## Open items, in priority order
1. **Iron Landfall spawns nothing visible** (2 Troopers, 1 Iron Ranger, 1 Iron Guard into the clicked region). Unresolved.
   - Engine path: `AbilityManager.doUseAbilityOn` -> `doUseAbility` (applies the ability's traits) -> `MissionManager.onOperationUsed` (#12215), which reads attribute 1311
     (`Operation_OnUsed_SpawnTUnit_Flat`) and calls `Structure.recruit(mainBase, unit, qty, RecruitType #3964, owner, true, true, true, outArmies, ...)`, then teleports the armies to a safe point in the target zone.
   - RecruitType #3964 skips the wheel checks (buyable, unlocks, army/slot limits): they only apply to the default type #2288. So refusal by limits is unlikely.
   - No "unit recruited" event follows the use in the save, but that may just be how this path works (wheel recruits log it).
   - Vanilla only uses attribute 1311 as a **permanent faction bonus** (Conquest traits, no duration), never as a trait the operation applies. My version applies it through the ability for 5 s.
   - **Decisive experiment (do this first):** put the same three `Operation_OnUsed_SpawnTUnit_Flat` entries into a *permanent* Thorvald trait (like `Th_TestFreeArmy`), so any operation spawns them. If units appear, the ability-applied trait isn't read in time; if they don't, `recruit` itself fails here.
     Compare unit entities before and after, not string references: `save_inspect.py` counts id strings, not units.
   - Ask the user first what they saw when they used it.
2. **Renegade Strike needs a real opponent.** In games with only Thorvald, or when the user targets a neutral HQ (Tuek, Foliage, IxianCore), the signal trait lands on a non-player faction and no raid comes (seen twice, with the trait left in the save).
   The data can't tell the two apart (`need` MainBase, alignment Enemy); the tooltip now says to target another player. A **Kanly duel vs Ginaz** is the clean test.
   The raid itself (`Th_RenegadeStrike`, one pillage raid from `Th_RenegadeStrike_Signal` -> `TRaid_HostileSpawn_DaysFrequency` in `Faction.dailyUpdate`) has never been seen to land.
3. **Copies of the base operation / multiple bases on an enemy.** Only the ability id `GhostMarket` spawns a world-event structure, so a second mission row would share that ability.
   Practical route: the operation is free and ~instant now, so place bases one village at a time. The engine refuses a second base in a zone that already has one.
   If the user insists on copies, test two mission rows pointing at `GhostMarket` carefully (`getMissionFromAbility` returns the first match).
4. **Turret drop (the user left it to me).** There is no turret unit or structure in the data. Plan: clone `TH_Soldier` (Iron Ranger, sniper) into an immobile unit (Speed stat at a tiny value, not 0), and add an operation that drops 3 of them into the clicked region.
   It rides on the same path as Iron Landfall, so do it **after** item 1 is solved. Check the unit `stats` format and the Speed resource in `unit` rows before cloning.
5. **Start frigate / fighter.** Deliberately not start units: no vanilla structure starts with a ship, and a bad spawn could crash every game start (not testable from the CLI).
   If the user insists, add one `TH_Frigate` to `ThorvaldCitadel.startUnits` with a revert ready, and watch the first load.
6. **Kanly.** Should work: `gameMode.Kanly` has no `playableFactions` list, so every group-0 faction is allowed. Risk: on a very small map there may be no village at zone distance >= 2 from both bases; then the drop's threshold goes up on every tick and it effectively never comes (`Raids.regularUpdate`). Ask for the map size if a drop is late.

## How the operations work (so you can judge "I couldn't apply it again")
Start the mission (pay, wait `Mission_Duration`, 3 days in vanilla) -> it becomes "ready" -> use the ability once -> it is consumed.
Only 3 operation slots by default (`Operation_NbSlotsBase`), and a ready-but-unused operation holds a slot.
`Operation_ChanceNotConsumed` only gives a chance on the *first* use (`Mission.hasBeenUsed` then blocks it). Free + instant restarts are the real fix, and are in the test trait.

## Scripts (all have a dry run, `--apply` and `--revert`)
| Script | Does | Revert |
|---|---|---|
| `thorvald_renegades/08_scripts/10_renegade_operations.py` | units ThR_*, trait Th_RenegadePact, three operations, Renegade base structure | `--revert` |
| `.../11_renegade_unlock_fix.py` | unlock constant -> -1 | `--revert` (back to 0) |
| `.../12_strike_desc.py` | Strike tooltip | `--revert` |
| `.../30_patch_hlboot_drop_timer.py`, `31_patch_hlboot_keep_first_threshold.py` | the two `hlboot.dat` patches (backups in `pak_archive/`) | `--revert` each |
| `thorvald_faction/08_scripts/60_test_free_army.py`, `61_test_fast_start.py` | test mode, test start | `--revert` each |
| `thorvald_faction/08_scripts/54_rename_units_TH.py` | units `Th_` -> `TH_` (needed for the engine's faction lookup) | BEFORE copy in `07_data_cdb/` |
| `ginaz_faction/08_scripts/19_rename_neophyte_G_Soldier.py` | `G_GinazNeophyte` -> `G_Soldier` | BEFORE copy |

Before any pak build: `cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb` (0 NEW) and `engine_preflight.py` (0 FAIL).
After a Steam update or file verification: re-extract vanilla, rebase the cdb, and re-run patches 30 then 31.

## Practical notes
- Rebuild: `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch` (refuses while `D4X.exe` runs). Launch: `steam://rungameid/1605220`. A match can't be started from the command line.
- Verify a test game: `game.log` has `[DataCache] Modified data.cdb`; autosaves come about every 60 game-seconds and only the newest is kept;
  `python .claude/skills/dsw-hlboot-reverse/scripts/save_inspect.py [save.sav] [extra ids]`.
- Background watchers from the earlier session don't survive; re-arm a `tail -F` on `game.log` and a save-folder poll if you want them.
- Pending, waiting on the user's go-ahead (billed): the 3 evals of the `dsw-hlboot-reverse` skill (6 runs). `hlbc/` is unbuilt Rust source; downloading a prebuilt binary was blocked once, so ask first.
- Memory: `thorvald-renegades-status.md` mirrors this state.
