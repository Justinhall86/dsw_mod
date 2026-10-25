# Vanilla mechanics that could work for House Ginaz (working-backwards scan, revision 2)

Written for: you (the designer), and whoever codes this later. Read-only scan of `mod_files/data.cdb`, first pass 2026-10-24, **re-verified
and extended 2026-10-25** (this revision). The earlier mechanics list in `../MECHANICS.md` is set aside, as you asked.

**Is the scanned file really vanilla?** Checked by diffing against `mod_files/data_vanilla_2026-10-22.cdb`: only `unit A_Elite` (the Ginaz Captain:
squad 4 to 5, name, text, sounds), `unit A_LandsraadGuard` (new), four `model` records and `structure Arrakeen` differ. Every record cited below is
identical to vanilla, and `A_Elite`'s stats, traits and equipment are unchanged.

## Corrections to revision 1 (what was wrong)
| # | Entry | First pass said | Data says |
|---|---|---|---|
| 6 | Corrino war grudge | A grudge: destroying Corrino's main base rewards the enemy. A Kanly substitute. | **Backwards.** It is a Corrino conquest perk. After 50 days at war, the enemy's main base is marked. If *Corrino* destroys it, *Corrino* gets a second Deploy Main Base use (`Corrino_HegemonyBonus2` text). Not a vendetta. Only the "days at war" timer attribute is reusable. |
| 13 | V_Hero_2 "Evasion" execute | Executes enemies under 1 % Life | Value 1 = 100 %. The buff text is "The next attack executes, and removes V_Hero_2 from combat": an **unconditional one-shot**, 30 s, 1 stack. |
| 18 | Plot_Assassination "Lurking/Ominous Threat" | Agent production **+50 % / +25 %** | These are Conquest **plots (threats)**. `CBP_Assassination1/2` set Agent `TRes_Prod_MRatio` to **0.5 / 0.25**: a penalty, not a buff. |
| 2, 17, 18 | Political Duel, Plots, Assassin School | Presented as ordinary faction features | They sit in the `bonus` sheet, which is the **Conquest campaign** reward pool (`Ecaz_FactionBonus*`, `*_MissionReward*`, `Plot_*`). The traits inside them are ordinary traits, so they can probably be attached some other way, but that is untested. |
| 4 | Vow of Honor | "Nearby Trooper allies +1 Power" | Targets the unit id **`E_Trooper`** only. A Ginaz trooper needs the target retargeted. |
| 5 | Parrying Armguards caveat | "Which equipment grants it was not traced" | Resolved: equipment `ParryingArmguards` (500 Solari) is on A_Trooper, A_LandsraadGuard, A_Elite, H_Elite, C_Trooper, C_Elite and **E_Special (Fencer)**. `SoberingMedication` is on E_Trooper only. |
| 10 | Last Stand | "Refuse to die"; could be the Discipline Cross (allies cannot rout) | It does **not** stop death or rout. It is an Atreides Elite equipment: own Speed x0.5, +5 Armor, ignores allied buffs, and "cannot be turned off while engaged in melee". |
| 9 | Bloodthirsty | "Unit that dies at range" | Range is `Short_Range` (a death near the elite), not ranged units. Stack caps are 20. |
| 21 | Executioner | Executes under 5 % | 5 % base, **+2 % per allied unit at Medium_Range, up to 20 stacks** (so up to 45 %). Sardaukar's Cleaver equipment adds 10 %. |
| 3 | Whitmore | +2 more champions; skill adds stacks | Also: his skill **consumes 1 Trophy stack every 4 seconds**. Champion count is stated three ways (see entry 3). |
| 1 | Champion | "Pure data copy" | The ability is gated `onlyForFactions: Ecaz` and built on Ecaz-named hooks (`Unit_EcazChampion`, `Faction_EcazChampion_GainTTrait`). Whether they work for another faction is untested. |

---

