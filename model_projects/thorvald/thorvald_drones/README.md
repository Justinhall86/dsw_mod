# Thorvald test drones: TH_Drone1 to TH_Drone5

Owner request 2026-11-16: five plausible drones for House Thorvald, in the game for testing; not leaning on the forge / alloy / iron
theme; a deploy ability wanted; ideas may be taken from the faction frigates.

**Status 2026-11-21: only the Spotter Drone `TH_Drone3` remains.** Thumper, Quartermaster, Signal and Smoke-Layer were removed from
`mod_files/data.cdb` after the 2026-11-20 playtest (owner didn't like them) by `08_scripts/20_remove_drop_ops_and_drones.py` (`--revert` restores;
backup `07_data_cdb/data_BEFORE_remove_drops_drones.cdb`). Still in the installed pak until the next install. Results: `house_thorvald/playtest_results_2026-11-20.md`.
Rebuild with `py -3.14 model_projects/thorvald/thorvald_council_treaty_tests/08_scripts/20_build_pak.py --install` (keeps the uninstalled Sworn Sword 2.1 model out of the pak).

Data only. Every drone reuses a vanilla drone model and its effects, so they look like other houses' drones for now. No vanilla row is edited.
They are unlocked through the test trait `Th_TestFreeArmy` (`Unlock_TUnit_Force`), so they exist only while Thorvald test mode is on.
The existing Artillery Drone `TH_Drone` is untouched.

## The five

| Unit | Name | Look (donor row) | What it does | Idea taken from | Built from |
|---|---|---|---|---|---|
| `TH_Drone1` (+ `_Deployed`) | Thumper Drone | Harkonnen probe (`H_Drone`) | **Deploy.** Cheap, unarmed. Deployed, it cannot move and attracts sandworms (`vibrationsFactor` 40). Park it under an enemy army, pack up before the worm comes | The Artillery Drone's "attracts sandworms when deployed" (`vibrationsFactor` 10), turned into the purpose | abilities `ThDrone1Install` / `ThDrone1Leave` (copies of `TDroneInstall` / `TDroneLeave`) |
| `TH_Drone2` (+ `_Deployed`) | Quartermaster Drone / Field Depot | Smuggler scavenging drone (`S_Drone`) | **Deploy.** Deployed, other allied military units at Medium range gain +150 supply gain and recover Life anywhere (`Th_Drone2_Buff`) | Cronos frigate: "Airfield Configuration" deploy and Deck Engineers (`SafeRegen_AlwaysActive`); Renegade drone supply aura | `ThDrone2Install` / `ThDrone2Leave`; aura `AllyArmies_AtTRange2_GainTTrait` |
| `TH_Drone3` | Spotter Drone | Renegade drone | Enemy units at Medium range and flying enemies at Long range are Marked: +15% damage received. Fast recon | Harkonnen probe's enemy aura + Cronos frigate's anti-air "Disoriented" | `Entity_GiveTTrait_UnitAtWar_AtTRange2`, `Entity_GiveTTrait_AerialUnitAtWar_AtTRange2` |
| `TH_Drone4` | Signal Drone | Vernius resonance drone (`V_Drone`) | **Toggle.** Rally Signal: Thorvald infantry at Medium range +15% damage. Jamming Signal: enemy infantry at Medium range -25% attack speed. One at a time | Ecaz Monument frigate's two songs | abilities `ThDrone4_Rally` / `ThDrone4_Jam` (copies of `EFrigate_WarAnthem` / `EFrigate_Lullaby`) |
| `TH_Drone5` | Smoke-Layer Drone | Atreides support drone (`A_Drone`) | Enemy infantry at Short range move 35% slower. **Ability Smoke Burst:** for half a day, enemy infantry at Medium range also lose 40% attack speed; the drone itself moves at half speed | Smuggler Wraith frigate's gas and Toxic Purge | ability `ThDrone5_Burst` (copy of `ToxicPurge`) |

Costs: 150 / 400 / 250 / 350 / 300 Solari; upkeep 10 Solari, 3 Fuel Cells, 3 Command Points each (free in test mode). No equipment slots.
Gamepad wheel: group 0, positions 2 to 6 (Sworn Sword has 1).

## Rows added (script `08_scripts/10_add_drones.py`, `--dry`, `--revert`)
- Units (after `TH_Drone_Deployed`): `TH_Drone1`, `TH_Drone1_Deployed`, `TH_Drone2`, `TH_Drone2_Deployed`, `TH_Drone3`, `TH_Drone4`, `TH_Drone5`.
- Traits (after `Th_Drone_Trait`): `Th_Drone1_Trait`, `Th_Drone2_Trait`, `Th_Drone2_Depot`, `Th_Drone2_Buff`, `Th_Drone3_Trait`, `Th_Drone3_Debuff`,
  `Th_Drone4_Trait`, `Th_Drone4_Rally`, `Th_Drone4_Jam`, `Th_Drone4_Rally_Buff`, `Th_Drone4_Jam_Debuff`, `Th_Drone5_Trait`, `Th_Drone5_Debuff`, `Th_Drone5_Choke`, `Th_Drone5_Buff`.
- Abilities (after `TDroneLeave`): `ThDrone1Install`, `ThDrone1Leave`, `ThDrone2Install`, `ThDrone2Leave`, `ThDrone4_Rally`, `ThDrone4_Jam`, `ThDrone5_Burst`.
- `Th_TestFreeArmy`: five `Unlock_TUnit_Force` lines.

## Checks
- `engine_preflight.py`: 0 fail. `stage_and_pack` asset check: every path is vanilla or staged.
- `cdb_validate.py`: 175 NEW (was 162). The 13 new lines are "missing file" for vanilla FX paths copied from the donor drone rows;
  the vanilla donors get the same lines in the baseline, and the pak asset check finds the files.

## Unknowns to watch in the test (none of this is confirmed in game)
1. Do the five drones show in the recruit list? No extra Thorvald unit beyond the standard types has been confirmed in game.
2. Deploy on a non-artillery drone model: does the swap work without a deploy animation (Thumper, Quartermaster)?
3. Thumper: does `vibrationsFactor` 40 really bring a worm, and how fast? The base `Drone_Trait` sets vibration generation to 0; the deployed Corrino drone works the same way, so it should carry over.
4. Signal Drone: the toggle abilities are copies of the Monument's; the Monument also fires a model event (dropped here). Does the switch work, and does the first signal start active?
5. Smoke Burst: the copied buff has `aiArmyPowerMultiplier` 2; harmless but untuned.
6. Spotter uses the Renegade drone row (its flags NoControl + NotBuyable were cleared). Is it controllable and buyable?
7. The AI gets no weights for these units (`aiWeights` empty), so an AI Thorvald should not build them.

## Undo
`python 08_scripts/10_add_drones.py --revert` (backup `07_data_cdb/data_BEFORE_drones.cdb`), then rebuild the pak.
Order matters: the drones were added after the Council/treaty experiments, so revert the drones before reverting any of those.
