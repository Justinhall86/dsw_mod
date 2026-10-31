# Ecaz missions — list and adaptation review

Pulled from `mod_files/data.cdb` on 2026-10-31 (the `mission`, `ability`, `trait` and `bonus` sheets). In this game "missions" are the
agent **operations** run from the Intel screen, so this is the list of operations restricted to House Ecaz (`props.onlyForFactions`).
Ecaz has **three**, one per tier, like every vanilla faction ([operations.md](../operations.md)). The conquest-mode "mission rewards" are
listed at the end for completeness. If you meant something else by "Ecaz missions" (for example the Ecaz conquest campaign), tell me.

## The three Ecaz operations

| Tier | Mission id | Name | Unlock | Cost | Detected? |
|---|---|---|---|---|---|
| 0 | `MEpicQuest` | Epic Quest | IField 1 | 100 Intel | no extra chance |
| 1 | `MLivePerformance` | Live Performance | ILandsraad 2 | 200 Intel + 200 Solari | no extra chance |
| 2 | `MElaccaFog` | Elacca Fog | IChoam 2 | 500 Intel + 500 Solari | **always detected** (+100%), hostile |

### 1. Epic Quest (tier 0)
- **Text:** "A personal mission given to a proud soldier is the best motivation in the world."
- **Does:** a buff on your own region. The military unit with the most Power there deals extra damage (`TEpicQuest_buff`, attribute
  `Unit_Damage_MRatio` value 2, applied through `ZoneGiveTTrait_PowerfullArmies`). Two traits: a hidden one that applies the buff and a
  shown one that displays it. Non-hostile.
- **Adapt to Thorvald?** **Yes, as-is.** Pure data, no Ecaz-specific condition, nothing to change except text and the `onlyForFactions` list.
  - **Fits:** the lore's War Academy graduate leading a squad; it is the natural base for *War Academy Liaison*, the operation Ein sends
    ([counsellors.md](../counsellors.md)). Name idea: **Academy Commission**: "A War Academy officer takes command of the strongest
    squad in the region."
  - **Effort:** Easy. Clone the mission → `EpicQuest` ability → two traits, new ids and text.
  - **Check:** the scale of value `2` (percentage or multiplier) is not confirmed; read the in-game tooltip or test.
  - **Verdict:** adopt. This closes the "War Academy Liaison" stretch idea in operations.md without a new trait.

### 2. Live Performance (tier 1)
- **Text:** "A good show provokes admiration, but a bad one invites mockery."
- **Does:** while active in a region, your units earn **+5 Influence per enemy kill**, and you **lose 5 Influence** when your own units
  die or leave the region (`Entity_KillLoot_TRes_Flat`, `Unit_OnDeath_TResLose_Flat`, plus an `Army_InZoneReal_GainTTrait` that hands out
  `TLivePerformance_Effect`, which charges 5 Influence on leaving). A gamble on winning.
- **Adapt to Thorvald?** **Yes, with one swap.** Change the resource in both attributes from `Influence` to **Solari**.
  - **Fits:** the mercenary syndicate. Name idea: **Bounty Contracts**: "Every confirmed kill pays out; every lost soldier is a broken
    contract." It matches Iron Guard troops being paid in Solari and the Hammer of Wealth bonus.
  - **Effort:** Easy. The values are plain flat numbers; the three traits clone cleanly. Rebalance the 5s, since Solari is worth less per
    point than Influence.
  - **Verdict:** adopt as the tier-1 operation. It is simpler and safer than *Alloy Embargo*, which still needs a trait that raises
    unit cost. Keep Embargo as a later stretch.

### 3. Elacca Fog (tier 2)
- **Text:** "The Elacca drug from Ecaz forests is used in gladiator shows to inhibit self-preservation. During war time, it can be deployed
  as a thick fog to get the same effect."
- **Does:** a hostile cloud over a region. Enemy non-mechanical units in combat there become **uncontrollable**
  (`Human_InCombat_Uncontrollable`): they fight but ignore orders. Always detected, which is its drawback.
- **Adapt to Thorvald?** **Mechanically yes, thematically only with a reskin.** The drug and gladiator text is Ecaz-specific.
  - **Fits:** Heighforge exhaust and slag smoke. Our troops wear masks and wide hats; those could be the story for why *they* are not
    affected. Name idea: **Smelter Smoke**.
  - **Effort:** Easy. One mission, one ability, one trait.
  - **Conflict:** Thorvald already has *Hammerfall* (a clone of Orbital Strike) at tier 2. The faction can only have one operation per
    tier, so Smelter Smoke would be a second tier-2 option, or replace Hammerfall.
  - **Verdict:** optional. Good effect, but a worse thematic fit than Hammerfall. Keep as a spare.

## Summary

| Ecaz operation | Adapt? | Thorvald name | Effort | Slot |
|---|---|---|---|---|
| Epic Quest | Yes, as-is | Academy Commission / War Academy Liaison | Easy | tier 0 (alongside or instead of Requisition) |
| Live Performance | Yes, Influence → Solari | Bounty Contracts | Easy | tier 1 (instead of Alloy Embargo) |
| Elacca Fog | Reskin only | Smelter Smoke | Easy | spare tier 2 |

## Ecaz conquest mission rewards (for completeness, not evaluated)
`bonus` rows `Ecaz_MissionReward1`–`6`, all conquest-mode and Ecaz-only: **Luxury Garden, Resourcing Retreat, Chivalry Culture, Tourney
Culture, Defender of the Arts, The Arrakis Gallery.** They are built from `CB_Ecaz_MissionReward*` traits that I have not read. They are
culture and arts rewards, so only the resource-style ones (Resourcing Retreat) could suit Thorvald. The Ecaz faction bonuses
(`Ecaz_FactionBonus1`–`9`) are the same kind of conquest content; *The Knight of the Windmill* starts each game with a max-level champion
unit, which is a model for a Thorvald "start with an Academy officer" bonus.

## Not adopted: faction lock
Ecaz uses the `onlyForFactions` list to keep these three. Do **not** add Thorvald to the Ecaz rows; clone them with new ids so Ecaz keeps
its identity (add rows, change nothing else).
