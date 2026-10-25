# Faction identity traits (vanilla)

Each faction's always-on traits, its two Hegemony milestones, and the traits of its leader and councilors.
Source: `faction` sheet (`startingTraits`, `hegemonyBonuses`, `characters`) + `character` sheet (`passiveTrait`).

## Atreides
**Always-on traits:** `Atreides`, `AllFactions_Basics`

**Starting traits in detail**
- **Atreides** (`Atreides`)
  - Unlock_TAbility = - [target: ability=PeacefullyAnnex]  -- Unlocks the X Ability
  - CustomProperty = 0.1  -- Description of a game mechanic not specific to an ATB
  - Outpost_OwnedByFaction_AnnexCost_ARatio = 0.1  -- X% Authority cost to Annex a Village controlled by $my(faction)
  - TSiegeAction_SelfVillage_Duration_ARatio = 0.1 [target: siegeAction=Liberate]  -- X% X action duration on your villages
  - TRes_Upkeep_MRatio = 0.9 [target: resource=Solari]  -- X% X Upkeep
  - Pillage_NeutralVillage_Block = -1  -- Cannot pillage neutral villages
  - Allow_Landsraad = -  -- You gain 50 CouncilVotes at the Landsraad
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - Faction_AllSietches_Revealed_AdjacentFactionVillages_GainTTrait = - [target: trait=NeighboringRevealedSietch]  -- Villages of a faction adjacent to a Sietch it revealed gain X
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Atreides_HegemonyBonus_1`, `Atreides_HegemonyBonus_2`
- **Hegemony Bonus 5k** (`Atreides_HegemonyBonus_1`)
  - Resolution_Positive_GainTTrait = - [target: trait=Atreides_PositiveResolution]  -- While under the effect of a positive Resolution, gain X
  - Resolution_Negative_GainTTrait = - [target: trait=Atreides_NegativeResolution]  -- While under the effect of a negative Resolution, gain X
- **Hegemony Bonus 10k** (`Atreides_HegemonyBonus_2`)
  - Charters_OnlyStandingCondition = -  -- You can ignore Charters prerequisites except for the necessary Standing
  - Resolution_Positive_GainPermanentTrait = - [target: trait=Atreides_PositiveResolutionPerm]  -- Permanently gain X upon being elected for a positive Resolution (xX max)

**Leaders:** Leto (Duke)
  - Leto is the revered leader of House Atreides. A fair man respected for his wisdom and cunning, he is equally at ease in the Emperor's court as on a battlefield. He is well known for earning the trust and loyalty of his subjects rather than ruling over them by terror.
**Councilors:** Thufir ()
  - Thufir is an elderly Mentat - a human computer - and House Atreides' Master of Assassins. Renowned in the Landsraad for being both outstandingly cunning and honorable, Thufir is also a mentor in the art of war and political instruction.
  - passive trait:
    - **Spymaster** (`ThufirPassive`)
      - Agt_StartingTrait_Flat = 1  -- Agents have X additional trait
      - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
      - Unlock_TAbility = - [target: ability=HastenBuilding]  -- Unlocks the X Ability
      - Unlock_TAbility = - [target: ability=HastenMission]  -- Unlocks the X Ability
**Councilors:** Yueh (Dr.)
  - Yueh is a graduate from the prestigious Suk medical school. While he has not been in service of House Atreides for as long as other close councilors of the Duke, the imperial conditioning that all Suk doctors must undergo ensures his absolute loyalty.
  - passive trait:
    - **Physician Philosopher** (`YuehPassive`)
      - TRes_Prod_Flat = 2 [target: resource=Knowledge]  -- X X
      - CustomProperty = - [target: trait=YuehPassive_Buff]  -- Description of a game mechanic not specific to an ATB
      - Infantry_Life_ARatio = 0.15  -- X% non-mechanical units Life
      - Infantry_HealthRegen_MRatio = 1.3  -- X% non-mechanical unit health regeneration
**Councilors:** Jessica (Lady)
  - The Lady Jessica is Duke Leto's concubine. Although she is a Bene Gesserit, her loyalty always goes to house Atreides before the Sisterhood.
  - passive trait:
    - **The Voice** (`JessicaPassive`)
      - Allow_PeaceForce = -  -- Can impose ImproveRelations upon other factions at the cost of Influence
      - Treaty_BothFaction_NoUpkeep = -  -- You and other factions lose no Authority from Treatys
      - Treaty_EnemyBreak_TResLoss_Flat = -50 [target: resource=Standing]  -- Other factions lose X more X when breaking a Treaty with you
**Councilors:** Paul (Young)
  - Paul is the heir to House Atreides. Benefiting from both a Bene Gesserit education from his mother and martial, tactical and political training from his father's most trusted men, Paul is a fearless and brilliant young man, promised to a heroic future as Leto's successor.
  - passive trait:
    - **Lisan Al-Gaib** (`PaulPassive`)
      - TRes_SietchProd_Flat = 2 [target: resource=Authority]  -- X X per ally Sietch
      - OnAlly_Sietch_RevealNearestSietch = -  -- Allying a Sietch reveals another Sietch
      - OnReveal_FirstSietch_SetRelation = 30  -- First sietch reveal start with X relation
**Speaker:** Thufir ()
  - Thufir is an elderly Mentat - a human computer - and House Atreides' Master of Assassins. Renowned in the Landsraad for being both outstandingly cunning and honorable, Thufir is also a mentor in the art of war and political instruction.
  - passive trait:
    - **Spymaster** (`ThufirPassive`)
      - Agt_StartingTrait_Flat = 1  -- Agents have X additional trait
      - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
      - Unlock_TAbility = - [target: ability=HastenBuilding]  -- Unlocks the X Ability
      - Unlock_TAbility = - [target: ability=HastenMission]  -- Unlocks the X Ability

## Harkonnen
**Always-on traits:** `Harkonnen`, `AllFactions_Basics`

**Starting traits in detail**
- **Harkonnen** (`Harkonnen`)
  - Unlock_TAbility = - [target: ability=Oppression]  -- Unlocks the X Ability
  - Unlock_AgentSacrifice = -  -- Can sacrifice an agent to reduce a mission's cost and preparation time
  - Outpost_PostProdPerMilitia_ARatio = 0.05  -- X% Village resource production per active militia
  - Outpost_PostProd_ARatio = -0.1  -- X% Village resource production
  - Allow_Landsraad = -  -- You gain 50 CouncilVotes at the Landsraad
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - IgnoreCorruptionEffects = -  -- Ignore Corruption negative effects
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Harkonnen_HegemonyBonus_1`, `Harkonnen_HegemonyBonus_2`
- **Hegemony Bonus 5k** (`Harkonnen_HegemonyBonus_1`)
  - Pillage_TResPostGain_Flat = 50 [target: resource=Intel]  -- Gain X X by pillaging a Village
  - Faction_OnInfantryKill_OtherFactionUnit_SpawnTTraitAgent = 20 [target: trait=Brainwashed]  -- Each X enemy non-mechanical unit killed, receive an Agent with X trait
