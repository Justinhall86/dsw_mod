# Traits with interesting mechanics (vanilla)

Traits whose id, name or description matches combat-style keywords (duel, parry, stacks, aura, champion, execute, Kanly, desert, etc.). Full list is in the data; this is a curated view.

- **Disrupted** (`A_Demo_Debuff`)
  - desc: Sustains extra damage in combat because of the disruption of a A_Demo.
  - Entity_Armor_Flat = -2  -- X Armor

- **Disruption** (`A_Demo_Trait`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=A_Demo_Debuff]  -- The target is X (xX max): X

- **Medical Dispenser** (`A_Drone_Buff`)
  - desc: A nearby A_Drone helps with Life recovery.
  - Entity_IgnoreDamages = -  -- Cannot take damages
  - Unit_BlockDeath = -  -- This unit cannot die in any circumpstance but still triggers predeath effects
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Life Pods** (`A_Drone_Trait`)
  - Entity_CarryCapacity_Flat = 2  -- Can carry up to X ally ground Military Units
  - Entity_Carried_GainTTrait = - [target: trait=A_Drone_Buff]  -- Units carried gain X
  - Army_CarryDeadAtTRange_SelfHumans = - [target: range=Long_Range]  -- Nearby humans are carried instead of killed

- **Bulwark** (`A_Elite_Buff`)
  - desc: Protected by a nearby A_Elite.
  - Entity_Armor_Flat = 2  -- X Armor

