# Kitbash explore - removals + head swaps (no Sardaukar)

Exploration of kitbashes that REMOVE parts (backpack, scarf, belt, pouches) as well as graft a donor head,
so results are not just the average of two units. All bodies are Male01 on the shared rig.

| Variant | Base body | Removed (base component ids) | Donor head |
|---|---|---|---|
| V1_DuncanTurban | Duncan | scarf, scarf tail, strap, 2 pouches, ponytail pieces | Marauder (turban + face wrap) |
| V2_CommandoNoPack | Commando | backpack (4 big + 4 small comps) | Feydakin (hair + breather mask) |
| V3_BannerjeeHooded | Bannerjee | blue scarf + knots/strip | Raider (hood wrap + mask) |
| V4_MarauderBare | Marauder | red scarf, belt strap, 2 pouches | Otheym (hair + beard) |
| V5_MercenaryStripped | Mercenary | cape, scarf, pouches, strap, baked-in sword | Bannerjee (white hair) |
| V5c_MercenaryFabric | Mercenary | V5 removals + EVERY metal piece (auto, MetallicGlossAO red > 0.5 on >= 60% of an island) | Bannerjee; torso filled with the Raider's tunic |
| V5d_MercenarySkin | Mercenary | same | Bannerjee; torso filled with Idualis02's bare chest (scarf + strap/ring excluded) |
| V6_RangerMasked | Ranger (Female01) | baked-in rifle, hip pouches | HeavyWeaponSquad helmet |
| V7_FreeCompanyHooded | Free Company (Female01) | scarf + long tail, blue apron | Raider hood wrap + mask |
| V8_WardenUnmasked | Warden (Female01) | baked-in weapon, green skirt panels | Otheym (hair + beard) |

- Survey of 16 units: `02_progress_photos/01_survey/` (front/back sheets). Component galleries (id, verts, bone):
  `02_progress_photos/02_components/<Unit>_parts.png`. Variant renders + sheets: `02_progress_photos/03_variants/`.
- `.blend` per variant in `03_blender/`.
- Scripts: `08_scripts/01_survey.py`, `02_gallery.py`, `03_variants.py` (edit the VARIANTS dict), `units.py`.
- Head = faces whose vertices are all dominated by `B_HeadJ`; component ids come from `dsw_parts.components` (rank by vertex count).
- Metal map: `08_scripts/04_metal_map.py <Unit>` paints metal faces red (`02_progress_photos/04_metal/`). On the Mercenary the
  chest plate WAS the torso surface, so removing it leaves a hollow body - `fill` in `03_variants.py` grafts a donor's torso
  (faces dominated by spine/clavicle/neck bones) on the shared rig to close it.
- Baked-in weapons (bone `B_Weapon` / `B_Scabbard`) are removed automatically by `03_variants.py`.
- `units.py` locates files by NAME under `model_inputs` (the user reorganises those folders); Ranger/Warden/HeavyWeapon/Mercenary
  are HMD files named `.fbx`, converted copies are in `05_fbx_export/`.
- Rough spots: V5 keeps a small blue shard on the chest; V7 keeps the belt pouches and a grey knob at the hip; V8's coat is
  black where the green skirt panels were removed (inner layer shows).
- Other rough spots: thin mask ties/straps float beside the ear on V1/V4; Marauder's inner collar reads pale.
- Not game-ready (no HMD/data.cdb). Sardaukar parts are deliberately never used.

## Duncan x Commando (no pack, no neck wrap): `03_blender/Duncan_Commando.blend`

Commando body with Duncan's head, and BOTH scarves gone. `08_scripts/05_duncan_commando.py` (`--cut 1.62 --drop 0.065`).

- Commando backpack: 8 components removed (gallery ids 4-7, 41-44).
- Commando's "scarf" is three things: the cowl (top of the vest component, cut above z 1.62), the face mask +
  neck collar (its `B_HeadJ` faces, gone with the head swap) and a small ring of SpineTop/Neck01-weighted pieces that
  stays attached to the head until the head is cut (found by size/height AFTER the head cut, 83 verts).
