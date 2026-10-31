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
| `Th_Special` "Iron Guard" | Incinerator | ThorvaldDemolition (bazooka), MilitaryBazooka - **attack logic is still the Corrino FLAMER** |
| `Th_Elite` "Heavy Vanguard" | Sardaukar | ThorvaldElite (shield + halberd), Gurney; unit's model list set to exactly this model |
| `Th_Frigate` "Thorvald Frigate" | Cronos | VehMOD Thorvald_Frigate, rig RenegadeFrigate (29) - **has no Opening/Closing/Spawn animations**, see below |
Unit names are working names taken from the combat sheet in `house_thorvald/units.md` (names are "being redone").
Characters renamed from `house_thorvald/*.md`: leader Earl Memnon Thorvald (was Shaddam), heroes Karlin Mallenor / Vane Torrver (were Wensicia / Aramsham),
councillors Overseer Jool, Master Silva, Lady Haruka, Adjutant Nobru (were Zum, Mohiam, Fenring, Irulan). Their abilities are still Corrino's.

## Not swapped (no Thorvald equivalent built) - still Imperial looks
Ornithopters, Harvester, Artillery Drone, Hammer (`Th_Ship`), heroes' bodies and portraits, Laza Tiger, missile ship, UI art/emblem/banners/loading screens
(all Corrino's), the HQ model (Corrino capital ship).

## Unverified / things to watch in game
- Whether the engine accepts a 10th faction in faction select (Ginaz loaded as 9th: game.log showed `GinazBase` placed).
- **Frigate deploy:** the Corrino frigate deploys at airfields (abilities `TFrigateDeploy/Leave`, `Opening/Closing/AirfieldIdle` anims of the Chronos rig). Our ship
  has only Run/Idle/FightIdle/Death, so deploying may look wrong or log missing animations.
- **Iron Guard** bazooka body fires the Corrino flamethrower effect.
- Faction bonuses are still Corrino's (Imperial Honor, taxes ...); the design bonuses in `house_thorvald/faction_design.md` (Sovereign Mint, Iron Guard zero-manpower,
  Guild Sub-Contract ...) are NOT implemented. Units still cost Manpower.
- HQ starts with `[Th_Ornithopter]` only (same as Corrino's). Conquest mode untouched.

## Revert
Copy `07_data_cdb/data_BEFORE_thorvald_faction.cdb` over `mod_files/data.cdb`, then `python C:\dsw_mod\D4XEditor\res\repackage.py --quiet --no-launch`
(the previous pak is in `pak_archive/`). The Thorvald frigate edit to `A_Frigate` (see `thorvald_frigate/`) is separate and stays.
