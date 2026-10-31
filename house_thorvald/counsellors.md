# Councillors — House Thorvald

Four councillors with two abilities each, taken from the Codex screen
([images/codex_councillor_abilities.jpg](images/codex_councillor_abilities.jpg)). Portraits and looks are in
[images/councillors_banner_portraits.jpg](images/councillors_banner_portraits.jpg) and
[images/councillors_three_quarter.jpg](images/councillors_three_quarter.jpg). Separate from House Ginaz — nothing for this house
belongs in `house_ginaz/`. Numbers are as shown on the concept screen and are **PROPOSED**.

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

## Superseded drafts (kept for reference)
The first draft councillors, replaced by the roster above. Where an idea lives on:

| Draft | Role | Ability | Where it went |
|---|---|---|---|
| Jakob | Spacing Guild liaison | -20% Spacing Guild requirements | Guild Sub-Contract (5000 Hegemony bonus) |
| Siora | Spy expert | auto-sends Landsraad Guards to low-standing factions | Lady Haruka (spymaster) |
| Herbert | General | handgun ability, health, armor, attack speed; faster recruitment | Overseer Jool (military); the stacked bonuses were already flagged for balancing |
| Nier | Diplomatic | Landsraad-style vote; Guards appear at 3 voting factions' cities if it goes against the house | Adjutant Nobru (Landsraad Patronage) |
