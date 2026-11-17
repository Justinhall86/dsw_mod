# Councillors — House Thorvald

Rewritten 2026-11-09. The previous version is kept in [_archive/counsellors_2026-11-03.md](_archive/counsellors_2026-11-03.md)
(it holds the original Jool, Silva, Haruka and Nobru drafts and the first four-archetype table). Separate from House Ginaz:
nothing for this house belongs in `house_ginaz/`.

Three words are used on purpose and kept apart:

- **Designed**: on paper, agreed in design, not in `data.cdb`.
- **Built**: rows exist in `mod_files/data.cdb` and validate.
- **Tested**: seen working in a game. **Nothing here is tested.** No Thorvald game has been run yet.

Lines marked *(inference)* are my reading, not something checked in the data or the game.

## At a glance

Four councillors, one per CHOAM path plus a covert fourth (the three paths are in the faction spec: Economic, Military, Political).
A vanilla faction offers four councillors and the player picks two, so every pair has to work.

| Councillor | Id | Path | Tag (see Open 2) | Built now (passive, in cdb) | Designed target | Gap |
|---|---|---|---|---|---|---|
| **Master Silva** | `Silva` / `SilvaPassive` | Economic | Hard | Village buildings -15% Plascrete, +20% build speed, buildings -20% Solari upkeep | Solari income improves per CHOAM share held (capped), proposal B3 in [faction_design.md](faction_design.md); keeps the build-speed bonus; the flat upkeep cut goes. **The Terminal trade is abandoned (2026-11-12), so her old target is gone** | Share scaling not built; B3 is an untested inference |
| **Envoy Theodoric Ein** (working name) | `ThEin` / `ThEinPassive` | Military | Easy | Army Solari upkeep -10%, units start one level higher, +1 Armor in a region with a Thorvald operation | Same. The Iron Guard rule was dropped 2026-11-12, so no Iron Guard upkeep perk is needed; lead idea from the reviewed pool: E1 Paid-Off Contracts | None known |
| **Adjutant Nobru** | `Nobru` / `NobruPassive` | Political | Hard | First 20 votes on each Landsraad resolution free; CHOAM share price -15% | Standing and Influence gains scale with CHOAM shares held; keeps +5 Influence when his vote passes; **no share discount** | Built version has the discount we want gone; share scaling not built |
| **Lady Haruka** | `Haruka` / `HarukaPassive` | Covert | Hard | +1 Influence and +1 Intel per infiltration level held in another faction; operations prepare 25% faster and cost 15% less | Same ops speed and cost, plus Defiance gained from Thorvald operations | Defiance not built; the per-level income may be too big |

Built by `model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py` (dry run by default, `--apply`, `--revert`).
Checks run on 2026-11-03: `cdb_validate.py` 0 NEW problems, `engine_preflight.py` 0 FAIL.
Every attribute used is one that a vanilla trait already uses, so no hlboot patch is needed for the built passives.

## What changed since the first draft, and why

| Was | Now | Reason |
|---|---|---|
| Overseer Jool (military) | Envoy Theodoric Ein | Clears the clash with Ginaz's Commander Jool (renamed in the cdb 2026-11-02, `62_rename_jool_to_ein.py`). Ein is the one canon-named Thorvald character ([lore.md](lore.md)). The owner has said a final name may come later, so treat "Ein" as the working name. |
| Active perks (Sabotage Network, Market Manipulation, Hammer Brief) | Dropped | A councillor row has one passive slot and no active slot was found. Sabotage Network's numbers now sit in Haruka's passive. |
| Silva: unconditional upkeep cut | Share-scaled Solari income (was: share-scaled Terminal rate, dropped 2026-11-12 with the trade) | The cut covered a lot of buildings for free; tying her to shares makes her a CHOAM pick. |
| Nobru: -15% share price | Removed in the design | The faction drawback is +20% share buying price. Both together are 0.85 x 1.20 = 1.02, so the drawback roughly vanishes *(inference: assumes the two multiply)*. Nobru also stacked with the CHOAM Support development. |
| Haruka: +1 Intel and +1 Influence per agent | Per infiltration level (built) | Per agent was too large with three agents per field. The per-level version may still be large; see Open 4. |

## Master Silva (Economic, Hard)

