# Buildings — House Thorvald

Unique Thorvald buildings. The 3D models exist (`model_projects/thorvald_buildings`, see its `SPEC.md`); effects, costs and unlocks
are **PROPOSED**. Only the Consignment Terminal has rows in `data.cdb` (built 2026-11-05) and it is now abandoned, see below; the other
four have models only. Updated 2026-11-12. Every vanilla house has a few faction-only village buildings (Corrino's Propaganda
Office, the Smugglers' Water Network, Ecaz's Masterpieces); these are Thorvald's.

| Building | Pillar | Proposed role | Look |
|---|---|---|---|
| ~~**Consignment Terminal**~~ | Treasury | **Abandoned 2026-11-12.** Was: sold Plascrete for Solari (the Convert line did not work in a game test) plus a +Solari cap. The rows and the model remain; the effects move to plain faction bonuses ([faction_design.md](faction_design.md)). What to do with the building (retire it, or keep it as a plain building) is open | Domed hub with landing ramps and cargo |
| **Alloy Smelter** | Forge | Plascrete production. It used to feed the Terminal; with no trade, Plascrete needs another use (proposal B5 in [faction_design.md](faction_design.md)) or this building has little point | Twin copper crucible hoppers |
| **Ore Drill** | Forge | Mining: Plascrete on rich ground (the asteroid-mining heritage, the Hammer of Wealth's +15%) | Sealed drill rig, no outlets |
| **War Academy Annex** | Iron Guard | Ein's building: units recruited nearby join one level higher, or recruit faster | Command tower with a copper crown |
| **Contract Hall** | Iron Guard | Where the house signs its mercenaries: cheaper Solari recruitment and upkeep in the region | Low walled compound, oxblood panels |

Lore: Heighforge is a moon-sized exotic-metals factory in orbit around Ipyr ([lore.md](lore.md)), nowhere near Arrakis. These buildings are the house's own works on Arrakis, not a part of Heighforge (rejected idea, 2026-11-13).
Councillor tie-ins are in [councillor_ideas.md](councillor_ideas.md) (the pool's Master of Operations unlocked the Terminal, which no
longer applies; Construction Chief speeds buildings up).

## Headquarters: the Thorvald Citadel

A kitbash of the Conquest Outpost after the user's mock-up (keep, ring, stacked forge tower, bunkers), with the Contract Hall
model now free for other use. The base grows as districts are built (each district slot shows one more bunker, the foundry
chimneys, then a crown on the keep), and shuttles land on its pad and hangar deck on a 117 s loop. Model, animation and prefab
draft: `model_projects/thorvald/thorvald_hq` (see its SPEC.md). Not installed.

## Open
- Effects and numbers: choose from the attribute catalog ([../docs/attribute_catalog.md](../docs/attribute_catalog.md)).
- Unlock route: a Thorvald faction trait or development with `Unlock_TBuilding_Authorize`.
- The house emblem on the panels (see `todo.md`).
