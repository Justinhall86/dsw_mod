# Councillor ideas: the Thorvald pool

> **IDEAS ONLY.** Nothing on this page is built or approved. Names, numbers and effects are brainstorm placeholders. The current
> roster, what is built in `data.cdb` and what is designed is in [counsellors.md](counsellors.md); this page is a pool to pick from.
>
> **Reviewed and rewritten 2026-11-12** after the owner called the first pool unimaginative and, in places, a copy of vanilla. The
> **2026-11-13:** see the "Rejected mechanics" list in [faction_design.md](faction_design.md) before proposing anything.
> The pre-review pool is kept in [_archive/councillor_ideas_2026-11-12.md](_archive/councillor_ideas_2026-11-12.md) (an older one is
> `councillor_ideas_2026-11-03.md`). Its PROVEN / UNTESTED / UNKNOWN labels are carried into the triage table below, so nothing useful was lost.

Rule for this page, from the owner: **use what is proven to work, and reskin it.** A reskin means the same engine under a different
fantasy, a different trigger, or a different reason to exist. A rename alone is not a reskin.

## What was wrong with the old pool

1. **Twins, not reskins.** Most of the 28 entries took a vanilla councillor, changed the title and made the effect "cheaper" or "for Solari". *Citadel Foreman*, *Citadel Architect*, *Survey Chief*, *Construction Chief* and *Heighforge Liaison* are the same effect as Staban, Bolig, Fenring, Mesa and Paul with a new name.
2. **Written around things that no longer exist.** The Consignment Terminal's Plascrete trade was abandoned (2026-11-12) and the Iron Guard rule (0 Manpower, Solari only) was dropped the same day. Entries like *Master of Operations* ("unlocks the Terminal"), *Quartermaster* ("Solari instead of Manpower") and *Foundry Marshal* (stacks per Terminal) leaned on them.
3. **Several ideas the build already has or cancels.** Silva already has +20% build speed (so *Construction Chief* is redundant); Ein already has the Armor-in-operation perk (so *Foundry Metallurgist* adds a fifth Armor source); Haruka's built passive already has the Intelbroker shape.
4. **Trade-style conversions.** *Expeditionary Marshal* ("trade Solari for Authority") and *Supply Chain Arbiter* ("pay Solari instead of Influence") are conversion mechanics, the kind of thing that just failed with the Terminal. Both were UNKNOWN anyway.
5. **No tie to what makes Thorvald different.** Almost nothing used CHOAM shares, the Opposition Doctrine, Sworn Swords or the double game (public Landsraad loyalty, private opposition to the Crown). Those are the house's identity, so the new entries start there.

## What a Thorvald perk should push (pillars, updated)

| Pillar | Meaning | Change from the old table |
|---|---|---|
| **Dividend** | Solari from shares, villages and Economy buildings; the +5000 cap | Was "Treasury", which was built on the Terminal |
| **Contract** | Mercenaries: Sworn Swords, hired armies, veterans paid off, mercenary upkeep | Replaces "Iron Guard". The regular army pays Manpower again; the *mercenary* identity is the point |
| **Forge** | Plascrete, mining claims, unique buildings (not Heighforge: it orbits Ipyr and is rejected as a mechanic, 2026-11-13). Plascrete needs a use now that the trade is gone | Same name, new problem |
| **Sky** | Frigates, Airfields, Orbital Drop, Guild contracts | Unchanged |
| **Syndicate** | Operations, agents, infiltration, Renegades for hire | Unchanged |
| **Court** | CHOAM shares, the Landsraad, resolutions | Unchanged |
| **Double game** | Opposition Doctrine and Defiance: loyal in public, opposed in private | **New.** The old pool had nothing for it |

## How to read the tables