- Duncan donor: only his `B_HeadJ` faces + his Neck01 ring (the dark undershirt collar); his scarf (a separate
  component) is never imported. The head+neck is seated 6.5 cm lower so the neck sits in the vest opening.
- Renders: `02_progress_photos/05_duncan_commando/` (`full.png`, `neck.png`); probe of the cowl cut heights in `04_scarf_probe/`.
- Rough spots: Duncan's dark neck collar reads brown against the Commando's black; vest top edge is a straight cut.

### Neck fill: collar donors (`--collar gurney|houseguard|aramsham --cdrop 0.035 --cscale 0.96`)

With the scarf gone the neck was an open hole, so a rigid collar from another unit was grafted on (own material, own
skin weights, same rig). Candidates were found with `06_collar_probe.py` (renders every neck-height component of 12 units
alone: `02_progress_photos/06_collar_probe/collars.png`).
- **houseguard** (kept): HouseGuard's grey-silver gorget (comps 16/17). Matches the Commando's silver trim; `03_blender/Duncan_Commando_houseguard.blend`.
- gurney: dark collar with a grey plate; still carries Gurney's green + gold gems (needs the black recolour), `..._gurney.blend`.
- aramsham: tall gold collar; too big and gold for this palette, `..._aramsham.blend`.
- The Imperial Trooper's gold-rimmed collar was probed but not built. Scarf-type neck pieces (Duncan, Marauder, Feydakin, Otheym, Raider, Militia, Bannerjee) were skipped on purpose.

### v2: `03_blender/Commando_GurneyHead_v2.blend` (current best)

`05_duncan_commando.py -- --head Gurney --collar houseguard --albedo 04_textures/Commando_NoPack_Albedo.png --cdrop 0.035 --cscale 0.96 --cut 1.58 --name Commando_GurneyHead_v2`
- Head: Gurney (short hair, no ponytail) + his dark neck collar replaces Duncan, whose ponytail clashed with the collar/back.
- Back: the vest's back shell was never properly painted in vanilla (the backpack covered it), so it sampled a pale strip.
  `08_paint_vest_back.py` repaints only those UV triangles (from `07_dump_back_uv.py`) to charcoal, keeping the shading.
- Chest: vest cut lowered to z 1.58 so the HouseGuard gorget sits on it without the dark wedge showing between its plates.
- Head options compared (Gurney / Bannerjee / Otheym): `02_progress_photos/05_duncan_commando/heads_*.png`; cut/fit trials `try_*.png`.
- Not yet checked in animated poses.

### v3: slimmer gauntlets + boots: `03_blender/Commando_GurneyHead_v3.blend` (current best)

`05_duncan_commando.py -- <v2 args> --arm strip --leg Otheym --tuck 0.13 --name Commando_GurneyHead_v3`
- Probe: `09_limb_probe.py` renders every unit's left forearm/hand and lower leg alone (`02_progress_photos/07_limb_probe/arms.png`, `legs_*.png`). Duncan excluded by rule.
- Arms (options `opt_arms*.png`): strip (kept) = drop the Commando's silver forearm plates + knuckle guards + studs, keep its own dark glove; also tried Feydakin, Atreides Soldier, Imperial Trooper, Militia hands.
- Legs (options `opt_legs*.png`): Otheym (kept) = plain dark-brown leather boots; the Commando pants are cut 13 cm below the boot top so they tuck in, and its knee pads + soles are dropped. Also tried Raider, Militia, Marauder, Atreides Soldier (its staff gets caught by the lower-leg filter - not usable as is).
- Alternative build: `Commando_alt_TrooperMilitia.blend` (Imperial Trooper gloves + Militia boots).
- Not yet checked in animated poses.

## V5e_MercenaryFabric - the user's pick, cleaned up (2026-10-23)

