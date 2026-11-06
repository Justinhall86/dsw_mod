# House Thorvald as a playable faction (cloned from Corrino) - 2026-10-29

Script: `08_scripts/53_add_thorvald_faction.py` (dry run by default, `--apply` writes `mod_files/data.cdb` after a backup). Same recipe as
`model_projects/ginaz_faction/08_scripts/16_add_ginaz_faction.py`. Backup of the data before this change:
`07_data_cdb/data_BEFORE_thorvald_faction.cdb` (also `mod_files/backups/data_before_thorvald_faction_*.cdb`).
Validated with `cdb_validate.py --vanilla mod_files/data_vanilla_2026-10-28.cdb`: 0 new problems. Installed with `repackage.py --quiet --no-launch`
(pak 152.6 MB, byte-verified, contents re-extracted and checked). **The game was NOT launched.**

## What was created (all in data.cdb)
- Faction `Thorvald` ("House Thorvald", copper 0xB26E3C, initials T) cloned from Corrino: 22 units, 14 models, 54 traits, 6 abilities, 7 combos,
  4 projectiles, 12 developments (`Thorvald_*`), `ThorvaldBasePreview`, `Thorvald_Infiltration`, music row, 7 characters.
  HQ structure `ThorvaldCitadel` ("Thorvald Citadel", the Corrino capital-ship base renamed), region `ThorvaldBase`, territory `ReachOfThorvald`.
- **Ids use the prefix `Th_`** (units/models/combos/projectiles) because `T_` is already taken by existing rows (`T_Drone_Attack`, Tleilaxu traits).
- Twin pass: 60 shared rows (hegemony, treaties, domains, agents, buildings, infiltration, developments ...) got Thorvald elements next to the Corrino ones.
  Every other faction (and Ginaz) is at war with Thorvald by default; Thorvald is at war with Corrino. Ginaz rows were not touched.
- Corrino and the Atreides-slot Thorvald units (`A_Trooper` etc.) are unchanged.

## Unit swaps (models are the LIVE Thorvald models of the Atreides-slot units; stats, traits, combos and costs stay Corrino's)
| Thorvald unit | Was | Model / anim set |
|---|---|---|
| `Th_Trooper` "Thorvald Trooper" | Conscript Swordman | ThorvaldTrooper, MilitaryCommon (same set as Corrino's) |
| `Th_Soldier` "Iron Ranger" | Conscript Rifleman | ThorvaldRanged, MilitarySniper |
| `Th_Special` "Iron Guard" | Incinerator | ThorvaldDemolition (bazooka), MilitaryBazooka, template `Demo` (fixed by script 56) |
| `Th_Elite` "Heavy Vanguard" | Sardaukar | ThorvaldElite (shield + halberd), Gurney; unit's model list set to exactly this model |
| `Th_Frigate` "Thorvald Frigate" | Cronos | VehMOD Thorvald_Frigate, rig RenegadeFrigate (29); deploy ids alias its own clips (script 56), see below |
Unit names are working names taken from the combat sheet in `house_thorvald/units.md` (names are "being redone").
Characters renamed from `house_thorvald/*.md`: leader Earl Memnon Thorvald (was Shaddam), heroes Karlin Mallenor / Vane Torrver (were Wensicia / Aramsham),
councillors Overseer Jool, Master Silva, Lady Haruka, Adjutant Nobru (were Zum, Mohiam, Fenring, Irulan). Their abilities are still Corrino's.

## Not swapped (no Thorvald equivalent built) - still Imperial looks
Ornithopters, Harvester, Artillery Drone, Hammer (`Th_Ship`), heroes' bodies and portraits, Laza Tiger, missile ship, UI art/emblem/banners/loading screens
(all Corrino's), the HQ model (Corrino capital ship).

## Unverified / things to watch in game
- Whether the engine accepts a 10th faction in faction select (Ginaz loaded as 9th: game.log showed `GinazBase` placed).
- **Frigate deploy:** the ship has only Run/Idle/FightIdle/Death clips. Script 56 aliases `AirfieldIdle`, `Opening`, `Closing` and `Idle_Airfield` to them, so there is no real open/close motion. Check in game: the Chronos-tuned `zOffset` -6.7 and effect placement when deployed, and where missiles leave from (`Th_Frigate_Attack` names MuzzleA to MuzzleE; the prefab has MuzzleA and MuzzleB, each with _2 to _4, but no C, D or E).
- **Iron Guard:** now a plain bazooka with no signature trait, and it still shows the Incinerator portrait. Its old flamer trait and debuff rows are unused.
- Faction bonuses are still Corrino's (Imperial Honor, taxes ...); the design bonuses in `house_thorvald/faction_design.md` (Sovereign Mint, Iron Guard zero-manpower,
  Guild Sub-Contract ...) are NOT implemented. Units still cost Manpower.
- HQ starts with `[Th_Ornithopter]` only (same as Corrino's). Conquest mode untouched.

## Plascrete trade (2026-11-04)
`08_scripts/55_plascrete_topbar_trade.py` gives `NobruPassive` a `Convert_TRes_To_TRes2` line: 100 Plascrete for 150 Solari, instantly, from a Convert button in the top bar. Not tested in game.
It has two halves and needs both: the rows in `data.cdb`, and an `hlboot.dat` patched with Quinn's `resource_trades` feature:
`python tool/unpack_quinn.py`, then `python tool/quinn.py build --base <the game's hlboot.dat> --ticks resource_trades --out <file>`, then `python tool/quinn.py install --built <file> --game <D4X folder>`.
A Steam update can replace `hlboot.dat`, which removes the button until the patch is rebuilt.
Script 54 (the Alloy Sale village button) is the data-only fallback; script 55 removed its rows.

**Consignment Terminal (2026-11-05, script 57, untested in game).** The trade now comes from a building, not from Nobru. `Th_ConsignmentTerminal` is a Thorvald-only major
building (one per faction, built like Fremen's Recycling Plant: 1000 Solari + 500 Plascrete, 8 days, upkeep 20 Solari + 10 Water), unlocked from the start by the
`Thorvald` trait. Its `buildingTrait` `TTh_ConsignmentTerminal` holds one Convert line: 100 Plascrete for 150 Solari, 8 Manpower, 24 Intel, 6 Influence or
4 Authority. Quinn's trade code reads lines off a faction's buildings, so the Convert button shows only while a terminal stands. Water and Fuel Cells are left
out: they keep no stock, which needs Quinn's conversion-trait hooks. The AI weight is -5, because the AI cannot use the panel. The look is the Spacing Guild
Branch until the starport in `model_projects/thorvald_starport` is exported. To check in game: whether the line shows while the building is still under construction.
Patched binaries for the current `D:\Steam` game (build 19145763, older than `data.cdb`) are in `mod_files/hlboot_build19145763/`, with rebuild steps in its README.

## Revert
Copy `07_data_cdb/data_BEFORE_thorvald_faction.cdb` over `mod_files/data.cdb`, then `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch`
(the previous pak is in `pak_archive/`). The Thorvald frigate edit to `A_Frigate` (see `thorvald_frigate/`) is separate and stays.