- **Hegemony Bonus 10k** (`Harkonnen_HegemonyBonus_2`)
  - Operation_SacrificeUsed_ChanceNotConsumed = -  -- Give a chance to not consume an operation on which sacrifice has been used when launching it
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=IField]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=ISpaceGuild]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=IChoam]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=ILandsraad]  -- X Agent slot in X

**Leaders:** Vladimir (Baron)
  - The Baron is the leader of House Harkonnen. A disgustingly grotesque man whose complete lack of morality allied to a keen intellect make him a formidable opponent. He is Leto's main rival and has vowed to take down House Atreides and take back Arrakis.
**Councilors:** Slavemaster ()
  - Cron is the favored slavemaster of the baron, a precarious but profitable position. He provides the court with a large array of services, ranging from sexual entertainment to docile workforce.
  - passive trait:
    - **Slave Trade** (`SlavemasterPassive`)
      - Object_TTrait_FromInitReplaceWith_TTrait2 = - [target: trait=TOppression]  -- Replaces X by X
      - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB
      - Outpost_OnTAbilityStart_TRes2Gain_PerEmptySlot_Flat = 2 [target: ability=Oppression]  -- When starting X, gain X X for each empty Building_Village slots
      - Entity_KillRebelsLoot_TRes_Flat = 50 [target: resource=Solari]  -- Gain X X upon killing Rebels
**Councilors:** Umman ()
  - Umman is the Captain of the House Harkonnen guard. His many years of duty have turned him into a violent, unsubtle man. Rumors say not even his personal life has been spared.
  - passive trait:
    - **Heavy Hand** (`UmmanPassive`)
      - TRes_Prod_Flat = 2 [target: resource=Manpower]  -- X X
      - Unit_ImportTime_MRatio = 0.7  -- X% units recruitment time
      - FactionArmy_InZoneWithOperation_Armor_Flat = 1  -- While any operation is active in the region units gain X armor
**Councilors:** Feyd ()
  - Glossu's younger brother and the Baron's favored nephew, Feyd-Rautha has all it takes to uphold his family's sadistic culture. An unmatched duelist and charismatic leader, he is the chosen na-Baron of House Harkonnen, destined to take over his uncle's legacy.
  - passive trait:
    - **Na-Baron** (`FeydPassive`)
      - Unlock_TResAction = - [target: resAction=Corruption]  -- Allows using X on Landsraad resolutions
      - Faction_WhileOneOutpostTTraitActive_GainTTrait2 = - [target: trait=TOppression]  -- While at least one Village is under X: X
