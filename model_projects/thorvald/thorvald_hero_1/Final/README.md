# thorvald_hero_1: final

Version: **C1 two swords (the look staged for the game)**

Karlin (TH_Hero_1). The Round 15 helmet (H1/H2) is still open and not exported, so it is NOT in Final.

Copies of the final renders (originals stay where they are):

- `B_foundry_warlord_hero_C1_two_swords_AttackMelee01.gif` <- `thorvald/thorvald_hero_1/02_progress_photos/10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_AttackMelee01.gif`
- `B_foundry_warlord_hero_C1_two_swords_FightIdle.gif` <- `thorvald/thorvald_hero_1/02_progress_photos/10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_FightIdle.gif`
- `B_foundry_warlord_hero_C1_two_swords_Run.gif` <- `thorvald/thorvald_hero_1/02_progress_photos/10_poc_gifs/B_foundry_warlord_hero_C1_two_swords_Run.gif`
- `roundtrip_sheet.png` <- `thorvald/thorvald_hero_1/02_progress_photos/22_game_package/roundtrip_sheet.png`

## The model

- `model/`: `Male01_ThorvaldKarlin_export.blend` (textures packed), `Male01_ThorvaldKarlin.fbx` (the FBX that was converted)
- `game_files/`: `CharMOD/Male01_ThorvaldKarlin` (copy the contents of `game_files/` into `<editor>/res/res/`)
- data.cdb: unit `TH_Hero_1`, model rows Th_Hero_2 (the Corrino clone swapped the two hero model ids: unit TH_Hero_1 uses model row Th_Hero_2) + anim set ThorvaldKarlin, mesh `CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab`
- Rebuild: 08_scripts 50_assemble_export -> 51 -> 52_roundtrip_render; cdb 40_cdb_karlin.py

Registry of all Thorvald models: `house_thorvald/MODEL_REGISTRY.md`.
