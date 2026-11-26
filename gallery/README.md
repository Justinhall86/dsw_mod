# Gallery: look at pictures here

One place for reference sheets, part surveys, helmet/head catalogues and current-look sheets. Open the PNGs directly;
nothing here needs to be re-rendered to look at it. **Claude: look here first before rendering a survey or sheet, and
write new survey/reference sheets into the matching folder below** (not into `model_projects/<unit>/02_progress_photos`).
Unit progress photos, variants and turntables stay in the unit's own `02_progress_photos`.

| Folder | What is in it | Start with |
|---|---|---|
| `helmets_and_heads/` | Every helmet and headgear in the game, plus our own | `helmet_sheet_1_vanilla.png` (18 vanilla), `helmet_sheet_2_thorvald.png` (kasa hat, Karlin H1/H2/H2f4, Sworn Sword dome and half-mask) |
| `helmets_and_heads/reference_concepts/` | Owner concept art: Vanguard samurai 6-angle sheet, Ronin helm painting | `vanguard_samurai_concept_sheet.jpg`, `ronin_helm_concept.jpg` |
| `helmets_and_heads/house_guard_study/` | House Guard helmet (= Harkonnen Elite model): 12 angles, six recolours (H1-H6), and the antenna + breather version (`antenna_breather/`) | `vanilla_all_angles.png`, `recolour_compare.png` |
| `helmets_and_heads/warden_study/` | Warden (Atreides Elite) helmet reworked for the Heavy Vanguard: W1-W5c, faction lineup, House Guard comparison | `warden_variants.png`, `lineup/faction_lineup.png` |
| `helmets_and_heads/warden_study/samurai/` | Heavy Vanguard samurai pass (2026-11-15): Warden S01-S12, Sworn-dome kabuto D/E/F (horns, spike halo, kasa shikoro), owner's reference pictures | `F01_big_kabuto_all_angles.png`, `faction_lineup_samurai.png` |
| `helmets_and_heads/vanilla_head_renders/` | Front + three-quarter close-up of each head (33 vanilla, 15 Thorvald; includes bare heads) | `<Unit>_front.png`, `<Unit>_tq.png`; `all_heads.py` and `custom_heads.py` made them (Blender, edit the paths at the top) |
| `helmets_and_heads/trooper_reference_sheets/` | `heads_sheet.png` (12 bare/helm heads), hat extract, per-unit part sheets, Meshy sheet | `heads_sheet.png` |
| `helmets_and_heads/sworn_sword_head_survey/` | Head donors tried for the Sworn Sword | |
| `helmets_and_heads/karlin_helmet_compare/` | Karlin helmet H1 vs H2 vs H2f4 and per-part galleries | `compare_helmets.png` |
| `parts_by_unit/vanilla_unit_parts_sheets/` | Every part of each vanilla unit with its id (torso, pauldrons, arms, legs, collars, belts): Commando, Duncan, Gurney, Raider, Marauder, Militia, Feydakin, Ranger, Warden, House Guard, Imperial Trooper, Aramsham, Mercenary, Otheym, Bannerjee, Free Company, Heavy Weapon | `<Unit>_parts.png` |
| `vehicles/` | Frigate donor/hull/wreck surveys (every donor ship), Ravager vanilla/recolour views | `frigate_donor_survey/` |
| `buildings/` | Building survey sheets and GIFs, starport kitbash donors, HQ outpost parts | `building_survey_sheets/survey_sheet.png` |
| `units_current/` | Sheets of the current in-game ground units (latest palette) | `ground_units_v6_sheet.png` |

## Not copied here (find them elsewhere)

- Weapons: `model_projects/weapons/` (`README.md` is the index with renders).
- Final models per unit: `model_projects/<unit>/Final/` and `house_thorvald/MODEL_REGISTRY.md`.
- Mood/reference art: `references/`, `art/`, `house_thorvald/images/`, `house_ginaz/images/`.
- Landsraad Elite and Ginaz surveys stay in their own projects (separate projects; not moved).
- Donor FBX/blend working data (e.g. `thorvald_hero_1/05_fbx_export/helmet_donors`) stays with its scripts: it is input data, not pictures.

## Adding to the gallery

Save new sheets in the folder above that fits (create a sub-folder per topic). Scripts that already write here:
`head_survey.py` (trooper/ranged/demolition/dsw-new-unit skill), `thorvald_hero_1/08_scripts/60-62_helmet_*.py`,
`thorvald_buildings/08_scripts/10_survey_render.py`, `thorvald_hq/08_scripts/11_lineup.py`,
`thorvald_starport/08_scripts/20_parts_sheet.py`, `sentinal/08_scripts/21_contact_sheet.py` (reads `vehicles/ravager_reference_views`).
Still open (not found yet): hands/gloves and boots sheets; add them under `parts_by_unit/` when made.

History: the folders were moved here (git mv) on 2026-11-14 from the unit projects' `02_progress_photos/`
(`00_reference`, `01_survey`, `02_head_survey`, `10_kitbash_donors`, `donor_survey`, `hull_survey`, `wreck_survey`, `30_helmet`).
Scripts with a fixed old path (frigate `30_grid_survey.py`/`31_grid_overlay.py`, sworn `04_head_survey.py` which takes an out dir) should be given the gallery folder.