- **Basis**: **PROVEN**, a vanilla trait already uses the attribute; **UNTESTED**, the attribute is in `docs/attribute_catalog.md` but no vanilla trait uses it, or it is proven only for a different target; **UNKNOWN**, I have not found an attribute. Labels from the old pool were carried over and not all re-verified today. On 2026-11-12 I did confirm that the attribute names used below exist in the catalog (it does not say they work for a given target).
- **Slot**: the current councillor it suits (Silva Economic, Ein Military, Nobru Political, Haruka Covert; each is one passive trait with several attributes).
- A vanilla faction offers four councillors and the player picks two, so each entry should still be good in any pair.

## Triage of the old 28

Verdicts: **Keep** (reskinned in the new pool, number given), **Spare** (worth having, low priority), **Drop** (copy, redundant or built on something gone), **Built** (already in the cdb).

| # | Vanilla councillor and effect | Old Thorvald idea | Basis | Verdict | Why |
|---|---|---|---|---|---|
| 1 | Thufir Hawat: pay Solari to hasten missions and village buildings | Master of Contracts | PROVEN | **Spare** (S5) | Same as Thufir with "cheaper". Silva already has +20% build speed |
| 2 | Wellington Yueh: +Knowledge, non-mechanical units +15% Life | Foundry Metallurgist | PROVEN / UNTESTED Armor | **Drop** | Adds a fifth Armor source; Armor stacking is already an open problem |
| 3 | Lady Jessica: pay Influence to force Peace | Supply Chain Arbiter | UNKNOWN for Solari | **Drop** | The Supply Chain Holdout operation does this job; the Solari-for-Influence swap is a conversion |
| 4 | Paul Atreides: Authority per allied Sietch | Heighforge Liaison | UNKNOWN | **Drop** | The Sietch parts are Fremen-only; nothing concrete |
| 5 | Slavemaster Cron Vatia: +50 Solari per rebel killed | Bounty Clerk | PROVEN | **Rejected 2026-11-13** (E6) | Fine, but it duplicates the war-chest bonus B4 if that is chosen |
| 6 | Umman Kudu: +2 Manpower per day, 70% recruit time, +1 Armor with an operation | Quartermaster | PROVEN | **Keep, reworked** (E4) | The "Solari instead of Manpower" half died with the Iron Guard rule; the recruit-time half stays. Ein already has the Armor half |
| 7 | Feyd-Rautha: Corruption on a resolution | Blacklist Notary | PROVEN | **Keep** (N2) | Reskinned as an embargo vote |
| 8 | Piter De Vries: sacrifice an Agent for a cheaper next operation and Solari | Expendable Contractors | PROVEN | **Keep** (H3) | Good Thorvald fit: agents are contractors |
| 9 | Staban Tuek: +1 duplicate of each building limit | Citadel Foreman | PROVEN | **Spare** (S4) | A building-limit clone; kept only as a Forge idea with a Thorvald reason |
| 10 | Lingar Bewt: +Water per day, unlocks Water Network | Master of Operations | PROVEN | **Keep, reworked** (S2) | The Terminal half is gone; the Solari half becomes the Assay Office |
| 11 | Lashon Hara: income per infiltration level | Syndicate Broker | PROVEN | **Built** | Haruka's passive already has this shape |
| 12 | Stakkanov: refund half the Authority of a lost village | Contract Underwriter | PROVEN | **Spare** (H5) | Works, but it is a copy with an insurance label |
| 13 | Shimoom: Water on empty village slots | Belt Foreman | PROVEN shape, UNTESTED Plascrete | **Keep** (S3) | Mining claims on free plots; gives Plascrete a producer |
| 14 | Jamis: +10% damage outside own territory, Authority trade | Expeditionary Marshal | PROVEN / UNKNOWN trade | **Keep, trimmed** (E3) | The outside-territory half stays; the Solari-for-Authority trade is dropped |
| 15 | Mother Ramallo: Incite Rebellion on a resolution | Renegade Handler | PROVEN | **Keep** (H1) | Ties into `thorvald_renegades` |
| 16 | Stilgar: reveal Sietches, +1 Authority | Belt Surveyor | PROVEN | **Drop** | Low impact; a Fenring-type "find things" perk |
| 17 | Princess Irulan: +1 duplicate building limit | (clone) | PROVEN | **Drop** | Same effect as Staban; the built Nobru no longer needs it |
| 18 | Zum Garon: +15% Power at Peace, free Imperial Mandate | Warden of the Hegemon | UNTESTED | **Drop** the Power half; **Spare** the treaty half (N7) | Power scaling duplicates Corrino and the faction design avoids it on purpose |
| 19 | Gaius Mohiam: votes count double | Vote Broker | UNTESTED cancel / PROVEN doubling | **Keep** (N6) | |
| 20 | Hasimir Fenring: fast discoveries, +4 field agents | Survey Chief | PROVEN | **Drop** | A copy; Haruka's passive moved on |
| 21 | Sanya Ecaz: bonuses per Sanctuary | Foundry Marshal | PROVEN shape, UNKNOWN site trait | **Keep, reworked** (S6) | Stacks per Thorvald industrial building, not per Terminal |
| 22 | Rivvy Dinari: max-level units pay no upkeep, spawn a level higher | Academy Drillmaster | PROVEN | **Keep** (E1) | Reskinned as "paid-off contracts" |
| 23 | Ibbo Vipp: Landsraad Immunity, Standing per Masterpiece | Charter Lawyer | PROVEN / UNKNOWN Standing | **Keep, trimmed** (N3) | Immunity stays; Standing per build dropped |
| 24 | Mesa Ecaz: faster Masterpieces, refund on abandon | Construction Chief | PROVEN | **Drop** | Redundant with Silva's built +20% build speed |
| 25 | Bolig Avati: several main buildings at once, full refund | Citadel Architect | PROVEN / UNKNOWN in HQ | **Drop** | A building-limit clone, and the HQ-districts check is UNKNOWN |
| 26 | Bronso Vernius: cheaper adjacent annexing, Airfield range | Guild Contractor | PROVEN | **Keep** (E5) | Reskinned as landing rights |
| 27 | Cammar Pilru: Influence and Standing on entering War | War Profiteer | PROVEN | **Keep** (N1) | Best Court fit; watch overlap with B4 |
| 28 | Tessia Vernius: spy missions need one fewer infiltration level | Operations Chief | PROVEN | **Keep** (H2) | Watch overlap with Haruka's built op speed and cost |

