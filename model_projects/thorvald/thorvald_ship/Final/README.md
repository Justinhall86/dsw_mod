# thorvald_ship: final

Version: **v6 (formerly f11)**

Ravager host, Hawk wings and belly, twin chin barrels; Hammer rig 21, scale 1.6.

Copies of the final renders (originals stay where they are):

- `thorvald_ship_current.gif` <- `thorvald/thorvald_ship/thorvald_ship_current.gif`
- `v6_final_side.png` <- `thorvald/thorvald_ship/02_progress_photos/v6_final/v6_final_side.png`
- `v6_final_tex_sheet.png` <- `thorvald/thorvald_ship/02_progress_photos/v6_final/v6_final_tex_sheet.png`
- `v6_final_top.png` <- `thorvald/thorvald_ship/02_progress_photos/v6_final/v6_final_top.png`
- `v6_final_tq.png` <- `thorvald/thorvald_ship/02_progress_photos/v6_final/v6_final_tq.png`
- `v6_final_under.png` <- `thorvald/thorvald_ship/02_progress_photos/v6_final/v6_final_under.png`

## The model

- `model/`: `v6_final_tex.blend` (textures packed), `Thorvald_Ship.fbx` (the FBX that was converted)
- `game_files/`: `VehMOD/Thorvald_Ship` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Ship`, model rows Th_Ship, mesh `VehMOD/Thorvald_Ship/Prefab_Thorvald_Ship.prefab`
- Rebuild: 08_scripts 50_export_fbx -> 51_convert_vehicle -> 53_fix_bind (required) -> 52_cdb_edit

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