- **Bulwark** (`A_Elite_Trait`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=A_Elite_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Troop Carrier** (`A_Frigate_Trait`)
  - Entity_CarryCapacity_Flat = 10  -- Can carry up to X ally ground Military Units
  - Entity_SetTTrait_PerCarried = - [target: trait=A_Frigate_Trait_Buff]  -- Gain X per carried unit (xX max)
  - Entity_Immune_Deficit = -  -- 

- **Duncan's Last Stand** (`A_Hero_1_Skill_Buff_1`)
  - desc: At the height of the battle, A_Hero_1 taps into deep reserves of strength coming from his loyalty to Atreides-longname.
  - Entity_GiveTTrait_GroundUnitAtWar_AtTRange2 = - [target: trait=A_Hero_1_Skill_Debuff]  -- Give X to ground unit in War in X
  - Entity_Speed_ARatio = 1  -- X% Speed
  - Entity_AttackSpeed_MRatio = 2  -- X% attack speed
  - Entity_Armor_Flat = 5  -- X Armor
  - Army_AffectedByAllyUnitBonus_FreezeStackTTrait = - [target: trait=A_Hero_1_Heroism]  -- Freeze current stacks of X
  - Uncontrollable = -  -- Cannot be controlled
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Duncan's Focus** (`A_Hero_1_Skill_Debuff`)
  - desc: This unit is taken into A_Hero_1_Skill, and will have a hard time escaping.
  - Entity_Speed_MRatio = 0.5  -- X% Speed

- **Heroic Figure** (`A_Hero_1_Trait`)
  - Army_AffectedByAllyUnitBonus_GainStackTTrait = - [target: trait=A_Hero_1_Heroism]  -- Gain X stack per bonus effect of allied unit
  - Unit_SetTTraitStacks_PerUnitKindDeath = - [target: trait=A_Hero_1_GholaWisdom]  -- Gain X per previous death

- **Gurney's Lesson** (`A_Hero_2_FactionBuff`)
  - MilitaryUnit_XPLevel_GainTTraitStack = - [target: trait=A_Hero_2_UnitsBuff_1]  -- Each XP level grants a stack of X

- **Forced March** (`A_Hero_2_Skill`)
  - desc: A_Hero_2's songs remind everyone of the sweetness of life, even when it is tough.
  - AllyGroundArmies_AtTRange2_GainTTrait = - [target: trait=A_Hero_2_Skill_Buff]  -- Ally ground Military Units in X gain X (xX max)
  - Entity_SetTTraitStacks = 1 [target: trait=A_Hero_2_Skill_Buff]  -- Gain X stacks of X (xX max)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Stop Forced March** (`A_Hero_2_SkillOff_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Forced March** (`A_Hero_2_Skill_Buff`)
  - desc: This unit is under the charming effect of A_Hero_2's song.
  - Unit_Speed_ARatio = 0.3  -- X% unit Speed
  - Entity_Armor_Flat = 2  -- X Armor
  - Entity_NoAttack = -  -- Can't attack

- **Suppressive Fire** (`A_Soldier_Trait`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=A_Soldier_Debuff]  -- The target is X (xX max): X

- **AramshamPassive_Conscripts** (`AramshamPassive_Conscripts`)

- **Master Raiders** (`Armorers_Fremen`)
  - Army_AttackSpeed_ARatio = 0.1  -- X% attack speed

- **Seasoned Combat Trainers** (`ArrakisHeroes`)
  - desc: This Sietch has better elite troops, making it a powerful local player.
  - Army_Elite_TResUpkeep_Flat = -1 [target: resource=CommandPoint]  -- X $my(Elite) units X

- **Way of the Desert** (`ArrakisTrainers`)
  - desc: A good teacher will bring a good student to mastery of desert tactics.
  - TRes_Gain_ARatio = 0.2 [target: resource=Experience]  -- X% X gains

- **Professional** (`Assassin_Trait`)
  - Entity_ExecuteInfantry_HealthRatio_Flat = 1  -- Execute non mechanical enemies under X% Life
  - Disband_AfterArmyAttacks_Flat = 1  -- This unit will disband after X attacks on enemy units
  - Entity_NoAttack_Mechanical = -  -- Can't attack mechanical units
  - Entity_NoAttack_Heroes = -  -- Can't attack Heros
  - Army_Speed_ARatio = 0.2  -- X% Military Unit Speed

- **Concord Chamber** (`AtreidesFremenEmbassy_AlliedTrait`)
  - desc: A nearby AtreidesFremenEmbassy helps bettering relationship with this Sietch.
  - TRes_Prod_Flat = 20 [target: resource=Solari]  -- X X

- **Concord Chamber** (`AtreidesFremenEmbassy_Trait`)
  - desc: A nearby AtreidesFremenEmbassy helps bettering relationship with this Sietch.
  - Sietch_RelationGains_ARatio = 2  -- X% relation gain with Sietch
  - Sietch_Alliance_FactionGainTTraitStack = - [target: trait=AtreidesFremenEmbassy_AlliedTrait]  -- X for allied Sietch

- **Hegemony Bonus 10k** (`Atreides_HegemonyBonus_2`)
  - Charters_OnlyStandingCondition = -  -- You can ignore Charters prerequisites except for the necessary Standing
  - Resolution_Positive_GainPermanentTrait = - [target: trait=Atreides_PositiveResolutionPerm]  -- Permanently gain X upon being elected for a positive Resolution (xX max)

- **Bene Gesserit** (`BeneGesserit`)
  - Infiltration_LevelCapIncrease_MRatio = 2  -- Counts as X Agents for Infiltration levels

- **Bene Gesserit** (`BeneGesserit_Conquest`)
  - Infiltration_LevelCapIncrease_MRatio = 2  -- Counts as X Agents for Infiltration levels
  - AgtAtb_NoCapture = -  -- This agent cannot be captured
  - AgtAtb_NoDismiss = -  -- This agent cannot be dismissed
  - AgtAtb_NoCount = -  -- Does not count in the max Agents count

- **Betrayed** (`Betrayed_Ecaz`)
  - desc: You have recently been betrayed by another faction.

- **Spice Refining Facilities** (`CBI_SpiceProd`)
  - TRes_Prod_ARatio = 0.05 [target: resource=Spice]  -- X% X

- **Wind Farms** (`CBI_WaterProd`)
  - TRes_Prod_Flat = 3 [target: resource=Water]  -- X X

- **Shielding Weather** (`CBS_ShieldWeather`)
  - Army_Ground_NoMilitia_GainTTrait = - [target: trait=CBS_ShieldWeather_Buff]  -- Ground units (except militia) gain X

- **Shielding Weather** (`CBS_ShieldWeather_Buff`)
  - Entity_DamageReceived_FromRanged_MRatio = 0.8  -- X% damage received from ranged attacks
  - Entity_Armor_Flat = 1  -- X Armor

- **Ancient Survival Techniques** (`CB_AncientSietch_SietchArmy`)
  - Army_SupplyDecrease_MRatio = 0.1  -- Reduces supply losses by X%
  - Unit_NoVibrations = -  -- No Sandworm attraction

- **Ancient Survival Techniques** (`CB_AncientSietch_SietchRaiders`)
  - Army_SupplyDecrease_MRatio = 0.1  -- Reduces supply losses by X%
  - MilitaryUnits_VibrationGenerationInMovement_MRatio = 0  -- X% Sandworm attraction speed while moving

- **Ginaz Swordmasters** (`CB_Atreides_FactionBonus2`)
  - Army_ExperienceGain_ARatio = 1  -- X% Experience gains
  - Army_XPLevel_Effects_ARatio = 1  -- X% Experience level effects
  - Army_XPLevel_AdditionalEffects_ARatio = 1  -- X% Experience level additional effects

- **Healthy Rations** (`CB_Atreides_MissionReward3`)
  - Army_Life_ARatio = 0.1  -- X% Military Unit Life

- **Mandatory Levies** (`CB_Corrino_FactionBonus6`)
  - Faction_HasInferiorConscriptCount_GainTTrait = 10 [target: trait=CB_Corrino_FactionBonus6_Effect]  -- While owning less than X permanent Conscripts, gain: X

- **Structural Optimization** (`CB_Corrino_MissionReward2_MainBase`)
  - AdjacentRegionsNeutralVillages_GainTTrait = - [target: trait=CB_Corrino_MissionReward2_Villages]  -- Neutral Villages in the Region and its neighbors gain X (xX max): X
  - AdjacentRegionsEnemyVillages_GainTTrait = - [target: trait=CB_Corrino_MissionReward2_Villages]  -- Enemy Villages in the Region and its neighbors gain X (xX max): X

- **Ancient Survival Techniques** (`CB_DoomedSietch_SietchArmy`)
  - Army_SupplyDecrease_MRatio = 0.1  -- Reduces supply losses by X%
  - Unit_NoVibrations = -  -- No Sandworm attraction

- **Favorite Candidate** (`CB_Ecaz_FactionBonus1`)
  - FreeVotes_EligibleCharter_Flat = 100  -- X free votes on charters you are eligible to

- **Political Duel** (`CB_Ecaz_FactionBonus2`)
  - Faction_EcazChampion_GainTTrait = - [target: trait=CB_Ecaz_FactionBonus2_Effect]  -- Champions gain X

- **Political Duel** (`CB_Ecaz_FactionBonus2_Effect`)
  - Army_OnEliminateFactionUnit_GainTRes = 3 [target: resource=Standing]  -- Gain X X upon participating in a kill
  - Army_OnEliminateFactionUnit_GainTRes = 10 [target: resource=Influence]  -- Gain X X upon participating in a kill

- **Virtuous Standing** (`CB_Ecaz_FactionBonus3`)
  - Faction_SetTTraitStacks_PerAnyVillageWithTTrait2 = - [target: trait=CB_Ecaz_FactionBonus3_Effect]  -- X per Village with X

- **Virtuous Standing** (`CB_Ecaz_FactionBonus3_Effect`)
  - TRes_OnCouncilOpening_Flat = 3 [target: resource=Standing]  -- X X on Council opening
  - TRes_OnCouncilVoteEnd_Flat = 10 [target: resource=Influence]  -- X X after every Council

- **Lonely Quest** (`CB_Ecaz_FactionBonus5`)
  - Faction_EcazChampion_GainTTrait = - [target: trait=CB_Ecaz_FactionBonus5_Effect]  -- Champions gain X
  - CustomProperty = - [target: trait=CB_Ecaz_FactionBonus5_EffectStack_Fake]  -- Description of a game mechanic not specific to an ATB

- **Lonely Quest** (`CB_Ecaz_FactionBonus5_Effect`)
  - Unit_OnInvestigatedWorldEventOutsideTerritory_GainTTraitStack = - [target: trait=CB_Ecaz_FactionBonus5_EffectStack]  -- Upon finishing investigating any Discoveryoutside your territory, gain X
  - Unit_OnInvestigatedWorldEventOutsideTerritory_GainSupplyRatio = 0.5  -- Upon finishing investigating any Discovery outside your territory, recover X% Supply

- **Lonely Quest** (`CB_Ecaz_FactionBonus5_EffectStack`)
  - desc: The TEcazChampion has completed a quest.
  - Entity_Power_ARatio = 0.05  -- X% Power
  - Entity_Life_ARatio = 0.05  -- X% max Life

- **Lonely Quest** (`CB_Ecaz_FactionBonus5_EffectStack_Fake`)
  - desc: The TEcazChampion has completed a quest.
  - Entity_Power_ARatio = 0.05  -- X% Power
  - Entity_Life_ARatio = 0.05  -- X% max Life
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB

- **Helpful Entourage** (`CB_Ecaz_FactionBonus6`)
  - Faction_EcazChampion_GainTTrait = - [target: trait=CB_Ecaz_FactionBonus6_Effect]  -- Champions gain X
  - CustomProperty = 4 [target: unit=E_HelpfulEntourage]  -- Description of a game mechanic not specific to an ATB

- **Helpful Entourage** (`CB_Ecaz_FactionBonus6_Effect`)
  - MilitaryUnit_XPLevel_GainTTraitStack_From0 = - [target: trait=CB_Ecaz_FactionBonus6_EffectStack]  -- Each XP level grants a stack of X

- **Helpful Entourage** (`CB_Ecaz_FactionBonus6_EffectStack`)
  - Army_HandleSubTUnits_Count = 1 [target: unit=E_HelpfulEntourage]  -- Generate X over time, up to X at once.

- **Fascinating Works** (`CB_Ecaz_FactionBonus7`)
  - Outpost_CostPerNearbyMasterpieces_MRatio = 0.95  -- X% Authority cost to Annex a village per Masterpiece in it and its neighbors

- **Artful Display** (`CB_Ecaz_FactionBonus8`)
  - OnMasterpieceBuilt_ResourceGains_ARatio = 1  -- X% resource gained upon building a Masterpiece

- **Artistic Freedom** (`CB_Ecaz_FactionBonus9`)
  - Village_HasMasterpiece_GainTTrait = - [target: trait=CB_Ecaz_FactionBonus9_Effect]  -- Gain X if there is a masterpiece in this village

- **Artistic Freedom** (`CB_Ecaz_FactionBonus9_Effect`)
  - Village_ExtensionSlot_Flat = 1  -- X Building_Village slot in owned Villages
  - Outpost_ExtraExtensionSlot_Flat = 1  -- Increase the number of extra Building_Village slots you can build on a Village by X

- **Luxury Garden** (`CB_Ecaz_MissionReward1`)
  - Village_HasTTrait_GainTTrait2 = - [target: trait=TEcazPride]  -- Villages with X gain X

- **Luxury Garden** (`CB_Ecaz_MissionReward1_Effect`)
  - TRes_Prod_ARatio = 0.5 [target: resource=Influence]  -- X% X
  - TRes_Prod_ARatio = 0.5 [target: resource=Knowledge]  -- X% X

- **Resourcing Retreat** (`CB_Ecaz_MissionReward2`)
  - Faction_SetTTraitStacks_PerAnyVillageWithTTrait2 = - [target: trait=CB_Ecaz_MissionReward2_Effect]  -- X per Village with X

- **Resourcing Retreat** (`CB_Ecaz_MissionReward2_Effect`)
  - Army_Power_ARatio = 0.03  -- X% Military Unit Power

- **Chivalry Culture** (`CB_Ecaz_MissionReward3`)
  - TUnit_Power_Flat = 1 [target: unit=E_Elite]  -- X X Power

- **Tourney Culture** (`CB_Ecaz_MissionReward4`)
  - Faction_EcazChampion_GainTTrait = - [target: trait=CB_Ecaz_MissionReward4_Effect]  -- Champions gain X

- **Tourney Culture** (`CB_Ecaz_MissionReward4_Effect`)
  - Entity_Power_Flat = 1  -- X Power
  - Entity_Armor_Flat = 1  -- X Armor

- **Defender of the Arts** (`CB_Ecaz_MissionReward5`)
  - Army_ZoneHasMasterpiece_GainTTrait = - [target: trait=CB_Ecaz_MissionReward5_Effect]  -- Military Units in a region with any Masterpiece gain X

- **Defender of the Arts** (`CB_Ecaz_MissionReward5_Effect`)
  - Entity_Power_ARatio = 0.2  -- X% Power

- **The Arrakis Gallery** (`CB_Ecaz_MissionReward6`)
  - THegemony_BaseGain_Flat = 50 [target: hegemony=Masterpieces]  -- X Hegemony production from X
  - TBuilding_THegemony2 = - [target: building=Masterpiece_Eco]  -- X provide Hegemony
  - TBuilding_THegemony2 = - [target: building=Masterpiece_Military]  -- X provide Hegemony
  - TBuilding_THegemony2 = - [target: building=Masterpiece_StateCraft]  -- X provide Hegemony

- **Faufreluche Contacts** (`CB_Faufreluches_RelationBonus1`)
  - Infiltration_GreatFaction_MinLevel = 1  -- Great Houses Infiltration levels cannot be lower than X

- **Faufreluche Puppeteer** (`CB_Faufreluches_RelationBonus4`)
  - Infiltration_GreatFaction_MinLevel = 1  -- Great Houses Infiltration levels cannot be lower than X
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB
  - Charters_IgnoreStandingCondition = -  -- Ignore Standing prerequisites of Charters
  - Block_TMission = - [target: mission=CB_MFraufrelucheBribe]  -- Disables the X mission

- **CB_FremenUprising_BlockExpansion** (`CB_FremenUprising_BlockExpansion`)
  - TRes_Prod_MRatio = 0 [target: resource=Authority]  -- X% X

- **CB_FremenUprising_Player** (`CB_FremenUprising_Player`)
  - Army_SupplyDecrease_MRatio = 0.1  -- Reduces supply losses by X%

- **Rallied** (`CB_FremenUprising_VillageTaken`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Wind from the South** (`CB_Fremen_FactionBonus1`)
  - Outpost_MapBorder_AnnexCost_Flat = -20  -- X Authority cost to Annex a Village touching the border of the map
  - Faction_OnBorderAnnex_ApplyTTrait = - [target: trait=CB_Fremen_FactionBonus1_Bonus]  -- Gives X to Villages located next to the border of the map

- **Wind from the South** (`CB_Fremen_FactionBonus1_Bonus`)
  - Village_TraitStack_Flat = 1  -- Effects of SpecificityVillage are applied X more times

- **Drawing the Faithful** (`CB_Fremen_FactionBonus2`)
  - TBuilding_Limit_Flat = 1 [target: building=ShaiHuludTemple]  -- X X limit
  - TBuilding_Rallypoint = 80 [target: building=ShaiHuludTemple]  -- Generate a small Rallypoint range

- **Cleanup Crew** (`CB_Fremen_FactionBonus3`)
  - CustomProperty = - [target: trait=CB_Fremen_FactionBonus3_Fake]  -- Description of a game mechanic not specific to an ATB
  - Unit_OnInvestigatedWorldEvent_GainTRes_Flat = 20 [target: resource=Authority]  -- Upon finishing investigating any Discovery, gains X X
  - Unit_OnInvestigatedWorldEvent_GainSupplyRatio = 0.5  -- Upon finishing investigating any Discovery, recover X% Supply

- **Cleanup Crew** (`CB_Fremen_FactionBonus3_Fake`)
  - CustomProperty = 20 [target: resource=Authority]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB

- **Little Drops** (`CB_Fremen_FactionBonus4`)
  - Outpost_TRes2ProdPositive_TResProd_Flat = 0.5 [target: resource=Authority]  -- X X in every Villages that produces more X than it consumes

- **Deep Reserve** (`CB_Fremen_FactionBonus5`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Convert_Water_To_Authority = 200  -- Ability to convert Water to Authority
  - Convert_Authority_To_Water = 10  -- Ability to convert Authority to Water

- **Shared Purpose** (`CB_Fremen_FactionBonus6`)
  - TRes_Max_Flat = 1500 [target: resource=Authority]  -- X max X
  - Faction_SetTTraitStacks_PerTRes2_Flat = 100 [target: trait=CB_Fremen_FactionBonus6_Bonus]  -- For every X X in stock, gain: X

- **Shared Purpose** (`CB_Fremen_FactionBonus6_Bonus`)
  - TRes_Prod_Flat = 1 [target: resource=Manpower]  -- X X
  - TRes_Prod_Flat = 1 [target: resource=Intel]  -- X X
  - TRes_Prod_Flat = 1 [target: resource=Knowledge]  -- X X

- **Meaningful Symbols** (`CB_Fremen_FactionBonus7`)
  - TRes_ProdPerSpecialRegionOwned_Flat = 1 [target: resource=Authority]  -- X X per controlled SpecialRegion

- **Manifest Legitimacy** (`CB_Fremen_FactionBonus8`)
  - Faction_MostTRes2Prod_GainTTrait = - [target: trait=CB_Fremen_FactionBonus8_Bonus]  -- X if no other faction owns more X

- **Manifest Legitimacy** (`CB_Fremen_FactionBonus8_Bonus`)
  - TRes_Prod_Flat = 5 [target: resource=Knowledge]  -- X X
  - TRes_Prod_Flat = 5 [target: resource=Influence]  -- X X

- **The Land Provides** (`CB_Fremen_FactionBonus9`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=SandCaches]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=SandCaches]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=PlascreteFactory]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=PlascreteFactory]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=ProcessingPlant]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=ProcessingPlant]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=ResearchHub]  -- X% X X Upkeep on natural resource
  - TBuilding_TRes2_OnNaturalResource_Upkeep_MRatio = 0 [target: building=ResearchHub]  -- X% X X Upkeep on natural resource

- **Maker's Favor** (`CB_Fremen_MissionReward1`)
  - TRes_Prod_ARatio = 0.3 [target: resource=Thumper]  -- X% X

- **Spirit of Temperance** (`CB_Fremen_MissionReward2`)
  - Faction_AdditionalSupplyPerWater_Flat = 1  -- Every unit has X Supply per Water

- **Holy Purpose** (`CB_Fremen_MissionReward3`)
  - TRes_Prod_PerNetTRes2Prod_ARatio = 0.005 [target: resource=Authority]  -- X% X per positive X

- **Millenial Project** (`CB_Fremen_MissionReward4`)
  - THegemony_BaseAmount_Override = 20 [target: hegemony=WaterProduction]  -- X Hegemony from X

- **Rebellious Momentum** (`CB_Fremen_MissionReward6`)
  - CustomProperty = - [target: trait=CB_Fremen_MissionReward6_Fake]  -- Description of a game mechanic not specific to an ATB
  - TRes_ProdPerVillageOwned_ARatio = 0.01 [target: resource=Authority]  -- X% X per controlled Village
  - TRes_ProdPerVillageOwned_ARatio = 0.01 [target: resource=Manpower]  -- X% X per controlled Village

- **Rebellious Momentum** (`CB_Fremen_MissionReward6_Fake`)
  - CustomProperty = 0.01 [target: resource=Authority]  -- Description of a game mechanic not specific to an ATB

- **Fremen Tolerance** (`CB_Fremen_RelationBonus1`)
  - OnStart_NearestSietches_MakeVisible = 1  -- Start with the nearest Sietch revealed

- **Fremen Respect** (`CB_Fremen_RelationBonus2`)
  - TStruct_MakeReconned = - [target: structure=SpiceArea]  -- Reveals the position of all Xs

- **Fremen Friendship** (`CB_Fremen_RelationBonus3`)
  - Unlock_TBuilding_Force = - [target: building=WindTrap]  -- Allows for the construction of X

- **Fremen Alliance** (`CB_Fremen_RelationBonus4`)
  - AlliedSietch_BuildLocalSietch = -  -- Every allied Sietch automatically has a LocalSietch on it, allowing you to build Main Base Building_MBs.
  - Unlock_TBuilding_Force = - [target: building=SandCaches]  -- Allows for the construction of X
  - Wormriding_Unlock = -  -- Can use Thumpers to perform Wormriding.
  - TRes_Prod_Flat = 0.03 [target: resource=Thumper]  -- X X
  - Wormriding_Range_Bonus = -  -- Thumpers attract larger Sandworm that can travel farther

- **Ship Escort** (`CB_Generic_MissionReward11_Ecaz`)
  - Unlock_TUnit = - [target: unit=E_Ship]  -- Unlocks the X unit

- **Ship Escort** (`CB_Generic_MissionReward11_Fremen`)
  - Unlock_TUnit = - [target: unit=F_Ship]  -- Unlocks the X unit

- **Ship Escort** (`CB_Generic_MissionReward11_Smugglers`)
  - Unlock_TUnit = - [target: unit=S_Ship]  -- Unlocks the X unit

- **Guild Fiefdom** (`CB_Generic_MissionReward13_Fremen`)
  - TRes_Prod_Flat = 1 [target: resource=Scraps]  -- X X
  - Unlock_TBuilding = - [target: building=RecyclingPlant]  -- Unlocks the X Building_Village

- **Formation Template** (`CB_Generic_MissionReward15_Ecaz`)
  - CustomProperty = 0.8  -- Description of a game mechanic not specific to an ATB
  - Militia_TrainDuration_MRatio = 0.8  -- X% Militia training time
  - Militia_TrainCost_MRatio = 0.8  -- X% Militia training cost
  - TUnit_ImportCost_MRatio = 0.8 [target: unit=E_Trooper]  -- X% X recruitment costs
  - TUnit_ImportTime_MRatio = 0.8 [target: unit=E_Trooper]  -- X% X recruitment time

- **Formation Template** (`CB_Generic_MissionReward15_Fremen`)
  - CustomProperty = 0.8  -- Description of a game mechanic not specific to an ATB
  - Militia_TrainDuration_MRatio = 0.8  -- X% Militia training time
  - Militia_TrainCost_MRatio = 0.8  -- X% Militia training cost
  - TUnit_ImportCost_MRatio = 0.8 [target: unit=F_Trooper]  -- X% X recruitment costs
  - TUnit_ImportTime_MRatio = 0.8 [target: unit=F_Trooper]  -- X% X recruitment time

- **Formation Template** (`CB_Generic_MissionReward15_Smugglers`)
  - CustomProperty = 0.8  -- Description of a game mechanic not specific to an ATB
  - Militia_TrainDuration_MRatio = 0.8  -- X% Militia training time
  - Militia_TrainCost_MRatio = 0.8  -- X% Militia training cost
  - TUnit_ImportCost_MRatio = 0.8 [target: unit=S_Trooper]  -- X% X recruitment costs
  - TUnit_ImportTime_MRatio = 0.8 [target: unit=S_Trooper]  -- X% X recruitment time

- **Greater Spice Field** (`CB_GreaterSpiceField`)
  - TRes_Prod_Flat = 10 [target: resource=Spice]  -- X X

- **Pragmatic Sacrifice** (`CB_Harkonnen_FactionBonus2`)
  - Army_IsTemporary_GainTTrait = - [target: trait=CB_Harkonnen_FactionBonus2_Effect]  -- Temporary units gain: X
  - Unit_HasTTrait_GainTTrait2 = - [target: trait=NoHealthRegen]  -- Units with X gain: X

- **Pragmatic Sacrifice** (`CB_Harkonnen_FactionBonus2_Effect`)
  - desc: This unit has been connected to a dead man's switch.
  - Unit_OnBeforeDeath_ForceCombo = 20 [target: combo=H_Drone_Death_Attack]  -- Attacks with X upon death (Value is range at which the target of the attack will be searched)

- **Omnipresent Fanaticism** (`CB_Harkonnen_FactionBonus3`)
  - Entity_NoTempNoHireling_OverLifeRatio_StartCombat_GainTTrait = 0.5 [target: trait=CB_Harkonnen_FactionBonus3_Effect]  -- Non-temporary, non-hireling units with over X% Life start fights with X

- **Omnipresent Fanaticism** (`CB_Harkonnen_FactionBonus3_Effect`)
  - Infantry_OnGoneLowHealth_TUnitSpawn = 0.5 [target: unit=H_Sleeper]  -- Upon reaching X% Life, spawn a X

- **Educational Example** (`CB_Harkonnen_FactionBonus4_Effect`)
  - CustomProperty = 0.1  -- Description of a game mechanic not specific to an ATB
  - Res_Prod_ARatio_ExceptTRes = 0.1 [target: resource=Spice]  -- X% resource production except for X
  - Zone_Owned_Harvester_Prod_ARatio = 0.1  -- X% Spice gathering rate for $my(harvester) in owned zones

- **Minor Martyrdom** (`CB_Harkonnen_MissionReward2`)
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB
  - Unit_OnDeath_TResGain_Flat = 2 [target: resource=Influence]  -- Gain X X upon death in combat
  - Unit_OnDeath_TResGain_Flat = 2 [target: resource=Authority]  -- Gain X X upon death in combat

- **Show of Strength** (`CB_Harkonnen_MissionReward4`)
  - Entity_KillRebelsLoot_TRes_Flat = 5 [target: resource=Influence]  -- Gain X X upon killing Rebels
  - Entity_KillRebelsLoot_TRes_Flat = 5 [target: resource=Intel]  -- Gain X X upon killing Rebels
  - TUnit_GainTTrait2 = - [target: unit=BrainwashedRebel]  -- Xs gain X

- **CB_SmugglerBaseBonus** (`CB_SmugglerBaseBonus`)
  - Unlock_TMission = - [target: mission=CB_MFraufrelucheBribe]  -- Unlocks the X Mission

- **One-Armed Bandit** (`CB_Smugglers_FactionBonus1`)
  - TRes_Prod_Flat = 5 [target: resource=FuelCell]  -- X X
  - TUnit_GainTTrait2 = - [target: unit=S_Drone]  -- Xs gain X

- **Early Birds** (`CB_Smugglers_FactionBonus2`)
  - Faction_BypassDevastated = 10  -- Faction can bypass Untargetable X days early

- **Well-Traveled** (`CB_Smugglers_FactionBonus3`)
  - CustomProperty = - [target: trait=CB_Smugglers_FactionBonus3_Fake]  -- Description of a game mechanic not specific to an ATB
  - Pillage_TResPostGainWithoutTTrait2_Flat = 20 [target: resource=Authority]  -- Gain X X by pillaging a Village without X
  - Pillage_THegemonyPostGainWithoutTTrait2_Flat = 100 [target: hegemony=VillagePillaged]  -- Gain X X by pillaging a Village without X
  - Pillage_ApplyTTrait = - [target: trait=CB_Smugglers_FactionBonus3_Malus]  -- Pillaging a village applies gives it: X

- **Well-Traveled** (`CB_Smugglers_FactionBonus3_Fake`)
  - CustomProperty = 20 [target: resource=Authority]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = 100 [target: resource=Hegemony]  -- Description of a game mechanic not specific to an ATB

- **Well-Traveled** (`CB_Smugglers_FactionBonus3_Malus`)
  - desc: This Village has already been pillaged by Smugglers-longname

- **Gigantic Water Tanks** (`CB_Smugglers_FactionBonus4`)
  - TRes_Prod_Flat = 50 [target: resource=Water]  -- X X
  - TRes_ConsoOverTime_Flat = 0.5 [target: resource=Water]  -- X X increasing daily

- **Vanguard Outposts** (`CB_Smugglers_FactionBonus5`)
  - CustomProperty = 3 [target: trait=CB_Smugglers_FactionBonus5_Bonus]  -- Description of a game mechanic not specific to an ATB
  - Faction_OnDistantAnnex_ApplyTTrait = 2 [target: trait=CB_Smugglers_FactionBonus5_Bonus]  -- Gives X to Villages annexed at X or more regions from any controlled region

- **Vanguard Outposts** (`CB_Smugglers_FactionBonus5_Bonus`)
  - desc: This Village is a Smugglers-adjective vanguard.
  - Village_ExtensionSlot_Flat = 1  -- X Building_Village slot in owned Villages
  - Outpost_ExtraExtensionSlot_Flat = 1  -- Increase the number of extra Building_Village slots you can build on a Village by X
  - Building_Village_TResCost_MRatio = 0.5 [target: resource=Plascrete]  -- X% X Village Building_Villages construction costs

- **Grocer Network** (`CB_Smugglers_FactionBonus6`)
  - CustomProperty = 1  -- Description of a game mechanic not specific to an ATB
  - TBuilding_TRes2Prod_Flat = 1 [target: building=Marketplace]  -- X X per X in the area
  - TBuilding_TRes2Prod_Flat = 1 [target: building=Marketplace]  -- X X per X in the area
  - TBuilding_TRes2Prod_Flat = 1 [target: building=BootlegMarket]  -- X X per X in the area
  - TBuilding_TRes2Prod_Flat = 1 [target: building=BootlegMarket]  -- X X per X in the area

- **Street-Smart** (`CB_Smugglers_FactionBonus7`)
  - Development_TDomainStepMultiplier_PerUHExtension_MRatio = 0.95  -- X% cost of developments per UWHeadquarters extension of the same type

- **Rotten From the Inside** (`CB_Smugglers_FactionBonus8`)
  - CustomProperty = 7 [target: trait=CB_Smugglers_FactionBonus8_Fake]  -- Description of a game mechanic not specific to an ATB
  - Faction_OwnsUHInFaction_ApplyTTrait = 7 [target: trait=CB_Smugglers_FactionBonus8_Malus]  -- Apply X when owning X headquarters in a faction
  - Agt_AssignedToFactionWithTTrait_GainTTrait2 = - [target: trait=CB_Smugglers_FactionBonus8_Malus]  -- Each Agent assigned to a faction with X, gains X

- **Rotten From the Inside** (`CB_Smugglers_FactionBonus8_Bonus`)
  - AgtAtb_Mult_MRatio = 2  -- This agent's effect are multiplied by X

- **Rotten From the Inside** (`CB_Smugglers_FactionBonus8_Fake`)
  - CustomProperty = - [target: trait=CB_Smugglers_FactionBonus8_Malus]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Rotten From the Inside** (`CB_Smugglers_FactionBonus8_Malus`)
  - Entity_MaxInfiltrationSlot_Target = 1 [target: trait=CB_Smugglers_FactionBonus8]  -- A faction with X gains X Agent max slot in Infiltration against me

- **Another Man's Treasure** (`CB_Smugglers_FactionBonus9`)
  - CustomProperty = - [target: trait=CB_Smugglers_FactionBonus9_Fake]  -- Description of a game mechanic not specific to an ATB
  - UH_OnConstruct_GainTRes_Flat = 30 [target: resource=Manpower]  -- Building an UWHeadquarters gives X X
  - UH_OnConstruct_GainTRes_Flat = 100 [target: resource=Plascrete]  -- Building an UWHeadquarters gives X X

- **Another Man's Treasure** (`CB_Smugglers_FactionBonus9_Fake`)
  - CustomProperty = 30 [target: resource=Manpower]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = 100 [target: resource=Plascrete]  -- Description of a game mechanic not specific to an ATB

- **One-Armed Bandit** (`CB_Smugglers_FactionBonus_Buff`)
  - Entity_DeliveryLoot_TRes_Flat = 75 [target: resource=Solari]  -- Gain X X when delivering loot

- **Hit and Run** (`CB_Smugglers_MissionReward1`)
  - CustomProperty = 0.9  -- Description of a game mechanic not specific to an ATB
  - TSiegeAction_NeutralVillage_Duration_MRatio = 0.9 [target: siegeAction=Pillage]  -- X% X action duration on neutral villages
  - TSiegeAction_NeutralVillage_Duration_MRatio = 0.9 [target: siegeAction=PillageSietch]  -- X% X action duration on neutral villages
  - TSiegeAction_EnemyVillage_Duration_MRatio = 0.9 [target: siegeAction=Pillage]  -- X% X action duration on enemy villages
  - TSiegeAction_EnemyVillage_Duration_MRatio = 0.9 [target: siegeAction=PillageSietch]  -- X% X action duration on enemy villages

- **Dangerous Job** (`CB_Smugglers_MissionReward2`)
  - Pillage_Gain_FactionVillage_ARatio = 0.2  -- X% resources from pillaging an enemy Village

- **Synergetic Advertising** (`CB_Smugglers_MissionReward3`)
  - Outpost_PerAdjacentUWHQ_AnnexCost_MRatio = 0.9  -- X% Authority cost to Annex a Village per adjacent UWHeadquarters

- **Distant Profits** (`CB_Smugglers_MissionReward4`)
  - Outpost_TResProd_PerDistanceFromMainBase_Flat = 1 [target: resource=Solari]  -- Gain X X per region separating them from your main base

- **Underworld Roots** (`CB_Smugglers_MissionReward5`)
  - UH_TRes_Cost_MRatio = 0.85 [target: resource=Solari]  -- X% UWHeadquarters X cost
  - UH_TRes_Cost_MRatio = 0.85 [target: resource=Authority]  -- X% UWHeadquarters X cost

- **Underworld Society** (`CB_Smugglers_MissionReward6`)
  - UH_Prod_ARatio = 0.1  -- X% UWHeadquarters resource production

- **Spice Field** (`CB_SpiceField`)
  - TRes_Prod_Flat = 5 [target: resource=Spice]  -- X X

- **The Water Thieves** (`CBattle_DoomedSietch`)

- **The Water Thieves** (`CBattle_DoomedSietch_Host`)

- **The Water Thieves** (`CBattle_DoomedSietch_Smugglers`)
  - TRaid_Block = - [target: raid=IdualisRaids]  -- Cannot be targeted by X
  - AI_TSiegeAction_NoGaugeIncrease = - [target: siegeAction=PillageSietch]  -- Will not do X actions

- **Fremen Uprising** (`CBattle_FremenUprising`)
  - CustomProperty = 2 [target: unit=Battle_FremenInsurgent]  -- Description of a game mechanic not specific to an ATB
  - Block_Trading = -  -- No trading between factions

- **Fremen Uprising** (`CBattle_FremenUprising_HostOnly`)
  - Faction_SpawnTUnitCount_OnNewVillageCapture = 2 [target: unit=Battle_FremenInsurgent]  -- Gain X X on every village you annex for the first time
  - Faction_ApplyTTrait_ToNewVillageCapture = - [target: trait=CB_FremenUprising_VillageTaken]  -- Apply X on every village you annex for the first time

- **Incursion** (`CBattle_Incursion`)
  - Unit_ImportCost_MRatio = 0.5  -- X% units recruitment costs
  - Unit_ImportTime_MRatio = 0.5  -- X% units recruitment time
  - SafeRegen_MRatio = 2  -- X% units regeneration speed
  - Infantry_SafeRegenCost_MRatio = 0.5  -- X% non-mechanical units regeneration costs
  - Mechanical_SafeRegenCost_MRatio = 0.5  -- X% mechanical units regeneration costs
  - TRes_Prod_Flat = -20 [target: resource=CommandPoint]  -- X X

- **The Siege of Arrakeen** (`CBattle_Kill_Atreides`)
  - TRes_Prod_Flat = 10 [target: resource=CommandPoint]  -- X X

- **Shield is down** (`CBattle_Kill_Atreides_ArrakeenNoShield`)
  - Entity_Armor_MRatio = 0  -- X% Armor

- **Invulnerable** (`CBattle_Kill_Atreides_ArrakeenShield`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_Armor_Flat = 60  -- X Armor
  - TAction_IncomingBlock = - [target: action=ArmySiege]  -- Blocks the X action.
  - TAbility_Block = - [target: ability=DefenseSabotage]  -- Blocks the X ability

- **The Siege of Arrakeen** (`CBattle_Kill_Atreides_Defender`)
  - AI_ForceTResProdGoalHigh = 0 [target: resource=CommandPoint]  -- Will aim to produce less than X X

- **The Siege of Arrakeen** (`CBattle_Kill_Atreides_Host`)
  - Unlock_TMission = - [target: mission=CB_MDisableShield]  -- Unlocks the X Mission
  - Block_TMission = - [target: mission=Assassination]  -- Disables the X mission

- **Downfall** (`CBattle_Kill_Corrino`)
  - TRes_Prod_Flat = 10 [target: resource=CommandPoint]  -- X X
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB

- **Downfall** (`CBattle_Kill_Corrino_Defender`)
  - AI_ForceTResProdGoalHigh = 0 [target: resource=CommandPoint]  -- Will aim to produce less than X X

- **Downfall** (`CBattle_Kill_Corrino_Host`)
  - TUnit_OnCouncilVoteWin_MainBaseSpawn = 2 [target: unit=LandsraadDemo_Res]  -- X X appear near $my(MainBase) after supported resolutions pass

- **Downfall** (`CBattle_Kill_Corrino_Host_GetRaided`)
  - TRaid_HostileSpawn_OnMBDestruction = - [target: raid=Kill_Corrino_OnBaseDestroy1]  -- Targeted by X after destroying a main base

- **The Red Exhibition** (`CBattle_Kill_Ecaz`)
  - TRes_Prod_Flat = 10 [target: resource=CommandPoint]  -- X X

- **The Red Exhibition** (`CBattle_Kill_Ecaz_Defender`)
  - AI_ForceTResProdGoalHigh = 0 [target: resource=CommandPoint]  -- Will aim to produce less than X X

- **The Fortress** (`CBattle_Kill_Harkonnen`)
  - TRes_Prod_Flat = 10 [target: resource=CommandPoint]  -- X X

- **The Fortress** (`CBattle_Kill_Harkonnen_Carthag`)

- **The Fortress** (`CBattle_Kill_Harkonnen_CarthagDefended`)

- **The Fortress** (`CBattle_Kill_Harkonnen_CarthagNotDefended`)

- **The Fortress** (`CBattle_Kill_Harkonnen_Defender`)
  - Militia_TrainCost_MRatio = 0  -- X% Militia training cost
  - TBuilding_StockUpkeep_MRatio = 0 [target: building=MissileBattery]  -- X% X Upkeep
  - TBuilding_TRes2_Upkeep_MRatio = 0 [target: building=MissileBattery]  -- X% X X Upkeep
  - AI_ForceTResProdGoalHigh = 0 [target: resource=CommandPoint]  -- Will aim to produce less than X X

- **The Fortress** (`CBattle_Kill_Harkonnen_Host`)

- **Singularity** (`CBattle_Kill_Vernius`)
  - TRes_Prod_Flat = 10 [target: resource=CommandPoint]  -- X X

- **Singularity** (`CBattle_Kill_Vernius_Defender`)
  - AI_ForceTResProdGoalHigh = 0 [target: resource=CommandPoint]  -- Will aim to produce less than X X
  - Development_FreePatentOnResearched = -  -- 

- **Singularity** (`CBattle_Kill_Vernius_Raise`)
  - TRes_Prod_Flat = 1 [target: resource=Knowledge]  -- X X

- **Spice Frenzy** (`CBattle_SpiceFrenzy`)
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - TRes_Max_Flat = 10000 [target: resource=Spice]  -- X max X
  - Trade_TRes_Block = - [target: resource=Spice]  -- Prevents the trading of X with other factions

- **Spice Heist** (`CBattle_SpiceHeist`)
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Trade_TRes_Block = - [target: resource=Spice]  -- Prevents the trading of X with other factions
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **At Emissary Main Base** (`CBattle_SpiceHeist_AtEmissaryMB`)
  - Unit_HasTTrait_GainTTrait2 = - [target: trait=CBattle_SpiceHeist_SpiceFreighter]  -- Units with X gain: X

- **At Emissary Main Base** (`CBattle_SpiceHeist_DisbandAtEmissaryMB`)
  - DisbandOnTimerEnd = -  -- These units will disband at the end of the timer

- **Spice Heist** (`CBattle_SpiceHeist_Emissary`)
  - MainBase_GainTTrait = - [target: trait=CBattle_SpiceHeist_EmissaryMB]  -- The main base gains X

- **Emissary MB** (`CBattle_SpiceHeist_EmissaryMB`)
  - Entity_GiveTTrait_Unit_AtTRange2 = - [target: trait=CBattle_SpiceHeist_AtEmissaryMB]  -- Give X to unit in X

- **Spice Heist** (`CBattle_SpiceHeist_Host`)
  - TRes_Max_Flat = 2000 [target: resource=Spice]  -- X max X

- **Spice Heist** (`CBattle_SpiceHeist_SecondaryHost`)
  - Unlock_TUnit_Authorize = - [target: unit=SpiceFreighter_Host]  -- Allows the training of Xs

- **Spice Freighter** (`CBattle_SpiceHeist_SpiceFreighter`)
  - Army_OnDeath_KillerFaction_TResGain_Flat = 500 [target: resource=Spice]  -- Killing this unit gives X X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_AttackAction = -  -- Interrupts and prevents battles (no icon)

- **Incognito** (`CBattle_SpiceHeist_SpiceFreighterHost`)
  - Untargetable = -  -- This unit cannot be targeted by an attack
  - Block_Disband = -  -- Cannot be disbanded
  - Block_AttackAction = -  -- Interrupts and prevents battles (no icon)

- **Spice Heist** (`CBattle_SpiceHeist_TerritoryOwner`)
  - TSiegeAction_Block = - [target: siegeAction=Annex]  -- Cannot do X actions
  - TSiegeAction_Block = - [target: siegeAction=Liberate]  -- Cannot do X actions

- **The Renegades** (`CBattle_TheRenegades_Fremen`)
  - Block_RenegadesSpawn = -  -- No renegades
  - CustomProperty = - [target: resource=Scraps]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = - [target: building=RecyclingPlant]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Broken Land** (`CT_BrokenLand`)
  - TRes_Prod_MRatio = 1.5 [target: resource=Intel]  -- X% X
  - Faction_Outpost_NumberBaseCost_MRatio = 2  -- Owned Villages Authority penalty to Annex a Village is reduced by X%
  - Outpost_DistanceCost_MRatio = 0.5  -- Distance based Authority costs to Annex a Village are reduced by X%
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - CHOAM_ExchangeTRes_Set = - [target: resource=Intel]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **Populous Basin** (`CT_ImperialBassin`)
  - Faction_Outpost_NumberBaseCost_MRatio = 0.3  -- Owned Villages Authority penalty to Annex a Village is reduced by X%
  - TRes_Prod_MRatio = 1.5 [target: resource=Manpower]  -- X% X
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - CHOAM_ExchangeTRes_Set = - [target: resource=Manpower]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **Mount Idaho Range** (`CT_MountIdaho`)
  - TRes_Prod_MRatio = 1.5 [target: resource=Plascrete]  -- X% X
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - CHOAM_ExchangeTRes_Set = - [target: resource=Plascrete]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **North Pole** (`CT_NorthPole`)
  - Unlock_TBuilding_Authorize = - [target: building=WaterExtractor]  -- Allows for the construction of X
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Faction_Outpost_NumberBaseCost_MRatio = 1.5  -- Owned Villages Authority penalty to Annex a Village is reduced by X%
  - CHOAM_ExchangeTRes_Set = - [target: resource=Water]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **Pasty Mesa** (`CT_PastyMesa`)
  - TRes_SietchProd_Flat = 2 [target: resource=Authority]  -- X X per ally Sietch
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - CHOAM_ExchangeTRes_Set = - [target: resource=Authority]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **Volcanic Range** (`CT_VolcanicRange`)
  - Faction_Outpost_NumberBaseCost_MRatio = 0.8  -- Owned Villages Authority penalty to Annex a Village is reduced by X%
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - CHOAM_ExchangeTRes_Set = - [target: resource=FuelCell]  -- Sell X to the CHOAM rather than Spice
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Block_TMission = - [target: mission=MDecoyThumper]  -- Disables the X mission
  - Block_TMission = - [target: mission=MHiddenThumpers]  -- Disables the X mission
  - TAbility_Block = - [target: ability=WormCalling]  -- Blocks the X ability
  - Block_SpiceExchange_Modifiers = -  -- No Spice trading modifiers
  - TRes_Max_MRatio = 0 [target: resource=Spice]  -- X% max X

- **Legitimate Violence** (`C_Elite_Aramsham_Buff`)
  - Entity_ExecuteTarget_HealthRatioVsTTrait_Flat = 0.1 [target: trait=Traitor]  -- Add X% to the executing Life threshold against units with X

- **Executioner** (`C_Elite_Buff`)
  - desc: This C_Elite is supported by allied units.
  - Entity_ExecuteTarget_HealthRatio_Flat = 0.02  -- Executes enemy units under X% Life

- **Executioner** (`C_Elite_Trait`)
  - Entity_ExecuteTarget_HealthRatio_Flat = 0.05  -- Executes enemy units under X% Life
  - Army_SetTTrait_PerAllyArmyAtTRange2 = - [target: trait=C_Elite_Buff]  -- Gain X for each ally military unit in X

- **Deck Engineers** (`C_Frigate_Buff`)
  - desc: Engineers are busy repairing the ship when not in combat.
  - SafeRegen_AlwaysActive = -  -- This unit can regenerate Life anywhere

- **Inspiration** (`C_Hero_1_AllySwordsman`)
  - desc: This C_Trooper is inspired by C_Hero_1.
  - Entity_Armor_Flat = 1  -- X Armor

- **Unexpected Reinforcements** (`C_Hero_1_Skill`)
  - desc: A princess should always have a solid escort with her.
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Unexpected Reinforcements** (`C_Hero_1_Skill_Buff`)

- **Beloved Princess** (`C_Hero_1_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=C_Hero_1_FactionBuff_1]  -- Faction gains X
  - CustomProperty = 1 [target: trait=C_Hero_1_FactionBuff_2]  -- Description of a game mechanic not specific to an ATB
  - Army_HandleSubTUnits_Count = 2 [target: unit=C_LazaTiger]  -- Generate X over time, up to X at once.
  - AllyArmiesAndSelf_AtTRange2_GainTTrait = - [target: trait=C_Hero_1_AllySelector]  -- Other ally Military Units and this Unit at X gain X (xX max)
  - CustomProperty = 1  -- Description of a game mechanic not specific to an ATB
  - Army_GainTTraitStacks_PerGroundSelfUnit_AtTRange2 = - [target: trait=C_Hero_1_Buff]  -- Gain X for each owned ground military unit in X

- **Killing Flow** (`C_Hero_2_Buff`)
  - desc: C_Hero_2 has entered his combat trance.
  - Entity_Power_Flat = 1  -- X Power

- **Aramsham's Discipline** (`C_Hero_2_SardaukarBuff`)
  - desc: This C_Elite is under direct command of C_Hero_2.
  - Entity_ExecuteTarget_MinHealthRatio_Flat = 0.25  -- Execution thresholds are always at least X% Life
  - Entity_OnKill_InstigatorGainTTrait_InCombat = - [target: trait=C_Hero_2_Buff]  -- Instigator gains X when this unit deals the killing blow to an enemy and for the rest of combat

- **Finishing Move** (`C_Hero_2_Skill`)
  - desc: This fight has lasted long enough.
  - Entity_ExecuteTarget_MinHealthRatio_Flat = 0.5  -- Execution thresholds are always at least X% Life
  - CustomProperty_Inverted = 1  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Hand of the Emperor** (`C_Hero_2_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=C_Hero_2_FactionBuff]  -- Faction gains X
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=C_Hero_2_AllySelector]  -- Other ally Military Units at X gain X (xX max)
  - Entity_SetTTraitStacks = 1 [target: trait=C_Hero_2_SardaukarBuff]  -- Gain X stacks of X (xX max)
  - CustomProperty = 0.25  -- Description of a game mechanic not specific to an ATB
  - Entity_OnKill_GainTTrait_InCombat = - [target: trait=C_Hero_2_Buff]  -- Units gain X upon dealing the killing blow to an enemy and for the rest of combat

- **Protection Support** (`C_Trooper_Trait_Buff`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=C_Trooper_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Charismatic** (`Charismatic`)
  - AgtAtb_TResProd_PerInfiltrationLvl_ARatio = 0.02 [target: resource=Influence]  -- X global production is increased by X% per Infiltration level in the current field

- **Choam Branch** (`ChoamBranch_Trait`)
  - CHOAM_SolariRate_Flat = 0.8  -- X Spice exchange rate

- **Deep Reserve** (`Convert_Water_Conso`)
  - TRes_Prod_Flat_NoBoost = -10 [target: resource=Water]  -- X X

- **Deep Reserve** (`Convert_Water_Prod`)
  - TRes_Prod_Flat_NoBoost = 10 [target: resource=Water]  -- X X

- **Hegemony Bonus 10k** (`Corrino_HegemonyBonus2`)
  - CustomProperty = 50 [target: trait=Corrino_HegemonyBonus2_DestroyedMB]  -- Description of a game mechanic not specific to an ATB
  - Entity_SetTTraitStacks = 1 [target: trait=Corrino_HegemonyBonus2_WarSource]  -- Gain X stacks of X (xX max)
  - Entity_KillTruceTerritoryLoot_TRes_Flat = 15 [target: resource=Influence]  -- Gain X X on kills in the territory of a faction in truce.

- **Analytical Machine** (`DataAnalysisUnit`)
  - AgtAtb_ResProd_ARatio = 1  -- This agent produces X% more resources
  - AgtAtb_NoInfiltrationIncrease = -  -- Does not count for Infiltration levels
  - AgtAtb_NoCount = -  -- Does not count in the max Agents count
  - AgtAtb_NoCapture = -  -- This agent cannot be captured
  - AgtAtb_NoDismiss = -  -- This agent cannot be dismissed
  - AgtAtb_NoSietchAssign = -  -- Cannot be assigned on Sietchs
  - AgtAtb_OnlyChosenTrait = -  -- This agent cannot have extra traits

- **Dune Kinship** (`DesertMastery`)
  - desc: DeepDeserts provide cover to this unit.
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Army_DailySupplyDrain_ARatio = -2  -- X% daily Supply drain
  - Unit_DD_NoSpeedLoss = -  -- Speed not reduced by DeepDeserts

- **Easy Difficulty** (`Difficulty_Easy`)
  - TAbility_Cost_MRatio = 1 [target: ability=Shuttle]  -- X% X cost
  - MilitaryUnits_VibrationGeneration_MRatio = 1  -- X% Sandworm attraction speed
  - Unit_ImportTime_MRatio = 1  -- X% units recruitment time
  - Army_TResUpkeep_MRatio = 0.8 [target: resource=Solari]  -- X% Military Unit X Upkeep
  - Army_TResUpkeep_MRatio = 0.8 [target: resource=Manpower]  -- X% Military Unit X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.8 [target: resource=Solari]  -- X% Building_Villages X Upkeep
  - Building_TRes_Upkeep_MRatio = 1 [target: resource=Manpower]  -- X% Building_Villages X Upkeep
  - TRes_Prod_MRatio = 1 [target: resource=Solari]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Plascrete]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Manpower]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Water]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Authority]  -- X% X
  - TRes_Prod_MRatio = 0.8 [target: resource=Intel]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Influence]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Knowledge]  -- X% X
  - TRes_Gain_MRatio = 1 [target: resource=Standing]  -- X% X gains
  - Hegemony_MRatio = 0.8  -- X% Hegemony gains
  - Army_Power_MRatio = 1  -- X% Military Units Power
  - Army_Life_ARatio = 0  -- X% Military Unit Life
  - TUnit_ImportCost_MRatio = 1 [target: unit=A_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=H_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=S_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=F_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=C_Ornithopter]  -- X% X recruitment costs

- **Hard Difficulty** (`Difficulty_Hard`)
  - TAbility_Cost_MRatio = 1 [target: ability=Shuttle]  -- X% X cost
  - MilitaryUnits_VibrationGeneration_MRatio = 1  -- X% Sandworm attraction speed
  - Unit_ImportTime_MRatio = 0.8  -- X% units recruitment time
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Military Unit X Upkeep
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Military Unit X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Building_Villages X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Building_Villages X Upkeep
  - TRes_Prod_MRatio = 1.1 [target: resource=Solari]  -- X% X
  - TRes_Prod_MRatio = 1.1 [target: resource=Plascrete]  -- X% X
  - TRes_Prod_MRatio = 1.2 [target: resource=Manpower]  -- X% X
  - TRes_Prod_MRatio = 1.05 [target: resource=Water]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Authority]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Intel]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Influence]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Knowledge]  -- X% X
  - TRes_Gain_MRatio = 1 [target: resource=Standing]  -- X% X gains
  - Hegemony_MRatio = 1  -- X% Hegemony gains
  - Army_Power_MRatio = 1.05  -- X% Military Units Power
  - Army_Life_ARatio = 0.05  -- X% Military Unit Life
  - TUnit_ImportCost_MRatio = 1 [target: unit=A_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=H_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=S_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=F_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=C_Ornithopter]  -- X% X recruitment costs

- **Insane Difficulty** (`Difficulty_Insane`)
  - TAbility_Cost_MRatio = 1 [target: ability=Shuttle]  -- X% X cost
  - MilitaryUnits_VibrationGeneration_MRatio = 1  -- X% Sandworm attraction speed
  - Unit_ImportTime_MRatio = 0.7  -- X% units recruitment time
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Military Unit X Upkeep
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Military Unit X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Building_Villages X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Building_Villages X Upkeep
  - TRes_Prod_MRatio = 1.3 [target: resource=Solari]  -- X% X
  - TRes_Prod_MRatio = 1.3 [target: resource=Plascrete]  -- X% X
  - TRes_Prod_MRatio = 1.3 [target: resource=Manpower]  -- X% X
  - TRes_Prod_MRatio = 1.1 [target: resource=Water]  -- X% X
  - TRes_Prod_MRatio = 1.2 [target: resource=Authority]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Intel]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Influence]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Knowledge]  -- X% X
  - TRes_Gain_MRatio = 1 [target: resource=Standing]  -- X% X gains
  - Hegemony_MRatio = 1  -- X% Hegemony gains
  - Army_Power_MRatio = 1.1  -- X% Military Units Power
  - Army_Life_ARatio = 0.1  -- X% Military Unit Life
  - TUnit_ImportCost_MRatio = 1 [target: unit=A_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=H_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=S_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=F_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=C_Ornithopter]  -- X% X recruitment costs

- **Medium Difficulty** (`Difficulty_Medium`)
  - TAbility_Cost_MRatio = 1 [target: ability=Shuttle]  -- X% X cost
  - MilitaryUnits_VibrationGeneration_MRatio = 1  -- X% Sandworm attraction speed
  - Unit_ImportTime_MRatio = 0.9  -- X% units recruitment time
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Military Unit X Upkeep
  - Army_TResUpkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Military Unit X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Solari]  -- X% Building_Villages X Upkeep
  - Building_TRes_Upkeep_MRatio = 0.7 [target: resource=Manpower]  -- X% Building_Villages X Upkeep
  - TRes_Prod_MRatio = 1 [target: resource=Solari]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Plascrete]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Manpower]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Water]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Authority]  -- X% X
  - TRes_Prod_MRatio = 0.8 [target: resource=Intel]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Influence]  -- X% X
  - TRes_Prod_MRatio = 1 [target: resource=Knowledge]  -- X% X
  - TRes_Gain_MRatio = 1 [target: resource=Standing]  -- X% X gains
  - Hegemony_MRatio = 1  -- X% Hegemony gains
  - Army_Power_MRatio = 1  -- X% Military Units Power
  - Army_Life_ARatio = 0  -- X% Military Unit Life
  - TUnit_ImportCost_MRatio = 1 [target: unit=A_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=H_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=S_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=F_Ornithopter]  -- X% X recruitment costs
  - TUnit_ImportCost_MRatio = 1 [target: unit=C_Ornithopter]  -- X% X recruitment costs

- **Infiltration Mastery** (`DrisqPassive`)
  - Orni_GainTTrait = - [target: trait=PiterPassive_Ornithopter]  -- Ornithopters gain X
  - Infiltration_MinLevel = 1  -- Infiltration levels cannot be lower than X

- **Drone** (`Drone_Trait`)
  - desc: Drone_Trait are hovering machines piloted remotely.
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - CustomProperty = 0  -- Description of a game mechanic not specific to an ATB
  - TTrait_Block = - [target: trait=Ranged_Debuff]  -- Disables the effects of X

- **Loyal** (`DuncanPassive_Loyal`)
  - desc: This Village is impressed by Duncan's fairness.
  - Outpost_StockUpkeep_MRatio = 0.9  -- X% Upkeep on Villages
  - Militia_TrainDuration_MRatio = 0.9  -- X% Militia training time
  - CustomProperty = 0.95  -- Description of a game mechanic not specific to an ATB
  - Militia_TrainCost_MRatio = 0.9  -- X% Militia training cost
  - AdjacentRegionsNeutralVillages_GainTTrait = - [target: trait=DuncanPassive_LoyalAdjacent]  -- Neutral Villages in the Region and its neighbors gain X (xX max): X

- **Edge of Death** (`Dying_Trait`)
  - desc: This H_Soldier is barely alive. He is still fighting only through drug-induced reflex, and will collapse soon.
  - Entity_LifeDecay_Flat = -0.6  -- X% Life per day
  - DisbandOnTimerEnd = -  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Nobility** (`E_Elite_Trait`)
  - Unit_SetTTraitStacks_PerNearbyInfantryAlly_ExceptTUnit2 = - [target: trait=E_Elite_Trait_Buff]  -- Gain X per other non-mechanical allied unit nearby that is not X

- **E_Elite_Trait_Buff** (`E_Elite_Trait_Buff`)
  - Entity_Armor_Flat = 1  -- X Armor

- **War Anthem** (`E_Frigate_WarAnthem`)
  - desc: An upbeat battle song, reminding everyone of the superiority of Ecaz-longname.
  - Entity_GiveTTrait_ATRange2_SelfHumans = - [target: trait=E_Frigate_WarAnthem_Buff]  -- Gives X to X ally humans
  - TAbility_Block = - [target: ability=EFrigate_WarAnthem]  -- Blocks the X ability

- **Follower** (`E_HelpfulEntourage_Trait`)
  - Army_RegenOutsideCombatHasSupply_Flat = 0.5  -- Recover X% Life per day outside combat as long as Supply is not empty

- **Whitmore's Training** (`E_Hero_1_ChampionBuff`)
  - desc: This TEcazChampion has taken part in E_Hero_1's exclusive training sessions.
  - Entity_SetStacksTTrait_PerTTrait2Stacks = - [target: trait=E_Hero_1_ChampionBuff_PerTrophy]  -- Gain X stack per X stack

- **Whitmore's Training** (`E_Hero_1_ChampionBuff_PerTrophy`)
  - Entity_Life_ARatio = 0.01  -- X% max Life

- **Legendary Swordmaster** (`E_Hero_1_FactionBuff`)
  - Faction_ExtraEcazChampion_Flat = 2  -- Can apply EcazChampion on X more units
  - Unit_HasTTrait_GainTTrait2 = - [target: trait=TEcazChampion]  -- Units with X gain: X

- **Frightful Champion** (`E_Hero_1_Skill`)
  - desc: Honor only gets you so far. Sometimes E_Hero_1 can surprise his enemies with dishonorable tactics.
  - Entity_SetStacksTTrait_PerTTrait2Stacks = - [target: trait=E_Hero_1_SkillBuff]  -- Gain X stack per X stack
  - CustomProperty_Inverted = 1  -- Description of a game mechanic not specific to an ATB

- **Frightful Champion** (`E_Hero_1_SkillBuff`)
  - Entity_Power_Flat = 1  -- X Power
  - Entity_Armor_Flat = 0.5  -- X Armor

- **Legendary Swordmaster** (`E_Hero_1_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=E_Hero_1_FactionBuff]  -- Faction gains X
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = - [target: trait=E_Hero_1_ChampionBuff_PerTrophy]  -- Description of a game mechanic not specific to an ATB

- **Saving Grace** (`E_Hero_2_Skill_Buff`)
  - desc: E_Hero_2 has taken precaution to escape death.
  - Army_SpawnTUnit_WithHealthRatio_OnDeath = 0.05 [target: unit=E_Hero_2]  -- Spawn X on Rally Point with X% Life

- **Thorny Rose** (`E_Hero_2_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=E_Hero_2_FactionBuff]  -- Faction gains X
  - Army_OnDeathInOwnTerritory_KillerFaction_TResLoss_Flat = 50 [target: resource=Standing]  -- Other faction loses X X when they kill this unit that is on its territory
  - Entity_GiveTTrait_ATRange2_SelfUnits = - [target: trait=E_Hero_2_UnitBuff]  -- Gives X owned units at X
  - CustomProperty = 0.03  -- Description of a game mechanic not specific to an ATB

- **Ilesa's Charm** (`E_Hero_2_UnitBuff`)
  - Entity_SetTTraitStacks_PerAdjacentMasterpiece = - [target: trait=E_Hero_2_UnitBuff_Stacks]  -- Gain stack of X per Masterpiece in adjacent Villages

- **Ilesa's Charm** (`E_Hero_2_UnitBuff_Stacks`)
  - desc: This unit is defending Masterpieces on E_Hero_2's orders.
  - Unit_Damage_ARatio = 0.03  -- Attacks deal X% damage

- **Lured** (`E_Ship_Trait_Debuff`)
  - desc: This unit is being distracted by E_Ship attacks.
  - Unit_Damage_MRatio = 0.85  -- Attacks deal X% damage
  - Entity_OnAttack_LoseTTrait = - [target: trait=E_Ship_Trait_Debuff]  -- All stacks of X are lost when attacking

- **Thunder** (`E_Soldier_Trait`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=E_Soldier_Debuff]  -- The target is X (xX max): X

- **Crusher** (`E_Trooper_Trait`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=E_Trooper_Debuff]  -- The target is X (xX max): X

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

- **Ecaz_Eligible_Sanctuary** (`Ecaz_Eligible_Sanctuary`)
  - Outpost_EligibleSanctuary = -  -- 

- **Ecaz_Faction1** (`Ecaz_Faction1`)
  - TRes_OnCouncilVoteEnd_Flat = 300 [target: resource=Solari]  -- X X after every Council

- **Hegemony Bonus 5k** (`Ecaz_HegemonyBonus1`)
  - Unlock_TAbility = - [target: ability=EcazPride]  -- Unlocks the X Ability
  - Unlock_TAbility = - [target: ability=EcazChampion]  -- Unlocks the X Ability

- **Hegemony Bonus 10k** (`Ecaz_HegemonyBonus2`)
  - TRes_ProdPerTRes2Stocks_ARatio = 0.002 [target: resource=Solari]  -- Gain X% of your X as X
  - FreeVotes_Resolution_Flat = 30  -- X free votes on all resolutions

- **Ecaz_Masterpiece_Built** (`Ecaz_Masterpiece_Built`)
  - TRes_Quantity_Flat = 5000 [target: resource=Solari]  -- Gain X X

- **Perfected** (`Ecaz_PerfectRecruit`)
  - desc: This unit has been through a thorough formation process, making them a perfect representant of Ecaz art of warfare.
  - Entity_Life_MRatio = 1.2  -- X% max Life
  - Entity_Power_MRatio = 1.2  -- X% Power
  - Army_Scale_ARatio = 0.05  -- These unit is X% taller
  - Infantry_SafeRegenCost_MRatio = 2  -- X% non-mechanical units regeneration costs
  - Mechanical_SafeRegenCost_MRatio = 2  -- X% mechanical units regeneration costs

- **Sanctuary** (`Ecaz_Sanctuary`)
  - desc: This Village is under the protection of Ecaz-longname.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = 1  -- Description of a game mechanic not specific to an ATB
  - AdjacentRegionsVillages_GainTTrait = - [target: trait=Ecaz_Sanctuary_Neighbors]  -- Villages in the Region and its neighbors gain X (xX max): X
  - TAbility_Block = - [target: ability=PeacefullyAnnex]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=DeployMainBase]  -- Blocks the X ability
  - Outpost_EstablishedSanctuary = -  -- 
  - Entity_Untargetable_NotForTFaction = - [target: faction=Ecaz]  -- This entity cannot be targeted by an attack except for X
  - Block_Militia_Slot = -  -- No Militia slot available

- **Ecaz_SanctuaryEligibility** (`Ecaz_SanctuaryEligibility`)
  - Outpost_SurroundedByTFaction_GainTTrait_Reveal = - [target: faction=Ecaz]  -- 

- **Sanctuary Radiance** (`Ecaz_Sanctuary_Neighbors`)
  - desc: This Village is neighbor to a Ecaz_Sanctuary.
  - Village_TraitStack_Flat = 1  -- Effects of SpecificityVillage are applied X more times

- **Ecaz_UnlockTestBuilding** (`Ecaz_UnlockTestBuilding`)
  - desc: Unlock Masterpiece on truce

- **Ecaz_Village1** (`Ecaz_Village1`)
  - AdjacentRegionsNeutralVillages_GainTTrait = - [target: trait=Ecaz_Village2]  -- Neutral Villages in the Region and its neighbors gain X (xX max): X
  - AdjacentTerritoryEnemyVillages_GainTTrait = - [target: trait=Ecaz_Village2]  -- Enemy Villages neighboring your territory gain X

- **Ecaz_Village2** (`Ecaz_Village2`)
  - Outpost_Cost_MRatio_PerDay = 0.99  -- X% Authority cost per day to Annex a Village

- **Ecaz_Village3** (`Ecaz_Village3`)
  - Res_Prod_ARatio = 0.03  -- X% resource production

- **Elacca Fog** (`ElaccaFog`)
  - desc: The Elacca drug from Ecaz forests is used in gladiator shows to inhibit self-preservation. During war time, it can be deployed as a thick fog to get the same effect.
  - Human_InCombat_Uncontrollable = -  -- In combat, non-mechanical units cannot be controlled

- **Engineer** (`Engineer`)
  - AgtAtb_TResProd_PerInfiltrationLvl_ARatio = 0.02 [target: resource=Plascrete]  -- X global production is increased by X% per Infiltration level in the current field

- **Fremen Oppression** (`F_Demo_Buff`)
  - desc: Benefits from targeting a weakened enemy.
  - Entity_Power_Flat = 1  -- X Power

- **Fremen Oppression** (`F_Demo_Trait`)
  - Unit_Damage_PerUnitInAoE_ARatio = 0.2  -- Attacks deal X% damage per unit in the area of attack

- **Against the Odds** (`F_Elite_Buff`)
  - desc: Fighting emboldens this unit.
  - Entity_Power_ARatio = 0.1  -- X% Power
  - Entity_Armor_Flat = 1  -- X Armor

- **Heavy Hitter** (`F_Elite_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_Attacks_IgnoreArmor_MRatio = 0.5  -- This unit's attacks ignore X% enemy Armor

- **Spice Sifter** (`F_Harvester_Mobile_Trait`)
  - CustomProperty = - [target: ability=ChangeToHarvTent]  -- Description of a game mechanic not specific to an ATB
  - TTrait_Block = - [target: trait=SpiceSilos_Trait_Fremen]  -- Disables the effects of X
  - TTrait_Block = - [target: trait=Temple_Trait]  -- Disables the effects of X

- **Spice Sifter** (`F_Harvester_Trait`)
  - CustomProperty = - [target: ability=ChangeToHarvCaravan]  -- Description of a game mechanic not specific to an ATB
  - TTrait_Block = - [target: trait=OtheymPassive_Army]  -- Disables the effects of X
  - TTrait_Block = - [target: trait=MilitaryBase_Trait]  -- Disables the effects of X
  - TRes_Prod_MRatio = 0.8 [target: resource=Spice]  -- X% X

- **Chani's Ambush** (`F_Hero_1_Skill_Fake`)
  - desc: This unit is part of an ambush planned by F_Hero_1.
  - CustomProperty = 2 [target: trait=F_Hero_1_Skill_UnitBuff]  -- Description of a game mechanic not specific to an ATB

- **Chani's Ambush** (`F_Hero_1_Skill_UnitBuff`)
  - desc: This unit is part of an ambush planned by F_Hero_1.
  - Army_FirstAttackPower_Bonus_ARatio = 1  -- X% Power on first attack
  - Entity_OnAttack_LoseTTraitStack = 1 [target: trait=F_Hero_1_Skill_UnitBuff]  -- X stack of X is lost with each attack

- **Chani's Silent Walk** (`F_Hero_1_UnitBuff_NotDetected`)
  - desc: This unit is currently hidden.
  - Entity_Speed_ARatio = 0.4  -- X% Speed
  - Unit_NoVibrations = -  -- No Sandworm attraction

- **Coordinated Strikes** (`F_Hero_2_Skill`)
  - desc: A small coordinated force can appear much larger by constantly harassing the enemy.
  - Entity_GiveTTrait_ATRange2_SelfGroundUnits = - [target: trait=F_Hero_2_Skill_Buff1]  -- Gives X owned ground armies at X
  - CustomProperty = 8  -- Description of a game mechanic not specific to an ATB

- **Coordinated** (`F_Hero_2_Skill_Buff1`)
  - desc: This unit follows F_Hero_2 coordination tactic.
  - Unit_Damage_ARatio = 0.2  -- Attacks deal X% damage
  - Entity_DamageReceived_MRatio = 0.8  -- X% damage received

- **Weakness** (`F_Sneak_Debuff`)
  - desc: Sustains extra damage in combat because of the disruption of a F_Sneak.
  - Entity_DamageReceived_ARatio = 0.2  -- X% damage received

- **Former Smugglers** (`FormerSmugglers`)
  - desc: Some old smugglers elected to retire and settle in this village, each with talents that could prove highly beneficial for those who know how to use them...
  - Pillage_Gain_ARatio = 0.1  -- X% resources from pillaging Villages and Sietchs

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

- **Fremen Agents** (`FremenAgents`)
  - desc: This Sietch has many contacts and its own Agents spread out in the area.
  - Mission_Cost_MRatio = 0.8  -- X% spying mission costs
  - Mission_PreparationTime_MRatio = 0.8  -- X% mission preparation time

- **Fremen Brotherhood** (`FremenBrotherhood`)
  - desc: An exchange of valuable men is a traditionnal way to seal an alliance in the Fremen society.
  - Structure_Agt_Gain_WithTTrait = 2 [target: trait=FremenSibling]  -- Gain X new Agent with the X trait
  - Agt_DisbandAgentWith_TTrait_OnEnd = - [target: trait=FremenSibling]  -- 

- **Fremen Sibling** (`FremenBrotherhood_Agent`)
  - AgtAtb_NoCapture = -  -- This agent cannot be captured
  - AgtAtb_NoDismiss = -  -- This agent cannot be dismissed
  - TRes_Prod_Flat = 2 [target: resource=Authority]  -- X X

- **Fremen Scientists** (`FremenScientists`)
  - desc: This Sietch develops its own specialist technologies.
  - TRes_Prod_Flat = 4 [target: resource=Knowledge]  -- X X

- **Fremen Sibling** (`FremenSibling`)
  - AgtAtb_NoCapture = -  -- This agent cannot be captured
  - AgtAtb_NoDismiss = -  -- This agent cannot be dismissed
  - AgtAtb_TResProd_ARatio = 0.05 [target: resource=Intel]  -- This agent produces X% more X
  - AgtAtb_NoCount = -  -- Does not count in the max Agents count

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

- **Active Furnace** (`Furnace_Trait_Harvester`)
  - desc: A nearby ExperimentalAlloyFurnace_Fremen increases the production of this F_Harvester.
  - Harvester_Prod_ARatio = 0.3  -- X% Spice gathering rate

- **Active Furnace** (`Furnace_Trait_Harvester_Vernius`)
  - desc: A nearby ExperimentalAlloyFurnace increases the production of this V_Harvester.
  - Harvester_Prod_ARatio = 0.3  -- X% Spice gathering rate

- **Greed Mode** (`Greedy_Harvester`)
  - desc: Spice is too precious to leave it in the sand. We'll continue working until the last minute.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Harvester_WormNearby_Prod_MRatio = 2  -- X% Spice gathering rate when Sandworms roam nearby

- **Weapon Master** (`GurneyPassive_LevelupStack`)
  - Unit_Armor_Flat = 1  -- X Armor on units

- **Weapon Master** (`GurneyPasssive`)
  - Army_GainTTrait_PerXp = 50 [target: trait=GurneyPassive_Army]  -- Each X Experience they gain X
  - MilitaryUnit_XPLevel_GainTTraitStack = - [target: trait=GurneyPassive_LevelupStack]  -- Each XP level grants a stack of X

- **Maimed** (`H_Demo_Debuff`)
  - desc: Received shrapnel fires from H_Demo.
  - Army_HealthRegen_MRatio = 0.5  -- X% regeneration speed

- **Bloodthirsty** (`H_Elite_Buff`)
  - desc: Exalted by death and blood.
  - Entity_Power_Flat = 1  -- X Power

- **Bloodthirsty** (`H_Elite_Trait`)
  - DeathAtTRange2_InCombat_GainTTrait = - [target: trait=H_Elite_Buff]  -- Gain X when any unit dies at X range while in combat

- **Bloodthirsty** (`H_Elite_Trait_Old`)
  - CustomProperty = 50 [target: trait=H_Elite_Buff]  -- Description of a game mechanic not specific to an ATB
  - NearbyDeath_InCombat_GainTTrait = - [target: trait=H_Elite_Buff]  -- Gain X when any unit dies nearby while in combat
  - NearbyDeath_InCombat_GainHealthFlat = 50  -- While in combat, any nearby unit death heals X Life

- **Decimation Protocols** (`H_Frigate_Buff_Old`)
  - desc: Drones calibrated to the H_Frigate in the area receive an electrical surge that overcharge their weapons, but damage the drone circuits.
  - Army_SubUnits_GenerationSpeed_ARatio = 1  -- Sub units are generated X% faster
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=H_Frigate_Drones_Buff]  -- Ally Drones in X gain X

- **Decimation Protocols** (`H_Frigate_Drones_Buff`)
  - desc: This Drone is overcharged by the H_Frigate.
  - Entity_Power_ARatio = 0.5  -- X% Power
  - Entity_LifeDecay_Flat = -0.5  -- X% Life per day

- **Gladiator Drug** (`H_Hero_1_Skill`)
  - desc: H_Hero_1 uses a psychedelic cocktail that temporarily turns his bodyguards into frenzied zombies.
  - Entity_GiveTTrait_ATRange2_SelfHumans = - [target: trait=H_Hero_1_Skill_Buff]  -- Gives X to X ally humans
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Drugged** (`H_Hero_1_Skill_Buff`)
  - desc: This unit suffer the debilitating effect of H_Hero_1 drug cocktail.
  - Uncontrollable = -  -- Cannot be controlled

- **Unbridled Order** (`H_Hero_1_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=H_Hero_1_FactionBuff]  -- Faction gains X
  - Entity_GiveTTrait_ATRange2_SelfUncontrollableUnits = - [target: trait=H_Hero_1_AllyBuff]  -- Gives X to owned uncontrollable units at X range
  - Entity_GainStackTTrait_PerUncontrolledSelfUnit_AtTRange2 = - [target: trait=H_Hero_1_SelfBuff]  -- Gains X stack per uncontrolled owned unit at X range

- **Cannon Fodder** (`H_Hero_2_Skill`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_LifeDecay_Flat = -0.5  -- X% Life per day

- **Cannon Fodder** (`H_Hero_2_Skill_AlmostBuff`)
  - CustomProperty = 0 [target: trait=H_Hero_2_Skill_Buff]  -- Description of a game mechanic not specific to an ATB

- **Cannon Fodder** (`H_Hero_2_Skill_Buff`)
  - desc: This unit has been marked for the fodder by H_Hero_2.
  - NoCombat_GainTTrait = - [target: trait=H_Hero_2_Skill]  -- Gain X outside combat
  - NoSafeRegen = -  -- This unit cannot safe regen
  - Army_ExperienceGain_MRatio = 0  -- X% Experience gains
  - TRes_Upkeep_MRatio = 0 [target: resource=Solari]  -- X% X Upkeep
  - TRes_Upkeep_MRatio = 0 [target: resource=CommandPoint]  -- X% X Upkeep
  - MilitaryUnit_InCombat_OnDeathRefund_ARatio = 0.5  -- X% of Military Units costs are refunded upon death while in combat

- **Survival of The Fittest** (`H_Hero_2_Skill_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Drugged** (`H_Hero_2_UnitDeath`)
  - Unit_OnDeath_Instigator_InCombat_GainTTraitStack = - [target: trait=H_Hero_2_UnitDeath_Buff]  -- Instigator gain stack of X per unit dying

- **Evasion Tactics** (`H_Ship_Buff`)
  - desc: Increases its Speed and Power when Life is low.
  - Army_Power_ARatio = 0.3  -- X% Military Unit Power
  - Army_Speed_ARatio = 0.3  -- X% Military Unit Speed

- **Evasion Tactics** (`H_Ship_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_ExecuteTarget_HealthPoint_Flat = 80  -- Executes enemy units under X Life

- **Sadistic** (`H_Soldier_Trait`)
  - Unit_CurrentTarget_OnDamageInfantry_ApplyTTrait = - [target: trait=H_Soldier_Trait_Debuff]  -- Non-mechanical targets suffer X (xX max)

- **Hive** (`H_Sting_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_LifeDecay_Flat = -0.4  -- X% Life per day
  - NoSafeRegen = -  -- This unit cannot safe regen

- **Berserkers** (`H_Trooper_Trait`)
  - Entity_AttackSpeedByMissingHealth_ARatio = 0.3  -- Gain up to X% attack speed depending on missing Life

- **Hardworkers** (`HardWorkers`)
  - desc: Love to work, and you'll never be out of things to do.
  - Res_Prod_ARatio_ExceptTRes = 0.1 [target: resource=Spice]  -- X% resource production except for X
  - Zone_Owned_Harvester_Prod_ARatio = 0.1  -- X% Spice gathering rate for $my(harvester) in owned zones

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

- **Hegemony Bonus 5k** (`Harkonnen_HegemonyBonus_1`)
  - Pillage_TResPostGain_Flat = 50 [target: resource=Intel]  -- Gain X X by pillaging a Village
  - Faction_OnInfantryKill_OtherFactionUnit_SpawnTTraitAgent = 20 [target: trait=Brainwashed]  -- Each X enemy non-mechanical unit killed, receive an Agent with X trait

- **Hegemony Bonus 10k** (`Harkonnen_HegemonyBonus_2`)
  - Operation_SacrificeUsed_ChanceNotConsumed = -  -- Give a chance to not consume an operation on which sacrifice has been used when launching it
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=IField]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=ISpaceGuild]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=IChoam]  -- X Agent slot in X
  - Agt_InfiltrationSlot_Flat = 1 [target: infiltration=ILandsraad]  -- X Agent slot in X

