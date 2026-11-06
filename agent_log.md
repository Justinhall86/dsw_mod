# Agent log

Changes made by Claude in this repo, newest first. Each entry says what changed, where, and how to undo it.

## 2026-11-03: House Thorvald councillors, portraits and agents

Status: built in `mod_files/data.cdb` and staged in the editor res tree. **Not packed or installed, not seen in game.**

### data.cdb (`mod_files/data.cdb`)
Edited by `model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py`. Compared with the cdb just before the edit, only these rows changed:

| Sheet | Rows | Change |
|---|---|---|
| `character` | `Nobru`, `ThEin`, `Silva`, `Haruka` | New portraits (`gfx`, `images.menuGfx`, `images.tutoGfx`), new `desc`, `title`. Silva `gender` 1 → 0. AI domain: Nobru Statecraft, Silva Economy (Ein and Haruka unchanged). |
| `trait` | `NobruPassive`, `ThEinPassive`, `SilvaPassive`, `HarukaPassive` | New name, icon and attributes (below). |
| `agent` | `Th1`..`Th7` | **Added** after `C10`: 5 male, 2 female, no trait overlays, `need` = Thorvald only. |
| `agent` | `C1`..`C10` | Thorvald removed from their `need.factions`; they are Corrino-only now. |

Perks (every attribute is one that vanilla traits already use; no hlboot patch needed):

| Councillor | Trait name | Attributes |
|---|---|---|
| Nobru | Market Patronage | `FreeVotes_Resolution_Flat` 20; `CMarket_Share_BuyPrice_MRatio` 0.85 |
| Ein | Academy Doctrine | `Army_TResUpkeep_MRatio` 0.9 (Solari); `Army_SpawnExperienceLevel_Flat` 1; `FactionArmy_InZoneWithOperation_Armor_Flat` 1 |
| Silva | Supply Line Optimization | `Building_Village_TResCost_MRatio` 0.85 (Plascrete); `Building_ConstructionSpeed_ARatio` 0.2; `Building_TRes_Upkeep_MRatio` 0.8 (Solari) |
| Haruka | Corporate Espionage | `TRes_ProdPerInfiltrationLevels_Flat` 1 (Influence) and 1 (Intel); `Mission_PreparationTime_MRatio` 0.75; `Mission_Cost_MRatio` 0.85 |

Not built: the Active perks from the concept screen (Sabotage Network, Market Manipulation, Hammer Brief). No active slot was found.

Checks run: `cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb` = 0 NEW problems; `engine_preflight.py` = 0 fail (7 existing warnings); `deploy_pak.py --dry-run` = 312 files in the pak match the staged res folder, nothing installed.

### New files
- `model_projects/thorvald/thorvald_councillors/` (new project folder):
  - `SPEC.md`
  - `08_scripts/10_make_portraits.py` and `portrait_lib.py`: cut the figures out of the concept art (GrabCut + feather)
  - `08_scripts/20_councillors_cdb.py`: the cdb edit (dry run by default; `--apply`, `--revert`)
  - `04_textures/`: the five PNG atlases
  - `02_progress_photos/01_portraits/`: preview sheets (`council_menu_row.png`, `council_tuto_row.png`, `agents_big.png`)
  - `07_data_cdb/`: `data_BEFORE_thorvald_councillors.cdb` and `before_rows.json` (old rows, used by `--revert`)
- Staged in `C:\dsw_mod\D4XEditor\res\res\UI\` (new files only; no vanilla atlas overridden):
  - `Faction/councillors_thorvald.png` (4 x 128 px icons)
  - `Faction/Menu/menuCouncilorsThorvald.png` (4 x 336x624)
  - `Faction/Menu/councillorsThorvald.png` (4 x 180x320)
  - `spying/agents/agents_thorvald.png` (80 px) and `agents_thorvald_big.png` (240 px)
- Backup: `mod_files/backups/data_before_thorvald_councillors_20261103_214518.cdb`
- `C:\dsw_mod\D4XEditor\res\res.compressed1.pak` was rebuilt by the pak dry run. It is a build artifact in the editor folder; the game folder was not touched.

### Portrait sources (`house_thorvald/images/`, not modified)
- Nobru, Silva, Haruka: `councillors_banner_portraits.jpg`
- Ein: `council_male_military_cape.jpg`
- Agents: banner Jool bust, `council_male_robe_gold_pattern.jpg`, `council_male_black_copper_jacket.jpg`, `council_male_dark_coat_gold_chain.png`, `council_male_grey_beard_sword.png`, `council_female_blue_coat.jpg`, `council_female_black_abaya.jpg`

### Docs edited
- `house_thorvald/counsellors.md`: status block with the built perks
- `house_thorvald/image_index.md`: section listing which images became portraits

### Memory
- Added `thorvald-councillors-status.md` and its line in `MEMORY.md` (outside the repo, in the Claude memory folder).

### Open items
- Test in a new game: council screen portraits, perk tooltips (`[Thorvald-adjective]` token, percent placeholders), agent portraits in the spying screen.
- Banner busts are about 210 px wide and upscaled 1.6x; higher-resolution originals would sharpen them.
- Karlin (hero) still uses a Corrino portrait cell.
- Agents have no Mentat/Suk Doctor overlays.
- To package: `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch`.

### Undo
`python model_projects/thorvald/thorvald_councillors/08_scripts/20_councillors_cdb.py --revert` restores the old character, trait and `C1`..`C10` rows and removes `Th1`..`Th7`. The staged PNGs can stay or be deleted from `res\res\UI\`.
