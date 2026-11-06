"""Renegade Strike: say in the tooltip that the target must be a rival House's main base.

    python 12_strike_desc.py            # DRY RUN
    python 12_strike_desc.py --apply    # new desc (backup first)
    python 12_strike_desc.py --revert   # old desc

Why: the ability accepts any hostile main base (need MainBase, alignment Enemy). In a game without that faction,
its HQ (Tuek, Foliage, IxianCore) stands as a neutral city owned by a non-player faction. It passes the
Enemy/diplomacy checks, so the signal lands on a faction whose daily update never spawns the raid, and the
cost is wasted (seen 2026-10-31, day 80, target Tuek). There's no data field that separates the two, so the text says it.
"""
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

OLD = "Sell an enemy's coordinates to the Renegade fleet. Within a day their shuttles land on one of that faction's villages and pillage it."
NEW = ("Sell a rival House's coordinates to the Renegade fleet. Target the main base of another player "
       "(not a neutral city): within a day their shuttles land on one of that House's villages and pillage it.")

REAL = os.path.join(REPO, "mod_files", "data.cdb")
APPLY = "--apply" in sys.argv or "--revert" in sys.argv
want = OLD if "--revert" in sys.argv else NEW

data, exact = C.load(REAL)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
row = C.by_id(C.sheets(data)["ability"])["Th_RenegadeStrike"]
print("desc now :", row.get("desc"))
print("desc new :", want)
if APPLY:
    print("backup:", C.backup(REAL, "before_strike_desc" if want == NEW else "before_strike_desc_revert"))
    row["desc"] = want
    open(REAL, "wb").write(C.dumps(data))
    print("written", REAL)
