# Councillors — House Thorvald

Four councillors with two abilities each, taken from the Codex screen
([images/codex_councillor_abilities.jpg](images/codex_councillor_abilities.jpg)). Portraits and looks are in
[images/councillors_banner_portraits.jpg](images/councillors_banner_portraits.jpg) and
[images/councillors_three_quarter.jpg](images/councillors_three_quarter.jpg). Separate from House Ginaz — nothing for this house
belongs in `house_ginaz/`. Numbers are as shown on the concept screen and are **PROPOSED**.

> **Status 2026-11-02:** in `data.cdb` the military slot is now **Envoy Theodoric Ein** (id `ThEin`), replacing Overseer Jool. His
> effect is still Jool's copied Corrino one. The Jool section below is kept as a source of perks. A pool of alternative perks, one
> Thorvald version per vanilla councillor, is in [councillor_ideas.md](councillor_ideas.md) (**ideas only**).

> **Status 2026-11-03 (BUILT in `data.cdb`):** all four councillors have their own perks and portraits. Each one is a single passive
> trait made only of attributes that vanilla traits already use, so nothing here needs a patch. Built by
> `model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py` (`--revert` restores the old rows). The **Active**
> perks in the sections below (Sabotage Network, Market Manipulation, Hammer Brief) are **not** built: a councillor has one passive
> trait slot and no active slot was found.
>
> | Councillor (portrait source) | Perk | In the game |
> |---|---|---|
> | Adjutant Nobru (banner bust) | Market Patronage | first 20 votes on each Landsraad resolution are free (`FreeVotes_Resolution_Flat`, Ecaz); CHOAM shares cost -15% (`CMarket_Share_BuyPrice_MRatio`) |
> | Envoy Ein (`council_male_military_cape.jpg`) | Academy Doctrine | military Solari upkeep -10% (`Army_TResUpkeep_MRatio`); units start one level higher (`Army_SpawnExperienceLevel_Flat`); +1 Armor in a region with an active Thorvald operation (`FactionArmy_InZoneWithOperation_Armor_Flat`) |
> | Master Silva (banner bust) | Supply Line Optimization | village buildings -15% Plascrete, built 20% faster, -20% Solari upkeep (`Building_Village_TResCost_MRatio`, `Building_ConstructionSpeed_ARatio`, `Building_TRes_Upkeep_MRatio`) |
> | Lady Haruka (banner bust) | Corporate Espionage | +1 Influence and +1 Intel per infiltration level held in another faction (`TRes_ProdPerInfiltrationLevels_Flat`, IntelBroker's shape); operations prepare 25% faster and cost 15% less (`Mission_PreparationTime_MRatio`, `Mission_Cost_MRatio`) |
>
> Silva is now `gender 0` (the banner portrait is a man; it was set female by the Mohiam clone). Nobru's AI domain is Statecraft and
> Silva's Economy, to match the perks. Portraits sit in **new** atlases (`UI/Faction/councillors_thorvald.png`,
> `UI/Faction/Menu/menuCouncilorsThorvald.png`, `UI/Faction/Menu/councillorsThorvald.png`), so no vanilla atlas is overridden.
> The seven unused concept images became the Thorvald **agent** portraits (`Th1`..`Th7`, `UI/spying/agents/agents_thorvald*.png`);
> Thorvald no longer draws Corrino's agents. Jool's banner bust is one of them. Karlin (hero) keeps his old portrait cell.

## Overseer Jool
- **Role:** military overseer (general type).
- **Look:** grey-streaked hair and beard, a scar on the brow, dark plate with crossed rust-leather straps, a gold-lined stand-up collar.
- **Conscription Buffer (Passive):** forces fighting in or adjacent to House Thorvald territory gain +10% Power and +2 Armor.
- **Heavy Annexation (Passive):** -20% Authority cost to annex a village if it was recently pillaged or fought over.

## Master Silva
- **Role:** infrastructure and logistics master.
- **Look:** short curly hair, copper pauldron, quilted brown leather jerkin, dark high-collared undershirt.
- **Supply Line Optimization (Passive):** non-military village buildings cost -15% Plascrete and are constructed 20% faster.
- **Asset Preservation (Passive):** all non-military infrastructure (like Harvesters and processing plants) has -20% Solari and Fuel Cell upkeep.

