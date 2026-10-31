# Atreides test roster — all custom units in one playable faction

Every rebuilt custom unit, put on **Atreides** as a free/instant test roster so they can all be played
and compared side by side. Nothing here is a new design: the bodies/weapons come from their own
projects (linked below); this project only does the export + the data.cdb wiring, and adds the
House Ginaz and Landsraad units that used to live on their own factions.

Play Atreides and you get all eight at once, plus one of each spawned next to the Arrakeen HQ on
turn 1.

## Roster

Four units **take over vanilla Atreides slots** (same id, wheel sector, stats, traits, attacks, voice
lines — only the model row is repointed at our prefab):

| Unit id | Unit | Prefab | Anim set | Wheel | Squad |
|---|---|---|---|---|---|
| `A_Trooper` | Thorvald Trooper | `CharMOD/Male01_ThorvaldTrooper` | `MilitaryCommon` | 1/4 | 5 |
| `A_Soldier` | Thorvald Ranged | `CharMOD/Male01_ThorvaldRanged` | `MilitarySniper` | 1/5 | 5 |
| `A_Demo` | Thorvald Demolition | `CharMOD/Male01_ThorvaldDemolition` | `MilitaryBazooka` | 1/6 | 3 |
| `A_Elite` | Thorvald Elite | `CharMOD/Male01_ThorvaldElite` | `Gurney` | 1/3 | 4 |

`A_Soldier` also takes its stats/traits/equipment/attacks from the Smuggler **`S_Sneak`** (user's
pick) so the mesh's sniper anim set and the combat profile agree — the vanilla Ranger body is
Female01/`MilitaryRifle`, our mesh is a Male01 sniper. Its `inherits` is now `Sniper`, and it keeps
`squadSize 5` / `squadSpacing 1.3`.

Four more units are **new** Atreides rows on the shared "Common" wheel (the faction wheel only has
portrait art for sectors 0–9 and 3/4/5/6 are full):

| Unit id | Unit | Prefab | Anim set | Wheel | Squad |
|---|---|---|---|---|---|
| `A_Ginaz_Captain` | Ginaz Captain | `CharMOD/Male01_GinazCaptain` | `MilitaryCommon` | 0/1 | 5 |
| `A_Landsraad_Elite` | Landsraad Elite | `CharMOD/Male01_LandsraadEliteG1` | `MilitaryLRGuard` | 0/2 | 4 |
| `A_Ginaz_Neophyte` | Ginaz Neophyte | `CharMOD/Male01_GinazNeophyte` | `MilitaryCommon` | 0/4 | 5 |
| `A_Ginaz_Master` | Master of Ginaz | `CharMOD/Male01_GinazMaster` | `MilitaryCommon` | 0/6 | 1 |

`A_Ginaz_Master` inherits **`Elite`**, not `Hero`: a real Hero needs a `character` row (portrait, skill
bar, level-up), and a hero with none of that is not playable. `Elite` gives it the same melee combat
without the character plumbing.

## Free, instant, no prerequisites

- `costs.recruit` and `costs.upkeep` are zeroed (0 Manpower, 0 Solari/CommandPoint upkeep).
- `stats[0].trainingTime = 0.1` (near-instant).
- New trait **`A_ThorvaldTestRoster`** carries `Unlock_TUnit_Force` for all eight units and is
  appended to `faction.Atreides.props.startingTraits`. `Unlock_TUnit_Force` is the ref vanilla uses
  to hand a faction a unit it has no tech for (`Q_StealUnit_Atreides`), so it bypasses every
  building/development gate.
- `structure.Arrakeen.startUnits` = `A_Ornithopter` + one of each of the eight.

## Scripts

| script | what it does |
|---|---|
| `08_scripts/20_export_unit.py` | Blender: joins a unit blend into one skinned mesh, bakes mounted weapons to their bone at 100% weight, caps influences at 3, dumps each material's Albedo/MG/Normal |
| `08_scripts/21_build_thorvald.py` | driver: `python 21_build_thorvald.py trooper\|demolition\|elite\|ranged` → FBX + textures → game package |
| `08_scripts/14_make_game_package.py` | FBX → HMD + textures + prefab + `materials.props` in `D4XEditor/res/res/CharMOD`, then `check_hmd.py` |
| `08_scripts/22_fix_anim_paths.py` | adds the anim-set folders to each package's `props.json` (see trap below) |
| `08_scripts/23_atreides_test_roster.py` | the data.cdb edits; dry run by default, `--apply` writes |

Rebuild everything:

```bash
python 08_scripts/21_build_thorvald.py trooper
python 08_scripts/21_build_thorvald.py demolition
python 08_scripts/21_build_thorvald.py elite
python 08_scripts/21_build_thorvald.py ranged
python 08_scripts/22_fix_anim_paths.py
python 08_scripts/23_atreides_test_roster.py --apply
python /path/to/cdb_validate.py --vanilla ../../mod_files/data_vanilla_2026-10-22.cdb
python C:/dsw_mod/D4XEditor/res/repackage.py --quiet --no-launch
```

## Traps hit while doing this

- **`props.json` animPaths.** `convert_model.py` copies `props.json` from the prefab template
  (`Prefab_SmugglerMercenary`), whose `hmd.animPaths` lists only `/Anim/Male01` +
  Rifle/Pistol/Shield/MissileLauncher. A unit whose anim set lives elsewhere
  (`MilitarySniper` → `/Anim/Male01/Sniper`, `MilitaryBazooka` → `/Anim/Male01/LandsraadGuard_Bazooka`,
  `Gurney` → `/Anim/Male01/Gurney`, `MilitaryLRGuard` → 3 LandsraadGuard folders) has **no source for
  Idle/Run/Attack** and freezes or T-poses. `22_fix_anim_paths.py` patches it per unit. The
  Landsraad Elite package already had this right; the Thorvald ones did not.
- **Missing source maps.** `Thorvald_Demolition_v2.blend` and `Thorvald_Ranged_v2.blend` point at a
  weapon normal map whose file is absent (`Bazooka_Normal.png`, `RavagerLeaderSniper_Normal.png` under
  `weapons/*/source/...`), so `image.copy().save()` raised "does not have any image data".
  `20_export_unit.py` now rescues such a map from `model_projects/weapons/*/textures/` by filename,
  and falls back to a flat normal if there is no copy anywhere.
- **Wheel sector 10/11 does not exist.** `wheel_units_atreides.png` is 10×2 tiles (358 px each), so
  sectors 10 and 11 have no portrait. The four extra units go on group 0 (`Common`) instead.
- **`make_model` must clone the row's own entry** on a takeover, not `A_Trooper`'s, or `A_Elite` loses
  its `radius`/`height` (5.5 / 5.5 vs 4) and the model's click box shrinks.

## Source projects

[thorvald_trooper](../thorvald_trooper/) · [thorvald_demolition](../thorvald_demolition/) ·
[thorvald_elite](../thorvald_elite/) · [thorvald_ranged](../thorvald_ranged/) ·
[ginaz_captain](../ginaz_captain/) · [ginaz_neophyte](../ginaz_neophyte/) ·
[ginaz_master](../ginaz_master/) · [landsraad_elite](../landsraad_elite/)

Weapons: [weapons/](../weapons/) (katana, sniper, bazooka, glaive, tower shield).

## Revert

`mod_files/backups/data_before_thorvald_<timestamp>.cdb` (written by `23_atreides_test_roster.py
--apply`). To undo only the roster, restore that file and `repackage.py`. The CharMOD folders and
their prefabs can stay — nothing vanilla references them.
