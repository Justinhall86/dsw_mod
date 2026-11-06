"""Rename the Ginaz unit G_GinazNeophyte -> G_Soldier so the engine's faction lookup finds Ginaz's Soldier slot.

    python 19_rename_neophyte_G_Soldier.py            # DRY RUN
    python 19_rename_neophyte_G_Soldier.py --apply    # backup + 07_data_cdb/data_BEFORE_G_Soldier.cdb, then write mod_files/data.cdb
    python 19_rename_neophyte_G_Soldier.py --revert   # restore that copy

HUnit.getFactionUnitById(type, faction) resolves initials.toUpperCase() + "_" + type. Every Atreides type needs a
G_<type> twin. A_Soldier had none, because the Neophyte took the Soldier slot under another id, so lookups of the
Ginaz "Soldier" (AI recruiting, raids, rewards, conditions) returned null. Only the unit id changes: the Neophyte's
model, traits, name and wheel slot stay the same.
"""
import os
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402
from cdb_rename_units import rename_units  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
BEFORE = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "07_data_cdb", "data_BEFORE_G_Soldier.cdb")
APPLY = "--apply" in sys.argv
if "--revert" in sys.argv:
    print("backup:", C.backup(REAL, "before_G_Soldier_revert")); shutil.copy2(BEFORE, REAL); sys.exit(f"restored {BEFORE}")

WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)
data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
r = rename_units(data, {"G_GinazNeophyte": "G_Soldier"})
print(f"unit refs {r['refs']}, text {r['text']}, leftovers {sorted((k, sorted(v)) for k, v in r['left'].items())}")
if APPLY:
    os.makedirs(os.path.dirname(BEFORE), exist_ok=True)
    shutil.copy2(REAL, BEFORE); print("kept", BEFORE)
    print("backup:", C.backup(REAL, "before_G_Soldier"))
open(WORK, "wb").write(C.dumps(data))
print("written:", WORK)