- **Harvester Power Cell** (`HarvesterOvercharge`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TRes_Upkeep_Flat = 1 [target: resource=FuelCell]  -- X X Upkeep

- **Hero** (`Hero_Trait`)
  - desc: Some exceptionnal individuals shape the lives of everyone around them, for good and bad.
  - Entity_ExecuteImmune = -  -- Cannot be Executed
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Cannon Fodder** (`IakinPassive_LevelupStack`)
  - desc: This unit has yet to prove their worth to Iakin Nefud.
  - NoSafeRegen = -  -- This unit cannot safe regen
  - MilitaryUnit_OnDeathRefund_ARatio = 0.5  -- X% of Military Units costs are refunded upon death

- **IgnoreWormsign** (`IgnoreWormsign`)

- **Imperial Disapproval** (`ImperialTax_Fail`)
  - desc: You have failed to pay the $my(contract). The Emperor does not approve of your work on Arrakis.
  - CHOAM_SolariRate_Flat = -0.1  -- X Spice exchange rate

- **Imperial Satisfaction** (`ImperialTax_Success`)
  - desc: You have successfully paid the $my(contract). The Emperor approves of your work on Arrakis.
  - CHOAM_SolariRate_Flat = 0.1  -- X Spice exchange rate

- **Counterintelligence Agents** (`Infiltration_Counterintel`)
  - EnemyAgt_DailyCaptureChance_Flat = 0.01  -- X% daily chance to capture an enemy Agent assigned on a $my(faction)-shortname slot
  - AgtCounterIntel_OperationDetection_Base = 0.1  -- X% chance to detect an operation
  - AgtCounterIntel_OperationAgentCapture_Base = 0.1  -- X% chance to capture an Agent on operation detection
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Counterintelligence Agents Hegemony Bonus** (`Infiltration_Counterintel_HegeBonus`)
  - Agt_StealChanceWhenCaptured = 0.1 [target: trait=Brainwashed]  -- X% chance every day to convert captured Agents

- **Arrakis Agents** (`Infiltration_Field`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Ingenious Mind** (`IngeniousMind`)
  - desc: Early worm catches the bird, and the whole harvester with it. To make a profit on Arrakis, you want to be even earlier than that.
  - CustomProperty = 0.2 [target: domain=Economy]  -- Description of a game mechanic not specific to an ATB
  - TBuilding_Values_ARatio = 0.2 [target: building=PlascreteFactory]  -- X% X resource production
  - TBuilding_Values_ARatio = 0.2 [target: building=DewCollector]  -- X% X resource production
  - TBuilding_Values_ARatio = 0.2 [target: building=WindTrap]  -- X% X resource production
  - TBuilding_Values_ARatio = 0.2 [target: building=ProcessingPlant]  -- X% X resource production
  - TBuilding_Values_ARatio = 0.2 [target: building=Marketplace]  -- X% X resource production
  - TBuilding_Values_ARatio = 0.2 [target: building=WaterExtractor]  -- X% X resource production
  - Zone_Owned_Harvester_Prod_ARatio = 0.2  -- X% Spice gathering rate for $my(harvester) in owned zones

- **Information Market** (`IntelBrokerPassive`)
  - Trade_GainInfiltrationLevelInFaction_Flat = 0.1  -- When trading with a faction, gain X Infiltration level with this faction
  - Infiltration_InFaction_DecreaseSpeed_MRatio = 0.5  -- X% Infiltration level in faction decrease speed
  - TRes_ProdPerInfiltrationLevels_Flat = 15 [target: resource=Solari]  -- X X per Infiltration level
  - TRes_ProdPerInfiltrationLevels_Flat = 1 [target: resource=Influence]  -- X X per Infiltration level
  - CustomProperty = - [target: trait=IntelBrokerPassive_Fake]  -- Description of a game mechanic not specific to an ATB

- **Sand Killers** (`JamisPassive`)
  - VillageLiberation_TRes_Flat = 70 [target: resource=Authority]  -- X X when liberating a Village
  - Army_OutsideTerritory_GainTTrait = - [target: trait=JamisPassive_Army]  -- Military units outside $my(faction) territory gain X
  - CustomProperty = 0.1  -- Description of a game mechanic not specific to an ATB
  - Convert_Authority_To_Manpower = 30  -- Ability to convert Authority to Manpower

- **Sand Killers** (`JamisPassive_Army`)
  - desc: This unit is trained by Jamis and performs better on the offensive.
  - Unit_Damage_ARatio = 0.1  -- Attacks deal X% damage

- **Kanly** (`Kanly_Global`)
  - TRes_Prod_MRatio = 2 [target: resource=Authority]  -- X% X
  - TSiegeAction_NeutralVillage_Duration_MRatio = 0.5 [target: siegeAction=Annex]  -- X% X action duration on neutral villages
  - Capture_Duration_MRatio = 0.5  -- X% duration of PeacefullyAnnex
  - Sietch_RevealScore_Gains_ARatio = 1  -- X% Sietch detection speed
  - Sietch_RelationGains_ARatio = 1  -- X% relation gain with Sietch
  - TRes_Prod_MRatio = 2 [target: resource=Agent]  -- X% X
  - Agt_EscapeChance_MRatio = 2  -- X% chances for your agent to escape while imprisoned by an enemy faction
  - TRes_Prod_MRatio = 1.5 [target: resource=Plascrete]  -- X% X
  - Infiltration_IncreaseSpeed_MRatio = 2  -- X% Infiltration level increase speed
  - Infiltration_DecreaseSpeed_MRatio = 2  -- X% Infiltration level decrease speed
  - Mission_PreparationTime_MRatio = 0.5  -- X% mission preparation time
  - Charters_AvailabilityVal_MRatio = 0.5  -- X% charter availability conditions
  - Army_ExperienceGain_MRatio = 1.5  -- X% Experience gains
  - TRes_Gain_MRatio = 1.5 [target: resource=Standing]  -- X% X gains
  - TRes_Loss_MRatio = 1.5 [target: resource=Standing]  -- X% X losses
  - TRes_Gain_MRatio = 1.5 [target: resource=Thumper]  -- X% X gains
  - TRes_Prod_MRatio = 2 [target: resource=Knowledge]  -- X% X
  - Building_ConstructionSpeed_MRatio = 2  -- X% Building_Villages construction speed
  - Contract_CostMultiplier_Pow = 1.5  -- X% $my(contract) demand growth speed
  - MainBase_GainTTrait = - [target: trait=Kanly_MainBase]  -- The main base gains X
  - Unit_ImportTime_MRatio = 0.5  -- X% units recruitment time

- **Kanly** (`Kanly_MainBase`)
  - Entity_Armor_MRatio = 1  -- X% Armor
  - Entity_Life_MRatio = 0.5  -- X% max Life
  - Building_ConstructionSpeed_MRatio = 1.5  -- X% Building_Villages construction speed

- **Water Merchant** (`LingarPassive`)
  - TRes_Prod_Flat = 12 [target: resource=Water]  -- X X
  - Unlock_TBuilding_Authorize = - [target: building=WaterNetwork]  -- Allows for the construction of X
  - Unlock_TBuilding_Authorize = - [target: building=WaterSeller]  -- Allows for the construction of X

- **Hunter** (`Mercenaries_Buff`)
  - desc: A well-executed contract.
  - Entity_Power_ARatio = 0.1  -- X% Power
  - Entity_Armor_Flat = 1  -- X Armor

- **Merchant** (`Merchant`)
  - AgtAtb_TResProd_PerInfiltrationLvl_ARatio = 0.005 [target: resource=Solari]  -- X global production is increased by X% per Infiltration level in the current field

- **Natural Artwork** (`MesaPassive_Stack`)
  - desc: The natives are impressed by the Masterpieces left behind by Mesa
  - Village_TSiegeAction_Duration_MRatio = 0.85 [target: siegeAction=Annex]  -- X% X action duration
  - Village_TSiegeAction_Duration_MRatio = 0.85 [target: siegeAction=Liberate]  -- X% X action duration
  - Village_TSiegeAction_Duration_MRatio = 0.85 [target: siegeAction=Pillage]  -- X% X action duration

- **MilitaryBase_ZoneTrait** (`MilitaryBase_ZoneTrait`)
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=MilitaryBase_AdjacentZoneTrait]  -- This Region and its neighbors gain X (xX max): X

- **Unwavering** (`Militia_Elite_Trait`)
  - Unit_Power_MalusImmunity = -  -- This unit is not affected by Power penalties

- **Hireling** (`NoHealthRegen`)
  - desc: This unit has been hired to do a job.
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Ornithopter Support** (`OrniSupport_Harv`)
  - desc: An Ornithopter is providing support to this Harvester.
  - Harvester_Allow_SafeMode = -  -- Allows the use of safe mode
  - Harvester_WormEatChance_MRatio = 0.6  -- X% less chance to be eaten by Sandworms
  - Worm_InstantDetection = -  -- Instantly detects Sandworms

- **Ornithopter** (`Orni_Fremen_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Sand Killers** (`OtheymPassive`)
  - Army_Speed_ARatio = 0.1  -- X% Military Unit Speed
  - Army_NoNearbyAlly_GainTTrait = - [target: trait=OtheymPassive_Army]  -- Gain X when no ally entity are nearby

- **Sand Killers** (`OtheymPassive_Army`)
  - desc: Organized and trained by Otheym to set up surgical strikes and destabilize the opponent.
  - Entity_Power_ARatio = 0.25  -- X% Power
  - Entity_DamageReceived_ARatio = -0.25  -- X% damage received

- **Outcast Leader** (`Outcast_Leader_Trait`)
  - Entity_EnemyFightingArmies_ApplyTTrait = - [target: trait=F_Trooper_Debuff]  -- Enemy units engaged in combat with this unit suffer X (xX max): X
  - Unit_Fight_GainTTraitPerEngaged = - [target: trait=F_Elite_Buff]  -- Gain X for each enemy unit in combat with this unit

- **Outcasts** (`Outcast_Trait`)
  - Entity_EnemyFightingArmies_ApplyTTrait = - [target: trait=F_Trooper_Debuff]  -- Enemy units engaged in combat with this unit suffer X (xX max): X

- **Padded Shielding** (`PaddedShielding`)
  - desc: Padded armor and hulls help dissipate kinetic and thermal energy from explosive and incendiary weapons.
  - Entity_DamageReceived_FromAoe_MRatio = 0.5  -- X% area damage received
  - Entity_Armor_Flat = -1  -- X Armor

- **Shadow Engines** (`PiterPassive`)
  - Agt_SacrificeUsed_DecreaseOperationCost_MRatio = 0.85  -- Each sacrificed Agent permanently reduces their mission costs by X%
  - Faction_GainTRes_OnAgtSacrifice_PerTRes2 = 60 [target: resource=Solari]  -- Sacrificing an Agent gives X X per X

- **Infiltration Mastery** (`PiterPassive_Ornithopter`)
  - desc: Drisq modified this Ornithopter for efficient scouting in the heart of the enemy territory.
  - NoCombat_GainTTrait = - [target: trait=Camouflage]  -- Gain X outside combat
  - Unit_Speed_ARatio = 0.5  -- X% unit Speed
  - Recon_Speed_ARatio = 0.5  -- X% Recon speed of Points of Interest

- **Plunderers** (`Plunderers`)
  - desc: Turning might into profit requires skills and cold pragmatism.
  - TRes_ProdPerTDomain2Building_Flat = 3 [target: resource=Solari]  -- X X per X Building_Village

- **Brace for the Sandstorm** (`Q_BraceForStorm`)
  - Sandstorm_ReduceEffects_Bonus = -  -- Your units and structures are more resilient to Sandstorm

- **Spice Plunder** (`Q_SpicePlunder`)
  - TRes_Max_Flat = 1 [target: resource=Thumper]  -- X max X

- **Spice Plunder** (`Q_SpicePlunder2`)
  - TUnit_ImportCost_MRatio = 0.8 [target: unit=F_Sneak]  -- X% X recruitment costs

- **Fremen Technology Blueprint** (`Q_StealUnit_Fremen`)
  - desc: Help from the Bene Tleilax enabled your engineers to replicate complex technology from Fremen-longname.
  - Unlock_TUnit_Force = - [target: unit=F_Special]  -- Allows the training of Xs

- **Smugglers Technology Blueprint** (`Q_StealUnit_Smugglers`)
  - desc: Help from the Bene Tleilax enabled your engineers to replicate complex technology from Smugglers-longname.
  - Unlock_TUnit_Force = - [target: unit=S_Drone]  -- Allows the training of Xs

- **The Investors** (`Q_TheArchitect3`)
  - CHOAM_SolariRate_Flat = 0.3  -- X Spice exchange rate

- **Deep Desert** (`R_DeepDesert`)
  - Army_DailySupplyDrain_ARatio = 2  -- X% daily Supply drain
  - Unit_DD_GroundSpeed_MRatio = 0.8  -- X% ground units Speed

- **Imperial Basin** (`R_ImperialBasin`)
  - desc: The Imperial Basin is a Region protected from Sandworm thanks to its natural features. It is also one of the most populated in the planet.
  - TBuilding_Values_ARatio = 1 [target: building=RecruitmentOffice]  -- X% X resource production
  - Region_HegemonyProd_Flat = 1000  -- X Hegemony

- **Polar Sink** (`R_Pole`)
  - desc: The north pole of Arrakis is the only place where water can be found in significant quantities, although in frozen form.
  - Unlock_TBuilding_Authorize = - [target: building=WaterExtractor]  -- Allows for the construction of X
  - Region_HegemonyProd_Flat = 1000  -- X Hegemony

- **Shield Wall** (`R_ShieldWall`)
  - desc: The Shield Wall is a natural barrier that protects the surrounding land from Sandstorm, making it one of the safest places on Arrakis
  - Building_StockUpkeep_MRatio = 0.5  -- X% Building_Villages Upkeep
  - Region_HegemonyProd_Flat = 1000  -- X Hegemony

- **TheDesolation** (`R_TheDesolation`)
  - desc: This harsh desert area is even more dangerous and unwelcoming than the rest of the planet. Life here simply cannot be sustained.
  - Army_DailySupplyDrain_ARatio = 4  -- X% daily Supply drain
  - Unit_Ground_LifeDecay_Flat = -0.4  -- Ground units lose X% Life per day
  - Unit_GroundSpeed_MRatio = 0.6  -- X% ground units Speed

- **Worm Nest** (`R_WormNest`)
  - desc: The high activity of Sandworm in this region makes it very difficult to practice, but its spice field is especially prolific.
  - MilitaryUnits_VibrationGeneration_ARatio = 0.5  -- Ground Military Units attract Sandworm X% faster
  - Harvester_Prod_ARatio = 0.25  -- X% Spice gathering rate
  - Region_HegemonyProd_Flat = 1000  -- X Hegemony

- **Heavy Hand** (`RabbanPassive`)
  - Militia_Slot_Flat = 1  -- X Militia slot
  - Entity_KillRebelsLoot_TRes_Flat = 50 [target: resource=Solari]  -- Gain X X upon killing Rebels
  - TUnit_GainTTrait2 = - [target: unit=BrainwashedRebel]  -- Xs gain X

- **RaidSmugglers** (`RaidSmugglers`)
  - TRes_StealProd_MRatio = 1 [target: resource=Plascrete]  -- X% of X is stolen
  - TRes_StealProd_MRatio = 1 [target: resource=Solari]  -- X% of X is stolen
  - TRes_StealProd_MRatio = 1 [target: resource=Water]  -- X% of X is stolen
  - TRes_StealProd_MRatio = 1 [target: resource=Spice]  -- X% of X is stolen

- **Raiders** (`Raider_Trait`)
  - Entity_EnemyFightingArmies_ApplyTTrait = - [target: trait=F_Trooper_Debuff]  -- Enemy units engaged in combat with this unit suffer X (xX max): X

- **Renegades Drone** (`Renegade_Drone_Trait`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=Renegade_Drone_Trait_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Renegade Leader** (`Renegade_Leader_Trait`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=Renegade_Leader_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Renegades Ship** (`Renegade_Ship_Trait`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=Renegade_Ship_Trait_Buff]  -- Other ally Military Units at X gain X (xX max)
  - CustomProperty = 0.2  -- Description of a game mechanic not specific to an ATB

- **Renegades** (`Renegade_Trait`)
  - NearbyDeath_InCombat_GainHealthFlat = 30  -- While in combat, any nearby unit death heals X Life

- **Repairing** (`Repairing`)
  - SafeRegen_AlwaysActive = -  -- This unit can regenerate Life anywhere

- **Controlled Markets** (`Res_ControlledMarkets`)
  - CHOAM_SolariRate_Flat = -1  -- X Spice exchange rate

- **Imperial Intelligence** (`Res_ImperialIntelligence`)
  - Block_InfiltrationCell = -  -- Cannot be targetted by InfiltrationCells
  - CellSearchAvailable = -  -- CellSearch mission is available even when no assassination is detected
  - TMission_Cost_MRatio = 0.5 [target: mission=CellSearch]  -- X% X mission cost

- **Foreign Recruitment** (`Res_MilitaryService`)
  - MilitaryUnits_TResImportCost_MRatio = 0.5 [target: resource=Manpower]  -- X% X recruitment costs
  - Infantry_SafeRegenCost_MRatio = 0.5  -- X% non-mechanical units regeneration costs

- **Water Regulation** (`Res_WaterRegulation`)
  - TRes_ProdPerVillageOwned_Flat = -1 [target: resource=Authority]  -- X X per controlled Village

- **Water Seller's Union** (`Res_WaterSellerUnion`)
  - TRes_ProdPerNetTRes2Prod_Flat = 2 [target: resource=Solari]  -- X X per positive X

- **Water Subsidies** (`Res_WaterSubsidies`)
  - TRes_Prod_Flat = 20 [target: resource=Water]  -- X X
  - Faction_OutpostZoneWithTTrait_Cost_MRatio = 0 [target: trait=R_Pole]  -- X% Authority cost to Annex a Village with X

- **Water Subsidies** (`Res_WaterSubsidies_NorthPole`)
  - Faction_Outpost_Cost_MRatio = 0  -- X% Authority cost to Annex a Village

- **Swordmaster Teacher** (`RivvyPassive`)
  - Army_MaxLevel_GainTTrait = 1 [target: trait=RivvyPassive_Buff]  -- At max level, gain X
  - Army_SpawnExperienceLevel_Flat = 1  -- Military Units start with X more Experience level

- **Swordmaster Teacher** (`RivvyPassive_Buff`)
  - TRes_Upkeep_MRatio = 0 [target: resource=Solari]  -- X% X Upkeep

- **No hostile sietches** (`Rule_NoHostileSietch`)
  - NoRaidSpawn = -  -- No Raid will originate from this Sietch
  - Entity_NoVibration_Radius = 100  -- No Sandworms are attracted around this

- **Spice contracts are disabled** (`Rule_NoSpiceContract`)
  - Block_SpiceReport = -  -- No Spice reports and contracts

- **Spice cannot be exchanged** (`Rule_NoSpiceSystem`)
  - Block_SpiceExchange = -  -- No Spice trading

- **Loot Distributor** (`S_Drone_Trait`)
  - EnemyDeathAtTRange2_Closest_GainTTrait = 1 [target: trait=S_Drone_Buff]  -- Closest unit with X gain X(xX max) whenever an enemy unit dies at X range
  - Unit_NearOwnedVillage_LoseTTraitStack_TResGain_PerStack = 75 [target: trait=S_Drone_Buff]  -- Near owned Village lose all stacks of X and gain X X per lost stack

- **Easy Target** (`S_Elite_Buff`)
  - desc: This unit's target has barely any Armor.
  - Entity_Power_MRatio = 1.5  -- X% Power

- **Easy Target** (`S_Elite_Trait`)
  - Entity_FightTarget_ArmorUnderEqual_GainTTrait = 3 [target: trait=S_Elite_Buff]  -- X while target having at most X Armor

- **Toxic Gases** (`S_Frigate_Trait`)
  - CustomProperty = - [target: trait=S_Frigate_Debuff]  -- Description of a game mechanic not specific to an ATB
  - Entity_GiveTTrait_AtTRange2_Humans_AtWar = - [target: trait=S_Frigate_Debuff]  -- X Military Units in War gain X (xX max)
  - Unit_Attack_EnemyUnitMaxHealthDamage_ARatio = 0.006  -- Attacks deal X% of their target's max Life on hit
  - CustomProperty = - [target: trait=S_Frigate_Buff]  -- Description of a game mechanic not specific to an ATB
  - Entity_Immune_Deficit = -  -- 

- **Cutting Costs** (`S_Hero_1_Skill_Buff`)
  - desc: With enough planning, S_Hero_1 reduces drastically the cost of operations.
  - ArmyGiveTTrait_Zone = - [target: trait=S_Hero_1_Skill_ZoneBuff]  -- The region gains X

- **Cutting Costs** (`S_Hero_1_Skill_ZoneBuff`)
  - Operation_InstigatorZone_NotConsumed = -  -- Operation is not consumed if launched on the instigator's zone
  - Operation_InstigatorZone_EndTAbility = - [target: ability=S_Hero_1_Skill]  -- End X if any operation is launched on the instigator's zone

- **Street Urchins** (`S_Hero_2_Skill`)
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=S_Hero_2_Skill_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Weapons Delivery** (`S_Hero_2_Skill_Buff`)
  - Entity_Power_ARatio = 0.2  -- X% Power

- **Street Urchins** (`S_Hero_2_Skill_Fake`)
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB

- **Thug Leader** (`S_Hero_2_UHBuff`)
  - UH_Self_CanRegenUnits_VillageNotInCombat = -  -- Regenerates Life of nearby owned units when the Village is not in combat
  - UH_Self_CanResupply_VillageNotInCombat = -  -- Refills Supply of nearby owned units when the Village is not in combat

- **Silent Hunter** (`S_Ship_Trait`)
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=S_Ship_Debuff]  -- The target is X (xX max): X

- **Sacrificed Agent** (`SacrificedAgent`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Mission_Cost_TRes_MRatio = 0.7 [target: resource=Solari]  -- X% mission X cost
  - Mission_Cost_TRes_MRatio = 0.7 [target: resource=Intel]  -- X% mission X cost
  - Mission_PreparationTime_MRatio = 0  -- X% mission preparation time
  - Operation_NoDetection = -  -- This operation can't be detected
  - Agt_NoCapture = -  -- No agent can be captured on this mission

- **SafeRegen** (`SafeRegen`)

- **Safe Mode** (`Safe_Harvester`)
  - desc: We can always get more Spice. We're not leaving any men for that monster.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Harvester_AutoRecall = -  -- This Harvester will automatically be recalled upon danger.
  - Harvester_WormEatChance_MRatio = 0  -- X% less chance to be eaten by Sandworms

- **Native Reservation** (`SanyaPassive_Stack`)
  - desc: Sanya works with the inhabitants of Ecaz_Sanctuarys to develop the local economy.
  - TRes_Prod_Flat = 15 [target: resource=Solari]  -- X X
  - TBuilding_Cost_MRatio = 0.6 [target: building=Masterpiece_Eco]  -- X% X construction costs
  - TBuilding_Cost_MRatio = 0.6 [target: building=Masterpiece_Military]  -- X% X construction costs
  - TBuilding_Cost_MRatio = 0.6 [target: building=Masterpiece_StateCraft]  -- X% X construction costs

- **Full Stock** (`Scavenger`)
  - Army_HealthRegen_ARatio = 0.5  -- X% health regeneration

- **Watermaster** (`ShimoomPassive`)
  - Faction_SetTTraitStacks_PerVillageProducingTRes2 = 12 [target: trait=ShimoomPassive_Effect]  -- Villages producing at least X X gain X
  - Outpost_TResProd_PerEmptySlot_Flat = 1 [target: resource=Water]  -- X X per empty slot in Villagess

- **Watermaster** (`ShimoomPassive_Effect`)
  - TRes_Upkeep_MRatio = 0.96 [target: resource=Solari]  -- X% X Upkeep
  - TRes_Prod_Flat = 4 [target: resource=Plascrete]  -- X X

- **Ship** (`Ship_Trait`)
  - desc: Ship are manned craft used to harass ground units. While their importance in warfare cannot be understated, they cannot replace boots on the ground.
  - NoDiscoveryInvestigation = -  -- Cannot investigate Discoverys
  - NoVillageInvestigation = -  -- Cannot investigate Villages
  - NoOccupation = -  -- Cannot occupy Villages nor contest their occupation
  - NoVillageSiege = -  -- Cannot initiate Village ArmySieges
  - NoSietchSiege = -  -- Cannot initiate Sietch ArmySiegeSietchs
  - Entity_VillageBuildingsAttack_Block = -  -- Cannot target Village Building_Village
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - CustomProperty = 0  -- Description of a game mechanic not specific to an ATB

- **Slave Trade** (`SlavemasterPassive`)
  - Object_TTrait_FromInitReplaceWith_TTrait2 = - [target: trait=TOppression]  -- Replaces X by X
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB
  - Outpost_OnTAbilityStart_TRes2Gain_PerEmptySlot_Flat = 2 [target: ability=Oppression]  -- When starting X, gain X X for each empty Building_Village slots
  - Entity_KillRebelsLoot_TRes_Flat = 50 [target: resource=Solari]  -- Gain X X upon killing Rebels

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

- **Hegemony Bonus 5k** (`Smugglers_HegemonyBonus1`)
  - Unlock_TResAction = - [target: resAction=Bounty]  -- Allows using X on Landsraad resolutions
  - Allow_Landsraad = 50  -- You gain 50 CouncilVotes at the Landsraad
  - TRes_Prod_Flat = 50 [target: resource=CouncilVote]  -- X X

- **Hegemony Bonus 10k** (`Smugglers_HegemonyBonus2`)
  - AllEnemyMainBases_Add_MBUWHeadquarters = -  -- Build a MBUWHeadquarters in every enemy Main Base
  - Unlock_TInformation = - [target: information=MainBaseDistricts]  -- Unlocks X information
  - Pillage_Gain_ARatio = 0.5  -- X% resources from pillaging Villages and Sietchs

- **Spice Smuggling** (`SmugglingCenter_FakeTrait`)
  - desc: Spice smuggling is running rampant in this village
  - CustomProperty = 0.8  -- Description of a game mechanic not specific to an ATB

- **Spice Smuggling** (`SmugglingCenter_Trait`)
  - desc: Spice smuggling is running rampant in this village
  - Harvester_Prod_MRatio = 0.8  -- X% $my(harvester) gathering rate

- **SpacingGuild's Blackmail** (`SpacialGuildBribe_Fail`)
  - desc: You have failed to pay the $my(contract). The SpacingGuild is considering lifting the ban on weather satellites, sapping your authority among the Fremen.
  - TRes_Prod_Flat = -1 [target: resource=Authority]  -- X X

- **Spice Silos** (`SpiceSilos_Trait`)
  - desc: Nearby SpiceSilos help with local Spice production.
  - Harvester_Prod_ARatio = 0.2  -- X% Spice gathering rate

- **Spice Silos** (`SpiceSilos_Trait_Fremen`)
  - desc: Nearby SpiceSilos help with local Spice production.
  - Harvester_Prod_ARatio = 0.2  -- X% Spice gathering rate

- **Unrest** (`StabilityLow`)
  - desc: This Village suffers from unrest. You need more Water or Authority to avoid rebellion.
  - Res_LocalProd_MRatio = 0.8  -- X% local production

- **Unrest** (`StabilityLow_Forced`)
  - desc: Because of Mother Ramallo's RamalloPassive and your proximity with the Fremen, this Village suffers from unrest. It will rebel soon.
  - Res_LocalProd_MRatio = 0.8  -- X% local production

- **Fremen Alliance** (`StilgarPassive`)
  - OnStart_NearestSietches_MakeVisible = 12  -- Start with the nearest Sietch revealed
  - TRes_Prod_Flat = 1 [target: resource=Authority]  -- X X

- **Fremen Alliance** (`StilgarPassive_Village`)
  - Outpost_StockUpkeep_MRatio = 0.8  -- X% Upkeep on Villages

- **Sandstorm** (`Storm_Army`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -0.05  -- X% Life per day when away from supply sources
  - Entity_Speed_MRatio = 0.7  -- X% Speed
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Army_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path. FremenCommand let you pass the storm unharmed.
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Building`)
  - Building_RegenSpeed_ARatio = -1  -- X% Village Building_Villages repair speed

- **Sandstorm** (`Storm_Building_Reduced`)
  - Building_RegenSpeed_ARatio = -1  -- X% Village Building_Villages repair speed

- **Sandstorm** (`Storm_Entity`)
  - IsInStorm = -  -- This is in a sandstorm

- **Sandstorm** (`Storm_Frigate`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -0.2  -- X% Life per day when away from supply sources
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Frigate_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_Speed_ARatio = 0.5  -- X% Speed
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Harvester`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Harvester_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path. FremenCommand let you pass the storm unharmed.
  - Entity_Cloaked = -  -- Cannot be seen outside of combat
  - MilitaryUnits_VibrationGeneration_MRatio = 0  -- X% Sandworm attraction speed
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_MainBase`)

- **Sandstorm** (`Storm_MainBase_Reduced`)

- **Sandstorm** (`Storm_Ornithopter`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -1  -- X% Life per day when away from supply sources
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Ornithopter_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -1  -- X% Life per day when away from supply sources
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Ship`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -1  -- X% Life per day when away from supply sources
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Ship_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Unit_HealthRegen_NoResupply_Penalty_Flat = -1  -- X% Life per day when away from supply sources
  - Entity_Armor_Flat = -3  -- X Armor
  - Entity_VisionRange_Flat = 0  -- Vision is reduced

- **Sandstorm** (`Storm_Village`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Building_ConstructionSpeed_MRatio = 0  -- X% Building_Villages construction speed
  - Building_Construction_Disable = -  -- Cannot construct Building_Villages
  - Block_BuildingDestruction = -  -- Cannot destroy buildings
  - Block_BuildingProgression = -  -- 
  - Entity_VisionRange_Flat = 0  -- Vision is reduced
  - Structure_NoMilitiaTraining = -  -- 
  - Outpost_No_Rebellion = -  -- This Village will never rebel
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TBuilding_Disable = - [target: building=MissileBattery]  -- Disables X
  - TBuilding_Disable = - [target: building=Airfield]  -- Disables X
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TAbility_Block = - [target: ability=AddExtensionSlot]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Oppression]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=DevelopmentInvestment]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=DeployMainBase]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=HastenBuilding]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=InstallUWHeadquarter]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=PeacefullyAnnex]  -- Blocks the X ability

- **Bracing for the storm** (`Storm_Village_Brace`)
  - Sandstorm_VillageBraceEffects = -  -- Your village won't be damaged by Sandstorms
  - Res_LocalProd_MRatio = 0.5  -- X% local production

- **Sandstorm** (`Storm_Village_Reduced`)
  - desc: Wind can blow at seven hundred kilometers an hour inside Arrakis' Sandstorm, ripping anything in its path.
  - Building_ConstructionSpeed_MRatio = 0  -- X% Building_Villages construction speed
  - Building_Construction_Disable = -  -- Cannot construct Building_Villages
  - Block_BuildingDestruction = -  -- Cannot destroy buildings
  - Block_BuildingProgression = -  -- 
  - Entity_VisionRange_Flat = 0  -- Vision is reduced
  - Structure_NoMilitiaTraining = -  -- 
  - Outpost_No_Rebellion = -  -- This Village will never rebel
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TBuilding_Disable = - [target: building=MissileBattery]  -- Disables X
  - TBuilding_Disable = - [target: building=Airfield]  -- Disables X
  - TBuilding_Disable = - [target: building=Refinery]  -- Disables X
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TAbility_Block = - [target: ability=AddExtensionSlot]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Oppression]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=DevelopmentInvestment]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=DeployMainBase]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=HastenBuilding]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=InstallUWHeadquarter]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=PeacefullyAnnex]  -- Blocks the X ability

- **Suk Doctor** (`SukDoctor`)
  - AgtAtb_TResProd_PerInfiltrationLvl_ARatio = 0.05 [target: resource=Knowledge]  -- X global production is increased by X% per Infiltration level in the current field

- **Adaptative Shield** (`TAdaptativeShield`)
  - desc: A device monitoring the health of the soldier is connected to an armor that can seal itself and deliver first care, preserving the life of its wearer.
  - Entity_GainTTrait_AtHealthRatio = 0.3 [target: trait=TAdaptativeShield_Buff]  -- Gain X under X% Life

- **Adaptative Shield** (`TAdaptativeShield_Buff`)
  - Entity_Armor_Flat = 3  -- X Armor
  - Entity_Power_Flat = -3  -- X Power

- **Storm Sails** (`TAdditionalSails_Altar`)
  - desc: Going with the flow instead of fighting it is the key to surviving the storms of Arrakis.
  - Sandstorm_ReduceEffects_Bonus = -  -- Your units and structures are more resilient to Sandstorm
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB

- **Aegis of the Underworld Missile Battery Combo Change** (`TAegisOfTheUnderworld_MissileBatteryComboChange`)
  - Entity_Replace_TCombo_Index = 0 [target: combo=MissileBattery_Missiles_Chemical]  -- Gains a new way to attack

- **Ambush Camouflage** (`TAmbushCamouflage_Buff`)
  - NoCombat_GainTTrait = - [target: trait=Camouflage]  -- Gain X outside combat
  - Army_Supply_Protected = -  -- This unit will not lose Supply
  - Unit_NoVibrations = -  -- No Sandworm attraction
  - Army_FirstAttack_Cloaked_ApplyTTrait = - [target: trait=TAmbushCamouflage_Debuff]  -- Attacks from stealth apply: X

- **Analysis Tools** (`TAnalysisTools`)
  - desc: A drone replacing some of its weaponry with scopes and lenses will provide valuable Intel to its pilot.
  - Entity_EliminateLoot_TRes_Flat = 2 [target: resource=Intel]  -- Gain X X participating in a kill
  - Army_Power_Flat = -2  -- X Power

- **Anatomical Scanner** (`TAnatomicalScanner`)
  - desc: Organic entities generally have hidden weaknesses based on their evolved internal organization.
  - Unit_DamageVsNonMechanical_ARatio = 0.15  -- X% damage against non-mechanical units

- **Anti-personnel Shrapnels** (`TAntiPersonalShrapnels`)
  - desc: Adding small bits of metal all around the grenades will naturally produce shrapnel that stays inside the body and causes constant pain and bleeding.
  - Unit_DamageVsNonMechanical_ARatio = 0.1  -- X% damage against non-mechanical units

- **Arrakis Secrets** (`TArrakisSecrets_Buff`)
  - SafeRegen_AlwaysActive = -  -- This unit can regenerate Life anywhere
  - Army_Supply_Regain_OutsideCombat = -  -- Regain Supply outside combat

- **Stealth Gear** (`TAssassinArmor`)
  - desc: It is easy to hide without moving, but remaining hidden in movement on a planet like Arrakis... That's a proper challenge.
  - Entity_Cloaked = -  -- Cannot be seen outside of combat

- **Atreides Foremen** (`TAtreidesForemen_Buff`)
  - desc: An experienced crew works faster for an increased yield of Spice.
  - Harvester_Prod_MRatio = 1.15  -- X% $my(harvester) gathering rate

- **Veteran Militia** (`TAtreidesOfficer`)
  - desc: Protected inside Atreides-adjective borders.
  - Entity_DamageReceived_MRatio = 0.85  -- X% damage received

- **Automatic Weapons** (`TAutomaticWeapons`)
  - desc: Semi-automatic weapons use the excess energy of a discharge to load the next bullet in the chamber, allowing the user to fire again immediately.
  - Entity_AttackSpeed_MRatio = 1.5  -- X% attack speed
  - Army_Power_MRatio = 0.7  -- X% Military Units Power

- **Battlefield Frenzy** (`TBattlefieldFrenzy`)
  - desc: Sardaukars' sense of duty shines brighter on major battlefront, when they are surrounded by many supporting levies.
  - Army_AttackSpeed_PerAllyUnit_AtTRange_ARatio = 0.01 [target: range=Medium_Range]  -- X% attack speed per allied unit at X

- **Disable Shield** (`TCB_DisableShield_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Camouflage Fabric** (`TCamouflageFabric`)
  - desc: Fremen are experts at staying unseen in the desert. Even a kulon can be hidden at the right place.
  - NoCombat_GainTTrait = - [target: trait=Camouflage]  -- Gain X outside combat

- **Chasing Stance** (`TChasingStance`)
  - desc: When pursuing an enemy, tiring them down is easier than being fast.
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=TChasingStance_Debuff]  -- The target is X (xX max): X

- **Combat Drugs** (`TCombatDrugs_Armies`)
  - desc: Some drugs and chemical compounds can significantly enhance combat efficiency at the cost of a reduced lifespan.
  - Army_HealthDecayPerDay_Flat = -0.1  -- X% Life per day
  - Army_Speed_ARatio = 0.1  -- X% Military Unit Speed
  - Unit_Damage_ARatio = 0.3  -- Attacks deal X% damage
  - Army_HealthRegen_MRatio = 0  -- X% regeneration speed

- **Confusing Tactics** (`TConfusingTactics`)
  - desc: In a war, soldiers generally prefer to keep their friends on one side and their enemies on the other, which is not always easy with slippery opponents.
  - Entity_SetTTrait_PerEnemyUnit_AtTRange2 = - [target: trait=TConfusingTactics_Buff]  -- Gain X per enemy unit at X (xX max)

- **Cover Tactics** (`TCoverTactics_Buff`)
  - desc: This unit is covered by a A_Elite.
  - Entity_Speed_ARatio = 0.3  -- X% Speed
  - Entity_Armor_Flat = 5  -- X Armor

- **Crossfire Tactics** (`TCrossfireTactics`)
  - desc: Attacking the same enemy carefully from two sides makes it difficult for them to react, without causing friendly fire.
  - Unit_AllySameFightTarget_GainTTrait = - [target: trait=TCrossfireTactics_Buff]  -- Ally Military Units attacking the same target gain X (xX max)
  - CustomProperty = 0.1 [target: trait=TCrossfireTactics_Buff]  -- Description of a game mechanic not specific to an ATB
  - Entity_AttackSpeed_MRatio = 0.9  -- X% attack speed

- **Awake The People** (`TCrowdManipulation_All`)
  - desc: Fremen-longname have rallied the locals to defy the oppressive foreigners

- **Awake The People** (`TCrowdManipulation_Rebels`)
  - desc: Fremen-longname have rallied the locals to defy the oppressive foreigners
  - Entity_Power_ARatio = 0.1  -- X% Power
  - Entity_Life_ARatio = 0.1  -- X% max Life

- **Awake The People** (`TCrowdManipulation_Zone`)
  - desc: Fremen-longname have rallied the locals to defy the oppressive foreigners

- **Skirmish Gear** (`TCrysKnives`)
  - desc: The effect of surprise is often decisive in an evenly matched fight.
  - Entity_EnemyFightingArmies_ApplyTTrait = - [target: trait=TCrysKnives_Debuff]  -- Enemy units engaged in combat with this unit suffer X (xX max): X
  - Army_Power_Flat = -1  -- X Power

- **Disruptive Ammunition** (`TDisruptiveAmmunition`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=TDisruptiveAmmunition_Debuff]  -- The target is X (xX max): X
  - Entity_Power_Flat = -2  -- X Power

- **Fractal Frequencies** (`TDisruptiveField`)
  - desc: By applying various fractal frequencies to the Holtzman Coil, its electrostatic field becomes even more lethal.
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB
  - Entity_GiveTTrait_AllyGroundMechanical_AtTRange2 = - [target: trait=TDisruptiveField_Buff]  -- Give X to ally mechanical unit in X
  - Entity_SetTTraitStacks = 1 [target: trait=TDisruptiveField_Buff]  -- Gain X stacks of X (xX max)
  - TRes_Upkeep_Flat = 2 [target: resource=FuelCell]  -- X X Upkeep

- **Distortion Umbrella** (`TDistorsionUmbrella`)
  - desc: Holographic technology cannot offer true protection, but it can direct image distortions to make targeting more difficult.
  - Entity_GiveTTrait_AllyUnit_AtTRange2 = - [target: trait=TDistorsionUmbrella_Buff]  -- Give X to ally unit in X
  - Entity_SetTTraitStacks = 1 [target: trait=TDistorsionUmbrella_Buff]  -- Gain X stacks of X (xX max)

- **Distracting Flashes** (`TDistractingFlashes`)
  - desc: An array of strong lights flashing randomly makes it very unpleasant to fire on a target, or anything close from it.
  - Entity_GiveTTrait_AllyUnit_AtTRange2 = - [target: trait=TDistractingFlashes_Buff]  -- Give X to ally unit in X
  - Entity_SetTTraitStacks = 1 [target: trait=TDistractingFlashes_Buff]  -- Gain X stacks of X (xX max)

- **Dry Training** (`TDryTraining`)
  - desc: The Fremen can train themselves to resist even better in the dry desert.
  - Army_Life_PerTRes = 1 [target: resource=Water]  -- X Military Unit Life per X

- **Dual Swords** (`TDualSwords`)
  - desc: Wielding two swords leads to a more aggressive posture. It's also quite impressive.
  - Army_Power_Flat = 4  -- X Power
  - Entity_Armor_Flat = -2  -- X Armor

- **Champion** (`TEcazChampion`)
  - desc: Ecaz-longname has declared this unit as Champion. Their prestige and popularity are now linked.
  - Entity_Life_MRatio = 1.2  -- X% max Life
  - Entity_Power_MRatio = 1.2  -- X% Power
  - Entity_Armor_Flat = 2  -- X Armor
  - Entity_ExecuteImmune = -  -- Cannot be Executed
  - Unit_EcazChampion = -  -- 
  - Army_Scale_ARatio = 0.05  -- These unit is X% taller
  - Army_OnEliminateFactionUnit_GainTTrait = - [target: trait=TEcazChampion_Buff_Stack]  -- Units gain X participating in a kill

- **Champion's Trophy** (`TEcazChampion_Buff_Stack`)
  - desc: The Champion's military success are impressive.
  - Unit_THegemonyProd_Flat = 100 [target: hegemony=EcazChampion]  -- X Hegemony

- **Champion** (`TEcazChampion_Fake`)
  - desc: Ecaz-longname has declared this unit as Champion. Their prestige and popularity are now linked.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Garden Resort** (`TEcazPride`)
  - desc: Ecaz-longname is famous for its vegetalized resorts. Such an expansive facility contrasting with the raw natural beauty of Arrakis is sure to be a crowd-pleaser.
  - Outpost_TResProd_PerAdjacentVillageWithTTrait2_Flat = 2 [target: resource=Knowledge]  -- Gain X X per adjacent Village with X
  - Outpost_TResProd_PerAdjacentMasterpiece_Flat = 0.2 [target: resource=Influence]  -- Gain X X per adjacent MasterPiece
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - CustomProperty = 100  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -5  -- Description of a game mechanic not specific to an ATB
  - Outpost_EcazPride = -  -- 
  - Building_GainTTrait = - [target: trait=TEcazPride_Building]  -- 

- **Garden Resort** (`TEcazPride_Building`)

- **Empirical Data** (`TEmpiricalData`)
  - Zone_InstigatorSetStacksTTrait_PerUnitInCombat = 1 [target: trait=TEmpiricalData_Stack]  -- Gain X stack per units in combat

- **Empirical Data** (`TEmpiricalData_Stack`)
  - TRes_Prod_Flat = 1 [target: resource=Knowledge]  -- X X

- **Endocrine Arouser** (`TEndocrineArouser`)
  - desc: The body naturally produces all kind of hormones when it is hurt. Giving it a little boost is enough to reach almost superhuman capability.
  - Entity_MoveSpeed_ByMissingHealth_ARatio = 0.3  -- Gain up to X% move speed depending on missing Life

- **Evasion Booster** (`TEvasionBooster`)
  - desc: An expensive but powerful engine can be the difference between life and death in an emergency.
  - Entity_MoveSpeed_InCombatFullCarryCapacity_ARatio = 0.5  -- When the A_Drone is full, it gains X% Speed in combat

- **Exotic Compounds** (`TExoticCompounds_Debuff`)
  - Entity_TTrait_Frequency_ARatio = 0.5 [target: trait=Burned_Trait]  -- X stacks X% faster

- **Fix-up Kit** (`TFixupKit`)
  - desc: Equipping every soldier with basic disinfectants, painkillers and wound dressing tools let them keep fighting for longer.
  - Entity_StartCombat_HealRatioMaxLife = 0.3  -- Heal X% Life at the start of combat, lose Life healed this way at the end of combat
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Food Additives** (`TFoodAdditives`)
  - desc: The right food supplements can increase pain tolerance to superhuman levels.
  - Entity_Life_ARatio = 0.15  -- X% max Life
  - Army_HealthRegen_MRatio = 0.5  -- X% regeneration speed

- **Supply Holds** (`TFreedomSymbol_Altar`)
  - desc: A large hold lets the F_Frigate bring supplies directly to the front.
  - AllyArmies_AtTRange2_GainTTrait = - [target: trait=TSupplyHolds_Buff]  -- Other ally Military Units at X gain X (xX max)

- **Fremen Assault Gear** (`TFremenAssaultGear`)
  - desc: Fremen use various specialized gear to ambush their opponents and get an edge in combat.
  - Army_FirstAttackPower_Bonus_Flat = 20  -- X Power on the first attack in combat
  - Army_Power_Flat = -2  -- X Power

- **Hidding Tracks** (`TFremenCloaked`)
  - ZoneGiveTTrait_InstigatorArmies = - [target: trait=TFremenSabotage_Armies]  -- Military Units receive: X

- **Fremen Faith** (`TFremenFaith`)
  - TRes_Prod_Flat = 1 [target: resource=Authority]  -- X X

- **Hiding Tracks** (`TFremenHiddingTracks`)
  - desc: By choosing when to strike, Fremen can disarm the invaders of their strongest tools.
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=TFremenCloaked]  -- This Region and its neighbors gain X (xX max): X
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=TFremenSabotage]  -- This Region and its neighbors gain X (xX max): X

