# Reference: what data.cdb can express (columns, attributes, traits, conditions)

How faction/unit *behaviour* is built in `data.cdb`, what the unpatched game supports, and what
only works with Quinn's Unofficial Patch. Numbers are from the vanilla `mod_files/data_vanilla_2026-10-28.cdb`
(checked 2026-10-31). The full per-id list is generated: [attribute_catalog.md](attribute_catalog.md).
For every attribute and condition it gives a **Thorvald / Ginaz example** and a **vanilla use** (a real row to copy).
The hand-written examples live in [attribute_examples.json](attribute_examples.json); edit them there, then run
`python docs/gen_attribute_catalog.py` (also after every game update).

---

## 1. The one rule

**The game's behaviour lives in code (`hlboot.dat`), not in the cdb.** The cdb can only *use*
attributes and conditions the code already knows by id. Adding a new `attribute` row, a new column,
or a new attribute id does nothing in an unpatched game. Vanilla even marks the end of the table:
`Count` ("Keep last, used by system internally") and `Invalid` are the last two rows.

So a design is buildable data-only **only if it can be written as existing attributes + conditions
on traits.** Check the catalog before designing a bonus.

## 2. How behaviour is wired

```
faction.props.startingTraits  ->  trait  ->  trait.attributes[]  ->  attribute (by ref)
unit.traits / equipment.traits / building states / development / hegemonyBonuses -> trait ...
```

A trait attribute row (`trait@attributes`) has:

