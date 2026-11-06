# HashLink bytecode: reading idioms and patching notes

## Reading the disassembly
- `rN` are registers. `r0` is `this` in methods. Arguments are r0..rK, typed as in the header line.
- `r5 = 53` then `hasAttribute(obj, r5, null, null)` means attribute **row 53** of the cdb `attribute` sheet. Constants work
  the same way: `valueCache.bytes` at `index << 3` is constant row `index` (GetMem with a Shl by 3 is an f64 array read).
- `"X" (const)` is a string held in a global (the `consts` table). `"X"` without "(const)" is a String-op literal.
  String switches compile to chains of `string_compare` and length checks: read the literal and the following `JEq` target.
- `JFalse [r] -> +n`: jump offsets count **ops**, not bytes, relative to the next op.
- Closures `f@NNNN` are anonymous functions. Disassemble them with `dis` using their function number (`name "f@NNNN"`).
- Ability, effect, siege action and raid ids are compared as strings, so `find <id>` lands right on the code for that id.
- `HEffect.hx:LINE` comments separate the branches of the big switch functions (fireEffect, doUseAbility, occupationActionEffects).
- `global<$Data>.raid.byId.get(id)` reads a cdb row. Fields on it (`r.props`, `r.flags`) are the cdb columns.

## Method for answering "how does X work in the engine?"
1. Find the anchor:
   - `find "<id or log text>"` for ids, alert names and log messages
   - `name "<Class.method regex>"` when you know the class
   - `atb <AttributeId>` for attributes
   - `setfield <field>` to find where a value is first set
2. `dis` the function. Skip the network, serialize and `__net_mark` boilerplate.
3. Go outward with `callers <#>` to learn which game event reaches it, and what the subject or owner is at that point.
4. Map every int and string back to cdb rows (`cdbidx`). Then write down what the data controls and what is hard-coded.
5. Before declaring something impossible, look for an unused vanilla hook (dormant abilities like GhostMarket, unused
   attributes, `resStockConditions`) that reaches the same engine path.

## Patching (last resort; the user prefers data-only)
Nothing is patched yet. If it ever comes to that:
- **Never write to the game folder's `hlboot.dat` without a timestamped backup** under `pak_archive/` or `mod_files/backups/`.
  The game reads the file from `C:\Program Files (x86)\Steam\steamapps\common\D4X\hlboot.dat` (see CLAUDE.md for the
  junction note). Steam "verify files" or a game update will put the vanilla file back.
- Jumps are op-relative, so swapping one op for another op with the same count keeps all control flow. The byte length of
  the encoding may change, because nothing in the file uses byte offsets after the header.
- The smallest patches, with no new ops:
  - change a `GetGlobal` index (point a string compare at another existing const)
  - change a `Float`/`Int` table index
  - change a `JEq` offset to reuse another branch (for example, make a dormant ability id run the GhostMarket handler)
- Inserting ops means fixing **every** jump, Switch and Trap offset that crosses the insertion point, adding entries to the
  debug info (`dbg` list) and, for new registers, appending to `regs`. New strings or globals mean appending to those
  tables and to `consts`.
- The HL JIT trusts register types. Use `UnsafeCast` to move a subclass value (for example `ent.Player`) into a register
  of the parent type.
- Write path: either extend `hlboot.py` with a serializer (mirror of `parse`; prove it by re-serialising the unmodified
  file byte for byte before patching), or build `hlbc` (below), which has `crates/hlbc/src/write.rs`.
- After a patch: launch the game and check `game.log` for load errors. Then test the specific behaviour in a game, because
  a bad patch usually crashes only when that code path runs.

## hlbc (C:\Users\justi\Python\dsw_mod\hlbc)
The source of Gui-Yom/hlbc (Rust: core reader/writer, CLI, decompiler, GUI). There's **no compiled binary in the
folder, and Rust/cargo is not installed**. Downloading the release `.exe` was blocked by the permission system in an
earlier session, so ask the user before fetching binaries.
- Use it as the format reference: `crates/hlbc/src/opcodes.rs` (opcode order and fields), `read.rs`, `write.rs`, `types.rs`.
- `hlboot.py` agrees with it: it consumes the D4X hlboot.dat exactly. If a future game update breaks parsing (the
  "parser stopped at byte" warning), compare `NARGS`/`OPN` with `opcodes.rs` first.
- To build it (with the user's OK): install Rust (rustup), then `cargo build --release -p hlbc-cli` in that folder.
  `target\release\hlbc.exe <hlboot.dat>` gives an interactive CLI with a **decompiler** (`decomp <fn>`), handy for long
  functions. The GUI is `-p hlbc-gui`.
