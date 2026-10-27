"""Make the Ginaz primary trooper (G_Trooper) the Ginaz Swordmaster: the kitbashed wine-coat rapier model, no Atreides soldier body.

    python 17_trooper_swordmaster.py [--apply]     (dry run by default; --apply backs up and writes mod_files/data.cdb, then repackage.py)
Only unit.G_Trooper and model.G_Trooper change (stats, equipment, traits, wheel slot stay the Trooper's).
"""
import os
import sys
import tempfile
import shutil

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
apply = "--apply" in sys.argv
work = REAL if apply else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not apply:
    shutil.copy2(REAL, work)
data, _ = C.load(work)
S = C.sheets(data)
m = C.by_id(S["model"])["G_Trooper"]
u = C.by_id(S["unit"])["G_Trooper"]
m["mesh"] = [{"path": "CharMOD/Male01_GinazCaptain/Prefab_GinazCaptain.prefab"}]
m["scale"] = 1.05
m["props"].pop("dynObjects", None)                      # the Atreides Soldier's hidden Gun child; the Swordmaster prefab has none
u["texts"]["name"] = "Ginaz Swordmaster"
u["texts"]["plural"] = {"name": "Ginaz Swordmasters"}
u["texts"]["desc"] = ("Swordmasters of House Ginaz: the backbone of the sword-school's armies. Fierce duellists in long wine-red coats with a tall rapier, "
                      "stronger when supported by specialized units.")
if apply:
    print("backup:", C.backup(REAL, "before_trooper_swordmaster"))
with open(work, "wb") as f:
    f.write(C.dumps(data))
print("G_Trooper ->", m["mesh"], "scale", m["scale"], "|", u["texts"]["name"], "| work", work)
