# House Ginaz: faction mechanics (working spec)

Written for: the designer (you) and whoever later codes these into the game data. Each mechanic has an ID (`G-xx`) that matches
[mechanics.json](mechanics.json), the machine-readable copy. Numbers are **design values** from the concept drafts or proposals in
[../faction_design.md](../faction_design.md), not yet tested. Attribute ids were checked against `mod_files/data.cdb` on 2026-10-24.

## Status keys
| Status | Meaning |
|---|---|
| **BUILDABLE** | an exact attribute exists; only values and a trait entry are needed |
| **APPROX** | no exact attribute; implement with a named stand-in, and say so in the in-game text |
| **BLOCKED** | needs an engine condition, trigger or ability we have not found yet (see Open technical questions) |
| **DECIDE** | the design has two versions; you choose one before coding |

## 1. Identity rules (no numbers, enforced by equipment and unit lists)
| ID | Mechanic | Status | Notes |
|---|---|---|---|
| G-01 | **No shields, no firearms** on Ginaz units | APPROX | Enforced by never giving Ginaz units shield or firearm equipment. For a takeover of an Atreides slot, remove those equipment slots from the unit. |
| G-02 | **Throwers are allowed** (thrown daggers are ranged but not firearms) | DECIDE | Confirm the rule text says "no firearms and no shields", not "no ranged". |

## 2. Core faction traits (always on)
Each becomes one trait in the faction's `startingTraits`, following the Atreides pattern.

| ID | Mechanic | Values (design) | Attributes | Status | Notes |
|---|---|---|---|---|---|
| G-03 | **School of the Sword** | +10 % movement speed, melee infantry | `Unit_Speed_MRatio` | BUILDABLE (speed) | The +20 % evasion half is APPROX (see G-04). |
| G-04 | **Evasion** (part of School of the Sword) | +20 % base | none exact | APPROX | Stand-in: extra armour, `Entity_Armor_MRatio` or `Entity_ArmorByMissingHealth_Flat`. The in-game text must say "evasion is implemented as extra armour". |
| G-05 | **Martial Honor: parry** | 15 % parry on hit; a parry negates the hit | none exact | APPROX | Stand-in: damage reduction, `Entity_TurnDamageModifierIntoDamageReduction`. True parry needs engine code. |
| G-06 | **Riposte stacks** (feeds from parry in v2, from hits in v1) | +5 % attack speed and +5 % damage per stack, max 5 | `Unit_FightTarget_OnDamageUnit_GainTTraitStacks`, `Entity_AttackSpeed_MRatio`, `Unit_MeleeAttacks_Damage_MRatio` | BUILDABLE if fed by hits; APPROX if fed by parry | **DECIDE:** feed stacks from hits (reliable) or parries (v2, slower). |
| G-07 | **Swordmaster Discipline: upkeep** | -20 % upkeep (multiplier 0.8) | `Army_StockUpkeep_MRatio` | BUILDABLE | Exact. Value convention confirmed in section 9. |
| G-08 | **Swordmaster Discipline: desert supply** | -50 % supply drain in the Deep Desert (multiplier 0.5) | `Army_DeepDesertDailySupplyDrain_MRatio` | BUILDABLE | Engine search found the exact attribute, and the Deep Desert test is built in. Closest reference: vanilla `DesertMastery`. |
| G-09 | **Kanly Retribution** | +30 % melee damage vs rivals | `Armies_AtTRange2_AtWar_GainTTrait`, `Entity_GiveTTrait_UnitAtWar_AtTRange2`, `Faction_GiveTTrait_AtWar` (stand-ins) | APPROX | No Kanly rival state exists. Stand-in is the **War** state. No melee attribute is conditioned on an enemy at war, so this is a unit-in-war trait. See section 9. |
| G-10 | **Combat Experience power** | +15 % | `Army_XPLevel_Effects_ARatio`, `Army_ExperienceGain_ARatio` | BUILDABLE | From draft v3. |
| G-11 | **Benefits from high Standing** | scales with Landsraad Standing | `Standing_BetterHighTraits` | BUILDABLE | From draft v3. |
| G-12 | **Cannot pillage neutral villages** | block | `Pillage_NeutralVillage_Block` | BUILDABLE | From draft v3; also a drawback, so it is the House's honour rule. |