Count: 14 kept (some trimmed or reworked), 4 spares, 8 dropped, 1 built, and #18 split (Power half dropped, treaty half kept as a spare). That is 28.

## The new pool

Each entry has the **fantasy** (why it is Thorvald), the **engine** (what vanilla proves), and **what is new** (why it is not a twin). Numbers are placeholders. Entries marked *(original)* are combinations the old pool did not have; they use proven attributes in a new place, so the *combination* is untested even where each part is proven *(inference)*.

### Silva, Economic (Dividend, Forge)

Silva already has, built: Plascrete -15% on village buildings, +20% build speed, -20% Solari building upkeep. New entries should add, not repeat.

| # | Name | Fantasy | Engine | Basis | What is new |
|---|---|---|---|---|---|
| **S1** | **Consignment Factor** *(original)* | Every CHOAM share is a consignment contract that pays out. The Economic path made concrete | `CMarket_PerShare_GiveTTrait_Stack` (each 1% of shares becomes one stack of a trait; used by the CHOAM Manipulation development) plus a trait carrying `TRes_Prod_Flat` on Solari per stack. Capped. This is proposal B3 in [faction_design.md](faction_design.md) | Both halves PROVEN; the pairing UNTESTED | No vanilla councillor pays for shares. It is the lead pick for Silva |
| **S2** | **Assay Office** | Thorvald assayers grade everything sold through its villages: each Economy village building pays a little Solari and Plascrete | `TRes_ProdPerTDomain2Building_Flat` (the vanilla trait `Merchants` gives +3 Solari per Economy building; the catalog entry already carries a Thorvald idea of +5 Plascrete) | PROVEN for Solari; Plascrete target UNTESTED | Replaces the dead "Master of Operations". Gives Plascrete a producer and a reason to build Economy buildings |
| **S3** | **Slag Rights** | A mining claim on every free plot: villages yield Plascrete from empty slots | `Outpost_TResProd_PerEmptySlot_Flat` (Fremen Shimoom shape, Water) | PROVEN shape; Plascrete UNTESTED | Water becomes the asteroid-mining heritage. Pairs with S2 |
| **S4** | **Second Foundry** | A charter for a second Alloy Smelter or Ore Drill | `Faction_DuplicateEachBuildingLimit_Flat` | PROVEN | Spare only: it is Staban's effect. Worth it only if the unique buildings get built |
| **S5** | **Rush Order** | Money buys time: pay Solari to hasten a building or an operation | `Unlock_TAbility` for `HastenBuilding`, `HastenMission` | PROVEN | Spare: Thufir's effect. Overlaps Silva's +20% build speed |
| **S6** | **Works Overseer** | A stack of bonuses for each Thorvald industrial site (Alloy Smelter, Ore Drill) | `Faction_SetTTraitStacks_PerAnyVillageWithTTrait2` (Ecaz Sanya shape) | PROVEN shape; the Thorvald site trait is UNKNOWN | Needs the unique buildings to exist first. The Terminal rows remain as a plain building, which could count as a site *(inference)* |

