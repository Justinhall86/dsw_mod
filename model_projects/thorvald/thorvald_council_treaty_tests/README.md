# Council action and treaty feasibility tests (House Thorvald)

Handoff: `house_thorvald/handoff_council_treaty_test.md`. Design context: `house_thorvald/faction_design.md`.

**Status 2026-11-16: INSTALLED pak = A1, A2, Smear, B1, B2, Condottieri (K) and Tribute (TRIB), all in one build. None tested.**
Second handoff: `house_thorvald/handoff_condottieri_treaty_test.md`. The owner accepts several experiments in one build. Each is its own
revertible step (`10_experiments.py`); revert in reverse order: TRIB, K, B2, B1, SMEAR, A2, A1. `hlboot.dat` unchanged.

## Files here

| File | What |
|---|---|
| `README.md` | This report (Step 0) and, later, the experiment table |
| `08_scripts/00_step0_dump.py` | Read-only dump of `resAction`, `treaty`, faction rows (`python 00_step0_dump.py schema\|res\|treaty\|faction`) |
| `01_input/step0_cdb_dump_2026-11-16.txt` | Raw dump used for this report (unlock refs, attribute rows, treaty rows, treaty traits) |
| `08_scripts/05_stage_diff.py` | Read-only: what a rebuild would change besides `data.cdb` |
| `08_scripts/10_experiments.py` | Applies one experiment to `mod_files/data.cdb` (`A1 --dry`, `A1`, `A1 --revert`) |
| `08_scripts/20_build_pak.py` | Builds/installs through `mod_files/stage_and_pack.py` with pinned asset folders (see below) |
| `01_input/staged_2026-11-13/` | Sworn Sword game files as they were in the 13 Nov pak (the pin) |
| `07_data_cdb/data_BEFORE_A1.cdb` | `data.cdb` before A1 (revert point) |

Bytecode evidence was read with `.claude/skills/dsw-hlboot-reverse/scripts/hlboot.py` on the vanilla
`pak_archive/hlboot_vanilla_478027b5d76378ea.dat` (function numbers below are for that file).
The engine findings are also in `.claude/skills/dsw-hlboot-reverse/references/engine_findings.md` ("Council actions and treaties").

## Step 0 report

### 1. Which data.cdb
- Repo used: `D:\dsw_mod` (branch `main`, equal to `origin/main` at `f8d213cd`). `C:\Users\justi\Python\dsw_mod` does not exist on this PC, so the two copies could not be compared.
- Master: `mod_files/data.cdb`, 2026-11-13 07:14, 8.0 MB. Packed by `mod_files/stage_and_pack.py` on this PC (`status.py` says the editor copy is missing here).
- Game: `D:\Steam\steamapps\common\D4X`, Steam build 26405381 (updated 2026-11-09), so it is after v2.2.8 (6 Nov). The version string "2.2.8" is not in `hlboot.dat`, so the version number itself is not confirmed.
- `data_vanilla_2026-11-09.cdb` and `data_vanilla_2026-10-28.cdb` parse to identical data: the update did not change `data.cdb`.
- `resAction` (7 rows) is unchanged from vanilla in the master. `treaty` (15 rows) differs only where the faction clone added Thorvald to `onlyForFactions` / `cantProposeToFaction`.
- Warning: the master has 162 NEW validator problems (150 in the previous commit). Not caused by this work.

### 2. Thorvald's trait hook
Faction row `Thorvald`, `props.startingTraits`: `Thorvald`, `AllFactions_Basics`, `Th_RenegadePact`, `Th_TestFreeArmy` (test mode is ON in the master).
Cleanest hook: a new trait `Th_CouncilTest` inserted next to `Th_TestFreeArmy` (trait rows 46-49) and added to `startingTraits`. No other house is touched.

### 3. The resAction sheet
The seventh row is **`LandsraadImmunity_Bonus`** (Ecaz, 30 Influence as a *reward*, target nature Bonus only).

| id | issuingFaction | Unlocked by (`Unlock_TResAction`) | Cost | Effect |
|---|---|---|---|---|
| Bounty | Smugglers | `Smugglers_HegemonyBonus1` | Solari 1-500 | effect `TRes_Gain` 10 Solari, trigger PerOpponentVoteTargetChoice |
| Corruption | Harkonnen | `FeydPassive` | Intel 1-20 | effect `TRes_Lose` 30 Standing, trigger ElectedFaction |
| InciteRebellion | Fremen | `RamalloPassive`, `ChaniPassive` | Authority 1-50 | effect `Villages_RandomRebellionsRatio` 0.25, trigger EachOtherFaction |
| ImperialEdict | Corrino | `Corrino` (faction trait) | Influence 20, max 3 per Council | **no effects row** |
| LandsraadImmunity | Ecaz | `IbboVipp`, `IlesaPassive` | Standing 30, max 3 per Council | **no effects row** |
| LandsraadImmunity_Bonus | Ecaz | `IbboVipp`, `IlesaPassive` | Influence 30 (isReward) | **no effects row** |
| LandsraadFavorite | Landsraad | none (`noPlayer`) | none | effect `TRes_Gain` 10 Standing, trigger OnWinSupportingFactions |

