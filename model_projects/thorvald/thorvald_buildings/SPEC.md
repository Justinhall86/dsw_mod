# Thorvald buildings

Five unique House Thorvald buildings, made from vanilla building models that nothing in Skirmish uses. Design side:
[house_thorvald/buildings.md](../../house_thorvald/buildings.md). **Not installed**: no cdb rows, no HMD conversion, no pak.

## The five

| Building | Donor model (why it was free) | Changes |
|---|---|---|
| **Consignment Terminal** | `Point_Of_Interest/TrafficHub` (no cdb reference at all) | Thorvald recolour; orange ramps become copper, red crates oxblood |
| **Alloy Smelter** | `Buildings/SpiceCollector` (rows `SpiceCollectors`, `FremenProcessingPlant` are in the Obsolete separator) | Recolour; the twin hoppers read as copper crucibles |
| **Ore Drill** | `Buildings/WaterExtractor` = `Model_IceExtractor` + `WaterExtractor_Addon` (only unlocked on the Conquest map `C_NorthPole`) | Recolour; **48 ice parts cut** (three piles) and **7 discharge elbows cut** (right tanks, front-left drum), so nothing looks like it should pour out |
| **War Academy Annex** | `Buildings/IndoctrinationCenter` (no cdb reference at all) | Recolour; the Harkonnen paint zones become copper |
| **Contract Hall** | `Base/ConquestOutpost` (Conquest-only) | Recolour; faction zones become oxblood, gold trim copper; the Harkonnen emblem inside the panel is filled over |

Rejected: HarvestTent and KulonTent (Fremen cloth), TowerConquestOutpost (spiked, Harkonnen look), the Masterpiece placeholder
(it is the buildable Recruitment Office), CorrinoBasePreview (Corrino's base), Stash_Smuggler (failed to convert: its parent node has a
translation; try again if a sixth building is wanted).

## Palette
Gunmetal (warm-neutral, value compressed), copper `#CC783D` (a touch brighter than the faction 0xB26E3C so it reads at RTS zoom),
oxblood `#66171C`. No rust.

## Scripts (`08_scripts/`, run in order)
| Script | Does |
|---|---|
| `10_survey_render.py` | Turntables + fronts of every unused donor -> `02_progress_photos/01_survey/` (`survey_sheet.png`) |
| `20_recolour.py` | Donor albedo -> `04_textures/<Building>/albedo.png`. Faction zones are found from the Harkonnen albedo (saturated red), warm paint -> copper, red -> oxblood, rest -> gunmetal |
| `30_render.py` | Front / three-quarter / back + turntable -> `02_progress_photos/02_recolour/` (`compare_sheet.png`) |
| `40_parts_survey.py` | Blender: list loose parts with bounds and source colour (how the ice and spouts were found) |
| `41_clean_oredrill.py` | Blender: cut the ice (cyan, on the ground) and, with `spouts`, the discharge elbows -> `05_fbx_export/OreDrill_*_clean.fbx` |
| `50_save_models.py` | `03_blender/<Building>.blend` (textures packed) + `05_fbx_export/<Building>.fbx` |

## To put one in the game (when asked)
1. FBX -> HMD with the toolkit (`convert_fbx.py`); check with `check_hmd.py`. Buildings are static, but keep the donor's node layout.
2. A prefab next to the donor's, pointing at the new HMD and the recoloured albedo (DDS).
3. A `building` row cloned from a vanilla sibling (inserted next to it, not at the end), `onlyForFactions: [Thorvald]`, plus an
   `Unlock_TBuilding*` source (see the `dsw-building-audit` skill for what counts as reachable in Skirmish).
4. `cdb_validate.py` (0 NEW), `engine_preflight.py` (0 FAIL), repackage.
