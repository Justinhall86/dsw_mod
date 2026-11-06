# Thorvald Citadel (HQ / main base)

Replaces the Corrino lighter that `ThorvaldCitadel` (structure row) borrows today. Kitbashed from the Conquest Outpost
(the Contract Hall donor) after the user's AI mock-up (`01_input/` reference, 2026-11-03): ring platform, central keep,
tall stacked forge tower, octagonal bunkers. **Not installed**: no HMD conversion, no cdb rows, no pak.

## Current variant: H3 (`01_input/h3.json`)

| Group | What | Shown |
|---|---|---|
| `Base` | Whole outpost (copper recolour) + forge tower: two stacked keep copies at half width in the west bay (bay clutter removed), ~25 m | always |
| `District_1_1..1_3` | Squat keep copies (x0.62/0.55, z0.46/0.42) over the N, E, S spoke posts, with the west-bay clutter on the roofs | district group 1, slots 1-3 |
| `District_2_1` | Same bunker over the W post | group 2 slot 1 |
| `District_2_2` | Three foundry chimneys (the round spoke-post caps, stretched), smoke FX in the prefab | group 2 slot 2 |
| `District_3_1` | Crown: a smaller keep on top of the keep (centre rises to ~21 m) | group 3 slot 1 |

Size 46.8 x 46.4 x 25.8 m at scale 1 (Arrakeen at its row scale 1.2: 49 x 54 x 20.5; Corrino lighter at 0.8: 35 x 45 x 10).
Everything is cut from one donor, so the whole base uses one texture set (`thorvald_buildings/04_textures/ThorvaldCitadel/albedo.png`,
outpost faction zones -> copper) and the outpost's normal / MGAO / emissive.

**Districts grow the base.** The engine builds the name `District_<group>_<slot>` (1-based) for every district slot and
shows that prefab node once the slot is built (`ent/StructureModel.hx:80`, then `updateDistricts`). Missing names are
skipped (Corrino has only three). Thorvald's `districtSlots` are [3, 2, 1] = six pieces.

## Animation

- `06_game_ready/Anim_ThorvaldCitadel_Ships.fbx` (an HMD, as in the game): the vanilla Arrakeen shuttle rig
  (`RIG_BaseArrakeen_Ships`, J_Ship_01..04) flown on new paths. Made by copying the vanilla animation and overwriting only
  its frame block (same header, 3501 frames = 116.7 s loop). Ship 1 lands on the NE ground pad twice per loop, ship 2 on
  the hangar roof deck, ships 3 and 4 patrol circles (27 m / 17 m up, 21 m / 11 m up, opposite ways).
- The rig node is scaled x3.5 in the prefab (the shuttles are ~2 m, too small at RTS zoom).
- Spaces: HMD = Blender with X negated; ship nose = local -Z; hidden = x -1e6 (as vanilla ship 4).
- Checked by the toolkit round trip: `hmdanim2fbx` (rig + our anim) played over the citadel in Blender.
- The shuttles still wear the Atreides ArrakeenAsset texture. A Thorvald recolour needs a retextured copy of the rig HMD.
- Vanilla comparison: Arrakeen loops doors + 4 shuttles (prefab rigs) and lights; Corrino plays a one-shot `Land`
  animation from the model row (`anim: [{id: Land, animName: CorrinoBase}]`). Our model row must drop that anim.

## Prefab draft: `06_game_ready/Prefab_ThorvaldCitadel.prefab` (from `40_make_prefab.py`)

Destruction (Corrino FX) / Citadel (rotationZ -101.3) -> BaseThorvald (decal + base model), Districts (six models,
smoke under District_2_2), FX (tower beacon, yellow floods, antenna prop), RIG_ThorvaldCitadel_Ships.
All referenced FX / props exist in `C:\dsw_mod\extr`. Game paths: `res/Structure/Base/Thorvald/`.

## Scripts (`08_scripts/`)

| Script | Does |
|---|---|
| `10_convert_donors.py` | HMD -> FBX for the donors (scratch `thv_hq/`), prints bounds |
| `11_lineup.py` (+ `_blender`) | True-scale lineup Arrakeen / Corrino / Outpost -> `02_progress_photos/01_survey/lineup_*.png` |
| `12_parts_survey.py` | Outpost loose parts with bounds (`01_survey/outpost_parts.txt`, labelled views) |
| `hq_scene.py` | Blender helpers: material, import + place, ground, camera, shoot |
| `20_build_hq.py` | Declarative kitbash from `01_input/h*.json`; renders `02_kitbash/`; `--save` .blend, `--export` one FBX per group, `--growth` build stages |
| `30_ships_anim.py` | Writes the ship animation HMD |
| `31_ships_preview.py` | Toolkit round trip + GIF over the citadel -> `02_progress_photos/03_animation/` |
| `40_make_prefab.py` | Writes the prefab draft |

Prerequisite: `thorvald_buildings/08_scripts/20_recolour.py ThorvaldCitadel` (the copper albedo).

## To put it in the game (only when asked)

1. Each `05_fbx_export/H3/<group>.fbx` -> HMD with `convert_fbx.py model` (static, no skin) -> `ThorvaldCitadel_<group>.fbx`
   in `res/Structure/Base/Thorvald/` with the albedo as DDS; `check_hmd.py`.
2. Copy the prefab and `Anim_ThorvaldCitadel_Ships.fbx` there.
3. A `model` row `ThorvaldCitadel` cloned from `CorrinoBase`, inserted next to it: mesh = the prefab, no `anim`, radius ~24,
   height ~26, collisionRadius ~23, `hideOnDestruction: BaseThorvald`, preload Thorvald; remove Thorvald from CorrinoBase's preload.
   Then structure `ThorvaldCitadel.model` = `ThorvaldCitadel`.
4. cdb_validate (0 NEW), engine_preflight (0 FAIL), repackage. In game: watch districts appear and the shuttles land.

## Open

- Variety: every block is a keep copy. Other donors (Smelter hoppers, Terminal dome) would break that up (multi-material is fine).
- The emblem / "Hammer of Wealth" banner from the mock-up is not painted yet (house emblem is still a todo).
- Shuttle recolour; possibly the Thorvald fighter (Th_Ship) as the landing craft instead.
