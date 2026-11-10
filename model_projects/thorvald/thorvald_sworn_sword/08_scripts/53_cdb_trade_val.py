"""Give TTh_ConsignmentTerminal's Convert_TRes_To_TRes2 line a val (1, the attribute row's default). Without it the
game logs "Trait <TTh_ConsignmentTerminal> uses the <Convert_TRes_To_TRes2> Attribute with no value" and
"ATTRIBUTES baking end - ! FAIL !" (seen in game.log 2026-11-09). That line is the Plascrete trade that spawns
TH_SwornSword_Spawned. Surgical text patch + parsed-diff check (only that trait row changes).

    python 53_cdb_trade_val.py [--apply | --revert]
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_trade_val.cdb")
if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit
src = open(CDB, encoding="utf-8", newline="").read()
nl = "\r\n" if "\r\n" in src else "\n"
old = '"ref": "Convert_TRes_To_TRes2",' + nl
i = src.index('"id": "TTh_ConsignmentTerminal"')
j = src.index(old, i)
assert j - i < 4000, "ref not inside the trait"
indent = src[src.rindex(nl, 0, j) + len(nl):j]
out = src[:j] + old + indent + '"val": 1,' + nl + src[j + len(old):]
a, b = json.loads(src), json.loads(out)
diff = [(sa["name"], ra.get("id")) for sa, sb in zip(a["sheets"], b["sheets"])
        for ra, rb in zip(sa.get("lines", []), sb.get("lines", [])) if ra != rb]
print("changed rows:", diff)
assert diff == [("trait", "TTh_ConsignmentTerminal")], diff
attr = next(r for r in next(s for s in b["sheets"] if s["name"] == "trait")["lines"]
            if r["id"] == "TTh_ConsignmentTerminal")["attributes"][0]
assert attr["val"] == 1 and attr["ref"] == "Convert_TRes_To_TRes2"
if "--apply" not in sys.argv:
    print("dry run; --apply to write")
    raise SystemExit
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
open(CDB, "w", encoding="utf-8", newline="").write(out)
print("written", CDB, "| backup", BACKUP)
