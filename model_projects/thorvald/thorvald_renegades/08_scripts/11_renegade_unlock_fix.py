"""Make Renegade drops switch on at the first tick.

    python 11_renegade_unlock_fix.py            # DRY RUN
    python 11_renegade_unlock_fix.py --apply    # Raid_Renegades_HegemonyUnlock 0 -> -1 (backup first)
    python 11_renegade_unlock_fix.py --revert   # back to 0

Why: Raids.regularUpdate enables Renegades when every player passes the closure at Raids.hx:812,
which is `unlock < faction.getResource(Hegemony)`, a STRICT less-than. A new game starts at 0 Hegemony,
so unlock 0 never fires until every player earns Hegemony (confirmed: no Renegade_Drop after 18 days
in a solo Thorvald game). -1 < 0 is true on the first tick; then the patched first threshold (2.0 days) gives the 1:00 drop.
"""
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
APPLY = "--apply" in sys.argv or "--revert" in sys.argv
NEW = 0 if "--revert" in sys.argv else -1

data, exact = C.load(REAL)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
row = C.by_id(C.sheets(data)["constant"])["Raid_Renegades_HegemonyUnlock"]
print("Raid_Renegades_HegemonyUnlock:", row.get("value"), "->", NEW)
if APPLY:
    print("backup:", C.backup(REAL, "before_renegade_unlock_fix" if NEW == -1 else "before_renegade_unlock_fix_revert"))
    row["value"] = NEW
    open(REAL, "wb").write(C.dumps(data))
    print("written", REAL)
