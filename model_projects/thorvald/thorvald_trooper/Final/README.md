# thorvald_trooper: final

Version: **v13 (T14)**

v11 bulk + flat chest, no lip; library katana.

Copies of the final renders (originals stay where they are):

- `Thorvald_Trooper_v13.gif` <- `thorvald/thorvald_trooper/02_progress_photos/01_versions/gifs/Thorvald_Trooper_v13.gif`
- `T14_Trooper_back.png` <- `thorvald/thorvald_trooper/02_progress_photos/03_variants/T14_Trooper_back.png`
- `T14_Trooper_front.png` <- `thorvald/thorvald_trooper/02_progress_photos/03_variants/T14_Trooper_front.png`
- `T14_Trooper_head.png` <- `thorvald/thorvald_trooper/02_progress_photos/03_variants/T14_Trooper_head.png`
- `T14_Trooper_tq.png` <- `thorvald/thorvald_trooper/02_progress_photos/03_variants/T14_Trooper_tq.png`
- `v13_flat_chest_compare.png` <- `thorvald/thorvald_trooper/02_progress_photos/01_versions/stills/v13_flat_chest_compare.png`
- `roundtrip_sheet.png` <- `thorvald/thorvald_trooper/02_progress_photos/game_ready_roundtrip/roundtrip_sheet.png`

## The model

- `model/`: `Thorvald_Trooper_v13.blend` (textures packed), `Male01_ThorvaldTrooper.fbx` (the FBX that was converted)
- `game_files/`: `CharMOD/Male01_ThorvaldTrooper` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Trooper`, model rows Th_Trooper, A_Trooper, mesh `CharMOD/Male01_ThorvaldTrooper/Prefab_ThorvaldTrooper.prefab`
- Rebuild: 08_scripts 90_export_game_fbx (Blender) -> 91_package_game -> 93_roundtrip trooper (converted 2026-11-08 on the D: PC)

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
