# House Thorvald Demolition (bazooka): project notes

Reference: `01_input/character_image_sheet.jpg` (front, back, three-quarter). Built from the House Thorvald Trooper (v13, recipe `T14_Trooper`);
the scripts are a copy of `thorvald_ranged/08_scripts` (which already has the arm wrap and the belt-pouch placement), recipes in `03_variants_trooper.py`.

**Current: `03_blender/Thorvald_Demolition_v2.blend`** (recipe `D2_Demolition` + `weapons/thorvald_bazooka`). v1 (`D1_Demolition`) kept.

## v2 (2026-10-27): more distinct from the Trooper / Ranged (user picked 3 of 5 proposals)
- **Copper-rimmed pauldrons** (`plate_rims`, `build_plate_rims`): Gurney islands 17, 18, 47, 48 are tagged before cutting (`regions`); every open rim
  edge of those plates gets a 9 mm strip laid on the plate (lift 1.5 mm), skinned like the rim, UV on the solid copper band of the trim atlas
  (`yoke2` v 0.9375 = atlas row 742).  136 strips.  A texture-only outline (TRIM_REGIONS in the recolour) was tried first: it traced the painted
  detail inside the plates (squiggles), so it is switched off.
- **Heavier legs**: the Mercenary's trousers, armoured shins and knee caps (islands 4, 5, 9, 10, 21, 22, 29, 30), tucked under the sash
  (`clip_under="Fill_sash"`: its thighs poked through the apron), on Duncan's shins + boots (`match Knee/Ankle/Ball`, hidden inside the Mercenary
  shin plates): the Mercenary's own feet are open-toed (hollow when kneeling) and Duncan's boot alone left a see-through gap at the heel.
- **Belt canisters** (`props`, `build_props`): the bazooka's Missile, scaled (0.55, 0.36, 0.55) -> about 8 x 14 cm, cap up, at x -0.09 / +0.09 on the
  front of the belt between buckle and pouches (front pouches moved out to +-0.17); material = the painted Thorvald bazooka maps (skipped by the
  recolour); skinned like the belt.
- 9,480 tris + bazooka; audit 0 problems. `02_progress_photos/03_d2/` (`v2_compare.png`, `Thorvald_Demolition_v2.gif`).
- Rebuild: `bash 08_scripts/run_final.sh D2_Demolition`, then mount `../weapons/thorvald_bazooka` -> `03_blender/Thorvald_Demolition_v2.blend`.

## What differs from the Trooper (as built)
| | Trooper | Demolition v1 |
|---|---|---|
| Sleeves | rust upper-arm wraps | black, one rust cloth wrap round the RIGHT bicep (`arm_wrap`, as on the Ranged unit) |
| Collar / throat | gunmetal | black |
| Belt | sash only | Mercenary box pouches (islands 33, 34) at 65 %: front at x -0.15 / +0.15 (`to_back` with `side="front"`), back at x -0.11 / +0.11; skinned like the belt |
| Weapon | Thorvald Katana (B_Weapon) | Thorvald Bazooka (B_Gun, `mount: bone_local`, rotation 0) |
| Animation set | Common (melee) | Male01 `LandsraadGuard_Bazooka` (Idle, IdleStance, FightIdle, AttackRange, Run) -> `05_fbx_export/anim/Bazooka_*.fbx` |

Same as the Trooper: pauldrons, black/gunmetal cuirass + gear emblem (`g_plate` rules = the Trooper's gunmetal), hat, face wrap, sash/apron, Duncan legs + boots.

Bazooka: `model_projects/weapons/thorvald_bazooka` = the Fremen Bazooka (what the Landsraad Guard carries; vanilla prefab on B_Gun), repainted by
`paint_bazooka.py`: the source saturation is bimodal (warm-grey tube 0.25-0.30, copper 0.50-0.55) -> tube matte black-gunmetal, copper sections rust,
orange stripe / lamp copper. Candidates compared: `02_progress_photos/launcher_candidates.png`.

8,411 tris body + 1,038 verts bazooka; audit 0 problems. Images: `02_progress_photos/01_d1/D1_vs_reference.png`, `02_bazooka/` (preview, GIF, key frames).

Rebuild: `bash 08_scripts/run_final.sh D1_Demolition`, then
`blender -b 10_upscale/Trooper_D1_Demolition_up2.blend --python ../weapons/scripts/mount_weapon.py -- ../weapons/thorvald_bazooka 03_blender/Thorvald_Demolition_v1.blend`.

## Not done yet
- The bazooka slung across the back in the reference (the game shows one weapon; a static back copy is possible).
- The reference's pauldrons are smaller and more layered than the Trooper's; harness straps; wrap tatters; a rocket rack on the back (proposal 1,
  declined for now) and a scorched apron hem (proposal 5).
- The canisters are dark and read small from the game camera; brighter copper caps would help.
- Front pouches stand a little proud of the belt.
- Not exported, no data.cdb entry, not installed.

## About the supplied (Gemini) spec
Its useful part: no scabbard, pouches + canisters on the belt, bazooka. Wrong against the sheet: "burnt ochre panels across the upper chest and collar"
(the sheet's plate is black), "bulkier 0.16 m blast pauldrons" (the sheet's are, if anything, smaller), canisters "on the right hip" (the sheet has
them on the front of the belt). Not applicable: 38k tri budget (vanilla ~7-10k), AUX helper bones, cloth sim, IK constraint rigs (the game plays
baked clips on the fixed Male01 rig), boot sole thickness / height differences (one shared skeleton).