- **Role:** master of works on Heighforge; ran the smelting decks before coming down to Arrakis. Explains the copper pauldron and foundry leathers. Portrait: banner bust (set to male in the cdb: the banner figure is a man; the Mohiam clone had her female).
- **Built:** *Supply Line Optimization*: `Building_Village_TResCost_MRatio` 0.85 (Plascrete), `Building_ConstructionSpeed_ARatio` 0.2, `Building_TRes_Upkeep_MRatio` 0.8 (Solari). AI domain Economy.
- **Designed (revised 2026-11-12):** the Terminal's Convert rate she was to improve no longer exists, because the Plascrete trade was abandoned. Proposed replacement: Solari income per 1% of CHOAM shares held, capped (proposal B3 in [faction_design.md](faction_design.md)). Keep the +20% build speed on non-military buildings. If package 2 (war chest) is chosen instead, Silva needs a different hook; candidates are *Master of Contracts* or *Belt Foreman* from the pool.
- **Plascrete caution:** her built perk discounts village buildings' Plascrete. With no trade, Plascrete has fewer uses, so check that the discount still matters.
- **How to get there** *(inference, untested)*: vanilla `CMarket_PerShare_GiveTTrait_Stack` turns each 1% of shares into one stack of a trait (the CHOAM Manipulation development uses it). A trait that adds to the Convert line per stack would give a data-only version. The Convert line itself needs the hlboot trade patch, which is already part of the Sworn Sword build, so check that patch reads stacked values before relying on this.
- **Best alternatives from the pool** ([councillor_ideas.md](councillor_ideas.md), reviewed 2026-11-12): S1 *Consignment Factor* (the share dividend above), S2 *Assay Office* (Solari and Plascrete per Economy village building, `TRes_ProdPerTDomain2Building_Flat`), S3 *Slag Rights* (Plascrete on empty slots, UNTESTED with Plascrete). *Master of Operations* and *Construction Chief* were dropped (a gone Terminal half; Silva already has the build speed).
- **Watch:** Silva and Nobru both scaling off shares can stack. Until the soft-cap pool exists, cap each ability on its own.

## Envoy Theodoric Ein (Military, Easy)

- **Role:** field envoy and war-council officer; a War Academy graduate with distinction, posted to Arrakis. Sits between a soldier and a politician: he turns the house's wealth into combat results.
- **Built:** *Academy Doctrine*: `Army_TResUpkeep_MRatio` 0.9 (Solari), `Army_SpawnExperienceLevel_Flat` 1, `FactionArmy_InZoneWithOperation_Armor_Flat` 1. Portrait from `council_male_military_cape.jpg`.
- **Designed:** keep as built. (The Iron Guard rule was dropped on 2026-11-12, so the planned cheaper Iron Guard upkeep is gone.) **Do not add Jool's old unconditional +2 Armor.** Armor now has three other Thorvald sources (the military ladder, Forge Mantle, Alloy Tempering) and Ein already gives +1 where an operation runs. Whether these stack or the highest applies is still open (Open 3).
- **Signature ideas not built** (from the old draft): *Academy Graduates* (War Academy Liaison operation costs -25% Intel while he sits), *Cadet network* (one extra free Intel agent slot; no vanilla attribute found), *Hagga Basin hook* (Wreck of the Kytheria as a landmark; costs nothing). Hammer Brief (+15% Power, +2 Armor for 60 s) is dropped with the active slot; the military ladder's Armor rungs cover its job.
- **Best alternatives from the pool** (reviewed 2026-11-12): E1 *Paid-Off Contracts* (`Army_MaxLevel_GainTTrait`: max-level units pay no Solari upkeep), E4 *Express Freight* (70% recruit time via `Unit_ImportTime_MRatio`), E3 *Away Contract* (`Army_OutsideTerritory_GainTTrait`), and E2 *Retainer Levy* (a daily Sworn Sword; the same job as bonus B6, pick one).
- **Appearance (spec, still valid):** face visible, no mask or kasa (he is the public face of the house). Upright knee-length frock coat in dark charcoal with industrial orange trim on cuffs, collar and hem; stand-up collar like Nobru's; dark stillsuit torso under it; tall black boots. Gear-and-star emblem as a small copper pin on the left chest, plus a small Academy pin (hammer over a book) on the collar. Sidearm at the hip and a rolled data-slate or short baton; **no cane** (Memnon's) and no pistol-forward pose (Nobru's). Mid-30s to 40s, short dark hair, clean-shaven or a short beard, no scar (the scar is the old Jool's). Palette: gunmetal `#23201C` coat, rust-brown `#48241A` under-layer, orange as the one hot accent, copper pin. Councillors have no 3D model; a later model would be a kitbash (Commando or Duncan body, Idualis head) via `dsw-part-kitbash`, never Sardaukar parts. Note: the house look is now charcoal and gunmetal with bold copper and oxblood, no rust ([art_direction.md](art_direction.md) has the same update to make), so the rust-brown under-layer should be re-judged.

