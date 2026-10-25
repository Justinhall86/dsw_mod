"""Take over the Atreides WARDEN slot (unit A_Elite / model A_Elite) with the Ginaz Captain and add it to the
Atreides start units.  Backs data.cdb up first (cdb_tools.save).  Leaves A_LandsraadGuard + its start entry alone.

    python 13_patch_cdb.py [--apply]       (without --apply: dry run, prints the diff only)
"""
import copy
import json
import sys

sys.path.insert(0, r"C:\Users\justi\OneDrive\Python\dsw_mod\.claude\skills\dsw-model-modding\scripts")
import cdb_tools as C  # noqa: E402

CDB = r"C:\Users\justi\OneDrive\Python\dsw_mod\mod_files\data.cdb"
data, exact = C.load(CDB)
orig = copy.deepcopy(data)
sh = C.sheets(data)
units, models = C.by_id(sh["unit"]), C.by_id(sh["model"])

# ---- model: the Warden's 3D entry -> the Ginaz Captain prefab on the Male01 rig + common trooper animation set
m = models["A_Elite"]
m["mesh"] = [{"path": "CharMOD/Male01_GinazCaptain/Prefab_GinazCaptain.prefab"}]
m["inherit"] = "MilitaryCommon"   # was MilitaryShield (female shield stance); Common = full Male01 sword set
m["rigName"] = 0                  # was 1 (Female01 rig)
m["scale"] = 1.1

# ---- unit: name, male sounds, squad of 5; stats / costs / equipment / traits untouched
u = units["A_Elite"]
u["texts"]["name"] = "Ginaz Captain"
u["texts"]["plural"]["name"] = "Ginaz Captains"
u["texts"]["desc"] = ("Captains of House Ginaz, trained in the way of the blade. They fight in long wine-red "
                      "coats with a tall rapier, and the Atreides hold a small company of them in reserve.")
u["props"]["squadSize"] = 5
ev = u["effects"]["events"]
for e in ev:
    if e.get("sound") == "Play_Shield_Move":
        e["sound"] = "Play_Common_Move"
    if e.get("sound") == "Common_Female_Death":
        e["sound"] = "Common_Death"
for v in u["effects"]["sound"]["voices"]:
    v["event"] = v["event"].replace("Voice_A_Warden_", "Voice_A_Trooper_")

# ---- spawn a squad at the start of the game next to Arrakeen (keeps the existing entries)
hq = C.hq_structure(data, "Atreides")
su = hq.setdefault("startUnits", [])
if {"unit": "A_Elite"} not in su:
    su.append({"unit": "A_Elite"})
print("Arrakeen startUnits:", su)

# ---- diff report: exactly which entries changed
def diff(a, b, path=""):
    out = []
    if isinstance(a, dict) and isinstance(b, dict):
        for k in sorted(set(a) | set(b)):
            out += diff(a.get(k), b.get(k), f"{path}/{k}")
    elif isinstance(a, list) and isinstance(b, list) and len(a) == len(b):
        for i, (x, y) in enumerate(zip(a, b)):
            out += diff(x, y, f"{path}[{i}]")
    elif a != b:
        out.append((path, a, b))
    return out

for sname in ("unit", "model", "structure"):
    for aline, bline in zip(orig["sheets"][[s["name"] for s in orig["sheets"]].index(sname)]["lines"],
                            data["sheets"][[s["name"] for s in data["sheets"]].index(sname)]["lines"]):
        for p, a, b in diff(aline, bline):
            print(f"  {sname}.{aline.get('id')}{p}: {json.dumps(a)[:70]} -> {json.dumps(b)[:90]}")

if "--apply" in sys.argv:
    C.save(CDB, data, "ginaz_captain_takes_warden_slot", allow_inexact=True)  # only a trailing newline differs
    print("SAVED")
else:
    print("(dry run - nothing written)")
