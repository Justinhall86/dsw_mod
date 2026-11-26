# Consignment Terminal: native-scale appearance pass (2026-11-26)

Goal (owner): the Terminal should look like a building Shiro could have shipped next to the Corrino and Atreides village
buildings, in Thorvald colours. Model and texture only: no cdb, hlboot, pak or game-folder change. Output names and the
`StructMOD/ThorvaldConsignmentTerminal/` path stay the same, so the data row needs no edit.

**Recommended: V5 "Crate Lift Hall"** (spec `08_scripts/specs/V5_crate_lift_hall.json`). The final .blend is **not in git**: the cloud session's
network blocks the Git LFS host. Rebuild it (deterministic, under a minute) with
`blender -b --python 08_scripts/34_build_terminal.py -- 08_scripts/specs/V5_crate_lift_hall.json` after `30_village_convert.py`;
it lands in `03_blender/terminal_native/V5_crate_lift_hall.blend`. Commit that one from the local session (LFS works there).
Sheets: `02_progress_photos/22_native_variants/FINALISTS.png`, `02_progress_photos/23_lineups/lineup_v3_finalists.png`.
Not converted, packed or seen in the game yet.

## Why D5 read as a kitbash (from the survey)

`gallery/buildings/village_faction_survey/survey_corrino.png` shows every faction-skinned village building at true in-game size.

| Tell in D5 | Vanilla | Now (V5) |
|---|---|---|
| 5.5 m footprint (export scaled to the Guild Branch) | village buildings 2-2.5 m, biggest 3.6 m | 3.0 x 3.3 x 1.4 m, modelled at scale 1, export keeps it (`footprint` 0) |
| donors blown up 1.9x on 512 px textures | 512 px per ~2 m building | donors at scale 1, 512 px per atlas quadrant: the vanilla texel density exactly |
| flat normal map, flat AO | own normal + MetallicGlossAO | each donor sheet's own normal and MGAO in the atlas |
| hand-made hex slab and copper slope | low chamfered charcoal plinths that follow the building | the donors' own plinths; nothing hand-modelled |
| Guild logo ghost, khaki Military tanks | - | Corrino emblems painted out, every colour re-mapped |
| thin copper | Corrino's gold is big panel blocks | those blocks become copper: bold at RTS zoom by construction |
| dirt decal x12 (Guild) | decal = 1.6 x footprint | `11_convert_building.py` sizes it from the HMD (~5.3) |

## V5 parts (all vanilla Corrino-paint donors, native scale)

- Corrino **Propaganda Office** hall and wings; its obelisk (five islands above z 1.09) removed, the pedestal kept as a roof plinth.
- **Supply Depot** cargo block (rotated 180, pushed into the hall's side), its antenna and ground decals removed.
- Depot **crate stacks**: a 2x2x2 pallet on the roof plinth, a row of three on the front wing.
- Paint (`33_thorvald_paint.py`, `strength` 1.6, `copper` 0xB26E3C): Corrino gold -> copper (value kept as a ratio), red -> oxblood,
  cyan -> ember, greys -> charcoal gunmetal; the Corrino hawk and the depot crest painted out. No rust, no bone.
- One mesh, one material, one 1024 atlas (sheets PropagandaOffice, SupplyDepot, VillageMisc_Neutral), 5,411 faces.

Alternatives on the sheets: **V1b** (same building, bare roof hatch; the calmest) and **V4b** (Plascrete crane on the roof; from behind it reads
like a gun turret, so not recommended). V2 (Water Plant base) and V3 (Processing Plant + Recruitment tower) were dropped in round one.

## Scripts (`08_scripts/`; run with Blender's python or the `bpy` wheel: `python X ...` or `blender -b --python X -- ...`)

| Script | Does |
|---|---|
| `30_village_convert.py` | Faction-skinned village HMDs -> real FBX + PNG, prefab scale recorded (`03_blender/village_donors/`, regenerable) |
| `31_village_survey.py [corrino\|atreides]` | True-size survey sheet -> `gallery/buildings/village_faction_survey/` |
| `32_donor_grid.py <Donor...>` | Top / front / right views with a 0.25 m grid -> `02_progress_photos/20_donor_grids/` |
| `35_islands.py <Donor> [min_faces]` | Loose islands with centre, bounds and texture sheet (pick parts by number, not by guess) |
| `33_thorvald_paint.py <Sheet...>` | Corrino -> Thorvald paint per texture sheet, and the 2x2 atlas |
| `34_build_terminal.py specs/<V>.json` | Spec -> `03_blender/terminal_native/<V>.blend` + renders in `22_native_variants/` |
| `36_lineup.py <out> <V...>` | Variants between Corrino and Atreides buildings, near and default zoom -> `23_lineups/` |
| `terminal_scene.py`, `terminal_sheets.py` | Shared matte scene; texture-sheet resolver (a building HMD can use several sheets) |

Changed: `10_export_building.py` reads the object props `footprint` and `lift_ao` (V5 sets both to 0; old blends keep the old behaviour);
`11_convert_building.py` sizes the dirt decal from the HMD.

## Putting V5 in the game (owner's local session; when asked)

1. Rebuild the blend (above), then `blender -b 03_blender/terminal_native/V5_crate_lift_hall.blend --python 08_scripts/10_export_building.py -- <project>` (prints `@@scale 1.000`;
   tested in the cloud session: 3.0 x 3.27 x 1.41, 5,411 faces).
2. `py -3 08_scripts/11_convert_building.py` (needs `D4X.exe`; overwrites `06_game_ready/StructMOD/ThorvaldConsignmentTerminal/`, D5 is in git history).
3. `py -3 08_scripts/12_roundtrip_render.py`: check the facing. V5 was designed with its front toward the camera in the same Blender frame as D5
   (camera from -X -Y), and the prefab keeps `rotationZ` 90; if the round trip shows it turned, change the prefab rotation, not the mesh.
4. Validate and pack as usual. The build-menu thumbnail is still the Guild Branch's.