- **Hiding Tracks** (`TFremenHiddingTracks_Fake`)
  - desc: By choosing when to strike, Fremen can disarm the invaders of their strongest tools.
  - CustomProperty = - [target: trait=TFremenCloaked]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = - [target: trait=TFremenSabotage]  -- Description of a game mechanic not specific to an ATB

- **Fremen Sabotage** (`TFremenSabotage`)
  - ZoneGiveTTrait_InstigatorEnemyArmies = - [target: trait=TFremenSabotage_EnemyArmies]  -- Enemy military Units receive: X

- **Hidding Tracks** (`TFremenSabotage_Armies`)
  - desc: This unit is hidding their tracks.
  - Entity_Cloaked = -  -- Cannot be seen outside of combat

- **Hidding Tracks** (`TFremenSabotage_EnemyArmies`)
  - desc: This unit is confused by a Fremen-adjective stratagem.
  - Entity_Speed_ARatio = -0.1  -- X% Speed

- **Frightening Reputation** (`TFrighteningReputation`)
  - desc: The Sardaukar's reputation as remorseless and efficient killers is the main political asset of the Emperor.
  - Entity_OnExecute_GainTRes = 5 [target: resource=Influence]  -- X X is gain with each execution

- **Gnarly Recyclers** (`TGnarlyRecyclers`)
  - desc: Taking from the dead might not be pretty, but it is a good survival strategy.
  - Unit_HealthGain_PerDamageInflicted_ARatio = 0.2  -- Heal by X% of damage inflicted

