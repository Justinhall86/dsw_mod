# House Ginaz as a playable faction (first version: "filled with Atreides") - 2026-10-25

Script: `08_scripts/16_add_ginaz_faction.py` (dry run by default, `--apply` writes `mod_files/data.cdb` after a backup). Backup of the data before this change:
`07_data_cdb/data_BEFORE_ginaz_faction.cdb` (also in `mod_files/backups/`). Installed with `repackage.py --quiet --no-launch` (pak 82.5 MB), game NOT launched by the assistant.

## What changed in data.cdb
- **Atreides restored**: A_Elite (Warden) unit+model are vanilla again; `Arrakeen.startUnits = [A_Ornithopter]`. **The Landsraad Elite (`A_LandsraadGuard`) is a separate project.** The first version of this script wrongly took it out of Atreides and cloned it into Ginaz; that is fixed (2026-10-25): the script never touches, clones or twins it. The LIVE data.cdb currently has no Landsraad Elite unit or sword model (they were removed by that first run and the roster fix); the original rows are in `07_data_cdb/data_BEFORE_ginaz_faction.cdb`.
- **New faction `Ginaz`** (House Ginaz, colour wine 0x7A1F3D) cloned from Atreides: 14 units (`G_*`), 9 models, 52 traits (faction trait `Ginaz`, `Ginaz_HegemonyBonus_1/2`, unit traits, passives),
  3 abilities, developments (`Ginaz_*`, 12), `GinazFremenEmbassy`, `Ginaz_Infiltration`, music row, main-base region `GinazBase`, city structure `GinazKeep` ("Ginaz Enclave"), territory `PlainsOfGinaz`.
- **Characters** (clones of the Atreides ones, new names/descriptions, portraits still Atreides): leader Lord Severin Ginaz (placeholder for the vetoed "Corin"), councillors Chirox, Jool, Aya, Ran,
  heroes Cassian Vos (Duncan clone) and Dorian Vale (Gurney clone, placeholder).
- **Twin pass**: 59 shared rows got Ginaz twins where they list Atreides or an Atreides unit (general hegemony traits, agent needs, infiltration slots, ability/building/mission/treaty filters, domain levels,
  difficulty traits, other factions' diplomacy = war with Ginaz). Atreides rows themselves were NOT changed.
- **Ginaz units**: `G_Elite` = Ginaz Captain (squad 5, Captain model, the Warden slot of the new faction), `G_Trooper` (Ginaz Swordmaster),
  `G_GinazNeophyte` (wheel 11 at first, pos 5 after the roster fix), `G_GinazMaster` (wheel group 0 pos 0; model `N_Ginaz_Master`).
- **Start of game**: `GinazKeep.startUnits = [G_Ornithopter, G_Trooper, G_Elite]` (Ornithopter, Swordmasters, Captains; no Landsraad unit).
- Not touched: Conquest mode (`Conquest.playableFactions` unchanged; Ginaz reuses Atreides' conquest assets), objectives/tutorial/battle/speech rows, UI atlases (emblem, banners, portraits = Atreides').

## Unverified (needs the game)
Whether the engine accepts a 9th playable faction (faction select, AI, map generation placing `GinazBase` as a main base); wheel positions of the Master; all UI shows Atreides art;
trait/ability texts are Atreides text with the names swapped; Ginaz bonuses are still the Atreides ones (see house_ginaz/faction_design.md for the real ones).
Check `game.log` for `[DataCache] Modified data.cdb` and errors.

## Roster fix (2026-10-25, later): `08_scripts/18_fix_ginaz_roster.py`
Backup before it: `07_data_cdb/data_BEFORE_roster_fix.cdb` (also in `mod_files/backups/`). Validated with `cdb_validate.py`: 0 new problems.
- **Removed the Landsraad Elite from Ginaz** (`G_LandsraadGuard`; the model row `N_LR_Elite_Sword` was the Landsraad project's own and was removed with it, original in the pre-faction backup): it is not a House Ginaz unit. Start company is now `[G_Ornithopter, G_Trooper, G_Elite]` (Ornithopter, Swordmasters, Captains).
- **Ranger -> Neophyte**: the Atreides Ranger (`G_Soldier`, rifle) is gone (unit, model, traits `G_Soldier_Trait`, `G_Soldier_Buff`); the Neophyte takes its wheel slot, group 1 pos 5
  (vanilla's group 1 only has positions 0 to 9, so the old slot 11 was probably off the wheel). Dorian's hero buff that targeted the Ranger now targets the Neophyte; `G_Soldier_Debuff` stays because a shared trait refers to it.
- **HQ renamed** "Ginaz Enclave" -> "Ginaz Sword-School" (structure `GinazKeep` and region `GinazBase`); the Captain's description says Sword-School.
- Backfill kept (Atreides art): Heavy Weapon Squad, Support Drone, ornithopters, Hawk, Kraken, Harvester, heroes Cassian and Dorian. The Master is still at group 0 pos 0 (unverified).
- The Landsraad model files in `CharMOD/` are left in the pak, unreferenced.

Applied to `mod_files/data.cdb` only; **the pak was not rebuilt by this change** (run `repackage.py --quiet --no-launch` to install).

## Revert
Restore `07_data_cdb/data_BEFORE_ginaz_faction.cdb` into `mod_files/data.cdb` and run `repackage.py --quiet --no-launch` (the previous pak is in `pak_archive/`).
