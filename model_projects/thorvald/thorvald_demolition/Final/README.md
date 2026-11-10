# thorvald_demolition: final

Version: **v2 (D2)**

Iron Guard: bicep wrap, belt pouches + canisters, copper pauldron rims, armoured shins; library bazooka.

Copies of the final renders (originals stay where they are):

- `Thorvald_Demolition_v2.gif` <- `thorvald/thorvald_demolition/02_progress_photos/03_d2/Thorvald_Demolition_v2.gif`
- `D2_tq.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_d2/D2_tq.png`
- `D2_side.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_d2/D2_side.png`
- `v2_compare.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_d2/v2_compare.png`
- `D2_Demolition_front.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_variants/D2_Demolition_front.png`
- `D2_Demolition_back.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_variants/D2_Demolition_back.png`
- `D2_Demolition_head.png` <- `thorvald/thorvald_demolition/02_progress_photos/03_variants/D2_Demolition_head.png`
- `roundtrip_sheet.png` <- `thorvald/thorvald_demolition/02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png`

## The model

- `model/`: `Thorvald_Demolition_v2.blend` (textures packed), `Male01_ThorvaldDemolition.fbx` (the FBX that was converted)
- `game_files/`: `CharMOD/Male01_ThorvaldDemolition` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Special`, model rows Th_Special, A_Demo, mesh `CharMOD/Male01_ThorvaldDemolition/Prefab_ThorvaldDemolition.prefab`
- Rebuild: 08_scripts 90_export_game_fbx (Blender) -> 91_package_game (props.json from the Landsraad: bazooka clips) -> 93_roundtrip demolition

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
