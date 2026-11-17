# Sworn Swords: implementation spec report (2026-11-08)

# UPDATE 3 (2026-11-12): the Terminal sale source is dropped

The owner reported that the Consignment Terminal's Plascrete trade did not work in a game test and abandoned the whole trading idea. Effects on this report:
- **Stage 3 (sale spawn) is dropped.** The `"spawn": "TH_SwornSword_Spawned"` field on the trade line, the `thsw_sale` engine patch and the Terminal-as-source rows in UPDATE 2 below are dead weight to remove (nothing removed yet).
- **Stage 2 (share rungs), Stage 4 (Oath) and Stage 1 (training) are unaffected.** Do not `--revert` `41_cdb_sworn_engine.py` wholesale: it also holds the Oath and share-rung rows.
- Remaining sources: training, Council-end share rungs, later the frigate's Orbital Drop. A data-only optional source is `Faction_DailySpawn_TUnit_Flat` (one vanilla use); the shared cap of 5 makes it a near-free refill, so gate it behind a Hegemony tier.
- Design context: `house_thorvald/faction_design.md`, "Decision 2026-11-12".

---

# UPDATE 2 (2026-11-08, later): engine patches, Terminal and all spawning

The owner accepted Council-END spawns and engine patches. Result: **the spawn paths are now built; nothing is installed, packed or game-tested.**

| Requirement | Now | How |
|---|---|---|
| Share rung (Stage 2) | **Built** (engine patch) | `Thorvald` faction trait has two `OnCouncilVoteEnd_SpawnMB_TUnit_Flat` lines, val **2.10** and **2.20**: the hlboot tick reads the *fraction* of val as the CHOAM share threshold and the whole part as the count. 2 units at >= 10% of shares, 2 more at >= 20%, recruited at the main base after every Council (vote end). Share ratio = `ChoamMarket.getFactionSharesRatio`, the call vanilla's own conditions use. Whole-number vals (all vanilla uses) are untouched. Stand-in: total shares, not an allocation pool. |
| Sale spawn (Stage 3) | **Built** (engine patch) | On a successful Convert trade, if the line's Plascrete entry carries the raw field `"spawn": "TH_SwornSword_Spawned"`, one unit is recruited at the main base (one per trade, i.e. per 100 Plascrete). The line lives on the Terminal's building trait, so it exists only while a Terminal stands. The shared cap of 5 applies (`maxCount`). **A separate sub-cap of 3 for this source is not implemented.** |
| Oath, control loss (Stage 4) | **Built** (engine patch) | New attribute `Entity_ControlLossImmune` (row 1693, after `Invalid`) on `Th_SwornSword_Trait`; `Unit.isNoControl` and `Unit.isTaunted` return false first for such units. Execution immunity and Formation are as before. |
| Terminal "fully entered" | **Done** | `Th_ConsignmentTerminal` moved from the "Obsolete (keep for saves)" group to sit after `RecyclingPlant` (group Outpost); `TTh_ConsignmentTerminal` moved from "Code" to after `T_MissileBattery` (group Buildings). engine_preflight no longer warns about either. It was already unlocked by the `Thorvald` trait and had its model, costs and `buildingTrait`. |