## 3. Hegemony milestones
| ID | Milestone | Option A (draft v3) | Option B (draft v2) | Status |
|---|---|---|---|---|
| G-13 | **5K** | +10 % Solari while under a positive Resolution | Master Dueling (+5 Hegemony per melee kill) and Assassin Contracts (+200 Hegemony per Kill/Harass operation) | **DECIDE**. A is BUILDABLE by copying `Atreides_HegemonyBonus_1` (it uses `Resolution_Positive_GainTTrait`). B needs a kill trigger and an operation trigger, both BLOCKED until searched. |
| G-14 | **10K** | Unit power and +training speed (`MilitaryUnits_TrainingSpeed_ARatio`) | Sword-School Master's Aura: 10 m aura from Elites and Heroes, +10 % evasion and +10 % parry for infantry inside | A is BUILDABLE (training speed; add a power attribute). B is APPROX (aura and evasion/parry stand-ins). |

## 4. Named mechanics (abilities and actions)
| ID | Mechanic | Design | Attributes / sources | Status | Notes |
|---|---|---|---|---|---|
| G-15 | **Name Champion** (5K pick) | One Elite unit becomes Champion: +15 % health, can execute badly wounded enemies | `Entity_ExecuteTarget_HealthRatio_Flat` (execute, exact); health attribute (to find) | BUILDABLE (copy pattern) | Copy the Ecaz system: `Unit_EcazChampion`, `Faction_EcazChampion_GainTTrait`. Part of the reconciled 5K proposal (Appointment of a Duelist). |
| G-16 | **Ritual Duel** | Challenge one enemy unit: +20 % power against it for 15 s; its specials disabled for 5 s | none found | BLOCKED | Needs an `ability` entry applying a trait to one target. Unverified. Given to Commander Jool as an active, and to Cassian's Dueling Glove (see [leaders_and_councilors.md](../leaders_and_councilors.md)). |
| G-17 | **Master Dueling** (5K option B) | +5 Hegemony per enemy melee kill | `Unit_THegemonyProd_Flat` (partial) | BLOCKED (kill trigger) | Per-kill needs a trigger. The roadmap says to scale with unit tier if it snowballs. |
| G-18 | **Declare Kanly** | Pick a rival; unlock G-09 vs them; a truce timer (Jool halves it) | `Me_Track_StartWar`, `DeclareWar_Cost_ARatio` (stand-in) | APPROX | `Kanly` is a two-faction game mode (Kanly Duel), not a per-rival feud. Stand-in: declare War as the feud. See section 9. |
| G-19 | **Assassin Contracts** (5K option B) | +200 Hegemony per completed Kill or Harass operation | Hegemony attributes (partial) | BLOCKED | Needs an operation-complete trigger. |
| G-20 | **Sword-School Aura** (10 m) | Elites, Heroes and the Champion project 10 m; nearby infantry +10 % evasion, +10 % parry, stacking | `Army_AttackSpeed_PerAllyUnit_AtTRange_ARatio` (pattern); `Entity_FactionOwner_GainTTrait` (hero buff pattern) | APPROX | Radius auras need a real test in game. Stand-in: attack speed and armour from the aura. |
| G-21 | **Evasion and parry cap** | Total avoidance capped at 50 % | none | DECIDE | Balance note from [faction_design.md](../faction_design.md): an aura stacks to a large effective-health bonus. |

## 5. Balance limits to test (from the design notes)
- **Avoidance cap (G-21):** keep total evasion plus parry under 50 % of hits.
- **Riposte cap:** 5 stacks, which is 25 % attack speed and 25 % damage.
- **Kanly bonus (G-09):** only inside Rival territory. Decide whether it should also apply when the Rival attacks you at home.
- **Supply:** -20 % upkeep plus -50 % desert drain is strong on large maps. Check against desert-heavy Fremen and Harkonnen play.
- **Hegemony from kills (G-17):** +5 per kill is fast early. Scale with tier if it snowballs.
- **AI:** a faction with no ranged or shield units needs its AI weights checked, or it may stall.