## How to read each entry
- **Source:** ids in the data (sheet in brackets).
- **What it does:** exact values; attribute descriptions quoted from the data.
- **Ginaz use / Fit / Caveats:** as before. Fit scores are my judgement. Build is "data only" unless noted.

Sardaukar-styled mechanics (Battlefield Frenzy, Executioner, the Cleaver) are flagged and are ideas only, never parts.

---

## Tier 1: strongest fits (duel, champion, honour, teaching)

### 22. NEW. The Fencer: the vanilla duellist [unit `E_Special`, trait `E_Special_Trait` "Deadly Dance"]
Missed in revision 1, and it is the best fit in the file. Text: "Fencers trained all day, every day to be the best duelist in the universe. On the
battlefield, they often take the heat off of their lesser peers." Stats 300 Life / 11 Power / 1 Armor.
- **Deadly Dance:** `Entity_DamageReceived_FromTarget_MRatio` **0.6**: takes 40 % less damage from the unit it is currently fighting. This is a duel
  stance: strong against one opponent, weak against being swarmed. It is the closest thing to a parry in the data.
- **Kit (4 equipment, 500 Solari each):**
  - *Jumping Boot* (`TJumpingBoot`): after its target dies, +100 % Speed for 2 s (a gap-closer to the next duel).
  - *Personal Mantlet* (`TPersonalMantlet`): +5 Armor until its first attack in a combat.
  - *Chasing Stance* (`TChasingStance`): each hit puts "Chased" on the target: Speed x0.8 (1 stack).
  - *Parrying Armguards* (see entry 5): -10 % melee damage taken.
- **Ginaz use:** the Neophyte or the Captain's chassis. Deadly Dance is the signature "one opponent at a time" rule, and the four-item kit is a ready
  loadout menu. Combined with Parrying Armguards that is -40 % from the target and -10 % in melee.
