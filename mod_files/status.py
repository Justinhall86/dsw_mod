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
EDITOR = Path(r"C:\dsw_mod\D4XEditor\res")
GAME = Path(r"C:\Program Files (x86)\Steam\steamapps\common\D4X")
# sha256[:16] of every hlboot.dat we know. Add a line when a new build is made (see mod_files/README.md).
HLBOOT = {
    "9c7c1044d7c6b636": "vanilla (Steam build of 2026-10-28)",
    "54f1d7f34e7bea9c": "drop-timer patch only (30_patch_hlboot_drop_timer.py)",
    "186b1ccbee7653c8": "drop-timer + keep-first-threshold (31_...), the Renegades build",
}
# cdb attribute ids that do nothing unless hlboot carries the matching patch
NEEDS_PATCH = {"Convert_TRes_To_TRes2": "Quinn resource_trades (top-bar Plascrete trade)"}


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()[:16]


def when(p):
    return time.strftime("%Y-%m-%d %H:%M", time.localtime(os.path.getmtime(p)))


print("MASTER  %s  %s  %.1f MB" % (MASTER.relative_to(REPO), when(MASTER), MASTER.stat().st_size / 1e6))
ed = EDITOR / "data.cdb"
state = "in sync" if ed.exists() and sha(ed) == sha(MASTER) else ("DIFFERS (repackage.py will overwrite it)" if ed.exists() else "missing")
print("EDITOR  %s  %s" % (ed, state))
pak = EDITOR / "res.compressed1.pak"
print("PACKED  %s  %s  (%s than master)" % (pak.name, when(pak), "older" if pak.stat().st_mtime < MASTER.stat().st_mtime else "newer"))
gp = GAME / "res.compressed1.pak"
print("GAME    %s  %s  %s" % (gp.name, when(gp), "= packed" if sha(gp) == sha(pak) else "NOT the packed one"))

hb = GAME / "hlboot.dat"
h = sha(hb)
print("HLBOOT  game hlboot.dat = %s  -> %s" % (h, HLBOOT.get(h, "UNREGISTERED build")))
raw = MASTER.read_text(encoding="utf-8")
need = [(k, v) for k, v in NEEDS_PATCH.items() if k in raw]
blob = hb.read_bytes()
for k, v in need:
    print("  cdb uses %s -> needs %s; installed hlboot %s" % (k, v, "has it" if k.encode() in blob or b"resource_trades" in blob else "LACKS it"))
if not need:
    print("  cdb needs no hlboot features")
