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

The game's `hlboot.dat` is patched on purpose. Rules:

1. **Every build is registered** in `mod_files/status.py` (`HLBOOT`: sha256 prefix -> what it is). A build that is not registered is unknown.
2. **Vanilla copies live in `pak_archive/`** (`hlboot_vanilla_<sha>.dat`) and are never in the game folder. Re-apply patches from vanilla after a Steam update, in this order:
   1. `thorvald_renegades/08_scripts/30_patch_hlboot_drop_timer.py`
   2. `thorvald_renegades/08_scripts/31_patch_hlboot_keep_first_threshold.py`
   3. (only if the cdb needs it) Quinn `resource_trades`, see below.
3. **A cdb attribute that needs a patch is listed in `NEEDS_PATCH`** in `status.py`. The status script says when the cdb needs a feature the installed hlboot lacks.
4. `hlbootdx.dat` is the DirectX twin. It has never been patched here; keep it vanilla unless a feature needs it.

Quinn's feature builder: `tool/quinn.py` (`build`, `install`). `mod_files/hlboot_build19145763/` holds *September 2025* builds,
**older than the current game**. Do not install them over the current hlboot; rebuild from the current vanilla.
Game binaries stay out of the repo.

## Before you package

```
python mod_files/status.py
```

It must show: editor in sync, an hlboot that is registered, and no "LACKS it" lines.
