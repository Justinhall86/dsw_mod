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

## How the four fit together
Jool is the war councillor. Silva, Haruka and Nobru are the economy, the shadow and the money-and-politics side, which suits an
industrial syndicate more than a warrior house. Haruka and Nobru both work CHOAM from the inside, which pays off the faction
bonus that lowers CHOAM standing ([faction_design.md](faction_design.md)).

## Open decisions
- **Name clash:** House Ginaz already has a **Commander Jool** (`house_ginaz/leaders_and_councilors.md`). Rename one.
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
