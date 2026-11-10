# thorvald_frigate: final

Version: **Cruiser, AD7 paint (2026-11-08)**

SpaceCruiserWreck hull, levelled and mirrored; 4 shoulder cannons; matte black + charcoal well, burnt-orange sponsons and flank slopes; Chronos cyan reactor flare. Game files: 06_game_ready/VehMOD/Thorvald_Frigate (+ Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx).

Copies of the final renders (originals stay where they are):

- `close.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/close.png`
- `front.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/front.png`
- `rts.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/rts.png`
- `side.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/side.png`
- `top.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/top.png`
- `tq.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/tq.png`
- `tq_rear.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/tq_rear.png`
- `Thorvald_Cruiser_fly.gif` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/Thorvald_Cruiser_fly.gif`
- `Thorvald_Cruiser_turntable.gif` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final/Thorvald_Cruiser_turntable.gif`
- `MUZZLE_STRIP.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_muzzles_AD7/MUZZLE_STRIP.png`
- `Cruiser_volley_close.gif` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_muzzles_AD7/Cruiser_volley_close.gif`
- `Cruiser_volley_ship.gif` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_muzzles_AD7/Cruiser_volley_ship.gif`
- `rt_tq.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_export_roundtrip/rt_tq.png`
- `rt_side.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_export_roundtrip/rt_side.png`
- `lineup_tq.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_variants/lineup_C3/lineup_tq.png`

## The model

- `model/`: `cruiser_export.blend` (textures packed), `Thorvald_Frigate.fbx` (the FBX that was converted)
- `game_files/`: `VehMOD/Thorvald_Frigate`, `Fx/Vehicle/Ships/Thorvald` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Frigate`, model rows Th_Frigate, A_Frigate, mesh `VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab`
- Rebuild: 08_scripts 80_export_cruiser -> 81_convert_cruiser -> 82_roundtrip -> 83_reactor_fx -> 84_cdb_cruiser (reactor FX row)

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
