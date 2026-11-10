"""data.cdb rows for the engine-backed Sworn Sword features (needs the thorvald_sworn hlboot tick, see tool/thorvald_ticks/).

    python 41_cdb_sworn_engine.py [--dry]      apply
    python 41_cdb_sworn_engine.py --revert     restore 07_data_cdb/data_BEFORE_sworn_engine.cdb

1. attribute  Entity_ControlLossImmune           new row at the END of the attribute sheet (engine row numbers: nothing may be inserted above `Invalid`)
2. trait      Th_SwornSword_Trait                + Entity_ControlLossImmune (Oath: no execution, no control loss; Formation stays)
3. trait      Thorvald                           + two OnCouncilVoteEnd_SpawnMB_TUnit_Flat lines, val 2.10 / 2.20: 2 units if CHOAM share >= 10% / 20%
                                                (the hlboot tick reads the FRACTION of val as the threshold)
4. trait      TTh_ConsignmentTerminal            the Plascrete pay entry gets `"spawn": "TH_SwornSword_Spawned"`: one unit per trade (per 100 Plascrete)
5. building   Th_ConsignmentTerminal             moved out of the "Obsolete (keep for saves)" group to sit after RecyclingPlant (group Outpost)
6. trait      TTh_ConsignmentTerminal            moved out of the "Code" group to sit after T_MissileBattery (group Buildings)
Text splice like 40_cdb_sworn_sword.py (this PC cannot round-trip data.cdb); the parsed diff must be exactly the intended rows.
"""
import copy, json, os, shutil, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BEFORE = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_sworn_engine.cdb")
NL, DEC = "\r\n", json.JSONDecoder()
SPAWNED = "TH_SwornSword_Spawned"


def sheet_rows(raw, sheet):
    i = raw.find('\t\t\t"name": "%s",\r\n\t\t\t"columns"' % sheet)
    assert i > 0, sheet
    p = raw.find('"lines": [', i) + len('"lines": [')
    rows = []
    while True:
        while raw[p] in " \t\r\n,":
            p += 1
        if raw[p] == "]":
            return rows
        obj, e = DEC.raw_decode(raw, p)
        rows.append((p, e, obj))
        p = e


def dump_row(obj, depth=4):
    t = json.dumps(obj, indent="\t", ensure_ascii=False)
    return NL.join(("\t" * depth + l if k else l) for k, l in enumerate(t.split("\n")))


def row(raw, sheet, rid):
    hits = [r for r in sheet_rows(raw, sheet) if r[2].get("id") == rid]
    assert len(hits) == 1, "%s/%s: %d" % (sheet, rid, len(hits))
    return hits[0]


def replace(raw, sheet, rid, new_obj):
    p, e, _ = row(raw, sheet, rid)
    return raw[:p] + dump_row(new_obj) + raw[e:]


def insert_after(raw, sheet, after_id, obj):
    _, e, _ = row(raw, sheet, after_id)
    return raw[:e] + "," + NL + "\t\t\t\t" + dump_row(obj) + raw[e:]


def remove(raw, sheet, rid):
    p, e, obj = row(raw, sheet, rid)
    q = raw.rfind(",", 0, p)                      # the comma that separates it from the row before
    assert raw[q:p].strip(" \t\r\n,") == "", "unexpected text before the row"
    return raw[:q] + raw[e:], obj


