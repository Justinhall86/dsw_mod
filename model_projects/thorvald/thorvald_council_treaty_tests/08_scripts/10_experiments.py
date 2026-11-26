"""Council action / treaty experiments on mod_files/data.cdb. One experiment per build.

    python 10_experiments.py A1 --dry      show what would change
    python 10_experiments.py A1            apply (backs up to 07_data_cdb/data_BEFORE_A1.cdb first)
    python 10_experiments.py A1 --revert   restore that backup (refuses if data.cdb was edited since the apply)

A1: new trait Th_CouncilTest (next to Th_TestFreeArmy) with Unlock_TResAction -> LandsraadImmunity,
    added to faction Thorvald props.startingTraits. No vanilla row is edited.
A2: resAction Th_Walkout = copy of LandsraadImmunity (new id, Thorvald texts), unlocked by Th_CouncilTest (A1's unlock stays).
SMEAR: resAction Th_Smear = copy of Corruption (effects-driven, so a new id should work), unlocked by Th_CouncilTest.
B1: treaty Th_SponsorshipTest = copy of ImperialMandate without the lent units: Thorvald only, Peace, 50 Solari, duration -1,
    receiver trait Th_SponsorTest_Receiver (FreeVotes_Resolution_Flat 10), sender trait Th_SponsorTest_Sender
    (TRes_OnCouncilVoteEnd_Flat 50 Solari); Unlock_TTreaty on Th_CouncilTest.
B2: treaty Th_PatronageTest = copy of the stub TTreaty, Thorvald only, NeverActive cleared, TPatronage_Sender on the sender
    and TPatronage_Receiver on the receiver. Vanilla TTreaty is not edited.
K: Condottieri handoff (house_thorvald/handoff_condottieri_treaty_test.md). Treaty Th_Condottieri (K1): Thorvald only, Peace,
    100 Solari, 1 month, Breakable. Sender trait: TRes_Prod_Flat +5 Solari (K2a). Receiver trait: TRes_Prod_Flat -5 Solari (K2b)
    and Faction_DailySpawn_TUnit_Flat 1 TH_SwornSword_Spawned (K3). K4 = the 1-month duration + cancel behaviour. K5 = B2.
TRIB: treaty Th_TributeTest (K2c and B3): receiver trait with TRes_Tribute_Flat 0.2 Solari only. Thorvald only, Peace, until cancelled.
Apply order A1, A2, SMEAR, B1, B2, K, TRIB; revert in the reverse order (each revert checks the file is as that step left it).
"""
import copy
import hashlib, json, os, shutil, sys
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BK = os.path.join(HERE, "..", "07_data_cdb")
TEST_TRAIT = "Th_CouncilTest"


def dumps(d): return json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", "\r\n").encode("utf-8")
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
def sheet(d, n): return next(s for s in d["sheets"] if s["name"] == n)["lines"]


def a1(d):
    traits = sheet(d, "trait")
    assert not any(t["id"] == TEST_TRAIT for t in traits), TEST_TRAIT + " already exists"
    assert any(r["id"] == "LandsraadImmunity" for r in sheet(d, "resAction"))
    i = next(k for k, t in enumerate(traits) if t["id"] == "Th_TestFreeArmy")
    traits.insert(i + 1, {
        "id": TEST_TRAIT, "name": "TEST: Council action A1", "type": 0, "displayed": True,
        "desc": "Experiment A1: Thorvald may use Landsraad Immunity at the Council.",
        "props": {"tip": {"allowed": True, "padExpand": True}},
        "attributes": [{"target": {"resAction": "LandsraadImmunity"}, "target2": {}, "ref": "Unlock_TResAction",
                        "desc": "Can use [LandsraadImmunity] on a resolution to become immune to it"}],
        "gfx": {"file": "UI/icons/unitsTraits.png", "size": 64, "x": 42, "y": 0}})
    st = next(f for f in sheet(d, "faction") if f["id"] == "Thorvald")["props"]["startingTraits"]
    st.append({"trait": TEST_TRAIT, "displayed": True})
    return ["trait +%s after Th_TestFreeArmy (row %d)" % (TEST_TRAIT, i + 1), "faction Thorvald startingTraits +" + TEST_TRAIT]


def test_trait(d): return next(t for t in sheet(d, "trait") if t["id"] == TEST_TRAIT)


