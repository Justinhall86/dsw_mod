# Thorvald councillors and agents

Status 2026-11-03: **built in `mod_files/data.cdb`, staged in the editor res tree, not yet packed or installed.**

- `08_scripts/10_make_portraits.py`: cuts the figures out of `house_thorvald/images` (GrabCut + feather) and writes five NEW PNG atlases to
  `04_textures/` and `C:\dsw_mod\D4XEditor\res\res\UI\...` (no vanilla atlas is overridden). Progress sheets in `02_progress_photos/01_portraits/`.
- `08_scripts/20_councillors_cdb.py [--apply | --revert]`: the cdb edit. Backup `07_data_cdb/data_BEFORE_thorvald_councillors.cdb`, old rows in
  `07_data_cdb/before_rows.json`.
- Perks and sources: see the status block in `house_thorvald/counsellors.md`. Every attribute is one that vanilla traits use.
- Agents `Th1`..`Th7` (5 male, 2 female) replace Corrino's `C1..C10` for Thorvald; they have no SukDoctor/Mentat/EmperorEye overlays
  (BG1/BG2 and AnalyticsMachine also have fewer than 2 overlays in vanilla).

Open: not seen in game. Check in a new game: council screen portraits, perk tooltips (the `[Thorvald-adjective]` token and
`::s_percent::` placeholders), agent portraits in the spying screen. Karlin's portrait cell is still Corrino's.
