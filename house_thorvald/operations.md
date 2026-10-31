# Operations — House Thorvald

Operations are the agent missions run from the Intel screen. This page says how they work in the game data, what House Thorvald
has today, and the Thorvald set we want instead. The lore behind each one is in [lore.md](lore.md). Names, numbers and effects are
**PROPOSED**.

## How operations work in `data.cdb` (checked 2026-10-30)
Each operation is three linked rows:

1. **`mission`** row: cost, tier (`difficulty`), required infiltration level, and `props.onlyForFactions` / `notForFactions`.
   `effects.ope` points at an ability.
2. **`ability`** row: the English `name` and `desc`, the icon, duration, the target type (`apply.need`) and whether it counts as hostile.
3. **`trait`** row(s): the actual effect.

So an operation is pure data. A new one is new rows (often cloned from a vanilla chain), not code.

Every vanilla operation fits one of three tiers:

| Tier (`difficulty`) | Cost | Unlock |
|---|---|---|
| 0 | 100 Intel | level 1 infiltration in one category |
| 1 | 200 Intel + 200 Solari | level 2 in one category |
| 2 | 500 Intel + 500 Solari | level 2 in one category |

Categories: `IField` (Arrakis), `ISpaceGuild`, `IChoam`, `ILandsraad`, plus `IFaction` for the universal ones such as Assassination.

Each vanilla faction gets **three faction-only operations, one per tier**, on top of the shared ones (Smugglers get four).

## What Thorvald has today
The `Th_*` faction is a Corrino clone, so it was added to Corrino's three:

| Tier | Operation | Category | Effect | Lore fit |
|---|---|---|---|---|
| 0 | Consolidation | IChoam 1 | Troops in a region become hardier. Text: "the Imperial army..." | Wrong. The text is about the Emperor's army. |
| 1 | Interdiction Zone | ILandsraad 2 | No-fly zone over a region | Fair. It fits an air-heavy house, but it is Corrino's |
| 2 | Orbital Strike | ISpaceGuild 2 | Missiles from orbit hit all ground units, villages and main bases in the area, friend and foe | Good effect, wrong owner. Text: "The Emperor always keeps a few ships in low orbit" |

Plus all the shared ones (Probe Setup, Defense Sabotage, Supply Drop, Scavenger Team, Leave Order, Decoy Thumper, EMP Bomb,
Administrative Burden, Defense Breaches, the cells, Assassination, Disable Shield).

Lore says Memnon is the Emperor's enemy by 10191, so running "the Emperor's" operations is the clearest story break in the faction.

## Proposed Thorvald set

| Tier | Name | Category | Effect | Build from | Effort |
|---|---|---|---|---|---|
| 0 | **Heighforge Requisition** | IChoam 1 | Troops in the target region gain extra armour and hold up longer (same idea as Consolidation) | Clone `MConsolidation` → `Consolidation` → `TConsolidation`; new name and text | Easy |
| 1 | **Alloy Embargo** | ILandsraad 2 | The target faction is cut off from Thorvald alloy: its vehicles and air units cost more and repair slower for the duration | New trait on the target faction; base on `MAdministrativeBurden`'s targeting (faction at War or Hostility) | Medium: needs a vanilla trait that raises unit cost or slows repair |
| 2 | **Hammerfall** | ISpaceGuild 2 | Heighforge drops refined slag ingots from orbit: the Orbital Strike effect, area damage to all ground units, villages and main bases, friend and foe | Clone `MOrbitalStrike` → `OrbitalStrike`; new name and text | Easy |
| bonus | **Supply Chain Holdout** | ILandsraad 2 | Thorvald suppliers stop deliveries to both armies in a region until they stand down: a truce, no fighting there for the duration | Clone `MCeaseFire` → `CeaseFire` → `TCeaseFire` | Easy for the op. Gating it behind the **Political Asylum** bonus is Medium (see below) |

Then remove `Thorvald` from the `onlyForFactions` of `MConsolidation`, `MInterdictionZone` and `MOrbitalStrike`, so Corrino keeps them
and Thorvald gets its own.