**Councilors:** Piter ()
  - Piter is a twisted Mentat; that is a human computer, but bred on planet Tleilax with much less ethical constraints in mind than their regular counterparts.
  - passive trait:
    - **Shadow Engines** (`PiterPassive`)
      - Agt_SacrificeUsed_DecreaseOperationCost_MRatio = 0.85  -- Each sacrificed Agent permanently reduces their mission costs by X%
      - Faction_GainTRes_OnAgtSacrifice_PerTRes2 = 60 [target: resource=Solari]  -- Sacrificing an Agent gives X X per X
**Speaker:** Piter ()
  - Piter is a twisted Mentat; that is a human computer, but bred on planet Tleilax with much less ethical constraints in mind than their regular counterparts.
  - passive trait:
    - **Shadow Engines** (`PiterPassive`)
      - Agt_SacrificeUsed_DecreaseOperationCost_MRatio = 0.85  -- Each sacrificed Agent permanently reduces their mission costs by X%
      - Faction_GainTRes_OnAgtSacrifice_PerTRes2 = 60 [target: resource=Solari]  -- Sacrificing an Agent gives X X per X

## Smugglers
**Always-on traits:** `Smugglers`, `AllFactions_Basics`

**Starting traits in detail**
- **Smugglers** (`Smugglers`)
  - Unlock_TAbility = - [target: ability=InstallUWHeadquarter]  -- Unlocks the X Ability
  - UH_GainTTrait = - [target: trait=T_UH_Hegemony]  -- 
  - Entity_MoveSpeed_OutsideCombat_ARatio = 0.1  -- Units X% Speed outside combat
  - Outpost_DistanceCost_MRatio = 0  -- Distance based Authority costs to Annex a Village are reduced by X%
  - Faction_Outpost_NumberBaseCost_MRatio = 1.5  -- Owned Villages Authority penalty to Annex a Village is reduced by X%
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Smugglers_HegemonyBonus1`, `Smugglers_HegemonyBonus2`
- **Hegemony Bonus 5k** (`Smugglers_HegemonyBonus1`)
  - Unlock_TResAction = - [target: resAction=Bounty]  -- Allows using X on Landsraad resolutions
  - Allow_Landsraad = 50  -- You gain 50 CouncilVotes at the Landsraad
  - TRes_Prod_Flat = 50 [target: resource=CouncilVote]  -- X X
- **Hegemony Bonus 10k** (`Smugglers_HegemonyBonus2`)
  - AllEnemyMainBases_Add_MBUWHeadquarters = -  -- Build a MBUWHeadquarters in every enemy Main Base
  - Unlock_TInformation = - [target: information=MainBaseDistricts]  -- Unlocks X information
  - Pillage_Gain_ARatio = 0.5  -- X% resources from pillaging Villages and Sietchs

**Leaders:** Esmar ()
  - A sly spice smuggler used to keeping himself and his operations low key, Esmar Tuek has secret arrangements with both the Fremen and the Imperium. He also works in the shadows to undermine the Harkonnen's lingering grip on Arrakis.
**Councilors:** Staban ()
  - Staban is Esmar Tuek's son and, just like his father, a renowned smuggler of various goods on Arrakis, most notably Spice Melange. Like many of his people, he thrives in a harsh environment while routinely defying the highest authorities. He is a proud man who doesn't abide by anybody's rules but his own.
  - passive trait:
    - **Heir of the Underworld** (`StabbanPassive`)
      - UH_ExtensionSlot_Flat = 1  -- X Building_UWHQ slot in UWHeadquarters
**Councilors:** Lingar ()
  - Lingar's business revolves around a single commodity, but one which is so rare on Arrakis, only Spice tops it in importance: water. While his extraction operations are not technically illegal, they are, by nature, risky enough that Lingar had to forge an alliance with smugglers, and most notably Esmar Tuek.
  - passive trait:
    - **Water Merchant** (`LingarPassive`)
      - TRes_Prod_Flat = 12 [target: resource=Water]  -- X X
      - Unlock_TBuilding_Authorize = - [target: building=WaterNetwork]  -- Allows for the construction of X
      - Unlock_TBuilding_Authorize = - [target: building=WaterSeller]  -- Allows for the construction of X
**Councilors:** Intelbroker ()
  - Lashon Hara is a purveyor of information, whose job is to know everything, and sell it for the right price. Esmar has taken her under his protection after she got in trouble with the Harkonnens.
  - passive trait:
    - **Information Market** (`IntelBrokerPassive`)
      - Trade_GainInfiltrationLevelInFaction_Flat = 0.1  -- When trading with a faction, gain X Infiltration level with this faction
      - Infiltration_InFaction_DecreaseSpeed_MRatio = 0.5  -- X% Infiltration level in faction decrease speed
      - TRes_ProdPerInfiltrationLevels_Flat = 15 [target: resource=Solari]  -- X X per Infiltration level
      - TRes_ProdPerInfiltrationLevels_Flat = 1 [target: resource=Influence]  -- X X per Infiltration level
      - CustomProperty = - [target: trait=IntelBrokerPassive_Fake]  -- Description of a game mechanic not specific to an ATB
**Councilors:** Operative ()
  - Stakkanov started in Tuek's operation as an independent contractor. She rapidly became a reliable master of operation, making unexpected profits of the most dangerous and unpredictable jobs.
  - passive trait:
    - **Master of Operations** (`OperativePassive`)
      - Village_NotAdjacentToSelfRegion_GainTTrait = - [target: trait=OperativePassive_Bonus]  -- Every Village that are not adjacent to a owned Region gain: X
      - VillageLost_RefundAuthorityCaptureCost_ARatio = 0.5  -- When a Village is lost, refunds X% of the Authority capture cost
**Speaker:** Staban ()
  - Staban is Esmar Tuek's son and, just like his father, a renowned smuggler of various goods on Arrakis, most notably Spice Melange. Like many of his people, he thrives in a harsh environment while routinely defying the highest authorities. He is a proud man who doesn't abide by anybody's rules but his own.
  - passive trait:
    - **Heir of the Underworld** (`StabbanPassive`)
      - UH_ExtensionSlot_Flat = 1  -- X Building_UWHQ slot in UWHeadquarters

## Fremen
**Always-on traits:** `Fremen`, `AllFactions_Basics`

**Starting traits in detail**
- **Fremen** (`Fremen`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Sietch_Alliance_NoNeedZone = -  -- Allows you to form alliances with Sietch outside of your territory
  - MilitaryUnits_VibrationGeneration_MRatio = 0.7  -- X% Sandworm attraction speed
  - Wormriding_Unlock = -  -- Can use Thumpers to perform Wormriding.
  - Outpost_ExtraExtensionSlot_Flat = -1  -- Increase the number of extra Building_Village slots you can build on a Village by X
  - Sietch_Alliance_AllowMultiple = -  -- Allows forming alliances with Sietchs that are allied with another faction
  - Sietch_Alliance_NoNeedAgent = -  -- Allows you to form alliances with Sietchs without an Agent
  - Sietch_Alliance_TResUpkeep = 4 [target: resource=Water]  -- Alliances with Sietchs cost X X per day
  - Sietch_Alliance_TResUpkeep = 1 [target: resource=Authority]  -- Alliances with Sietchs cost X X per day
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - PositiveResolution_MinorHousesVotes_MRatio = 0.5  -- X% votes from MinorHouses in your favor on positive resolutions
  - NegativeResolution_MinorHousesVotes_MRatio = 0.5  -- X% votes from MinorHouses against you on negative resolutions
  - TRes_Block = - [target: resource=FuelCell]  -- No access to X
  - TRes_Block = - [target: resource=GuildFavor]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - TRes_Prod_MRatio = 1 [target: resource=Spice]  -- X% X
  - Unlock_ScrapLoot = -  -- Loot Scraps on killing mechanical units
  - Unlock_TBuilding = - [target: building=WindTrap]  -- Unlocks the X Building_Village
  - TAbility_Cost_MRatio = 0.75 [target: ability=AddCrew]  -- X% X cost
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Fremen_HegemonyBonus1`, `Fremen_HegemonyBonus2`
- **Hegemony Bonus 5k** (`Fremen_HegemonyBonus1`)
  - DeepDesert_Surounded_GainControl = -  -- Surrounding a DeepDesert grants control over it.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_Flat = 0.03 [target: resource=Thumper]  -- X X
  - Wormriding_Range_Bonus = -  -- Thumpers attract larger Sandworm that can travel farther
