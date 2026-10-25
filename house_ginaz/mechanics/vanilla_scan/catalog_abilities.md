# Abilities (vanilla)

The `ability` sheet: active abilities and their cost, cooldown and the traits they apply.

## Add Building_Village Slot (`AddExtensionSlot`)
- cooldown: localCooldown=True
- **Infrastructure Improvement** (`TInfrastructureImprovement`)
  - Village_ExtensionSlot_Flat = 1  -- X Building_Village slot in owned Villages

## Peaceful Annexation (`PeacefullyAnnex`)
- desc: Annexation time: X days Peacefully capture this village
- cost: {'qty': 50, 'res': 'Influence'}

## Oppression (`Oppression`)
- desc: Oppress the village to increase its productivity but cause unrest when the effect ends.
- cost: {'qty': 20, 'res': 'Manpower'}
- **Oppression** (`TOppression`)
  - Outpost_Prod_MRatio = 2  -- X% Village resource production
  - CustomProperty = - [target: trait=TOppression_Ended]  -- Description of a game mechanic not specific to an ATB

## Install Underworld Headquarters (`InstallUWHeadquarter`)
- desc: Install an UWHeadquarters in this Village.
- cost: {'qty': 50, 'res': 'Solari'}; {'qty': 5, 'res': 'Authority'}

## Hasten (`HastenFake`)
- desc: While some uses violence to increase efficiency, Thufir prefers subtler forms of pressure.
- **Hasten** (`THastenBuilding`)
  - Building_ConstructionSpeed_ARatio = 8  -- Building_Villages are constructed X% faster
  - Building_Construction_Disable = -  -- Cannot construct Building_Villages
- **Hasten** (`THastenMission_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Hasten (`HastenBuilding`)
- desc: While some uses violence to increase efficiency, Thufir prefers subtler forms of pressure.
- cooldown: localCooldown=True
- **Hasten** (`THastenBuilding`)
  - Building_ConstructionSpeed_ARatio = 8  -- Building_Villages are constructed X% faster
  - Building_Construction_Disable = -  -- Cannot construct Building_Villages

## Hasten (`HastenMission`)
- desc: While some uses violence to increase efficiency, Thufir prefers subtler forms of pressure.
- cooldown: localCooldown=True
- **Hasten** (`THastenMission_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Main Base Deployment (`DeployMainBase`)
- desc: Razes the village and deploys an ImpBase in its stead. Can only be used once.
- cost: {'qty': 3000, 'res': 'Solari'}; {'qty': 100, 'res': 'Authority'}

## Sanctuary (`Sanctify`)
- desc: Protect this Village from capture.

## Garden Resort (`EcazPride`)
- desc: Turn this Village into a Garden Resort. Can only be done once.
- cost: {'qty': 500, 'res': 'Solari'}
- cooldown: localCooldown=False, onCancel=20
- **Garden Resort** (`TEcazPride`)
  - desc: Ecaz-longname is famous for its vegetalized resorts. Such an expansive facility contrasting with the raw natural beauty of Arrakis is sure to be a crowd-pleaser.
  - Outpost_TResProd_PerAdjacentVillageWithTTrait2_Flat = 2 [target: resource=Knowledge]  -- Gain X X per adjacent Village with X
  - Outpost_TResProd_PerAdjacentMasterpiece_Flat = 0.2 [target: resource=Influence]  -- Gain X X per adjacent MasterPiece
  - Outpost_Abandon_Block = -  -- Cannot abandon Villages
  - CustomProperty = 100  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -5  -- Description of a game mechanic not specific to an ATB
  - Outpost_EcazPride = -  -- 
  - Building_GainTTrait = - [target: trait=TEcazPride_Building]  -- 

## Champion (`EcazChampion`)
- desc: Name this unit Champion.
- cost: {'qty': 1000, 'res': 'Solari'}
- cooldown: localCooldown=False, onEnd=20
- **Champion** (`TEcazChampion_Fake`)
  - desc: Ecaz-longname has declared this unit as Champion. Their prestige and popularity are now linked.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
- **Champion** (`TEcazChampion`)
  - desc: Ecaz-longname has declared this unit as Champion. Their prestige and popularity are now linked.
  - Entity_Life_MRatio = 1.2  -- X% max Life
  - Entity_Power_MRatio = 1.2  -- X% Power
  - Entity_Armor_Flat = 2  -- X Armor
  - Entity_ExecuteImmune = -  -- Cannot be Executed
  - Unit_EcazChampion = -  -- 
  - Army_Scale_ARatio = 0.05  -- These unit is X% taller
  - Army_OnEliminateFactionUnit_GainTTrait = - [target: trait=TEcazChampion_Buff_Stack]  -- Units gain X participating in a kill

## Hold Position (`HoldPosition`)
- desc: Will stay at the current position and only retaliate on enemies within direct attack range

## Shuttle (`Shuttle`)
- desc: Transport to any area within an Airfield's range.
- cost: {'qty': 20, 'res': 'Solari'}
- cooldown: onActivate=1, localCooldown=True

## Install Turret (`FSpecialInstall`)
- desc: Sets up the turret
- cooldown: onStartGame=0.1, sharedCooldown=FSpecialLeave, onActivate=0.1, localCooldown=True

## Uninstall (`FSpecialLeave`)
- desc: Dismount the turret
- cooldown: onStartGame=0.1, sharedCooldown=FSpecialInstall, onActivate=0.1, localCooldown=True

## Set up camp (`ChangeToHarvTent`)
- desc: Sets up a X
- cooldown: onStartGame=0.05, sharedCooldown=ChangeToHarvCaravan, onActivate=0.05, localCooldown=True

## Break camp (`ChangeToHarvCaravan`)
- desc: Pack camp and depart with your X
- cooldown: onStartGame=0.05, sharedCooldown=ChangeToHarvTent, onActivate=0.05, localCooldown=True

## Deploy (`VHarvesterInstall`)
- desc: Deploy the V_Harvester and begin to harvest Spice.
- cooldown: onStartGame=0.05, sharedCooldown=VHarvesterLeave, onActivate=0.05, localCooldown=True

## Undeploy (`VHarvesterLeave`)
- desc: Undeploy the V_Harvester.
- cooldown: onStartGame=0.05, sharedCooldown=VHarvesterInstall, onActivate=0.05, localCooldown=True

## Install (`CDroneInstall`)
- desc: Installs the C_Drone in place and deploys its cannon, allowing it to fire at long range but blocking its movement.
- cooldown: onStartGame=0.05, sharedCooldown=CDroneLeave, onActivate=0.05, localCooldown=True

## Uninstall (`CDroneLeave`)
- desc: Uninstalls the C_Drone and pack its cannon, allowing it to move again.
- cooldown: onStartGame=0.05, sharedCooldown=CDroneInstall, onActivate=0.05, localCooldown=True

## Airfield Configuration (`CFrigateDeploy`)
- desc: Set up the C_Frigate as a military Airfield.
- cooldown: onStartGame=0.05, sharedCooldown=CFrigateLeave, onActivate=0.5, localCooldown=True
- **Airfield Terminal** (`C_Frigate_Deployed_Buff`)
  - desc: Ready to receive Shuttles.
  - Army_Airfield_Range_Flat = 50  -- Generate a small Airfield range
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Unit_Speed_MRatio = 0  -- X% unit Speed

## Mobile Configuration (`CFrigateLeave`)
- desc: Recover the C_Frigate mobility and offensive abilities.
- cooldown: onStartGame=0.05, sharedCooldown=CFrigateDeploy, onActivate=0.05, localCooldown=True

## Disembark (`Disembark_Drone`)
- desc: Releases all units carried by the drone.
- cooldown: onStartGame=0.1, onActivate=0.5, localCooldown=True

## Disembark (`Disembark`)
- desc: Releases all carried units below the ship.
- cooldown: onStartGame=0.1, onActivate=0.5, localCooldown=True

## Repair Station (`VEliteInstall`)
- desc: Deploy a repair station for fixing drones.
- cooldown: onStartGame=0.05, onActivate=0.0333, localCooldown=True, onEnd=0.0333
- **Repair Station** (`V_Elite_Deployed_Buff`)
  - desc: The V_Elite has set up shop.
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=Repairing]  -- Ally Drones in X gain X
  - Entity_NoAttack = -  -- Can't attack
  - IsDeployed = -  -- This entity is deployed
  - Movement_Locked_BySkill = -  -- 