V5c with the circled problems fixed (27 render iterations in `02_progress_photos/05_fix_v5c/`):

- **Shirt poking through the shoulders:** tunic capped at z 1.64 and every tunic vertex outside the Mercenary surface
  pushed 8 mm under it (`clip_inside`: ray from the spine axis, BVH of the base).  Tunic skin weights replaced by the
  UNCUT Mercenary's (`weights_from_base`, Data Transfer nearest-face) so it moves with the mantle.
- **Neck:** mantle collar cut with a plane bisect at z 1.70 (straight edge, no slivers); Bannerjee head now keeps its
  real neck tube (island 25, NOT the flared nape ring 24); nape gap zipped (`stitch_nape`, 20-160 deg only); neck
  extended into the torso (`neck_extend`, front flared, back straight); see-through band behind the neck closed with
  a double-sided skin backing plate (`neck_backplate`); all patches use one plain skin texel.
- Verified: 6 close-up views textured + flat-colour per object, back-face-culled views (the game culls back faces),
  and real clips (Run, AttackMelee01/03).
- **Known issue:** AttackMelee03 frames ~16-21 (arm swung across the chest) fold the tunic under the left armpit.
  The vanilla Mercenary hides the same spot under its blue scarf.  Stripping arm weights made it worse (reverted).

## V6 Ginaz captain (2026-10-24) - reference `ginaz_swordmaster_purple/ginaz_swordmaster_purple.jpg`

- `V6_GinazCaptain` = V5e + Gurney coat tails (islands 9, 10, 22, 23). `V6b_GinazCollar` = V6 + a hand-modelled
  stand-up collar (`build_collar` in `03_variants.py`, params `COLLAR`): double-walled shell z 1.60 -> 1.775 (back) /
  1.755 (sides) / 1.692 (front), hairline front seam, 1.2 cm gold rim; bottom weighted to SpineTop, top 55/45
  SpineTop/Neck. UVs point at an even mantle patch (-> wine) and the big blue scarf patch (-> gold).
- Recolour per body region: `08_uvdump.py` (face -> texture, region, UV polygon) -> `09_ginaz_recolour.py`
  (hue/sat replaced, value kept + compressed; wine coat, dark-wine tunic, plum gloves, dark trousers, leather boots,
  gold trim/studs/rim, near-black hair + beard) -> `10_apply_textures.py` (swap, pack, render).
  Output: `03_blender/V6b_GinazCollar_plum.blend`, textures `04_textures/ginaz_v6b/`, renders `02_progress_photos/06_ginaz/`.
- Do NOT rewire MetallicGlossAO as R/G/B channels for previews: channel layouts differ per unit (Mercenary went metallic).
- Still to do: chest braiding + gold edging (texture paint), longer coat, remove the front pouch / back holster.

## V6c - with the tall sword + animations (2026-10-24)
- Sword: Ecaz `TallSword` (`extr/Character/Ecaz/Weapon/FencerDoubleKnife/TallSword.fbx`, textures WeaponFencer_*),
  converted to `05_fbx_export/TallSword_TRUE_FBX.fbx`. No game file is literally named "tailsword"; this is the
  long basket-hilted rapier the Ecaz Fencer carries.
- Mount: bone `B_Weapon`, grip placed where Duncan's own sword grip sits (rest grip at world (0, 0.03, 0.12), blade -Z).
  The Fencer prefab offsets are for the Female01 Fencer clips; in Duncan's clips they float the sword off the hand.
  On this rig B_Weapon rests at the FEET and the clips carry it into the hand.
- Clips: Duncan FightIdle / Run / AttackMelee01 / AttackMelee02 / Skill (`05_fbx_export/anim/`), script `11_sword_anim.py`.
  GIFs in `02_progress_photos/07_sword/gifs/`, scene `03_blender/V6c_GinazCaptain_TallSword.blend`.