- **Hegemony Bonus 10k** (`Fremen_HegemonyBonus2`)
  - Unlock_TInformation = - [target: information=AllySietches]  -- Unlocks X information
  - AlliedSietch_BuildLocalSietch = -  -- Every allied Sietch automatically has a LocalSietch on it, allowing you to build Main Base Building_MBs.
  - Unlock_TAbility = - [target: ability=RestoreSietch]  -- Unlocks the X Ability
  - CustomProperty = 1  -- Description of a game mechanic not specific to an ATB

**Leaders:** Liet (Doctor)
  - Liet Kynes is an imperial planetologist who took over from her father's project to terraform Arrakis into a lush environnment. She has considerable influence over the Fremen and is sensitive to the Atreides' honorable methods as rulers.
**Councilors:** Shimoom ()
  - Shimoom is a watermaster of Sietch Tabr, responsible for ensuring the exact value of a water trade between two parties, and that no water of the tribe is lost. He does his job diligently and with precision.
  - passive trait:
    - **Watermaster** (`ShimoomPassive`)
      - Faction_SetTTraitStacks_PerVillageProducingTRes2 = 12 [target: trait=ShimoomPassive_Effect]  -- Villages producing at least X X gain X
      - Outpost_TResProd_PerEmptySlot_Flat = 1 [target: resource=Water]  -- X X per empty slot in Villagess
