"""Fix the House Ginaz roster (2026-10-25): only Ginaz soldiers where we have them, Atreides units as backfill, a Ginaz HQ name.

    python 18_fix_ginaz_roster.py [--apply]     (dry run on a temp copy by default; --apply backs up and writes mod_files/data.cdb, then run repackage.py)

What changes (everything else in data.cdb is untouched):
  1. The Landsraad Elite does not belong to House Ginaz: unit.G_LandsraadGuard and its model N_LR_Elite_Sword are removed (that model row belongs to the separate Landsraad Elite project; the original is in the pre-faction backup).
  2. The start-of-game company at the HQ is Ornithopter + Ginaz Swordmasters (G_Trooper) + Ginaz Captains (G_Elite), no Landsraad.
  3. The Atreides Ranger (G_Soldier, a rifle unit: the House fields no firearms) is replaced by the Ginaz Neophyte, which takes the Ranger's wheel slot
     (group 1 pos 5). Vanilla only uses group 1 positions 0-9, so the Neophyte's old slot (11) was outside the wheel.
     Dorian's hero buff, which targeted the Ranger, is retargeted to the Neophyte (a dangling unit reference would stop the game from starting).
  4. The HQ is renamed from "Ginaz Enclave" to "Ginaz Sword-School" (structure GinazKeep + region GinazBase), the House's own word for its institution.
Kept as Atreides backfill (no Ginaz replacement exists yet): Heavy Weapon Squad, Support Drone, ornithopters, Hawk, Kraken, Harvester, heroes Cassian and Dorian.
"""
import os
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
HQ_NAME = "Ginaz Sword-School"
HQ_DESC = ("The Sword-School of House Ginaz on Arrakis: duelling courts, training yards and the quarters of the swordmasters, "
           "behind the bedrock walls that once guarded a city.")
START_UNITS = ["G_Ornithopter", "G_Trooper", "G_Elite"]

apply = "--apply" in sys.argv
work = REAL if apply else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not apply:
    shutil.copy2(REAL, work)
data, exact = C.load(work)
if not exact:
    sys.exit("data.cdb does not re-serialise exactly; refusing to edit")
S = C.sheets(data)
units = C.by_id(S["unit"])
log = []

# 1. no Landsraad Elite in House Ginaz
C.remove_entry(data, "unit", "G_LandsraadGuard")
C.remove_entry(data, "model", "N_LR_Elite_Sword")
log.append("removed unit.G_LandsraadGuard and model.N_LR_Elite_Sword")

# 2. start company at the HQ
hq = C.hq_structure(data, "Ginaz")
hq["startUnits"] = [{"unit": u} for u in START_UNITS]
log.append("%s.startUnits = %s" % (hq["id"], START_UNITS))

# 3. Neophyte replaces the Ranger on the wheel
units["G_GinazNeophyte"]["props"]["wheelPosition"] = {"group": 1, "pos": 5}
for sheet, id_ in (("unit", "G_Soldier"), ("model", "G_Soldier"), ("trait", "G_Soldier_Trait"), ("trait", "G_Soldier_Buff")):
    C.remove_entry(data, sheet, id_)
# G_Soldier_Debuff stays: the shared trait TSuppressiveCoordination_Debuff refers to it.
# Dorian's hero buff gave the Ranger a "range" bonus; the Neophyte takes that slot and gets the "melee" one instead.
buff = C.by_id(S["trait"])["G_Hero_2_UnitsBuff_1"]
hit = [a for a in buff["attributes"] if (a.get("target") or {}).get("unit") == "G_Soldier"]
assert len(hit) == 1, hit
hit[0]["target"] = {"unit": "G_GinazNeophyte"}
hit[0]["target2"] = {"trait": "G_Hero_2_UnitsBuff_1_Melee"}
hit[0]["desc"] = "[G_GinazNeophyte]s gain [G_Hero_2_UnitsBuff_1_Melee]"
log.append("Ginaz Neophyte -> wheel group 1 pos 5; removed unit/model G_Soldier (the Atreides Ranger) + traits G_Soldier_Trait, G_Soldier_Buff; "
           "Dorian's unit buff now targets the Neophyte")

# 4. HQ name
old_name = hq["texts"]["name"]
hq["texts"]["name"] = HQ_NAME
hq["texts"]["plural"] = {"name": HQ_NAME}
hq["texts"]["desc"] = HQ_DESC
region = C.by_id(S["region"])["GinazBase"]
region["name"] = HQ_NAME
cap = units["G_Elite"]["texts"]
assert cap["desc"].count("its enclave") == 1, cap["desc"]
cap["desc"] = cap["desc"].replace("its enclave", "its Sword-School")
log.append("HQ %r -> %r (structure %s + region GinazBase); Captain text says Sword-School" % (old_name, HQ_NAME, hq["id"]))

if apply:
    backup = C.backup(REAL, "before_ginaz_roster_fix")
    shutil.copy2(backup, os.path.join(REPO, "model_projects", "ginaz_faction", "07_data_cdb", "data_BEFORE_roster_fix.cdb"))
    print("backup:", backup, "(+ copy in ginaz_faction/07_data_cdb/)")
with open(work, "wb") as f:
    f.write(C.dumps(data))
print("\n".join(log))
print("work file:", work)
print("\nGinaz units now:")
for uid, r in C.by_id(C.sheets(data)["unit"]).items():
    if uid.startswith("G_"):
        w = (r.get("props") or {}).get("wheelPosition")
        print("  %-26s %-24s wheel=%s" % (uid, (r.get("texts") or {}).get("name"), w))
