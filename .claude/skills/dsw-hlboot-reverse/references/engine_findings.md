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

## 9. Hostility
- `Entity.isAlly(a, b)`: true if forced allies (`stateData.forcedAllies`). Raid armies go through `Raid.isAlly`.
  - Neutral raids (owner null) are hostile to every owned entity. Origin-sietch allies are the only exception.
  - So a natural Renegade drop can only be friendly to a player through a code change: give it an owner.
- `HConquest.isAlliedWithRenegades`: `CQ_RenegadeRelations` stock ≥ max stock. No direct callers.
