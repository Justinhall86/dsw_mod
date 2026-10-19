# Landsraad Elite - project notes

Atreides unit **"Landsraad Elite"** (`A_LandsraadGuard`): the sculpt in `01_input` skinned to the Male01 rig, carrying the
Atreides Trooper's sword. The Landsraad guard models (halberd) also use the same body.

## Folder layout (use this for every unit: `model_projects/<unit>/`)
| Folder | Contents |
|---|---|
| `01_input/` | the supplied sculpt (`Male04_LandsraadElite.fbx`) and the reference picture |
| `02_progress_photos/` | numbered screenshots by stage: `01_source_cleanup`, `02_fit_to_rig`, `03_color_projection`, `04_low_poly`, `05_textured`, `06_animation_tests`, `07_sword` |
| `03_blender/` | `.blend` files per stage; `elite_final.blend` = halberd variant, `elite_with_sword_final.blend` = sword variant; `_backups/` = Blender auto-backups |
| `04_textures/` | baked Elite Albedo / Normal / MetallicGlossAO (1024, RGBA) |
| `05_fbx_export/` | the FBXs exported from Blender (input of the HMD Toolkit) |
| `06_game_ready/` | `halberd_variant/` and `sword_variant/`: HMD, prefab, props.json (+ textures for the halberd variant) as packed into the pak |
| `07_data_cdb/` | `cdb_changes.json` (the unit/model entries) and a full `data.cdb` snapshot at the last build |
| `08_scripts/` | Blender bridge commands used for each step, `stage2_uv_and_bake.py`, intermediate numpy data |

## What was done
1. Sculpt cleaned (stray bone-shape spikes removed), scaled x1.55 to 2.0 m, fitted to the Male01 rig (elbows/wrists within ~4 cm).
2. Colours projected from the reference picture's front/back/side views; 7,499-tri low-poly; 1024px textures baked.
3. Skinned (<=3 influences; pauldrons -> clavicles; collar -> neck/spine), tested with the guard's and the Trooper's real animation clips.
4. **Sword** (this round): the Atreides Trooper's sword is part of its body mesh (214 verts / 272 tris weighted to `B_Weapon` + `B_Scabbard`, source `model_inputs/A_Trooper/Male01_AtreideSoldier.fbx`). Those triangles were copied into the Elite mesh as a **second material** (`Mat_AtreideSword`) whose textures point at the game's own `Character/Atreide/Unit/Soldier/AtreideSoldier01_*.png`; the body's textures are shared with the halberd variant, so the new model folder holds only the HMD + prefab.
5. data.cdb: `A_LandsraadGuard` (clone of `A_Trooper`) now uses model `N_LR_Elite_Sword` (clone of the Trooper's model entry: Trooper animation set `MilitaryCommon`, hidden `Gun` dyn-object, scale 1.2) -> prefab = the Trooper's prefab with the body swapped. Free, trains in 0.1 s, 600 hp / 18 power / 6 armour, squad 3, wheel slot 10, spawns by the Arrakeen HQ. **Armory:** `equipment` = A_Trooper's FrontLineTactics, OffensiveMindset, ParryingArmguards, PranaBindu and `traits` = A_Trooper_Trait (identical to A_Trooper).
6. `N_LR_Guard` / `N_LR_Guard_Helmet` (all other Landsraad guards) still use the halberd variant (`Prefab_LandsraadElite.prefab`).

## Unfinished / to check in game
- Is "Landsraad Elite" in the recruit menu (slot 10) and does it show in the armory with the four upgrades? Never confirmed for any custom unit.
- Sword position/size relative to this bulkier body (it is the vanilla soldier's sword at the vanilla bone placement).
- Robe/hem stretching in run/attack (the weights are a first pass); hand-painted texture would be crisper than the projected one.
- The Trooper's sword material in the vanilla soldier folder has a `materials.props` (PBR, emissive 1) keyed on `Mat_AtreideSoldier`; the sword here uses default material settings.

## Test build: every Landsraad unit type buildable by Atreides (2026-10-19)
For testing, Atreides get all Landsraad soldier types, spawning beside the Arrakeen HQ at game start and buildable free/instantly
(0 cost, trainingTime 0.1). Each has A_Trooper's four armory upgrades (Front Line Tactics, Offensive Mindset, Parrying Armguards,
Prana Bindu) and `A_Trooper_Trait`.

| Unit id | Name | Model | Cloned from | Wheel slot | Stats |
|---|---|---|---|---|---|
| `A_LandsraadGuard` | Landsraad Elite | `N_LR_Elite_Sword` (Elite + Trooper sword) | A_Trooper | group 1 / 10 | 600 hp, 18 pow, 6 arm, squad 3 |
| `A_LandsraadHalberd` | Landsraad Guard | `N_LR_Guard` (Elite + halberd) | A_Trooper | group 1 / 11 | 600 hp, 18 pow, 6 arm, squad 3 |
| `A_LandsraadRanged` | Landsraad Rifleman | `N_LR_Guard_Gun` (vanilla guard body) | A_Soldier (ranged) | group 0 / 0 | 400 hp, 19 pow, 2 arm, range 35, squad 3 |
| `A_LandsraadDemo` | Landsraad Bazooka | `N_LR_Guard_Bazooka` (vanilla guard body) | A_Demo | group 0 / 1 | 400 hp, 25 pow, 2 arm, range 35, squad 3 |

The `_Chart` / `_Faufreluches` / `_Res` / `_Dev` / `Raider_` Landsraad units are the same three types in other game contexts and were not duplicated.
Ranged/Demo keep their parent's projectile attacks and their own `A_Soldier_Trait` / `A_Demo_Trait` plus `A_Trooper_Trait`; their equipment was replaced by the four above.
Only Atreides free wheel slots in group 1 are 10 and 11 (0-9 are taken, incl. inherited Drone/Ship/Frigate), so ranged/demo use the common group 0 - check that they show in the recruit menu.

## v2 "upscale" (2026-10-19) - why and what
Symptom: in the armory the Elite looked far softer than the Atreides Trooper. Measured: the Trooper has 512x512 DXT5 textures + 8.9k tris; v1 Elite already had 1024 textures + 7.8k tris, so raw counts were NOT the cause. Causes found and fixed:
1. **Albedo was soft**: colours went through per-vertex colours (~1.2 cm apart) from a shaded screenshot. v2 bakes the reference picture's PIXELS: the dense sculpt gets a material that samples `04_textures/reference_cleaned.png` through front/back/side projections (silhouette-calibrated, per-vertex visibility weights), baked into a **2048x2048** atlas (Albedo, Normal, MetallicGlossAO). The reference was cleaned first (bone-display shapes and the orange selection outline removed, `08_scripts/clean_reference.py`); remaining dark orange fringe is neutralised by `v2_03_albedo_fringe_fix.py`.
2. **Mesh was faceted**: 7.5k -> **20,000 tris** (head/hands 5.2k + body 14.8k), 18.2k vertices; normal map 2048.
3. **No PBR material settings**: the Trooper's folder has `materials.props` (mode PBR) and ours had none. Added for both variants (`Mat_Elite`: PBR, culling None for the open cloth hems; `Mat_AtreideSword`: the Trooper's settings, emissive 1).
4. **Skinning bug found while testing**: the rig's wrist bone has a long tail pointing at the thigh, so automatic weights gave the lower tabard 85% wrist weight and it flew up with the hand. Hand/finger bones are now limited to vertices within 0.35 m of the wrist. Stretched triangles (>4x) in the guard's run/attack clips: 31 -> 10 and 70 -> 36 even though the mesh has 2.7x more triangles. The same bug was in v1.
Not changed: sword (same 272 triangles, vanilla soldier textures), units, data.cdb.
Files: v1 kept in `*/v1_7k_tris/` (blender, fbx, game_ready) and `04_textures/v1_1024/`; v2 blends `03_blender/v2_*.blend`, textures `04_textures/v2_2048/`, scripts `08_scripts/v2_01..05_*.py`, photos `02_progress_photos/08_upscale/`.
Pak grew from 13.5 MB to 23.7 MB (three 2048 PNGs). Remaining ideas if still not sharp enough: 4096 textures (pak +~60 MB), hand-painted albedo, an emissive map like the Trooper's, DDS/DXT5 textures with mipmaps like vanilla (needs a converter; the game loads our PNGs fine).