## Lady Haruka
- **Role:** spymaster.
- **Look:** braided hair, a scar on the cheek, a hooded cloak with rust trim over dark layered armour and crossed rust straps.
- **Corporate Espionage (Passive):** assigning agents to Arrakis or CHOAM generates +1 Intel and +1 Influence per day, double in neutral territory.
- **Sabotage Network (Active):** -25% preparation time for all Operations, and -15% their Intel/Solari cost.

## Adjutant Nobru
- **Role:** political and market manipulator.
- **Look:** dark swept hair, a trimmed beard, a long black coat with gold-trimmed shoulders over a rust tunic, a holstered pistol at the hip.
- **Landsraad Patronage (Passive):** +10 Landsraad Standing and +5 Influence when any Resolution he voted on passes.
- **Market Manipulation (Active):** buying CHOAM shares costs -15% less Solari, and +5 Influence for every 10% owned.
- The top-bar Plascrete trade was briefly Nobru's; it now comes from the **Consignment Terminal** building (see `model_projects/thorvald_faction/SPEC.md`). Nobru's passive is back to the Corrino clone's.

## Envoy Theodoric Ein (proposed fifth, or Jool's replacement)
- **Source:** the one named Thorvald character in Dune: Awakening ([lore.md](lore.md)). There he is the house's envoy on Arrakis, a War
  Academy graduate with distinction, stationed in the Hagga Basin beside the Wreck of the Kytheria. He talks about the motto, the size
  of Heighforge and how Thorvald alloys build spacecraft.
- **Role:** field envoy and war-council officer. He sits between Jool (soldier) and Nobru (politician): the Academy-trained officer who
  speaks for the house on the ground and turns its wealth into combat results.
- **Slot:** each faction has four councillors, so he needs a slot. Recommended: **he replaces Overseer Jool**. That clears the Jool name
  clash with Ginaz and gives the house the one canon-named councillor. Jool's Conscription Buffer can be folded into Ein's kit (below).
  If the user prefers to keep all four, Ein becomes a hero instead ([heroes.md](heroes.md)).
- **Look (spec):** see "Appearance" below.

| Perk | Type | Proposed effect |
|---|---|---|
| **Academy Doctrine** | Passive | Military units cost **-10% Solari upkeep**. Iron Guard troops are paid in Solari, so this is the Academy's lesson that an army is a budget. |
| **War Council Envoy** | Passive | When Thorvald wins a battle against a faction it is at war with: **+5 Landsraad Standing and +3 Influence**. Thorvald sits in the War Council bloc, the combat-focused group, in Awakening. |
| **Hammer Brief** | Active | Briefs the army in one region: units there gain **+15% Power and +2 Armor** for 60 s. Solari cost + cooldown TBD. A short, paid version of Jool's Conscription Buffer. |