def apply(raw):
    # 1. the new attribute, at the very end of the sheet
    last = sheet_rows(raw, "attribute")[-1][2]["id"]
    assert last == "Convert_TRes_To_TRes2", "the attribute sheet no longer ends with Convert_TRes_To_TRes2 (%s)" % last
    att = copy.deepcopy(row(raw, "attribute", "Entity_ExecuteImmune")[2])
    att["id"], att["desc"] = "Entity_ControlLossImmune", "Cannot be taken out of your control"
    raw = insert_after(raw, "attribute", last, att)
    # 2. Oath trait
    t = copy.deepcopy(row(raw, "trait", "Th_SwornSword_Trait")[2])
    assert not any(a["ref"] == "Entity_ControlLossImmune" for a in t["attributes"])
    t["attributes"].insert(1, {"target": {}, "target2": {}, "ref": "Entity_ControlLossImmune"})
    t["desc"] = "Sworn Swords cannot be executed or taken out of your control. They fight closer to each other (+1 Armor per ally Sworn Sword nearby, up to 2)."
    raw = replace(raw, "trait", "Th_SwornSword_Trait", t)
    # 3. Council share rungs on the faction trait
    t = copy.deepcopy(row(raw, "trait", "Thorvald")[2])
    assert not any(a.get("target", {}).get("unit") == SPAWNED for a in t["attributes"])
    for val, pct, more in ((2.1, 10, ""), (2.2, 20, " more")):
        t["attributes"].append({
            "target": {"unit": SPAWNED}, "target2": {}, "ref": "OnCouncilVoteEnd_SpawnMB_TUnit_Flat", "val": val,
            "desc": "After every Council, receive 2%s [%s] near your Main Base if you hold at least %d%% of the CHOAM shares" % (more, SPAWNED, pct)})
    raw = replace(raw, "trait", "Thorvald", t)
    # 4. the sale spawn field, 6. and the trait moves
    t = copy.deepcopy(row(raw, "trait", "TTh_ConsignmentTerminal")[2])
    line = t["attributes"][0]
    assert line["ref"] == "Convert_TRes_To_TRes2"
    for e in line["target"]["convertFrom"]:
        assert e["resource"] == "Plascrete"
        e["spawn"] = SPAWNED
    line["desc"] = "Trade [Plascrete] for other resources in the top bar. Every trade also brings one [%s] to your Main Base (up to its limit)" % SPAWNED
    raw, _ = remove(raw, "trait", "TTh_ConsignmentTerminal")
    raw = insert_after(raw, "trait", "T_MissileBattery", t)
    # 5. the building leaves the Obsolete group
    raw, b = remove(raw, "building", "Th_ConsignmentTerminal")
    raw = insert_after(raw, "building", "RecyclingPlant", b)
    return raw


def diff(a, b):
    res, sa = [], {s["name"]: s for s in a["sheets"]}
    for s in b["sheets"]:
        ra = {r["id"]: r for r in sa[s["name"]]["lines"] if "id" in r}
        rb = {r["id"]: r for r in s["lines"] if "id" in r}
        if len(ra) != len(sa[s["name"]]["lines"]):
            continue
        res += [("add", "%s/%s" % (s["name"], i)) for i in rb if i not in ra]
        res += [("edit", "%s/%s" % (s["name"], i)) for i in rb if i in ra and ra[i] != rb[i]]
        res += [("DEL", "%s/%s" % (s["name"], i)) for i in ra if i not in rb]
    return res


def order(d, sheet):
    return [r["id"] for s in d["sheets"] if s["name"] == sheet for r in s["lines"]]


def main():
    if "--revert" in sys.argv:
        shutil.copyfile(BEFORE, CDB); print("reverted from", BEFORE); return
    raw = open(CDB, encoding="utf-8", newline="").read()
    new = apply(raw)
    a, b = json.loads(raw), json.loads(new)
    got = diff(a, b)
    print("parsed diff:", got)
    want = {("add", "attribute/Entity_ControlLossImmune"), ("edit", "trait/Th_SwornSword_Trait"), ("edit", "trait/Thorvald"),
            ("edit", "trait/TTh_ConsignmentTerminal")}
    assert set(got) == want and len(got) == len(want), "unexpected change set"
    for sheet, moved in (("building", "Th_ConsignmentTerminal"), ("trait", "TTh_ConsignmentTerminal")):
        oa, ob = order(a, sheet), order(b, sheet)
        assert sorted(oa) == sorted(ob) and [x for x in oa if x != moved] == [x for x in ob if x != moved], sheet + ": more than the one row moved"
        print("%s: %s moved from %d to %d" % (sheet, moved, oa.index(moved), ob.index(moved)))
    assert order(b, "attribute")[-1] == "Entity_ControlLossImmune" and order(b, "attribute")[:-1] == order(a, "attribute")
    if "--dry" in sys.argv:
        print("dry run, nothing written"); return
    if not os.path.exists(BEFORE):
        shutil.copyfile(CDB, BEFORE); print("saved", BEFORE)
    bk = os.path.join(REPO, "mod_files", "backups", "data_before_sworn_engine.cdb")
    if os.path.isdir(os.path.dirname(bk)):
        shutil.copyfile(CDB, bk)
    open(CDB, "w", encoding="utf-8", newline="").write(new)
    print("CDB_SAVED")


main()