- **Fit:** 5/5. Build: data only (copy the unit's traits and four equipment records).
- **Caveat:** how Deadly Dance picks "target" (current melee target) was not tested. Stack with the Mantlet and Armguards before balancing.

### 1. The Champion system (Ecaz) [ability `EcazChampion`, trait `TEcazChampion`, trait `Ecaz_HegemonyBonus1`]
- **Unlock:** Ecaz Hegemony 5K (`Ecaz_HegemonyBonus1`): "A single Ecaz non-mechanical unit can be named Champion, who raises Hegemony by killing other
  factions' units." Ability costs 1000 Solari, `apply.need` 6 (meaning unconfirmed), **`onlyForFactions: Ecaz`**.
- **Champion trait:** max Life x1.2, Power x1.2, +2 Armor, `Entity_ExecuteImmune`, 5 % taller. Each enemy-faction kill it takes part in adds one
  `TEcazChampion_Buff_Stack` ("Champion's Trophy", cap 500): +100 on the `EcazChampion` Hegemony track per stack.
- **Related:** `Ecaz_PerfectRecruit` ("Perfected"): Life x1.2, Power x1.2, 5 % taller, but **regeneration costs x2** (the price of a perfect recruit).
  All Hero units also have `Entity_ExecuteImmune` via `Hero_Trait`, so champion immunity matches how heroes already behave.
- **Ginaz use:** almost exactly the Ginaz "Name Champion" design (G-15). Decision: keep vanilla immunity or give Ginaz a different champion rule.
- **Fit:** 5/5. Build: copy plus change the faction gate. **Risk:** the Ecaz-named attributes may be hard-wired to the Ecaz faction. Test with a copy
  before building anything on top.

### 2. Political Duel and champion rewards [Conquest bonuses `Ecaz_FactionBonus2/5/6`, `Ecaz_MissionReward4`; attribute `Faction_EcazChampion_GainTTrait`]
- **Political Duel (`CB_Ecaz_FactionBonus2` -> `_Effect`):** each kill a Champion takes part in: **+3 Standing and +10 Influence** (`Army_OnEliminateFactionUnit_GainTRes`).
- **Same hook, other bonuses:** *Lonely Quest* (champion gains a buff per discovery resolved outside Ecaz territory), *Helpful Entourage* (champion
  is supported by 4 `E_HelpfulEntourage` followers: 200 Life / 10 Power / 4 Armor, squad 1), *Tourney Culture* (champion buff).
- **The Knight of the Windmill (`Ecaz_FactionBonus4`):** "Start every game with a Perfect Recruit Champion Knight at max level" plus a free Squire. Built with
  `TUnit_SpawnMB_InTBlackboard2`, `TBBUnits_GainTTrait2`, `TBBUnits_SetXpLevel`. This is a ready pattern for "spawn a named champion at game start".
- **Conquest only:** the wrappers are Conquest-pool bonuses. `Faction_EcazChampion_GainTTrait` ("Champions gain X") is the reusable part.
- **Ginaz use:** duel reward (Standing/Influence per kill). Fit 5/5; Build: medium, because of the Conquest wrapper.

### 3. Whitmore and Rivvy, the Ginaz instructors [heroes/characters `E_Hero_1` Whitmore, `Rivvy`; traits `E_Hero_1_*`, `WhitmorePassive`, `RivvyPassive`]
- **Lore:** both data texts say they were "renowned instructor[s] at the Ginaz swordmaster school. After the fall of Ginaz, he entered the service of House Ecaz."
  The game already frames Ginaz as fallen, with its masters scattered.
- **Whitmore (unit `E_Hero_1`):** 1000 Life, 20 Power, 6 Armor; Warrior_Trait; is himself a Champion.
  - `E_Hero_1_FactionBuff`: `Faction_ExtraEcazChampion_Flat` = **2** ("Can apply EcazChampion on 2 more units"). The trait's own UI text says "a second champion
    of a different type". Both numbers are in the data; treat "how many extra champions" as unresolved.
  - `E_Hero_1_ChampionBuff`: each Trophy stack gives champions **+1 % max Life** (`Entity_Life_ARatio` 0.01).
  - Skill *Frightful Champion*: per Trophy stack +1 Power and +0.5 Armor, but **"Consume 1 Trophy stack every 4 seconds"**. It spends the stacks that also
    produce Hegemony. A built-in trade-off, not free damage.
- **WhitmorePassive (the character's passive trait, "Swordmaster Teacher"):** +1 more champion and **military units start with +1 Experience level**.
- **RivvyPassive (the character's passive trait, "Swordmaster Teacher"):** **units at max level have no Solari upkeep** and military units start with +1 Experience level.
  (Whether these characters are councillors, and in which slot, was not traced.)
- **Ginaz use:** a Master of Ginaz hero that coaches champions, and a "veterans cost nothing" teacher councillor. Rivvy's upkeep rule is a clean fit for a
  small elite army.
- **Fit:** 5/5. Build: hero record plus three traits (data only), plus the champion caveat in entry 1.

### 24. NEW. XP as the House's currency [Conquest bonuses `Atreides_FactionBonus2` "Ginaz Swordmasters", `Atreides_MissionReward1` "Ginaz Schools"; quest `GinazSwordmasters`]
- **Ginaz Swordmasters (`CB_Atreides_FactionBonus2`):** `Army_ExperienceGain_ARatio` 1 (+100 % XP gain), `Army_XPLevel_Effects_ARatio` 1 and
  `Army_XPLevel_AdditionalEffects_ARatio` 1: **experience level effects doubled**. Name matches the House exactly.
- **Ginaz Schools:** military units gain 2 Experience every day (`Army_Daily_GainExperience_Flat`).
- **Quest `GinazSwordmasters`** ("A renowned swordmaster from Ginaz is visiting your palace. You could try to convince them to join your service."): two subquests.
  *Demonstrate your might* (8 militia kills) and *Give them a taste of Arrakis* (3 discoveries outside territory with a unit): each gives **1 free Elite**
  and +300 Quests Hegemony. Pre-built "earn a Ginaz Captain" pattern.
- **Ginaz use:** the House's identity as masters who make veterans. Pairs with Rivvy's upkeep rule (entry 3) and Gurney's lessons (entry 15).
- **Fit:** 5/5. Build: data only for the traits; the quest is a straight copy.

### 4. Vows (Ecaz Knight equipment) [equipment `VowOfBravery/Fervor/Heroism/Honor`; unit `E_Elite`]
The Knight (`E_Elite`: 250 Life, 25 Power, 2 Armor, squad 2, Warrior_Trait, upkeep 20 Solari + 5 Command Points) lists four alternative 500-Solari vows.

| Vow | Trait | What it does | What it costs |
|---|---|---|---|
| **Bravery** | `TVowOfBravery` | attacks ignore 50 % of enemy Armor (`Entity_Attacks_IgnoreArmor_MRatio` 0.5) | -2 Armor |
| **Fervor** | `TVowOfFervor` | +20 % damage (`Unit_Damage_ARatio` 0.2) | -100 Life (`Army_Life_Flat`) |
| **Heroism** | `TVowOfHeroism` | +15 Power (`Entity_Power_Flat`) | +3 Command Points upkeep |
| **Honor** | `TVowOfHonor` | `E_Trooper`s at `Short_Range` gain +1 Power (`TVowOfHonor_Buff`, cap 1) | none |

- **Also on the Knight:** *Nobility* (`E_Elite_Trait`): +1 Armor per other non-mechanical ally nearby (max 10).
- **Ginaz use:** a duellist's oath choice on the Captain. **Honor must be retargeted** from `E_Trooper` to the Ginaz trooper.
- **Fit:** 5/5. Build: four equipment records.
- **Caveat (inferred):** the game offers one equipment per slot; verify in the armory.

### 5. Parrying Armguards and Sobering Medication [equipment `ParryingArmguards`, `SoberingMedication`]
- **Parrying Armguards:** melee damage received x0.9 (`Entity_DamageReceived_InMelee_MRatio`). Carried by A_Trooper, A_LandsraadGuard, A_Elite, H_Elite, C_Trooper, C_Elite, E_Special. 500 Solari.
- **Sobering Medication:** 50 % of damage bonuses become damage reduction (`Entity_TurnDamageModifierIntoDamageReduction` 0.5). E_Trooper only.
- **Ginaz use:** the parry stand-in. Combine with Deadly Dance (entry 22) for a real duelist.
- **Fit:** 4/5. Build: data only.

### 6. Days-at-war timer (Corrino) [trait `Corrino_HegemonyBonus2`, `_WarSource`, `Corrino_WarEnemy`, `_MainBase`, `_DestroyedMB`; attribute `Faction_GiveTTrait_AtWarSinceDays`]
**Reduced to a precedent.** Not a grudge (see corrections table).
- **What it really does:** `Faction_GiveTTrait_AtWarSinceDays` 50: "Being in War with [me] for N days gives [trait] to the Faction". Corrino puts `Corrino_WarEnemy` on
  such a faction, whose main base then carries `Corrino_WarEnemy_MainBase`. If Corrino destroys it, Corrino gets `_DestroyedMB`: +1 maximum main base and the
  source trait is blocked afterwards.
- **Same bonus:** +15 Influence per kill on the territory of a faction in **Peace** (`Entity_KillTruceTerritoryLoot_TRes_Flat`).
- **Ginaz use:** reuse only the *time-at-war timer* (for example "after N days of war with a rival, the House gains a Vendetta trait"). The reward side is Ginaz's to design.
- **Fit:** 2/5 as a feud (it is not one). Build: data only for the timer.

### 7. Honour penalties for breaking treaties [Ecaz trait `Ecaz`, councillor `JessicaPassive`, hero `E_Hero_2` Ilesa]
- **Ecaz:** `Treaty_Break_TResLoss_MRatio` 2 on Standing. UI text: "Get no damage bonus and lose +100% Standing when betraying a Peace".
- **Jessica ("The Voice"):** other factions lose 50 more Standing when breaking a treaty with you (`Treaty_EnemyBreak_TResLoss_Flat` -50); also no Authority upkeep for treaties
  and `Allow_PeaceForce` (impose Improve Relations at an Influence cost).
- **Ilesa ("Thorny Rose"):** killing her on Ecaz territory costs the killer 50 Standing (`Army_OnDeathInOwnTerritory_KillerFaction_TResLoss_Flat`).
- **Ginaz use:** the honour pillar. A House whose word is law and whose masters are costly to kill.
- **Fit:** 5/5. Build: data only.

---

## Tier 2: good fits with a little design work

### 8. Kill counters that convert to resources (Harkonnen) [trait `Harkonnen_HegemonyBonus_1`, 5K]
- Each **20** enemy non-mechanical units killed gives an Agent with `Brainwashed` (-10 % of every resource). Same bonus: +50 Intel per pillaged Village.
- **Ginaz use:** the "N kills grant X" counter shape. Fit 3/5. Build: the counter attribute exists, the reward is yours.

### 9. Stacking power from deaths (Bloodthirsty) [Harkonnen `H_Elite_Trait`/`H_Elite_Buff`; hero `H_Hero_2` Iakin]
- **Elite:** +1 Power per unit death within `Short_Range` while in combat (cap 20 stacks).
- **Iakin:** per unit dying in combat while he is the instigator: +1 Power and +0.5 Armor, cap 20. Skill *Survival of the Fittest*: at 0 Life he steals the Life of an owned human in short range.
- **Ginaz use:** momentum stacks. Fit 4/5. Build: data only.

### 10. Last Stand Protocols [equipment/ability `LastStandProtocols` on `A_Elite`; traits `TLastStandProtocols`, `_Buff`]
- Active stance: own Speed x0.5, +5 Armor, ignores allied buffs, "cannot be turned off while engaged in melee".
- **Ginaz use:** a defensive stance, not a rout-breaker. For the old "allies cannot rout" Discipline Cross, nothing in the data does that yet.
- **Fit:** 3/5. Build: one ability plus one buff trait.

### 11. Melee lock that slows enemies (Warrior close combat) [`Warrior_Trait`, `Warrior_Trait_Debuff`]
- Enemy ground units **at War** inside **`Melee_Strict`** range get Speed x0.9 (`Entity_GiveTTrait_GroundUnitAtWar_AtTRange2`).
- **Holders:** A_Elite, A_Hero_1/2, H_Elite, H_Hero_1/2, F_Elite, S_Hero_2, C_Hero_2, E_Elite, E_Hero_1, V_Trooper, I_Elite, Trooper, Sardaukar, militia melee and Landsraad soldiers.
- **Fit:** 4/5. Build: data only.

### 12. Armour answers: Easy Target, Heavy Hitter, Armor Penetration [`S_Elite_Trait`/`S_Elite_Buff`, `F_Elite_Trait`, `ArmorPenetration_Trait`]
- *Easy Target* (Smugglers elite): target at most **3 Armor** gives Power x1.5. *Heavy Hitter* (Fremen Fedaykin) and *Armor Penetration* (Ilesa): ignore **50 %** of enemy Armor.
- **Fit:** 4/5. Build: data only. Close to the Vow of Bravery, so choose one per unit.

### 13. One-shot execute with a catch (Vernius) [`V_Hero_2_Trait_Buff_Execute` "Evasion"]
- Corrected: next attack executes (`Entity_ExecuteTarget_HealthRatio_Flat` 1 = 100 %), 30 s, 1 stack, then lost on attack and the unit leaves combat.
- **Ginaz use:** a "decisive thrust". Heroes and champions are immune, so it only hits ordinary units. **Fit:** 3/5 (stealth feel warns against it). Build: data only.

### 14. Adversity makes the army stronger (Atreides 5K) [`Atreides_HegemonyBonus_1`, `Atreides_NegativeResolution`, `Atreides_PositiveResolution`]
- Negative Landsraad resolution: Army Power +10 % (`Army_Power_ARatio` 0.1, **stack limit 3**). Positive resolution: +10 % Solari production (same cap). Both come from one 5K trait.
- **Fit:** 4/5. Build: copy the pattern.

### 15. The Teacher aura (Gurney) [`A_Hero_2_Trait` "Exemplar Teacher", `A_Hero_2_FactionBuff`, `A_Hero_2_UnitsBuff_1_Melee/_Range`, `_2`]
- Each XP level gives a "Gurney's Lesson" stack (cap 10) to A_Trooper, A_Elite, A_Soldier and A_Demo. Melee: +1 Armor per stack. Ranged: +5 % attack speed per stack.
  Units in range also gain +50 % Experience.
- **Fit:** 4/5. Build: data only (the units in the list would be Ginaz's own).

### 16. Vow of Honor as an elite aura
- Entry 4 covers it. A `Short_Range` +1 Power aura for the lesser unit while the Elite is near. Also `KnightlyProtector`: squire +1 Armor while an Elite is in range.

### 23. NEW. The Squire protects the Knight [`E_Trooper` and its four equipment]
- Squire 450 Life / 10 Power / 7 Armor. `E_Trooper_Trait` "Crusher": each hit puts "Crushed" on the target: -2 Armor (1 stack).
  *Prickly Spear*: damage to an enemy applies a debuff until combat ends: target deals x0.8 damage to anyone who is not a squire (a taunt).
  *Knightly Protector*: +1 Armor while an Elite is near. *Front Line Tactics*: gives a nearby ally +1 Armor at the cost of -1 Power to itself.
- **Ginaz use:** the Neophyte as a support: taunt the enemy and strip armour for the duellist to finish. Fit 4/5. Build: data only.

---

## Tier 3: interesting, but a bigger lift or a weaker fit

### 17. Plots: threat meters (Conquest only) [`Plot_*`, type 6]
- Four tracks (Murder/Assassination, Bankruptcy, Defamation, Pressure) with stage penalties: e.g. Assassination cuts Agent production x0.5 then x0.25;
  Bankruptcy cuts Solari gains x0.9 then x0.7; Defamation starts missions with less Standing; Pressure raises attack chance; Pressure_Defeat "The conquest is lost".
- **Ginaz use:** a "Kanly pressure" meter. Conquest mode only; triggers untraced. Fit 3/5. Build: medium to large.

### 18. Assassin School (Harkonnen Conquest bonus) [`Harkonnen_FactionBonus9`]
- Recruit 1 free Assassin per day if none present (`Faction_DailySpawn_TUnit_Flat`). **The Plot_Assassination entries are penalties, not related buffs** (see corrections).
- Weak fit (Ginaz is not an assassin cult). Fit 2/5.

### 19. Duncan's heroism [`A_Hero_1_Trait`, `_Heroism`, `_GholaWisdom`]
- Heroism: +2 Power, +1 Armor per allied bonus effect (cap 10). Ghola Wisdom: +3 Power and +150 Life per previous death of its kind.
- **Flag:** Duncan as a source. Confirm the no-Duncan rule covers mechanics. Fit 3/5.

### 20. Cloaking (Chani) [`F_Hero_1_Trait` "Ghost Army", `F_Hero_1_UnitBuff`, `Entity_Cloaked`]
- Cannot be seen outside combat; enemies near give 5 Intel on death; ground non-militia units get stealth. Fit 2/5 (not a mystery House).

### 21. Battlefield Frenzy and the Executioner (Sardaukar) [`TBattlefieldFrenzy`, `C_Elite_Trait`/`C_Elite_Buff`, `TSardaukarCleaver`]
- Frenzy: +1 % attack speed per ally at Medium_Range. Executioner: execute under 5 % plus 2 % per ally at Medium_Range, up to 20 stacks. Cleaver: +10 %.
- **Flag: Sardaukar-styled.** Ideas only. Fit 2/5.

### 25. NEW. Kanly Duel game mode [`gameMode Kanly`, traits `Kanly_Global`, `Kanly_MainBase`, hegemony `Kanly`]
- A two-faction duel mode (`Kanly_Max_Players` 2, short game 30 days; text: "A fast and thrilling duel for revenge and power"). `Kanly_Global` multiplies Authority, Agent, Knowledge and
  Plascrete by x2/x1.5, **XP gains x1.5, Standing gains and losses x1.5**, recruitment time x0.5. `Kanly_MainBase`: main base Life x0.5 and `Entity_Armor_MRatio` 1 (meaning of 1 for this attribute not confirmed).
- **Not a mechanic we can borrow wholesale.** It confirms Kanly is a *mode*, and shows the multiplier values the designers use for a fast duel. Fit 2/5.

### 26. NEW. Open question: where the game keeps "Ginaz"
- Text mentions: unit `A_Elite` (our edit), quest `GinazSwordmasters`, bonuses *Ginaz Swordmasters*/*Ginaz Schools*, Whitmore, Rivvy. No faction, no leader, no hegemony track. The House is only ever a
  set of instructors in the vanilla data. Nothing here conflicts with a new faction.

---

## Bundles that work together (revised)

**Bundle A: The Fencer House (strongest fit, new).** Entries 22, 5, 4, 23.
Fencer chassis (Deadly Dance), Armguards, the four Vows on the Captain, Squire support. All inside the Ecaz duellist kit, no new attributes.

**Bundle B: Champion line.** Entries 1, 2, 3, 24.
Named Champion, kill rewards, Whitmore/Rivvy teacher councillors, XP-doubling. **Gate: test whether the Ecaz champion hooks work for a non-Ecaz faction first.**

**Bundle C: Cold steel.** Entries 11, 12, 10, 9. Warrior slow, armour answers, last-stand stance, death stacks.

**Bundle D: Honour and teaching.** Entries 7, 14, 15, 24. Treaty-break penalties, adversity power, Gurney's lessons, XP currency. (Entry 6 now only contributes the timer attribute.)

## Blocked-item precedents (corrected)
| Earlier item | Vanilla precedent |
|---|---|
| G-05 parry | Parrying Armguards (x0.9 melee), **Deadly Dance (x0.6 from current target)**, Sobering Medication |
| G-09 Kanly melee bonus | War-state melee traits (Warrior close combat); days-at-war timer (Corrino). Not a feud |
| G-15 Name Champion | EcazChampion ability and trait (Ecaz-gated) |
| G-16 Ritual Duel | No duel ability. Closest: Deadly Dance, Prickly Spear (target deals x0.8 vs non-squires) |
| G-17 kill Hegemony | Champion's Trophy stacks; Political Duel Standing and Influence |
| G-18 Declare Kanly | No equivalent. Kanly is a game mode |
| G-19 Assassin contracts | Assassin School (Conquest) only; Plot_Assassination is a penalty |
| G-20 aura | Vow of Honor, Knightly Protector, Gurney's lessons (XP-level stacks) |

## Caveats
- **Scanned, not played.** Every item needs an in-game test.
- **Still inferred:** Vow slot behaviour (one per unit), Champion `apply.need` 6, the Plot trigger values, "target" selection in Deadly Dance, and whether the Ecaz-named champion attributes
  work outside Ecaz.
- **Conquest-pool bonuses** (entries 2, 17, 18, 24 bonus parts, the Ecaz/Atreides/Harkonnen `*_FactionBonus*` and `*_MissionReward*` records) are Conquest-mode wrappers around ordinary traits.
- **Not checked:** the `implemented` flag on every item (the ones I opened were `true`).
- Machine-readable copy: [candidates.json](candidates.json). Raw dumps behind the corrections: `verify_dump*.txt`. Scripts: `02_verify.py` to `06_verify5.py`.
