"""Shared paths for the Dune: Spice Wars modding scripts.

Every default can be overridden with an environment variable (DSW_GAME_DIR, DSW_EDITOR_DIR, ...)
or by the matching command-line flag of each script. Defaults describe this user's machine.
"""
import os

DEFAULTS = {
    # The folder Steam launches the game from. Program Files\Steam\steamapps is a junction to
    # C:\Users\raide\OneDrive\steamapps - a DIFFERENT physical copy from C:\Users\justi\OneDrive\
    # steamapps (OneDrive syncs them minutes apart). Installing to the justi copy made tests run on
    # stale/vanilla data. Keep only res.compressed.pak (vanilla) + res.compressed1.pak (ours) here.
    "game_dir": r"C:\Program Files (x86)\Steam\steamapps\common\D4X",
    # Replaced / old paks go here, never into the game folder.
    "archive_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod\pak_archive",
    # CastleDB/HIDE editor: data.cdb, res/res (files that go into the pak), backups/
    "editor_dir": r"C:\dsw_mod\D4XEditor",
    # Vanilla assets extracted from the game (read-only reference)
    "extr_dir": r"C:\dsw_mod\extr",
    # Peter Quin's HMD Toolkit (pure Python)
    "toolkit_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit",
    # The project repo (modeling.md, model_outputs/, model_work/)
    "project_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod",
    "blender": r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe",
    "haxe": r"C:\HaxeToolkit\haxe\haxe.exe",
    "hl": r"C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe",
}


def cfg(name):
    """Resolve a setting: env var DSW_<NAME> wins over the default."""
    return os.environ.get("DSW_" + name.upper(), DEFAULTS[name])


def editor_res():
    return os.path.join(cfg("editor_dir"), "res")


def cdb_path():
    """The working data.cdb (source of truth). repackage.py packs this one and copies it over
    the editor's <editor>/res/data.cdb, refusing if the editor copy was edited more recently."""
    return os.environ.get("DSW_CDB", os.path.join(cfg("project_dir"), "mod_files", "data.cdb"))
