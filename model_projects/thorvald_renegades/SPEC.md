# Thorvald Renegades

Early Renegade drops in Thorvald colours, plus three Thorvald operations. Data-only (no hlboot.dat edit).
Script: `08_scripts/10_renegade_operations.py` (dry run / `--apply` / `--revert`). Revert copy: `07_data_cdb/data_BEFORE_renegades.cdb`.
Installed 2026-10-31. Not yet confirmed in a game.

## What it does

| Request | Implementation |
|---|---|
| 1. Renegades arrive at 1:00 as Thorvald soldiers | `Raid_Renegades_HegemonyUnlock` 5000 → **-1** (`11_renegade_unlock_fix.py`; 0 did NOT work because the engine check is a strict `unlock < Hegemony` and games start at 0: no drop in 26 days of a solo test), plus the **hlboot.dat patch** `30_patch_hlboot_drop_timer.py`: first drop threshold -1.0 → 2.0 days = 60 s. Two data-only timers failed first: `resStockConditions` (crashed every game start) and Hegemony baseProduction (Hegemony isn't a stock, so nothing happened; confirmed from the save). | Drop, pillager and base militia use `ThR_Trooper/Ranger/Guard/Ship` (Renegade-faction clones that wear the Th_ models). `Th_RenegadePact` (Thorvald only) blocks Renegade pillager raids on Thorvald. |
| 2. Operation that calls the Renegades down | **Renegade Strike** (`Th_MRenegadeStrike` → ability `Th_RenegadeStrike`, target an enemy main base). The enemy gets `Th_RenegadeStrike_Signal` for 35 s; its `TRaid_HostileSpawn_DaysFrequency` drops raid `Th_RenegadeStrike` (shuttles, ThR_ units, pillage) onto one of their structures at the next daily tick. |
| 3. Operation that picks where they land | **Iron Landfall** (`Th_MIronLandfall` → `Th_IronLandfall`, target any region). A 5 s owner trait with `Operation_OnUsed_SpawnTUnit_Flat`: 2 Th_Trooper, 1 Th_Soldier and 1 Th_Special are recruited and teleported into the region. These are player-controlled. |
| 4. Click a village, get just the base | **Renegade Takeover** (`Th_MRenegadeTakeover` → vanilla ability id `GhostMarket`, target a neutral or enemy village). It spawns world event `Th_RenegadeBase` (shuttle model) in that region, owned by Thorvald, and applies `RenegadeControl` to the village while the base stands. Other factions can send a unit to dismantle it (2 days, 500–1200 Solari). |

## Engine facts (read from hlboot.dat with the scratch disassembler; see modeling notes)
- `DAY_DURATION` = 30 s. Drop score starts at 0 with threshold -1, so the first drop fires as soon as renegades are enabled.
- Renegades enable when *all* players reach the hegemony unlock. Any player or the state with `Block_RenegadesSpawn` blocks them.
- The natural drop is spawned with owner null, so those armies are neutral and hostile to every player. Making them Thorvald-owned needs an hlboot patch.
- `spawnRaidComposition` → `Army.create(unit, raid.owner)`. `unitType` entries resolve to the owner faction's unit. Raid flag bit 0 = ShuttleOrigin.
- Siege actions offered to players are hard-coded (`SiegeComponent.getAvailableOccupationActions`). `Unlock_TSiegeAction` is never read. `InstallHub`'s spawnStructure only works for that id.
- Only ability id `GhostMarket` spawns a world event (`otherEffects.SWorldEvent`), owned by the caster, and ties the ability's traits to that structure being alive.
- Starting traits are applied `EPermanent`. `props.duration` (seconds) is ignored on them, but `resStockConditions` (type 1) turn them into status traits.
- World-event rewards: `units` recruit for the resolver at the event, `structure` = Structure.create(owner = local player), `effects` fire with the resolver faction as subject, `raid: true` = hard-coded Marauders raid owned by the resolver.

**Timer fix 2 (2026-10-31):** a Corrino test with unlock -1 still had no drop by day 6. `set_renegadesEnabled`
re-rolls the threshold to 20-40 days when Renegades switch on, overwriting patch 30's 2.0. Patch 31
(`31_patch_hlboot_keep_first_threshold.py`, one opcode byte) skips that re-roll; later drops still use 20-40 days.

## Open / to test
- Renegade Strike targets an enemy faction: in a skirmish with no AI opponents it doesn't exist. Add at least one AI.
- Operations appear in the operations bar (`OperationShortcut`), not in the special-missions panel.
- The 2026-10-31 18:00 solo test: test army trait present (15 refs), 0 Renegade drops up to day 44 (unlock-0 bug).
  **Day 46: first drop CONFIRMED** once Thorvald's Hegemony rose above 0 (auto_17.02.sav: Renegade_Drop, ThR_Trooper/Guard/Ship).
  Day 48: base up, RenegadeControl on a village, 11 ThR_Trooper, 7 ThR_Guard. So the pipeline and the Thorvald-model units work;
  unlock -1 removes the wait.
  Day 80: all three operations present in the state, so they're offered and were used.
  - Renegade Strike was cast on **Tuek** (an unused faction's HQ, neutral city). The signal went to that non-player owner,
    and no raid came. The tooltip now says to target another player (`12_strike_desc.py`).
  - Renegade Takeover: `Th_RenegadeBase` count rose 1 → 3 and RenegadeControl spread from 3 to 9 by day 92, so the bases spawn.
- All three operations have no infiltration requirement (requiredLevels []), so they are available from the start. Costs are Intel + Solari.
- If Renegade Takeover misbehaves (the GhostMarket path is dormant vanilla code), fall back to `need: 0` (region) without RenegadeControl.
- Global side effect: renegades arrive at 1:00 in every skirmish, whatever the factions.