**Councilors:** Jamis ()
  - Jamis is a renowned and fearsome Fremen fighter, prone to anger and brooding, but also gentle and loyal to his friends. He is decisive and passionate, and you'd rather have him on your side of a fight.
  - passive trait:
    - **Sand Killers** (`JamisPassive`)
      - VillageLiberation_TRes_Flat = 70 [target: resource=Authority]  -- X X when liberating a Village
      - Army_OutsideTerritory_GainTTrait = - [target: trait=JamisPassive_Army]  -- Military units outside $my(faction) territory gain X
      - CustomProperty = 0.1  -- Description of a game mechanic not specific to an ATB
      - Convert_Authority_To_Manpower = 30  -- Ability to convert Authority to Manpower
**Councilors:** Ramallo ()
  - Ramallo is an elderly Sayyadina, a rogue Bene Gesserit Reverend Mother who successfully changed the Water of Life. She therefore possesses a vast knowledge inherited from her foremothers, and her immense wisdom makes her a revered mother figure among the Fremen.
  - passive trait:
    - **Keeper of Secrets** (`RamalloPassive`)
      - Unlock_TResAction = - [target: resAction=InciteRebellion]  -- Allows using X on Landsraad resolutions
      - TRes_ProdPerTUnit2_Flat = 3 [target: resource=Intel]  -- Xs produce X X
      - TRes_ProdPerTUnit2_Flat = 0.5 [target: resource=Authority]  -- Xs produce X X
**Councilors:** Stilgar ()
  - Stilgar is the Naib - the leader - of Sietch Tabr, one of the most prominent Fremen communities on Arrakis. A wise and honorable leader, he has a soft spot for Chani Kynes, whom he regards as his niece.
  - passive trait:
    - **Fremen Alliance** (`StilgarPassive`)
      - OnStart_NearestSietches_MakeVisible = 12  -- Start with the nearest Sietch revealed
      - TRes_Prod_Flat = 1 [target: resource=Authority]  -- X X
**Speaker:** Stilgar ()
  - Stilgar is the Naib - the leader - of Sietch Tabr, one of the most prominent Fremen communities on Arrakis. A wise and honorable leader, he has a soft spot for Chani Kynes, whom he regards as his niece.
  - passive trait:
    - **Fremen Alliance** (`StilgarPassive`)
      - OnStart_NearestSietches_MakeVisible = 12  -- Start with the nearest Sietch revealed
      - TRes_Prod_Flat = 1 [target: resource=Authority]  -- X X

## Corrino
**Always-on traits:** `Corrino`, `AllFactions_Basics`

