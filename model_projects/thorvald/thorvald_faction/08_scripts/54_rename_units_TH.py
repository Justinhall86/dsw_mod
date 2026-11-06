"""Rename House Thorvald's UNIT ids Th_X -> TH_X so the engine can find them.

    python 54_rename_units_TH.py            # DRY RUN: report only
    python 54_rename_units_TH.py --apply    # backup + 07_data_cdb/data_BEFORE_rename_TH.cdb, then write mod_files/data.cdb
    python 54_rename_units_TH.py --revert   # restore 07_data_cdb/data_BEFORE_rename_TH.cdb

Why: HUnit.getFactionUnitById(type, faction) resolves `initials.toUpperCase() + "_" + type` (hlboot.dat, HUnit.hx:74).
Thorvald's initials are "Th", so the engine asks for "TH_Ornithopter" and gets null. The first place this happens is the
HUD's OrniPanel.getOrniKind, so every Thorvald game crashed at load with "Null access .id". The same lookup is used by
AI unit buying, raids with unitType, world-event rewards, effects and conditions.

Only UNIT ids are renamed. Model, trait, ability and combo ids keep Th_, so meshes and the rest are untouched. The
rename touches every column the cdb schema types as a unit reference ("6:unit"), the unit rows' own ids, and
[Th_X] text markup for the renamed ids. It ends with a report of any leftover "Th_X" strings in other columns.
"""
import json
import os
import re
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
BEFORE = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "07_data_cdb", "data_BEFORE_rename_TH.cdb")
APPLY = "--apply" in sys.argv

if "--revert" in sys.argv:
    print("backup:", C.backup(REAL, "before_rename_TH_revert"))
    shutil.copy2(BEFORE, REAL)
    sys.exit(f"restored {REAL} from {BEFORE}")

WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)
data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
SHEETS = {s["name"]: s for s in data["sheets"]}

units = SHEETS["unit"]["lines"]
RENAME = {u["id"]: "TH_" + u["id"][3:] for u in units if u["id"].startswith("Th_") and u.get("faction") == "Thorvald"}
clash = [n for n in RENAME.values() if any(u["id"] == n for u in units)]
if clash:
    sys.exit(f"target ids already exist: {clash}")
if not RENAME:
    sys.exit("nothing to rename (already done?)")

count = {"refs": 0, "text": 0}


def walk(sheet_name, obj):
    """Rename unit references in obj (a line or a nested object) according to the schema of sheet_name."""
    sheet = SHEETS.get(sheet_name)
    if sheet is None or not isinstance(obj, dict):
        return
    for col in sheet["columns"]:
        name, ts = col["name"], col["typeStr"]
        if name not in obj:
            continue
        v = obj[name]
        if ts == "6:unit" and isinstance(v, str) and v in RENAME:
            obj[name] = RENAME[v]; count["refs"] += 1
        elif ts == "8" and isinstance(v, list):
            for item in v:
                walk(f"{sheet_name}@{name}", item)
        elif ts == "17" and isinstance(v, dict):
            walk(f"{sheet_name}@{name}", v)


for s in data["sheets"]:
    if "@" in s["name"]:
        continue
    for line in s["lines"]:
        walk(s["name"], line)
for u in units:
    if u["id"] in RENAME:
        u["id"] = RENAME[u["id"]]

# [Th_X] / [Th_X-adjective] style markup in any text
MARK = re.compile(r"\[(!?)(" + "|".join(map(re.escape, sorted(RENAME, key=len, reverse=True))) + r")(?=[\]\-:])")


def fix_text(o):
    if isinstance(o, dict):
        for k, v in o.items():
            if isinstance(v, str):
                n = MARK.sub(lambda m: "[" + m.group(1) + RENAME[m.group(2)], v)
                if n != v:
                    o[k] = n; count["text"] += 1
            else:
                fix_text(v)
    elif isinstance(o, list):
        for x in o:
            fix_text(x)


fix_text(data["sheets"])

# leftovers: exact old unit ids anywhere else (expected only where a model/trait/ability shares the name)
left = {}


def scan(o, path):
    if isinstance(o, dict):
        for k, v in o.items():
            if isinstance(v, str) and v in RENAME:
                left.setdefault(f"{path}.{k}", set()).add(v)
            else:
                scan(v, f"{path}.{k}")
    elif isinstance(o, list):
        for x in o:
            scan(x, path)


for s in data["sheets"]:
    scan(s["lines"], s["name"])

print(f"renamed {len(RENAME)} units: {sorted(RENAME.values())}")
print(f"unit references updated: {count['refs']}, text markup fixed: {count['text']}")
print("remaining old-id strings (should only be model/trait/ability ids that share the name):")
for k, v in sorted(left.items()):
    print(f"  {k}: {sorted(v)[:6]}{' ...' if len(v) > 6 else ''}")

if APPLY:
    if not os.path.exists(BEFORE):
        shutil.copy2(REAL, BEFORE); print("kept", BEFORE)
    print("backup:", C.backup(REAL, "before_rename_TH"))
with open(WORK, "wb") as f:
    f.write(C.dumps(data))
print("written:", WORK)
