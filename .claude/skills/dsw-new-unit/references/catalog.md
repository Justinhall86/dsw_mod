# Catalog: what is available and what was learned about each donor

Registry = `scripts/units.py` (key -> FBX + texture stem). 21 units registered, Sardaukar deliberately excluded (**never use
Sardaukar parts, models or inputs - the user's standing rule**). Island ids are rank-by-vertex-count and only valid for the
unit they were read from; re-run `02_gallery.py` if a model file changed.

## Donors used for the Ginaz Captain (ids verified)
**Mercenary** (`Smuggler/Unit/Mercenary`, HMD -> TRUE_FBX in `05_fbx_export/`; 2 materials `Mat_Mercenary` + `Mat_Base`, 8.2k tris, 53 joints,
leather mantle + metal plates + blue scarf/cape + baked sword/scabbard + hip pouches). Islands: 20 scabbard/ 38,39,57,58,68,69,... `B_Weapon`
pieces (auto-removed), blue scarf pieces 6, 17, 40, 52, 60, 67; ROOT-weighted pouches/holsters 33, 34, 37, 55, 103; other props 13, 16, 23, 24; metal
plates = auto via `metal=True` (chest 18/19, knees 21/22, elbows, shoulder discs 27/28/78-81/93/94, hand rings, toe caps...). Mantle is the leather coat
the design keeps; the chest plate is the torso surface itself -> needs a fill.
**Bannerjee head** (`Smuggler/Unit/Bannerjee`): white hair + beard, 1.85k tris. Neck tube = island 25 (use it); island 24 = flared nape ring (do not keep).
**Raider tunic** (`Common/Raider`, 2048 textures): torso fill, exclude islands 0, 11, 19, 20 (scarf/sash/pouch).
**Gurney coat tails** (`Gurney`): islands 9, 10, 22, 23 (the green skirt panels, recoloured wine with gold studs/stripe).
**TallSword**: `extr/Character/Ecaz/Weapon/FencerDoubleKnife/TallSword.fbx` (HMD) + `WeaponFencer_*` textures. Also available: Atreide_Sword_01,
AramshamSword, LittleSword, Ecaz SwordKnight/SwordWhitmore, Cerberus/DualSwords animation sets.

## Other recipes already built in `kitbash_explore` (renders in `02_progress_photos/03_variants/`)
| Variant | Base | Removed | Donor head | Verdict |
|---|---|---|---|---|
| V1_DuncanTurban | Duncan | scarf, sash strap, pouches | Marauder turban | mismatched; green apron remains |
| V2_CommandoNoPack | Commando | backpack (4 big + 4 small islands) | Feydakin | clean, but only pack+head differ |
| V3_BannerjeeHooded | Bannerjee | blue scarf | Raider hood | best of the first set |
| V4_MarauderBare | Marauder | scarf, belt, pouches | Otheym | plain |
| V5_MercenaryStripped | Mercenary | cape, scarf, pouches, sword | Bannerjee | -> became the Ginaz line (V5b-e, V6, V6b, V6c) |
| V6_RangerMasked | Ranger (Female01) | baked rifle, hip pouches | HeavyWeapon helmet | good |
| V7_FreeCompanyHooded | Free Company (Female01) | scarf+tail, apron | Raider hood | solid; belt pouches + a knob remain |
| V8_WardenUnmasked | Warden (Female01) | weapon, skirt panels | Otheym | good (black coat = inner layer) |

## Per-unit notes
- Commando: backpack islands separate; belt/holsters inside the pants island.
- Raider / Free Company / Ranger / Warden / HeavyWeaponSquad: many tiny islands (HeavyWeapon 92, biggest 98 verts) -> bbox removal.
- Idualis Trooper: lean, bare-chested, red sash; Otheym: leather + yellow scarf + shoulder pack; Aramsham: bulky armour + red cape.
- Female01 units (FreeCompany, Ranger, Warden, Skirmisher, Drisq, Wensicia, Kulon trooper) share bone names (+ `B_Weapon_L`, toe/thumb J3) with Male01.
  Their `model.rigName` is 1.
- Game stat facts: Warden `A_Elite` 500 hp / 16 power / 8 armor / cost 100 Solari + 50 Manpower, upkeep 20 Solari + 5 CP, squad 4 (Elite parent 5).

## Slots / start spawn
Atreides unit/model ids: `A_Trooper`, `A_Elite` (Warden, taken over), `A_Hero_1` (Duncan), custom `A_LandsraadGuard` (the user's Landsraad guard, in Arrakeen
`startUnits`). Keep all of them intact. List the current custom state any time with a diff of `mod_files/data.cdb` against
`mod_files/data_vanilla_2026-10-22.cdb` (units/models/structures added or changed).

## Ideas not built yet (also `docs/kitbash_ideas.md`)
Heavy-weapon squad without belts (needs region cut), Commando without belt/holsters (UV-region cut), gold braiding + coat edging for the Ginaz
captain (texture paint), longer coat to mid-shin, removing the front pouch/back holster, a short scarf drape to hide the armpit fold, other
houses' palettes (Harkonnen, Corrino, Ecaz...), female-body captains, a second weapon variant (dual swords with the `DualSwords` set).

## Added 2026-10-24 night
- **Ginaz Neophyte** (`model_projects/ginaz_neophyte`): Captain legs/boots + Raider jacket (islands 1, 4, 9, 10, 13-16, 21, 22) + Idualis02 head (exclude islands 5, 8, 21, 22, 25, 26, 33, 34),
  short collar, hand-modelled top-knot and sash tail. Recipes `N2_Neophyte`, `N3_NeophyteV2` in `scripts/03_variants_v2.py`; textures `23_neophyte_v2_textures.py`.
- **Master of Ginaz** (`model_projects/ginaz_master`): Captain recipe + Mercenary cape islands 13, 16 kept; recipe `M1_Master`; textures `30_master_textures.py`.
- **Roster sheet** (`house_ginaz/images/unit_roster.jpg`) lists six units: Neophyte (done), Swordmaster (~the Captain), Sentinel (hood, pouches, knee pads), Guardian (big scarf),
  Skirmisher (face mask, bolero with tassels, cape), Commander (embroidered long coat, bandolier, pouches). Sentinel, Guardian, Skirmisher and Commander are the next candidates.
- New scripts: `12b_assemble_export.py` (generalised export), `14_make_game_package.py` (textures + convert + materials.props + check), `15_new_units_cdb.py` (additive units),
  `22_anim_clips.py` (clips, no weapon), `30_master_textures.py` (embroidery by position).
