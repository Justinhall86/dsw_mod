"""Sworn Sword 2.0 into data.cdb: the Th_SwornSword model row points at our prefab, and the unit description matches
2.0 (half-mask, no helm or tail). Surgical text patch (data.cdb does not round-trip byte-exact through cdb_tools on the
D: PC), checked by a parsed diff: exactly these fields change, nothing else.

    python 52_cdb_edit.py            # dry run: print the diff
    python 52_cdb_edit.py --apply    # back up to 07_data_cdb/data_BEFORE_sworn_sword_model.cdb, then write
    python 52_cdb_edit.py --revert   # restore that backup
"""
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_sworn_sword_model.cdb")

OLD_MESH = '''					"id": "Th_SwornSword",
					"radius": 1.5,
					"height": 4,
					"audio": {},
					"props": {
						"preload": {
							"factions": [
								{
									"faction": "Thorvald"
								}
							]
						}
					},
					"gfx": {
						"file": "UI/Faction/unitsSmall.png",
						"size": 80,
						"x": 0,
						"y": 4
					},
					"mesh": [
						{
							"path": "CharMOD/Male01_ThorvaldTrooper/Prefab_ThorvaldTrooper.prefab"
						}
					],'''
NEW_MESH = OLD_MESH.replace("CharMOD/Male01_ThorvaldTrooper/Prefab_ThorvaldTrooper.prefab",
                            "CharMOD/Male01_ThorvaldSwornSword/Prefab_ThorvaldSwornSword.prefab")
OLD_DESC = "a lacquered half-mask, a plain steel helm with a horsehair tail and a drawn katana."
NEW_DESC = "a gunmetal half-mask, a rust waist-wrap and a drawn katana."

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit
src = open(CDB, encoding="utf-8", newline="").read()
nl = "\r\n" if "\r\n" in src else "\n"
om, nm = OLD_MESH.replace("\n", nl), NEW_MESH.replace("\n", nl)
assert src.count(om) == 1, "model row text not found exactly once (%d)" % src.count(om)
assert src.count(OLD_DESC) == 2, "unit desc not found twice (%d)" % src.count(OLD_DESC)
out = src.replace(om, nm).replace(OLD_DESC, NEW_DESC)

a, b = json.loads(src), json.loads(out)
diff = []
for sa, sb in zip(a["sheets"], b["sheets"]):
    for i, (ra, rb) in enumerate(zip(sa.get("lines", []), sb.get("lines", []))):
        if ra != rb:
            diff.append((sa["name"], i, ra.get("id")))
    assert len(sa.get("lines", [])) == len(sb.get("lines", [])) and sa.get("columns") == sb.get("columns")
print("changed rows:", diff)
assert sorted(d[2] for d in diff) == ["TH_SwornSword", "TH_SwornSword_Spawned", "Th_SwornSword"], diff
if "--apply" not in sys.argv:
    print("dry run; --apply to write")
    raise SystemExit
os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
open(CDB, "w", encoding="utf-8", newline="").write(out)
print("written", CDB, "| backup", BACKUP)
