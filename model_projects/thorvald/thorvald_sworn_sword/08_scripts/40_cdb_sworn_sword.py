"""data.cdb rows for the Thorvald Sworn Sword (spec: Sworn Swords Implementation Spec, 2026-11-08).

    python 40_cdb_sworn_sword.py --stage 1 [--dry]     unit TH_SwornSword (trained) + TH_SwornSword_Spawned + model row
    python 40_cdb_sworn_sword.py --stage 4 [--dry]     Oath trait + Formation fallback on both unit rows
    python 40_cdb_sworn_sword.py --revert              put back 07_data_cdb/data_BEFORE_sworn_sword.cdb

Why a text patch: on this PC `cdb_tools.save` refuses (data.cdb does not round-trip byte for byte), so rows are spliced in as
text (each row re-serialises byte-exact, checked) and the PARSED before/after diff must be exactly the intended rows.
Rows go next to their Thorvald trooper sibling, never at the end of the sheet (row position decides the engine's `group`).

Everything is derived from the live Thorvald Trooper rows, so ids, anim set and rig match what is already in the file.
All numbers are the spec's starting values (see the CONFIG block).
"""
import copy, json, os, shutil, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BEFORE = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_sworn_sword.cdb")

# ---- CONFIG: spec section 3 (starting values to tune) -------------------------------------------------------------
UNIT, SPAWNED, MODEL = "TH_SwornSword", "TH_SwornSword_Spawned", "Th_SwornSword"
STATS = {"health": 350, "power": 14, "armor": 3}          # supply (maxSupply 100) and trainingTime (3 days) come from template "Trooper"
RECRUIT = [{"qty": 60, "res": "Solari"}, {"qty": 0, "res": "Manpower"}]
UPKEEP = [{"qty": 9, "res": "Solari"}, {"qty": 3, "res": "CommandPoint"}]
WHEEL = {"pos": 1, "group": 0}     # group 0 pos 1: free for Thorvald (the Atreides Ginaz Captain sits at the same spot and was confirmed in game)
SPAWN_CAP = 5                      # props.maxCount on the spawned row: Structure.implInlineRecruit refuses a recruit/spawn at the cap
NAME, PLURAL = "Sworn Sword", "Sworn Swords"
DESC = ("Oath-bound blades of House Thorvald: a lacquered half-mask, a plain steel helm with a horsehair tail and a drawn katana. "
        "Hired for Solari alone, not Manpower.")
BUFF, TRAIT = "Th_SwornSword_Buff", "Th_SwornSword_Trait"
# ---------------------------------------------------------------------------------------------------------------------

def _splice_lib():
    NL = "\r\n"
    dec = json.JSONDecoder()

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
            obj, e = dec.raw_decode(raw, p)
            rows.append((p, e, obj))
            p = e

    def dump_row(obj, depth=4):
        t = json.dumps(obj, indent="\t", ensure_ascii=False)
        return NL.join(("\t" * depth + l if k else l) for k, l in enumerate(t.split("\n")))

    return sheet_rows, dump_row, NL


sheet_rows, dump_row, NL = _splice_lib()


def find(rows, rid):
    hits = [r for r in rows if r[2].get("id") == rid]
    assert len(hits) == 1, "%s: %d rows" % (rid, len(hits))
    return hits[0]


def build_unit(trooper, spawned):
    u = copy.deepcopy(trooper)
    u["id"] = SPAWNED if spawned else UNIT
    u["stats"] = [dict(STATS)]
    u["texts"] = {"name": NAME, "desc": DESC, "plural": {"name": PLURAL}}
    u["effects"]["models"] = [{"ref": MODEL, "flags": 0}]
    u["traits"] = []                                            # stage 4 fills this
    p = u["props"]
    if spawned:
        # House_Soldier precedent (vanilla spawned unit): zero costs, NotBuyable, a maxCount, no wheel slot, no AI weight
        u["costs"] = {"recruit": [{"res": "Solari", "qty": 0}, {"qty": 0, "res": "Manpower"}],
                      "upkeep": [{"qty": 0, "res": "Solari"}, {"qty": 0, "res": "CommandPoint"}]}
        p.pop("wheelPosition", None)
        p["maxCount"] = SPAWN_CAP
        u["flags"] = 33                                         # Military (1) + NotBuyable (32); House_Soldier uses 32 alone
        u["aiWeights"] = []
    else:
        u["costs"] = {"recruit": copy.deepcopy(RECRUIT), "upkeep": copy.deepcopy(UPKEEP)}
        p["wheelPosition"] = dict(WHEEL)
    return u