- **Makeshift Workshop** (`THeavyArmor_Altar`)
  - desc: Keeping a well-stocked reserve of scrap metal and tools on board allows for a speedy recovery on the go.
  - Army_CanRegen_OutsideCombat = -  -- Regenerates outside of combat

- **Heavy Shielding** (`THeavyShielding`)
  - desc: A heavier frame and shielding resists shocks better.
  - Entity_Armor_Flat = 2  -- X Armor
  - TRes_Upkeep_Flat = 2 [target: resource=FuelCell]  -- X X Upkeep

- **Heir of Arrakis** (`THeirOfArrakis_DeepDesert`)
  - desc: For as much as the Pan and Graben people see Arrakis as their home, its rightful owners are the Fremen.
  - Region_AdjacentRegionsAllyVillages_GainTTrait = - [target: trait=THeirOfArrakis_Village]  -- Ally neighboring Regions gain X: X

- **Heir of Arrakis** (`THeirOfArrakis_Village`)
  - desc: This Village benefits from its proximity to a controlled DeepDesert.
  - Village_TraitStack_Flat = 2  -- Effects of SpecificityVillage are applied X more times
  - Army_MilitiaPower_ARatio = 0.2  -- X% Militia Power

- **Hibernation Breastplate** (`THibernationBreastplate_Buff`)
  - desc: This H_Elite is in hibernation.
  - Entity_Armor_Flat = 10  -- X Armor
  - Entity_AttackSpeed_MRatio = 0.5  -- X% attack speed

