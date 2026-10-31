# House Thorvald Ranged (sniper): project notes

Reference: `01_input/character_image_sheet.jpg` (front, back, three-quarter). Built from the House Thorvald Trooper (v13, recipe `T14_Trooper`);
the pipeline scripts are a copy of `thorvald_trooper/08_scripts`, with ranged-only changes noted below.

**Current deliverable: `03_blender/Thorvald_Ranged_v2.blend`** (recipe `R5_Ranged` plus the library sniper rifle). v1 (`R2_Ranged`) kept.

## What differs from the Trooper (as built)
| | Trooper | Ranged v1 |
|---|---|---|
| Shoulders | Gurney shoulder shells (pauldrons) | removed (Gurney islands 17, 18 + edge strips 47, 48); the black sleeves close cleanly under them |
| Elbows | Gurney elbow plates | removed (islands 11, 12, 53, 54, 59, 60) |
| Chest plate | gunmetal | rust-ochre plates incl. the sternum plate, deep-rust frame (region `g_plate`, palette `ochre` (128, 62, 30)) |
| Collar / throat | gunmetal | black (padded collar of the reference) |
| Sleeves | rust upper-arm wraps | black fabric; one rust cloth wrap round the RIGHT bicep (`arm_wrap`) |
| Weapon | Thorvald Katana on B_Weapon | Thorvald Sniper on B_Gun (`model_projects/weapons/thorvald_sniper`) |
| Animation set | Common (melee) | Male01 **Sniper** set (`extr/Anim/Male01/Sniper`: Idle, IdleStance, FightIdle, AttackRange, Run, AttackMelee...) |

Same as the Trooper: Commando head + face wrap, kasa hat, Duncan's sash/apron (rust, black trim), gear emblem on the left chest.

## v2 (2026-10-27): lighter boots + back pouches (recipe `R5_Ranged`)
- **Legs = Atreides Soldier** (slim black trousers, knee plates, light boots), islands kept explicitly: 4/5 trousers, 13/14 shins, 20/21 + 79/80
  boots, 30/31 pelvis, 61/62 knee plates. Tried first: Otheym boots (bulky, frayed tops), Militia wraps (spiky tops), Duncan thigh + Soldier shin
  (jagged slivers at the knee); a bone filter on the Soldier also took its coat panels (islands 10, 15 and more). Survey: `02_progress_photos/04_boots_pouches/boots_sheet.png`.
- **Pouches = Mercenary islands 33, 34** (both from its left front hip), `to_back`: turned round, x -0.11 / +0.11, z 1.20, scaled 0.65, seated on the
  sash belt by a ray from behind, then skinned like the nearest belt vertex (ROOT 0.52 / Spine01 0.48) - with the donor's thigh weights they swung
  off the back in Run. Recoloured as region `pouch` (black leather, dark metal clasps).
- The emblem / hat take their material from a Duncan-made fill (the sash) now that the legs are not Duncan's - the gear had vanished.
- The recolour writes opaque alpha (the Soldier albedo has alpha 0.91 in places; audit flagged it). 7,300 tris, audit 0 problems.
- Fix (same day): the Soldier pelvis poked through the apron's side panels (black patches); the legs fill is now `clip_under="Fill_sash"`
  (85 verts pushed under the sash; `clip_inside` run after all fills). `v2_apron_fixed.png`.
- GIF `02_progress_photos/04_boots_pouches/Thorvald_Ranged_v2.gif`; sheet `v2_vs_reference.png`.
- Rebuild: `bash 08_scripts/run_final.sh R5_Ranged`, then mount `../weapons/thorvald_sniper` -> `03_blender/Thorvald_Ranged_v2.blend`.

## How
- `03_variants_trooper.py`: `R1_Ranged` (T14 + `remove`), `R2_Ranged` (+ `arm_wrap=dict(side="r", band=(0.08, 0.17), lift=0.008)`).
  `build_arm_wrap`: the two arms share texels (`arm_uv_probe.py`: 48/48 samples shared), so the band is NOT painted: its own sleeve faces
  (8-17 cm down the right upper arm) are re-pointed at the trim atlas's rust cloth (`tab_front` above the hem, angle mirrored so there is no seam)
  and pushed out 8 mm. No new geometry; it deforms with the sleeve.
- `08_uvdump_trooper.py`: `g_throat` limited to z > 1.58 (below that is the sternum plate), new `g_plate` (front, |x| < 0.22, z 1.28-1.60).
- `09_thorvald_recolour.py`: `g_plate` rules + priority 1 (claims its texels before the back plate), `g_collar` / `g_throat` / `g_arm_up` -> black.
- Rifle: `weapons/thorvald_sniper` (Ravager Leader sniper; stock, handguard and foregrip rust-ochre, metal gunmetal). Mounted with the new
  `mount: "bone_local"` mode of `weapons/scripts/mount_weapon.py` on `B_Gun`, rotation (0, 0, 0) - checked in the Sniper clips.
- Clips converted with `HMD_toolkit/.../hmdanim2fbx.py` (Mercenary HMD body) into `05_fbx_export/anim/Sniper_*.fbx`.
- Rebuild: `bash 08_scripts/run_final.sh R2_Ranged` then
  `blender -b 10_upscale/Trooper_R2_Ranged_up2.blend --python ../weapons/scripts/mount_weapon.py -- ../weapons/thorvald_sniper 03_blender/Thorvald_Ranged_v1.blend`.
- 7,597 tris body + 737 verts rifle; audit 0 problems.

Images: `02_progress_photos/01_r1/R1_vs_reference.png`, `02_r2/R2_vs_reference.png`, `03_rifle/` (rifle preview, clip key frames, `Thorvald_Ranged_v1.gif`),
`rifle_candidates.png` (the six game snipers compared).

## About the supplied (Gemini) spec
Used for intent only. Not applicable to this game: 32-35k tri targets (vanilla units are ~7-10k), Rigify bone names (the game rig is Male01 `B_*`),
cloth simulation / Solidify modifiers, IK "Child Of" rigs (the game plays baked clips), separate boot sole thicknesses and 1.82 vs 1.85 m heights
(both units share the skeleton). Its melee description also does not match our Trooper (e.g. no katana scabbard on the hip).

## Not done yet / open
- The rifle slung across the back (reference back view) - the game shows one weapon; a second, back-mounted copy is possible as a static prop.
- Harness straps over the suit, the tattered ends of the bicep wrap.
- Not exported, no data.cdb entry, not installed; never seen in game.