## Uninstall (`VEliteLeave`)
- desc: Uninstalls the V_Elite's repair station, allowing her to move again.

## Last Stand (`LastStandProtocols`)
- **Last Stand** (`TLastStandProtocols_Buff`)
  - desc: This A_Elite is fighting defensively.
  - Entity_Speed_MRatio = 0.5  -- X% Speed
  - Entity_Armor_Flat = 5  -- X Armor
  - Unit_Block_ArmiesBonuses = -  -- This unit is not affected by bonuses inflicted by Military Units
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Decimation Protocols (`DecimationProtocols`)
- desc: Drones do not have any survival instincts, which is a beautiful quality in some contexts.
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=1
- **Decimation Protocols** (`H_Frigate_Buff`)
  - desc: Drones do not have any survival instincts, which is a beautiful quality in some contexts.
  - Army_SubUnits_GainTTrait = - [target: trait=H_Frigate_Sting_Buff]  -- Sub units gain X

## Makeshift Protection (`MakeshiftProtection`)
- **Makeshift Protection** (`TShieldingStraightener_Buff`)
  - desc: Most of the armor and gear you find on a battlefield is too damaged to use, but it's possible to fix it up just enough for one last time.
  - AllyGroundArmies_AtTRange2_GainTTrait = - [target: trait=TShieldingStraightener_Allies_Buff]  -- Ally ground Military Units in X gain X (xX max)
  - CustomProperty_Inverted = 4  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Haste (`Haste`)
- cooldown: onStartGame=0.1, localCooldown=True, onActivate=3
- **Running Sandshoes** (`TRunningSandshoes_Buff`)
  - desc: Sand is notoriously unstable. These shoes are designed to let the wearer run on sand even faster than they would on dirt.
  - Entity_Speed_ARatio = 0.5  -- X% Speed

## Toxic Purge (`ToxicPurge`)
- desc: Increases the volume of toxic gases ejected for a stronger effect.
- cooldown: onStartGame=0.1, onEndDuration=6, localCooldown=True
- **Toxic Purge** (`S_Frigate_Buff`)
  - desc: Toxic gases is temporarily reinforced.
  - Entity_AttackSpeed_MRatio = 2  -- X% attack speed
  - Unit_Speed_MRatio = 0.5  -- X% unit Speed

## Extraction (`ExtractionNetwork_Ability`)
- **TExtraction** (`TExtraction`)
  - Entity_Hidden = -  -- Entity is hidden(not present on the map)

