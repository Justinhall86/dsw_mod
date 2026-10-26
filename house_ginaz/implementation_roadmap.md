# Implementation roadmap: from design to game

Facts below were read from the game's `data.cdb` (the working copy `mod_files/data.cdb`) on 2026-10-24, so they describe what is
really in the data. Items marked *unverified* are my judgement and need a test.

## 1. How the game defines a faction (verified)
- The `faction` sheet has 17 entries: Atreides, Harkonnen, Smugglers, Fremen, Corrino, Ecaz, Vernius, TEST, Renegades, Locals, MinorHouses, Landsraad, SpacingGuild, BeneGesserit_Faction, Imperium, Spectator, NoFaction.
- A faction record (example Atreides) carries: `color`, `startResources`, `baseProduction`, `gfx`/`images`, `texts`, `landmarks` (`city` = the HQ structure,
  e.g. Arrakeen), `characters`, `conquest`, `house`, and `props`.
- `props.startingTraits` = the always-on faction traits (Atreides: `Atreides` and `AllFactions_Basics`). **This is where Ginaz's four core traits would go.**
- `props.hegemonyBonuses` = two entries, `{traitBonus: "<Faction>_HegemonyBonus_1"}` and `_2` (the 5K and 10K milestones). **This matches the concept exactly** (two milestones).
- `characters` = `leaders` (Atreides: Leto), `councilors` (Thufir, Yueh, Jessica, Paul: four) and a `speaker`. **Matches the concept (one leader choice, four councilors).**
- A character record has: `firstname`, `lastname`, `title`, `desc`, `gfx` (portrait atlas position), `model`, `passiveTrait`, `complexity`, `aiTypes`.
- A trait is a list of `attributes`, each `{ref: <attribute id>, target: {...}, desc}`; hegemony-bonus traits are ordinary traits flagged `onlyForFaction`.
- Game modes: `Default`, `Conquest`, `Kanly`, `Tutorial`. `Conquest` lists `playableFactions` (each with `availableForAI`). A game mode named `Kanly` exists already
  (not investigated; may or may not relate to the faction's Kanly idea).

## 2. The attribute system (verified) and mapping of each bonus
The `attribute` sheet has 1,692 entries with display text. Matching ones exist for most bonuses. The ids below were found by name; the
quoted text is the attribute's own description (so what it does is known). **Evasion and parry have no attribute** (see section 3).

| Design bonus | Candidate attribute id | Its description in the data | Fit |
|---|---|---|---|
| +10 % movement speed | `Unit_Speed_MRatio` (also `Entity_MoveSpeed_OutsideCombat_ARatio`) | "% unit Speed" | exact |
| +5 % attack speed (Mastery/Riposte/Momentum) | `Entity_AttackSpeed_MRatio`, `Army_AttackSpeed_ARatio` | "% attack speed" | exact |
| Stack on hit (Mastery) | `Unit_FightTarget_OnDamageUnit_GainTTraitStacks` | "Dealing damage to an enemy unit applies N [trait] stacks until the end of combat" | exact for Mastery; a parry-fed Riposte stack would need the parry mechanic |
| +30 % melee damage vs Rivals | `Unit_MeleeAttacks_Damage_MRatio`; `Entity_FightTarget_OutsideTerritory_Power_ARatio` ("Power when target is outside its territory") | | melee damage exact; the Rival condition is not (see section 3) |
| -20 % supply upkeep | `Army_StockUpkeep_MRatio` | "% Military Unit Upkeep" | exact |
| -50 % supply drain (Deep Desert) | `Army_DailySupplyDrain_ARatio`, `Army_SupplyDecrease_MRatio` ("reduces supply losses by %") | | exact for supply; a desert-only condition needs a conditional trait |
| Anti-armour (Cassian) | `Entity_Attacks_IgnoreArmor_MRatio` | "This unit's attacks ignore % enemy Armor" | exact |
| Execute (Champion) | `Entity_ExecuteTarget_HealthRatio_Flat` | "Executes enemy units under % Life" | exact |
| Champion system | `Unit_EcazChampion`, `Faction_EcazChampion_GainTTrait` ("Champions gain ...") | existing Ecaz mechanic | reusable pattern (copy for Ginaz) |
| Hegemony per kill/contract | `Unit_THegemonyProd_Flat`, `THegemony_BaseGain_Flat` | "Hegemony" | partial; per-kill needs a trigger |
| Combat Experience power (+15 %) | `Army_XPLevel_Effects_ARatio` ("[Experience] level effects"), `Army_ExperienceGain_ARatio`, `Army_SpawnExperienceLevel_Flat`, `Army_GainTTrait_PerXp` | experience system | exact (draft v3) |
| High Standing bonus | `Standing_BetterHighTraits` | "Benefits more from a high [Standing]" | exact (draft v3) |
| Cannot pillage neutral villages | `Pillage_NeutralVillage_Block` | "Cannot pillage neutral villages" | exact (draft v3); also `Pillage_Village_Block`, `Pillage_Outpost_Block` for stricter rules |
| Faster unit training | `MilitaryUnits_TrainingSpeed_ARatio` | "Military Units are trained % faster" | exact (draft v3 10K) |
| Faster recruitment of one unit | `TUnit_ImportTime_ARatio` | "% [unit] recruitment time" | exact |
| 5K Solari under a positive Resolution | pattern of `Atreides_HegemonyBonus_1` using `Resolution_Positive_GainTTrait` | copy the Atreides trait, swap the target trait | exact (draft v3 5K) |
| Cooldown changes | `TAbility_Cooldown_MRatio` | "% cooldown" | exact |
| Self-heal | `Unit_HealthGain_PerDamageInflicted_ARatio` | "Heal by % of damage inflicted" | optional flavour |
| Aura (10 m, Elites/Heroes) | `Army_AttackSpeed_PerAllyUnit_AtTRange_ARatio`; `Entity_FactionOwner_GainTTrait` (used by hero traits to buff the faction) | | the hero-buff pattern exists (`C_Hero_1_Trait`); radius auras need a real test |

Verdict: **draft v3 (the earliest faction screen) is implementable almost entirely with existing attributes**; draft v1/v2's evasion and parry are the only real gaps.
See [faction_design.md](faction_design.md) for the two-tier plan.

## 3. What the data cannot do directly (gaps)
| Need | Problem | Options |
|---|---|---|
| **Evasion** (+20 %) | no attribute named evasion/dodge/avoid (only `MilitaryUnits_WormDodgeChance_ARatio`, which is vs sandworms) | approximate with armour (`Entity_Armor_MRatio`, `Entity_ArmorByMissingHealth_Flat` "up to X armor depending on missing Life") or damage reduction (`Entity_TurnDamageModifierIntoDamageReduction`); a true chance-to-avoid needs engine code the mod cannot add |
| **Parry** (negate a hit, build stack, counter-thrust) | no attribute | same approximation; a "stack on hit" (Mastery) replaces "stack on parry" (Riposte) |
| **Duel** (challenge a unit, disable its specials) | no obvious attribute | an Ability (`ability` sheet) that applies a trait to one target may do it; *unverified* |
| **Kanly Rival condition** | "territory of factions with an active Kanly" has no matching condition id found | use "outside own territory" as a stand-in, or tie to existing war/Kanly status attributes (*unverified*) |
| **No shields / no firearms** | restrictions on equipment | simply never give Ginaz units shield/ranged equipment; for a takeover on Atreides, remove those equipment slots from the unit |
| **New resource-less actions** (Declare Kanly, Name Champion) | UI + game logic | Name Champion can copy the Ecaz Champion; Declare Kanly may reuse the existing Kanly game mode machinery (*unverified*) |

Rule: where there is no exact attribute, document the approximation in the unit/trait description, so players are told "evasion is implemented as extra armour".

## 4. Three ways to bring the House in (and what each costs)
| Path | What it is | Cost | Risk |
|---|---|---|---|
| **A. Units inside an existing faction** (used first, 2026-10-23/24) | Ginaz units replace/extend Atreides slots (Warden -> Captain). Superseded on 2026-10-25 by a cloned `Ginaz` faction (`model_projects/ginaz_faction/SPEC.md`), which restored the Warden | each unit is a model + cdb entry; process saved as the `dsw-new-unit` skill | low; every Warden recruit changed; no faction identity |
| **B. Ginaz as traits on an existing faction** | Atreides (or another) gets `startingTraits` and `hegemonyBonuses` that implement the Ginaz bonuses, plus new leader/councilors | trait + attribute work, characters, portraits | medium; changes Atreides play for everyone; no separate faction |
| **C. New playable faction** | a new `faction` row, HQ structure/villages/buildings, units, leader + 4 councilors, UI art, add to `gameMode.Conquest.playableFactions`, AI weights | large; most data work, art and testing | highest; *unverified* whether the engine tolerates a 9th playable faction in the faction-select UI and AI; needs a recon spike first |

Suggested order: A now (keep building units), B as a testbed for the bonuses (copy an existing faction's hegemony-bonus traits, swap in Ginaz attributes), C only after B works
and the user wants a separate faction.

## 5. Phases
| Phase | Work | Output | Notes |
|---|---|---|---|
| 0 (done) | Ginaz Captain, then a first `Ginaz` faction with the Captain, Swordmaster, Neophyte and Master; spawn 5 Captains at start | in the data, not yet launched | see [unit_specs.md](unit_specs.md), [ginaz_captain.md](ginaz_captain.md) |
| 1 | Captain texture upgrades (brown mantle, gold buttons/piping/hem discs) | better model | pure texture |
| 2 | Elite Swordmaster, Master of Ginaz, Scout, Throwers | 4 more units | [units.md](units.md); decide takeover slots vs new units |
| 3 | Faction traits as a testbed on Atreides (or a fresh trait) | working Mastery, anti-armour, supply, speed | attribute mapping above |
| 4 | Leader + councilor data (text + passive traits, portraits) | Grandmaster/Councilor choice | [leaders_and_councilors.md](leaders_and_councilors.md) |
| 5 | Champion and Ritual Duel as abilities | named elite, duel active | copy Ecaz Champion |
| 6 | Decide on a full faction (path C) | spike: can a 9th faction load? | gate on user choice |

## 6. Open technical questions to resolve before Phase 3
1. Can a trait condition test "in the Deep Desert" and "target faction has an active Kanly"? (search `condition` sheet, `Unit_FightTarget_*` attributes)
2. Is there any attribute that negates incoming damage by chance? (search `effect`/`attribute` descriptions for "avoid", "negate", "chance")
3. Which equipment definitions give shields/ranged to Atreides units, so a Ginaz-pure unit set can be enforced?
4. What does the `Kanly` game mode do and can Ginaz reuse it?
5. Portrait formats: leader banner (128 x 206 atlas) and councilor strip (128 px) sizes in `UI/HUD/leaderBanner4k.png` and `UI/Faction/councillors_all.png`.

## 7. How to check things (commands)
```
# describe an attribute
python - <<'EOF'
import json; d=json.load(open("mod_files/data.cdb",encoding="utf-8"))
a={x["id"]:x for s in d["sheets"] if s["name"]=="attribute" for x in s["lines"]}
print(a["Entity_Attacks_IgnoreArmor_MRatio"]["desc"])
EOF
# search attributes by keyword
python - <<'EOF'
import json; d=json.load(open("mod_files/data.cdb",encoding="utf-8"))
for s in d["sheets"]:
    if s["name"]=="attribute":
        print([x["id"] for x in s["lines"] if "dodge" in x["id"].lower()])
EOF
# show a unit/model entry
python .claude/skills/dsw-model-modding/scripts/cdb_tools.py --allow-inexact show unit A_Elite
```
Always dry-run edits, print the diff, back up (`13_patch_cdb.py` pattern) and keep the user's other custom units (Landsraad guard) intact.