**Starting traits in detail**
- **Corrino** (`Corrino`)
  - Village_ExtensionSlot_Flat = 1  -- X Building_Village slot in owned Villages
  - Unlock_TResAction = - [target: resAction=ImperialEdict]  -- Allows using X on Landsraad resolutions
  - Allow_Landsraad = -  -- You gain 50 CouncilVotes at the Landsraad
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - Outpost_ExtraExtensionSlot_Flat = 1  -- Increase the number of extra Building_Village slots you can build on a Village by X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - DeclareWar_Instigator_Cost_ARatio = 1  -- Canceling a Peace with Corrino costs X% Influence.
  - Outpost_DistanceCost_MRatio = 3  -- Distance based Authority costs to Annex a Village are reduced by X%
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Corrino_HegemonyBonus1`, `Corrino_HegemonyBonus2`
- **Hegemony Bonus 5k** (`Corrino_HegemonyBonus1`)
  - Unlock_TAbility = - [target: ability=DeployMainBase]  -- Unlocks the X Ability
  - Unlock_TTreaty = - [target: treaty=ImperialMandate]  -- Unlocks the X Treaty
- **Hegemony Bonus 10k** (`Corrino_HegemonyBonus2`)
  - CustomProperty = 50 [target: trait=Corrino_HegemonyBonus2_DestroyedMB]  -- Description of a game mechanic not specific to an ATB
  - Entity_SetTTraitStacks = 1 [target: trait=Corrino_HegemonyBonus2_WarSource]  -- Gain X stacks of X (xX max)
  - Entity_KillTruceTerritoryLoot_TRes_Flat = 15 [target: resource=Influence]  -- Gain X X on kills in the territory of a faction in truce.

**Leaders:** Shaddam (Padishah Emperor)
  - Shaddam IV is the 81st Emperor of the Known Universe. Head of the famed House Corrino, he is also Leto Atreides' adoptive cousin, for whom he harbors fond feelings. Unfortunately, the current balance of power demands that he fights him as fiercely as any other foe.
**Councilors:** Irulan ()
  - Irulan is the eldest daughter of Shaddam IV. Her lack of a brother makes her the prime candidate to become Empress at the death of her father. She received a Bene Gesserit education from her mother, but still keeps a strong ambition that often puts her at odds with the Emperor.
  - passive trait:
    - **Centralized Industry** (`IrulanPassive`)
      - Faction_DuplicateEachBuildingLimit_Flat = 1  -- Every non-major Village Building_Village can be constructed X more time anywhere
**Councilors:** Zum ()
  - Zum Garon has been Supreme Bashar of the Sardaukar for decades. He is brutal and uncompromising, with enemies and subordinates alike. Often leading the troops personally, his loyalty to Shaddam IV has been proven many times.
  - passive trait:
    - **Legitimate Violence** (`ZumPassive`)
      - Army_PowerPerTTreaty_ARatio = 0.15 [target: treaty=ImproveRelations]  -- X% Power to all Military units per X with another faction
      - TTreaty_Cost_MRatio = 0 [target: treaty=ImperialMandate]  -- X% X cost
**Councilors:** Mohiam ()
  - Reverend Mother Gaius Helen Mohiam is both a powerful agent of the Bene Gesserit, and the personal Truthsayer of Shaddam IV. She is fully loyal to the Sisterhood and would do anything for their breeding plan to succeed.
  - passive trait:
    - **Political Supremacy** (`MohiamPassive`)
      - TResAction_VoteValue_ARatio = 1 [target: resAction=ImperialEdict]  -- Votes placed on a resolution with X are worth X% more
      - Landsraad_CharterInvestmentScore_ARatio = 1  -- X% AgendaPriority support efficiency
**Councilors:** Fenring ()
  - Hasimir Fenring was once part of the Bene Gesserit's breeding program, candidate for the role of Kwisatz Haderach. He was abandoned by the Bene Gesserit because of a genetic defect. Serving as mentat and assassin for Shaddam IV, he is also His closest friend.
  - passive trait:
    - **All-seeing Eye** (`FenringPassive`)
      - WorldEvent_NoZoneOwner = -  -- Do not require region ownership to resolve discoveries
      - WorldEvent_NoFieldAgent = -  -- Do not require an agent on an IField slot to resolve discoveries
      - WorldEvent_ForceFieldAgent_Flat = 4  -- Discoveries are resolved as if X agents were on IField slots
      - WorldEvent_FieldAgentsResolve_GainAgentDays_Flat = 1  -- Resolving any Discovery with agents on IField slots shortens the next agent's recruitment by X days
**Speaker:** Fenring ()
  - Hasimir Fenring was once part of the Bene Gesserit's breeding program, candidate for the role of Kwisatz Haderach. He was abandoned by the Bene Gesserit because of a genetic defect. Serving as mentat and assassin for Shaddam IV, he is also His closest friend.
  - passive trait:
    - **All-seeing Eye** (`FenringPassive`)
      - WorldEvent_NoZoneOwner = -  -- Do not require region ownership to resolve discoveries
      - WorldEvent_NoFieldAgent = -  -- Do not require an agent on an IField slot to resolve discoveries
      - WorldEvent_ForceFieldAgent_Flat = 4  -- Discoveries are resolved as if X agents were on IField slots
      - WorldEvent_FieldAgentsResolve_GainAgentDays_Flat = 1  -- Resolving any Discovery with agents on IField slots shortens the next agent's recruitment by X days

## Ecaz
**Always-on traits:** `Ecaz`, `AllFactions_Basics`

**Starting traits in detail**
- **Ecaz** (`Ecaz`)
  - Faction_NeutralVillages_GainTTrait = - [target: trait=Ecaz_SanctuaryEligibility]  -- Every neutral Village gains X
  - TRes_ProdPerNeutralVillageWithTTrait_Flat = 1 [target: resource=Authority]  -- X X per neutral Village with X
  - CustomProperty = 1 [target: trait=Ecaz_Sanctuary_Neighbors]  -- Description of a game mechanic not specific to an ATB
  - Treaty_Break_TResLoss_MRatio = 2 [target: resource=Standing]  -- Lose X% more X when breaking a Treaty with another faction
  - Allow_Landsraad = -  -- You gain 50 CouncilVotes at the Landsraad
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - Faction_AllSietches_Revealed_AdjacentFactionVillages_GainTTrait = - [target: trait=NeighboringRevealedSietch]  -- Villages of a faction adjacent to a Sietch it revealed gain X
  - CustomProperty_Inverted = 1  -- Description of a game mechanic not specific to an ATB
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Ecaz_HegemonyBonus1`, `Ecaz_HegemonyBonus2`
- **Hegemony Bonus 5k** (`Ecaz_HegemonyBonus1`)
  - Unlock_TAbility = - [target: ability=EcazPride]  -- Unlocks the X Ability
  - Unlock_TAbility = - [target: ability=EcazChampion]  -- Unlocks the X Ability
- **Hegemony Bonus 10k** (`Ecaz_HegemonyBonus2`)
  - TRes_ProdPerTRes2Stocks_ARatio = 0.002 [target: resource=Solari]  -- Gain X% of your X as X
  - FreeVotes_Resolution_Flat = 30  -- X free votes on all resolutions

