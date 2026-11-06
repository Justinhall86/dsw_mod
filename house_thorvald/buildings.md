# Buildings — House Thorvald

Unique Thorvald buildings. The 3D models exist (`model_projects/thorvald_buildings`, see its `SPEC.md`); effects, costs and unlocks
are **PROPOSED** and nothing is in `data.cdb` yet. Every vanilla house has a few faction-only village buildings (Corrino's Propaganda
Office, the Smugglers' Water Network, Ecaz's Masterpieces); these are Thorvald's.

| Building | Pillar | Proposed role | Look |
|---|---|---|---|
| **Consignment Terminal** | Treasury | Where Heighforge's alloy is consigned and sold on Arrakis: turns Spice and Plascrete into Solari, +Solari cap (the faction screen's "Sovereign Mint" bonus). A building, not a mint | Domed hub with landing ramps and cargo |
| **Alloy Smelter** | Forge | Plascrete production; feeds the Terminal | Twin copper crucible hoppers |
| **Ore Drill** | Forge | Mining: Plascrete on rich ground (the asteroid-mining heritage, the Hammer of Wealth's +15%) | Sealed drill rig, no outlets |
| **War Academy Annex** | Iron Guard | Ein's building: units recruited nearby join one level higher, or recruit faster | Command tower with a copper crown |
| **Contract Hall** | Iron Guard | Where the house signs its mercenaries: cheaper Solari recruitment and upkeep in the region | Low walled compound, oxblood panels |

Lore: Heighforge itself is a moon-sized exotic-metals factory in orbit ([lore.md](lore.md)); these buildings are its ground side.
Councillor tie-ins are in [councillor_ideas.md](councillor_ideas.md) (Master of Operations unlocks the Terminal; Construction Chief
speeds them up).

## Headquarters: the Thorvald Citadel

A kitbash of the Conquest Outpost after the user's mock-up (keep, ring, stacked forge tower, bunkers), with the Contract Hall
model now free for other use. The base grows as districts are built (each district slot shows one more bunker, the foundry
chimneys, then a crown on the keep), and shuttles land on its pad and hangar deck on a 117 s loop. Model, animation and prefab
draft: `model_projects/thorvald/thorvald_hq` (see its SPEC.md). Not installed.

## Open
- Effects and numbers: choose from the attribute catalog ([../docs/attribute_catalog.md](../docs/attribute_catalog.md)).
- Unlock route: a Thorvald faction trait or development with `Unlock_TBuilding_Authorize`.
- The house emblem on the panels (see `todo.md`).
