# Unit Roster — House Thorvald

Vehicle/air roster for House Thorvald (separate from House Ginaz — nothing for this house belongs in `house_ginaz/`).
Ground infantry have a look but no stats yet: the combat sheet shows four units (see [art_direction.md](art_direction.md)). Faction bonuses are in
[faction_design.md](faction_design.md). See [heroes.md](heroes.md) and [counsellors.md](counsellors.md) for the leader, heroes and councillors.

**Lore ([lore.md](lore.md)):** Thorvald's export is Heighforge alloy, the metal warships and defence platforms are built from, and its
wealth comes from mining asteroids. Armour plate, hulls and machines are the house's pride, so the roster should look over-built and
well-supplied rather than ragged.

**Build status (2026-10-30):** the faction `Th_*` is installed (untested in game) with our models in five slots: Th_Trooper,
Th_Soldier (Iron Ranger), Th_Special (Iron Guard), Th_Elite (Heavy Vanguard), Th_Frigate. The fighter (Th_Ship) is also installed.
Details in each `model_projects/thorvald_*` folder and `model_projects/thorvald_faction/SPEC.md`. The sections below are the original
planning notes.

## Units still needed (checked against `data.cdb` on 2026-10-31)
Skipped on purpose: **Ornithopters** (4 variants) and the **Harvester**. Atreides and Harkonnen both use the shared vanilla base models
(`Ornithopter`, `Harvester`) with no model of their own, so Thorvald keeps them.

| Slot | Row | Status | Need |
|---|---|---|---|
| Artillery drone | `Th_Drone` (and `Th_Drone_Deployed`) | still Corrino's artillery drone | A Thorvald drone. Recommended: reskin Smuggler `DroneS` (see Drone options above) |
| Hero 1 | `Th_Hero_1` Karlin Mallenor | Corrino hero body and portrait | New hero body + portrait; support/aura commander |
| Hero 2 | `Th_Hero_2` Vane Torrver | Corrino hero body and portrait | New hero body + portrait; rocket/camouflage specialist |
| Heroes' pet | `Th_LazaTiger` | Corrino's Laza Tiger, tied to a hero | Remove or replace with something Thorvald (not a unit we need to model) |
| Leader and councillors | Memnon, Jool/Ein, Silva, Haruka, Nobru | names only; portraits are Corrino's | Portraits only, no 3D model. Ein is new ([counsellors.md](counsellors.md)) |
| Orbital strike visual | `Th_MissileShip`, `Th_Nuke_Area` | Corrino's missile ship | A Thorvald look for Hammerfall ([operations.md](operations.md)); optional |
| HQ | `ThorvaldCitadel` | Corrino capital ship model | A Thorvald HQ model; likely a Heighforge-style station |
| Mining vehicle | none | concept art only | Optional new unit: the tracked claw machine ("Belt Crawler") |

Already done (our models, installed, untested in game): Trooper, Iron Ranger, Iron Guard, Heavy Vanguard, Frigate, Fighter (`Th_Ship`).

Fixes, not new units: Iron Guard's bazooka body still fires the Corrino flamer; the Frigate has no deploy animations; units still cost
Manpower, not Solari.

## Name ideas from the lore
The infantry names are being redone. Candidates that carry the lore:

| Unit | Current | Candidates |
|---|---|---|
| Trooper | Trooper | Forgehand, Ipyr Levy, Deckhand |
| Ranger (rifle) | Iron Ranger | Belt Marksman, Heighforge Rifle |
| Bazooka | Iron Guard | Planetbreaker, Slag Gunner, Breaker |
| Shield and flame blade | Heavy Vanguard | Heighforge Vanguard, Smelter Guard, Anvil |
| Frigate | (TBD) | Anvil, Heighforge Tender, Hammer of Ipyr |

"Iron Guard" is also the faction bonus name, so it is worth freeing it from the bazooka unit.

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

### Modding options (worked out in `model_projects/sentinal/`)

Full detail and two rendered examples are in `model_projects/sentinal/SPEC.md`. Short version:

- **Recolour** - works cleanly, done. A renegade/salvager palette (dark gunmetal hull, rust-bronze
  plates, amber trim) replaces the vanilla Smuggler blue-grey. `sentinal_recolour_v1.blend` / `.gif`.
