"""Rename House Thorvald's military councillor Jool to Ein (Theodoric Ein, the War Academy envoy).

    python 62_rename_jool_to_ein.py            # DRY RUN
    python 62_rename_jool_to_ein.py --apply    # edit data.cdb (backup first)
    python 62_rename_jool_to_ein.py --revert   # put Jool back (data edit, no file restore needed)

Changes (Thorvald only; House Ginaz's Commander Jool is not touched):
  character ThJool -> ThEin          id, name, title Envoy, description
  trait ThJoolPassive -> ThEinPassive  id only; the effect is still Jool's (Power per treaty) until councillors are built
  faction Thorvald characters.councilors  ThJool -> ThEin
Ids keep their row position, so the engine's group is unchanged.
"""
import os
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
APPLY = "--apply" in sys.argv or "--revert" in sys.argv
REVERT = "--revert" in sys.argv
WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)
data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
S = C.sheets(data)

OLD, NEW = "ThJool", "ThEin"
OLD_PASS, NEW_PASS = "ThJoolPassive", "ThEinPassive"
OLD_CHAR = {"firstname": "Jool", "lastname": "", "title": "Overseer",
            "desc": "Overseer Jool, the syndicate's military overseer: forces fighting near Thorvald territory gain Power and Armor."}
NEW_CHAR = {"firstname": "Theodoric", "lastname": "Ein", "title": "Envoy",
            "desc": "Envoy Theodoric Ein, the War Academy-trained field envoy who speaks for the house on the ground. "
                    "Effects are still Jool's (Power per treaty) until councillors are built."}

char = C.by_id(S["character"])[OLD]
trait = C.by_id(S["trait"])[OLD_PASS]
fac = C.by_id(S["faction"])["Thorvald"]
council = fac["characters"]["councilors"]

if REVERT:
    char["id"], char["passiveTrait"] = OLD, OLD_PASS
    trait["id"] = OLD_PASS
    char.update(OLD_CHAR)
    for ref in council:
        if ref["id"] == NEW:
            ref["id"] = OLD
    print("reverted: Ein -> Jool")
else:
    char["id"], char["passiveTrait"] = NEW, NEW_PASS
    trait["id"] = NEW_PASS
    char.update(NEW_CHAR)
    for ref in council:
        if ref["id"] == OLD:
            ref["id"] = NEW
    print("renamed: Jool -> Ein")

print("character:", char["id"], char["firstname"], char["lastname"], "|", char["title"], "|", char["passiveTrait"])
print("councilors:", [r["id"] for r in council])

if APPLY:
    print("backup:", C.backup(REAL, "before_jool_to_ein" if not REVERT else "before_ein_to_jool"))
open(WORK, "wb").write(C.dumps(data))
print(("wrote " if not REVERT else "reverted ") + WORK)
