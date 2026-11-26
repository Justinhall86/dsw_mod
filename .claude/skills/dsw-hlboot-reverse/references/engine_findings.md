# D4X engine findings (read from hlboot.dat, game build of 2026-10-28)

Function numbers (`#n`) are positions in *this* build. After a game update, find them again with `name` or `find`, because
the numbers shift. The class and method names stay stable.

## Contents
1. Time and constants
2. Traits: application styles, durations, conditions
3. Effects: where they can fire, and the raid-spawning ones
4. Raids (logic.state.Raids / Raid) and Renegades
5. Siege / occupation actions
6. Abilities and operations (missions)
7. World events (discoveries)
8. Faction daily attributes
9. Hostility and alliances

---

## 1. Time and constants
- `Const.DAY_DURATION = 30` (seconds of game time per day at normal speed). Set in the giant init function `f@43818`.
- `Time.inDays(t) = t / DAY_DURATION`. `state.time` is in seconds.
- `Const.valueCache[i]` / `fValuesCache[i]`: `i` is the **row index of the `constant` sheet** in data.cdb. For example 730 =
  `Raid_Renegades_HegemonyUnlock`. Map indexes with `hlboot.py cdbidx constant <i>`.
- `hasAttribute(obj, N, ...)` / `getAtbApps(obj, N, ...)`: `N` is the **row index of the `attribute` sheet**. Use
  `hlboot.py atb <AttributeId>` to find every place the engine reads it. If nothing shows up, the attribute is dead (for
  example `Unlock_TSiegeAction`, row 12, is never read).