- **Kitbash (graft a part on)** - two generations of this were tried; only the second is recommended.
  The first (`sentinal_kitbash_v1`-`v10`) mounted whole miniature donor ships on top of the hull -
  functional but reads as a toy glued to a toy. The second (`sentinal_graft_v1`-`v7`, all in
  `model_projects/sentinal/`) does it properly: each donor is scaled to match the Frigate's OWN size
  first, then a real chunk (a wing, a turret-top, a hatch cap) is cut out of it and embedded into the
  hull surface so the join disappears into shared mass - the actual hard-surface kitbash technique,
  not a prop placement. **`graft_v7_hero_combo`** is the recommendation: a Ravager_Shuttle hatch cap
  (reads as a bridge module), a Hammer wingtip wedge (a bow blade), and a Hawk wing (a wingtip
  extension) combined on one hull, spaced so nothing collides. `graft_v1_droneS_fin` keeps the tie to
  this house's own Drone unit (`DroneS`) if that connection matters more than the strongest single
  look. Full technique writeup, the donor chunk table, and a third coordinate bug this uncovered
  (HMD-converted meshes store bind-pose, not visual-pose, data - see `dsw-model-workshop`'s
  `references/traps.md`) are in `model_projects/sentinal/SPEC.md`.
- **Removal (cut hull detail)** - possible but the mesh needs a different approach than the
  `dsw-model-workshop` part-removal tool: the hull is 194 disconnected, unwelded panel islands (the
  largest is 38 verts), so there's no component ID that means "the wingtip nacelle" and the
  closed-shell closure proof doesn't mean anything here. A **spatial** cut (delete everything in a
  world-space box, verify by before/after render instead of the boundary-edge proof) is the way in -
  a concrete candidate (the wingtip nacelle caps) is scoped out with coordinates in the SPEC but not
  yet cut.

Recommendation: ship the recolour as the house identity regardless of what else happens; the kitbash
pod and/or the wingtip cut are optional silhouette changes on top of it.

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

## Ground infantry (look exists, names under redo)
From [images/art_combat_units_sheet.jpg](images/art_combat_units_sheet.jpg): Trooper, Iron Ranger (rifle), Iron Guard (bazooka),
Heavy Vanguard (shield and flame blade). The house's "Iron Guard" bonus means all soldiers cost Solari instead of Manpower
([faction_design.md](faction_design.md)), and the names are being redone. Stats, costs and weapons are not drafted.

**Trooper model:** a preview kitbash exists in `model_projects/thorvald_trooper/` (Commando torso and shoulders, Mercenary forearms, Duncan legs
and belt/sash, Idualis02 head with a cloth half mask, a shoulder yoke, a kasa hat rebuilt from a Meshy sculpt's measured profile and a gear-and-star emblem,
House Thorvald recolour; v6 is current: the Commando's own head with its cloth half mask, layered copper-edged yoke, slimmer shoulders, 9,162 triangles and
1024 painted textures, audited against the vanilla targets). It plays the game's clips, is not exported to the game, and has no weapon or emblem yet.
See that project's `SPEC.md`.

## Ground vehicle concept
[images/art_tracked_claw_vehicle.png](images/art_tracked_claw_vehicle.png): a tracked machine with a boxy armoured cab, a claw arm
and a rock-saw head, in dark steel with rust trim. No name or role is stated. The Hammer of Wealth bonus (+15% Plascrete from mining) suggests a
mining or utility vehicle, but that is a guess. There is no source model for it yet.
The lore backs the mining read: a rock-saw and claw are tools for cutting planetoids in the Ipyrian Belt, put on tracks for Arrakis.
Name idea: **Belt Crawler**.

## Air roster tie-in
Guild Sub-Contract (5000 Hegemony) gives instant troop travel between Owned Airfields, so the Frigate, Fighter and Drone sit at the centre of
this house's design. The lore agrees: the house's power base, Heighforge, is in orbit, and its alloys are aerospace alloys.

## Open decisions
- Lock in a Frigate name from the candidates above (or propose your own).
- Pick Fighter and Drone donor assets (recommend Smuggler Wraith/Banshee + DroneS, but all three Common options are open).
- Decide how the air roster maps to vanilla slot tiers (which vanilla unit each one is reskinning/replacing in `data.cdb`).
- Ground infantry: redo the four unit names, then draft stats, costs and weapons (the Trooper has no weapon in hand on the sheet).
- Decide whether the tracked claw vehicle is a unit, and find a source model for it.
