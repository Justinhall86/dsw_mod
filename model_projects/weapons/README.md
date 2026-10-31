# Weapons library (shared by all model projects)

One folder per weapon. Each holds the mesh source, its textures, a `weapon.json` (how it mounts, who uses it) and a preview render.
Units take their weapon from here, so a change to a weapon is made once and reused.

| Weapon | Folder | Used by | Source | Preview |
|---|---|---|---|---|
| Thorvald Katana | [thorvald_katana](thorvald_katana/) | House Thorvald Trooper | Atreides sword (`Atreide_Sword_01`, Duncan's prefab sword), blade x1.35 + 3.5 cm curve, hilt x0.72, blade painted black | [preview](thorvald_katana/preview_thorvald_katana.png) |
| Ginaz TallSword | [ginaz_tallsword](ginaz_tallsword/) | House Ginaz Swordmaster (Master of Ginaz), Ginaz Captain | Ecaz Fencer `TallSword` with its `WeaponFencer` textures (stock) | [preview](ginaz_tallsword/preview_ginaz_tallsword.png), [in hand](ginaz_tallsword/check/) |
| Thorvald Sniper | [thorvald_sniper](thorvald_sniper/) | House Thorvald Ranged | Ravager Leader sniper (`RavagerLeaderSniper`), stock / handguard / foregrip rust-ochre, metal gunmetal; on `B_Gun` (`mount: bone_local`) | [preview](thorvald_sniper/preview_thorvald_sniper.png) |
| Thorvald Bazooka | [thorvald_bazooka](thorvald_bazooka/) | House Thorvald Demolition | Fremen Bazooka (the Landsraad Guard's), black-gunmetal tube, rust sections, copper details; on `B_Gun` (`mount: bone_local`) | [preview](thorvald_bazooka/preview_thorvald_bazooka.png) |

| Thorvald Tower Shield | [thorvald_towershield](thorvald_towershield/) | House Thorvald Elite | Hand-modelled to the sheet (Gurney's shield tried first, `candidates/`): chamfered slab, copper rim, gear emblem, no energy; on `B_Shield` (`mount: bone_local`, Gurney's placement) | [preview](thorvald_towershield/preview_thorvald_towershield.png) |
| Thorvald Glaive | [thorvald_glaive](thorvald_glaive/) | House Thorvald Elite | Landsraad halberd shaft / collar / butt + hand-modelled curved blade with back hook, rust grip wrap; on `B_Weapon` (`mount: bone_local`, Gurney's javelin placement) | [preview](thorvald_glaive/preview_thorvald_glaive.png) |

Weapons built by script (shield, glaive) are made in the converted FBX's world frame and baked -90 deg about x into the game mesh frame,
because the FBX importer puts +90 deg on the object and `mount_weapon.py` uses the mesh frame.

## Use a weapon on a unit

```
blender -b <unit.blend> --python model_projects/weapons/scripts/mount_weapon.py -- model_projects/weapons/<weapon> <out.blend> [--remove OldName]
```

The weapon is parented to `B_Weapon`. That bone rests at the feet in the rest pose and the animation clips carry it into the right hand, so the
weapon sits at the feet in a rest-pose render and in the hand in every clip. The rest placement (`rest_grip_world` (0, 0.03, 0.12), blade down
`rot_x_deg` 90, the weapon's own `grip_local`) is the one validated against Duncan's clips and the generic Common clips.
Running it twice does not add a second weapon: an object with the same name (and anything in `--remove`) is deleted first.

For the game the weapon is baked into the body mesh at this rest placement, 100 % weighted to `B_Weapon`
(`12b_assemble_export.py --sword <object>` in the unit projects).

## Add a weapon

1. Convert the game file (an HMD named `.fbx`) with `06_convert_weapon.py` (dsw-model-workshop) into `<folder>/source/`.
2. Copy its textures into `<folder>/textures/` as real PNGs (the game's `.png` files are DDS inside: `PIL.Image.open(p).convert("RGBA").save(...)`).
3. Measure the weapon in its own space (which axis the blade runs along, where the hand holds it) and write `weapon.json`.
4. `scripts/preview_weapon.py <folder> <folder>/preview_<name>.png`, then mount it on a unit and render a clip to check the grip.

## weapon.json keys

`name`, `description`, `mount` (`bone_local` for guns: `rot_deg`, `offset` in the bone's own frame; default = the sword rest placement), `blend` + `object` (a stand-alone weapon blend) **or** `fbx` (a converted game weapon), `textures` (socket -> PNG,
relative), optional `material` (`metallic`, `roughness`), `bone`, `rest_grip_world`, `rot_x_deg`, `grip_local`, `used_by`, `rebuild` / `notes`.

## Scripts

- `scripts/mount_weapon.py`: mount a library weapon on a unit blend.
- `scripts/preview_weapon.py`: render a weapon on its own.
- `thorvald_bazooka/paint_bazooka.py`: the bazooka's Thorvald colours (by hue / saturation on the vanilla albedo).
- `thorvald_sniper/dump_sniper_uv.py` + `paint_sniper.py`: the sniper's Thorvald colours (Blender dump, then system Python).
- `thorvald_katana/make_katana.py` + `paint_katana.py`: rebuild the katana (blade length/curve, hilt size, black blade). Order:
  `blender -b --python make_katana.py` -> `python paint_katana.py` -> `blender -b --python make_katana.py`.