**Leaders:** Armanda (Archduchess)
**Councilors:** Sanya ()
  - Sanya is the eldest daughter of Armanda, and current heir to the Ecaz dynasty. Her charming personality and eclectic tastes allow her to thrive among the artistic community of the house. She even has a few works to her name.
  - passive trait:
    - **Native Reservation** (`SanyaPassive`)
      - Faction_SetTTraitStacks_PerAnyVillageWithTTrait2 = - [target: trait=SanyaPassive_Stack]  -- X per Village with X
**Councilors:** Rivvy ()
  - Rivvy was a renowned instructor at the Ginaz swordmaster school. After the fall of Ginaz, he entered the service of House Ecaz as Armanda's personal bodyguard.
  - passive trait:
    - **Swordmaster Teacher** (`RivvyPassive`)
      - Army_MaxLevel_GainTTrait = 1 [target: trait=RivvyPassive_Buff]  -- At max level, gain X
      - Army_SpawnExperienceLevel_Flat = 1  -- Military Units start with X more Experience level
**Councilors:** Ibbo ()
  - Ibbo is a famous political philosopher, who has enjoyed the Ecazi court for a while. His central thesis rests on the idea that trade and gift-giving, especially of non-essential items, are powerful means of control.
  - passive trait:
    - **Diplomacy of Guilt** (`IbboVipp`)
      - Unlock_TResAction = - [target: resAction=LandsraadImmunity]  -- Allows using X on Landsraad resolutions
      - Unlock_TResAction = - [target: resAction=LandsraadImmunity_Bonus]  -- Allows using X on Landsraad resolutions
      - TRes_OnMasterpieceBuilt_Flat = 2 [target: resource=Standing]  -- Gain X X upon building a Masterpiece
**Councilors:** Mesa ()
  - Mesa is the youngest daughter of Armanda. She may appear shy and reserved at first glance, but it's only her sisters taking all the spotlight. In private, she is driven and smart, always trying to push the house resources toward helping the people.
  - passive trait:
    - **Natural Artwork** (`MesaPassive`)
      - Outpost_Abandon_RefundAuthorityCaptureCost_ARatio = 1  -- Abandoning a Village refunds X% of the Authority capture cost
      - Faction_Villages_SetTTraitStacks_PerMasterpieceOutsideTerritory = - [target: trait=MesaPassive_Stack]  -- X per Masterpiece outside my territory
      - TBuilding_ConstructionSpeed_ARatio = 1 [target: building=Masterpiece_Eco]  -- Xs are constructed X% faster
      - TBuilding_ConstructionSpeed_ARatio = 1 [target: building=Masterpiece_Military]  -- Xs are constructed X% faster
      - TBuilding_ConstructionSpeed_ARatio = 1 [target: building=Masterpiece_StateCraft]  -- Xs are constructed X% faster
**Speaker:** Sanya ()
  - Sanya is the eldest daughter of Armanda, and current heir to the Ecaz dynasty. Her charming personality and eclectic tastes allow her to thrive among the artistic community of the house. She even has a few works to her name.
  - passive trait:
    - **Native Reservation** (`SanyaPassive`)
      - Faction_SetTTraitStacks_PerAnyVillageWithTTrait2 = - [target: trait=SanyaPassive_Stack]  -- X per Village with X

## Vernius
**Always-on traits:** `Vernius`, `AllFactions_Basics`

**Starting traits in detail**
- **Vernius** (`Vernius`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TTreaty_ShareAllDevelopments = - [target: treaty=ImproveRelations]  -- Share researched developments with factions with an active X with you
  - District_Auto_Split = -  -- Districts are automatically split to give the strongest district bonuses.
  - Outpost_GainTTrait = -1 [target: trait=Vernius_NotConnectedVillage]  -- X
  - Allow_Landsraad = -  -- You gain 50 CouncilVotes at the Landsraad
  - ClosestSietch_RevealScorePerDay_Flat = 0  -- Progressively reveals the hidden Sietch closest to the main base
  - FollowingOrni_Harvester_GainTTrait = - [target: trait=OrniSupport_Harv]  -- $my(harvester)s supported by an Ornithopter gain X
  - TRes_Block = - [target: resource=Scraps]  -- No access to X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=NeighoringTheEnemy]  -- Enemy Villages neighboring your territory gain X
  - Faction_Enable_NeuralNodeNetwork = -  -- Faction can create a NeuralNode network
  - Zone_InNeuralNetwork_GainTTrait = - [target: trait=Vernius_ConnectedNode]  -- Gives X to zones with a connected NeuralNode
  - Drones_GainTTrait = - [target: trait=NotTethered]  -- Drones gain X
  - Harvester_GainTTrait = - [target: trait=NotTethered]  -- $my(harvester)s gain X
- **Basics** (`AllFactions_Basics`)
  - Faction_HasInferiorVillagesCount_GainTTrait = 1 [target: trait=AllFactions_HasNoVillage]  -- Gain X if you have less than X Villages