- **Hidden Thumpers** (`THiddenThumpers`)
  - desc: Fremen are masters at using Shai-Hulud for transport. A secret technique lets them influence the movement of sandworms on the whole planet, facilitating wormriding.
  - Wormriding_NoCost = -  -- Riding Sandworms to or from this region does not consume Thumpers
  - Army_InZone_GainTTrait = - [target: trait=THiddenThumpers_Stealth]  -- Ally Military Units in the Region gain X

- **Iday Alakrab** (`TIdayAlakrab`)
  - desc: This unit has recently unmount a Sandworm
  - Army_FirstAttackDamage_Bonus_Flat = 10  -- X damage on the first attack in combat
  - NoCombat_GainTTrait = - [target: trait=Camouflage]  -- Gain X outside combat
  - Army_FirstAttack_RemoveTTrait = - [target: trait=TIdayAlakrab]  -- Remove X on first attack

- **Imperial Administration** (`TImperialAdministration_MainBase`)
  - desc: This Village benefits from being close to the ImpBase.
  - AdjacentRegionsAllyVillages_GainTTrait = - [target: trait=TImperialAdministration_Neighbour]  -- Ally Villages in the Region and its neighbors gain X (xX max): X

- **Imperial Mandate** (`TImperialMandate`)
  - Entity_OnKill_TResGain_OwnerAndInstigator = 50 [target: resource=Solari]  -- Both factions gain X X each time the receiving faction kills non-neutral enemy Units or destroys enemy Building_Villages

