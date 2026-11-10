# Councillor ideas: a Thorvald version of every vanilla councillor

> **IDEAS ONLY.** Nothing here is built, approved or in `data.cdb`. Names, numbers and effects are brainstorm placeholders. The
> official draft is [counsellors.md](counsellors.md); this page is a pool to pick from when its perks are turned into traits.

The idea: every vanilla councillor is really a bonus that pushes a playstyle. So take each one, ask "what is the Thorvald version of
that playstyle?", and write it down. When we build a councillor's trait later, we pick from this list instead of starting blank.

The vanilla effects below were read from `mod_files/data.cdb` on 2026-11-02. Ginaz's four councillors are copies of Atreides'
(Chirox = Thufir, Jool = Yueh, Aya = Jessica, Ran = Paul), so they have no separate row.

## What a Thorvald perk should push

Taken from [faction_design.md](faction_design.md), [operations.md](operations.md) and the Renegade work (`model_projects/thorvald_renegades`).

| Pillar | Meaning |
|---|---|
| **Treasury** | Solari is the weapon: the Consignment Terminal, a high Solari cap, buying speed and wars |
| **Iron Guard** | Soldiers cost Solari instead of Manpower; the army is a payroll |
| **Forge** | Plascrete, asteroid mining, Heighforge, buildings and industry |
| **Sky** | Frigates, fighters, Airfields, Guild contracts |
| **Syndicate** | Operations, agents, infiltration, sabotage, Renegades for hire |
| **Court** | CHOAM, the Landsraad, resolutions, Memnon's anti-Imperial line |
| **Asylum** | Gains from deaths and pillage nearby; forcing truces |

## How to read the tables