## v3 "vanilla guard base" (2026-10-19) - current build
Why: even at 20k tris / 2048px the full-body Elite looked soft next to vanilla units. New approach: keep the vanilla Landsraad Guard body (its own rig, weights, textures and 6.2k tris) and introduce ONLY the helmet and the two pauldrons from the Elite design.
- Body: `Character/Common/Landsraad/Male01_LandsraadGuard.hmd` (via hmd2fbx). Its hooded head was weighted to `B_SpineTopJ` (it never moved on its own). The head above z=1.74 is cut off, the cowl below is tapered into a neck (`08_scripts/v3_02_guard_mod.py`); the vanilla shoulder plates stay under the new pauldrons.
- New parts: carved from the Elite sculpt (still in rig-fitted coordinates, so no re-fitting): helmet incl. gorget flanges 3.8k tris, pauldrons 2.3k each (`v3_01_parts.py`); baked to a dedicated 1024 atlas from the cleaned reference image (`v3_03_bake.py`, `04_textures/v3_parts_1024/`). Helmet 100% SpineTop; pauldrons 85% clavicle / 15% SpineTop.
- Materials in one HMD: `Mat_LandsraadGuard1` -> the vanilla guard textures (Character/Common/Landsraad/LandsraadGuard_*.png), `Mat_ElitePart` -> `CharMOD/Male01_LandsraadGuardElite/..._{Albedo,MetallicGlossAO,Normal}.png`, plus `Mat_AtreideSword` for the sword variant. `materials.props` (PBR) for all.
- Models (`06_game_ready/v3_vanilla_guard_base/`): `Male01_LandsraadGuardElite` (14,219 tris, 10.7k verts) with three prefabs built from the vanilla ones: halberd (`Prefab_LandsraadGuardElite`), rifle (`..._Gun`), bazooka (`..._Bazooka`); `Male01_LandsraadGuardEliteSword` (14,491 tris) with the Trooper's prefab.
- data.cdb: `N_LR_Guard`, `N_LR_Guard_Helmet` -> halberd prefab; `N_LR_Guard_Gun` / `N_LR_Guard_Bazooka` -> gun / bazooka prefabs; `N_LR_Elite_Sword` -> sword prefab. So EVERY Landsraad guard in the game (Landsraad faction, Corrino test units, the four Atreides test units) now wears the new helmet + pauldrons. Units, costs, upgrades, spawn list unchanged. The v2 full-sculpt model folders were moved to `model_work/removed_from_pak/` (v2 files remain in this project under `06_game_ready/halberd_variant|sword_variant`). Pak 23.7 MB -> 11.8 MB.
- Ginaz: no unit named Ginaz exists in the data (only conquest XP bonuses + the "Ginaz Swordmaster" quest, whose reward is a free Atreides Warden `A_Elite`).
To check in game: seams/neck under the helmet, pauldron fit on shoulders, texture match between the vanilla body and the new parts (the parts carry baked shading from the reference render), animation of helmet/pauldrons in run and attack.