## Adjutant Nobru (Political, Hard)

- **Role:** Memnon's man on the Landsraad floor and in the War Council bloc; trades alloy contracts for votes. Portrait: banner bust.
- **Built:** *Market Patronage*: `FreeVotes_Resolution_Flat` 20 (Ecaz's effect), `CMarket_Share_BuyPrice_MRatio` 0.85. AI domain Statecraft.
- **Designed:** Landsraad Standing and Influence gains scale with CHOAM shares held; keep +5 Influence when a resolution he voted on passes. **The share discount goes.**
- **Decision needed before the first playtest:** the built discount undoes the faction drawback (see the table above). Either remove `CMarket_Share_BuyPrice_MRatio` from `NobruPassive` now, or leave it and accept that the drawback will be implemented later as a net number. My lean: remove it when the drawback is built, not before, because with no drawback in the cdb the discount does no harm and gives the first playtest a CHOAM-friendly Nobru *(inference)*.
- **How to get there** *(inference, untested)*: `CMarket_PerShare_GiveTTrait_Stack` again, with the stacked trait carrying `TRes_Prod_Flat` on Influence. `Resolution_Win_Gain_TRes` covers the "when his vote passes" line (PROVEN in the pool).
- **Standing matters here:** one translated wiki says the lowest Landsraad Standing tier raises share buying price by 300%. That source is a machine translation; confirm in game. If true, Nobru's Standing gains are a hidden discount on shares, which strengthens him for a CHOAM build.
- **Best alternatives from the pool** (reviewed 2026-11-12): N4 *Double Ledger* (halved Standing loss, `Res_Standing_HostileActionLoss_MRatio` 0.5, UNTESTED; the one perk that says "loyal in public, opposed in private"), N1 *War Profiteer* (`Faction_TResGain_OnWar_Flat`, `Faction_TResGain_OnOpponentWar_Flat`; overlaps bonus B4), N6 *Vote Broker* (`TResAction_VoteValue_ARatio` PROVEN, `Allow_CancelNegativeResolution` UNTESTED), N3 *Charter Lawyer* (`LandsraadImmunity` action: PROVEN).
- **Mechanics checked from the old four-archetype notes, worth keeping for him:** edict immunity (`LandsraadImmunity`), halved Standing losses (`Res_Standing_HostileActionLoss_MRatio` 0.5, used 0, test it), Plascrete-upkeep buildings producing Standing or Hegemony (`TRes_Prod_Flat` with target Standing or Hegemony).
- The top-bar Plascrete trade was briefly Nobru's, then moved to the Consignment Terminal. The whole trade was abandoned on 2026-11-12; his passive no longer carries any of it.

## Lady Haruka (Covert, Hard)

- **Role:** spymaster. Lore hook (ours): kept Lady Firenza's household on Kaitain, then turned what she learned at court into a spy network against the Crown. Portrait: banner bust.
- **Built:** *Corporate Espionage*: `TRes_ProdPerInfiltrationLevels_Flat` 1 Influence and 1 Intel (the Intelbroker shape), `Mission_PreparationTime_MRatio` 0.75, `Mission_Cost_MRatio` 0.85.
- **Designed:** operations -25% prep time and -15% cost (built); Defiance gained from Thorvald operations (needs Defiance, not built).
- **Watch:** a 3-day preparation becomes about 2.25 days and 15% of the cost comes back, on top of the Stealth Gear development's 20% refund. For a faction with three exclusive operations plus the shared ones, that is a lot of cheap operations. The per-level income is also unchecked: vanilla's Intelbroker pays 15 Solari and 1 Influence per level, so 1 Influence and 1 Intel per level across many factions could outrun a Hard councillor *(inference: measure it in a test game)*.
- **Best alternatives from the pool** (reviewed 2026-11-12): H1 *Renegade Handler* (an Incite action themed as Renegades for hire; ties into `thorvald_renegades`; the lead), H3 *Expendable Contractors* (sacrificing an agent pays Solari and cuts the next operation's cost), H4 *Quiet Ledger* (infiltration decays 50% slower), H2 *Operations Chief* (`Mission_Infiltration_RequiredLevelReduction_Flat`; strong on top of her built op speed and cost, so test the total).
- **Stealth:** the old notes proposed a stealth passive (`Unit_Cloaked`, the Fremen `F_Sneak_Trait` precedent). It still fits her, but it adds a fourth job to a Hard councillor who already has two; park it.

## Pairings

| Pair | Build it makes |
|---|---|
| Silva + Nobru | Economic victory: shares feed both. Stacking risk (see Silva) |
| Ein + Haruka | Domination: cheap operations plus a durable army |
| Silva + Ein | Solid economy under a hardened army; the easy, safe pick |
| Nobru + Haruka | Political and covert; Defiance fuel from both |

Note: this table is designed, not tested.

## Open decisions

1. **Final military councillor name.** The owner will supply it. Until then the cdb and these docs say Ein. The online faction spec still says "Overseer Jool (rename needed)"; it needs the same update.
2. **Easy and Hard tags.** Vanilla Corrino, Vernius and Ecaz have two Easy and two Hard. The table above gives one Easy and three Hard, which is wrong for the pattern. My suggestion: Silva Easy (a passive economy bonus is simple to use), Ein Easy, Nobru Hard, Haruka Hard *(inference: I have not checked what the tag does in the cdb)*.
3. **Armor stacking.** Ein's +1 Armor, the CHOAM military ladder (+1 at 15%, +2 at 20%), Forge Mantle and Alloy Tempering. Choose "stack" or "highest applies", and cap the total.
4. **Haruka's per-level income.** Keep, halve, or drop after one test game.
5. **Nobru's share discount.** Remove now or when the drawback is built (see his section).
6. **Soft-cap pool.** The design is one allocated pool; the Sworn Sword build reads total shares instead. Silva and Nobru should read the pool when it exists.

## Next steps (in order, with the playable baseline first)

1. **Do not rebuild the councillors before a first test game.** The built passives use proven attributes and nothing has run yet.
2. In the first game, check: council-screen portraits, perk tooltips (the `[Thorvald-adjective]` token and the percent placeholders), agent portraits on the spying screen, and Haruka's income.
3. Then build the share-scaled versions as a separate, revertable script (new `--revert`, backup first), not by editing `20_councillors_cdb.py`.
4. Portraits are concept art cut from banner busts, about 210 px wide and upscaled 1.6x; higher-resolution originals would sharpen them. Karlin (hero) still has a Corrino portrait cell. Agents have no Mentat or Suk overlays.

## Reference

Portraits sit in new atlases (`UI/Faction/councillors_thorvald.png`, `UI/Faction/Menu/menuCouncilorsThorvald.png`, `UI/Faction/Menu/councillorsThorvald.png`), so no vanilla atlas is overridden. Seven unused concept images became the Thorvald agents (`Th1` to `Th7`); Thorvald no longer draws Corrino's agents. Not packed or installed.

Revert: `python model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py --revert`.

### Lore hooks (ours, built on [lore.md](lore.md))

Canon names none of the four except Ein (from Dune: Awakening), so the others are our own, each tied to a canon place or event.

| Councillor | Hook |
|---|---|
| Envoy Ein | War Academy graduate with distinction, the house's envoy in the Hagga Basin beside the Wreck of the Kytheria; talks about the motto, Heighforge's size and how Thorvald alloys build spacecraft |
| Master Silva | Master of works on Heighforge; ran the smelting decks before coming down to Arrakis |
| Lady Haruka | Kept Firenza's household on Kaitain; built a spy network against the Crown after her death |
| Adjutant Nobru | Memnon's man on the Landsraad floor and in the War Council bloc |

The War Academy teaches logistics and commerce next to tactics, which is why a house of this kind has a logistics master and a market operator on its council and one soldier.

### Superseded drafts

| Draft | Role | Where it went |
|---|---|---|
| Jakob | Spacing Guild liaison, -20% Guild requirements | Guild Sub-Contract (5000 Hegemony perk) |
| Siora | Spy expert, auto-sends Landsraad Guards to low-standing factions | Lady Haruka |
| Herbert | General: handgun ability, health, armor, attack speed, faster recruitment | Ein (military); the old stacked bonuses were already flagged |
| Nier | Diplomat: Landsraad-style vote | Adjutant Nobru |
| Overseer Jool | Conscription Buffer (+10% Power, +2 Armor near own territory), Heavy Annexation (-20% Authority to annex a pillaged village) | Replaced by Ein; full text in the archive. Heavy Annexation is a spare perk idea |