def clone_res_action(d, src, new_id, texts, unlock_desc):
    rows = sheet(d, "resAction")
    assert not any(r["id"] == new_id for r in rows), new_id + " already exists"
    r = copy.deepcopy(next(x for x in rows if x["id"] == src))
    r["id"] = new_id; r["issuingFaction"] = "Thorvald"; r["texts"] = texts
    i = next(k for k, x in enumerate(rows) if x["id"] == "LandsraadFavorite")   # keep the built-in row last
    rows.insert(i, r)
    test_trait(d)["attributes"].append({"target": {"resAction": new_id}, "target2": {}, "ref": "Unlock_TResAction", "desc": unlock_desc})
    return ["resAction +%s (copy of %s) at row %d" % (new_id, src, i), "trait %s +Unlock_TResAction %s" % (TEST_TRAIT, new_id)]


def a2(d):
    return clone_res_action(d, "LandsraadImmunity", "Th_Walkout", {
        "name": "Walkout (test)", "actionTitle": "Walk out (test)",
        "actionDesc": "TEST A2: a copy of Landsraad Immunity under a new id. Thorvald walks out to become immune to this resolution.",
        "currentTitleOwner": "[Thorvald-adjective] Walkout", "currentTitleOpponent": "[Thorvald-adjective] Walkout",
        "currentDescOwner": "You have walked out on this resolution.",
        "currentDescOpponent": "[Thorvald-longname] has walked out on this resolution."},
        "TEST A2: can use [Th_Walkout] on a resolution")


def smear(d):
    return clone_res_action(d, "Corruption", "Th_Smear", {
        "name": "Smear (test)", "actionTitle": "Smear (test)",
        "actionDesc": "TEST: a copy of Corruption under a new id. Elected faction ::effects::.",
        "currentTitleOwner": "[Thorvald-adjective] Smear",
        "currentDescOwner": "Effect on elected faction: ::effects::."},
        "TEST: can use [Th_Smear] on a resolution")


def add_treaty(d, after, row, traits, unlock_desc):
    rows = sheet(d, "treaty"); tr = sheet(d, "trait")
    assert not any(r["id"] == row["id"] for r in rows), row["id"] + " already exists"
    for t in traits:
        assert not any(x["id"] == t["id"] for x in tr), t["id"] + " already exists"
    j = next(k for k, x in enumerate(tr) if x["id"] == "TPatronage_Receiver")
    tr[j + 1:j + 1] = traits
    i = next(k for k, x in enumerate(rows) if x["id"] == after)
    rows.insert(i + 1, row)
    test_trait(d)["attributes"].append({"target": {"treaty": row["id"]}, "target2": {}, "ref": "Unlock_TTreaty", "desc": unlock_desc})
    return ["treaty +%s after %s" % (row["id"], after)] + ["trait +" + t["id"] for t in traits] + ["trait %s +Unlock_TTreaty %s" % (TEST_TRAIT, row["id"])]


def gift_trait(i, name, attrs):
    return {"id": i, "desc": "", "props": {"tip": {"cat": "DiplomaticGift"}}, "attributes": attrs, "type": 0, "displayed": False, "name": name}


def b1(d):
    src = next(x for x in sheet(d, "treaty") if x["id"] == "ImperialMandate")
    r = copy.deepcopy(src)
    r.update(id="Th_SponsorshipTest", name="Sponsorship (test)",
             desc="TEST B1: the partner gets 10 free votes on every resolution; Thorvald gets 50 Solari after every Council.",
             costs=[{"res": "Solari", "qty": 50}], effects=[],
             stats=[{"duration": -1, "relationshipChange": 0, "relationshipGain": 0, "tradeValue": 1200}],
             traits=[{"trait": "Th_SponsorTest_Receiver", "apply": 2, "comment": "", "flags": 0, "bonusType": 1},
                     {"trait": "Th_SponsorTest_Sender", "apply": 1, "comment": "", "flags": 0, "bonusType": 1}])
    r["props"] = {"group": 1, "onlyForFactions": [{"ref": "Thorvald"}], "diplomaticStatuses": [{"ref": "Peace"}], "tip": {"cat": "DiplomaticGift"}}
    return add_treaty(d, "ImperialMandate", r, [
        gift_trait("Th_SponsorTest_Sender", "Sponsorship (test)", [{"target": {"resource": "Solari"}, "ref": "TRes_OnCouncilVoteEnd_Flat",
                   "target2": {}, "val": 50, "desc": "::s_value:: [Solari] after every Council"}]),
        gift_trait("Th_SponsorTest_Receiver", "Sponsorship (test)", [{"target": {}, "target2": {}, "ref": "FreeVotes_Resolution_Flat",
                   "val": 10, "desc": "The first ::value:: votes placed on each resolution are free."}])],
        "TEST B1: can offer [Th_SponsorshipTest]")