### Ein, Military (Contract, Sky)

Ein already has, built: army Solari upkeep -10%, units start one level higher, +1 Armor in a region with a Thorvald operation. **Add nothing that adds Armor.** The mercenary identity now lives here, since the regular army pays Manpower again.

| # | Name | Fantasy | Engine | Basis | What is new |
|---|---|---|---|---|---|
| **E1** | **Paid-Off Contracts** | A veteran's contract is paid in full; he serves for the pension and costs nothing to keep | `Army_MaxLevel_GainTTrait` (Rivvy Dinari: max-level units pay no Solari upkeep) | PROVEN | Reskin of Rivvy. With the built "start one level higher", units reach max level fast and the saving arrives early. The lead pick for Ein |
| **E2** | **Retainer Levy** *(original)* | Contractors on retainer turn up unasked | `Faction_DailySpawn_TUnit_Flat` (used once in vanilla: the Harkonnen bonus 9, an Assassin) with a Sworn Sword | Shape PROVEN; the unit, the cap and the interval are UNTESTED | The same job as bonus B6. Pick **one** of B6 and E2, not both. The shared Sworn Sword cap of 5 limits it |
| **E3** | **Away Contract** | Contracts are fulfilled abroad: hired armies hit 10% harder outside Thorvald land | `Army_OutsideTerritory_GainTTrait` (Fremen Jamis) | PROVEN | Trimmed from the old *Expeditionary Marshal* (the Solari-to-Authority trade is gone). Fits a house that fights on someone else's soil |
| **E4** | **Express Freight** | Recruits ride down from orbit: units are recruited in 70% of the time | `Unit_ImportTime_MRatio` (Umman Kudu) | PROVEN | The old *Quartermaster* without the "no Manpower" half, which died with the Iron Guard rule |
| **E5** | **Landing Rights** | The Guild lets Thorvald frigates and Airfields reach farther; adjacent villages annex cheaper | `Faction_Outpost_Cost_SingleAdjacentRegion_MRatio`, `Airfield_Range_ARatio`, `Army_Airfield_Range_Flat` (Bronso Vernius) | PROVEN | Ties to the frigate's Orbital Drop (a later stage). Sky pillar |
| **E6** | ~~**Bounty Clerk**~~ **REJECTED 2026-11-13** (no Solari from deaths) | A bounty on every rebel and raider | `Entity_KillRebelsLoot_TRes_Flat` (+50 Solari per rebel) | PROVEN | Spare; same as B4's third line. If the war chest is chosen as a faction bonus, skip this |

### Nobru, Political (Court, Double game)

Nobru already has, built: 20 free votes on each resolution, share price -15% (the design removes the discount).

