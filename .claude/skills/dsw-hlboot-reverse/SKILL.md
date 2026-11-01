---
name: dsw-hlboot-reverse
description: Read the Dune Spice Wars (D4X) game code in hlboot.dat (HashLink bytecode) to learn what the engine really does with a data.cdb field, attribute, effect, raid, ability, operation or constant, and to find data-only ways to get behaviour the cdb seems not to support. Includes a tested Python disassembler (hlboot.py), a catalogue of engine findings (raids and Renegades, operations, world events, trait durations, siege actions, effect hooks) and notes on the hlbc tools and on patching. Use whenever the user asks how a game mechanic works "under the hood", why a cdb change has no effect, whether an attribute or effect is implemented, what triggers or spawns something, how to make a new operation, raid, spawn or timer, or mentions hlboot.dat, HashLink, bytecode, decompiling, hlbc, Haxe code, the .dat file or engine code. Use it before saying "the cdb can't do that". Not for models, textures or paks (other dsw-* skills).
---

# DSW hlboot.dat reverse engineering

`hlboot.dat` in the game folder is the whole D4X game code as HashLink bytecode. `data.cdb` only holds parameters.
Whether a column, attribute or effect actually does anything, and in which situations, is decided here. Reading it turns
guesses into facts. In the Renegade project it showed:
- Faction starting traits ignore `props.duration`.
- The dormant `GhostMarket` ability can spawn a structure where an operation is clicked.
- `Operation_OnUsed_SpawnTUnit_Flat` can land troops in a chosen region.
- `Unlock_TSiegeAction` is dead.

## Tool

```powershell
$H = ".claude\skills\dsw-hlboot-reverse\scripts\hlboot.py"
python $H info                              # parses once (~6 s), then uses a cached pickle in scripts\.cache
python $H find "Renegade_Drop"              # functions that load that string (ids, log texts, alert names)
python $H name "Raids\.spawnRaid$"          # functions by Class.method regex
python $H dis 17340                         # disassembly with names, strings, floats, fields, file:line
python $H callers 17340                     # who calls it
python $H atb TRaid_HostileSpawn_DaysFrequency   # where the engine reads a cdb attribute (by row index)
python $H ints 730                          # functions loading an int (constant/attribute rows, flags)
python $H setfield DAY_DURATION             # where a field gets assigned
python $H cdbidx constant 730               # cdb row index <-> id (attribute, constant, any sheet)
```

The default `--dat` is the Steam game's `hlboot.dat` and `--cdb` is `mod_files/data.cdb`. The parser consumes the
file exactly. If it warns that it stopped early, the game update changed the format: see
`references/bytecode_and_patching.md`. Function numbers change between game builds, but names don't, so cite names.

Test tools (run them; they encode lessons that cost a game crash each):
```powershell
python .claude\skills\dsw-hlboot-reverse\scripts\engine_preflight.py   # before every pak build: 0 FAIL required
python .claude\skills\dsw-hlboot-reverse\scripts\save_inspect.py       # after a test game: what really exists in the state
```

## Workflow

1. **Read the findings first.** `references/engine_findings.md` already covers time and constants, traits, effects and
   their hooks, raids and Renegades, siege actions, abilities and operations, world events, faction daily attributes and
   hostility. If the question is answered there, check that the named function still says so (a quick `dis`), then use it.
2. **Find the anchor in code.** Search for the cdb id as a string (`find`), for the attribute with `atb`, or for the class
   with `name`. Ability, effect, raid and siege-action ids are compared as strings, so `find` usually lands on the exact branch.
3. **Read the function, then go outward.**
   - `dis` the function, then `callers` to find which game event reaches it.
   - Note what the *subject* or *owner* is at each step. Most "it didn't work" cases come from a null owner, the wrong
     target type, or a hook that only runs in Conquest.
4. **Map back to data.**
   - Ints next to `hasAttribute` or `getAtbApps` are attribute rows. `valueCache` indexes are constant rows. Check both with `cdbidx`.
   - Write down what the cdb controls and what is hard-coded (for example the list of siege actions offered to players).
5. **Look for a data-only route before proposing a patch.** The user wants data-only changes and allows `.dat` edits
   only as a last resort. Engine paths are often reachable through:
   - unused vanilla rows (dormant abilities, disabled missions)
   - attributes no vanilla trait uses
   - world-event rewards
   - timed traits applied by operations

   A dormant path may never have run in vanilla. `resStockConditions` crashes every game start, for example. So launch,
   **start a skirmish**, and read `game.log` for stack traces before calling a change done. Reaching the main menu
   proves nothing, because most data is only used when a game starts.

   Present the data-only option and say plainly what it can't do.
6. **Record new findings.** Add them to `references/engine_findings.md` under the matching section, with the function
   name. Add any project-level effects to that project's `SPEC.md`.

## Making changes based on findings
- Make cdb edits with a project script that has a dry run, `--apply` (backup + `07_data_cdb/data_BEFORE_*.cdb`) and
  `--revert`. Example: `model_projects/thorvald_renegades/08_scripts/10_renegade_operations.py`.
- Then validate with `cdb_validate.py --vanilla mod_files/data_vanilla_<date>.cdb` (0 NEW), run `repackage.py --quiet
  --no-launch`, launch, and check that `game.log` has `[DataCache] Modified data.cdb` and no data errors.
- The engine reads ids as strings: a misspelt id in the cdb fails silently or at the moment it's used, not at load.
  Prefer cloning a working vanilla row, and change as few fields as possible.
- A `.dat` patch needs the user's explicit OK and a backup of the original `hlboot.dat`. Follow
  `references/bytecode_and_patching.md`.

## hlbc
`C:\Users\justi\Python\dsw_mod\hlbc` is the Rust source of Gui-Yom/hlbc (reader, writer, CLI decompiler, GUI). It
isn't built, and Rust isn't installed. Use it as the format reference (`crates/hlbc/src/opcodes.rs`, `read.rs`,
`write.rs`). Offer to build it (`cargo build --release -p hlbc-cli`) when a long function needs real decompilation or a
patch needs a writer. Don't download prebuilt binaries without asking: a previous attempt was blocked.

## References
- `references/engine_findings.md`: what the engine does, by system (with a table of contents).
- `references/bytecode_and_patching.md`: reading idioms, the investigation method, patching rules, building hlbc.
