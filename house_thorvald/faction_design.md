# Faction design — House Thorvald

Rewritten 2026-11-11; updated 2026-11-12 (Plascrete trading abandoned, Iron Guard rule dropped, Terminal kept as a plain building). The previous version is in [_archive/faction_design_2026-11-03.md](_archive/faction_design_2026-11-03.md).
Source for the original bonuses: [images/faction_screen_thorvald.jpg](images/faction_screen_thorvald.jpg), the house-selection concept
screen. The numbers on it are **PROPOSED**; the design below has since moved on from it.

Three words are kept apart on purpose:

- **Designed**: agreed on paper, not in `data.cdb`.
- **Built**: rows or engine code exist in the repo.
- **Tested**: seen working in a game. **Only one thing has been tested: the Consignment Terminal's Plascrete trade, which did not work (owner, 2026-11-12) and has been abandoned.** I do not know what else was seen in that game, so every other line stays "No" until the owner says otherwise.

Lines marked *(inference)* are my reading, not checked in the data or the game. All numbers are starting values to tune.

## Identity

- **Title:** "The Industrial Hegemon / The Mercenary Syndicate". Earl Memnon Thorvald leads: grey-streaked black hair and beard, a long black high-collared coat, a cane, a gear emblem on the chest and an arm patch.
- **Theme:** an economic power that buys its wars. The buying is expressed through mercenaries (Sworn Swords, contract operations, the Mercenary rung of the CHOAM ladder, Hammer of Wealth's mercenary upkeep cut); the regular army pays Manpower like any house, because the "Solari instead of Manpower" rule was dropped on 2026-11-12. CHOAM shares turn wealth into military, economic and political strength.
- **Canon base ([lore.md](lore.md)):** a House Major from Ipyr that mines the Ipyrian Asteroid Belt and smelts warship alloys in Heighforge, an orbital refinery the size of a moon. Motto "The hammer of wealth". "Industrial Hegemon" is canon in spirit; "Mercenary Syndicate" is our layer.
- **Politics (corrected 2026-11-09):** Memnon is an enemy of the Emperor, not secretly against the Landsraad. His sister Firenza was discarded by the Court. The faction plays the Landsraad game in public while working against whoever is winning, and against the Crown.
- **Look:** polished charcoal or gunmetal, bold copper trim, oxblood accents, gear-and-star emblem. See "Look" below for an open colour question.

## What exists today

| Piece | Designed | Built | Tested |
|---|---|---|---|
| Faction shell (`Thorvald`, copper 0xB26E3C, HQ `ThorvaldCitadel`, region `ThorvaldBase`) | Yes | Yes: cloned from Corrino 2026-10-29 | No |
| Faction stats, abilities, bonuses, UI art | Own | **Still Corrino's** | No |
| Units, `TH_*` ids (five slots plus fighter, Karlin, Sworn Sword) | Yes | Yes, see [units.md](units.md) | No |
| Consignment Terminal building | **Kept as a plain building (owner, 2026-11-12); what it does is not chosen.** The trade idea is abandoned | Built, still in the cdb with the trade line on it, to be removed (1000 Solari + 500 Plascrete, 8 days, upkeep 20 Solari + 10 Water, one per faction, unlocked by the `Thorvald` trait) | Trade did not work |
| Terminal Convert line: 100 Plascrete for 150 Solari | **Abandoned 2026-11-12** | Built (needs the hlboot trade patch); to be removed | **Did not work** |
| +5000 Solari cap | Yes, now a plain faction bonus (proposal 1 to 3 below) | **No** | No |
| Faction drawback: +20% CHOAM share buying price | Yes | **No** | No |
| Iron Guard rule (0 Manpower, Solari only) | **Dropped 2026-11-12** (owner) | Never built, and now not wanted: all `TH_*` infantry cost Manpower. Only the Sworn Sword has 0 Manpower | No |
| Opposition Doctrine | Yes | **No** | No |
| Defiance (v1, v2 or hybrid) | Yes, undecided | **No** | No |
| CHOAM three paths and soft-cap pool | Yes | **No**; the Sworn Sword spawn reads total shares as a stand-in | No |
| Sworn Sword spawn lines (2 at 10% shares, 2 more at 20%) | Yes | Yes, via an hlboot patch. Per the repo report (2026-11-10) it was rebuilt on Steam build 26405381 and installed on the D: PC, and the game loaded the modified data; the spawns have not been checked in a match | No |
| Sworn Sword spawn per Plascrete trade | **Dropped 2026-11-12** (its trigger, the trade, is gone) | Built (`thsw_sale` patch and a `spawn` field on the trade line); to be removed | No |
| Hegemony tier perks (5k, 10k) | Yes | **No** | No |
| Operations | Five-operation set | **No**: Thorvald still has Corrino's three | No |

The repo `CLAUDE.md` states the same gap: "The design bonuses in `house_thorvald/faction_design.md` are not implemented."

## Decision 2026-11-12: Plascrete trading is abandoned

**What:** the Consignment Terminal's Convert line (100 Plascrete for 150 Solari) did not work in a game test, so the owner dropped the whole special-trading idea. The faction gets bonuses instead of a trade. **Rejected:** a click-to-trade Terminal; the data-only fallback (Alloy Sale village button, script 54) was already removed on 2026-11-04. **Reason:** it did not work; the owner has not yet said how it failed, which is worth one line in the lessons log.

**What the Terminal did, so each job needs a home.** The trade was four things at once:

| Job | Was | Status now |
|---|---|---|
| 1. Solari income engine | Plascrete sold for Solari | Gone. The Iron Guard rule (0 Manpower, Solari only) now has no Solari engine behind it |
| 2. Solari cap | +5000 | Becomes a plain faction bonus |
| 3. A Sworn Sword source | One free spawn per 100 Plascrete sold | Gone (see Sworn Swords below) |
| 4. A Plascrete sink and the "Forge" identity | Plascrete drained into the Terminal; Silva's trade rate by shares; the frigate's Salvage fed it | Plascrete now has no use beyond buildings, so Plascrete bonuses (Hammer of Wealth's +15%) lose most of their value unless something spends Plascrete |

**The risk this opened, and how it closed:** the Iron Guard rule needed a lot of Solari, and the trade was where it came from. The owner then removed the rule (below), so the replacement no longer has to fund a Solari-only army.

### Follow-up decisions (later on 2026-11-12)

| Decision | Rejected | Reason |
|---|---|---|
| **Drop the Iron Guard rule.** The regular `TH_*` army pays Manpower like any house | Solari-only army; the softened version (half Manpower) | Owner: remove it, and express the mercenary identity elsewhere |
| **Keep the Consignment Terminal as a plain building.** The trade is gone; what the building gives is open | Retiring the building rows | Owner's choice. The copper starport model keeps a home |
| **Package choice deferred.** The owner finds the bonus list opaque, so a plain-language version and a simpler package 4 are added below | Choosing among 1, 2 and 3 as written | Not enough shared understanding yet; nothing was decided |

**Where "mercenary" lives now.** Sworn Swords (0 Manpower, Solari), the Mercenary Contract operation, the Mercenary rung of the military ladder (10% allocated), Hammer of Wealth's -30% mercenary upkeep, and the Contract Hall idea in [buildings.md](buildings.md). None needs the Iron Guard rule. Regular units keep their Manpower cost, so one open check: Opposition Doctrine was written to replace Political Asylum because Asylum's +5 Manpower would be dead weight, and that reason no longer holds (see below).

### Replacement bonuses (proposals, none chosen)

Attributes are from [../docs/attribute_catalog.md](../docs/attribute_catalog.md). "Used" is the count of vanilla traits using the attribute (a high count means proven). All numbers are starting values to tune against a small Solari income model; I have not set any.

| Bonus | Attribute | Used | Notes |
|---|---|---|---|
| **B1 Solari cap +5000** | `TRes_Max_Flat` on Solari | 23 | Proven. Percent version `TRes_Max_MRatio`, used 6 |
| **B2 Alloy Dividend:** Solari per village | `TRes_ProdPerVillageOwned_Flat` on Solari (used 1), or `TRes_ProdPerTDomain2Building_Flat` on Solari per Economy village building (used 5; the vanilla trait `Merchants` gives +3 Solari this way) | 1 / 5 | Steady, predictable, rewards a wide empire. Scales with expansion, so it fights the Opposition Doctrine's pressure on a leader *(inference)* |
| **B3 Share dividend:** Solari per 1% of CHOAM shares held | `CMarket_PerShare_GiveTTrait_Stack` (turns each 1% into one stack of a trait; used by the CHOAM Manipulation development) plus a trait carrying `TRes_Prod_Flat` on Solari per stack | not exercised for this | **Inference, untested.** Keeps the Economic path alive without trading, and belongs on Silva |
| **B4 War chest:** Solari from conflict | `Faction_TResGain_OnWar_Flat` and `Faction_TResGain_OnOpponentWar_Flat` (the Cammar Pilru shapes) (the rebel-loot line `Entity_KillRebelsLoot_TRes_Flat` was REJECTED 2026-11-13: no Solari from deaths) | proven shapes | Fits "a mercenary house earns from every conflict" and the Opposition Doctrine. Starves a peaceful game |
| **B5 Plascrete finds a use** | A Plascrete cost on heavy Thorvald units (Heavy Vanguard, frigate), or Silva's Plascrete discounts | unit costs: unchecked | **Inference:** I have not checked that unit rows accept a Plascrete cost. Without a sink, Hammer of Wealth's +15% Plascrete is a weak perk |
| **B6 Sworn Sword spawn** | `Faction_DailySpawn_TUnit_Flat` (used 1: Harkonnen bonus 9, Assassin) at a Hegemony tier, or nothing | 1 | The cap of 5 makes a daily spawn a near-free refill |

### Packages

| # | Package | Contents | Strength | Weakness |
|---|---|---|---|---|
| **1** | Steady dividend | B1 + B2 + B3, Hammer of Wealth's Plascrete kept, B5 for a Plascrete sink | Predictable income that pays for the Iron Guard in any game; Economic path survives | Two untested pieces (B3, B5); nothing rewards fighting |
| **2** | War chest | B1 + B4, a small B2 | Pays when you fight; fits the son's military focus and Opposition Doctrine | A peaceful or defensive game starves the Iron Guard; no Economic path |
| **3** | Hybrid (my lean) | B1, a small B2, B3 on Silva, one B4 line (war entry) | Steady base plus a war bonus; every path keeps a hook | The most numbers to balance; B3 still untested |
| **4** | Simple (added after the owner found 1 to 3 opaque) | B1 only, plus a small B2. Nothing else | Two proven attributes and two numbers to tune. Gives the faction a Solari identity without a system to learn | Thin: no Economic or war hook until the first match shows what is missing |

**In plain words (the options above, translated):**
- *Cap +5000 (B1):* you can bank 5000 more Solari than other houses.
- *Village income (B2):* every village you own pays a little extra Solari each day. Bigger empire, more money.
- *Share dividend (B3):* every 1% of CHOAM you hold pays a little Solari each day. Makes buying shares pay off. Untested.
- *War chest (B4):* you gain Solari when a war starts. Rewards fighting.
- *Plascrete use (B5):* heavy Thorvald units cost some Plascrete, so mining it matters. Untested.
- *Sword spawn (B6):* a free Sworn Sword now and then.

**Lean, now package 4 (a lean, not a conclusion; this is my inference).** With the Iron Guard rule gone, nobody needs Solari more than any other house does, so the stakes of this choice dropped. Package 4 is cheap, matches the playable-baseline risk (nothing has been run in a match), and the others can be added after a match shows Solari is short. Earlier I leaned to package 3 because a Solari-only army made Solari the army's lifeblood; that reason is gone. A small Python model of income against army cost would still settle it if the choice is later reopened.

### Sworn Swords after the change

The Terminal source (one free Sword per 100 Plascrete sold) is gone. Remaining sources: training; share rungs at Council end (2 at 10% shares, 2 more at 20%); the frigate's Orbital Drop (a later stage, not built); the Mercenary Contract operation (temporary). Optional: B6. The shared cap of 5 (8 at 10,000 Hegemony) stays.

### Cleanup when a package is chosen (hints, not done)

Nothing in the cdb, hlboot or scripts has been changed. Likely work for the repo agent, to confirm in the repo:
- cdb: remove the Convert line and the raw `spawn` field from the Terminal's building trait `TTh_ConsignmentTerminal`. The building row stays (owner, 2026-11-12) as a plain building; its effect waits for the package choice. A natural fit is the +5000 Solari cap, but *(inference)* I have not checked that a building trait can hold `TRes_Max_Flat`; the faction trait is the proven place.
- hlboot: the trade patch (Quinn's `resource_trades`) and `thsw_sale` are no longer needed; `thsw_share` and `thsw_oath` stay. A rebuild is needed on the main PC either way.
- Scripts: `thorvald_faction/08_scripts/54_plascrete_trade.py`, `55_plascrete_topbar_trade.py` and `57_consignment_terminal.py` made the trade; `thorvald_sworn_sword/08_scripts/41_cdb_sworn_engine.py` added the `spawn` line. Do **not** `--revert` script 41 wholesale: it also holds the Oath and share-rung rows.
- Re-run `cdb_validate.py` and `engine_preflight.py` after.

## Faction bonuses

Vanilla template: four base bonuses (three positive, one drawback), two lines at 5,000 and two at 10,000 Hegemony. The Hegemony track is the vanilla one; victory is at 30,000.

| Tier | Name | Effect | Status |
|---|---|---|---|
| Outset | ~~Consignment Terminal~~ (screen label: "Sovereign Mint") | **Abandoned 2026-11-12.** Was: a building that sold Plascrete for Solari. Replaced by a set of plain faction bonuses (name proposed: **Alloy Dividend**; renamed 2026-11-13, see the rejected list), see "Decision 2026-11-12" above | Replacement **proposed, not chosen**; old building and trade **built but did not work** |
| Outset | ~~Iron Guard rule~~ | **Dropped 2026-11-12.** Was: units cost 0 Manpower, with high Solari cost and upkeep. Mercenary identity moves to Sworn Swords, the Mercenary Contract operation and the mercenary rungs | Dropped (owner). A slot for a replacement outset bonus is open |
| Outset | **Opposition Doctrine** (replaces Political Asylum) | See below | **Designed** |
| Drawback | **Offworld premium** | +20% CHOAM share buying price (replaces "-20% CHOAM standing", which is not a game resource) | **Designed**; a Nobru discount in the built cdb cancels it (see [counsellors.md](counsellors.md)) |
| 5,000 Hegemony | **Guild Sub-Contract** | Buy Fuel Cells with Solari; ships and frigates cost 20% less Guild Favour | **Designed**. Instant travel between owned airfields may not exist as an attribute; a Space Fold-style ability is the workaround *(inference)* |
| 10,000 Hegemony | **Hammer of Wealth** | -30% mercenary upkeep, +15% Plascrete from mining, and the shared cap of spawned Sworn Swords rises by 3 (5 to 8) | **Designed**. The cap rise relies on the cap sitting in the spawned unit's row, where the build keeps it |

### Opposition Doctrine

Thorvald pressures whoever is winning. The **front-runner** is the other faction with the most Hegemony. It was written to replace Political Asylum because Asylum's +5 Manpower is dead weight under the Iron Guard rule. That rule was dropped on 2026-11-12, so the reason is gone; whether Opposition Doctrine still replaces Asylum, or sits beside it, is open (not re-decided here).

| Effect | Starting value | Vanilla precedent |
|---|---|---|
| Military units deal more damage to the front-runner | +1% Power per 500 Hegemony the front-runner leads by, max +15% | Corrino: +10% damage against a recent truce-breaker |
| Operations against the front-runner cost less | -25% Intel | Stealth Gear refunds 20% of Intel against a faction in Conflict |
| Thorvald operations are harder to detect | Detection 30% to 15% | Stealth Gear: -50% mission detection |

Drawback: if Thorvald holds the most Hegemony, all three effects switch off. Supply Chain Holdout cannot target the front-runner: buy peace with everyone else, then hammer the leader.
Risks: in a 1v1 the opponent is the front-runner whenever Thorvald trails, so it can feel like a comeback tool; and a difference-based scale is new to the engine (fallback: flat +10% above a 1,000 lead).

### Defiance (undecided)

A hidden meter from 0 to 100. Three options are kept side by side. Gains in all: undetected operations (+2 / +5 / +10 by difficulty), agents on Landsraad per day, a backed resolution passing (+10). A detected operation costs 10 and shows the meter to the target for 5 days.

| Version | Shape | Strength | Risk |
|---|---|---|---|
| **v1 Open Defiance** | At 100, a 10-day burst: break truces free of Standing loss, +10% Power against everyone, operations cost no Solari. Then 15 days of exposure: -30 Standing, all factions see Thorvald at Information Level 2, the meter cannot rise | A story moment | Free betrayal is the strongest line; exposure must hurt or it chains. The one betrayal-penalty figure I found came from a community mod, so check vanilla's real number |
| **v2 Perk ladder and Council actions** | Perks held above thresholds (25: +10% Influence; 50: +25 Votes; 75: Standing floor at Low). Per Council, spend Defiance on Reroll (30) or Redirect (60: switch a negative resolution to the front-runner) | Steady, easier to balance; Council play every 20 days | Redirect is strongest and stacks with Opposition Doctrine. Reroll and scope switching exist only for a charter and one Corrino ability; giving them to Thorvald is unconfirmed |
| **Hybrid** | v2's ladder and actions plus v1's Open Defiance as a rare finale | Both | Most systems to build |

Hidden information: the multiplayer mod page I found says Spice Wars is peer-to-peer, so the meter may only be hidden in the UI *(inference from one source)*. Treat it as secret only against the AI.
Build tiers, cheapest first: reuse an existing stockpile as the meter (vanilla spies may already hide one; test first), a counter driven by existing triggers, then a true new resource with UI.

## Three CHOAM paths

CHOAM shares feed three reward tracks, so a player can lean one way without giving up the others.

| Path | What shares improve | Councillor | Who it suits |
|---|---|---|---|
| **Economic** | Solari income per share held (B3 in the 2026-11-12 proposals; the Terminal trade rate is gone) | Silva | The supply-chain fantasy; aims at 50% shares (Economic victory) |
| **Military** | Supply, Mercenary and Armor ladder, plus the Iron Guard and Heavy Vanguard | Ein | The military side your son is focused on |
| **Political** | Influence and Standing, plus Opposition Doctrine and Defiance | Nobru | Memnon's scheming against the Crown |

**Soft-cap pool (designed):** total share percentage is one pool, allocated in 5% steps among the three paths. Each ladder reads its allocated share, not the total. Reallocating has a 10-day cooldown. Vanilla's 10% (Mercenaries), 30% (+20% damage) and 50% (Economic victory) thresholds read the total. Mixing paths gets the low rungs of each; specialising gets the top rungs.

**Military ladder (designed).** It avoids Power on purpose, because Corrino's development already gives +0.5% Power per 1% of shares.

| Allocated | Effect |
|---|---|
| 5% | Supply drain -15% for military units |
| 10% | Mercenaries recruit 30% faster and cost 20% less Solari |
| 15% | +1 Armor for all military units; their Armor cannot be destroyed |
| 20% | +1 more Armor (+2 total); Iron Guard units cost 20% less upkeep |

Rungs sit low because shares are split three ways; raise them if shares prove cheap.
Open: names for the three paths (your son may name the military one); a route to victory for the non-economic paths; the economic and political ladders are not designed yet.

## Armor now has four sources

The military ladder, Forge Mantle, Alloy Tempering (an operation) and Ein's +1 Armor in a region with a Thorvald operation. Decide whether they stack or the highest applies, and cap the total, or armies become nearly unhittable.

## Sworn Swords

One unit, several sources, a shared cap of 5 spawned alive at once (rising to 8 at 10,000 Hegemony). Trained Swords cost 60 Solari, 0 Manpower, 3 Command Points and 9 upkeep (built stats 350 health, 14 Power, 3 Armor); spawned ones are free. Sources: training; share rungs at Council end (2 at 10% shares, 2 more at 20%); and, as a later stage, the frigate's Orbital Drop. The Terminal source (one per 100 Plascrete sold) was dropped on 2026-11-12 with the trade. Built and not yet checked in a match; per the repo report the 2.0e model is exported and wired, and the icon and portrait are still the Trooper's. Details: `model_projects/thorvald/thorvald_sworn_sword/`.
Council spawns fire at vote end, not opening: the engine has no unit-spawn hook at opening.

## Operations (pointer)

The repo's [operations.md](operations.md) still holds the older Requisition / Embargo / Hammerfall set. The current set for the first playtest, all designed and none built:

| Operation | Tier | Effect |
|---|---|---|
| Alloy Tempering | Easy, CHOAM 1 | Allies in a region +2 Armor, -10% Speed |
| Consignment Levy | Medium | A share of a neutral village's production flows to Thorvald; needs a check that operations can target neutral villages |
| Mercenary Contract | Medium, Spacing Guild 2 | Temporary squad of 3 Sworn Swords, 0 Manpower; kept to compare against the frigate's Orbital Drop |
| Market Crash | Hard, CHOAM 2 | Target -25% Solari production for 5 days |
| Supply Chain Holdout | Epic, Landsraad 2 | Forced truce for 5 days; cannot target the front-runner. No longer gated by Political Asylum. Fallback: copy Cease Fire for one region |

## Terminal economy: the risk to settle first

Thorvald's Solari income still matters, but less than before. With the Terminal trade gone the old stacking worry (Terminal, +5000 cap and Hammer of Wealth) is gone, and with the Iron Guard rule dropped there is no Solari-only army to fund. Both brakes the Terminal gave (a capped trade rate, and Plascrete drained by Sworn Swords) are gone with it. Whichever package is chosen, cap each dividend separately until the soft-cap pool exists. A small Python model of Solari income and army cost per day against Corrino and Ecaz would settle it before a playtest.
The remaining Solari-only costs are the Sworn Sword (60 Solari, 0 Manpower) and the mercenary upkeep cuts. The old assumption that 1 Manpower is worth about 2 Solari only matters for pricing the Sword; I found no vanilla figure for that rate, so it needs tuning.

## The Corrino-clone problem

The live faction (`TH_*`, [../model_projects/thorvald/thorvald_faction/SPEC.md](../model_projects/thorvald/thorvald_faction/SPEC.md)) is cloned from Corrino and still carries Corrino's bonuses, operations and "Imperial army" texts. Lore makes Thorvald the Emperor's opponent, so each leftover is a story break. Replace the operations first, then the faction bonuses.

## Faction slot

Decided: Thorvald was added as an extra faction (Ginaz loaded as the ninth; the game log showed `GinazBase` placed). Whether the engine accepts a tenth faction in faction select is **unverified**. Fallback if it does not: take over a vanilla slot, as Idualis and Landsraad did.

## Look

Repo `CLAUDE.md` rule: polished charcoal or gunmetal, bold copper trim, oxblood accents, no rust, no bone patches; copper must read at RTS zoom. Two older sources disagree: the concept screen's emblem is a rust-red gear, and the lore brief's swatch for the house is industrial orange. Both should be treated as source art, not the current rule. Check the final colour against vanilla factions so players can tell them apart on the map. The gear-and-star decal is independent of everything else and can be done in parallel; the main-base and Indoctrination Center recolours wait on files from the game pak.

## Lore fit

| Piece | Anchor |
|---|---|
| ~~Consignment Terminal~~ (abandoned) | Heighforge's alloy is consigned and sold on Arrakis. There is no mint. The lore anchor can carry over to the replacement bonuses (a "dividend" from alloy contracts) |
| ~~Iron Guard rule~~ (dropped) | "The hammer of wealth": the house pays for soldiers instead of raising levies. This now lives in the mercenary pieces (Sworn Swords, Mercenary Contract), not in the regular army |
| Opposition Doctrine | Memnon backs the Emperor's enemies and pressures the leader |
| Defiance | Public loyalty to the Landsraad, private opposition to the Crown |
| Guild Sub-Contract | Heighforge alloys build the ships the Guild and the Houses fly |
| Hammer of Wealth | The motto; +15% Plascrete is the asteroid-mining heritage |
| Sworn Swords | Contract soldiers raised through the share rungs and training (the Plascrete-sale source was dropped 2026-11-12) |

## Rejected mechanics: do not propose again (owner, 2026-11-12 to 2026-11-16)

Check this list before proposing any mechanic. Each line was turned down by the owner.

| Mechanic | Rejected | Reason |
|---|---|---|
| **Heighforge acting on Arrakis**: anything where Heighforge strikes, ships, supplies or watches on Arrakis (the Hammerfall / Slag Drop orbital strike, "fresh plate shipped down from Heighforge", Heighforge Beacon) | 2026-11-13 | Heighforge orbits Ipyr, nowhere near Dune. This had been said before. Heighforge stays in the lore as the house's home and the source of its wealth; it does not appear as a mechanic. Names that only say where the alloy comes from were renamed to be safe (B2 is now the Alloy Dividend) |
| **Solari from deaths or kills** (Prize Money, the councillor idea Bounty Clerk, the rebel-loot line of bonus B4) | 2026-11-13 | Owner dislikes it |
| **Any resource from deaths or kills** (Plascrete from deaths near the frigate, the Salvage idea, salvage teams of any kind; the Smugglers' Scavenger Team shape `Unit_OnDeath_MaxHealthToTRes_ARatio`) | 2026-11-16 | Owner: "Stuff from deaths is still not my thing." Extends the Solari rule to every resource. The older Salvage text in this doc and the spec is stale and should not be built |
| **Muster Rolls**: Command Points per CHOAM share | 2026-11-13 | Bad idea (owner) |
| **Mothballing**: disbanding a unit refunds part of its cost | 2026-11-13 | Owner |
| **Dividend Day**: a lump of Solari per share at the end of each Council | 2026-11-13 | Lazy (owner) |
| **Guild Escrow**: faster air recruitment near a Thorvald Airfield | 2026-11-13 | Does not make sense in this game (owner) |
| **Plascrete trading** (Consignment Terminal Convert line and window) | 2026-11-12 | Did not work in a game test |
| **Iron Guard rule** (0 Manpower, Solari only) | 2026-11-12 | Owner: express mercenaries elsewhere |
| **Twin councillors**: a vanilla councillor renamed with a "cheaper" number | 2026-11-12 | Unimaginative; reskin the fantasy or trigger instead |

**Patches are fine (owner, 2026-11-16):** needing an engine patch is not a reason to drop an idea; patch-only ideas are likely the most distinctive. Mark them *patch* and weigh the cost (every player runs the patch; re-run after each update).

**Test it ourselves (owner, 2026-11-16):** do not plan on asking in the Dune: Mod Wars Discord or elsewhere. Open engine questions (new `resAction` ids, new treaty rows, apply codes, AI acceptance) are answered by our own experiments. Every UNKNOWN in this doc should end in a test, not a question to the community.

**Bar for new proposals (owner, 2026-11-13):** the simple stat bonuses are easy and the owner can write them himself. Proposals should be more creative: new rules or interactions, still built on what vanilla proves.

**Liked on 2026-11-13 (designed, not built):**
- **War Footing:** +15% Plascrete production while Thorvald is at war with anyone. `TRes_Prod_ARatio` is PROVEN; making it war-only is UNTESTED (Zum Garon's peace-only Power bonus shows the opposite condition exists). A candidate for the empty starting bonus (G1).
- **Assay Survey:** every Plascrete deposit on the map is visible to Thorvald from the start. Vanilla reveal effects exist (Fenring, Stilgar); an attribute that reveals one kind of resource field is UNKNOWN, so this needs an attribute search first. A candidate for Silva or a starting bonus.

## Tribute and mercenary-lending treaties (candidates, 2026-11-16)

**Status: designed, not built, not tested.** The owner re-opened the idea of Thorvald taking a cut of what other houses spend, and said engine patches are welcome: needing a patch is no longer a reason to drop an idea. Nothing here is chosen. Pick one in D16.

**What vanilla already has** (read from `mod_files/data_vanilla_2026-11-09.cdb` on 2026-11-16; earlier I had scanned only trait attributes and missed the treaty sheet):
- **A tribute system exists.** The treaty `MilitaryPressure` (shown as "Tributary": "Allows the use of threats to extort resources") costs 100 Influence, changes relations by -50, has a 30-day propose cooldown and cannot be proposed to Corrino. It applies three traits (`TMilitaryPressure`, `_Sender` "Receive tribute from...", `_Receiver` "Send tribute to..."). None of the three has any attributes, so the payment itself is coded in the engine *(inference)*. Diplomatic statuses `TributeLiege` and `TributeSubject` exist.
- **`TRes_Tribute_Flat`** ("Gives X% of production to the trade sender"): implemented, used by no vanilla row. Whether it works on a custom Receiver trait is UNKNOWN. It is the likely knob for the payment *(inference)*.
- **A mercenary-lending treaty exists.** Corrino's `ImperialMandate` costs 500 Solari, and its effect `TUnit_SpawnMB` "lends 2 [units] to the receiver"; `onlyForFactions` limits it to Corrino. Treaty rows are plain data, so a Thorvald copy is data-only. Its second trait pays both sides 50 Solari on the partner's kills; that part is NOT copied (Solari from kills is on the rejected list).
- **Patch hooks (Quinn's framework, `reference_cdb_attributes_traits.md` section 6):** triggers are OnKill, OnDeath, building, development, quest, treaty, siege action, assassinate, eliminate, EachDay and EachMonth. There is no trigger for "another faction bought something".

| | What it does | Feasibility | Pros | Cons |
|---|---|---|---|---|
| **T1 Protection Racket** | A Thorvald-only copy of Tributary: the target pays a % of its Solari production to Thorvald | Data-only if `TRes_Tribute_Flat` works on a Receiver trait. UNTESTED. The copied treaty shape is PROVEN (vanilla Tributary) | Smallest build. Clear mercenary-banker fantasy. Tests the tribute attribute on its own | Pure extortion: nobody accepts it voluntarily. Costs Influence and relations (-50 in the vanilla shape). Close to vanilla Tributary, so the Corrino-clone worry applies *(inference)* |
| **T2 Hired Blades** | A copy of the Imperial Mandate shape: Thorvald lends Sworn Swords to a partner for a term; the partner pays tribute in Solari while it lasts. No kill payout | Treaty shape PROVEN (Corrino). Tribute payment UNTESTED (same unknown as T1). Whether lent swords count against the Sworn Sword cap (5, or 8 at 10,000 Hegemony): OPEN | Both sides gain, so the AI and other players can accept it. It is literally a mercenary contract: the house's identity. Military appeal for the owner's son | Needs a cap rule. Overlaps the Mercenary Contract operation and Consignment Levy (D14): check before building both. Partner could use the swords against Thorvald's allies *(inference)* |
| **T3 Spending cut** | Thorvald gets a slice when a rival buys CHOAM shares or hires units | PATCH. No existing trigger; the hook location is unknown. Same kind of work as the `thsw_*` ticks. Every player must run the patch, and it must be re-run after each game update | The most unique of the three. Strong for the Economic path | Highest risk and cost. Peer-to-peer play: the payout must be computed the same on every machine. Unknown how to read other factions' purchases |

**My lean *(inference)*:** T2 first, because it uses a proven treaty shape and tests the tribute attribute at the same time. T3 only after T2 works. T1 is the fallback if lending proves awkward.

**First step for any build (hints, not facts):** before changing data, report feasibility: (1) read `MilitaryPressure` and its three traits from the real `data.cdb`; (2) copy `ImperialMandate` to a Thorvald treaty with a Sworn Sword in `TUnit_SpawnMB`; (3) add a Receiver trait with `TRes_Tribute_Flat` and report whether it loads and what the tooltip shows. Treaties may also have engine-side limits (who can be a receiver, how a term ends) that the data does not show.

## Candidates from an outside brainstorm (Gemini), 2026-11-16

**Status: designed, not built, not tested.** The owner asked for the best of it plus the shaky parts, because trying to make a shaky idea work can lead to a better one. Nothing here is chosen; pick in D17.

**Caveats on the source (checked against [lore.md](lore.md)):** its sources are redirect links that could not be opened, so its lore is unverified. It suggests Lady Firenza as a councillor, but in our lore she died about 10189, two years before the game's 10191 setting, so she stays a grievance, not a character. "Topple Paul's rule" is after the game's era. The ideas are Stellaris mechanics re-skinned for Dune; the Stellaris side proves nothing about this engine.

### Candidates (worth building toward)

| # | Idea | What it does | Feasibility | Pros | Cons |
|---|---|---|---|---|---|
| C1 | **Conspirator Cells** | An agent plants a dormant cell in a rival's territory. While dormant it leaks a little of the target's Influence to Thorvald. Activating it spawns rebel militia in several regions at once, a coordinated coup | PROVEN as the Smugglers' Underworld Headquarters: ability `InstallUWHeadquarter` (50 Solari + 5 Authority, `onlyForFactions` Smugglers), a persistent building row with over 30 `UH_*` attributes (siphoning, spawn on siege, detection, resupply). Reusing it for Thorvald is a data change to `onlyForFactions`. Siphoning Influence specifically is UNKNOWN. The ability row `UnderworldCells` is flagged `implemented: false`. See the Council actions section below | Fits the double-game theme. The only one with a military payoff for the owner's son. Two states (dormant, active) give a decision | Close to a copy of the Smugglers' defining building, which the owner has flagged as a risk. The leak could be too strong or too invisible. Overlaps Defiance's leak and exposure ideas. Rebels near the cell may hit neutral villages too *(inference)* |
| C2 | **Rebel Pact** (the Stellaris "Federation") | A Thorvald-only treaty. While it lasts, both signers gain a bonus, for example Power against the front-runner and a little Influence | Same treaty shape as T2 Hired Blades and Corrino's Imperial Mandate: PROVEN as data. Power per active treaty is PROVEN (`Army_PowerPerTTreaty_ARatio`: Aramsham 0.10, Zum 0.15). Per-treaty resource attributes exist with 0 vanilla uses (`TRes_OnCouncilOpening_PerTTreaty2_Flat`, `Faction_Truce_CopyTResGain_ARatio`, `TRes_TruceFaction_Prod_Flat`), so they are untested. A bonus that depends on a target faction is UNKNOWN; reusing Opposition Doctrine's front-runner condition is the safe start | New interaction: Thorvald becomes a coalition builder. Partners have a reason to accept | Overlaps Opposition Doctrine. Needs a rule for what happens when the partner becomes the front-runner |

**C3 Noble Debts** (spend debts at the Council to redirect a rival's voting power) is not a separate item. It is Defiance v2's Redirect action with a different currency. Vanilla precedent: the Smugglers' Bounty Council action (`resAction` Bounty, up to 500 Solari, every other faction gains 10 Solari per vote on the chosen choice) already spends a currency at the Council to move other factions' incentives. Decide it inside D2: either rename the Defiance meter "Debts", or earn debts from the unused CHOAM attributes (`TRes_OnCouncilVoteEnd_PerFactionWithLessCHOAMShares_Flat`, no vanilla use) so that out-holding rivals in CHOAM creates the debts *(inference)*.

### Sparks (shaky as given; ways to make them work)

| Idea as given | What is shaky | Ways to make it work |
|---|---|---|
| **Walkout and boycotts**: operations that erode rival Standing and freeze their Charter claims | Freezing a Charter claim has no known hook. Erosion already exists as the stretch operation Firenza's Grievance in [operations.md](operations.md) | 1. **Walkout as a Council action:** the proven shape is Landsraad Immunity (`resAction` LandsraadImmunity: 30 Standing, up to 3 per Council, the faction becomes ineligible for the resolution; Ecaz unlocks it via `IbboVipp` and `IlesaPassive`). A Thorvald copy is a data change if the engine accepts the unlock. The attribute `Allow_CancelNegativeResolution` (0 vanilla uses) is NOT the hook to use 2. Keep Standing erosion as the Firenza's Grievance operation, and use the vanilla Harmless Gadget treaty's "loses Standing" effect as the shape. 3. A walkout that also costs the walker: Thorvald loses its votes in that Council |
| **Champion of the Landsraad**: a new resolution that strips the Governor's veto and redistributes tax | A new resolution plus tax redistribution is large and likely a patch | 1. **Smaller version:** at 10,000 Hegemony a Council action cancels or redirects one resolution (the Defiance v2 Redirect or the Walkout above). 2. **Share the wealth:** Rebel Pact members get a share of Thorvald's CHOAM dividend, the "redistribute to the Great Houses" idea inside C2 *(inference)*. 3. Park the real resolution next to the Hostile Takeover Bid |
| **Anti-leader core identity** | Already built: it is Opposition Doctrine | Nothing to add. It confirms the direction |

## Council actions: what vanilla already has (checked 2026-11-16)
Status: designed none, built none, tested none. These are facts read from `data.cdb` (sheet `resAction`, 7 rows) after the second Gemini check. Each action is unlocked by a trait through the attribute `Unlock_TResAction`.

| Action | Unlocked by | Cost | Effect |
|---|---|---|---|
| Bounty | Smugglers (`Smugglers_HegemonyBonus1`) | Solari, up to 500 | Every other faction gains 10 Solari per vote on the chosen choice |
| Corruption | Harkonnen (`FeydPassive`) | Intel, up to 20 | The elected faction loses 30 Standing; Harkonnen immune |
| InciteRebellion | Fremen (`RamalloPassive`, `ChaniPassive`) | Authority | `Villages_RandomRebellionsRatio` 0.25 if the resolution passes |
| ImperialEdict | Corrino (`Corrino` trait) | 20 Influence, max 3 per Council | Switches scope between a single faction and all |
| LandsraadImmunity | Ecaz (`IbboVipp`, `IlesaPassive`) | 30 Standing, max 3 per Council | The faction becomes ineligible for the resolution. `LandsraadImmunity_Bonus` costs 30 Influence |
| LandsraadFavorite | Built in (Landsraad) | | +10 Standing |

(Six rows are listed; the seventh was not recorded in my notes. Re-read the sheet before relying on the count.)

### Shapes for Thorvald (inferences, none tested)
- **Walkout** from LandsraadImmunity: pay Standing to make Thorvald ineligible for a resolution aimed at it.
- **Noble Debts** from Bounty: pay a currency so rivals gain something when they vote Thorvald's way.
- **Smear** from Corruption: pay Intel so the elected faction (the front-runner) loses Standing. Close to Opposition Doctrine's purpose.
- **Rebellion** from InciteRebellion: a villages-wide unrest roll if a resolution passes. Fremen already own it, so this is a copy risk.

Open question, safe first test: unlock an existing `resAction` for a test councillor with `Unlock_TResAction`. If that works, clone one row under a new id. Whether the engine accepts a NEW `resAction` id is UNKNOWN, since all vanilla rows are vanilla.

### Underworld Headquarters (Smugglers), for C1
Ability `InstallUWHeadquarter` (`onlyForFactions` Smugglers; 50 Solari + 5 Authority; implemented). Hegemony row `UWHeadquarters`; trait `T_UH_Hegemony`; constant `UWHQ_StolenProd_MaxStock` 1000; over 30 `UH_*` attributes. Of the Smugglers' missions, only `MSleeperAgents`, `MGearSabotage` and `MDefenseSabotage` have effects. `MUnderworldCells`, `MPoliticBribe`, `MCrowdManipulation` and `MGhostMarket` are disabled stubs with empty effects *(checked in the cdb 2026-11-16; an earlier version of this line wrongly said all seven exist)*. The Sleeper Agent trait `TSleeperAgents` (50% chance that a dead non-mechanical unit spawns an `H_Sleeper`) is the real precedent for C1's rebel spawn. `CB_MInciteRebellion` and `CB_InciteRebellion` are conquest-campaign only.

### Gemini's second answer, checked
Right: Council actions exist and are trait-unlocked; the Smugglers' Underworld Headquarters exists; Tributary and treaty rows are plain data.
Wrong: "+50 permanent votes" for Ecaz. The real row is `Ecaz_HegemonyBonus2`: `FreeVotes_Resolution_Flat` 30 (the first 30 votes on each resolution are free) plus 0.002 Hegemony to Solari. Per-truce bonuses it described mostly have 0 vanilla uses.
My own earlier errors, corrected above: C1 "likely a patch" (too pessimistic) and the Walkout hook (`Allow_CancelNegativeResolution`).

## Sponsorship treaty (candidate S1, 2026-11-16)
Status: designed, not built, not tested. The owner asked for a treaty where the other player gets more votes and Thorvald gets a payment of Solari.

**What vanilla already has (read from the cdb 2026-11-16)**
- **An unfinished sponsorship-shaped treaty is in the data.** Row `TTreaty` (restricted to a test faction, so unusable) carries traits `TPatronage_Sender` (Influence and Manpower, 0.2 each, no clear effect) and `TPatronage_Receiver` (+20% Life and +20% Power), duration -1 (until cancelled), cost 50 Manpower. It shows the shape: one trait on the sender (`apply` 1) and one on the receiver (`apply` 2). The apply codes are read from the Water Gift and Imperial Mandate rows *(inference)*.
- **The vote attribute is proven.** `FreeVotes_Resolution_Flat` gives free votes on every resolution (Ecaz uses 30). `FreeVotes_TResolution_Flat` (votes on one resolution) and `FreeVotes_Charter_Flat` have 0 uses.
- **A per-Council Solari payment is proven as an attribute.** `TRes_OnCouncilVoteEnd_Flat` gives a resource after every Council (2 vanilla uses). `TRes_OnCouncilOpening_PerTTreaty2_Flat` pays per active treaty (0 uses).
- **A real transfer from the partner is not proven.** `TRes_Tribute_Flat` ("gives X% of production to the trade sender") has 0 uses; see the Tribute section above.
- **Inverse precedent:** the Smugglers' Bounty Council action pays Solari to move votes. Sponsorship sells them.

| | What it does | Feasibility | Pros | Cons |
|---|---|---|---|---|
| **S1a Flat sponsorship** | Thorvald-only treaty. The partner gets N free votes on every resolution. Thorvald gets a fixed Solari payment after every Council, made by the game, not taken from the partner | Treaty shape PROVEN. The vote attribute is PROVEN on a trait; delivering it through a treaty receiver trait is UNTESTED. The payment attribute is PROVEN, also untested through a treaty. Data only | Simple. Partners have a clear reason to accept. Fits "the hammer of wealth": Thorvald sells influence | Solari is created, not paid by the partner, so it can feel free. The AI's willingness to sign is UNKNOWN |
| **S1b Paid sponsorship** | Same votes, but the partner pays a share of its Solari production (`TRes_Tribute_Flat`) | UNTESTED; depends on the tribute attribute working on a Receiver trait | The partner really pays, so it is a trade, not a gift | If the attribute fails, a patch is needed |
| **S1c Scaled sponsorship** | Thorvald is paid per vote the partner actually places, or votes grow with the number of active sponsorships | Probably a PATCH. No attribute I know of counts only the partner's votes. `FactionResolution_TRes_PerVotes_Others` (1 use) counts votes spent on anyone else *(inference)* | Payment follows use, so no waste | Patch cost; every player runs it |

**Fit with Opposition Doctrine** *(inference)*: sponsor the underdog, not the front-runner. A rule that makes the payment larger when the partner is behind would turn Sponsorship into the diplomatic side of Opposition Doctrine. Risk: free votes let the partner pass resolutions against Thorvald, so the votes need a cap or a term.

**First step (hints, not facts):** report feasibility before changing data. (1) Read `TTreaty`, `TPatronage_Sender` and `TPatronage_Receiver` from the real `data.cdb`. (2) Copy `ImperialMandate` to a Thorvald-only row with a receiver trait carrying `FreeVotes_Resolution_Flat` and a sender trait carrying `TRes_OnCouncilVoteEnd_Flat` (Solari). (3) Report whether the game accepts and displays it, then test whether the AI signs it.

## Third Gemini pass: military ideas, checked (2026-11-16)
Status: designed none, built none, tested none. Mostly a reskin of ideas we already hold. Two are worth keeping as sparks; the rest is recorded so it is not proposed again.

| Idea as given | Checked | Verdict |
|---|---|---|
| **Rebel levies that power up elites when they die** | Proven pieces: `NearbyDeath_InCombat_GainTTrait` (an old Harkonnen elite trait), `Army_SplitIntoTUnits_Count_OnDeath` (2 uses). The cleanest hook, `Death_GiveTTrait_AtTRange2Allies`, has 0 uses: UNTESTED. Gemini's "Harkonnen Oppression" proof is wrong (it doubles village production) | **Spark, kept (owner, 2026-11-16: "Stay").** It is a combat buff, not a resource, so the rejection of resources from deaths does not apply |
| **Armor while an operation is active in the region** | `FactionArmy_InZoneWithOperation_Armor_Flat` is PROVEN (Umman's passive, 1 use) | **Spark.** Pairs with the Requisition operation in [operations.md](operations.md) |
| Gold-fueled overdrive | No per-second Solari drain exists. An operation that costs Solari and buffs troops in a region is the workable shape; Defense Breaches already costs 500 Solari plus 500 Intel | Same as Requisition. Nothing new |
| Truce-territory armor and regen | `Army_Supply_NoDrain_TruceRegion` and `Army_ResupplyAndHeal_NearNeutralVillages_Bonus` have 0 uses. The Atreides and Vernius territory-modifier claim was not verified | Untested. Low priority |
| Alloy Salvage Teams | Smugglers' Scavenger Team (`Unit_OnDeath_MaxHealthToTRes_ARatio` 0.25) is the shape | **REJECTED** (see the rejected list: any resource from deaths) |
| Sabotage detonations | Gear Sabotage and Defense Breaches are live operations (-3 armor and +50% damage taken on a main base). Detonating harvesters does not exist | Already in vanilla for Smugglers and Harkonnen |
| Roster table | Unit names are real (Warden `A_Elite`, Gunner `H_Demo`, Cerberus `H_Soldier`, Squire `E_Trooper`, War Banner `E_Drone`, Railgun Drone `V_Special`). Not compared with [units.md](units.md) | A reskin list, no new mechanics |

## Fourth Gemini pass: modding community and outside ideas (2026-11-16)
Status: recorded, nothing built or tested. Gemini searched the web with a prompt that demanded a source and a tag on every claim. Its answer was careful, but it settled none of our engine questions: no public source says whether a new `resAction` id or treaty row works without the patch, what the treaty `apply` codes mean, or how `aiWeights` and `tradeValue` steer the AI. Per the owner's rule above, those get answered by our own tests.

**Reference mods (claims from Gemini, pages not opened by me)**
| Mod | Link | Why it matters |
|---|---|---|
| Bene Tleilaxu faction | https://www.nexusmods.com/dunespicewars/mods/9 | A full custom faction already shipped (units, heroes, councillors, armoury, research, buildings) in a `res.compressed1.pak`. Its files are a working example to study before we test new rows. Reported broken by the 6 Nov update |
| Quinn's Faction Toolkit | https://www.nexusmods.com/dunespicewars/mods/10 | Separate from the patcher: a faction template, sound tool and HMD toolkit. The repo uses the HMD toolkit; whether we have the template is OPEN (owner to answer) |
| Quinn's Unofficial Patcher v1.4.0 | Nexus Mods (no mod number given) | Adds custom attributes, resource trades, permanent Council actions, custom siege actions. Updated the same day as game update v2.2.8 (6 Nov 2026). Windows .exe only |

**Game version note:** update v2.2.8.33026 (6 Nov 2026) changed `hlboot.dat`, `hlbootdx.dat` and `res.compressed.pak`. Our vanilla file is dated 9 Nov, so it is probably post-update *(inference)*.

**Outside ideas that match items already on file (inspiration only)**
| Game mechanic | Matches | What it adds |
|---|---|---|
| Stellaris Favors: spend Favors to borrow another empire's vote weight in the Senate | C3 Noble Debts; Sponsorship in reverse | A model for debts as a vote currency with a cap per resolution |
| EU4 Condottieri: rent an army for a monthly fee, 18-month minimum before either side cancels | T2 Hired Blades; Sponsorship | A minimum term. It answers the Sponsorship risk that the partner turns its free votes on Thorvald |
| Endless Legend Roving Clans: a cut of every market deal, can ban empires from the market | T3 Spending cut | Confirms the idea has a precedent; still a patch |
| Civ VI Diplomatic Favor traded like a commodity | Sponsorship | Votes priced in a currency |

**Treat with caution:** "a faction can pass a resolution with free votes only" is Gemini's inference. "The AI almost always accepts treaties" is a 2023 Reddit report, older than the current version.

**Lore lead, UNVERIFIED:** Gemini says Memnon walked out on Paul's Landsraad speech in 10194 and led a noble rebellion from 10193 to 10198 that ended with Ipyr sterilized (source given: the Dune wiki, from Paul of Dune and The Winds of Dune). My search did not confirm it. If true, it is a canon basis for the Walkout spark, but it is after our ~10191 setting: use it as foreshadowing, not history. See [lore.md](lore.md).

## Decisions to make and gaps to fill (one list, 2026-11-12)

Open items used to be scattered: about eight places in the online spec, a list in the decision log, and this file. This is the single list; the others point here. D means a decision between options, G means a gap against the vanilla faction template that nobody has filled yet. Lines marked *(inference)* are my reading.

**Decided on 2026-11-12, so not open:** the Plascrete trade is abandoned; the Iron Guard rule is dropped; the Terminal stays as a plain building; the four councillor leads (Consignment Factor, Paid-Off Contracts, Double Ledger, Renegade Handler) are the designed targets.

### Decisions (D)

| # | Decision | Options | Status or lean |
|---|---|---|---|
| D1 | Replacement for the Plascrete trade | Package 1 Steady dividend, 2 War chest, 3 Hybrid, 4 Simple | **Owner: hold until a test game.** My lean is 4 *(inference)* |
| D2 | Defiance | v1 burst, v2 perk ladder plus Council actions, hybrid | Undecided. v2 matches the owner's wish for Council use and steady perks *(inference)*. C3 Noble Debts and the Walkout spark are options for v2's meter and Council actions. Redirect has no vanilla precedent (Corrino's Edict switches scope between one faction and all, not the target) |
| D3 | What the plain Terminal gives | The +5000 Solari cap; a small Solari income; nothing | Open. The cap is the natural fit; unchecked whether a building can hold it |
| D4 | Opposition Doctrine versus Political Asylum | Replace Asylum (as designed); keep both | Open. The reason to replace it (Asylum's Manpower) vanished with the Iron Guard rule |
| D5 | Armor stacking (four sources) | All stack; highest applies; cap the total | Open |
| D6 | The soft-cap CHOAM pool | Build the pool; keep reading total shares | Open. As designed it is not buildable, so total shares for a first test *(inference)* |
| D7 | Names of the three CHOAM paths | Owner's son may name the military one | Open |
| D8 | Names: the final military councillor; Ferdinann Jinjo's role; a cousin or nephew; when to apply | Docs first, data after the first test game | Open; see [name_candidates.md](name_candidates.md) |
| D9 | Colours: the house look (copper or lore orange) and the Sworn Sword accent | | Open |
| D10 | Easy and Hard tags (one Easy and three Hard are built; vanilla has two each) | Silva Easy, Ein Easy, Nobru Hard, Haruka Hard | Open; my suggestion *(inference)* |
| D11 | Nobru's share discount | Remove now; remove when the drawback is built | Open; later is safer *(inference)* |
| D12 | Haruka's per-level income | Keep; halve; drop | After one test game |
| D13 | Where the free Sworn Sword spawn lives | Faction bonus B6; the councillor idea Retainer Levy; none | Open; pick one |
| D14 | Operations: Orbital Drop as ability, operation or both; does Mercenary Contract duplicate it; add Consignment Levy; what renegade bases spawn | | Open |
| D15 | Tenth faction slot | Extra faction (built); take over a vanilla slot (fallback) | Unverified; the first launch answers it |
| D16 | Tribute and lending treaties (see the section above) | T1 Protection Racket, T2 Hired Blades, T3 spending-cut patch | Open. All three recorded as candidates. My lean is T2 first, then T3 *(inference)*; nothing built or tested |
| D17 | Which outside-brainstorm ideas to build (see the Gemini section above) | C1 Conspirator Cells, C2 Rebel Pact; sparks: Walkout, Champion | Open. C1 and C2 recorded as candidates, sparks recorded with ways to make them work; nothing built or tested |
| D18 | Sponsorship treaty (see the section above) | S1a flat, S1b paid by the partner, S1c scaled (patch) | Open. Recorded as a candidate; my lean is S1a to test the shape, then S1b *(inference)*. Nothing built or tested |
| D19 | Third Gemini pass sparks | Levies that power up elites; armor from operations in the region | Open. The owner kept the levy spark (2026-11-16). Nothing built or tested |

### Gaps (G)

| # | Gap | Where it stands | Options to fill |
|---|---|---|---|
| G1 | **An empty starting bonus.** Vanilla gives four (three good, one drawback). Thorvald has Opposition Doctrine, the dividend (a placeholder until D1) and the Offworld premium (the drawback). The Iron Guard rule's slot is empty | One bonus short | *(All inference.)* A mercenary bonus (cheaper or longer-lived Sworn Swords, moved down from Hammer of Wealth); a Guild or Sky bonus moved down from the 5,000 tier; a Plascrete bonus that gives mining a use |
| G2 | Second perk lines at 5,000 and 10,000 Hegemony | Vanilla has two at each; Thorvald has one (Guild Sub-Contract, Hammer of Wealth) | Optional; the thin version still plays |
| G3 | Economic and Political CHOAM ladders | Only the military ladder is designed | The councillor leads (Consignment Factor, Share Broker) are natural first rungs |
| G4 | A victory route for the non-economic paths | The Economic path aims at 50% shares; the others have none | Open |
| G5 | Operations | Five designed, none built; Thorvald still has Corrino's three; `operations.md` lists an older set | Build after the first test game |
| G6 | Unique buildings | Vanilla has one; Thorvald has the plain Terminal and four models with no data rows | Choose effects from [buildings.md](buildings.md) |
| G7 | Art still Corrino's | Ornithopters, harvester, artillery drone, Hammer ship, HQ model, hero bodies and portraits, UI art, emblem, banners, loading screens; the Iron Guard unit's portrait; the frigate's open and close animation | See the faction `SPEC.md` |
| G8 | The faction bonuses in the game data | Still Corrino's; none of ours is built | After D1 and G1 |
| G9 | No playtest | Nothing has been checked in a match | First test list: faction select with a tenth faction, portraits and tooltips, Sworn Sword spawns, the frigate's deploy, the Terminal cleanup |
| G10 | Docs behind the repo | `operations.md`, `units.md`, `agent_log.md` (newest entry 2026-11-03), `todo.md`, repo `CLAUDE.md` | Caught up one at a time |

## Flags carried over

- Terms on the concept screen (Authority, Influence, Intel, Landsraad Standing, CHOAM, Fuel Cells, Plascrete) still need mapping to real attributes before further cdb work. `docs/attribute_catalog.md` and `house_ginaz/mechanics/vanilla_scan/catalog_traits.md` are the starting points.
- Landsraad Standing runs 0 to 500 in five tiers and affects votes, Influence and CHOAM share prices. One machine-translated wiki says the lowest tier raises share buying price by 300%; confirm in game.
- The "Heighforge Mint" naming was resolved as the Consignment Terminal (Heighforge is a metals factory; there is no mint). That building is now abandoned along with the trade, 2026-11-12.