- **Integrated Costs** (`TImperialTaxes_MainBase`)
  - AdjacentRegionsAllyVillages_GainTTrait = - [target: trait=TImperialTaxes]  -- Ally Villages in the Region and its neighbors gain X (xX max): X

- **Improved Medicine** (`TImprovedMedicine`)
  - desc: Better tools, and a larger selection of drugs and medicines tremendously increases the efficiency of A_Drones.
  - CustomProperty = 0.05  -- Description of a game mechanic not specific to an ATB
  - AllyInfantry_AtTRange2_GainTTrait = - [target: trait=TImprovedMedicine_Buff]  -- Ally non-mechanical units in X gain X (xX max)
  - TTrait_Block = - [target: trait=A_Drone_Trait]  -- Disables the effects of X
  - Army_Power_Flat = -1  -- X Power

- **Medical Dispenser** (`TImprovedMedicine_Buff`)
  - desc: A nearby A_Drone helps with Life recovery.
  - Army_DroneHealthRegenPerDay_Flat = 0.25  -- X% Life regeneration per day

- **Incendiary Ammo** (`TIncendiaryAmmo`)
  - desc: This ammo releases a burning compound into the air upon contact.
  - Unit_FightTarget_OnDamageUnit_GainTTraitStacks = 2 [target: trait=Burned_Trait]  -- Dealing damage to an enemy unit applies X X stacks until the end of combat

- **Infiltration cell** (`TInfiltrationCells`)
  - Entity_InfiltrationSlot_InZoneOwner_Flat = 1  -- X Agent slot in Infiltration of the zone's owner faction

- **Infiltration cell** (`TInfiltrationCells_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Inspiring Standard** (`TInspiringStandard`)
  - SafeRegen_ARatio = 1  -- X% units regeneration speed

- **Knightly Protector** (`TKnightlyProtector`)
  - desc: The squire's first duty is to protect any noble E_Elite in the vicinity.
  - Entity_KnightInTRange2_GainTTrait = - [target: trait=TKnightlyProtector_Buff]  -- Gain X if at least 1 E_Elite is in X
  - CustomProperty = 1 [target: trait=TKnightlyProtector_Buff]  -- Description of a game mechanic not specific to an ATB

- **Kraken Protocols** (`TKrakenProtocols`)
  - desc: Applying some of the A_Frigate adaptive technology to the A_Drone makes it more versatile on the field.
  - Entity_Power_Flat = 2  -- X Power
  - Entity_Armor_Flat = -1  -- X Armor
  - Entity_SetTTrait_PerCarried = - [target: trait=TKrakenProtocols_Buff]  -- Gain X per carried unit (xX max)

- **Last Stand** (`TLastStandProtocols_Buff`)
  - desc: This A_Elite is fighting defensively.
  - Entity_Speed_MRatio = 0.5  -- X% Speed
  - Entity_Armor_Flat = 5  -- X Armor
  - Unit_Block_ArmiesBonuses = -  -- This unit is not affected by bonuses inflicted by Military Units
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Wreck Harness** (`TListeningDevices_Altar`)
  - desc: Catching the pieces and bits as they fall is a matter of great skill.
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB
  - Entity_GiveTTrait_AerialUnitAtWar_AtTRange2 = - [target: trait=TListeningDevices_Altar_Debuff]  -- Give X to flying unit in War in X

- **Live Performance** (`TLivePerformance`)
  - desc: A good show provokes admiration, but a bad one invites mockery.
  - Entity_KillLoot_TRes_Flat = 5 [target: resource=Influence]  -- Gain X X on kills
  - Unit_OnDeath_TResLose_Flat = 5 [target: resource=Influence]  -- Lose X X upon death in combat
  - Army_InZoneReal_GainTTrait = - [target: trait=TLivePerformance_Effect]  -- Ally military Units not in transports in the Region gain X

- **Live Reformation** (`TLiveReformation`)
  - desc: Being able to reshuffle conscript formations at the front to optimize pressure on the enemy is one of the most impressive features of the imperial army.
  - Unit_Above50PercentHealth_TransferHealth_SameUnitAtTRange = 0.5 [target: range=Melee_Effect]  -- When Life is above 50%, transfert X% Life per day to a unit of same kind with less Life at X

- **Champion's Mourning** (`TLogisticalFlourish`)
  - desc: The recent death of a TEcazChampion has shocked the Ecaz-adjective military into action.
  - Unit_ImportSpeed_ARatio = 0.5  -- X% units recruitment speed

- **Loud Bang** (`TLoudBang`)
  - desc: A sonic grenade might seem like a joke, but it will destabilize the most hardened veteran.
  - Unit_FightTarget_OnDamageUnit_ApplyTTrait = - [target: trait=TLoudBang_Debuff]  -- Dealing damage to an enemy unit applies X until the end of combat
  - CustomProperty_Inverted = 0.9 [target: trait=TLoudBang_Debuff]  -- Description of a game mechanic not specific to an ATB

- **Maker's Effigy** (`TMakersEffigy`)
  - desc: Faith in the Maker keeps the Fremen strong in adversity.
  - Entity_Power_Flat = 2  -- X Power
  - Entity_Armor_Flat = -1  -- X Armor

- **Pillage Raid** (`TMaraudersRaid`)
  - Unit_Speed_ARatio = 0.1  -- X% unit Speed
  - Army_DailySupplyDrain_MRatio = 0.1  -- X% daily Supply drain
  - MilitaryUnits_VibrationGenerationInMovement_MRatio = 0  -- X% Sandworm attraction speed while moving
  - NonHostileActions = -  -- Prevents triggering Hostile actions when attacking other factions

- **Meat Armor** (`TMeatArmor`)
  - desc: Using fresh corpses as protection is a skill that requires specialized equipment.
  - Unit_OnBeforeDeath_ConsumeTTrait_GainHealthFlat = 40 [target: trait=H_Elite_Buff]  -- If this Unit has X before death, loses 1 stack and heals X Life
  - Army_Life_Flat = -150  -- X unit Life

- **Megalopolis** (`TMegalopolis_MainBase`)
  - AdjacentRegionsAllyVillages_GainTTrait = - [target: trait=TMegalopolis]  -- Ally Villages in the Region and its neighbors gain X (xX max): X

- **Multi-Purpose Parts** (`TMultiParts`)
  - desc: V_Elites often take care of the regular maintenance of drones on the battlefield, but they need the right parts to do it properly.
  - Entity_GiveTTrait_AllyGroundMechanical_AtTRange2 = - [target: trait=TMultiParts_Buff]  -- Give X to ally mechanical unit in X

- **Multi-Purpose Parts** (`TMultiParts_Buff`)
  - desc: This unit is properly maintained by a close V_Elite.
  - Army_TResUpkeep_MRatio = 0.8 [target: resource=Solari]  -- X% Military Unit X Upkeep
  - Mechanical_SafeRegenCost_MRatio = 0.8  -- X% mechanical units regeneration costs

- **National Mythos** (`TNationalMythos`)
  - desc: The proximity to a TEcazChampion protect this unit.
  - Entity_DamageReceived_MRatio = 0.9  -- X% damage received

- **Offensive Mindset** (`TOffensiveMindset`)
  - desc: Developing a healthy competitive spirit towards the opponents can lead to some excess, but it helps when hacking each other to bits is in order.
  - Army_Power_Flat = 2  -- X Power
  - Entity_DamageReceived_ARatio = 0.15  -- X% damage received

- **Parrying Armguards** (`TParryingArmguards`)
  - desc: When you cannot rely on shields anymore, older parrying apparatus come back in fashion.
  - Entity_DamageReceived_InMelee_MRatio = 0.9  -- X% damage received in melee

- **Prana Bindu Initiation** (`TPranaBindu`)
  - desc: Even a short initiation to prana bindu training improves healing and pain resistance over time.
  - MilitaryUnit_XPLevel_GainTTraitStack = - [target: trait=TPranaBindu_Buff]  -- Each XP level grants a stack of X

- **Prideful Crown** (`TPridefulCrown`)
  - desc: The crown of the TEcazPride shines brightly indeed.
  - Outpost_Cost_MRatio = 0.6  -- X% Authority cost to Annex a Village
  - Army_MilitiaPower_ARatio = 0.5  -- X% Militia Power
  - Army_MilitiaLife_ARatio = 0.5  -- X% Militia Life

- **Repeater Node** (`TRepeaterNode`)
  - desc: A miniaturized version of the neural node can be integrated into bigger drones to increase the range of the network.
  - Entity_SetTTraitStacks = 1 [target: trait=Tethered]  -- Gain X stacks of X (xX max)
  - Entity_GiveTTrait_AllyGroundMechanical_AtTRange2 = - [target: trait=Tethered]  -- Give X to ally mechanical unit in X

- **Salvaged Shields** (`TSalvagedShields`)
  - desc: Salvaging is an art form that few people really master. While not as durable as a proper breastplate, a salvaged piece of armour can still save life in a hurry.
  - Army_Power_Flat = -1  -- X Power

- **Salvaged Armor** (`TSalvagedShields_Buff`)
  - desc: This unit has taken a piece of armor from an enemy.
  - Entity_Armor_Flat = 1  -- X Armor

- **Sand Cloud** (`TSandCloud_Altar`)
  - desc: In the desert, any strong wind immediatly raises a large murky cloud of sand.
  - AllyGroundArmies_AtTRange2_GainTTrait = - [target: trait=TSandCloud_Altar_Buff]  -- Ally ground Military Units in X gain X (xX max)

- **Sand Cover** (`TSandCover`)
  - desc: Fremen F_Troopers use the sand to make themselves harder to target at range.
  - Entity_DamageReceived_FromRanged_MRatio = 0.8  -- X% damage received from ranged attacks

- **Sardaukar's Cleaver** (`TSardaukarCleaver`)
  - desc: Swords can be optimized for cutting through bones and flesh.
  - Entity_ExecuteTarget_HealthRatio_Flat = 0.1  -- Executes enemy units under X% Life
  - Object_TTrait_AdditionalStackingLimit = -5 [target: trait=C_Elite_Buff]  -- X maximum stacks of X
  - CustomProperty = 0.1  -- Description of a game mechanic not specific to an ATB

- **Sardaukar's Cleaver** (`TSardaukarCleaver_Old`)
  - desc: Swords can be optimized for cutting through bones and flesh, but they are less balanced and will be less practical against a fresh foe.
  - Entity_ExecuteTarget_HealthRatio_Flat = 0.05  -- Executes enemy units under X% Life
  - Entity_Power_MRatio = 0.95  -- X% Power

- **Secret Beacon** (`TSecretBeacon`)
  - desc: If the worst happens, a magnetic beacon hidden in the stillsuit, lets the clan recover Water and valuables.
  - MilitaryUnit_OnDeathRefund_ARatio = 0.25  -- X% of Military Units costs are refunded upon death
  - Entity_Life_MRatio = 0.85  -- X% max Life

- **Self-sufficiency** (`TSelfSufficiency`)
  - desc: F_Elites are trained to operate on their own, without any outside assistance when needed.
  - Entity_Power_Flat = 6  -- X Power
  - TRes_Upkeep_Flat = 1 [target: resource=CommandPoint]  -- X X Upkeep

- **Sharpened Blades** (`TSharpenBlades`)
  - desc: Nanoblades are so sharp that they cannot be held in a sheath. Their use results in numerous accidental wounds.
  - Army_Power_Flat = 2  -- X Power
  - Entity_Life_MRatio = 0.9  -- X% max Life

- **Shelter Maps** (`TShelterMaps`)
  - desc: Knowing all the good cover spots helps with the guerilla style of the Fremen army.
  - Entity_DamageReceived_InOwnOrNeutralTerritory_MRatio = 0.85  -- X% damage received in owned or neutral territory

- **Shielding Straightener** (`TShieldingStraightener`)
  - desc: Most of the armor and gear you find on a battlefield is too damaged to use, but it's possible to fix it up just enough for one last time.
  - Unlock_TAbility = - [target: ability=MakeshiftProtection]  -- Unlocks the X Ability
  - CustomProperty = - [target: trait=TShieldingStraightener_Buff]  -- Description of a game mechanic not specific to an ATB

- **Makeshift Protection** (`TShieldingStraightener_Allies_Buff`)
  - desc: This unit is using looted equipment from the S_Drone.
  - Entity_Armor_Flat = 2  -- X Armor

- **Makeshift Protection** (`TShieldingStraightener_Buff`)
  - desc: Most of the armor and gear you find on a battlefield is too damaged to use, but it's possible to fix it up just enough for one last time.
  - AllyGroundArmies_AtTRange2_GainTTrait = - [target: trait=TShieldingStraightener_Allies_Buff]  -- Ally ground Military Units in X gain X (xX max)
  - CustomProperty_Inverted = 4  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Sleeper Agents** (`TSleeperAgents`)
  - Infantry_NoTemp_OnDeath_TUnitSpawnChance = 0.5 [target: unit=H_Sleeper]  -- Non-temporary non-mechanical units have a X% chance to spawn a X upon death in combat

- **Sleeper Agents** (`TSleeperAgents_Owner`)
  - desc: With care and meticulousness, it's possible to plant a sleeper agent in every army squad that will betray them on command.
  - CustomProperty = 0.5 [target: unit=H_Sleeper]  -- Description of a game mechanic not specific to an ATB

- **Spice Field** (`TSpiceArea`)
  - Unlock_TBuilding_Authorize = - [target: building=Refinery]  -- Allows for the construction of X

- **Support Intelligence** (`TSupportIntelligence_Stack`)
  - desc: Coordinating analysts at the office and soldiers on the field allows for a better reaction to threats, which saves many lives.
  - Entity_DamageReceived_ARatio = -0.05  -- X% damage received

- **Supporting Tactics** (`TSupportingTactics`)
  - desc: While they constitute most of the imperial army, conscripts are often thought as supporting levy to the powerful Sardaukar.
  - Unit_GiveTTrait_AlliesNoConsciptTRange2 = - [target: trait=TSupportingTactics_Buff]  -- Gives X to non-Conscript allied units at X

- **Supporting Tactics** (`TSupportingTactics_Buff`)
  - desc: This unit is currently supported by Conscripts.
  - Entity_Armor_Flat = 1  -- X Armor

- **Suppressive Coordination** (`TSuppressiveCoordination`)
  - Unit_CurrentTarget_OnDamageUnit_ApplyTTrait = - [target: trait=TSuppressiveCoordination_Debuff]  -- The target is X (xX max): X
  - Entity_LoneAttacker_Damage_MRatio = 0.7  -- X% damage when the unit is the only one attacking their target

- **Suppressed** (`TSuppressiveCoordination_Debuff`)
  - Object_TTrait_AdditionalStackingLimit = 2 [target: trait=A_Soldier_Debuff]  -- X maximum stacks of X

- **Tempered Sword** (`TTemperedSword`)
  - desc: A good blacksmith with good materials can forge harder swords with an incredible edge.
  - Army_Power_Flat = 2  -- X Power
  - Unit_TResUpkeep_Flat = 20 [target: resource=Solari]  -- X X Upkeep

- **Terrifying Mask** (`TTerrifyingMask`)
  - desc: The terrible helmet of the C_Special is adorned with reminders of the suffering they inflict.
  - Entity_DamageReceived_FromUnit_PerTTraitStacks_MRatio = 0.01 [target: trait=Burned_Trait]  -- X damage received per stack of X on attacker

- **Toxic Vapors** (`TToxicVapors_Armies`)
  - desc: Chemical weapons are an easy way to get rid of military resistance if you are not too concerned with ethical considerations.
  - Army_HealthRegen_MRatio = 0  -- X% regeneration speed
  - Army_HealthDecayPerDay_Flat = -0.3  -- X% Life per day

- **Virtual Black Box** (`TVirtualBlackBox`)
  - desc: Learning from what remains of a wreck is a difficult skill, that can be made easier by designing a drone for it.
  - Unit_OnDeath_TResGain_Flat = 10 [target: resource=Intel]  -- Gain X X upon death in combat

- **Vow of Honor** (`TVowOfHonor`)
  - desc: I will never belittle the people I serve!
  - NearbyAllyTUnit_GainTTrait2 = - [target: unit=E_Trooper]  -- Nearby ally X gain X

- **Vow of Honor** (`TVowOfHonor_Buff`)
  - desc: This E_Trooper is honored by the presence of a E_Elite.
  - Entity_Power_Flat = 1  -- X Power

- **War Memoir** (`TWarMemoir`)
  - desc: Field experience is essential, but a good theoretical framework for warfare also improves performance.
  - MilitaryUnit_XPLevel_GainTTraitStack = - [target: trait=TWarMemoir_Buff]  -- Each XP level grants a stack of X

- **Water Gift** (`TWaterGift_Easy`)
  - CustomProperty = 10  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_Flat = -10 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Hard`)
  - CustomProperty = 30  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_Flat = -30 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Insane`)
  - CustomProperty = 40  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_Flat = -40 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Normal`)
  - CustomProperty = 20  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_Flat = -20 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Receiver_Easy`)
  - TRes_Prod_Flat = 10 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Receiver_Hard`)
  - TRes_Prod_Flat = 30 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Receiver_Insane`)
  - TRes_Prod_Flat = 40 [target: resource=Water]  -- X X

- **Water Gift** (`TWaterGift_Receiver_Normal`)
  - TRes_Prod_Flat = 20 [target: resource=Water]  -- X X

- **Symbol of Freedom** (`TWindTraps_Altar`)
  - desc: A flying representation of the Fremen-shortname's hopes for a freed Arrakis.
  - ArmyGiveTTrait_EnemyZone = - [target: trait=TWindTraps_Altar_Buff]  -- The enemy region gains X
  - CustomProperty = 50 [target: trait=TWindTraps_Altar_Buff]  -- Description of a game mechanic not specific to an ATB

- **Fremen Goldsmithery** (`T_FremenGoldsmithery`)
  - TRes_Prod_ARatio = 0.05 [target: resource=Solari]  -- X% X

- **Fremen Negotiator** (`T_FremenNegotiator`)
  - desc: Negotiations with the local population yields better trade rates.
  - Sietch_TradeResGain_ARatio = 2  -- X% received resources when trading with Sietch

- **Lingar Bewt's Investement** (`T_LingarExtension`)
  - desc: Lingar has installed his Water empire in this Village.
  - TRes_Prod_Flat = 3 [target: resource=Water]  -- X X

- **Whisperers Hub** (`T_MBWhisperersHub`)
  - Faction_ExtraInfiltrationCell_Flat = 1  -- X max InfiltrationCells in each faction's territory

- **Static** (`T_NeuralNodeAttack`)
  - desc: This Building_Village attacks with electrical discharges.
  - Entity_Attacks_IgnoreArmor_MRatio = 0.5  -- This unit's attacks ignore X% enemy Armor
  - Unit_DamageVsAirships_ARatio = 1  -- X% damage against flying units
  - Entity_Power_Flat = 40  -- X Power

- **Scheme Lodge** (`T_SchemeLodge`)
  - Unlock_ContrabandQuests = -  -- Unlocks the contraband offers

- **Spice Seekers** (`T_SpiceSeekers`)
  - desc: Experts in finding fresh spice fields are helping the locals to increase their Spice production.
  - TRes_Prod_ARatio = 0.3 [target: resource=Spice]  -- X% X

- **Worker's Guilds** (`T_WorkersGuild`)
  - desc: Smugglers WorkersGuild increases production.
  - Outpost_Prod_ARatio = 0.2  -- X% resource production

- **Strength of the Sands** (`Temple_Trait`)
  - desc: A nearby ShaiHuludTemple increases local production.
  - Outpost_Prod_ARatio = 0.2  -- X% resource production
  - Harvester_Prod_ARatio = 0.2  -- X% Spice gathering rate

- **Temporary** (`Temporary_Trait`)
  - desc: This unit will only remain on the battlefield for a little while.
  - DisbandOnTimerEnd = 10  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Temporary** (`Temporary_Trait_ImperialMandate`)
  - desc: This unit will only remain on the battlefield for a little while.
  - DisbandOnTimerEnd = 60  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Temporary** (`Temporary_Trait_Long`)
  - desc: This unit will only remain on the battlefield for a little while.
  - DisbandOnTimerEnd = 20  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Temporary** (`Temporary_Trait_Short`)
  - desc: This unit will only remain on the battlefield for a little while.
  - DisbandOnTimerEnd = 2  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Temporary** (`Temporary_Trait_Short2`)
  - desc: This unit will only remain on the battlefield for a little while.
  - DisbandOnTimerEnd = 5  -- These units will disband at the end of the timer
  - SafeRegen_MRatio = 0  -- X% units regeneration speed

- **Training Grounds** (`TrainingGrounds`)
  - desc: Veteran fighters can help make your most promising troops even more efficient.
  - Unit_ImportTime_MRatio = 0.7  -- X% units recruitment time

- **Traitor** (`Traitor`)
  - desc: You have recently taken actions that decreased a diplomatic status between you and another faction. Punitive actions have been taken against your faction, but your troops benefit from the effect of surprise.
  - TRes_Prod_MRatio = 0 [target: resource=CouncilVote]  -- X% X
  - TRes_Prod_Flat = -5 [target: resource=Influence]  -- X X
  - CHOAM_SolariRate_MRatio = 0.5  -- X% penalty CHOAM Spice exchange rate
  - CustomProperty = 0.2  -- Description of a game mechanic not specific to an ATB

- **Traitor** (`Traitor_Ecaz`)
  - desc: You have recently taken actions that decreased a diplomatic status between you and another faction. Punitive actions have been taken against your faction.
  - TRes_Prod_MRatio = 0 [target: resource=CouncilVote]  -- X% X
  - TRes_Prod_Flat = -5 [target: resource=Influence]  -- X X
  - CHOAM_SolariRate_MRatio = 0.5  -- X% penalty CHOAM Spice exchange rate

- **Transport Worm** (`TransportWorm_Trait`)
  - Unit_DD_NoSpeedLoss = -  -- Speed not reduced by DeepDeserts

- **Tutorial** (`Tuto_Base`)
  - Block_Quests = -  -- No Events
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_M1`)
  - Army_NoSupply = -  -- Ignores Supply
  - TUnit_GainTTrait2 = - [target: unit=A_Trooper]  -- Xs gain X
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=HoldPosition]  -- Blocks the X ability
  - NoOccupation = -  -- Cannot occupy Villages nor contest their occupation
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_Quests = -  -- No Events
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_M2`)
  - Militia_TrainDuration_MRatio = 0.5  -- X% Militia training time
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Army_NoSupply = -  -- Ignores Supply
  - TSiegeAction_NeutralVillage_Duration_MRatio = 0.5 [target: siegeAction=Annex]  -- X% X action duration on neutral villages
  - Army_Life_ARatio = 1  -- X% Military Unit Life
  - TUnit_Max_Flat = 1 [target: unit=A_Trooper]  -- X max X
  - TUnit_Max_Flat = 1 [target: unit=A_Soldier]  -- X max X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - TAbility_Block = - [target: ability=HoldPosition]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability
  - UI_Block_SiegeActionCancel = -  -- Blocks possibility to cancel occupation actions
  - Building_Construction_Disable = -  -- Cannot construct Building_Villages
  - Block_BuildingDestruction = -  -- Cannot destroy buildings
  - Block_CancelBuildingConstruction = -  -- Cannot cancel building constructions
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_Quests = -  -- No Events
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_SiegeActionCancel = -  -- Blocks possibility to cancel occupation actions
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_M2_HealBlock`)
  - Army_HealthRegen_MRatio = 0  -- X% regeneration speed

