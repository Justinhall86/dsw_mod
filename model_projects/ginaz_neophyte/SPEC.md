# Ginaz Neophyte (trainee) - 2026-10-24

Concept: `house_ginaz/images/unit_roster.jpg` (first figure): top-knot, plum jacket with horizontal frogging and a stand collar, grey sash with a
hanging tail, wrist wraps, wine trousers, tall dark boots, unarmed.

## Recipe (`08_scripts/03_variants.py`, variant `N2_Neophyte`; textures `21_neophyte_textures.py`)
| Part | Source | Treatment |
|---|---|---|
| legs, boots | the **Ginaz Captain** body (Mercenary, metal stripped, Captain's Ginaz textures in `04_textures/shared/`) | only the lower body kept (`drop_above_z` 0.98); the Captain's gold boot-cuff bands recoloured to boot leather |
| jacket, sleeves, sash, hands | **Raider** islands 1, 4, 9, 10, 13-16, 21, 22 (its scarf/face mask islands left out) | recoloured to Ginaz wine; chest frogging (dark wine bands + loops, gold centre toggles) and grey wrist wraps painted BY 3D POSITION |
| head | **Idualis02** (hair, face, ears) | its red mask and the glowing blue eyeball meshes (islands 33, 34) removed - no "Eyes of Ibad"; hair recoloured black |
| collar | hand-modelled short stand collar (`COLLAR_N`) | neck extended into the jacket |
| top-knot | hand-modelled (`build_bun`) | ellipsoid on the head bone, hair texel |
No weapon: unarmed like the concept (the Trooper/Captain carry the rapier).

## Verified
Front/3-4/back/side renders and close-ups; the real clips FightIdle, Run, AttackMelee01/02, FightHitFront (`04_showcase/gifs/`).
## Not done
Not installed in the game (no cdb/pak change). Hands: skin tone is approximate; jacket texture is the Raider's painted wrinkles under a recolour, so
the braiding is subtler than the concept. Needs a squad/slot decision (see `house_ginaz/units.md`).
Game export would follow the `dsw-new-unit` skill (12_assemble_export -> convert_model -> cdb).

## v2 (2026-10-24 night)
Variant `N3_NeophyteV2` + `08_scripts/23_neophyte_v2_textures.py` -> `03_blender/Ginaz_Neophyte_v2.blend` (v1 `Ginaz_Neophyte.blend` kept).
- Neck: head lowered 4.4 cm + short gold-rimmed stand collar (`head_shift_z`, `COLLAR_N`).
- Chest braiding denser and darker (27 mm bar spacing, loops at both ends of each bar, pale vertical piping at the front edges, gold centre toggles).
- Hand-modelled sash tail (`build_sash_tail`): strip hanging from the belt on the right front, weighted pelvis -> thigh, textured with the sash texel.
- Hands recoloured to the median face skin tone sampled from the head texture.
- Checked in FightIdle, Run, AttackMelee01/02, FightHitFront: tail follows the body, no tearing. GIFs: `02_progress_photos/gifs_v2/`.
