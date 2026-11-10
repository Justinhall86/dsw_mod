# thorvald_ranged: final

Version: **v2 (R5)**

Iron Ranger: no pauldrons, ochre plate, bicep wrap, Soldier legs, back pouches; library sniper.

Copies of the final renders (originals stay where they are):

- `Thorvald_Ranged_v2.gif` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/Thorvald_Ranged_v2.gif`
- `v2_tq.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/v2_tq.png`
- `v2_front.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/v2_front.png`
- `v2_back.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/v2_back.png`
- `v2_side.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/v2_side.png`
- `v2_closeup.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/v2_closeup.png`
- `R5_sheet.png` <- `thorvald/thorvald_ranged/02_progress_photos/04_boots_pouches/R5_sheet.png`
- `roundtrip_sheet.png` <- `thorvald/thorvald_ranged/02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png`

## The model

- `model/`: `Thorvald_Ranged_v2.blend` (textures packed), `Male01_ThorvaldRanged.fbx` (the FBX that was converted)
- `game_files/`: `CharMOD/Male01_ThorvaldRanged` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Soldier`, model rows Th_Soldier, A_Soldier, mesh `CharMOD/Male01_ThorvaldRanged/Prefab_ThorvaldRanged.prefab`
- Rebuild: 08_scripts 90_export_game_fbx (Blender) -> 91_package_game (props.json from the Smuggler Scout: Sniper clips) -> 93_roundtrip ranged

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