| # | Name | Fantasy | Engine | Basis | What is new |
|---|---|---|---|---|---|
| **N1** | **War Profiteer** | A mercenary house earns from every conflict | `Faction_TResGain_OnWar_Flat`, `Faction_TResGain_OnOpponentWar_Flat` (Cammar Pilru) | PROVEN | Best Court fit. Overlaps bonus B4 (war chest): choose one home for it |
| **N2** | **Blacklist Notary** | The Alloy Embargo as a vote: pay to cost an enemy Standing | `Unlock_TResAction` (Corruption, 9 uses) | PROVEN | A Thorvald-flavoured Corruption. Pairs with Opposition Doctrine (the front-runner is the target) |
| **N3** | **Charter Lawyer** | Immunity from the resolutions the house means to ignore: loyal in public, exempt in private | `Unlock_TResAction` for `LandsraadImmunity` (Ibbo Vipp) | PROVEN | The double game expressed as a Landsraad perk. Trimmed: the Standing-per-build half is dropped |
| **N4** | **Double Ledger** *(original)* | Two sets of books: hostile acts cost half the Standing, so the Crown is opposed without the Landsraad noticing | `Res_Standing_HostileActionLoss_MRatio` at 0.5 (the catalog already carries this as a Thorvald idea for the Political councillor) | **UNTESTED** (0 vanilla uses; exists in the catalog) | The only entry that directly expresses "loyal in public, opposed in private". Cheap to try, so test it first |
| **N5** | **Share Broker** *(original)* | Votes follow shares: the more CHOAM the house holds, the more Influence it earns | `CMarket_PerShare_GiveTTrait_Stack` with a trait carrying `TRes_Prod_Flat` on Influence; `Resolution_Win_Gain_TRes` for "his vote passed" | Parts PROVEN; the pairing UNTESTED | The Political twin of Silva's S1 (the same trick, another currency). This is already Nobru's designed target. Cap it separately from S1 |
| **N6** | **Vote Broker** | Pay Solari to cancel a negative resolution; votes on resolutions the house cares about count double | `TResAction_VoteValue_ARatio` (PROVEN); `Allow_CancelNegativeResolution` (0 uses) | Doubling PROVEN, cancel UNTESTED | Mohiam, with a Solari price tag. A good use of Solari now that the trade is gone |
| **N7** | **Foundry Patronage** *(original)* | Thorvald's heavy industry on Arrakis buys the house standing at court | `TRes_Prod_Flat` with Standing or Hegemony as the target on Plascrete-upkeep buildings (noted in the old four-archetype work; not re-verified) | UNTESTED | Gives Plascrete and the unique buildings a Political use, so the Forge feeds the Court. Also covers the spare *Trade Charter* (cheaper treaties, `TTreaty_Cost_MRatio` PROVEN) |

### Haruka, Covert (Syndicate)

Haruka already has, built: +1 Influence and +1 Intel per infiltration level, operations 25% faster and 15% cheaper. The income is possibly too big already, so new entries should be cheap or conditional.

| # | Name | Fantasy | Engine | Basis | What is new |
|---|---|---|---|---|---|
| **H1** | **Renegade Handler** | "Hire the rebels": an Incite action themed as Renegades for hire | `Unlock_TResAction` for Incite (Mother Ramallo) | PROVEN | Ties to the Renegade drops already in `thorvald_renegades`. The Thorvald harvester unit id still needs a look for the Intel half |
| **H2** | **Operations Chief** | Thorvald operations unlock one infiltration level earlier | `Mission_Infiltration_RequiredLevelReduction_Flat` (Tessia Vernius) | PROVEN | Strong with her built speed and cost. If both stay, check the total in a test game |
| **H3** | **Expendable Contractors** | Agents are hired hands: sacrificing one pays Solari and cheapens the next operation | `Agt_SacrificeUsed_DecreaseOperationCost_MRatio`, `Faction_GainTRes_OnAgtSacrifice_PerTRes2` (Piter De Vries) | PROVEN | The mercenary idea applied to spies |
| **H4** | **Quiet Ledger** | The house sells to everyone, so contacts keep: infiltration decays 50% slower | `Infiltration_InFaction_DecreaseSpeed_MRatio` | PROVEN | A small add to her built income, lower risk than adding more per-level pay |
| **H5** | **Contract Underwriter** | Insurance on outposts: a lost village refunds half its Authority | `VillageLost_RefundAuthorityCaptureCost_ARatio` | PROVEN | Spare; Stakkanov with an insurance label |
| **H6** | **Defiance Fuel** | Thorvald operations that go unnoticed feed the hidden meter | Needs Defiance, which is not built | UNKNOWN | The designed target already in [counsellors.md](counsellors.md); parked until Defiance exists |