## 6. Open technical questions (G-16, G-17, G-19 still blocked)
1. ~~Deep Desert and Kanly conditions~~ **Answered in section 9.** Deep Desert is built in. No Kanly-rival condition exists; War is the nearest state.
2. Is there an attribute that negates incoming damage by chance? Search `effect` and `attribute` descriptions for "avoid", "negate", "chance".
3. Which equipment definitions give shields or ranged weapons to Atreides units?
4. ~~What does the `Kanly` game mode do~~ **Answered in section 9:** a two-faction Kanly Duel format. Reusable as a game mode, not as a rival state.
5. Which `ability` entries apply a trait to a single target? Needed for G-16.

## 7. Build order (suggested)
1. **Testbed on Atreides** (no new faction yet): G-03 speed, G-07 upkeep, G-10 experience, G-11 standing, G-12 pillage. All BUILDABLE, low risk.
2. **G-15 Name Champion**, copied from Ecaz. Gives the 5K milestone a unit.
3. **G-13 and G-14 milestones** after DECIDE on A or B.
4. **APPROX items** (G-04, G-05, G-20), each with the in-game text that tells the player what the stand-in is.
5. **BLOCKED items** after the open questions in section 6 are answered by search.

## 9. Engine search results (2026-10-24, from `mod_files/data.cdb`)
**Kanly**
- `gameMode` **Kanly** is "Kanly Duel": two factions, 30 days, base faction XP 50. A whole-game format, not a feud between two factions.
- Traits `Kanly_Global` and `Kanly_MainBase` exist. No sheet references them, so the engine probably applies them in that mode (unverified).
- No condition, attribute or trait tests "active Kanly" or "rival". G-09 and G-18 use **War** as the stand-in.
- War tools that exist: `Me_IsAtWarWith_Amount`, `Me_Track_StartWar`, `Me_Track_MakePeace`, `DeclareWar_Cost_ARatio`, `Faction_GiveTTrait_AtWar` (a trait per War, to the faction), `Armies_AtTRange2_AtWar_GainTTrait` (a trait to units in a war zone), `Entity_GiveTTrait_UnitAtWar_AtTRange2` (a trait to units with an enemy at war nearby).
- Gap: no melee-damage attribute conditioned on the target being at war. G-09 must be a unit-in-war trait, so it is an approximation.

**Deep Desert (G-08 is BUILDABLE)**
- `Army_DeepDesertDailySupplyDrain_MRatio`: "% daily supply drain in DeepDesert", the exact attribute.
- `Army_InDeepDesert_GainTTrait`: units in a deep desert gain a trait. The location test is built in.
- Vanilla reference: trait `DesertMastery`.

**Value convention**
- `*_MRatio` trait values are multipliers (1 = unchanged). Vanilla `NoUpkeep` = 0, `TDesertCommand` = 0.8, `CBattle_Assault` = 0.5 on `Army_StockUpkeep_MRatio`.
- `*_ARatio` values are additive (vanilla `DesertMastery` = -2 on `Army_DailySupplyDrain_ARatio`).

## 8. Decisions needed before coding
- [ ] G-02: are Throwers allowed (rule text wording)?
- [ ] G-06: Riposte fed by hits or by parries?
- [ ] G-13: 5K milestone, option A (Solari) or B (Master Dueling and Assassin Contracts)?
- [ ] G-14: 10K milestone, option A (training speed and power) or B (aura)?
- [ ] G-21: confirm the 50 % avoidance cap.
- [ ] Faction path (see [../implementation_roadmap.md](../implementation_roadmap.md)): test on Atreides first (path B), or full faction (path C)?
- [ ] G-09 and G-18: accept War as the Kanly stand-in, or build a custom feud (needs engine work)?