## Installed in the game: Ginaz Captain takes over the Warden slot (2026-10-24)
- **Model**: `06_game_ready/Male01_GinazCaptain/` (= `CharMOD/Male01_GinazCaptain/` in the pak): one skinned mesh, 6 materials
  (Mat_Mercenary, Mat_Base, Mat_Raider, Mat_Gurney, Mat_Bannerjee own recoloured textures `Ginaz*_{Albedo,MetallicGlossAO,Normal}.png`;
  MAT_WeaponEcazFencer = the game's own `Character/Ecaz/Weapon/FencerDoubleKnife/WeaponFencer` textures), 7346 tris, 53 joints
  (Male01 + the Mercenary's 7 whip joints - same as the vanilla Mercenary). The TallSword is BAKED into the mesh, skinned 100%
  to `B_Weapon` (vanilla-style baked weapon), so it needs no prefab weapon. Prefab = Mercenary template minus its hidden Gun.
  Built with `08_scripts/12_assemble_export.py` -> `convert_model.py --vanilla-material ...` (see the command in this session);
  `check_hmd.py`: RESULT OK. Raider textures downscaled 2048 -> 1024. All textures RGBA, alpha 255.
- **data.cdb** (`08_scripts/13_patch_cdb.py`): `model.A_Elite` mesh -> the prefab, `inherit` MilitaryShield -> MilitaryCommon,
  `rigName` 1 -> 0, `scale` 1.2 -> 1.1. `unit.A_Elite`: name "Ginaz Captain"/"Ginaz Captains" + new description, `squadSize` 4 -> 5, move
  sound Shield -> Common, female death -> Common_Death, voices Warden -> Trooper. Stats (500 hp, 16 power, 8 armor), costs, equipment, traits
  UNCHANGED. `structure.Arrakeen.startUnits` += `A_Elite` (existing Ornithopter + A_LandsraadGuard kept).
  A_LandsraadGuard / Landsraad Elite models are untouched.
- **Revert**: the pre-change data.cdb is `07_data_cdb/data_BEFORE_ginaz_captain.cdb` (also `mod_files/backups/data_ginaz_captain_takes_warden_slot_*.cdb`);
  the previous pak is archived in `pak_archive/res.compressed1_20261024_143757.pak`.
- **Not yet seen in the game.** Check: new game -> game.log contains `[DataCache] Modified data.cdb`; 5 captains beside Arrakeen; sword stays in
  hand in idle/run/attack; scale looks right next to a Trooper.

## Project layout after the 2026-10-27 clean-up

**Final: `03_blender/V6c_GinazCaptain_TallSword.blend`** (installed build in `06_game_ready/`, revert cdb in `07_data_cdb/`).
The sections above are the historical log; only the files below still exist.

| Path | Kept |
|---|---|
| `03_blender/` | the final blend; `history/` = V1-V4, V5e, V6 Ranger, V7, V8, Commando_GurneyHead_v3, V6b_GinazCollar_plum |
| `02_progress_photos/` | `00_reference/` (part, collar, limb sheets), `01_versions/` (variant sheets, V5e and Ginaz milestones, showcase stills, Ginaz Captain GIFs, `melee_weapons/` GIFs) |
| `04_textures/` | `ginaz_v6b/`, `v6b_uv_regions.json`, `Commando_NoPack_Albedo.png`, `commando_back_uv.json`, `melee/`, `sword/` |
| `05_fbx_export/`, `06_game_ready/`, `07_data_cdb/`, `08_scripts/` | unchanged |

Deleted: `.blend1` backups, limb/collar probe blends, V5/V5b/V5c/V5d and the other Commando/collar intermediates, V6/V6b non-plum builds, the superseded `ginaz_v6` textures, and every per-iteration render folder (survey, components, fix iterations, frames).
Old paths in the sections above (e.g. `07_sword/gifs/`, `11_melee_weapons/`) now live under `02_progress_photos/01_versions/`.
