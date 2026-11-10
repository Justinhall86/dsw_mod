"""One-screen check of where data.cdb and hlboot.dat stand, and whether the game is ready to package/install.

  python mod_files/status.py

Read-only. Source of truth = mod_files/data.cdb (see mod_files/README.md). Reports: the editor copy, the packed pak,
the game's hlboot.dat against the registered builds, and engine features the cdb needs but the installed hlboot lacks.
"""
import hashlib
import json
import os
import time
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
MASTER = REPO / "mod_files" / "data.cdb"
REG = json.loads((REPO / "mod_files" / "hlboot_builds.json").read_text(encoding="utf-8"))
HLBOOT = {k: v["desc"] for k, v in REG["builds"].items()}     # sha256[:16] -> what it is (hlboot_build.py adds lines)
NEEDS_PATCH = REG["needs_patch"]                              # cdb attribute id -> the Quinn tick that implements it


def first_dir(*cands):
    return next((Path(c) for c in cands if c and Path(c).exists()), Path(cands[-1]))


EDITOR = first_dir(os.environ.get("D4X_EDITOR_RES"), r"C:\dsw_mod\D4XEditor\res", r"D:\dsw_mod\D4XEditor\res")
GAME = first_dir(os.environ.get("D4X_GAME"), r"C:\Program Files (x86)\Steam\steamapps\common\D4X", r"D:\Steam\steamapps\common\D4X")


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()[:16]


def when(p):
    return time.strftime("%Y-%m-%d %H:%M", time.localtime(os.path.getmtime(p)))


print("MASTER  %s  %s  %.1f MB" % (MASTER.relative_to(REPO), when(MASTER), MASTER.stat().st_size / 1e6))
ed = EDITOR / "data.cdb"
state = "in sync" if ed.exists() and sha(ed) == sha(MASTER) else ("DIFFERS (repackage.py will overwrite it)" if ed.exists() else "missing")
print("EDITOR  %s  %s" % (ed, state))
pak = EDITOR / "res.compressed1.pak"
gp = GAME / "res.compressed1.pak"
if pak.exists():
    print("PACKED  %s  %s  (%s than master)" % (pak.name, when(pak), "older" if pak.stat().st_mtime < MASTER.stat().st_mtime else "newer"))
else:
    print("PACKED  no editor pak at %s (set D4X_EDITOR_RES)" % pak)
if gp.exists():
    print("GAME    %s  %s  %s" % (gp.name, when(gp), "= packed" if pak.exists() and sha(gp) == sha(pak) else "NOT the packed one"))

hb = GAME / "hlboot.dat"
h = sha(hb)
print("HLBOOT  game hlboot.dat = %s  -> %s" % (h, HLBOOT.get(h, "UNREGISTERED build (a Steam update? see mod_files/README.md)")))
raw = MASTER.read_text(encoding="utf-8")
need = [(k, v) for k, v in NEEDS_PATCH.items() if k in raw]
for k, v in need:
    built_with = REG["builds"].get(h, {}).get("features", [])
    print("  cdb uses %s -> needs %s; installed hlboot %s" % (k, v, "has it" if v in built_with else "LACKS it (py -3.14 mod_files/hlboot_build.py)"))
if not need:
    print("  cdb needs no hlboot features")