Files: `08_scripts/41_cdb_sworn_engine.py` (cdb, `--revert` to `07_data_cdb/data_BEFORE_sworn_engine.cdb`), `tool/thorvald_ticks/thorvald_sworn/` (the three engine changes),
`tool/quinn.py` (now also reads `tool/thorvald_ticks/`), `mod_files/hlboot_builds.json` (`Entity_ControlLossImmune` needs `thorvald_sworn`).
Build: `py -3.14 mod_files/hlboot_build.py` (features picked from the cdb: resource_trades + thorvald_sworn). Built here from Steam build 19145763 into
`mod_files/hlboot_build_out/hlboot.dat` (sha 54bb38c6683f363f, registered); the patched functions were read back in the disassembly (share gate, trade hook, immunity).
**Not run:** no VM or game test exists for hlboot code. **Rebuild on the C: PC** (Oct 2026 engine; the anchors are found by name and shape and the build refuses a layout it does not recognise).
To try it: `py -3.14 mod_files/hlboot_build.py --install` (backs the game's file up), repackage on the main PC, start a NEW game, check `game.log` for `[DataCache] Modified data.cdb`.
Things to watch in game: the Terminal shows up in the village build list; Council end gives units only at >= 10% shares; a Convert click makes a Sworn Sword; the cap of 5 holds
(it is read from `maxCount` in `Structure.implInlineRecruit`, which I read but did not run); the Terminal-3 sub-cap is absent; the unit still wears the Trooper placeholder model.

---

Answers to "Sworn Swords Implementation Spec (House Thorvald mod)". Everything below was checked against `mod_files/data.cdb`,
the repo and the game's `hlboot.dat` (Steam build 19145763 on this PC). Nothing was run in the game.

## Where the spec was out of date (and what was done instead)

| Spec said | Reality |
|---|---|
| Nothing for Thorvald in data.cdb, no `mod/thorvald_*.yml` | The `Thorvald` faction, 22+ `TH_*` units, `ThorvaldCitadel`, councillors, heroes and the Consignment Terminal exist in data.cdb (`thorvald_faction/SPEC.md`). So: no faction shell needed, and the slot question is moot. |
| "Patch like the Idualis/Landsraad yml files" | `mod/*.yml` are design notes ("Do NOT generate CDB JSON until finalized"). Real changes are scripts that edit `mod_files/data.cdb`. Followed that: `08_scripts/40_cdb_sworn_sword.py` (dry run, backup, `--revert`, parsed-diff check). |
| `mod/thorvald_localization.yml` for names | Names and descriptions live inline in the cdb row (`unit.texts`). No yml was created. |
| Terminal "designed, not built" | Built in the cdb (`Th_ConsignmentTerminal`, script `thorvald_faction/08_scripts/57_consignment_terminal.py`), untested in game. **Finding:** `engine_preflight` puts the building row in group "Obsolete (keep for saves)" and its trait `TTh_ConsignmentTerminal` in "Code". The CLAUDE.md note says row position decides the group and a hidden group made a mission disappear. The Terminal may not be buildable. Not touched here. |
| Model built, wired to nothing | The model is **S9, a Blender preview build** (`03_blender/SwornSword_S9.blend`). 05_fbx_export and 06_game_ready are empty: no HMD, no DDS, no prefab, not in any pak. It has a kettle helmet, menpo mask, horsehair tail and waist wrap, not a headwrap. The user has not signed it off. `31_clip_check.py` shows the wrap pushing into the body in the animation clips (worst 7.9 cm in FightHitFront). |
| "Iron Guard rule" exists as a faction rule | Not implemented: all `TH_*` infantry still cost Manpower. Only Sworn Swords carry the 0 Manpower cost. |

## Feasibility (step 1 deliverable)

| Requirement | Verdict | Evidence / fallback |
|---|---|---|
| Model pipeline | **Not done** (report only, per spec 5) | Export, HMD, DDS, prefab, pak all missing. Rig is the Trooper's (Male01, built on Trooper v13), clips `Common_AttackMelee01`, FightIdle, HitFront were rendered in `02_progress_photos/20_anim`. The unit's model row points at the Thorvald Trooper prefab as a **placeholder**. This PC also has no editor res tree or vanilla pak, so packing has to happen on the main PC. |
| Faction-exclusive unit | **Feasible, done** | `unit.faction = "Thorvald"` plus a wheel slot. Basic units need no unlock row (`TH_Trooper` has none). Slot: group 0 pos 1 (free; the Atreides Ginaz Captain used the same slot in game). |
| Two cost variants | **Feasible, done** | Two rows sharing one model and name. Vanilla precedent: `House_Soldier` (zero costs, `flags` NotBuyable, `props.maxCount` 5). |
| Shared spawn cap | **Feasible** (engine-verified, cap per unit row) | `props.maxCount` is read by `Structure.implInlineRecruit`, which refuses a recruit when the faction's living units of that row are at the cap. `OnCouncilVoteEnd_SpawnMB_TUnit_Flat` and `Faction_DailySpawn_TUnit_Flat` both go through `Structure.recruit`, so they obey it. The cap is on the spawned row (5). From reading the code, trained Swords should not count toward it (the spawned row has no `baseUnit`), but that was not tested. **A separate cap of 3 for the Terminal source is not possible** with one spawned row. |
| Spawn at Council opening | **Partial** | No unit-spawn hook fires at opening (`TRes_OnCouncilOpening_*` only grant resources). Closest: `OnCouncilVoteEnd_SpawnMB_TUnit_Flat` "Receive N [unit] near your Main Base after every Council" (`LandsraadManager.closeVotes`), i.e. at the end of voting. **No vanilla trait uses this exact attribute** (it is implemented in the engine but unexercised in the cdb); `Counter Measures` uses the Influence variant, `Security Details` the resolution variant. |
| Spawn on resource sold | **Not feasible in data.** | No attribute or event fires on a trade or sale. `Convert_TRes_To_TRes2` exists only through Quinn's `resource_trades` engine patch. Spec fallback (a), a periodic spawn while the Terminal stands, is possible with `Faction_DailySpawn_TUnit_Flat`, but it spawns per day and was not verified to read a building trait. |
| Reading shares or allocation | **Not feasible without an engine patch** | The only share-aware conditions (`Me_HasCHOAMSharesRatio`) are used by Conquest objectives, not by traits. `CMarket_PerShare_GiveTTrait_Stack` turns each 1% into one stack of a trait (used by the CHOAM Manipulation development), but nothing in the cdb tests those stacks against a threshold. Quinn's feature `trait_stacks_condition` adds `Entity_HasTTraitStacks`; whether it can gate a spawn attribute is unchecked. The 10% / 30% vanilla thresholds are not data-driven. Allocation does not exist. |
| Oath: no execution | **Feasible, done** | `Entity_ExecuteImmune` ("Cannot be Executed"; read in `Army.hurtBy`; vanilla users `Hero_Trait`, `TEcazChampion`). |
| Oath: no control loss | **Not feasible** | `Uncontrollable` is the effect applied by `THiddenBackdoor_Effect`. No immunity attribute exists (searched Immun, Resist, Control, Block). Fallback taken (see below). |

## What was implemented

All in `mod_files/data.cdb`, spliced next to `TH_Trooper` / `Th_Trooper` / `Th_Trooper_Buff`. Backup: `07_data_cdb/data_BEFORE_sworn_sword.cdb`;
`python 08_scripts/40_cdb_sworn_sword.py --revert` restores it.

**Stage 1 (train, with model)**
- `TH_SwornSword`: inherits `Trooper` (melee combo, Supply 100, 3 days to train from the template), Health 350, Power 14, Armor 3,
  recruit 60 Solari + 0 Manpower, upkeep 9 Solari + 3 Command Points, wheel group 0 pos 1.
- `TH_SwornSword_Spawned`: same name and model, all costs 0, no CP, flags 33 (Military + NotBuyable), `maxCount` 5, no wheel slot, no AI weight.
- Model row `Th_SwornSword`: a copy of `Th_Trooper` (**placeholder mesh**). Change `mesh[0].path` when the S9 prefab exists.
- Icon and portrait: the Trooper's (placeholder). Card text is real: "Sworn Sword" and a description of the S9 look.

**Stage 4 (Oath)**
- `Th_SwornSword_Trait` "Oath of the Blade" on both rows: `Entity_ExecuteImmune`, plus the **Formation fallback**
  (+1 Armor per ally Sworn Sword at Short Range, max 2, via `Th_SwornSword_Buff`, same pattern as `Th_Trooper_Trait`).
  The spec says Formation replaces Oath when one half is missing; here it is added on top because execution immunity does exist.

**Checks run**: parsed before/after diff shows exactly the intended rows; `cdb_validate` (vanilla 2026-10-28) 149 → 150 "new" problems, the one
being the placeholder model's missing prefab file, which is identical to the existing `Th_Trooper` model's (the CharMOD res tree is not on this PC);
`engine_preflight` 0 fail (10 pre-existing warnings, none for the new rows).
**Not run**: packing, installing, any game test. The acceptance tests for stage 1 and 4 are therefore untested in game.

## Not done, and why (needs the owner)

- **Stage 2 (share rung)** and **Stage 3 (terminal)**: see the table. Nothing was written, because the part that matters (the share threshold,
  the sale trigger) has no data-only form, and a version without it would break the acceptance tests (spawns "once, only above the rung").
- Per-stage git commits: not made. The working tree holds ~160 other uncommitted changes (data.cdb included), so a commit would sweep them in.

## Decisions for the owner

1. Is the Sworn Sword to be exported from **S9** (wrap clips the body up to 8 cm in some clips; helmet, not headwrap), or is a newer build coming? Export needs the main PC.
2. Stage 2: accept an engine patch (Quinn's `trait_stacks_condition` or a small feature of our own) for a share threshold, or ship the
   Council-end spawn **unconditionally** for now (2 per Council, cap 5)?
3. Stage 3: drop it, or use the Terminal-stands daily spawn (needs a test of whether a building trait reaches `Faction_DailySpawn_TUnit_Flat`)?
4. The Terminal row sits in an "Obsolete" group. Re-insert it next to a live building row? (Likely needed for it to be buildable at all.)
5. Starting numbers: 60 Solari with upkeep 9 and 3 CP is cheap against the Trooper (30 Manpower, 6 Solari upkeep, 3 CP) given 350/14/3 beats its 300/13/3, but the Manpower cost is gone. No change was made.