def b2(d):
    r = copy.deepcopy(next(x for x in sheet(d, "treaty") if x["id"] == "TTreaty"))
    r.update(id="Th_PatronageTest", name="Patronage (test)", desc="TEST B2: the stub treaty with its receiver trait (+20% Life and Power).", flags=513,
             traits=[{"trait": "TPatronage_Sender", "apply": 1, "comment": "", "flags": 0, "bonusType": 1},
                     {"trait": "TPatronage_Receiver", "apply": 2, "comment": "", "flags": 0, "bonusType": 1}])
    r["props"]["onlyForFactions"] = [{"ref": "Thorvald"}]
    return add_treaty(d, "TTreaty", r, [], "TEST B2: can offer [Th_PatronageTest]")


def th_treaty(d, new_id, name, desc, cost, duration, traits):
    r = copy.deepcopy(next(x for x in sheet(d, "treaty") if x["id"] == "ImperialMandate"))
    r.update(id=new_id, name=name, desc=desc, costs=[{"res": "Solari", "qty": cost}], effects=[], flags=1 + 16 + 512,
             stats=[{"duration": duration, "relationshipChange": 0, "relationshipGain": 0, "tradeValue": 1200}], traits=traits)
    r["props"] = {"group": 1, "onlyForFactions": [{"ref": "Thorvald"}], "diplomaticStatuses": [{"ref": "Peace"}], "tip": {"cat": "DiplomaticGift"}}
    return r


def k(d):
    after = next(x["id"] for x in sheet(d, "treaty") if x["id"] in ("Th_SponsorshipTest",)) if any(
        x["id"] == "Th_SponsorshipTest" for x in sheet(d, "treaty")) else "ImperialMandate"
    r = th_treaty(d, "Th_Condottieri", "Condottieri (test)",
                  "TEST K: Thorvald hires out a company. The partner pays 5 Solari production and receives a Sworn Sword each day.", 100, 1,
                  [{"trait": "Th_Condottieri_Sender", "apply": 1, "comment": "", "flags": 0, "bonusType": 1},
                   {"trait": "Th_Condottieri_Receiver", "apply": 2, "comment": "", "flags": 0, "bonusType": 1}])
    return add_treaty(d, after, r, [
        gift_trait("Th_Condottieri_Sender", "Condottieri (test)", [{"target": {"resource": "Solari"}, "ref": "TRes_Prod_Flat", "val": 5,
                   "target2": {}, "desc": "::s_value:: [Solari] production"}]),
        gift_trait("Th_Condottieri_Receiver", "Condottieri (test)", [
            {"target": {"resource": "Solari"}, "ref": "TRes_Prod_Flat", "val": -5, "target2": {}, "desc": "::s_value:: [Solari] production"},
            {"target": {"unit": "TH_SwornSword_Spawned"}, "ref": "Faction_DailySpawn_TUnit_Flat", "val": 1, "target2": {},
             "desc": "Each day, receive ::value:: [TH_SwornSword_Spawned] near your Main Base"}])],
        "TEST K: can offer [Th_Condottieri]")


def trib(d):
    r = th_treaty(d, "Th_TributeTest", "Tribute (test)", "TEST: the partner gives 20% of its Solari production to Thorvald.", 50, -1,
                  [{"trait": "Th_TributeTest_Receiver", "apply": 2, "comment": "", "flags": 0, "bonusType": 2}])
    return add_treaty(d, "Th_Condottieri", r, [
        gift_trait("Th_TributeTest_Receiver", "Tribute (test)", [{"target": {"resource": "Solari"}, "ref": "TRes_Tribute_Flat", "val": 0.2,
                   "target2": {}}])], "TEST: can offer [Th_TributeTest]")


EXP = {"K": k, "TRIB": trib, "A1": a1, "A2": a2, "SMEAR": smear, "B1": b1, "B2": b2}
if __name__ == "__main__":
    name = sys.argv[1]; bk = os.path.join(BK, "data_BEFORE_%s.cdb" % name); mark = bk + ".applied_sha"
    if "--revert" in sys.argv:
        assert os.path.exists(bk), "no backup " + bk
        if sha(CDB) != open(mark).read().strip() and "--force" not in sys.argv:
            sys.exit("data.cdb changed since %s was applied: look at the change first (--force to restore anyway)" % name)
        shutil.copy2(bk, CDB); os.remove(mark); print("restored", CDB, "from", bk); sys.exit()
    raw = open(CDB, "rb").read(); d = json.loads(raw.decode("utf-8-sig"))
    assert dumps(d) == raw, "data.cdb does not round-trip byte for byte; not editing"
    for line in EXP[name](d): print("  ", line)
    if "--dry" in sys.argv: print("dry run: nothing written"); sys.exit()
    assert not os.path.exists(mark), name + " is already applied"
    os.makedirs(BK, exist_ok=True); shutil.copy2(CDB, bk)
    open(CDB, "wb").write(dumps(d)); open(mark, "w").write(sha(CDB))
    print("backup:", bk, "\nwrote", CDB, sha(CDB))
