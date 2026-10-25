# Unit Roster — New House (unnamed)

Vehicle/air roster for the new faction (separate from House Ginaz — nothing for this house belongs in `house_ginaz/`).
Ground infantry are not drafted yet; see [heroes.md](heroes.md) and [counsellors.md](counsellors.md) for the hero/councilor roster.

## Overview
| Unit | Source asset | Role | Status |
|---|---|---|---|
| **Frigate** (name TBD) | `model_inputs/Vehicle/Common/Renegade_Frigate` | heavy air unit / capital gunship | asset in hand, has a preview .blend + .gif already |
| **Fighter** | not chosen yet | fast light air unit, likely anti-air or harassment | **needed** |
| **Drone** | not chosen yet | small support/combat drone | **needed** |

## Frigate — name candidates
The asset is `Renegade_Frigate` (filename only; not a canon in-game name). Candidates for the in-game unit name, keeping the
outlaw/renegade flavor the asset name already suggests:

| Candidate | Feel |
|---|---|
| **Corsair** | classic raider/pirate-ship name, easy to say |
| **Marauder** | aggressive, matches a renegade/mercenary house |
| **Wraithwing** | moodier, sci-fi; distinct from any vanilla unit name |
| **Reaver** | short, sharp, outlaw-coded |
| **Nightrunner** | smuggler/stealth-flavored, pairs well with Vane Torrver's camouflage kit |

No pick made yet — flag a favorite and I'll lock it in across these files.

- **Look:** already modeled/textured (`Renegade_Frigate.fbx` + Albedo/Normal/MetallicGlossAOEmiss) with a preview blend and gif rendered.
- **Game slot idea:** the heavy air/gunship slot (compare Harkonnen's Harpy, Imperial's Hammer, Smuggler's Banshee for where this sits
  in the vanilla air-unit tier).

## Fighter — options to source
No model picked yet. Likely donors already in `model_inputs/Vehicle/`:

| Candidate | Source | Notes |
|---|---|---|
| **Wraith** | `Vehicle/Smuggler/Wraith` | lighter airframe, fits a fast/scout-fighter role, thematically close to this house's renegade feel |
| **Banshee** | `Vehicle/Smuggler/Banshee` | Smuggler's other air unit; has a `Select.fbx` variant too |
| **Ravager** | `Vehicle/Common/Ravager` | a Common (non-house-locked) asset, same tier as the Frigate's own Common folder |

Recommendation: pick from **Smuggler** (Wraith/Banshee) since the frigate itself reads as a renegade/smuggler-adjacent design —
reskinning one of these would keep a consistent silhouette family for the house.

## Drone — options to source
No model picked yet. Likely donors:

| Candidate | Source | Notes |
|---|---|---|
| **DroneS** | `Vehicle/Smuggler/DroneS` | combat drone; already ships with per-house Albedo variants (Atreides/Corrino/Harkonnen/Smuggler), so a new house skin is a known, low-risk reskin job |
| **StockDrone** | `Vehicle/Smuggler/StockDrone` | simpler/plainer drone, could read as a cheaper scout or resource-support drone instead of a combat one |
| **Ravager_Drone** | `Vehicle/Common/Ravager_Drone` | Common asset, same family as the Frigate |

Recommendation: **DroneS**, since it already has a multi-house texture setup and needs the least extra rigging/reskin work.

## Open decisions
- Lock in a Frigate name from the candidates above (or propose your own).
- Pick Fighter and Drone donor assets (recommend Smuggler Wraith/Banshee + DroneS, but all three Common options are open).
- Decide how the air roster maps to vanilla slot tiers (which vanilla unit each one is reskinning/replacing in `data.cdb`).
- Ground infantry roster still needs drafting — not started.
