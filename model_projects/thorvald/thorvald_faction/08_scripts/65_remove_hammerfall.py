"""Remove Hammerfall ("Hammerstrike" in the owner's 2026-11-20 test notes) from data.cdb.

Owner, 2026-11-20: "it's basically just the corrino orbital strike ... please revert it/remove it."
Hammerfall was also rejected in design on 2026-11-13 (house_thorvald/operations.md).

    py -3.14 65_remove_hammerfall.py            # dry run
    py -3.14 65_remove_hammerfall.py --apply    # backup to 07_data_cdb/data_BEFORE_remove_hammerfall.cdb, then write
    py -3.14 65_remove_hammerfall.py --revert   # restore that backup

Removes the rows 62_playtest2.py added: mission Th_MOrbitalStrike, ability Th_OrbitalStrike, trait Th_OrbitalStrike.
Leaves the vanilla Orbital Strike Corrino-only (as 62 made it), so Thorvald has no orbital strike at all.
"""
import json
import os
import re
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_remove_hammerfall.cdb")
ROWS = (("mission", "Th_MOrbitalStrike"), ("ability", "Th_OrbitalStrike"), ("trait", "Th_OrbitalStrike"))

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit

raw = open(CDB, encoding="utf-8", newline="").read()
NL = "\r\n" if "\r\n" in raw else "\n"
d = json.loads(raw.lstrip("﻿"))
S = {s["name"]: s for s in d["sheets"]}


def remove(sheet, rid):
    lines = S[sheet]["lines"]
    i = next(i for i, r in enumerate(lines) if r.get("id") == rid)
    seps = S[sheet].get("separators") or []
    for k, sep in enumerate(seps):
        if isinstance(sep, dict):
            assert sep.get("id") != rid, "%s.%s starts a group" % (sheet, rid)
            if "index" in sep and sep["index"] > i:
                sep["index"] -= 1
        elif isinstance(sep, int) and sep > i:
            seps[k] = sep - 1
    del lines[i]
    print("remove %s.%s (row %d)" % (sheet, rid, i))


for sheet, rid in ROWS:
    if not any(r.get("id") == rid for r in S[sheet]["lines"]):
        raise SystemExit("%s.%s not found (already removed?)" % (sheet, rid))
    remove(sheet, rid)

left = re.findall(r'"(Th_M?OrbitalStrike)"', json.dumps(d))
assert not left, "references left: %s" % left
print("no references left")

if "--apply" not in sys.argv:
    print("dry run; pass --apply to write")
    raise SystemExit
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
    print("backup", BACKUP)
out = json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", NL)
open(CDB, "w", encoding="utf-8", newline="").write(out)
print("wrote", CDB)
