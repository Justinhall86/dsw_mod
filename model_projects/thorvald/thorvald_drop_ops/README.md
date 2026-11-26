# Thorvald drop operations (test)

Source: `thorvald_renegades/HANDOFF.md`, open item 4 (turret drop), widened so one playtest answers more questions.
**Status 2026-11-21: REMOVED from `mod_files/data.cdb`** after the 2026-11-20 playtest (owner: wanted structures dropped, not soldiers).
Removed by `thorvald_drones/08_scripts/20_remove_drop_ops_and_drones.py`; undo with its `--revert`. Still in the installed pak until the next install. Follow-up: `house_thorvald/building_drops_2026-11-21.md`.
(Was: designed yes / built yes / installed yes (pak `be5e5ea375600955`) / tested partly on 2026-11-20.)

Each operation is a mission (`Th_MOp_*`), an ability (`Th_Op_*`, field `thDrop`) and a raid row (`Th_Drop_*`). They use the same path as Iron Landfall C, which worked in the 2026-11-11 playtest.

| Operation | Lands | Question it answers |
|---|---|---|
| Drop: Sniper Nest | 3 `TH_Turret_Sniper` | Does an immobile unit survive a shuttle drop, and does it fire? |
| Drop: Rocket Battery | 2 `TH_Turret_Rocket` | Same, for a heavy weapon squad |
| Drop: Field Depot | 1 `TH_Drone2_Deployed` | Can a unit land already deployed? **Highest risk:** speed 0 plus the landing move order |
| Drop: Thumper Swarm | 3 `TH_Drone1` | Can new drones ride shuttles, and still deploy afterwards? |
| Drop: Black Hull Wave | Iron Landfall company | Do Thorvald's own troops work with `thShip` and `thStagger` (Renegade ships, staggered landing)? Also tests the drop ship fix |
| Drop: Firebase | Nest, Battery, Depot | Do mixed drops work together? |

New units are not recruitable (flag NotBuyable) and have speed 0.1. No vanilla row is edited.

Script: `08_scripts/10_add_drop_ops.py` (`--dry`, `--revert`; backup `07_data_cdb/data_BEFORE_drop_ops.cdb`). Revert this before reverting the drones or the Council and treaty experiments.
Full test list: `house_thorvald/playtest_checklist_2026-11-18.md`.
