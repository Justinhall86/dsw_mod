"""Add the Ginaz Neophyte and Master of Ginaz as NEW Atreides units (additive: nothing existing is changed or removed).

    python 15_new_units_cdb.py                 # DRY RUN: works on a temp copy of mod_files/data.cdb and prints the diff vs the real file
    python 15_new_units_cdb.py --apply         # writes mod_files/data.cdb (cdb_tools backs it up first); then run repackage.py

Why additive: the Ginaz Captain already took over the Warden slot (A_Elite).  These two are cloned from A_Trooper (a working recruitable
Atreides unit) with new model entries pointing at CharMOD/Male01_GinazNeophyte and CharMOD/Male01_GinazMaster, so no vanilla unit changes.
Cloned model entries carry `dynObjects: [Gun]` from the Trooper; our prefabs have no Gun child, so it is removed again here.
Stats / squad are a sketch (see house_ginaz/units.md) - adjust below before applying.  Wheel position is chosen by cdb_tools (first free
slot); the Master is a 1-man hero-style unit, so check it in game (a hero may want a hero wheel slot instead).
"""
import json
import os
import shutil
import subprocess
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
CT = os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts", "cdb_tools.py")
REAL = os.path.join(REPO, "mod_files", "data.cdb")
apply = "--apply" in sys.argv
work = REAL if apply else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not apply:
    shutil.copy2(REAL, work)


def ct(*a):
    r = subprocess.run([sys.executable, CT, "--cdb", work, "--allow-inexact", *a], capture_output=True, text=True)
    print(r.stdout.strip().splitlines()[-1] if r.stdout.strip() else r.stderr.strip()[-300:])
    if r.returncode:
        sys.exit(r.stderr)


ct("add-model", "--id", "N_Ginaz_Neophyte", "--clone-from", "A_Trooper", "--mesh", "CharMOD/Male01_GinazNeophyte/Prefab_GinazNeophyte.prefab",
   "--inherit", "MilitaryCommon", "--scale", "1.0")
ct("add-unit", "--id", "A_GinazNeophyte", "--faction", "Atreides", "--model", "N_Ginaz_Neophyte", "--name", "Ginaz Neophyte",
   "--plural", "Ginaz Neophytes", "--squad-size", "5", "--health", "250", "--power", "8", "--armor", "2", "--equipment-from", "A_Trooper",
   "--desc", "Novices of the Ginaz Sword-School: lightly dressed, unarmed trainees who fight with fast footwork while they earn the right to carry a blade.")
ct("add-model", "--id", "N_Ginaz_Master", "--clone-from", "A_Hero_1", "--mesh", "CharMOD/Male01_GinazMaster/Prefab_GinazMaster.prefab",
   "--inherit", "MilitaryCommon", "--scale", "1.15")
ct("add-unit", "--id", "A_GinazMaster", "--faction", "Atreides", "--model", "N_Ginaz_Master", "--name", "Master of Ginaz",
   "--squad-size", "1", "--health", "900", "--power", "28", "--armor", "6",
   "--desc", "A grey-streaked master of the Ginaz Sword-School in a gold-embroidered wine coat and cape, wielding a tall rapier.")

# remove the Trooper's dyn Gun reference (our prefabs have no Gun child) and the Duncan-only fx exclusion
d = json.load(open(work, encoding="utf-8"))
models = {m["id"]: m for s in d["sheets"] if s["name"] == "model" for m in s["lines"]}
for mid in ("N_Ginaz_Neophyte", "N_Ginaz_Master"):
    pr = models[mid].get("props", {})
    pr.pop("dynObjects", None)
    pr.get("preload", {}).pop("excludableFx", None)
    pr.pop("animFxScale", None)
with open(work, "wb") as f:
    f.write(json.dumps(d, indent="\t", ensure_ascii=False).encode("utf-8"))

# report: what differs from the real file
v = json.load(open(REAL if not apply else work, encoding="utf-8"))
print("units now:", [u["id"] for s in d["sheets"] if s["name"] == "unit" for u in s["lines"] if "Ginaz" in u["id"] or u["id"] in ("A_Elite", "A_LandsraadGuard")])
print("DRY RUN (temp copy, real data.cdb untouched):" if not apply else "APPLIED to mod_files/data.cdb. Next: python C:\\dsw_mod\\D4XEditor\\res\\repackage.py --quiet --no-launch")
print("work file:", work)