- **Tutorial** (`Tuto_M2_HealBoost`)
  - Army_HealthRegen_MRatio = 2  -- X% regeneration speed

- **Tutorial** (`Tuto_M3`)
  - TUnit_ImportTime_MRatio = 0.15 [target: unit=A_Ornithopter]  -- X% X recruitment time
  - Unit_Speed_MRatio = 1.5  -- X% unit Speed
  - Recon_Speed_ARatio = 0.75  -- X% Recon speed of Points of Interest
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Block_TUnitRecruit = - [target: unit=Militia_Heavy]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_Quests = -  -- No Events
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_M4`)
  - Block_TBuildingConstruction = - [target: building=PlascreteFactory]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=WindTrap]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DewCollector]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MaintenanceCenter]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Marketplace]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=RecruitmentOffice]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MissileBattery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Airfield]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=ResearchHub]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DataCenter]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MonitoringStation]  -- Cannot build X
  - Block_AutoRecon = -  -- Cannot set Ornithopter in auto-recon
  - Block_HarvesterCancel = -  -- Cannot cancel Harvester actions
  - MilitaryUnits_VibrationGeneration_ARatio = 0.1  -- Ground Military Units attract Sandworm X% faster
  - Block_CancelBuildingConstruction = -  -- Cannot cancel building constructions
  - Block_Quests = -  -- No Events
  - Block_BuildingDestruction = -  -- Cannot destroy buildings
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - TUnit_ImportTime_MRatio = 0.2 [target: unit=Harvester]  -- X% X recruitment time
  - Building_ConstructionSpeed_ARatio = 4  -- Building_Villages are constructed X% faster
  - TRes_Prod_ARatio = 2 [target: resource=Spice]  -- X% X
  - Block_TUnitRecruit = - [target: unit=Militia_Melee]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Ranged]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Demo]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Heavy]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_M4_SpiceSlider`)
  - Block_SpiceSlider = -  -- Cannot modify Spice exchange rate

- **Tutorial** (`Tuto_M5`)
  - Entity_DamageReceived_ARatio = -0.7  -- X% damage received
  - TSiegeAction_NeutralVillage_Duration_MRatio = 0.3 [target: siegeAction=Annex]  -- X% X action duration on neutral villages
  - TBuilding_Limit_Flat = 1 [target: building=WindTrap]  -- X X limit
  - TBuilding_Limit_Flat = 1 [target: building=PlascreteFactory]  -- X X limit
  - TBuilding_Limit_Flat = 1 [target: building=MaintenanceCenter]  -- X X limit
  - TAbility_Block = - [target: ability=HoldPosition]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability
  - UI_Block_SiegeActionCancel = -  -- Blocks possibility to cancel occupation actions
  - TAbility_Block = - [target: ability=AddExtensionSlot]  -- Blocks the X ability
  - Block_TBuildingConstruction = - [target: building=Refinery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Marketplace]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=RecruitmentOffice]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MissileBattery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Airfield]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MilitaryBase]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=ResearchHub]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DataCenter]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MonitoringStation]  -- Cannot build X
  - Block_CancelBuildingConstruction = -  -- Cannot cancel building constructions
  - Block_Quests = -  -- No Events
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - Building_ConstructionSpeed_ARatio = 4  -- Building_Villages are constructed X% faster
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_TUnitRecruit = - [target: unit=Militia_Melee]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Ranged]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Demo]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Heavy]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X
  - UI_Block_TAlert = - [target: alert=ArmyIdleLowSupply]  -- Blocks the X alert

- **Tutorial** (`Tuto_M6`)
  - TAbility_Block = - [target: ability=HoldPosition]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability
  - Army_NoSupply = -  -- Ignores Supply
  - TAbility_Block = - [target: ability=AddExtensionSlot]  -- Blocks the X ability
  - Block_TBuildingConstruction = - [target: building=Refinery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Marketplace]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DewCollector]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=RecruitmentOffice]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MissileBattery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Airfield]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=ResearchHub]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DataCenter]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MonitoringStation]  -- Cannot build X
  - Block_Quests = -  -- No Events
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_TUnitRecruit = - [target: unit=Militia_Melee]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Ranged]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Demo]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Heavy]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_Water`)
  - UI_Block_TAlert = - [target: alert=ArmyIdleLowSupply]  -- Blocks the X alert
  - WorldEvent_UnitInvestigationProgress_ARatio = 1.5  -- X% ground Military Unit Discovery investigation speed
  - TRes_Prod_Flat = 50 [target: resource=Solari]  -- X X
  - Army_ResupplyMRatio = 2  -- X% Supply regeneration
  - Building_ConstructionSpeed_ARatio = 4  -- Building_Villages are constructed X% faster
  - Block_CancelBuildingConstruction = -  -- Cannot cancel building constructions
  - TAbility_Block = - [target: ability=AddExtensionSlot]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=HoldPosition]  -- Blocks the X ability
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability
  - Block_TBuildingConstruction = - [target: building=Refinery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Marketplace]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=PlascreteFactory]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=RecruitmentOffice]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MissileBattery]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=Airfield]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MilitaryBase]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=ResearchHub]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=DataCenter]  -- Cannot build X
  - Block_TBuildingConstruction = - [target: building=MonitoringStation]  -- Cannot build X
  - MainBase_Power_MRatio = 0  -- X% Power on your Main Base
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - Block_Quests = -  -- No Events
  - Block_SpiceExchange = -  -- No Spice trading
  - Block_SpiceReport = -  -- No Spice reports and contracts
  - Block_TUnitRecruit = - [target: unit=Militia_Melee]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Ranged]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Demo]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=Militia_Heavy]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Trooper]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Soldier]  -- Cannot recruit X
  - Block_TUnitRecruit = - [target: unit=A_Demo]  -- Cannot recruit X
  - CMarket_Block_State = -  -- The CHOAM market is unavailable
  - Block_Operations = -  -- No operations
  - Block_Developments = -  -- No Developments
  - Block_Landsraad = -  -- No Landsraad
  - Block_Trading = -  -- No trading between factions
  - Block_TUnitRecruit = - [target: unit=A_Ornithopter]  -- Cannot recruit X
  - Block_Disband = -  -- Cannot be disbanded
  - Block_MilitiaDisband = -  -- Cannot disband militia
  - UI_Block_FactionStatus = -  -- Blocks access to the faction status window
  - UI_Hide_TAbility = - [target: ability=PeacefullyAnnex]  -- Hides X ability
  - UI_Hide_Barracks = -  -- Hides barracks button
  - UI_Hide_TResource = - [target: resource=FuelCell]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Standing]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=GuildFavor]  -- Hides X display
  - UI_Hide_TResource = - [target: resource=Hegemony]  -- Hides X display
  - TRes_Prod_MRatio = 0 [target: resource=Agent]  -- X% X

- **Tutorial** (`Tuto_Water_DemolishBuilding`)
  - Block_BuildingDestruction = -  -- Cannot destroy buildings

- **Tutorial** (`Tuto_Water_DewCollector`)
  - Block_TBuildingConstruction = - [target: building=DewCollector]  -- Cannot build X

- **Tutorial** (`Tuto_Water_SupplyDrain`)
  - Army_DailySupplyDrain_ARatio = 2  -- X% daily Supply drain

- **Holtzman Coil** (`V_Drone_Trait`)
  - Entity_GiveTTrait_AllyGroundMechanical_AtTRange2 = - [target: trait=V_Drone_Buff]  -- Give X to ally mechanical unit in X
  - Entity_SetTTraitStacks = 1 [target: trait=V_Drone_Buff]  -- Gain X stacks of X (xX max)

- **Engineered Experience** (`V_Elite_Buff`)
  - desc: A nearby V_Elite improves this drone performances.
  - Entity_DamageReceived_MRatio = 0.95  -- X% damage received
  - Unit_Damage_ARatio = 0.05  -- Attacks deal X% damage

- **Repair Station** (`V_Elite_Deployed_Buff`)
  - desc: The V_Elite has set up shop.
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=Repairing]  -- Ally Drones in X gain X
  - Entity_NoAttack = -  -- Can't attack
  - IsDeployed = -  -- This entity is deployed
  - Movement_Locked_BySkill = -  -- 

- **Fight-Engineer** (`V_Elite_Trait`)
  - CustomProperty = - [target: range=Medium_Range]  -- Description of a game mechanic not specific to an ATB
  - Unit_GiveTTraitStack_AlliesDroneTRange2_PerXPLevel = - [target: trait=V_Elite_Buff]  -- Gives X to nearby drone for each xp level
  - NearbyDeath_GainXP_AlliedDroneInCombat_AtTRange = - [target: range=Medium_Range]  -- Gain Experience for nearby enemy death even if it has not participated, as long as a nearby drone has
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Folder Relay** (`V_Frigate_Trait`)
  - Entity_SetTTraitStacks = 1 [target: trait=Tethered]  -- Gain X stacks of X (xX max)
  - Entity_GiveTTrait_AllyGroundMechanical_AtTRange2 = - [target: trait=Tethered]  -- Give X to ally mechanical unit in X

- **Spice Sifter** (`V_HarvesterDeployed_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_MRatio = 1 [target: resource=Spice]  -- X% X
  - TAbility_Hide = - [target: ability=Shuttle]  -- Hides the X ability

- **Spice Sifter** (`V_Harvester_Trait`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TRes_Prod_MRatio = 0 [target: resource=Spice]  -- X% X
  - TAbility_Hide = - [target: ability=Shuttle]  -- Hides the X ability

- **V_Hero_1's Repair Station** (`V_Hero_1_Skill`)
  - desc: V_Hero_1 is all set up for reparation works.
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=Repairing]  -- Ally Drones in X gain X
  - Movement_Locked_BySkill = -  -- 
  - IsDeployed = -  -- This entity is deployed
  - Entity_Power_MRatio = 0.3333  -- X% Power
  - TTrait_Block = - [target: trait=Demo_Trait]  -- Disables the effects of X

- **Evasion** (`V_Hero_2_Skill`)
  - Untargetable = -  -- This unit cannot be targeted by an attack
  - Invincible = -  -- Immune to damage from any source

- **Dissident Tinkerer** (`V_Hero_2_Trait`)
  - Entity_FactionOwner_GainTTrait = - [target: trait=V_Hero_2_Trait_FactionBuff]  -- Faction gains X
  - CustomProperty = 1 [target: trait=V_Hero_2_Trait_FactionBuff]  -- Description of a game mechanic not specific to an ATB
  - AllyInfantry_AtTRange2_GainTTrait = - [target: trait=V_Hero_2_Trait_Buff_1]  -- Ally non-mechanical units in X gain X (xX max)
  - Entity_Cloaked = -  -- Cannot be seen outside of combat

- **Evasion** (`V_Hero_2_Trait_Buff_Execute`)
  - desc: V_Hero_2 is an expert at disappearing without a trace in tight situations.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_ExecuteTarget_HealthRatio_Flat = 1  -- Executes enemy units under X% Life
  - Entity_OnAttack_Purge_LeaveCombat = -  -- 
  - Entity_OnAttack_LoseTTrait = - [target: trait=V_Hero_2_Trait_Buff_Execute]  -- All stacks of X are lost when attacking

- **Shadow Guardian** (`V_Ship_Trait`)
  - Entity_SetTTraitStacks = 1 [target: trait=Tethered]  -- Gain X stacks of X (xX max)
  - Unit_AlliedTerritory_GainTTrait = - [target: trait=V_Ship_Trait_Buff]  -- Military Units have X inside ally territory

- **Nodal Network** (`Vernius_ConnectedNode`)
  - Zone_ConnectedNode = -  -- This zone has a connected NeuralNode
  - Outpost_GainTTrait = - [target: trait=Vernius_ConnectedVillage]  -- X
  - MainBase_GainTTrait = - [target: trait=Vernius_ConnectedVillage]  -- The main base gains X
  - MainBase_GainTTrait = - [target: trait=Vernius_MainBase_Prism]  -- The main base gains X
  - TBuilding_GainTTrait2 = - [target: building=NeuralNode]  -- Xs: X
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=Vernius_AdjacentConnectedNode]  -- This Region and its neighbors gain X (xX max): X

- **Versatile** (`Versatile_AllDomains_Buff`)
  - Res_Prod_ARatio_ExceptTRes = 0.2 [target: resource=Spice]  -- X% resource production except for X
  - Zone_Owned_Harvester_Prod_ARatio = 0.2  -- X% Spice gathering rate for $my(harvester) in owned zones

- **WE_WaterSeller_Flat** (`WE_WaterSeller_Flat`)
  - TRes_Prod_Flat = 10 [target: resource=Water]  -- X X
  - TRes_Prod_Flat = -20 [target: resource=Solari]  -- X X

- **Trooper** (`Warrior_Trait`)
  - desc: A Warrior_Trait generally remains on the front line, either to break the enemy front line or to protect the back line.
  - Entity_GiveTTrait_GroundUnitAtWar_AtTRange2 = - [target: trait=Warrior_Trait_Debuff]  -- Give X to ground unit in War in X

- **Water Deficit** (`WaterDeficit`)
  - desc: Create DewCollector, WindTrap, or WaterExtractor to get more Water.
  - Army_ResupplyMRatio = 0  -- X% Supply regeneration

- **Water Traders** (`WaterTraders`)
  - desc: Even in the middle of the desert, some people would rather have money in the bank than water in their belly.
  - TRes_ProdPerLocalTRes2Prod_ARatio = 1 [target: resource=Solari]  -- Gain X% of the Village's X production as X

- **Well Diggers** (`WellDiggers`)
  - desc: Deep under the sand lie small pockets of water that a good drowser can sometimes find.
  - TRes_Prod_Flat = 3 [target: resource=Water]  -- X X

- **Swordmaster Teacher** (`WhitmorePassive`)
  - Faction_ExtraEcazChampion_Flat = 1  -- Can apply EcazChampion on X more units
  - Army_SpawnExperienceLevel_Flat = 1  -- Military Units start with X more Experience level

- **Decoy Thumper** (`WormCalling`)
  - desc: Fremen place thumpers in peculiar places to attract and enrage sandworms on their enemies' paths and out of theirs.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Decoy Thumper** (`WormCalling_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

- **Decoy Thumper** (`WormCalling_Neighbors`)
  - desc: Fremen place thumpers in peculiar places to attract and enrage sandworms on their enemies' paths and out of theirs.
  - Zone_NoSandworm = -  -- This region has no Sandworms at the moment

- **WormCalling_Worm** (`WormCalling_Worm`)
  - DisbandOnTimerEnd = -  -- These units will disband at the end of the timer
  - Sandworm_ZoneLimited = -  -- 
  - Sandworm_No_AutoDespawn = -  -- 
  - Sandworm_AggroRange_Flat = 500  -- 
  - Sandworm_Roam_Time_Flat = -10  -- 
  - Sandworm_PreAttack_Time_Flat = 0  -- 
  - Sandworm_Wait_Time_Flat = -10  -- 
  - Sandworm_Speed_ARatio = 2  -- 

- **Physician Philosopher** (`YuehPassive`)
  - TRes_Prod_Flat = 2 [target: resource=Knowledge]  -- X X
  - CustomProperty = - [target: trait=YuehPassive_Buff]  -- Description of a game mechanic not specific to an ATB
  - Infantry_Life_ARatio = 0.15  -- X% non-mechanical units Life
  - Infantry_HealthRegen_MRatio = 1.3  -- X% non-mechanical unit health regeneration

- **Dr. Yueh's Care** (`YuehPassive_Buff`)
  - Entity_Life_ARatio = 0.15  -- X% max Life
  - Army_HealthRegen_MRatio = 1.3  -- X% regeneration speed

