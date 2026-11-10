# data.cdb and hlboot.dat: where things live

## data.cdb (one master)

| File | Role |
|---|---|
| `mod_files/data.cdb` | **The master.** Edit scripts change this file. `repackage.py` packs it. |
| `mod_files/data_vanilla_<date>.cdb` | Clean vanilla for diffing (`cdb_validate.py --vanilla`). Current: `2026-10-28`. |
| `mod_files/backups/` | Automatic pre-edit backups from `cdb_tools.py`. History only. |
| `model_projects/**/07_data_cdb/data_BEFORE_<change>.cdb` | The revert point for one edit script. |
| `C:\dsw_mod\D4XEditor\res\data.cdb` | The editor's copy. **Never edit it:** `repackage.py` overwrites it from the master. |
| `model_inputs/data.cdb`, `data - Copy.cdb`, `res/data.cdb`, `mod_files/data_safe_extr.cdb` | Old extracts and snapshots. Not used by anything. |

Flow: edit script -> `mod_files/data.cdb` -> `cdb_validate.py` (0 NEW) -> `engine_preflight.py` (0 FAIL) -> `repackage.py` -> game.

## hlboot.dat (engine patches)

The game's `hlboot.dat` is patched on purpose. **One command builds it:** `py -3.14 mod_files/hlboot_build.py` (see the
`dsw-hlboot-patching` skill). Rules:

1. **Every build is registered** in `mod_files/hlboot_builds.json` (sha256 prefix -> role, source vanilla, features). `status.py` reads it.
   A build that is not registered is unknown. `needs_patch` there maps a cdb attribute to the feature that implements it.
2. **Vanilla copies live in `pak_archive/`** (`hlboot_vanilla_<sha>.dat`, git-ignored) and are never in the game folder.
   `hlboot_build.py` always starts from vanilla: patch 30 (drop timer), patch 31 (keep-first-threshold), then the features the cdb needs.
3. `hlbootdx.dat` is the DirectX twin. It has never been patched here; keep it vanilla unless a feature needs it.
4. `--install` is the only step that touches the game, and it backs the old file up first. Install only when asked.

Quinn's feature source is unpacked by `tool/unpack_quinn.py` into `tool/quinn_patcher/` (git-ignored). `mod_files/hlboot_build19145763/` holds
*September 2025* builds (the second machine's game); they are older than `data.cdb` and are not to be installed over the Oct 2026 build.
Game binaries stay out of the repo.

## Before you package

```
python mod_files/status.py
```

It must show: editor in sync, an hlboot that is registered, and no "LACKS it" lines.
