---
name: dsw-hlboot-patching
description: Build, register and install the patched hlboot.dat for Dune Spice Wars (D4X): our Renegades patches (drop timer, keep-first-threshold) plus engine features that a data.cdb attribute needs (resource_trades for Convert_TRes_To_TRes2, custom attributes, siege actions, trait-stack conditions, faction CSS and more, from Quinn's patch source). Use whenever the user mentions patching or rebuilding hlboot.dat, a Steam update that restored vanilla hlboot, a cdb attribute that "does nothing" because the engine lacks the code, Quinn's patcher or features, status.py, or before packaging when mod_files/status.py says the hlboot LACKS a feature. Not for reading engine code (dsw-hlboot-reverse) or for models and paks (dsw-model-modding).
---

# DSW hlboot.dat patching

`hlboot.dat` is the game's code. `data.cdb` rows that use an attribute the engine has no code for do nothing until the code is added.
Everything is driven from `mod_files/`; read `mod_files/README.md` first.

## The one command

```powershell
py -3.14 mod_files\status.py                       # where things stand (read-only)
py -3.14 mod_files\hlboot_build.py                 # build only; features = what the cdb needs
py -3.14 mod_files\hlboot_build.py --features resource_trades,keybinds
py -3.14 mod_files\hlboot_build.py --install       # only when the user asked for an install
```

It copies a **registered vanilla** hlboot, applies `30_patch_hlboot_drop_timer.py` and `31_patch_hlboot_keep_first_threshold.py`
(`model_projects/thorvald/thorvald_renegades/08_scripts/`), then the chosen features through `tool/quinn.py`, records the result's
sha256 in `mod_files/hlboot_builds.json`, and writes `mod_files/hlboot_build_out/hlboot.dat`. `--install` backs the game's file up
to `pak_archive/hlboot_game_<sha>.dat` first and refuses to overwrite a file that is not a registered build.
Needs Python 3.14 (the default `python` on the first machine is 3.12: use `py -3.14`).

## One-time setup

`py -3.14 tool\unpack_quinn.py` extracts the patch source from `tool/patcher .zip` into `tool/quinn_patcher/` (git-ignored; it has no licence).
`py -3.14 tool\quinn.py list` then lists the features; `about <name>` describes one.

## Rules

- **The registry is the truth.** `mod_files/hlboot_builds.json` holds every known sha (`role` vanilla or patched, and the vanilla a patched build came from)
  and `needs_patch` (cdb attribute id -> the feature tick that implements it). When you wire a new engine-dependent attribute into the cdb,
  add it to `needs_patch`, so `status.py` flags a missing feature before packaging.
- **After a Steam update** the game's hlboot is vanilla again and its sha is unregistered. Check it really is unpatched, add it as `role: vanilla`
  (or pass `--allow-unregistered` once), and rebuild. The patches look functions up by name and refuse a layout they do not recognise, so a changed
  engine stops the build instead of corrupting it. Extract the new vanilla cdb and rebase as well (CLAUDE.md, data.cdb rules).
- **Keep vanilla copies** in `pak_archive/hlboot_vanilla_<sha>.dat` (git-ignored). `hlboot_build.py` fills it. Game binaries never go in git.
- `hlbootdx.dat` is the DirectX twin and has never been patched here.
- **Install only when asked**, then test: `game.log` must show `[DataCache] Modified data.cdb`; a feature that is missing shows as an attribute doing nothing.
- Two machines exist: the game builds differ (the D: copy is Steam build 19145763, Sept 2025; the C: copy is Oct 2026). Build from the game you will run.

## Making a feature of our own

A feature is a folder with `changes.py` exposing `CHANGES = ((label, apply(bc)), ...)`, built on `crashlink` (`bc` is the parsed bytecode),
plus `feature_description.txt` (name, about, cdb columns, hooks). Read `tool/quinn_patcher/!PATCH/FEATURES/resource_trades/` as the model
(`tradepatch.py` splices functions into the bytecode; `tools/` has the helpers). To start our own: copy a small feature's folder, rename it,
edit it, and build with `--features <name>`. Move our own features out of the git-ignored `tool/quinn_patcher/` before relying on them.
Done 2026-11-08: `tool/quinn.py` also reads our own tick folders from `tool/thorvald_ticks/<name>/` (same layout: `changes.py` with
`CHANGES`, `feature_description.txt`; tracked in git). `tool/thorvald_ticks/thorvald_sworn/` is the worked example: it splices into game functions
by NAME with `tools.splice.insert`, finds its anchors by shape and guards (the build stops if the layout differs), and adds functions of its own with
`new_function`. Build it with Quinn's `resource_trades` (alphabetical order runs ours last): `py -3.14 mod_files/hlboot_build.py` picks both
(`needs_patch` maps `Entity_ControlLossImmune` to `thorvald_sworn`). To inspect a result: `python .claude/skills/dsw-hlboot-reverse/scripts/hlboot.py
--dat mod_files/hlboot_build_out/hlboot.dat dis <func#>`. No VM test exists: a patch is checked by re-parse and by reading the disassembly.