- **Thorvald version:** a role title (not a person; we are not inventing canon names) and a short effect.
- **Basis** says how likely the effect is to be buildable:
  - **PROVEN**: a vanilla trait already uses that attribute (the vanilla councillor's own effect counts).
  - **UNTESTED**: the attribute is in the data, but no vanilla trait uses it. It needs a test.
  - **UNKNOWN**: I have not searched for an attribute. It may need a design change.
  The attribute catalog is [../docs/attribute_catalog.md](../docs/attribute_catalog.md).
- **Slot** is the current Thorvald councillor it would suit best: **Nobru** (Court, Treasury), **Ein** (war, Academy), **Silva** (Forge, operations),
  **Haruka** (Syndicate). Ein replaced Overseer Jool in the data on 2026-11-02.

## Atreides

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Thufir Hawat**: +1 starting Agent; can pay Solari to hasten missions and village buildings | **Master of Contracts**: the same "pay Solari to speed it up", cheaper, because money buys time | Treasury | PROVEN (`Unlock_TAbility` for `HastenBuilding`, `HastenMission`) | Silva |
| **Wellington Yueh**: +2 Knowledge per day; non-mechanical units +15% Life, health regen x1.3 | **Foundry Metallurgist**: +Knowledge and extra Armor for plated infantry, no regen bonus (the plate is the point) | Forge | PROVEN for Knowledge and Life; Armor via `Entity_Armor_Flat` UNTESTED here | Ein |
| **Lady Jessica**: can spend Influence to force Peace; Atreides treaties cost no Authority upkeep; breaking a Peace costs 50 Standing | **Supply Chain Arbiter**: force a truce by paying Solari instead of Influence ("the suppliers stop deliveries"); ties to the Supply Chain Holdout operation | Asylum | PROVEN (`Allow_PeaceForce`, `Treaty_BothFaction_NoUpkeep`); paying Solari instead of Influence is UNKNOWN | Nobru |
| **Paul Atreides**: +2 Authority per allied Sietch; reveals the nearest ally Sietch; first Sietch starts at relation 30 | **Heighforge Liaison**: Authority and a good start with allies, built on trade contracts, not Sietches | Court | UNKNOWN (the Sietch parts are Fremen-only) | Nobru |

## Harkonnen

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Slavemaster Cron Vatia**: villages under Oppression build faster; Manpower per empty village slot; +50 Solari per rebel killed | **Bounty Clerk**: +50 Solari for every rebel or raider killed, a faster-building company town. No Oppression, just contracts | Treasury, Forge | PROVEN (`Entity_KillRebelsLoot_TRes_Flat`) | Silva |
| **Umman Kudu**: +2 Manpower per day; units recruit in 70% of the time; +1 Armor in a region with an active operation | **Quartermaster**: Solari instead of Manpower; 70% recruit time; +1 Armor where a Thorvald operation is running (Manpower is pointless for the Iron Guard) | Iron Guard, Syndicate | PROVEN (`Unit_ImportTime_MRatio`, `FactionArmy_InZoneWithOperation_Armor_Flat`) | Ein |
| **Feyd-Rautha**: can use Corruption on a Landsraad resolution (the elected enemy loses Standing) | **Blacklist Notary**: a paid Landsraad action that costs an enemy Standing: the Alloy Embargo as a vote | Court | PROVEN (`Unlock_TResAction`, 9 uses) | Nobru |
| **Piter De Vries**: sacrificing an Agent cuts operation costs 15% and pays 60 Solari per Agent | **Expendable Contractors**: agents are hired hands, so sacrificing one pays Solari and the next operation is cheaper | Syndicate, Treasury | PROVEN (`Agt_SacrificeUsed_DecreaseOperationCost_MRatio`, `Faction_GainTRes_OnAgtSacrifice_PerTRes2`) | Haruka |

## Smugglers

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Staban Tuek**: +1 Underworld HQ slot | **Citadel Foreman**: +1 duplicate of each building limit (the Irulan effect, which Nobru has by clone) | Forge | PROVEN (`Faction_DuplicateEachBuildingLimit_Flat`) | Silva |
| **Lingar Bewt**: +12 Water per day; unlocks Water Network and Water Seller | **Master of Operations**: the manager who runs Heighforge, a massive exotic-metals factory. +Solari per day from alloy sales and unlocks the **Consignment Terminal** building, so the Terminal is a councillor perk rather than a faction bonus | Treasury, Forge | PROVEN (`TRes_Prod_Flat`, `Unlock_TBuilding_Authorize`, 21 uses) | Silva |
| **Lashon Hara (Intelbroker)**: infiltration from trade; infiltration decays 50% slower; 15 Solari and 1 Influence per infiltration level | **Syndicate Broker**: the same engine; a house that sells to everyone earns from every contact | Syndicate, Treasury | PROVEN (`TRes_ProdPerInfiltrationLevels_Flat`, `Infiltration_InFaction_DecreaseSpeed_MRatio`) | Haruka |
| **Stakkanov (Operative)**: villages with no Smuggler neighbour get a bonus; 50% of capture Authority refunded when a village is lost | **Contract Underwriter**: "outpost insurance": a lost village refunds half its Authority | Asylum | PROVEN (`VillageLost_RefundAuthorityCaptureCost_ARatio`) | Silva |

## Fremen

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Shimoom**: +Water per village; villages produce Water on empty slots | **Belt Foreman**: villages yield Plascrete on empty or potential slots (a mining claim on every free plot) | Forge | PROVEN shape (`Outpost_TResProd_PerEmptySlot_Flat` with Plascrete as target is UNTESTED) | Silva |
| **Jamis**: +70 Authority on liberating an enemy village; army outside own territory +10% damage; trade Authority for Manpower | **Expeditionary Marshal**: hired armies hit 10% harder outside Thorvald land; trade Solari for Authority | Iron Guard, Treasury | PROVEN (`Army_OutsideTerritory_GainTTrait`); a Solari-to-Authority trade is UNKNOWN (vanilla only has Authority to Manpower) | Ein |
| **Mother Ramallo**: can use Incite Rebellion on a resolution; +3 Intel and +0.5 Authority per deployed harvester | **Renegade Handler**: "hire the rebels": an Incite action themed as Renegades for hire, plus Intel per deployed Thorvald harvester. Fits the Renegade drops we already have | Syndicate | PROVEN (`Unlock_TResAction`, `TRes_ProdPerTUnit2_Flat`); the Thorvald harvester unit id still needs a look | Haruka |
| **Stilgar**: reveals the nearest Sietches at start; +1 Authority per day | **Belt Surveyor**: reveals Points of Interest at the start of the game and gives +1 Authority per day | Forge | PROVEN (`Unlock_AdvancedPOIs`, 1 use) | Haruka |

## Corrino

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Princess Irulan**: +1 duplicate of each building limit | Already Nobru's by clone; better moved to Silva (see Staban above) and replaced for Nobru | Forge | PROVEN | Silva |
| **Zum Garon**: units +15% Power per faction at Peace; Imperial Mandate costs nothing | **Warden of the Hegemon**: Power rises with Hegemony ("the hammer of wealth"), or free proposals for Trade Agreements instead of the Emperor's Mandate | Court | UNTESTED (`Army_Power_PerHegemony_UpToMax` has 0 vanilla uses); PROVEN for `TTreaty_Cost_MRatio` | Ein |
| **Gaius Mohiam**: votes on Imperial Edict count double; Agenda support counts double | **Vote Broker**: pay Solari to cancel a negative resolution, and votes on resolutions Thorvald cares about count double | Court, Treasury | UNTESTED (`Allow_CancelNegativeResolution`, 0 uses); PROVEN for vote doubling (`TResAction_VoteValue_ARatio`) | Nobru |
| **Hasimir Fenring**: discoveries are investigated quickly everywhere; +4 field agents; each resolved discovery advances agent recruitment | **Survey Chief**: Belt and Arrakis discoveries are resolved quickly; each one advances agent recruitment. Haruka already has this by clone | Syndicate | PROVEN | Haruka |

## Ecaz

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Sanya Ecaz**: a stack of bonuses per Sanctuary on the map | **Foundry Marshal**: a stack of bonuses per Thorvald industrial site (Consignment Terminal, Refinery, mining claim) | Forge | PROVEN shape (`Faction_SetTTraitStacks_PerAnyVillageWithTTrait2`); the Thorvald site trait is UNKNOWN | Silva |
| **Rivvy Dinari**: max-level units pay no Solari upkeep; units spawn one level higher | **Academy Drillmaster**: War Academy graduates join at +1 level, and max-level units pay no Solari upkeep, so veteran Iron Guard become cheap | Iron Guard | PROVEN (`Army_MaxLevel_GainTTrait`, `Army_SpawnExperienceLevel_Flat`) | Ein |
| **Ibbo Vipp**: can use Landsraad Immunity; +2 Standing per Masterpiece built | **Charter Lawyer**: immunity to the resolutions Thorvald wants to ignore, and Standing for each industrial wonder built (offsets the CHOAM penalty) | Court | PROVEN (`Unlock_TResAction` for `LandsraadImmunity`); Standing per Thorvald build is UNKNOWN | Nobru |
| **Mesa Ecaz**: Masterpieces build faster; abandoning a village refunds its capture cost | **Construction Chief**: heavy industry buildings are built twice as fast | Forge | PROVEN (`TBuilding_ConstructionSpeed_ARatio`) | Silva |

## Vernius

| Vanilla councillor and effect | Thorvald version | Pillar | Basis | Slot |
|---|---|---|---|---|
| **Bolig Avati**: several main buildings at once; full refund on removal; +1 Knowledge per district bonus | **Citadel Architect**: build several Citadel buildings at once; removed buildings refund in full | Forge | PROVEN (`Allow_MainBuildingSimultaneousConstruction_SameDistrict_Flat`); whether it works in the Thorvald HQ districts is UNKNOWN | Silva |
| **Bronso Vernius**: villages next to one own region cost 20% less Authority to annex; the furthest neural node gets an Airfield | **Guild Contractor**: cheaper annexing next to Thorvald land, and a bigger Airfield range ("troops move between Airfields") | Sky | PROVEN (`Faction_Outpost_Cost_SingleAdjacentRegion_MRatio`, `Airfield_Range_ARatio`, `Army_Airfield_Range_Flat`) | Ein |
| **Cammar Pilru**: max Influence +5 per Knowledge; +200 Influence on entering War; +30 Standing when an opponent declares War | **War Profiteer**: +Solari on entering War, and Standing when an opponent declares it. A mercenary house earns from every conflict | Treasury, Asylum | PROVEN (`Faction_TResGain_OnWar_Flat`, `Faction_TResGain_OnOpponentWar_Flat`) | Nobru |
| **Tessia Vernius**: spy missions need one fewer infiltration level; idle Knowledge becomes Intel and Solari | **Operations Chief**: Thorvald operations unlock one infiltration level earlier. Makes the house a strong operations faction | Syndicate | PROVEN (`Mission_Infiltration_RequiredLevelReduction_Flat`) | Haruka |

## Suggested picks per slot (ideas, not a decision)

Each current councillor gets two perks in [counsellors.md](counsellors.md). These are alternatives from the pool above, in rough order of
fit and of how safely they can be built.

| Slot | Best ideas from the pool | Why they fit |
|---|---|---|
| **Nobru** (Court, Treasury) | War Profiteer; Vote Broker; Charter Lawyer | Money and votes; offsets the CHOAM penalty |
| **Ein** (war, Academy) | Academy Drillmaster; Quartermaster; Guild Contractor; Expeditionary Marshal | The Academy's lesson that an army is a budget; veteran Iron Guard |
| **Silva** (Forge) | Master of Operations; Master of Contracts; Belt Foreman; Construction Chief | Industry and buildings, cheap and fast |
| **Haruka** (Syndicate) | Syndicate Broker; Expendable Contractors; Operations Chief; Renegade Handler | Makes Thorvald an operations faction; ties into the Renegade ops |

## Cautions

- **Passives only, for now.** Each vanilla councillor row has one `passiveTrait`, and I have not found an active-ability slot, so the
  Active perks in [counsellors.md](counsellors.md) (Sabotage Network, Market Manipulation, Hammer Brief) are unproven.
- **Overlap to avoid.** Several ideas land on the same effect (Staban, Irulan and Bolig all stretch building limits; Fenring and Stilgar both find things). Pick one per effect.
- **Balance.** Stacking War Profiteer, the Master of Operations and the Consignment Terminal is a very strong economy, the same warning as in
  [faction_design.md](faction_design.md).
- **Check before building.** Any UNTESTED or UNKNOWN item needs a test or an attribute search first.
