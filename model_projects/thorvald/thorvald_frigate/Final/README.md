# thorvald_frigate: final

Version: **Cruiser V6, darker gunmetal + matte copper (2026-11-13)**

SpaceCruiserWreck hull, levelled and mirrored; V6 hull shape (wedge sides, rising keel, belly V, pinched prow) at Chronos height (Z x1.39); holes capped / sealed; 4 shoulder cannons with polished lathed barrels; gunmetal with dark plates, matte darker copper sponsons, flank slopes, spine recess and tail box (paint ADRTcd); Chronos cyan reactor flare. Game files: 06_game_ready/VehMOD/Thorvald_Frigate (+ Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx).

Copies of the final renders (originals stay where they are):

- `ANGLES.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/ANGLES.png`
- `BARRELS_before_after.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/BARRELS_before_after.png`
- `front.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/front.png`
- `rts.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/rts.png`
- `side.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/side.png`
- `top.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/top.png`
- `tq.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/tq.png`
- `tq_rear.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_final/tq_rear.png`
- `COMPARE2.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_darker/COMPARE2.png`
- `rt_tq.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_roundtrip/rt_tq.png`
- `rt_side.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_v6_roundtrip/rt_side.png`
- `heights_side.png` <- `thorvald/thorvald_frigate/02_progress_photos/cruiser_final_paint/lineup/heights_side.png`

## The model

- `model/`: `cruiser_export.blend` (textures packed), `Thorvald_Frigate.fbx` (the FBX that was converted)
- `game_files/`: `VehMOD/Thorvald_Frigate`, `Fx/Vehicle/Ships/Thorvald` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Frigate`, model rows Th_Frigate, A_Frigate, mesh `VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab`
- Rebuild: 08_scripts 88_lock_v6 -> 90_fix_gaps_barrels -> 91_fix_normals -> 93_seethrough_fix (cruiser_v6_sealed.blend) -> 80_export_cruiser -> 81_convert_cruiser -> 82_roundtrip -> 83_reactor_fx -> 84_cdb_cruiser (reactor FX row)

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