## Duncan's Last Stand (`A_Hero_1_Skill`)
- desc: At the height of the battle, A_Hero_1 tap into deep reserve of strength coming from his loyalty to Atreides-longname.
- **Duncan's Last Stand** (`A_Hero_1_Skill_Buff_1`)
  - desc: At the height of the battle, A_Hero_1 taps into deep reserves of strength coming from his loyalty to Atreides-longname.
  - Entity_GiveTTrait_GroundUnitAtWar_AtTRange2 = - [target: trait=A_Hero_1_Skill_Debuff]  -- Give X to ground unit in War in X
  - Entity_Speed_ARatio = 1  -- X% Speed
  - Entity_AttackSpeed_MRatio = 2  -- X% attack speed
  - Entity_Armor_Flat = 5  -- X Armor
  - Army_AffectedByAllyUnitBonus_FreezeStackTTrait = - [target: trait=A_Hero_1_Heroism]  -- Freeze current stacks of X
  - Uncontrollable = -  -- Cannot be controlled
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Forced March (`A_Hero_2_Skill`)
- desc: A_Hero_2's songs remind everyone of the sweetness of life, even when it is tough.
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=3
- **Forced March** (`A_Hero_2_Skill`)
  - desc: A_Hero_2's songs remind everyone of the sweetness of life, even when it is tough.
  - AllyGroundArmies_AtTRange2_GainTTrait = - [target: trait=A_Hero_2_Skill_Buff]  -- Ally ground Military Units in X gain X (xX max)
  - Entity_SetTTraitStacks = 1 [target: trait=A_Hero_2_Skill_Buff]  -- Gain X stacks of X (xX max)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Stop Forced March (`A_Hero_2_Skill_Cancel`)