## 2. Traits
`TraitsManager.apply(mgr, trait, source, ?, style, ?, appConditions, blockingConditions)` (#10723).
- `style == null` → `getTraitDefaultStyle`: `ETemporary(props.duration)` if `props.duration > 0`, otherwise permanent.
  **`props.duration` is in seconds** (`Temporary_Trait` 300 = 10 days).
- EApplicationStyle: `EPermanent`, `EStatus`, `ETemporary(t)`, `ECombatStatus`. Global #3644 = EPermanent, #2285 = EStatus.
- **Faction `startingTraits` are applied with EPermanent** (Faction constructor), so `props.duration` does nothing on them.
  If the trait has application conditions, the style becomes EStatus, which turns the trait on and off.
- **`props.resStockConditions` is broken. Do not use it.** `getDefaultApplicationConditions` reads it, and
  `getResBlockConditionFromData` does `SafeCast(raw.comparison)` to `enum<Comparison>`. The cdb stores that column as an
  int and the loader doesn't convert it, so every game start throws "Can't cast i32 to enum<Comparison>" in `initGame`.
  That's why vanilla never uses it. This was confirmed in game on 2026-10-31.
- **General lesson:** a dormant vanilla path (a column no vanilla row fills) may never have run. Check that any enum or
  ref field it reads goes through the `_Data.$..._Impl_` getters, not a raw `Field` plus `SafeCast`. Then test in game
  before relying on it.
- Working timers: a constant compared with a resource that grows (the Renegade unlock is "all players' Hegemony ≥ X", so
  add +1 Hegemony/day to every faction); `props.duration` on traits applied by operations or effects (not starting traits);
  `TRaid_HostileSpawn_DaysFrequency` / `TWorldEvent_MainBaseSpawn_DaysFrequency` stamps.
- `onTraitStart` handles specially only `Region_RevealPOIs`, `Zone_Spawn_TUnit_MissileGen` and probes. Traits **cannot**
  fire effects (`onTraitStartEffects` only syncs FX).

## 3. Effects
`HEffect.fireEffect(effectId, target, target2, vals, subject)` (#6308). It's a big switch, and the `HEffect.hx` line
numbers tell you which branch is which effect.

Engine paths that call it, which are the only hooks for effects:
- objective steps (`fireEffects`): Conquest and battles only. In skirmish, objectives start only from battle data or the
  debug console.
- `ent.BaseBuilding.applyEffects`: building `states.effects`, trigger ConstructionFinished/Destroyed. The subject is the owner faction.
- `Developments.addDevelopment` (ownEffects…); treaties (`DiplomacyManager.startTreaty`); Landsraad resolutions; quests.
- **World-event action rewards** (`WorldEventComponent.implInlineResolve`): subject = the faction that resolved it.
- Abilities, missions and traits: **no**.

Raid-spawning effects:
| Effect | Engine call |
|---|---|
| `Spawn_RenegadeDrop` | `spawnRaid("Renegade_Drop", owner null, getNextRenegadeDropTarget())`, then a new threshold |
| `Spawn_Raid_AutoTarget` | `spawnRaid(raid, null, getPossibleTarget(raid))` |
| `Spawn_Raid_AutoTarget_SubjectOrigin` | same, origin = subject entity |
| `Spawn_TRaid_TargetSubject` | `startGenericRaid(raid, victim = subject faction, owner null)` |
| `Spawn_TRaid_FromTFaction_TargetSubject` | `startGenericRaid(raid, victim = subject faction, owner = player of target2 faction)` |
| `Spawn_TRaid_FromTBlackboard2_TargetSubject` | owner taken from a blackboard |
| `Spawn_TRaid_TargetOriginSubject` | `spawnRaid(raid, null, target = origin = subject entity)` |
| `Spawn_Raid_TargetVillageInZone` | village of zone id `vals[0]` |

## 4. Raids
`Raids.spawnRaid(raids, raidId, owner, target, origin)` (#17340) special-cases these ids: DoomedSietch_Raze_SietchRaid,
FremenRaids, IdualisRaids, Marauders, **Renegade_Drop** (spawn at origin or target; returns null without a target),
**Renegade_Pillagers** (owner null, spawn at origin), TutoM2_HarkonnenPillage. The general path is:
origin = `pickOrigin(raid, target.owner)`; if flag OriginBasedOwner, owner = origin.owner; then `raidTarget`,
`getSpawnPos`, and `Raid.spawn`.
- `startGenericRaid(raid, victim, owner)` needs `pickOrigin` to succeed. That happens only if `raid.props.origin` has a
  `targetBB` (a random blackboard entity) or `territoryEdge` (a random structure of the victim). Otherwise it logs and fails.
- `Raid.spawn` → `HUnit.spawnRaidComposition(kind, owner, pos)` → **`Army.create(unit, raid.owner, x, y)`**: units belong to
  the raid's owner. If the owner is null, the army goes in `state.neutralArmies`.
  - Composition entries can use `unitType`, which resolves to the owner faction's own unit of that base type
    (`getFactionUnitById`). They also honour `condition.minDifficulty`, `condition.probability` and `minGameDays`.
  - Raid flag bit 0 (ShuttleOrigin) creates an `ent.ShuttleSpawn` per army, so the troops fly in.
  - For Renegade_Drop, Renegade_Pillagers (and one more), every player with `Double_Rebellion_Composition` (attr row 1450)
    adds a second composition.
- Raid flags (bits): ShuttleOrigin, CanTargetNeutral, IsLogicRaid, StickyFactionTarget, TargetClosest, OriginBasedOwner,
  StickTarget, AssistOwner. Effect target: Outpost, Harvester, MainBase, NeutralVillage, Sietch, AnyMainBase. Action:
  Liberate, Destroy, Occupy, Pillage, InstallHub, Defend.

**Renegade loop** (`Raids.regularUpdate` #17333). It's skipped entirely if the `PREFS.admin.noRenegades` setting is on or
any player or the state has `Block_RenegadesSpawn` (attr row 53):
1. `renegadesEnabled` turns on once **all** players pass `unlock < Hegemony` (closure #17332 `f@29701`, Raids.hx:812;
   Hegemony = resource row 7). The comparison is **strict**. Games start at 0 Hegemony, so an unlock of 0 waits until
   every player earns some. Use **-1** for drops from the first tick: unlock 0 gave no drop in 24 days of a solo game (2026-10-31).
   The enabling tick doesn't add score.
2. While `renegadeBases < maxRenegadeBases` (`Raid_Renegades_Drop_MaxBasesAtOnce` by map size), the score goes up by
   `ScorePerDay × days`. ScorePerDay is 1 in vanilla, so the score counts days.
3. When score > threshold, the drop target is a random village that `canBeRaidedBy(Renegade_Drop)`: a Village or
   VillageFortified with no outpost, not a sanctuary, at zone distance ≥ 2 from every player base.
   Then `spawnRaid(Renegade_Drop, null, target, null)`, a new threshold from `ScoreThreshold_Bounds` (20-40 days), and score 0.
   With no target, threshold += `NoTarget_ThresholdIncrease` on **every update tick** (not per day), so after one miss the
   drop effectively never comes.
4. **Initial score 0, initial threshold -1** (`$Raids` constructor). In this install it's patched to 2.0 (60 s).
   BUT `set_renegadesEnabled` (#17326) calls `setupNextRenegadeDrop` on the host, which overwrites the threshold with a
   random value in `ScoreThreshold_Bounds` (20-40 days). So in vanilla the first drop comes 20-40 days after enabling, not
   at once. Thorvald patch 31 flips that guard (`JFalse` → `JTrue`, op 5) to keep the 2.0.
5. Pillager raids are tracked per faction (`updateRenegadePillagerRaids`). `TRaid_Block` (row 1414) is checked in
   `Raids.isFactionRaidable`.
- Debug console: `/rgd` (toggle drops), `/rgddrop`, `/rgdraid`, `/forceraid`. There's also a "Debug Raids" HUD with the scores.

## 5. Siege / occupation actions
- `SiegeComponent.getAvailableOccupationActions` (#26057) is **hard-coded**:
  - main base: Raze
  - Village/VillageFortified: Annex, then Pillage (TaxCollection if the village is a sanctuary), Liberate (if it has an
    outpost), MilitaryParade (sanctuary)
  - sietches: PillageSietch
  - `kind == "RenegadeBase"`: Dismantle

  Attribute rows 68/69/70 can hide some of these. `InstallHub` is never offered to players.
- `occupationActionEffects` (#26065) switches on the action id. **Only `InstallHub` uses `results.spawnStructure`**:
  `Structure.create(id, near village, owner null)`, pushes it to `raids.renegadeBases`, and applies `RenegadeControl` to
  the village with `ApplicationCondition#3(base)` (it lasts while the base lives).
- Raids start actions through `Raid.tryForceOccupationAction`, which bypasses the list above.

## 6. Abilities and operations
- A mission (operation) = mission row + `effects.ope` → ability row. Name and description come from the ability.
  `requiredLevels: []` makes it available from the start. `onlyForFactions` gates it.
- `AbilityManager.doUseAbilityOn` (#12486) → `doUseAbility` (#12500, a switch on the **ability id**), then
  `MissionManager.onOperationUsed` if `props.unlockedBy == 1`.
- Ability target = `{struct, zone, unit, faction, ...}`. `HAbility.initDefaultArgs` fills `zone` from `struct.zone` and
  `faction` from the owner.
- `HAbility.getDuration`: if `ability.duration` is null, the traits use their own default style (`props.duration` in seconds).
- Ability ids with special code in doUseAbility: AddCrew, AddOvercharge, ArrakisDiplomacy, Assassination, BlackoutDev,
  CB_FraufrelucheBribe, CB_InciteRebellion, CeaseFire, CellSearch, CommunicationJamming, CrowdManipulation,
  DeployMainBase, DevelopmentInvestment, Disembark(_Drone), EcazChampion, EcazPride, ExtractionNetwork, F_Hero_1_Skill,
  **GhostMarket**, H_Hero_2_Skill, HastenMission, HoldPosition, InfiltrationCells, LaunchNuclearHead, MaraudersRaid
  (only applies `MarauderTrait`; no raid), NukeTargeting, Oppression, PatentDev, PoisonReserves, PoliticBribe,
  PoliticalAudit, (Cancel)ProduceNuclearHead, ResearchTheft, Sanctify, Shuttle, VFrigate_SpaceFolding, WormCalling.
- **GhostMarket**:
  1. Reads `otherEffects.SWorldEvent` (a structure) and calls `WorldEventManager.addWorldEvent(structure, target zone)`.
  2. Sets the structure unlocked, reconned, `creator` and owner to the caster.
  3. Applies the ability's traits with `ApplicationCondition#3(structure)`, so they last while it stands.

  `noUseReasonOn` refuses it if the zone already holds that structure. This is the only data-reachable "operation spawns
  a structure where I click" path. It's used by Thorvald's Renegade Takeover.
- `Operation_OnUsed_SpawnTUnit_Flat` (row 1311), read in `onOperationUsed` *after* the ability's traits are applied:
  recruits `floor(val)` of the unit at the caster's main base, then teleports them into the target zone. Put it in a
  few-second owner trait (apply 1) of one ability, and that operation spawns troops where you click.
- **Ability traits land on the target entity** (2026-11-09, build 26405381). `AbilityManager.doUseAbility` applies every
  `traits[]` entry to `getApplyTarget(ability, args)`: need 0 Zone and 5 -> `args.zone`, 1 Faction -> `args.faction`,
  2/3/4 City/Village/MainBase -> `args.struct`, unit/building/mission otherwise. `apply` (0 All, 1 Owner, 3 TargetFaction...)
  only sets which faction the application counts for. So a MainBase operation's trait is on the building, not the faction:
  faction-read attributes (`TRaid_HostileSpawn_DaysFrequency`, `Faction_*`) never see it. Bridge: put
  `Entity_FactionOwner_GainTTrait` (row 293, `Entity.updateAttributes`) on the building's trait; the owner faction holds the
  target trait while it lasts (vanilla hero passives).
- `MissionManager.onOperationUsed` reads all its `Operation*` attributes (1300-1313) on the caster faction with no
  per-operation filter: `Operation_OnUsed_SpawnTUnit_Flat` on a faction trait fires for every operation.
- `Faction.dailyUpdate`, `TRaid_HostileSpawn_DaysFrequency`: if no structure of the faction `canBeRaidedBy` the raid, the
  function **returns** (the rest of that faction's daily update is skipped that day).
- Raid army choice (`HUnit.spawnRaidComposition` -> `pickWeightIndex`): all weights 0 = uniform random, so weight 0 is fine.
- Game UI art per faction comes from CSS classes made of the faction id (`.portrait.Corrino` -> `UI/menu/Corrino/box_portrait.png`
  on the faction-select card); Quinn's `faction_styles` loads `UI/Styles/factions/<id>.css`. Councillor portraits are cdb
  (`character.images.menuGfx`); a missing file there breaks the new-game screen (CouncilorButton) for that faction.
- `Zone_Spawn_TUnit_MissileGen` creates `ent.MissileGen` (orbital strike) entities, not armies.
- **Ability targeting.**
  - Trait `apply` enum: 0 AllFactions, 1 Owner, 2 Team, 3 TargetFaction, 4 EnemyFactions, 5 DisplayOnly.
  - `apply.need`: 0 Zone, 1 Faction (no vanilla ability uses it), 2 City, 3 Village, 4 MainBase, ...
  - `apply.alignment` flags: 1 Self, 2 Neutral (owner null), 4 Enemy (`isStrictEnemy`, false for an ownerless target), 8 Ally.
  - The target faction comes from `HAbility.initDefaultArgs`: unit owner, else struct owner, else zone owner, **else the caster**.
  - `needTrait` is checked against the target *entity's* traits (`AbilityManager.implUseAbility`).
    `validDiplomaticStatuses` uses `getSelfDiplomaticStatus` with the target's owner.
  - `apply.checkMissionRequirement` is never read.
  - Factions nobody plays still have their HQ (Tuek, Foliage, IxianCore) on the map, as a city owned by a hostile non-player
    faction. It passes Enemy + War/Hostility and carries the same `Main_BaseTrait`, so a MainBase/Enemy operation can target it.
- **Which operations a player sees** (MissionManager.initAllPossibleMissions, then isMissionAllowed):
  - A mission is offered once if none of its `requiredLevels` has category `IFaction` (`HSpying.isAgainstFaction`).
    Otherwise it's offered once per other player, so in a game with no opponents an IFaction mission never exists.
    Skipped: `props.disabled`, and factions in `forbiddenTargets`.
  - `isMissionAllowed` rejects a mission when:
    - it's in group 2 (Deprecated);
    - the owner has `Block_TMission` (attr 65);
    - `onlyForFactions` doesn't include the owner;
    - `Entity.hasUnlocked(owner, TMission)` fails. That requires `Unlock_TUnit_Force`-style attr 2, or that every cdb
      unlock source for the mission is met. No unlock sources means unlocked.
    - the target is an ally, the target's game has ended, or `neededMission` isn't done.
  - The whole spy system is off while the owner has attr 39 (`MissionManager.isLocked`).
  - UI: normal ("basic") missions are listed by `OperationShortcut` (the operations bar, via `getUnlockedMissions`). The
    `MissionsSelector` panel shows only victory / counter-victory missions and those with flag bit 64.
- **Which factions the lobby offers** (`HTools.isFactionPlayable`):
  - the faction must not have `props.noRelease` or `props.locked`, and must be in faction group 0;
  - if the game mode has `props.playableFactions`, the faction must be listed there (and have `availableForAI` to be an AI).
    In vanilla only Conquest has such a list.

  The player picker, the AI picker (`AiFactionChoice`) and the lobby all use `getPlayableFactions`.

## 7. World events
- Action types: 0 PayResources, 1 UnitInvestigation, 2 OrniInvestigation, 3 InvestKnowledge, 4 FieldAgents.
  - Type 0 requires `props.cost` (it throws "Action cost is null" otherwise). It pays the cost and resolves at once.
  - Type 1 needs a unit on site for `props.duration` days.
  - Action filters: `onlyForCreator`, `notForCreator`, `onlyForFactions`, `notForFactions`, `requireZoneOrNeighborOwner`.
- Resolve rewards:
  - `units` → `Structure.recruit` at the event, for the resolver. `factionUnit: true` filters the list to the resolver's faction.
  - `raid: true` → `spawnRaid("Marauders", owner = resolver, origin = event)`.
  - `structure` → `Structure.create(id, x, y, owner = Game.me)`, the **local** player.
  - `effects` → `fireEffectDataDesc(eff, resolver)`.
  - Also `res`, `devGain`, `newAgentProba`, `sietchRevealScore`, `zoneTrait`.
- `addWorldEvent` on a main-base region only logs a warning. Use `spawnProba: 0` for events you spawn yourself.

## 8. Faction daily attributes (ent.Faction.dailyUpdate)
- `TRaid_HostileSpawn_DaysFrequency` (row 1391): `raidTarget(random own structure accepted by the raid, raid, owner null)`
  and `Raid.spawn` at that structure. Stamp = now + val days − 0.5 s. **The first tick spawns at once if val ≈ 0.** A
  timed trait on an enemy faction becomes "drop a raid on them" (Thorvald's Renegade Strike).
- `TWorldEvent_MainBaseSpawn_DaysFrequency` (row 900): `addWorldEvent(structure, zone of a random main-base cell)` every
  val days, first after val days.

## 8b. Faction unit lookup (new factions must follow this)
- `HUnit.getFactionUnitById(type, faction)` (HUnit.hx:74) resolves `faction.props.initials.toUpperCase() + "_" + type`
  in the unit sheet, case-sensitively. If the type has a prefix it strips it ("C_Trooper" → "Trooper").
- It's used by the HUD (`OrniPanel.getOrniKind` → "Ornithopter" at game load), AI `buyUnit`, raid `unitType`, world-event
  `factionUnit` rewards, effects, conditions, `Army.onDeath` and more.
- **A faction whose unit ids don't start with its uppercase initials crashes at load** ("Null access .id" in getOrniKind).
  Thorvald (initials "Th") needed its unit ids renamed to `TH_*` (2026-10-31).
- Check a faction like this: every `C_<type>` (or the parent faction's types) needs a matching `<INITIALS>_<type>`.

## 8c. Row groups (separators) are gameplay data
- `cdb.Index.initLines`: on sheets with `props.hasGroup`, each row gets `group` from its **position**. Rows before the
  first separator are 0, and each titled separator adds 1 (a separator at row 0 also gives 0). Appending a new row at
  the end of a sheet puts it in the **last** group, which is often "Deprecated", "Obsolete" or "Code".
- `MissionManager.isMissionAllowed` returns false for mission group 2 ("Deprecated"), so the operation never shows.
  `HTools.isFactionPlayable` needs faction group 0. Always insert new rows next to a vanilla sibling.
- Other checks in `isMissionAllowed`: `HSpying.isAllowedForFaction` (onlyForFactions), `Entity.hasUnlocked` (Unlock_TMission and similar),
  assassination and CellSearch special cases, not allied with the target, `checkNeededMissions`.

## 8d. Hegemony
- `Faction.getResource(Hegemony = resource row 7)` returns `HegemonyData.getTotal()` (the "TotalProduction" entry), not
  the resource stock. Faction `baseProduction` of Hegemony therefore does nothing to gameplay checks such as the
  Renegade unlock.

## 8e. Testing in the real game
- Console: press **`/`** in game. `/enableCheats` (single-player only; disables achievements until restart) adds the
  debug commands: `/rgddrop` (drop Renegades now, prints the target or "no valid target"), `/rgdraid`, `/rgd`, `/forceraid`…
- There's no command-line game start in release builds (`Const.flags.quickStart = !hasMenu`).
- **Save files hold the truth.** `scripts/save_inspect.py` reads the newest `.sav`. Its HXS state block stores cdb ids as
  strings, so counting `Renegade_Drop`, `ThR_Trooper` or a mission id shows whether that raid, unit or operation existed.
- `scripts/engine_preflight.py` checks a cdb against the rules in this file. Run it before every pak build.

## 8f. HQ districts are prefab nodes named District_<group>_<slot>

`ent.StructureModel.__constructor__` (`ent/StructureModel.hx:68-89`) loops over the structure's `props.districtSlots`
(group g = 1..n) and each group's `nbSlots` (slot k = 1..nbSlots), builds the name `"District_" + g + "_" + k`, and calls
`getObjectByName` on the HQ prefab. Found nodes are collected and shown by `updateDistricts` as slots are built; missing names
are skipped (Corrino's prefab only has District_1_3, 2_2, 3_1). So a custom HQ can grow piece by piece with no cdb change:
put one model per slot in the prefab under those names (FX children under a district node appear with it, as in Prefab_Arrakeen).
Used by `model_projects/thorvald/thorvald_hq` (2026-11-03).

## 9. Hostility
- `Entity.isAlly(a, b)`: true if forced allies (`stateData.forcedAllies`). Raid armies go through `Raid.isAlly`.
  - Neutral raids (owner null) are hostile to every owned entity. Origin-sietch allies are the only exception.
  - So a natural Renegade drop can only be friendly to a player through a code change: give it an owner.
- `HConquest.isAlliedWithRenegades`: `CQ_RenegadeRelations` stock ≥ max stock. No direct callers.

## Unit spawn caps and Council spawns (2026-11-08, build 19145763)
- `unit.props.maxCount` is read in `Structure.implRecruit` / `implInlineRecruit` (and `Faction.getBaseUnitMax`): a recruit of that unit is refused (an `EReason`) once the faction's living units of
  that kind reach `Faction.getUnitMax` (maxCount + `TUnit_Max_Flat`, row 289). Vanilla: `House_Soldier` 5, `Assassin` 1. `props.baseUnit` changes which row is counted.
- `Faction.dailyUpdate` (`Faction_DailySpawn_TUnit_Flat`, row 292) and `LandsraadManager.closeVotes` for `OnCouncilVoteEnd_SpawnMB_TUnit_Flat` (row 290) call `Structure.recruit`, so they obey maxCount.
  `TUnit_OnCouncilVoteEnd_MainBaseSpawn` (609) calls `Structure.spawnUnits` instead; whether that path checks the cap was not read. Council spawns fire at vote END, there is no opening hook for units.
- Unit `flags` bits: Military 1, Mechanical 2, NoVision 4, NoControl 8, NoSelection 16, NotBuyable 32, Flying 64, NoSupply 128 ... (column doc in the unit sheet).
- `Entity_ExecuteImmune` is checked in `Army.hurtBy`. No attribute grants immunity to `Uncontrollable` (control loss).

## CHOAM thresholds and Thorvald engine changes (2026-11-08)
- `ChoamMarket.updateFactionBonuses` gives each faction trait stack 1/0 of the traits in `DataCache.CHOAM_THRESHOLD_TRAITS` (CMarket_Bonus_1, _2) when
  `getFactionSharesRatio` >= the matching value of constant `CMarket_Bonus_Thresholds` (0.1, 0.3). Thresholds are data; the trait list is code.
  `getFactionSharesRatio(Game.inst.state.choamMarket, faction)` = shares / totalShares (0..1).
- `Unit.isNoControl` reads Uncontrollable (row 1369) and Human_InCombat_Uncontrollable (1372, with isMechanical/isActivelyFighting); `Unit.isTaunted` reads 1369.
- Attribute rows are compiled in as numbers = row position in the cdb `attribute` sheet; the first 1692 rows are identical in the 2026-10-22 and 10-28 cdbs.
  Custom attributes go after `Invalid` (Convert_TRes_To_TRes2 is 1692, Entity_ControlLossImmune 1693).
- Raw cdb fields survive to run time: engine code can `DynGet` any key of a row's JSON (Quinn's convertFrom/convertTo; our `spawn` on a convertFrom entry).
- Our changes (tool/thorvald_ticks/thorvald_sworn): closeVotes reads the fraction of `OnCouncilVoteEnd_SpawnMB_TUnit_Flat`'s val as a share threshold;
  after a successful resource_trades trade, a pay entry's `spawn` unit is recruited at the main base; `Entity_ControlLossImmune` short-circuits isNoControl/isTaunted.
  Analysed and built on Steam build 19145763 (Sept 2025); the C: PC has the Oct 2026 build, so rebuild there (anchors are guarded).

## Building windows and special building classes (2026-11-10)
- Only three buildings get their own class and selection window, chosen by **hard-coded id strings**:
  - `ent.Structure.createBuilding` builds `NuclearSilo`, `RecyclingPlant` or `SpacingGuildBranch` for those exact ids. Their `create(struct, uid, x, y)` constructors hard-code the kind string. Every other id becomes a plain `ent.Building`.
  - `ui.GameUI.displayBuilding` opens `NuclearSiloUI`, `RecyclingPlantUI` or `GuildBranchUI` for the same ids, when the owner is you and the status is not 3. Every other building gets `BuildingUI`, which lists the attribute texts only (so a `CustomProperty` description does nothing).
- `RecyclingPlant` and `SpacingGuildBranch` are the same design: a continuous daily trade. `giftRes` is paid each day for a middle currency, and `requestRes` spends that currency each day.
  - The middle currency is hard-coded: `"Scraps"` or `"GuildFavor"`.
  - The rates come from the resource `stats` columns: `recyclingPlantSellVal` and `recyclingPlantBuyVal`, or `guildSellVal` and `guildBuyVal`.
  - The amount per day comes from constants 532 `RecyclingPlant_Exchange_ScrapsPerDay` and 531 `GuildBranch_Exchange_FavorsPerDay`.
  - The window texts come from `Texts.DATA.recycling_plant` and `guild_branch`.
  - The engine keeps one per faction (`Faction.recyclingPlant` and `Faction.guildBranch`).
- Vanilla recycling rates: 30 Solari or 30 Plascrete gives 1 Scrap. 1 Scrap buys 1 Authority or 6.67 Intel.
  Every house except the Fremen blocks `Scraps` with `TRes_Block` in its faction trait (Thorvald does too, copied from Corrino).
- The `<prefab>_Construction.prefab` construction model is optional: `StructureModel.makeBuildingObj` checks `Loader.exists` and falls back to the main prefab.
- Custom building models: a static HMD (one unskinned model, one material) converted with the toolkit's repack, skipping fbxfix. Example: `thorvald_starport/08_scripts/10-13`.

## Operation lifecycle and ability duration (2026-11-10, from the first playtest of operations v2)
- **An ability with no `duration` never ends.** `AbilityManager.activeAbilityIsOver`: an `ActiveAbility` with a duration is over when `launchTime + duration < now`; without one it is over only when its target entity is removed, or its trait conditions fail. While it is "ongoing" the operation cannot be started again and cannot be cancelled. Every vanilla operation has `duration` (3, in **days**: `HAbility.getDuration` ends in `Time.fromDays`). Setting it also makes the ability's traits take that duration instead of their own `props.duration`.
- Mission lifecycle: `startMission` (flags bit 0 = auto-launch) -> `regularUpdate` moves a finished mission to `completeMissions` -> the player uses the ability -> `onOperationUsed` -> `cancelOperation(abilityId, targetedFactions)` removes the matching complete mission. `canStartMission` refuses (reason 5123) while a started or complete mission with the same id and target faction exists.
- **A world-event reward `raid: true` crashes on a custom structure.** `WorldEventComponent.resolve` -> `Raids.spawnRaid` -> `Raid.pickNewTarget` reads `.posx` of `Raid.getLeader()` (null: no army yet) for every raid kind except `Renegade_Drop`, which picks a village from `canRaidStructure` and needs no leader. The event stays at 100% and can be neither resolved nor cancelled (87,558 "Null access .posx" log lines in one game).
- `save_inspect.py` now finds the save folder on the D: PC too.

## Shuttle drops and world-event landers (2026-11-12, second operations playtest)
- `HUnit.spawnRaidComposition` gives each army of a flag-1 raid its own `ent.ShuttleSpawn("Shuttle", army, pos)`. The carrier kind is a hard-coded string. The Thorvald operations kit splices a helper in front of that call: a raw field `thShip` (unit id) on the **raid row** replaces it.
- `ShuttleSpawn` does not fly anywhere: it is created at the drop point (start = end). The descent and lift-off are in the SpaceShuttle clips (`UnitSpawnArriving` 3 s, `UnitSpawnDrop` 1 s, `Leaving` 3 s; `getStateDuration` is hard-coded). `flyHeight` is 0 while arriving, so a carrier model without those clips would just sit on the ground. A drop-ship kind must therefore use the SpaceShuttle rig (rig 9, `props.json` animPaths `/Anim/SpaceShuttle`).
- The SpaceShuttle HMD stores texture paths as length-prefixed strings; an equal-length path can be swapped in place (`thorvald_renegades/08_scripts/50_dropship_assets.py`). Vanilla "png" textures are DDS files.
- A world event spawned by an ability and owned by the caster (`thEvent`) with only a `notForCreator` action cannot be selected, dismantled or destroyed by its owner and never expires. Do not leave one behind as decoration (Strike B, Takeover B, Landfall B were removed for this).
- `Unit.deploy` on `TH_Frigate` logs `Null access .subObjectAnim` (`AnimPlayer.play` from `Army.onConvertKind`): the frigate model row lacks the deploy clip the vanilla frigate has.
- Load time in that test: 243 s from `Game.new` to `Loading done`, of which "Loading models" 64 s and "Loading fx" 93 s. Code patches are not in that path.

## Why raid troops leave their drop ship before it lands (2026-11-13)
- `Raid.spawn` calls `Raid.goToTarget` straight after `spawnRaidComposition`. The march order goes through `MobileEntity.set_movementMode`, which calls `Entity.abortTransports` when `isWaitingForTransit` (carrier status = the initial arriving state). `Carrier.cancelTarget` only acts in that state, so every shuttle raid's troops are released at once and the empty ship lands alone. Drops with no march order (`spawnRaidComposition` called directly, the kit's `thDrop`) keep the 3 s descent.
- Carried units are hidden by `Entity.isTransported` (`inTransit` = carrier's `getCarriedSync`, true while arriving/dropping).
- `ShuttleSpawn.onReachedTarget` = `onDroppingTarget` (units placed, `onTransitDrop` -> `Army.moveTo(drop point)`, `removeTarget`) then state Leaving.
- Carrier progress = (now - stateTime) / getStateDuration, clamped to 0..1, so moving `stateTime` forward delays a ship's descent.
- Fix in `tool/thorvald_ticks/thorvald_sworn/thsw_drops.py`: goToTarget's `hasArmy` check also requires no raid army in transit; after each touchdown the raid marches if none is left aboard; unit raw field `thArrive` (descent seconds) and raid raw field `thStagger` (seconds between ships).

## Council actions and treaties (read 2026-11-16, vanilla hlboot 478027b5; nothing tested in game)

Full report: `model_projects/thorvald/thorvald_council_treaty_tests/README.md`.

- **Council actions are offered from data.** `CouncilResolution.getPlaceableActions` loops over every `resAction` row: not `noPlayer`,
  no missing unlock (`Unlock_TResAction`), target nature/type match the resolution. `issuingFaction` is not checked.
- **Three actions work by id string, not by data:** `isVoteTypeImmune` tests `"LandsraadImmunity"` / `"LandsraadImmunity_Bonus"`,
  `isVoteTypeInverted` tests `"ImperialEdict"`, `CouncilVotes.bountyCashBack` tests `"Bounty"`. A row cloned under a new id loses that behaviour.
  Corruption, InciteRebellion and LandsraadFavorite act through their `effects` rows (trigger switch in `resolutionActionEffects`).
- **Treaties are listed from data.** `HDiplomacy.getCompatibleTreaties` loops over every treaty row and filters by flags, `targetFlags`,
  `needLandsraadAccess`, `notForFactions`, `onlyForFactions`.
- **Treaty trait `apply`:** 0 Both, 1 Sender, 2 Receiver (`DiplomacyManager.startTreaty`). Flag NeverActive (32) ends the treaty at once.
  `stats.duration` is in months. Flag OneWay fires `effects` on the receiver only.
- **Special cases by id:** MilitaryPressure, ImproveRelations, ImperialMandate, HarmlessGadget, ResearchAgreement. The AI proposes treaties
  by id (`logic.ai.Trading.doTrade`), so it will not propose a new one.
- Inference, not confirmed: something with no `Unlock_*` source anywhere counts as unlocked (`HAttributes.getUnlockSources` returns empty).
- **Treaty cancel rules:** no treaty can be broken for `Diplomacy_Treaty_GracePeriod_Days` (10) days after it starts
  (`HDiplomacy.canBreakActiveTreatyDiplomatically`); cancelling costs `Diplomacy_TreatyCancel_InfluenceCost` (50 Influence). Both are global constants.
- **`Faction_DailySpawn_TUnit_Flat`** is read in `Faction.dailyUpdate` and recruits at that faction's main base.
  **`TRes_Tribute_Flat`** has no reader by attribute index (`hlboot.py atb`), so it is probably dead.

## A carrier that throws on spawn makes Renegade drops repeat (2026-11-18)
- `Raids.regularUpdate` calls `spawnRaid("Renegade_Drop")` before `setupNextRenegadeDrop` and resetting `nextRenegadesDropScore`. If the spawn throws, the score stays over the threshold and a drop fires on every update.
- `ModelCache.loadTexture`: if an HMD's texture path is not found, it tries the same filename beside the HMD, then throws. Copied vanilla HMDs need those sibling textures (SpaceShuttle: `Reactor_albedo.png`). Check with `thorvald_renegades/08_scripts/51_check_hmd_textures.py`.
