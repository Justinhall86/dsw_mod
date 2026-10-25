# Vanilla mechanics scan (for House Ginaz)

Read-only scan of the game data (`mod_files/data.cdb`). First pass 2026-10-24; **revision 2 on 2026-10-25** re-verified every claim against the data and
widened the scan. Nothing in the game or the mod was changed.

| File | What it is |
|---|---|
| [VANILLA_MECHANICS_FOR_GINAZ.md](VANILLA_MECHANICS_FOR_GINAZ.md) | **Start here.** 26 entries with ids, exact values, a Ginaz use, fit and caveats. **Opens with a table of what revision 1 got wrong.** Bundles at the end. |
| [candidates.json](candidates.json) | The same 26 entries machine-readable, with `correction` notes and the revised bundles. |
| `catalog_factions.md`, `catalog_abilities.md`, `catalog_traits.md`, `catalog_systems.md` | Generated catalogues (`01_catalog.py`). Unchanged by the revision. |
| `02_verify.py` to `06_verify5.py` | Read-only scripts that dump the raw records behind each correction. |
| `verify_dump.txt` to `verify_dump7.txt` | Their output. `verify_dump3.txt` has all 177 Conquest `bonus` records in one line each. |
| `scan_lib.py` | Shared read-only loader. |

## What changed in revision 2
- Corrected: Corrino war "grudge" (direction was backwards), Evasion execute (unconditional, not 1 %), Plot_Assassination (a penalty), Vow of Honor target, Last Stand, Bloodthirsty range, Executioner scaling, Whitmore's skill cost.
- Found that Political Duel, Plots and Assassin School are **Conquest** bonuses (the `bonus` sheet is the Conquest reward pool).
- Added: the Ecaz **Fencer** (Deadly Dance), the Squire kit, **Rivvy**, the Atreides "Ginaz Swordmasters" and "Ginaz Schools" XP bonuses, the `GinazSwordmasters` quest, and the Kanly game-mode multipliers.
- Confirmed the scanned file matches vanilla except for `A_Elite` (the Ginaz Captain), `A_LandsraadGuard`, four models and `Arrakeen`, by diffing against `data_vanilla_2026-10-22.cdb`.

## Caveats
- The data says what a mechanic is, not how it plays. Test each one in game before relying on it.
- Still inferred: Vow slot behaviour, Champion `apply.need`, Plot triggers, how Deadly Dance chooses its target, and whether the Ecaz-named champion attributes work for another faction.
