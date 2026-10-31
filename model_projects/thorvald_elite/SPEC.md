# House Thorvald Elite (tower shield + glaive): project notes

Reference: `01_input/character_image_sheet.jpg`.  Built from the Demolition body (`D2_Demolition`, itself the Trooper T14); scripts copied from
`thorvald_demolition/08_scripts`, recipes in `03_variants_trooper.py`.

**Current: `03_blender/Thorvald_Elite_v2.blend`** (recipe `E4_Elite` + `weapons/thorvald_towershield` v2 + `weapons/thorvald_glaive`).
v1 (`E3_Elite`) kept.

## v2 (2026-10-28, after the user's review of v1)
- **Pauldrons as one piece** (`pauldron_lames`, `build_pauldron_lames`): v1's lames were copies of the whole plate ("repetition").  Now the plate
  (Trooper size) has two generated lames under it: clean partial cones round the upper arm, covering the plate's own angles, lame 1 just inside
  the plate's lower edge, lame 2 just inside lame 1, each flaring out a little, gunmetal body (the trim atlas's unused `cuff` box repainted
  gunmetal in this project's `04_textures/trim/Trim_Albedo.png`; NOTE trim_layout boxes are measured from the image BOTTOM), copper lip +
  underside, a row of copper rivets on each.  Skin: nearest plate vertex blended 60 % / 85 % to the shoulder bone.
  - Tried and dropped: copying the plate's lowest strip (jagged cut edges -> zig-zag rims), bands traced from the plate's edge per angle (the
    plate edge zig-zags round the arm).
- **Bulkier arms and gloves**: no arm slimming (`arm` 1.0, the Trooper uses 0.80), hands x1.12 (`hand` 1.12).
- **Black goggles** (`goggles`, `build_goggles`): two lens cups (black, copper front ring) seated on the face at z 1.857, x +-0.033, a strap
  round the head; in the head mesh, 100 % B_HeadJ.
- **Shield v2** (layered): bevelled rim, stepped inner frame (the sheet's), emblem in relief (dark disc, gear ring with hole, star), viewing slot
  cut through with a raised frame, 54 bolts, grip + strap bars on the back; 2,810 tris; 2048 px texture with weathering, rust streaks from the
  bolts, gouges.  `shield_shape.py` holds every shape for both the builder and the painter.
- 10,076 tris body; audit 0 problems.  Images: `02_progress_photos/04_e4/` (`v2_compare.png`, `shield_v2*.png`, `Thorvald_Elite_v2.gif`).

## v1
10,256 tris body + shield 112 verts + glaive 1,790 verts; audit 0 problems.

## Body (E3_Elite)
- Demolition body: Trooper cuirass + emblem, right-bicep rust wrap, Mercenary armoured shins + knee caps on Duncan boots (tucked under the
  apron), back belt pouches, copper-rimmed pauldrons.  Dropped: front pouches, belt canisters.
- **Tiered pauldrons** (`pauldron_tiers`, `build_pauldron_tiers`): the shoulder plate (Gurney islands 17, 18, 47, 48, region "pauldron") copied
  twice as lames, each shrunk about the arm axis (x0.90, x0.80) and slid 6 / 12 cm down the upper arm: inside the plate above where they
  overlap, a visible band below it, each lower lame narrower.  Skin = the plate's weights blended 45 % / 80 % toward the shoulder bone.  The
  copper rims (`plate_rims`) run on every lame.
  - E1 (point scale + ray clip from the shoulder) and E2 (full-size lames): the clip rays crossed the plate's long skirt and pushed the lames
    back under it, nothing showed.  Kept in the recipes.
- Images: `02_progress_photos/02_e1/regions_e3_*.png` (geometry), `03_e3/` (stills, clip frames, `Thorvald_Elite_v1.gif`, `e3_compare.png`).

## Weapons (model_projects/weapons)
- **Tower shield** `thorvald_towershield`: hand-modelled (`make_shield.py` + `paint_shield.py`): 0.56 x 1.20 m chamfered slab bent across
  its width, raised worn-copper rim, recessed dark steel face, copper inner line, rust grime, scratches, copper gear-and-star emblem, dark
  viewing slot, grip bar on the back.  No energy.  Gurney's shield was tried first (`candidates/`): with the energy halo and raised
  chevron/boss removed it is a hollow Y-shaped plate, not the sheet's slab.  Mounted like Gurney's (B_Shield, bone_local, rot (-8.2, -2.3, 0.3)).
- **Glaive** `thorvald_glaive`: the Landsraad halberd's shaft (shortened), collar ring, socket and butt cap + a hand-modelled curved blade with
  a back hook + rust grip wrap (`make_glaive.py` + `paint_glaive.py`); 2.21 m.  Mounted like Gurney's javelin (B_Weapon, rot (0, 90, 0)).
- Both are built in the converted FBX's world frame and baked -90 deg about x into the game mesh frame (the importer puts +90 on the object).

## Animation
Gurney's set (javelin + shield): `05_fbx_export/anim/Gurney_{FightIdle,AttackMelee01,AttackMelee02,Run,Skill,AttackRange}.fbx`.  Glaive blade up,
shield along the left forearm, emblem out.  The generic `Shield` set holds the polearm like a sword (horizontal) - not used.
Gurney's set has no Idle / IdleStance / death clips of its own: in game those come from whatever the cdb animation set falls back to (check
before install).  In these previews the Gurney clips face +y, so the "back" camera shows the front.

## About the supplied (Gemini) spec
Useful: tiered massive pauldrons, heavy greaves/boots, tower shield + non-energy forged halberd, rust-orange framing.  Not applicable:
Blender collections / cloth sim / collision capsules / DEF-clavicle rigging (the game plays baked clips on the fixed Male01 rig), a shorter
kama (the sheet's apron is knee length, kept), a "wider, lower stance" (comes from the animation set, not the mesh).

## Not done yet
- Harness straps (diagonal back strap), katana scabbard at the left hip, rivets on the pauldrons, more weathering on the shield.
- Not exported, no data.cdb entry, not installed.

Rebuild: `bash 08_scripts/run_final.sh E3_Elite`, then mount `../weapons/thorvald_towershield` and `../weapons/thorvald_glaive`
(`--remove Thorvald_Katana`) with `../weapons/scripts/mount_weapon.py` -> `03_blender/Thorvald_Elite_v1.blend`.