- desc: A_Hero_2's songs remind everyone of the sweetness of life, even when it is tough.
- cooldown: onStartGame=0, onEndDuration=0, localCooldown=True
- **Stop Forced March** (`A_Hero_2_SkillOff_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Gladiator Drugs (`H_Hero_1_Skill`)
- desc: H_Hero_1 uses a psychedelic cocktail that temporarily turns his bodyguards into frenzied zombies.
- cooldown: onActivate=0.06, onCancel=1, onEnd=1, localCooldown=True, onStartGame=0.1
- **Gladiator Drug** (`H_Hero_1_Skill`)
  - desc: H_Hero_1 uses a psychedelic cocktail that temporarily turns his bodyguards into frenzied zombies.
  - Entity_GiveTTrait_ATRange2_SelfHumans = - [target: trait=H_Hero_1_Skill_Buff]  -- Gives X to X ally humans
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Cannon Fodder (`H_Hero_2_Skill`)
- desc: The terrifying H_Hero_2 feeds the grinder of wars with fresh meat.
- cooldown: localCooldown=True, onStartGame=0.1, onEndDuration=0.5
- **Cannon Fodder** (`H_Hero_2_Skill_AlmostBuff`)
  - CustomProperty = 0 [target: trait=H_Hero_2_Skill_Buff]  -- Description of a game mechanic not specific to an ATB

## Cutting Costs (`S_Hero_1_Skill`)
- cost: {'qty': 100, 'res': 'Intel'}
- cooldown: onStartGame=0.1, onEndDuration=10, localCooldown=True, onEnd=10
- **Cutting Costs** (`S_Hero_1_Skill_Buff`)
  - desc: With enough planning, S_Hero_1 reduces drastically the cost of operations.
  - ArmyGiveTTrait_Zone = - [target: trait=S_Hero_1_Skill_ZoneBuff]  -- The region gains X

## Street Urchins (`S_Hero_2_Skill`)
- desc: S_Hero_2 finds some use of the disillusionned youth of Arrakis
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=6
- **Street Urchins** (`S_Hero_2_Skill_Fake`)
  - CustomProperty = 2  -- Description of a game mechanic not specific to an ATB

## Ambush (`F_Hero_1_Skill`)
- desc: A proper ambush requires discretion, coordination, and imagination.
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=3
- **Chani's Ambush** (`F_Hero_1_Skill_Fake`)
  - desc: This unit is part of an ambush planned by F_Hero_1.
  - CustomProperty = 2 [target: trait=F_Hero_1_Skill_UnitBuff]  -- Description of a game mechanic not specific to an ATB

## Coordinated Strikes (`F_Hero_2_Skill`)
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=3
- **Coordinated Strikes** (`F_Hero_2_Skill`)
  - desc: A small coordinated force can appear much larger by constantly harassing the enemy.
  - Entity_GiveTTrait_ATRange2_SelfGroundUnits = - [target: trait=F_Hero_2_Skill_Buff1]  -- Gives X owned ground armies at X
  - CustomProperty = 8  -- Description of a game mechanic not specific to an ATB

## Unexpected Reinforcements (`C_Hero_1_Skill`)
- cooldown: onStartGame=0.1, onEndDuration=15, localCooldown=True
- **Unexpected Reinforcements** (`C_Hero_1_Skill`)
  - desc: A princess should always have a solid escort with her.
  - CustomProperty = 0.5  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Finishing Move (`C_Hero_2_Skill`)
- cooldown: onStartGame=0.1, onEndDuration=3, localCooldown=True
- **Finishing Move** (`C_Hero_2_Skill`)
  - desc: This fight has lasted long enough.
  - Entity_ExecuteTarget_MinHealthRatio_Flat = 0.5  -- Execution thresholds are always at least X% Life
  - CustomProperty_Inverted = 1  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Frightful Champion (`E_Hero_1_Skill`)
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=3, onActivate=0.333
- **Frightful Champion** (`E_Hero_1_Skill`)
  - desc: Honor only gets you so far. Sometimes E_Hero_1 can surprise his enemies with dishonorable tactics.
  - Entity_SetStacksTTrait_PerTTrait2Stacks = - [target: trait=E_Hero_1_SkillBuff]  -- Gain X stack per X stack
  - CustomProperty_Inverted = 1  -- Description of a game mechanic not specific to an ATB

## Saving Grace (`E_Hero_2_Skill`)
- cooldown: onStartGame=0.1, globalCooldown=True, onActivate=20
- **Saving Grace** (`E_Hero_2_Skill_Buff`)
  - desc: E_Hero_2 has taken precaution to escape death.
  - Army_SpawnTUnit_WithHealthRatio_OnDeath = 0.05 [target: unit=E_Hero_2]  -- Spawn X on Rally Point with X% Life

## Nuwa's Repair Station (`V_Hero_1_Skill`)
- desc: Deploy a repair station for fixing drones.
- cooldown: onStartGame=0.1, localCooldown=True, onActivate=0.0333, onEnd=0.0333
- **V_Hero_1's Repair Station** (`V_Hero_1_Skill`)
  - desc: V_Hero_1 is all set up for reparation works.
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=Repairing]  -- Ally Drones in X gain X
  - Movement_Locked_BySkill = -  -- 
  - IsDeployed = -  -- This entity is deployed
  - Entity_Power_MRatio = 0.3333  -- X% Power
  - TTrait_Block = - [target: trait=Demo_Trait]  -- Disables the effects of X

## Evasion (`V_Hero_2_Skill`)
- cooldown: onStartGame=0.1, localCooldown=True, onEnd=3
- **Evasion** (`V_Hero_2_Trait_Buff_Execute`)
  - desc: V_Hero_2 is an expert at disappearing without a trace in tight situations.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Entity_ExecuteTarget_HealthRatio_Flat = 1  -- Executes enemy units under X% Life
  - Entity_OnAttack_Purge_LeaveCombat = -  -- 
  - Entity_OnAttack_LoseTTrait = - [target: trait=V_Hero_2_Trait_Buff_Execute]  -- All stacks of X are lost when attacking

## Switch to Lullaby (`EFrigate_Lullaby`)
- cooldown: onActivate=0.5, sharedCooldown=EFrigate_WarAnthem, localCooldown=True
- **Lullaby** (`E_Frigate_Lullaby`)
  - desc: An obtuse song with a slow rythm and a soothing melody, that reduce aggressivity and reaction speed.
  - Entity_GiveTTrait_ATRange2Humans = - [target: trait=E_Frigate_Lullaby_Debuff]  -- Gives X to X humans
  - TAbility_Block = - [target: ability=EFrigate_Lullaby]  -- Blocks the X ability

## Switch to War Anthem (`EFrigate_WarAnthem`)
- cooldown: onActivate=0.5, sharedCooldown=EFrigate_Lullaby, localCooldown=True
- **War Anthem** (`E_Frigate_WarAnthem`)
  - desc: An upbeat battle song, reminding everyone of the superiority of Ecaz-longname.
  - Entity_GiveTTrait_ATRange2_SelfHumans = - [target: trait=E_Frigate_WarAnthem_Buff]  -- Gives X to X ally humans
  - TAbility_Block = - [target: ability=EFrigate_WarAnthem]  -- Blocks the X ability

## Space Folding (`VFrigate_SpaceFolding`)
- cooldown: onActivate=10, localCooldown=True
- **Space Folding** (`V_Frigate_SpaceFolding_DisplayOnly_Fake`)
  - desc: Space Folders can usually only be used safely by Spacing Guild navigators. Recent ixian advances in predictive electronics allow a short distance jump with only the assistance of powerful computing machines.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Add Crew (`AddCrew`)
- desc: Add a CrewPoint to this $my(Harvester)
- cost: {'qty': 40, 'res': 'Manpower'}
- cooldown: onActivate=0
- **Harvester Crew** (`HarvesterCrew`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Add Power Cell (`AddOvercharge`)
- desc: Add a Overcharge to this $my(Harvester)
- cost: {'qty': 1, 'res': 'FuelCell'}
- cooldown: onActivate=0
- **Harvester Power Cell** (`HarvesterOvercharge`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - TRes_Upkeep_Flat = 1 [target: resource=FuelCell]  -- X X Upkeep

## Probe Setup (`ProbeSetup`)
- desc: Knowledge is power, they say. It's even more true on Arrakis, where ignorance can be lethal.
- **Probe Setup** (`TProbeSetup`)
  - desc: Knowledge is power, they say. It's even more true on Arrakis, where ignorance can be lethal.
  - Region_RevealPOIs = -  -- Grants vision on the region and recons its points of interest
  - Village_AdditionalProduction_MakeVisible = -  -- Additional production of Villages is visible
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Leave Order (`LeaveOrder`)
- desc: The Landsraad cannot force you to remove your troops, but it can fine you for not complying.
- **Leave Order** (`TLeaveOrder`)
  - desc: The Landsraad cannot force you to remove your troops, but it can fine you for not complying.
  - CustomProperty = 100  -- Description of a game mechanic not specific to an ATB

## Defense Sabotage (`GearSabotage`)
- desc: The most effective defensive weapons do not matter if your enemy cannot use them.
- **Defense Sabotage** (`TGearSabotage`)
  - desc: The most effective defensive weapons do not matter if your enemy cannot use them.
  - TBuilding_GainTTrait2 = - [target: building=MissileBattery]  -- Xs: X
  - MainBase_GainTTrait = - [target: trait=TGearSabotage_MainBase]  -- The main base gains X

## Scavenger Team (`ScavengerTeam`)
- desc: Corpses usually have many valuables on them. It'd be a shame to leave them to the desert.
- **Scavenger Team** (`TScavengerTeam_Self`)
  - Unit_OnDeath_MaxHealthToTRes_ARatio = 0.25 [target: resource=Solari]  -- Gain X% of the maximum Life of Military Units that die in the region as X
  - Pillage_Gain_ARatio = 0.2  -- X% resources from pillaging Villages and Sietchs
- **Scavenger Team** (`TScavengerTeam_Fake`)
  - desc: Corpses usually have many valuables on them. It'd be a shame to leave them to the desert.
  - CustomProperty = 0.25  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = 0.2  -- Description of a game mechanic not specific to an ATB

## Support Intelligence (`SupportIntelligence`)
- desc: Coordinating analysts at the office and soldiers on the field allows for a better reaction to threats, which saves many lives.
- **Support Intelligence** (`TSupportIntelligence`)
  - desc: Coordinating analysts at the office and soldiers on the field allows for a better reaction to threats, which saves many lives.
  - Zone_SetStacksTTrait_ForInstigator_PerOperationLaunched = - [target: trait=TSupportIntelligence_Stack]  -- Gives X to instigator and allies per launched operation on the zone

## Combat Drugs (`CombatDrugs`)
- desc: Some drugs and chemical compounds can significantly enhance combat efficiency at the cost of a reduced lifespan.
- **Combat Drugs** (`TCombatDrugs`)
  - desc: Some drugs and chemical compounds can significantly enhance combat efficiency at the cost of a reduced lifespan.
  - ZoneGiveTTrait_Infantry = - [target: trait=TCombatDrugs_Armies]  -- Non-mechanical units receive: X

## Supply Caches (`SupplyCaches`)
- desc: There are only few ways to get what you need in the middle of the desert. The easiest one is to have it ready and set up in the right place, long in advance.
- **Supply Caches** (`TSupplyCaches`)
  - desc: There are only few ways to get what you need in the middle of the desert. The easiest one is to have it ready and set up in the right place, long in advance.
  - ZoneGiveTTrait_Infantry = - [target: trait=TSupplyCaches_Armies]  -- Non-mechanical units receive: X

## Hidden Thumpers (`HiddenThumpers`)
- desc: Fremen are masters at using Shai-Hulud for transport. A secret technique lets them influence the movement of sandworms on the whole planet, facilitating wormriding.
- **Hidden Thumpers** (`THiddenThumpers`)
  - desc: Fremen are masters at using Shai-Hulud for transport. A secret technique lets them influence the movement of sandworms on the whole planet, facilitating wormriding.
  - Wormriding_NoCost = -  -- Riding Sandworms to or from this region does not consume Thumpers
  - Army_InZone_GainTTrait = - [target: trait=THiddenThumpers_Stealth]  -- Ally Military Units in the Region gain X

## Consolidation (`Consolidation`)
- desc: The constant redeployment of the Imperial army on various fronts of the Imperium has made them incredibly resistant. Through unusual formations and well-timed restocking, they can enhance this ability even further.
- **Consolidation** (`TConsolidation`)
  - desc: The constant redeployment of the Imperial army on various fronts of the Imperium has made them incredibly resistant. Through unusual formations and well-timed restocking, they can enhance this ability even further.
  - Mechanical_Armor_Flat = 2  -- X mechanical units Armor
  - Building_Armor_Flat = 2  -- X Armor on all Building_Villages
  - MainBase_Armor_Flat = 2  -- X Armor on all Main Bases

## Epic Quest (`EpicQuest`)
- desc: A personal mission given to a proud soldier is the best motivation in the world.
- **Epic Quest** (`TEpicQuest_NotFake`)
  - desc: A personal mission given to a proud soldier is the best motivation in the world.
  - ZoneGiveTTrait_PowerfullArmies = - [target: trait=TEpicQuest_buff]  -- The Military Unit with the most Power in the Region get: X
- **Epic Quest** (`TEpicQuest`)
  - desc: A personal mission given to a proud soldier is the best motivation in the world.
  - CustomProperty = 2 [target: trait=TEpicQuest_buff]  -- Description of a game mechanic not specific to an ATB

## Supply Drop (`SupplyDrop`)
- desc: An army without supply will not last long in the desert.
- **Supply Drop** (`TSupplyDrop`)
  - desc: An army without supply will not last long in the desert.
  - ZoneGiveTTrait_Infantry = - [target: trait=TSupplyDrop_Armies]  -- Non-mechanical units receive: X

## Decoy Thumper (`WormCalling`)
- desc: Fremen place thumpers in peculiar places to attract and enrage sandworms on their enemies' paths and out of theirs.
- **Decoy Thumper** (`WormCalling`)
  - desc: Fremen place thumpers in peculiar places to attract and enrage sandworms on their enemies' paths and out of theirs.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
- **Decoy Thumper** (`WormCalling_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## EMP Bomb (`EMPBomb`)
- desc: An electromagnetic pulse that will deactivated all electronics, making drones useless for a little while.
- **EMP Bomb** (`TEMPBomb`)
  - desc: An electromagnetic pulse will deactivated all electronics, making drones useless for a little while.
  - ZoneGiveTTrait_Mechanical = - [target: trait=TEMPBomb_Armies]  -- Mechanical units receive: X
  - TBuilding_GainTTrait2 = - [target: building=MissileBattery]  -- Xs: X
  - MainBase_GainTTrait = - [target: trait=TEMPBomb_Turrets]  -- The main base gains X

## Arrakis Diplomacy (`ArrakisDiplomacy`)
- desc: Empathy, patience, and attention for cultural differences lead to a great deal of success in getting the locals' favors.
- **Arrakis Diplomacy** (`TArrakisDiplomacy_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
- **Arrakis Diplomacy** (`TArrakisDiplomacy`)
  - desc: Empathy, patience, and attention for cultural differences lead to a great deal of success in getting the locals' favors.
  - Sietch_RelationGains_ARatio = 2  -- X% relation gain with Sietch
  - Sietch_TradeResGain_ARatio = 2  -- X% received resources when trading with Sietch

## Sleeper Agent (`SleeperAgent`)
- desc: With care and meticulousness, it's possible to plant a sleeper agent in every army squad that will betray them on command.
- **Sleeper Agents** (`TSleeperAgents`)
  - Infantry_NoTemp_OnDeath_TUnitSpawnChance = 0.5 [target: unit=H_Sleeper]  -- Non-temporary non-mechanical units have a X% chance to spawn a X upon death in combat
- **Sleeper Agents** (`TSleeperAgents_Owner`)
  - desc: With care and meticulousness, it's possible to plant a sleeper agent in every army squad that will betray them on command.
  - CustomProperty = 0.5 [target: unit=H_Sleeper]  -- Description of a game mechanic not specific to an ATB

## Poison the Reserves (`PoisonReserves`)
- desc: Tainted rations will not only make you physically sick but will infect even your trust and confidence in your teammates.
- **Poisoned Reserves** (`TPoisonReserves`)
  - desc: Tainted rations will not only make you physically sick but will infect even your trust and confidence in your teammates.
  - ZoneGiveTTrait_Armies = - [target: trait=TPoisonReserves_Armies]  -- Military Units receive: X

## Extraction Network (`ExtractionNetwork`)
- desc: Leaving combat to fight another day is not cowardice; it is tactical acumen.
- **Extraction Network** (`TExtractionNetwork_Fake`)
  - desc: Leaving combat to fight another day is not cowardice, it is tactical acumen.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Awake the People (`CrowdManipulation`)
- desc: Carefully placed instigators and targeted propaganda are enough to turn docile workers into violent dissidents.
- **Awake the people** (`TCrowdManipulation`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
- **Awake The People** (`TCrowdManipulation_All`)
  - desc: Fremen-longname have rallied the locals to defy the oppressive foreigners

## Interdiction Zone (`InterdictionZone`)
- desc: To be effective, a no-fly zone has to be enforced by a mix of political and legal means, as well as military support often given from space.
- **Interdiction Zone** (`TInterdictionZone`)
  - desc: To be effective, a no-fly zone has to be enforced by a mix of political and legal means, as well as military support often given from space.
  - Carryall_Stopped = -  -- Carryalls cannot be used
  - TAbility_Block = - [target: ability=Shuttle]  -- Blocks the X ability

## Live Performance (`LivePerformance`)
- desc: A good show provokes admiration, but a bad one invites mockery.
- **Live Performance** (`TLivePerformance`)
  - desc: A good show provokes admiration, but a bad one invites mockery.
  - Entity_KillLoot_TRes_Flat = 5 [target: resource=Influence]  -- Gain X X on kills
  - Unit_OnDeath_TResLose_Flat = 5 [target: resource=Influence]  -- Lose X X upon death in combat
  - Army_InZoneReal_GainTTrait = - [target: trait=TLivePerformance_Effect]  -- Ally military Units not in transports in the Region gain X

## Empirical Data (`EmpiricalData`)
- desc: Progress is a constant back and forth between theoretical breakthrough and practical issues. Collecting data from real life fights on the surface of Arrakis informs current researches.
- **Empirical Data** (`TEmpiricalData`)
  - Zone_InstigatorSetStacksTTrait_PerUnitInCombat = 1 [target: trait=TEmpiricalData_Stack]  -- Gain X stack per units in combat
- **Empirical Data** (`TEmpiricalData_Fake`)
  - desc: Progress is a constant back and forth between theoretical breakthrough and practical issues. Collecting data from real life fights on the surface of Arrakis informs current researches.
  - CustomProperty = 1 [target: trait=TEmpiricalData_Stack]  -- Description of a game mechanic not specific to an ATB

## Defense Breaches (`DefenseSabotage`)
- desc: Even the best fortress has weaknesses. With a little bit of planning, it's easy to exploit them and fully disorganize the defenders.
- **Defense Breaches** (`TDefenseSabotage_MainBase`)
  - desc: Even the best fortress has weaknesses. With a little bit of planning, it's easy to exploit them and fully disorganize the defenders.
  - Entity_DamageReceived_MRatio = 1.5  -- X% damage received
  - Entity_Armor_Flat = -3  -- X Armor

## Administrative Burden (`AdministrativeBurden`)
- desc: By liberal use of red tape and obfuscation, a colonial administration can be almost completely immobilised, at least for a while.
- **Administrative Burden** (`TAdministrativeBurden_MainBase`)
  - desc: By liberal use of red tape and obfuscation, a colonial administration can be almost completely immobilised, at least for a while.
  - MilitaryUnits_TrainingSpeed_MRatio = 0.4  -- Military Units are trained X% slower
  - Building_ConstructionSpeed_MRatio = 0.4  -- X% Building_Villages construction speed

## Cease Fire (`CeaseFire`)
- desc: Sometimes a ceasefire is the stepping stone to a durable peace. More often, it is only a stalling scheme.
- **Cease Fire** (`TCeaseFire`)
  - desc: This region is under Ceasefire. Units cannot fight here for the duration.
  - NoFight = -  -- Interrupts and prevents battles

## Hidden Backdoor (`HiddenBackdoor`)
- desc: A tiny security default, hidden deep within the mechanical engineering of any machine built by the House, can be activated at any moment to take control. There shall be no witness to such an event left alive, for it would ruin Ix reputation.
- **Hidden Backdoor** (`THiddenBackdoor`)
  - desc: A tiny security default, hidden deep within the mechanical engineering of any machine built by the House, can be activated at any moment to take control. There shall be no witness to such an event left alive, for it would ruin Ix reputation.
  - ZoneGiveTTrait_Mechanical = - [target: trait=THiddenBackdoor_Effect]  -- Mechanical units receive: X

## Toxic Vapors (`ToxicVapors`)
- desc: Chemical weapons are an easy way to get rid of military resistance if you are not too concerned with ethical considerations.
- **Toxic Vapors** (`TToxicVapors`)
  - desc: Chemical weapons are an easy way to get rid of military resistance if you are not too concerned with ethical considerations.
  - ZoneGiveTTrait_Infantry = - [target: trait=TToxicVapors_Armies]  -- Non-mechanical units receive: X

## Communication Jamming (`CommunicationJamming`)
- desc: Controlling the flow of information in battle is often the way to victory.
- **Communication Jamming** (`TCommunicationJamming`)
  - desc: Controlling the flow of information in battle is often the way to victory.
  - Operation_Block = -  -- Blocks all operations on the Region

## Hiding Tracks (`SandCloak`)
- desc: By choosing when to strike, Fremen can disarm the invaders of their strongest tools.
- **Hiding Tracks** (`TFremenHiddingTracks`)
  - desc: By choosing when to strike, Fremen can disarm the invaders of their strongest tools.
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=TFremenCloaked]  -- This Region and its neighbors gain X (xX max): X
  - Region_InstigatorAdjacentRegions_GainTTrait = - [target: trait=TFremenSabotage]  -- This Region and its neighbors gain X (xX max): X
- **Hiding Tracks** (`TFremenHiddingTracks_Fake`)
  - desc: By choosing when to strike, Fremen can disarm the invaders of their strongest tools.
  - CustomProperty = - [target: trait=TFremenCloaked]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = - [target: trait=TFremenSabotage]  -- Description of a game mechanic not specific to an ATB

## Orbital Strike (`OrbitalStrike`)
- desc: The Emperor always keeps a few ships in low orbit. They are ready to strike at any time, as long as they get the right coordinates.
- **Orbital Strike** (`OrbitalStrike`)
  - desc: The Emperor always keeps a few ships in low orbit. They are ready to strike at any time, as long as they get the right coordinates.
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - Zone_Spawn_TUnit_MissileGen = 1 [target: unit=C_MissileShip]  -- Spawns X Xs in the region on trait start

## Elacca Fog (`ElaccaFog`)
- desc: The Elacca drug from Ecaz forests is used in gladiator shows to inhibit self-preservation. During war time, it can be deployed as a thick fog to get the same effect.
- **Elacca Fog** (`ElaccaFog`)
  - desc: The Elacca drug from Ecaz forests is used in gladiator shows to inhibit self-preservation. During war time, it can be deployed as a thick fog to get the same effect.
  - Human_InCombat_Uncontrollable = -  -- In combat, non-mechanical units cannot be controlled

## Ambient Connection (`AmbientConnection`)
- desc: Drones can connect to the Nodal Network through natural static electricity, but preparation should be made and a temporary relay installed.
- **Ambient Connection** (`AmbientConnection`)
  - desc: Drones can connect to the Nodal Network through natural static electricity, but preparation should be made and a temporary relay installed.
  - CustomProperty = - [target: trait=Tethered]  -- Description of a game mechanic not specific to an ATB
- **Ambient Connection** (`AmbientConnection_NotFake`)
  - desc: Drones can connect to the Nodal Network through natural static electricity, but preparation should be made and a temporary relay installed.
  - ZoneGiveTTrait_InstigatorMechanical = - [target: trait=Tethered]  -- Mechanical units from instigator receive: X

## Infiltration Cells (`InfiltrationCells`)
- desc: There is a limit to what you can do from afar. If you really want to know someone, you need to get closer.
- **Infiltration cell** (`TInfiltrationCells_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Cell Search (`CellSearch`)
- desc: A cell of assassins is easy to miss, if you don't look for it meticulously.
- **Cell Search** (`TCellSearch_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Assassination (`Assassination`)
- desc: Murder is such an ugly word, but when someone has become too much of a pain, it can be efficient.
- **Assassination** (`TAssassination_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Disable Shield (`CB_DisableShield`)
- desc: Someone in the inner circle of Leto-fullname's court can open up the city from the inside.
- **Disable Shield** (`TCB_DisableShield_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Faufreluche Bribe (`CB_FraufrelucheBribe`)
- desc: The right gift to the right person at the right time will open doors that really should have stayed shut.
- **Faufreluche Bribe** (`TFraufrelucheBride_Fake`)
  - CustomProperty = 0.05 [target: resource=CQ_FaufrelucheRelations]  -- Description of a game mechanic not specific to an ATB

## Load a Nuclear Warhead (`ProduceNuclearHead`)
- desc: A NuclearHead will be installed safely into the Silo, in position for an unscheduled launch.
- cost: {'qty': 5000, 'res': 'Solari'}
- cooldown: onActivate=0

## Cancel Nuclear Warhead (`CancelProduceNuclearHead`)
- desc: The cost will be refunded fully
- cooldown: onActivate=0

## Launch Nuclear Warhead (`LaunchNuclearHead`)
- desc: The use of nuclear weapons against humans is forbidden by the Great Convention. There is no greater crime recognized by Landsraad-longname.
- **TNukeTargeting_Fake_Self** (`TNukeTargeting_Fake_Self`)
  - CustomProperty_Inverted = 500 [target: resource=Standing]  -- Description of a game mechanic not specific to an ATB
- **TNukeTargeting_Fake** (`TNukeTargeting_Fake`)
  - CustomProperty_Inverted = 4000  -- Description of a game mechanic not specific to an ATB
  - CustomProperty_Inverted = 20 [target: trait=TNukeTargeting_Village]  -- Description of a game mechanic not specific to an ATB
  - CustomProperty_Inverted = 20 [target: trait=TNukeTargeting_MainBase]  -- Description of a game mechanic not specific to an ATB

## Repopulate (`RestoreSietch`)
- desc: Remove the DevastatedSietch affliction from this Sietch.
- cost: {'qty': 150, 'res': 'Manpower'}; {'qty': 1000, 'res': 'Solari'}

## Obfuscate (`BlackoutDev`)
- desc: This development will have no effect for any faction. Can obfuscate a single researched development.
- cost: {'qty': 20, 'res': 'Standing'}

## File Patent (`PatentDev`)
- desc: Every other faction will have to pay Vernius <good>500</good> Solari to research this development. Patents can be filed on developments that only Vernius-longname has researched.
- cost: {'qty': 600, 'res': 'Solari'}

## SpyCapture (`SpyCapture`)

## VillageInfiltration (`VillageInfiltration`)

## ResearchTheft (`ResearchTheft`)

## Threat (`Threat`)

## Promise (`Promise`)

## GrantInfluence (`GrantInfluence`)

## GrantAuthority (`GrantAuthority`)

## UnderworldCells (`UnderworldCells`)

## PoliticBribe (`PoliticBribe`)

## ChoamShares (`ChoamShares`)

## PoliticalAudit (`PoliticalAudit`)

## GhostMarket (`GhostMarket`)

## NukeTargeting (`NukeTargeting`)

## MaraudersRaid (`MaraudersRaid`)
- desc: Corsair and mercenaries have always been a part of warfare. Being able to deleguate military tasks to an outside entity is just more practical, in many cases.
- **Pillage Raid** (`TMaraudersRaid_Fake`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB
- **Pillage Raid** (`TMaraudersRaid_Fake2`)
  - CustomProperty = -  -- Description of a game mechanic not specific to an ATB

## Brace for the Storm (`BraceForStorm`)
- desc: Village activities are sacrificed for resilience
- cooldown: onCancel=0.5
- **Bracing for the storm** (`Storm_Village_Brace`)
  - Sandstorm_VillageBraceEffects = -  -- Your village won't be damaged by Sandstorms
  - Res_LocalProd_MRatio = 0.5  -- X% local production

## Incite Rebellion (`CB_InciteRebellion`)
- desc: The Harkonnen-adjective propaganda machine is a paper tiger. If you fight back a little bit it will fold on itself.
- **Incite Rebellion** (`TCB_InciteRebellion_Fake`)
  - CustomProperty = 0.3  -- Description of a game mechanic not specific to an ATB

## Network Nexus (`NetworkNexus`)
- desc: Move the Network Nexus to this Village.
- cooldown: onActivate=2, localCooldown=False, onCancel=2
- **Network Nexus** (`TNetworkNexus`)
  - desc: Vernius-longname
  - Outpost_Prod_ARatio = 0.5  -- X% resource production

## Deploy Sails (`DeploySails`)
- desc: Deploy additional sails to speed up the ship.
- cooldown: onStartGame=0.1, onEndDuration=6, localCooldown=True
- **Deploy Sails** (`F_Frigate_Buff`)
  - desc: Deploy additional sails to speed up the ship.
  - Unit_Speed_MRatio = 3  -- X% unit Speed

## Decimation Protocols (`DecimationProtocols_Old`)
- desc: Drones calibrated to the H_Frigate in the area receive an electrical surge that overcharge their weapons, but damage the drone circuits.
- cooldown: onStartGame=0.1, onEndDuration=6, localCooldown=True
- **Decimation Protocols** (`H_Frigate_Buff_Old`)
  - desc: Drones calibrated to the H_Frigate in the area receive an electrical surge that overcharge their weapons, but damage the drone circuits.
  - Army_SubUnits_GenerationSpeed_ARatio = 1  -- Sub units are generated X% faster
  - Ally_Drones_AtTRange2_GainTTrait = - [target: trait=H_Frigate_Drones_Buff]  -- Ally Drones in X gain X

## Development Investment (`DevelopmentInvestment`)
- cooldown: onCancel=0.5
- **Development Investment** (`TDevelopmentInvestment_Target`)
  - desc: Hasimir Fenring has chosen to invest in that village's economy.
  - Outpost_Prod_ARatio = 0.2  -- X% resource production
  - CustomProperty = 0.2  -- Description of a game mechanic not specific to an ATB
- **Development Investment** (`TDevelopmentInvestment_Self`)
  - Res_CopyProd_MRatio = 0.2  -- X% of village's total production is copied