def stage1(raw):
    uro, mro = sheet_rows(raw, "unit"), sheet_rows(raw, "model")
    for rid in (UNIT, SPAWNED):
        assert not any(r[2]["id"] == rid for r in uro), rid + " already exists"
    assert not any(r[2]["id"] == MODEL for r in mro), MODEL + " already exists"
    trooper = find(uro, "TH_Trooper")
    model = copy.deepcopy(find(mro, "Th_Trooper")[2])
    model["id"] = MODEL            # PLACEHOLDER mesh: still the Thorvald Trooper prefab. The Sworn Sword S9 build is not exported yet.
    out = raw
    # insert from the end of the file backwards so earlier offsets stay valid
    jobs = [(find(mro, "Th_Trooper")[1], [model]), (trooper[1], [build_unit(trooper[2], False), build_unit(trooper[2], True)])]
    for pos, objs in sorted(jobs, key=lambda j: -j[0]):
        text = "".join("," + NL + "\t\t\t\t" + dump_row(o) for o in objs)
        out = out[:pos] + text + out[pos:]
    return out


def stage4(raw):
    tro = sheet_rows(raw, "trait")
    for rid in (BUFF, TRAIT):
        assert not any(r[2]["id"] == rid for r in tro), rid + " already exists"
    buff_src = find(tro, "Th_Trooper_Buff")
    trait_src = find(tro, "Th_Trooper_Trait")
    buff = copy.deepcopy(buff_src[2])
    buff.update(id=BUFF, name="Sworn Formation", desc="This unit fights closer to its sworn brothers.")
    buff["displayed"] = True
    trait = copy.deepcopy(trait_src[2])
    trait.update(id=TRAIT, name="Oath of the Blade")
    nb = {"target": {}, "target2": {}, "ref": "Entity_ExecuteImmune"}          # verified: Army.hurtBy checks it (row 552)
    form = []
    for u in (UNIT, SPAWNED):
        a = copy.deepcopy(trait_src[2]["attributes"][0])
        a["target"] = {"trait": BUFF}
        a["target2"] = {"unit": u}
        a["desc"] = "Gain ::target_effects:: per ally [!%s] at [Short_Range] (x::target_stacking_limit:: max)" % u
        form.append(a)
    trait["attributes"] = [nb] + form
    out = raw
    uro = sheet_rows(out, "unit")
    jobs = []
    for u in (UNIT, SPAWNED):
        p, e, obj = find(uro, u)
        obj = copy.deepcopy(obj)
        obj["traits"] = [{"ref": TRAIT}]
        jobs.append((p, e, dump_row(obj)))
    tro = sheet_rows(out, "trait")
    ins_pos = find(tro, "Th_Trooper_Buff")[1]
    jobs.append((ins_pos, ins_pos, "".join("," + NL + "\t\t\t\t" + dump_row(o) for o in (trait, buff))))
    for p, e, text in sorted(jobs, key=lambda j: -j[0]):
        out = out[:p] + text + out[e:]
    return out


def diff(a, b, path=""):
    """(kind, path) list between two parsed cdbs, sheet rows keyed by id."""
    res = []
    sa = {s["name"]: s for s in a["sheets"]}
    for s in b["sheets"]:
        n = s["name"]
        if n not in sa:
            res.append(("sheet+", n)); continue
        ra = {r.get("id"): r for r in sa[n]["lines"] if "id" in r}
        rb = {r.get("id"): r for r in s["lines"] if "id" in r}
        if len(sa[n]["lines"]) != len(ra) or len(s["lines"]) != len(rb):
            if sa[n]["lines"] != s["lines"]:
                res.append(("rows-without-id-changed", n))
            continue
        for i in rb:
            if i not in ra:
                res.append(("add", "%s/%s" % (n, i)))
            elif ra[i] != rb[i]:
                res.append(("edit", "%s/%s" % (n, i)))
        for i in ra:
            if i not in rb:
                res.append(("DEL", "%s/%s" % (n, i)))
    return res


def main():
    if "--revert" in sys.argv:
        shutil.copyfile(BEFORE, CDB); print("reverted from", BEFORE); return
    stage = sys.argv[sys.argv.index("--stage") + 1] if "--stage" in sys.argv else None
    assert stage in ("1", "4"), "--stage 1|4"
    raw = open(CDB, encoding="utf-8", newline="").read()
    new = stage1(raw) if stage == "1" else stage4(raw)
    want = ({("add", "unit/" + UNIT), ("add", "unit/" + SPAWNED), ("add", "model/" + MODEL)} if stage == "1" else
            {("edit", "unit/" + UNIT), ("edit", "unit/" + SPAWNED), ("add", "trait/" + TRAIT), ("add", "trait/" + BUFF)})
    got = diff(json.loads(raw), json.loads(new))
    print("parsed diff:", got)
    assert set(got) == want and len(got) == len(want), "unexpected change set"
    if "--dry" in sys.argv:
        print("dry run, nothing written"); return
    if not os.path.exists(BEFORE):
        os.makedirs(os.path.dirname(BEFORE), exist_ok=True); shutil.copyfile(CDB, BEFORE); print("saved", BEFORE)
    bk = os.path.join(REPO, "mod_files", "backups", "data_before_sworn_sword_stage%s.cdb" % stage)
    if os.path.isdir(os.path.dirname(bk)):
        shutil.copyfile(CDB, bk)
    open(CDB, "w", encoding="utf-8", newline="").write(new)
    print("CDB_SAVED stage", stage)


main()