| column | meaning |
|---|---|
| `ref` | the attribute id (sheet `attribute`) - the thing the code implements |
| `val` | the number (meaning depends on the suffix, see below) |
| `target` / `target2` | what the `T` placeholders in the id point at: one of `unit, structure, resource, building, treaty, faction, trait, mission, ability, action, domain, raid, hegemony, resAction, information, infiltration, siegeAction, equipment, combo, resolution, development, blackboard, alert, range` (`target2` has no `alert`) |
| `scope` | `Local, Regional, Faction, Militia, Building` (default from the attribute's `props.defaultScope`) |
| `desc` | the tooltip line; `[Id]` makes a link, `[Corrino-adjective]` etc. are substituted |
| `displayed` | show this line in the tooltip |

Real example, `Corrino_HegemonyBonus1`:
```json
{"ref": "Unlock_TAbility", "target": {"ability": "DeployMainBase"}, "desc": "Can use [DeployMainBase] ..."},
{"ref": "Unlock_TTreaty",  "target": {"treaty": "ImperialMandate"}, "desc": "Can offer [ImperialMandate] ..."}
```
Corrino's starting traits: `[{"trait": "Corrino"}, {"trait": "AllFactions_Basics", "displayed": false}]`.

## 3. Sheet columns that matter

| sheet | rows | behaviour-relevant columns |
|---|---|---|
| `attribute` | 1692 | `id, desc, val, stack (Additive/Multiplicative/Max), bonusDir, target, target2, props{defaultScope, forceRead, dependencyProd, allowStackSquashing}, implemented` |
| `trait` | 1562 | `id, name, desc, type (Bonus/Neutral/Malus), displayed, attributes[], props{...}` |
| `trait.props` | - | `rarity, group, duration, stackingLimit, visibility, linkedAbility, resStockConditions[], fx[], alwaysUnique, onlyForFaction, notForFaction, maxTargetTraitStacks, range, agent, domain, tip, hideBlocked, showAsClassTrait` |
| `trait.props.resStockConditions` | - | `res, comparison (Over/Under/Equal...), val, type (BlockingCondition/ApplicationCondition), resCheck (Faction/Object)` - the vanilla way to make a trait conditional on a stock |
| `condition` | 252 | `id, desc, type (State/Tracker), target, target2, vals, props, implemented` - used by quests/objectives/AI |
| `faction` | 17 | `startResources, baseProduction (+ByDifficulty), house, contract, props{startingTraits, hegemonyBonuses, mainBaseMax, infiltrationResource, canPillageSietch, initials, ...}` |
| `unit` | 211 | `traits, stats, attacks, equipment, effects, costs, flags (Military, Elite, Hero, Mercenary, ...), flags2, props, aiWeights` |
| `equipment` | 157 | `traits, props, aiWeights` |
| `building` | 114 | `domain, states (each with attributes), props, aiWeights` |
| `resource` | 77 | `flags (NoStocks, Productible, OvercapAllowed, ...), props, prodGoals, stockGoals` |
| `siegeAction` | 10 | `duration, results, rewards, props` |
| `resAction` | 7 | `issuingFaction, effects, target, flags, effectNature` |

## 4. Reading attribute ids

The id is the spec. Grammar:

- **Prefix = who it applies to:** `Faction_`, `Army_`, `Unit_`, `Entity_` (units and structures),
  `Infantry_`, `Mechanical_`, `MilitaryUnits_`, `Harvester_`, `Outpost_`, `Village_`, `MainBase_`,
  `Building_`, `Agt_` (agents), `Zone_`/`Region_`, `Sietch_`, `UH`/`UHMB` (underworld HQ), `CHOAM_`, `Treaty_`, `Mission_`.
- **`T` = a target slot:** `TRes`, `TUnit`, `TBuilding`, `TTrait`, `TAbility`... is filled by `target`;
  a `2` (`TTrait2`, `TRes2`) is filled by `target2`.
- **Suffix = how `val` combines:** `_Flat` adds a number; `_ARatio` adds a fraction (`0.15` = +15%, stacks by sum);
  `_MRatio` is a **multiplier**, not a delta (`0.8` = -20%, `1.2` = +20%, `0` = none at all). No suffix = an on/off flag.
  Vanilla examples: `TArmyLogistics` has `Army_TResUpkeep_MRatio` 0.85 on Solari (-15%); `NoUpkeep` has 0 on FuelCell.
- **Verb families:** `Block_*` (forbid), `Unlock_*` / `Allow_*` (permit), `*_GainTTrait` / `*_ApplyTTrait`
  (grant a trait to self / to the target), `UI_Hide_*`.

Largest implemented families: Army 176, Entity 166, Unit 146, TRes 105, Outpost 95, Faction 90.

## 5. What vanilla already gives us (no patch)

- **Events through traits.** About 370 attributes are "when X, gain/apply trait": `Entity_OnKill_GainTTrait`,
  `Army_OnRecruit_TUnitSpawnChance`, `Unit_OnDeath_TResGain_Flat`, `Entity_OnExecute_GainTRes`,
  `Army_AtLevel_GainTTrait`, `MilitaryUnit_OnDeathRefund_ARatio`, `Entity_StartCombat_GainTTraitStacks` ...
  Chaining *event -> trait -> attributes* is the vanilla substitute for the patcher's triggers.
- **Economy:** `TRes_Prod_Flat` / `_ARatio` / `_MRatio`, `TRes_Max_Flat`, `TRes_ProdPerSpiceField_Flat`, `CHOAM_SolariRate_*`.
- **Costs and upkeep:** `TUnit_ImportCost_MRatio`, `Mechanical_ImportCost_*`, `Army_TResUpkeep_MRatio`, `TUnit_StockUpkeep_*`.
  **Iron Guard (zero Manpower) is buildable.** Corrino's `C_Hero_2_FactionBuff` already has `TUnit_ImportCost_TRes2_MRatio`
  val 0.8, target `C_Elite`, target2 `Manpower`. A Thorvald trait with val `0`, one row per `Th_*` unit, removes the Manpower cost.
  `MilitaryUnits_TResImportCost_MRatio` val 0 on `Manpower` does it in one row (not yet tested in game). Pay for it with
  `TUnit_ImportCost_Tres2_ARatio` on `Solari` and `Army_TResUpkeep_ARatio` on `Solari`.
- **Gating:** `trait.props.resStockConditions`, `onlyForFaction` / `notForFaction`, `duration`, `stackingLimit`.

**The proven set:** traits use 902 distinct attributes. The most used are `CustomProperty` (277, a
text-only tooltip line with no effect), `Block_TUnitRecruit` 119, `TRes_Prod_Flat` 116,
`Entity_Armor_Flat` 76, `TRes_Prod_MRatio` 66, `TRes_Prod_ARatio` 64 and `TAbility_Block` 51.
Prefer attributes with a non-zero `used` count in the catalog, since vanilla shows they work.

**Avoid:** `implemented = no` - `Unit_MeleeAttacks_Damage_MRatio`, `AdjacentRegionsAllyArmies_GainTTrait`,
`AdjacentRegionsAllyDrones_GainTTrait`, and the condition `Me_HasSeenAllSietch`.
The patcher also says `Allow_RegionAgentSupervision` is unfinished in vanilla.
`CustomProperty` lines describe a mechanic; on their own they do nothing.

## 6. What only works with Quinn's Unofficial Patch

Source: `tool/patcher .zip` (a Python/crashlink app that rewrites `hlboot.dat`; it backs up the
original first). Every row below **needs every player to run the patch**, and the patch must be re-run after each game update.

| feature | new cdb columns / ids |
|---|---|
| Attribute framework | custom attributes (rows **below `Invalid`**) built from trigger/effect/narrowing words: triggers `OnKill, OnDeath, OnBuildingBuilt/Started/Canceled/Demolished, OnDev, OnStartQuest, OnQuestComplete/Fail, OnTreaty(End), OnSiegeAction, OnAssassinate, OnEliminate, OnDestroyFaction, OnWreck, EachDay, EachMonth`; effects `GainRes, LoseRes, GainResProd, ResCap, ResUpkeep, GainHeg, HegProd, GainDev, DevCost, DevSpeed, SpawnUnit, StartQuest, CompleteQuest, FailQuest, QuestCooldown, QuestDuration, GainTTraitStack, RaiseTAlert`; multipliers `PerUnit, PerBuilding, PerVillage, PerRegion, PerZone, PerRes, PerTrait, PerTreaty, PerQuestDone ...`; narrowing `HasDev, HasRes, HasTrait, HasTreaty, FullyBuilt, Borders, MaxLevel ...`. Quests and alerts become valid `target` values. |
| Custom siege actions | `siegeAction.props`: `places, factions, target, lockedByDefault, hideLocked, hideBlocked, noVillageNeeded, cost`; `results.spawnOwned` |
| Tiered resources | `resource.props`: `tiers[{from, name, traits, alert}]`, `showCouncil` |
| Resource trades | `Convert_TRes_To_TRes2` rows with `convertFrom` / `convertTo` lists |
| Permanent res actions | `resAction.props`: `permanent{...}`, `mark{...}`, `placeOn{...}`, `placeAlert` |
| Equipment flags | `equipment.props`: `costToEquip`, `cannotRemove` (replaces `alwaysCosts`) |
| Building host limit | `building.props.hostLimit` + `HostLimit_Flat` rows |
| Conquest flags | plot flag `NoLoseAt100` |
| Trait stacks condition | condition row `Entity_HasTTraitStacks` |
| Faction style files | `UI/Styles/factions/<faction id>.css` read after the game's sheet |
| Fixes | `Allow_RegionAgentSupervision`; `Me_Track_TPillages/LiberatesTTarget/Liberates` count only the quest's own faction; buildings show their own traits |

**Data-only equivalent of faction style files:** `UI/style.css` (and `style_cjk.css`) already
select art by faction-id classes (`.corrino`, `.Corrino`, `.faction-corrino`, 463 Corrino matches).
Ship a copy in our pak with Thorvald selectors added next to Corrino's. It has to be rebased on
the vanilla sheet after each update, the same way as `data.cdb`.

## 7. Checklist for a new Thorvald bonus

1. Write it as "who / when / what". Find the attribute(s) in [attribute_catalog.md](attribute_catalog.md): search the
   example column for the bonus name (e.g. "Iron Guard", "Sovereign Mint", "Kanly"); prefer a high `used` count.
2. Open the row named in **Vanilla use** in the cdb and copy its `target`/`scope`/`desc` shape.
3. Put it on a new `Thorvald_*` trait with `onlyForFaction: Thorvald`, and add the trait to `startingTraits` or `hegemonyBonuses`.
4. If no vanilla attribute fits, the design needs the patch. Mark it as patch-only rather than building it.
5. Keep cdb edits minimal and validate references (see `cdb-minimal-edits`).
6. Once it works, move its example in `attribute_examples.json` from a plan to "built in `<script>`" and regenerate.