Columns: `gfx, id, issuingFaction, texts{name, actionTitle, actionDesc, currentTitleOwner, currentDescOwner, currentTitleOpponent, currentDescOpponent, cardEffectDesc}, effects[], target{choice, nature, type, isAllChoices}, props{placeCost, minorHousesOnChoice, issuingChance, ignoreNoChoice, noPlayer, maxPerCouncil, tip}, flags, effectNature`.

### 4. Are Council action ids hard-coded? Yes, partly
- **Offering an action is data-driven.** `CouncilResolution.getPlaceableActions` (#17259, filter #17258) loops over every `resAction` row and keeps it when: not `noPlayer`, the faction has no missing unlocks for it, and its target nature/type match the resolution. `issuingFaction` is not checked there. So a new row should be offered.
- **The behaviour of three actions is keyed on the id string:**
  - `isVoteTypeImmune` (#17228) tests `kind == "LandsraadImmunity"` or `"LandsraadImmunity_Bonus"`. These rows have no effects, so the immunity exists only in code.
  - `isVoteTypeInverted` (#17227) and #17258 test `"ImperialEdict"`.
  - `CouncilVotes.bountyCashBack` (#38131) tests `"Bounty"`.
- Corruption, InciteRebellion and LandsraadFavorite act through their `effects` rows (`resolutionActionEffects` #17263 switches on the trigger); their ids appear only in the AI (`logic.ai.Politics`).
- Inference: a new row with **no** `Unlock_TResAction` anywhere may be open to every faction (`getUnlockSources` #5833 returns an empty list when nothing is registered). Always pair a new row with an unlock.

### 5. Treaty rows
- `apply` is not a guess: the column is an enum **0 = Both, 1 = Sender, 2 = Receiver** (schema), and `DiplomacyManager.startTreaty` (#37776) applies a trait to the sender when apply is 0 or 1 and to the receiver when it is 0 or 2.
- Treaty flags (bit order from the schema): OneWay 1, NonAggression 2, CanForce 4, NoResources 8, Breakable 16, NeverActive 32, Locked 64, NoMultipleTreaties 128, NoRequest 256, OnlySenderPropose 512.
- `stats.duration` is in months (`getTreatyDurationInDays` #6262 multiplies by DAYS_IN_MONTH). 0 and -1 were not traced.

| Treaty | flags | costs | duration | traits (apply) | onlyForFactions | statuses |
|---|---|---|---|---|---|---|
| ImperialMandate | 513 OneWay + OnlySenderPropose | 500 Solari | 2 | `TImperialMandate` (2 Receiver) + effect `TUnit_SpawnMB` 2 `C_Elite_ImperialMandate` | Corrino, Thorvald | Peace |
| TradeAgreement | 16 Breakable | 10 Authority | 0 | `TTradeAgreement` (0), `TreatyUpkeep` (0, Upkeep) | none | Peace, TributeLiege, TributeSubject |
| HarmlessGadget | 513 | 100 Solari | 0 | none; effects `TRes_Lose` 10 Standing, `Agent_Gain_WithTTrait` | Vernius | Peace, TributeLiege, TributeSubject |
| MilitaryPressure | 456 NoResources + Locked + NoMultiple + NoRequest | 100 Influence | 0 | `TMilitaryPressure` (0), `_Sender` (1), `_Receiver` (2); all three have no attributes | none; cannot be proposed to Corrino, Thorvald | none listed |
| TTreaty | 33 OneWay + **NeverActive** | 50 Manpower | -1 | **`TPatronage_Sender` twice (apply 1 and 2)** | TEST | Peace |

Corrections to the handoff and to `faction_design.md`:
- **`TTreaty` does not use `TPatronage_Receiver`.** It lists `TPatronage_Sender` twice. `TPatronage_Receiver` (+20% Life, +20% Power) is used by no row. `TPatronage_Sender` holds only `CustomProperty` text rows (no effect).
- **`TTreaty` has the NeverActive flag.** `startTreaty` ends a NeverActive treaty at once (flag bit 5, then `endTreaty`), so its traits would not stay.
- `TImperialMandate` is applied to the receiver (apply 2), and its attribute is `Entity_OnKill_TResGain_OwnerAndInstigator`.
- Thorvald is already in `ImperialMandate.onlyForFactions`, but only `Corrino_HegemonyBonus1` unlocks it, so Thorvald most likely cannot offer it today *(inference)*.

Who pays `costs`: **not traced** (`getTreatyCosts` #6276 is 1918 ops). Inference from vanilla: the proposer pays (Corrino pays 500 Solari to lend troops). To be read off in the B1 test.

### 6. Treaty ids in the bytecode
Hard-coded, but for special cases, not for listing:
- Listing is data-driven: `HDiplomacy.getCompatibleTreaties` (#6254, filter #6253) loops over every treaty row and filters by flags (Locked, OnlySenderPropose, NoRequest), `targetFlags`, `needLandsraadAccess`, `notForFactions`, `onlyForFactions`.
- Special cases by id: `MilitaryPressure` and `ImproveRelations` (`checkProposeTreaty`, `getTreatyCosts`, `startTreaty`), `ImperialMandate` (`removeTreaty`, conditions), `HarmlessGadget` (`setDiplomaticStatus`), `ResearchAgreement` (`Developments.isDiplomaticallyBoosted`).
- **The AI proposes treaties by id**: `logic.ai.Trading.doTrade` (#37068) names ImperialMandate, MilitaryPressure, TradeAgreement, ResearchAgreement, PoliticalAgreement. A new treaty will not be proposed by the AI. Whether the AI *accepts* one the player proposes was not traced; `tradeValue` and `aiWeights` are the likely inputs *(inference)*.

### 7. Quinn's patcher
- `tool/patcher/DSW - Quinn's Unofficial Patch.exe`, file date 2026-11-06 (the v1.4.0 release day). The version number was not read from the exe. Its source is unpacked in `tool/quinn_patcher/`.
- The game does **not** run Quinn's full patch. It runs our own build `787c92e2aa979d49` (`mod_files/hlboot_build.py`, from vanilla `478027b5d76378ea`): drop-timer patches 30 and 31, plus features `faction_styles`, `resource_trades`, `thorvald_sworn`.
- Quinn's CDB side adds to `resAction` only through the feature `permanent_resactions` (`props`: permanent, removeOnDeath, mark, placeOn, placeAlert). Nothing for the `treaty` sheet; the attribute framework has OnTreaty / OnTreatyEnd triggers. Neither is in our build.
- **Choice: run the experiments on the installed build `787c92e2`, not on pure vanilla.** The master cdb needs `resource_trades` and `thorvald_sworn`; on a vanilla hlboot the Thorvald data would not work. None of our features touch the Landsraad or treaty code (the functions above exist with the same sizes in the installed file), so the result still shows what data alone can do there.

### 8. Text and icon fields
Texts are inline in the cdb rows; there is no separate locale file to edit for these sheets.
- New `resAction` row: `id`, `gfx` (reuse `UI/icons/ResActions_Icons.png`, size 64, x 4, y 1), `issuingFaction`, the `texts` block (the vanilla texts say "[Ecaz-adjective]", so write Thorvald texts), `effects` (may be empty), `target`, `props` (with `tip.cat` "ResAction"), `flags`, `effectNature`.
- New treaty row: `id`, `name`, `desc`, `gfx` (`UI/icons/treatiesSquare.png`, size 80), `images.event` (`UI/icons/eventIcons.png`), `traits`, `effects`, `props` (group, diplomaticStatuses, onlyForFactions, `tip.cat`), `flags`, `costs`, `stats` (one row), optional `aiWeights`.
- New trait rows for treaties: copy the shape of `TWaterGift_Easy` (`props.tip.cat` "DiplomaticGift", `displayed` false, `name`).
- Insert every new row next to its vanilla sibling, not at the end.

### 9. Verdicts

| Experiment | Verdict | Why |
|---|---|---|
| A1 unlock LandsraadImmunity | **Looks doable** | Offering depends only on the unlock; immunity checks the issuer, not the house. Card texts will say "Ecaz" |
| A2 clone as `Th_Walkout` | **Doubtful as written** | The row should load and be offered and charge 30 Standing, but immunity is tied to the two vanilla ids, so it should do nothing. A clone of Corruption or InciteRebellion (effects-driven) is the shape that should work under a new id |
| B1 new treaty `Th_SponsorshipTest` | **Looks doable; AI acceptance unknown** | Listing and trait application are data-driven; `FreeVotes_Resolution_Flat` and `TRes_OnCouncilVoteEnd_Flat` are proven faction attributes. Copying ImperialMandate also copies duration 2 months and the lent-units effect: both need a decision |
| B2 `TTreaty` for Thorvald | **Blocked as written** | Changing only `onlyForFactions` tests nothing: NeverActive ends it at once and it does not reference `TPatronage_Receiver`. It needs two more edits to a vanilla row, or a copied row |
| B3 `TRes_Tribute_Flat` | **Doubtful** | 0 vanilla uses; its text needs a "trade sender", which a treaty trait should supply. Its engine reader was not traced |

## What I could not do
- Compare with the main PC repo (not on this machine).
- Read Quinn's patcher version from the exe.
- Trace who pays treaty `costs`, what durations 0 and -1 mean, and how the AI scores a proposed treaty.
- Confirm that a treaty or Council action with no unlock row is open to all (inference from one small function and the vanilla rows).
- Any in-game check: Step 0 is read only.

## Questions for the owner before Step 1
1. A2: keep it as written (expect "loads, does nothing"), or also clone Corruption as `Th_Smear` to test a new id that should work?
2. B1: drop the lent-units effect from the copy, and which duration (2 months as copied, or -1)?
3. B2: allow the two extra edits (clear NeverActive, point the receiver line at `TPatronage_Receiver`), or do it on a copied row and leave vanilla `TTreaty` alone?
4. Each experiment needs a pak build, an install and a game played to a Council by the owner. Confirm one build per experiment.

## Experiment table

| Experiment | Designed | Built | Tested | Result | Evidence | Notes |
|---|---|---|---|---|---|---|
| A1 unlock LandsraadImmunity | yes | yes, installed 2026-11-16 | no | | trait `Th_CouncilTest` on Thorvald | |
| A2 `Th_Walkout` (copy of LandsraadImmunity) | yes | yes, installed 2026-11-16 | no | | resAction row 6, 30 Standing | Expect: offered, charges, no immunity |
| Smear `Th_Smear` (copy of Corruption; added by Claude) | yes | yes, installed 2026-11-16 | no | | resAction row 7, 1-20 Intel | Expect: elected faction loses 30 Standing |
| B1 `Th_SponsorshipTest` | yes | yes, installed 2026-11-16 | no | | treaty after ImperialMandate; traits `Th_SponsorTest_Sender` / `_Receiver` | Thorvald only, Peace, 50 Solari, duration -1, no lent units, flags 513 |
| B2 `Th_PatronageTest` (copy of `TTreaty`) | yes | yes, installed 2026-11-16 | no | | treaty after TTreaty | NeverActive cleared, receiver gets `TPatronage_Receiver`; 50 Manpower; vanilla `TTreaty` untouched |
| B3 / K2c `Th_TributeTest` (`TRes_Tribute_Flat` 0.2 Solari on the receiver) | yes | yes, installed 2026-11-16 (second install) | no | | treaty after Th_Condottieri; trait `Th_TributeTest_Receiver` | Expect nothing: no engine reader found for this attribute |
| K1 `Th_Condottieri` listed | yes | yes, installed 2026-11-16 (second install) | no | | treaty after Th_SponsorshipTest | Thorvald only, Peace, 100 Solari, flags 529 (OneWay, Breakable, OnlySenderPropose) |
| K2a sender +5 Solari production | yes | same | no | | trait `Th_Condottieri_Sender` (`TRes_Prod_Flat` 5) | Money is created, not moved |
| K2b receiver -5 Solari production | yes | same | no | | trait `Th_Condottieri_Receiver` (`TRes_Prod_Flat` -5) | With K2a this acts as a transfer |
| K3 daily Sworn Sword for the receiver | yes | same | no | | `Faction_DailySpawn_TUnit_Flat` 1 `TH_SwornSword_Spawned` on the receiver trait | Unit row has `maxCount` 5 and `faction` Thorvald; behaviour for another house is unknown and is the crash risk in this build |
| K4 minimum term | yes | same | no | | `stats.duration` 1 | Duration is whole months, so 18 days is not possible; 1 month used |
| K5 fallback (+20% Life and Power) | yes | = B2 (`Th_PatronageTest`), installed | no | | | |

## Build note: the Sworn Sword pin
The repo's Sworn Sword game files (`thorvald_sworn_sword/06_game_ready`, the 2.1 helmet) are newer than the installed pak and were never
installed. `stage_and_pack.py` would have packed them. `20_build_pak.py` pins that folder to the 13 Nov copy, so the A1 pak differs from the
13 Nov pak only in `data.cdb`. Installing the 2.1 Sworn Sword is the owner's call; remove the pin then.

## How to test (one skirmish as Thorvald, at least two AI houses)
The trait list should show "TEST: Council action A1". Afterwards `game.log` must contain `[DataCache] Modified data.cdb`.
- **Council (A1, A2, Smear):** at the first Council, on a resolution that is bad or neutral for its target, look for three actions:
  Landsraad Immunity (30 Standing), Walkout (test) (30 Standing), Smear (test) (Intel). For each: offered? placeable? cost charged? effect?
- **Treaties (B1, B2):** both need Peace with the partner (Thorvald starts at War with everyone, so sign a peace first). In the trade screen
  look for Sponsorship (test) and Patronage (test). For each: listed? listed for Thorvald only? does the AI accept (two houses, a few tries,
  note relations)? who paid? After signing B1: does the partner get 10 free votes at the next Council, does Thorvald get 50 Solari after it?
  After signing B2: do the partner's units show +20% Life and Power? Does either treaty expire?

## Condottieri: Step 0 answers (read only, 2026-11-16)

| Question | Answer | Evidence | Confidence |
|---|---|---|---|
| Which data.cdb | Working: `mod_files/data.cdb`. Installed pak holds the copy from 20:46 (without K and TRIB) | pak shas above | high |
| Treaty rows | 15 vanilla rows; dump in `01_input/step0_cdb_dump_2026-11-16.txt` and section 5 above | cdb | high |
| Duration | `stats.duration` in whole months (int column; multiplied by DAYS_IN_MONTH). 0 and -1 not traced | `getTreatyDurationInDays` #6262 | high for the unit |
| Cost | `costs` rows; who pays is not traced (inference: the proposer) | `getTreatyCosts` #6276 | low |
| Faction restriction | `props.onlyForFactions` (sender), `notForFactions`, `canProposeOnlyToFactions`, `cantProposeToFaction` | filter #6253, `checkProposeTreaty` #6255 | high |
| Cancelling | Flag Breakable allows it. Cost: 50 Influence (constant `Diplomacy_TreatyCancel_InfluenceCost`) | `getTreatyCancelCost` #6278 | medium |
| Minimum term | **Yes, but global:** no treaty can be broken for `Diplomacy_Treaty_GracePeriod_Days` = 10 days after it starts. It is one constant for all treaties (changing it is an edit to a vanilla row). No per-treaty column | `canBreakActiveTreatyDiplomatically` #6280, constant row 301 | high |
| Sender / receiver | `apply` 0 Both, 1 Sender, 2 Receiver | schema + `startTreaty` #37776 | high |
| Daily spawn on a treaty trait | Should work: `Faction.dailyUpdate` (#13053) reads the attribute from the faction and recruits at that faction's main base, so the receiver owns the unit. One vanilla use (`CB_Harkonnen_FactionBonus9`, Assassin) | bytecode | medium (untested through a treaty) |
| Solari production on a treaty trait | Proven shape: `TWaterGift_*` use `TRes_Prod_Flat` -10 / +10 Water on sender / receiver | cdb | high |
| `TRes_Tribute_Flat` | **No reader found** in the bytecode by attribute index (row 844), although the row says `implemented` | `hlboot.py atb TRes_Tribute_Flat` | medium: likely dead |
| AI sees / accepts a new row | Listing is data-driven. The AI proposes by hard-coded id, so it never proposes a new treaty. Acceptance of the player's proposal not traced | #6254, `Trading.doTrade` #37068 | medium |

## How to test the Condottieri build (after it is installed)
Peace with a partner first. Offer Condottieri (test): listed? accepted? Then watch: Thorvald's Solari production +5, the partner's -5;
a Sworn Sword appearing at the partner's main base each day, who controls it, whether it stops at 5; whether Cancel is blocked for the first
10 days; whether the treaty ends after 1 month and the traits go away. Offer Tribute (test) to another house: does any Solari move.

## Restore points
- One step back: `python 08_scripts/10_experiments.py TRIB --revert` (then K, B2, B1, SMEAR, A2, A1), then `py -3.14 08_scripts/20_build_pak.py --install`.
- All the way back: `07_data_cdb/data_BEFORE_A1.cdb` is `data.cdb` before any experiment; the pak before any experiment is
  `pak_archive/20261116_204311_res.compressed1.pak` (the 13 Nov pak). The A1-only pak is `pak_archive/20261116_204642_res.compressed1.pak`.
