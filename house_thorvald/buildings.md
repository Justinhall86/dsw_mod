# Unique buildings — House Thorvald

Suggestions only; nothing here is in `data.cdb` yet. Every number is **PROPOSED**. Faction bonuses are in [faction_design.md](faction_design.md),
the people who would run these buildings in [counsellors.md](counsellors.md).

## How vanilla does it (read from `mod_files/data.cdb`)
- A faction-only building is a normal `building` row with `props.onlyForFactions`. Ginaz's `GinazFremenEmbassy` is a copy of the Atreides one that points
  at the same prefab, so a **new building is cheap in data and free in art** if it reuses a vanilla model.
- Vanilla factions each get one or two **Main Base** buildings (`Main_*`) and a few village buildings: Corrino has the Emperor Monument and the Propaganda Office,
  Harkonnen the Interrogation Center and the Office of Order, Smugglers the Black Market Branch and the Trafficking Station, Vernius the Neural Core and the Neural Node.
- Buildings sit in a domain (Economy, Military, Statecraft). A big one is `isWonder` with `factionLimit` 1.
- **Vanilla already has an `ExperimentalAlloyFurnace`** (Economy, wonder, limit 1, "regular mineral can be turned into exotic and valuable alloys"). That is almost
  the Heighforge brief already.

## The list

| # | Building | Where | Domain | What it does | Starts from (vanilla) | Ties to |
|---|---|---|---|---|---|---|
| 1 | **Heighforge** | Main Base, limit 1 | Economy (wonder) | The perk building. Converts Spice and Plascrete into Solari, raises the Solari cap by +5000. A huge exotic-metals works with a burnt-orange glow. | `ExperimentalAlloyFurnace` | The Heighforge Monopoly; Master Silva runs it |
| 2 | **Contract Hall** | Main Base | Military | Where the house hires its soldiers. Lets you buy a finished squad for a one-off Solari fee, with no training time, on top of the house's zero-Manpower units. | `Main_RecruitCenter` | The Iron Guard; Hammer of Wealth (-30% mercenary upkeep) |
| 3 | **Syndicate Exchange** | Main Base | Statecraft | A trading floor. Turns CHOAM shares into Influence and softens the -20% CHOAM standing the monopoly costs. | `Main_ChoamBranch` | Adjutant Nobru; Market Manipulation |
| 4 | **Ledger Office** | Main Base | Statecraft | The spymaster's counting house. Trains agents, cuts Operation cost and preparation time, and is where **Supply Chain Holdout** is run from. | `Main_IntelAgency` | Lady Haruka; Political Asylum |
| 5 | **Sub-Contract Depot** | Village | Military | An airfield variant. Buys Fuel Cells with Solari, and links owned airfields so troops arrive instantly. | `Airfield` + `FuelCellFactory` | Guild Sub-Contract (5000 Hegemony) |
| 6 | **Deep Mine Works** | Village | Economy | A mining works for a rock-saw head and a claw arm. More Plascrete, a bigger bonus with the Hammer of Wealth (+15%). | `PlascreteFactory` | Hammer of Wealth; the tracked claw vehicle concept |
| 7 | **Asylum Quarter** | Village | Statecraft | A walled camp for refugees and deserters. Pays +Manpower and +Intel when units die or villages are pillaged nearby, and stacks with the perk. | `Main_Barracks` or `BackAlleyDoctor` | Political Asylum |

Optional eighth: a **Gearworks Spire** (a monument, limit 1, Statecraft) carrying the emblem, in the way Corrino has the Emperor Monument. Only worth it
if Hegemony needs something to look at.

## Recommended order
1. **Heighforge**: the faction bonus needs it, and a vanilla prefab already exists. Recolour it burnt orange and dark gunmetal; add chimney stacks later.
2. **Contract Hall**, then **Syndicate Exchange**: both reuse existing Main Base prefabs, and between them they express "the house that buys its wars".
3. **Deep Mine Works** and **Sub-Contract Depot**: they put the two Hegemony bonuses on the map.
4. **Ledger Office** and **Asylum Quarter** last: they depend on the operations and the Political Asylum numbers, which do not exist yet.

## What would need new work
- **Art:** reusing vanilla prefabs costs nothing but looks like the vanilla building. A Thorvald recolour (dark gunmetal, rust, burnt-orange glow) is a texture job,
  the same method as the vehicles. A new silhouette is a Blender kitbash. **The building prefabs and textures are inside the game's pak, not in this repo**, so any
  recolour first needs them copied into `model_inputs/`.
- **Data:** a `building` row each, texts, a thumbnail (`UI/structures/*.png`, 592 x 168), and the effect traits. Check each effect against real attribute names
  (see `house_ginaz/mechanics/vanilla_scan/catalog_traits.md`) before promising it.
- **Balance:** Heighforge plus the Solari cap plus Hammer of Wealth is already a very strong economy ([faction_design.md](faction_design.md)).

## Open decisions
- Does Heighforge need its own cost and build time, or does it start already built in the Main Base?
- Is the Contract Hall's instant squad a Hegemony reward or part of the base house?
- How many of these are Main Base (one per base) and how many village buildings?