### Flavour text (draft)
- **Heighforge Requisition:** "Fresh plate from the Heighforge decks, shipped down on the next tender. A Thorvald army is never short of armour for long."
- **Alloy Embargo:** "Half the warships in the Imperium are built from Ipyrian alloy. The Earl can always decide whose half."
- **Hammerfall:** "Heighforge was built to smelt moons. Pointing its slag chutes at a planet is only a matter of coordinates. The hammer of wealth falls on everyone below."
- **Supply Chain Holdout:** "No ammunition, no rations, no spare parts, for either side. Even an army stops when its suppliers do."

### Why this set
- **One operation per tier, like every vanilla faction.** Requisition is a cheap early buff, Embargo is mid-game economic pressure,
  Hammerfall is the late-game showpiece.
- **Two of the four are clones with new text.** Hammerfall and Requisition reuse effects that already work, so the house gets its own
  identity at almost no risk.
- **Each one carries a piece of lore:** Heighforge, the alloy trade, the motto, the War Academy's logistics.
- **Hammerfall's friendly fire stays.** It matches "a house that pays for its wars": powerful, expensive and not careful.

## Update 2026-10-31: Ecaz review
[research/ecaz_missions.md](research/ecaz_missions.md) reviewed Ecaz's three operations. Two clone cleanly and change this plan:
- **Epic Quest → Academy Commission / War Academy Liaison.** Works as-is; replaces the stretch idea of the same name and is Ein's operation ([counsellors.md](counsellors.md)).
- **Live Performance → Bounty Contracts** (Influence swapped for Solari). Easier than **Alloy Embargo**, so it becomes the tier-1 pick and Embargo moves to the stretch list.
- **Elacca Fog → Smelter Smoke** is a spare tier-2 option.

## Councillor tie-ins
- **Lady Haruka**'s Sabotage Network (-25% preparation time, -15% Intel/Solari cost for all operations) makes the house a strong
  operations faction. The 500/500 tier drops to 425/425.
- **Adjutant Nobru** and **Master Silva** pay off Alloy Embargo and Requisition: one works the markets, the other runs the supply lines.
- **Overseer Jool**'s Conscription Buffer (+Power, +Armor near Thorvald territory) stacks with Heighforge Requisition on a defended front.

([counsellors.md](counsellors.md) has the full abilities.)

## Stretch ideas (need new traits)
| Name | Category | Effect | Why it is a stretch |
|---|---|---|---|
| **Firenza's Grievance** | ILandsraad 2 | The target loses Landsraad standing and Thorvald gains Influence; doubled against Corrino | A faction-conditional effect. Needs a search for a vanilla trait that checks the target's faction |
| **Belt Prospectors** | IField 1 | Survey a region: reveal it and add Plascrete yield there for the duration | Needs a resource-yield trait on a region |
| **War Academy Liaison** | IField 2 | A War Academy officer (the Theodoric Ein type) joins the army in a region: +Power, faster healing | Could clone Atreides' `MSupportIntelligence` if its trait does something close. Not checked |

## Open decisions
1. **Approve the set** (Requisition, Embargo, Hammerfall, Holdout) or swap any of them for a stretch idea.
2. **Keep Interdiction Zone too?** It fits the air roster. Vanilla factions have three unique operations; keeping it would give Thorvald five.
3. **Gate for Supply Chain Holdout.** The faction screen says Political Asylum *unlocks* it. The `mission` props have `neededMission` and
   `replaces`, but there is no trait-based unlock field, so I still need to find how a faction bonus unlocks an operation. Fallback:
   make it a normal Thorvald operation.
4. **Name check:** "Hammerfall" vs "Heighforge Strike" vs "Slag Drop".

## Build notes (when approved)
- Minimal edits only: add these rows to the working `mod_files/data.cdb` and change nothing else, then validate with
  `.claude/skills/dsw-model-modding/scripts/cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb` (target 0 new problems).
- New ids: `MTh_Requisition`, `MTh_AlloyEmbargo`, `MTh_Hammerfall`, `MTh_SupplyHoldout` for missions; `Th_Requisition` etc. for the
  abilities; `TTh_*` for any cloned traits.
- English text goes in the `ability` row's `name` and `desc`. Other languages read from `lang/export_*.xml`, so non-English players
  would see blank or fallback text unless we add entries.
- Icons: reuse the source operation's `gfx` (`UI/spying/missionIconsBW.png` cell and `UI/icons/skill_icons02.png` cell) until we have art.
- Test in game: the ops show on the Intel screen for Thorvald only; Corrino still has Consolidation, Interdiction Zone and Orbital Strike.