**Hegemony milestones:** `Vernius_HegemonyBonus1`, `Vernius_HegemonyBonus2`
- **Hegemony Bonus 5k** (`Vernius_HegemonyBonus1`)
  - Unlock_TAbility = - [target: ability=PatentDev]  -- Unlocks the X Ability
  - Development_IgnoreRequire_Flat = 1  -- Can research X developments without first unlocking its requirement
- **Hegemony Bonus 10k** (`Vernius_HegemonyBonus2`)
  - Unlock_TAbility = - [target: ability=BlackoutDev]  -- Unlocks the X Ability
  - CustomProperty = 0.002  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Spice]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Solari]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Plascrete]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Manpower]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=FuelCell]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Water]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Authority]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Influence]  -- X% X per positive X
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.002 [target: resource=Intel]  -- X% X per positive X

**Leaders:** Rhombur (Earl)
**Councilors:** Bolig ()
  - Bolig Avati is the de facto leader of the Ixian Technocrat Council, the rising counterpower to the autocratic ruling of House Vernius. While Bolig and Rhombur do not always see eye to eye, they are both loyal to the interests of Ix.
  - passive trait:
    - **Modular Technology** (`BoligPassive`)
      - Allow_MainBuildingSimultaneousConstruction_SameDistrict_Flat = 3  -- Can build up to X Main Base Building at once as long as it's in the same district
      - MainBase_Building_RefundRate_Set = 1  -- X% resources refunded when destroying a Building_MB
      - DistrictBonus_TRes_Prod_Flat = 1 [target: resource=Knowledge]  -- X X per district bonuses
**Councilors:** Bronso ()
  - Bronso is the son of Rhombur and Tessia Vernius. He is a shy young man, but his sharp intellect already manifests itself in his interests for historical science and sociology.
  - passive trait:
    - **Forward Planning** (`BronsoPassive`)
      - Faction_Outpost_Cost_SingleAdjacentRegion_MRatio = 0.8  -- X% Authority cost to Annex a Village that is adjacent to a single regions of the faction
      - Faction_GiveTTrait_ConnectedTBuilding2_FurtherFromMB = - [target: trait=BronsoPassive_Bonus]  -- The Connected Neural Node that is furthest away from the MB (on the graph) generates an airfield (choose the one that is physically furthest away in case of ex-aequo)
**Councilors:** Cammar ()
  - Cammar Pilru has served as ambassador of House Vernius for many years. While his job is often hindered by the unfounded technophobia of the Imperium, he has learned to promote Ixian machines as both harmless and necessary to the Great Houses.
  - passive trait:
    - **Scholarly Ambassador** (`CammarPassive`)
      - TRes_Max_PerTRes2_Flat = 5 [target: resource=Influence]  -- X max X per X
      - Faction_TResGain_OnWar_Flat = 200 [target: resource=Influence]  -- Receive X X when entering War
      - Faction_TResGain_OnOpponentWar_Flat = 30 [target: resource=Standing]  -- Receive X X when an opponent impose War in any way
**Councilors:** Tessia ()
  - Tessia is the wife of Rhombur. While she is a sister of the Bene Gesserit, it is clear that her loyalty and love goes to Rhombur. All of her considerable skills are used for his benefits only, which often irritates the Sisterhood.
  - passive trait:
    - **Sisterhood Contacts** (`TessiaPassive`)
      - Mission_Infiltration_RequiredLevelReduction_Flat = 1  -- Missions required level reduced by X
      - Development_NoProgress_KnowledgeToTRes_MRatio = 0.5 [target: resource=Intel]  -- While no development is in progress, X% of Knowledge is turned into X
      - Development_NoProgress_KnowledgeToTRes_MRatio = 0.5 [target: resource=Solari]  -- While no development is in progress, X% of Knowledge is turned into X
**Speaker:** Tessia ()
  - Tessia is the wife of Rhombur. While she is a sister of the Bene Gesserit, it is clear that her loyalty and love goes to Rhombur. All of her considerable skills are used for his benefits only, which often irritates the Sisterhood.
  - passive trait:
    - **Sisterhood Contacts** (`TessiaPassive`)
      - Mission_Infiltration_RequiredLevelReduction_Flat = 1  -- Missions required level reduced by X
      - Development_NoProgress_KnowledgeToTRes_MRatio = 0.5 [target: resource=Intel]  -- While no development is in progress, X% of Knowledge is turned into X
      - Development_NoProgress_KnowledgeToTRes_MRatio = 0.5 [target: resource=Solari]  -- While no development is in progress, X% of Knowledge is turned into X

## Renegades
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## Locals
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## MinorHouses
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## Landsraad
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## SpacingGuild
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## BeneGesserit_Faction
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


## Imperium
**Always-on traits:** none

**Starting traits in detail**

**Hegemony milestones:** none


