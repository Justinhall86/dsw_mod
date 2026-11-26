"""Six test operations that drop emplacements and drones by shuttle (Renegades HANDOFF item 4, the turret drop, widened for playtests).

    python 10_add_drop_ops.py --dry      show what would be added
    python 10_add_drop_ops.py            apply (backup: 07_data_cdb/data_BEFORE_drop_ops.cdb)
    python 10_add_drop_ops.py --revert   restore the backup (refuses if data.cdb changed since; --force overrides)

Each operation = mission + ability (field thDrop, read by the installed hlboot operations kit) + raid row (what lands).
Same path as Iron Landfall C, which worked in the 2026-11-11 playtest. Adds rows only. Needs TH_Drone1 and TH_Drone2 (thorvald_drones)."""
import copy, hashlib, json, os, shutil, sys
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BK = os.path.join(HERE, "..", "07_data_cdb", "data_BEFORE_drop_ops.cdb"); MARK = BK + ".applied_sha"

OPS = [  # key, name, description, units landed (one shuttle each), extra raid fields
    ("SniperNest", "Drop: Sniper Nest", "Shuttles land three immobile Sniper Nests in the chosen region.",
     ["TH_Turret_Sniper"] * 3, {}),
    ("RocketBattery", "Drop: Rocket Battery", "Shuttles land two immobile Rocket Batteries in the chosen region.",
     ["TH_Turret_Rocket"] * 2, {}),
    ("FieldDepot", "Drop: Field Depot", "A shuttle lands a Quartermaster Drone that is already set up as a Field Depot.",
     ["TH_Drone2_Deployed"], {}),
    ("ThumperSwarm", "Drop: Thumper Swarm", "Shuttles land three Thumper Drones. Deploy them to call the worm.",
     ["TH_Drone1"] * 3, {}),
    ("BlackHulls", "Drop: Black Hull Wave", "The Iron Landfall company arrives one by one in Renegade drop ships.",
     ["TH_Trooper", "TH_Trooper", "TH_Soldier", "TH_Special"], {"thShip": "ThR_DropShip", "thStagger": 1.5}),
    ("Firebase", "Drop: Firebase", "A complete position: a Sniper Nest, a Rocket Battery and a Field Depot.",
     ["TH_Turret_Sniper", "TH_Turret_Rocket", "TH_Drone2_Deployed"], {}),
]


def dumps(d): return json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", "\r\n").encode("utf-8")
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
def sheet(d, n): return next(s for s in d["sheets"] if s["name"] == n)["lines"]
def row(d, n, i): return next(r for r in sheet(d, n) if r["id"] == i)


def insert(d, n, after, rows):
    s = sheet(d, n); have = {r["id"] for r in s}
    for r in rows: assert r["id"] not in have, r["id"] + " already exists"
    i = next(k for k, r in enumerate(s) if r["id"] == after); s[i + 1:i + 1] = rows


def turret(d, uid, donor, name, plural, desc, stats):
    u = copy.deepcopy(row(d, "unit", donor))
    u.update(id=uid, traits=[{"ref": "Th_Turret_Trait"}], equipment=[], aiWeights=[], stats=[stats], flags=32)
    u["texts"] = {"name": name, "desc": desc, "plural": {"name": plural}}
    u["costs"] = {"recruit": [{"qty": 100, "res": "Solari"}], "upkeep": [{"qty": 5, "res": "Solari"}, {"qty": 1, "res": "CommandPoint"}]}
    u["props"] = {k: v for k, v in u["props"].items() if k != "wheelPosition"}
    return u


def apply(d):
    for need in ("TH_Drone1", "TH_Drone2_Deployed", "ThR_DropShip"): row(d, "unit", need)
    t = copy.deepcopy(row(d, "trait", "Th_Drone_Trait"))
    t.update(id="Th_Turret_Trait", name="Emplaced", attributes=[{"target": {}, "target2": {}, "ref": "CustomProperty", "desc": "Dug in where it lands: it cannot move"}])
    insert(d, "trait", "Th_Drone_Trait", [t])
    # speed is tiny rather than 0, as the Renegades hand-off advises: the drop gives every landed army a move order
    insert(d, "unit", "TH_Special", [
        turret(d, "TH_Turret_Sniper", "TH_Soldier", "Sniper Nest", "Sniper Nests", "Long-range riflemen dug in where the shuttle set them down.",
               {"health": 500, "power": 18, "armor": 3, "range": 55, "speed": 0.1}),
        turret(d, "TH_Turret_Rocket", "TH_Special", "Rocket Battery", "Rocket Batteries", "Heavy launchers dug in where the shuttle set them down.",
               {"health": 600, "power": 26, "armor": 3, "range": 45, "speed": 0.1})])
    raids, abils, miss = [], [], []
    for key, name, desc, units, extra in OPS:
        r = copy.deepcopy(row(d, "raid", "Th_LandfallCompany"))
        r.update(id="Th_Drop_" + key, name=name + " (shuttle drop)", **extra)
        r["armies"][0]["composition"] = [{"unit": u, "condition": {}} for u in units]
        raids.append(r)
        a = copy.deepcopy(row(d, "ability", "Th_IronLandfallC"))
        a.update(id="Th_Op_" + key, name=name, desc=desc, thDrop=r["id"]); abils.append(a)
        m = copy.deepcopy(row(d, "mission", "Th_MIronLandfallC"))
        m.update(id="Th_MOp_" + key, effects={"ope": a["id"]}); miss.append(m)
    insert(d, "raid", "Th_LandfallCompany", raids); insert(d, "ability", "Th_IronLandfallC", abils); insert(d, "mission", "Th_MExtractionC", miss)
    return ["unit +TH_Turret_Sniper, +TH_Turret_Rocket; trait +Th_Turret_Trait"] + ["operation " + o[1] + ": " + ", ".join(o[3]) for o in OPS]


if __name__ == "__main__":
    if "--revert" in sys.argv:
        if sha(CDB) != open(MARK).read().strip() and "--force" not in sys.argv:
            sys.exit("data.cdb changed since the drop ops were added: look at the change first (--force restores anyway)")
        shutil.copy2(BK, CDB); os.remove(MARK); print("restored from", BK); sys.exit()
    raw = open(CDB, "rb").read(); d = json.loads(raw.decode("utf-8-sig"))
    assert dumps(d) == raw, "data.cdb does not round-trip byte for byte; not editing"
    for line in apply(d): print("  ", line)
    if "--dry" in sys.argv: print("dry run: nothing written"); sys.exit()
    assert not os.path.exists(MARK), "already applied"
    os.makedirs(os.path.dirname(BK), exist_ok=True)
    shutil.copy2(CDB, BK); open(CDB, "wb").write(dumps(d)); open(MARK, "w").write(sha(CDB)); print("backup:", BK, "| wrote", sha(CDB))