**Signature perks (what only he brings):**
1. **Academy Graduates.** The operation *War Academy Liaison* ([operations.md](operations.md), adapted from Ecaz's Epic Quest) costs
   -25% Intel while Ein is on the council. He is the officer it sends.
2. **Cadet network.** While he sits on the council, Thorvald gets one extra **free Intel agent slot**, because War Academy graduates
   are posted in other Houses' armies. (Exact slot field not found yet.)
3. **Hagga Basin hook.** Optional flavour: the Wreck of the Kytheria appears as a Thorvald landmark near their territory, and Ein's
   loading-screen tip quotes the motto. Costs nothing.

**Open:** numbers are guesses; no unlock level or cost shown for councillor abilities; perk 2 needs a vanilla attribute that adds an
agent slot, which I have not searched for.

### Appearance (spec)
Ein is the only councillor with the lore's own picture: a **graduate of the War Academy, posted to Arrakis**. He should read as the
Academy's showpiece officer and sit apart from the other four on the banner.
- **Face visible.** No mask or kasa. He is an envoy and the public face of the house. The soldiers' mask stays a mercenary uniform.
- **Silhouette:** upright officer's frock coat, knee length, dark charcoal, with the **industrial orange** trim from the Awakening
  swatch on cuffs, collar and hem. Stand-up collar like Jool and Nobru, so he belongs in the cast.
- **Under it:** a dark stillsuit torso with orange piping (he lives on Arrakis), tucked into tall black boots like the infantry.
- **Insignia:** the gear-and-star emblem as a small copper pin on the left chest, and a second small **Academy pin** (a hammer over a
  book, ours) on the collar. No large print ([art_direction.md](art_direction.md)).
- **Props:** a holstered sidearm at the hip and a rolled data-slate or a short baton in one hand. **No cane** (that is Memnon's) and no
  pistol-forward pose (that is Nobru's).
- **Age and bearing:** mid-30s to 40s, short cropped dark hair, clean-shaven or a short beard, composed and precise. The scar on Jool
  belongs to Jool, so Ein has none.
- **Palette:** gunmetal `#23201C` coat, rust-brown `#48241A` under-layer, orange trim as the one hot accent, copper pin.
- **Deliverables:** one banner portrait (same framing as the other four in `councillors_banner_portraits.jpg`) and one three-quarter
  figure. Councillors have no in-game 3D model, so nothing needs rigging. Concept art must be new; none of the supplied images shows him.
- **If a 3D model is wanted later:** kitbash from game parts only (Commando or Duncan body, Idualis head, Thorvald orange recolour),
  using the `dsw-part-kitbash` skill, not hand-modelled.

## Alternative set from the design notes (2026-11-01)

The design notes give a different four archetypes: a **Trade** councillor (Spacing Guild), a **Military** councillor (called
"Melody" in the notes, a placeholder), an **Infiltration** councillor (ex-Fremen stealth) and a **Political** councillor (Memnon's
anti-Imperial line). They overlap the current roster, so the choice is open ([Open decisions](#open-decisions)). Each mechanic is
checked against the vanilla data (`mod_files/data_vanilla_2026-10-28.cdb`) with a status:
**BUILDABLE** = a vanilla attribute does it; **APPROX** = a vanilla attribute does a close version; **NOT FOUND** = no vanilla
attribute, so it needs the patch or another design. "Used" = how many vanilla traits use the attribute ([attribute catalog](../docs/attribute_catalog.md)).

### 1. Trade councillor (Spacing Guild)
| Mechanic | Status | Vanilla basis |
|---|---|---|
| Passive Influence from off-world standing | BUILDABLE | `TRes_Prod_Flat` on `Influence` (the vanilla `Standing_High` trait does this; used 116) |
| Reduced Spacing Guild costs and faster transport | APPROX | `Shuttle_MoveSpeed_ARatio` ("Shuttles are N% faster", used 0, test it); `Unlock_GuildQuests` unlocks Spacing Guild events (used 0). No vanilla Guild cost attribute was found |
| Guild Favor converted into resources | NOT FOUND | `GuildFavor` is a resource (54 references), but no vanilla attribute converts it. The "resource trades" feature of Quinn's patch does ([patch notes](../docs/reference_cdb_attributes_traits.md)) |
| Trade Plascrete/alloy to the Guild for Influence or Solari | NOT FOUND | As above; `FactionTrade` is a pad action, not a conversion |

### 2. Military councillor ("Melody" in the notes)
| Mechanic | Status | Vanilla basis |
|---|---|---|
| Last Stand for Honor: +Armor, +attack speed, +Power while engaged in melee | BUILDABLE | `Unit_EngagedInMelee_GainTTrait` (gives a trait while in melee); `Entity_Armor_Flat`, `Entity_AttackSpeed_MRatio`, `Entity_Power_ARatio` |
| "Cannot retreat until the fight ends" | NOT FOUND | No retreat or disengage attribute found. Approximate with a big Armor bonus so the fight is worth staying in |
| Phalanx blocks firearm/ranged damage, forcing melee | APPROX | `Entity_DamageReceived_FromRanged_MRatio` (the Fremen `F_Sneak_Trait` uses 0.7 this way, used 2); a real block is `Unit_RangedAttacks_Block` ("Cannot use ranged attacks") given to enemies in range with `Entity_GiveTTrait_UnitAtWar_AtTRange2`. Test that the aura reaches enemies |

### 3. Infiltration councillor (ex-Fremen stealth)
| Mechanic | Status | Vanilla basis |
|---|---|---|
| Passive stealth out of combat, so forces can move undetected | BUILDABLE | `Unit_Cloaked` ("cannot be seen outside of combat") with `Army_ImmobileCamouflagedNoCombat_GainTTrait` for the static case; the Fremen `F_Sneak_Trait` is the precedent |
| Ex-Fremen flavour | lore question | Fremen is another house. Ask whether Thorvald can take a Fremen-trained agent (see [lore.md](lore.md)) |

### 4. Political councillor (Memnon's anti-Imperial line)
| Mechanic | Status | Vanilla basis |
|---|---|---|
| Immunity to harsh Imperial edicts | APPROX | `LandsraadImmunity` is a vanilla resolution action ("get immunity to this resolution", 2 rows). Use it on the resolutions Thorvald wants to ignore. Reducing Standing losses: `Res_Standing_HostileActionLoss_MRatio` (0.5 = half the loss; **used 0**, test it) |
| Voting in line with Memnon's agenda grants Hegemony, Influence or Solari | APPROX | `Resolution_Win_Gain_TRes` (gain on a passed vote; Nobru's example) and `Resolution_Positive_GainTTrait`. "In line with Memnon" has no vanilla test, so count only positive resolutions |
| Plascrete-consuming buildings generate Standing or Hegemony | APPROX | `TRes_Prod_Flat` with target `Standing` or `Hegemony` on a building whose upkeep is Plascrete (`TRes_Upkeep_*`). A true conversion of Plascrete into Standing has no vanilla attribute |

### How the two sets compare
| Role | Current roster | Notes set | Recommendation |
|---|---|---|---|
| Military | Overseer Jool | "Melody" (Last Stand, phalanx) | Give Jool the Last Stand and phalanx ideas. Both are buildable or close |
| Economy | Master Silva | (none) | Keep |
| Spy / infiltration | Lady Haruka | ex-Fremen stealth | Give Haruka the stealth passive. It is a spy skill and uses vanilla attributes |
| Politics | Adjutant Nobru | Memnon's anti-Imperial line | Give Nobru the edict immunity and Memnon voting bonus |
| Trade / Guild | Envoy Ein (proposed, or a hero) | Spacing Guild trade | Give Ein the Guild trade. He is the War Academy envoy who handles the Guild contracts |

So all four notes fit inside the current roster, without a fifth councillor. The one thing lost is the separate "Melody" name. If the
user prefers the notes' four, that is a straight swap; the mechanic table above still applies.

## Lore hooks (ours, built on [lore.md](lore.md))
Canon names none of the four, so these backstories are our own. Each ties to a canon place or event.

| Councillor | Hook |
|---|---|
| Overseer Jool | Senior instructor at the War Academy on Ipyr. Teaches that a front line is a supply line with soldiers on it. |
| Master Silva | Master of works on Heighforge; ran the smelting decks before coming down to Arrakis. Explains the copper pauldron and the foundry leathers. |
| Lady Haruka | Kept Lady Firenza's household on Kaitain. After Firenza's death she turned what she learned at court into a spy network against the Crown. |
| Adjutant Nobru | Memnon's man on the Landsraad floor and in the War Council bloc; trades alloy contracts for votes. |

## How the four fit together
Jool is the war councillor. Silva, Haruka and Nobru are the economy, the shadow and the money-and-politics side, which suits an
industrial syndicate more than a warrior house. Haruka and Nobru both work CHOAM from the inside, which pays off the faction
bonus that lowers CHOAM standing ([faction_design.md](faction_design.md)). Haruka's Sabotage Network also makes the house a strong
operations faction, which the Thorvald operations in [operations.md](operations.md) are built to use.

The War Academy on Ipyr teaches logistics and commerce next to tactics, which is why a house of this kind has a logistics master and a
market operator on its council and only one soldier.

## Open decisions
- **Name clash:** House Ginaz already has a **Commander Jool** (`house_ginaz/leaders_and_councilors.md`). Rename one. The lore offers
  **Theodoric Ein** (the house's War Academy-trained envoy in Dune: Awakening) as a ready-made name for the military councillor.
- Balance: Nobru's Market Manipulation (-15% Solari, +5 Influence per 10% owned) can scale fast; Silva's -20% upkeep applies to a lot
  of buildings.
- Portraits are concept art only. There are no models for these, so any in-game portrait would need new art.
- The concept screen shows two abilities each, with no unlock levels or costs.
- **Councillor set:** keep the current four plus Ein, or switch to the notes' four archetypes (see the section above). Recommended: keep
  the current roster and fold the notes' ideas into it, as the table in that section shows.

## Superseded drafts (kept for reference)
The first draft councillors, replaced by the roster above. Where an idea lives on:

| Draft | Role | Ability | Where it went |
|---|---|---|---|
| Jakob | Spacing Guild liaison | -20% Spacing Guild requirements | Guild Sub-Contract (5000 Hegemony bonus) |
| Siora | Spy expert | auto-sends Landsraad Guards to low-standing factions | Lady Haruka (spymaster) |
| Herbert | General | handgun ability, health, armor, attack speed; faster recruitment | Overseer Jool (military); the stacked bonuses were already flagged for balancing |
| Nier | Diplomatic | Landsraad-style vote; Guards appear at 3 voting factions' cities if it goes against the house | Adjutant Nobru (Landsraad Patronage) |