## Suggested picks per slot (ideas, not a decision)

The old picks are replaced. "Lead" is the strongest fit and the safest to build; the others are alternatives.

| Slot | Lead | Then | Why |
|---|---|---|---|
| **Silva** (Dividend, Forge) | S1 Consignment Factor | S2 Assay Office, S3 Slag Rights | S1 makes her the CHOAM pick and needs a test of the shares trick; S2 and S3 give Plascrete a job, and are the data-safe fallback if S1 does not work |
| **Ein** (Contract, Sky) | E1 Paid-Off Contracts | E3 Away Contract, E4 Express Freight, E2 or B6 (one) | The mercenary identity, with proven attributes only |
| **Nobru** (Court, Double game) | N4 Double Ledger | N1 War Profiteer, N6 Vote Broker, N5 Share Broker | N4 is the only perk that says "double game"; it is also the cheapest test. N1 and N5 are the safe fallbacks |
| **Haruka** (Syndicate) | H1 Renegade Handler | H3 Expendable Contractors, H4 Quiet Ledger | Ties into the Renegade work; do not add more income on top of her built per-level pay |

Pair check (designed, untested): Silva+Nobru both scale from shares (S1 and N5 use the same trick), so cap each on its own. Ein+Haruka are both Contract and Syndicate, so mercenaries and cheap operations can overlap.

## Where to test first

Four entries use a combination or attribute with no vanilla precedent for the target. If the first test game has room for four checks, these are the ones that decide the pool:

1. **S1 / N5:** a trait that grows with shares, paying Solari or Influence per stack.
2. **N4:** the halved Standing loss, with 0 vanilla uses.
3. **S2 / S3:** a Plascrete target on the Merchants shape and on the empty-slot shape.
4. **N7:** a Standing or Hegemony target on a building's production.

## Cautions

- **Passives only, for now.** Each vanilla councillor row has one `passiveTrait`; no active-ability slot has been found, so every entry above is a passive. A passive may hold several attributes (the built ones hold three).
- **Overlap to avoid.** Several entries do the same thing: S4 with any building-limit idea; S5 with Silva's build speed; E2 with bonus B6; E6 and N1 with bonus B4 (the war chest). Pick one home for each effect.
- **No conversion mechanics.** The Terminal's trade failed; do not reach for another click-to-trade. Dividends and discounts are the safe shape.
- **Armor.** Ein already adds Armor in an operation region. Armor now has four other sources (see [faction_design.md](faction_design.md)); nothing here adds a fifth.
- **Check before building.** Any UNTESTED or UNKNOWN item needs a test or an attribute search first, and nothing here should be built before a first test game ([counsellors.md](counsellors.md), next steps).
- **Names are working names.** The roster uses working names for Ein and others; the owner will supply the final military name (see [name_candidates.md](name_candidates.md)).

## Open questions for the owner

1. Which entry from each slot's "lead" and "then" list should move into [counsellors.md](counsellors.md) as the designed target? (Nothing is built from this page.)
2. Is a doubled-up path acceptable, where Silva and Nobru both scale from shares (S1 and N5), or should one of them use a different engine?
3. Do you want the mercenary idea to stay inside Ein, or should one entry (E2 or the Sworn Sword spawn B6) live in the faction bonuses instead?
