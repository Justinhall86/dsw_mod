"""House Thorvald x Renegades: early renegade drops in Thorvald colours plus three Thorvald operations.

    python 10_renegade_operations.py            # DRY RUN: builds the result in a temp file and reports; real data.cdb untouched
    python 10_renegade_operations.py --apply    # writes mod_files/data.cdb (backup first + 07_data_cdb/data_BEFORE_renegades.cdb)
    python 10_renegade_operations.py --revert   # restores 07_data_cdb/data_BEFORE_renegades.cdb

All of it is data-only. Every mechanism was traced in hlboot.dat first (see ../SPEC.md for the engine notes):
 1. Arrival at 1:00. Raid_Renegades_HegemonyUnlock 5000 -> 2 and every playable faction produces +1 Hegemony per day, so all
    players reach 2 by day 2 (= 60 s; DAY_DURATION is 30 s). The first drop threshold is -1, so the drop fires straight away.
    The drop, the pillager raids and the base militia use ThR_* units: Renegade-faction clones that wear the Thorvald models.
    Thorvald starts with Th_RenegadePact: Renegade pillager raids never target Thorvald.
 2. Operation "Renegade Strike" (target an enemy main base): the enemy faction gets Th_RenegadeStrike_Signal for 35 s, whose
    TRaid_HostileSpawn_DaysFrequency drops the Th_RenegadeStrike raid (shuttles, ThR_* units) onto one of their structures.
 3. Operation "Iron Landfall" (target any region): a 5 s owner trait with Operation_OnUsed_SpawnTUnit_Flat, which the engine
    resolves after the operation, recruits Thorvald squads and teleports them into the targeted region.
 4. Operation "Renegade Takeover" (target a neutral or enemy village): uses the engine's GhostMarket ability branch, which spawns
    the ability's SWorldEvent structure in the target region, owned by the caster. We point it at Th_RenegadeBase (a world event
    with the Renegade Base shuttle model) and apply RenegadeControl to the village for as long as that base stands.
    Enemies can send a unit to dismantle the base for Solari.
"""
import copy
import json
import os
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
PROJECT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BEFORE = os.path.join(PROJECT, "07_data_cdb", "data_BEFORE_renegades.cdb")
APPLY = "--apply" in sys.argv

if "--revert" in sys.argv:
    if not os.path.exists(BEFORE):
        sys.exit(f"no {BEFORE} to revert to")
    print("backup:", C.backup(REAL, "before_renegades_revert"))
    shutil.copy2(BEFORE, REAL)
    sys.exit(f"restored {REAL} from {BEFORE}")

WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)

data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
S = C.sheets(data)
log = []


def ids(sheet):
    return C.by_id(S[sheet])


def put(sheet, row):
    """Add a row, or replace it in place if the id exists (so re-running the script is idempotent)."""
    lines = S[sheet]["lines"]
    for i, l in enumerate(lines):
        if l.get("id") == row["id"]:
            lines[i] = row
            log.append(f"{sheet}: replaced {row['id']}")
            return row
    lines.append(row)
    log.append(f"{sheet}: added {row['id']}")
    return row


def clone(sheet, src, new_id):
    row = copy.deepcopy(ids(sheet)[src])
    row["id"] = new_id
    return row


if "ThR_Trooper" in ids("unit"):
    sys.exit("renegade rows already present: run --revert first, then --apply (the script expects the pre-renegade cdb)")

# Thorvald unit ids are TH_* after thorvald_faction/08_scripts/54_rename_units_TH.py, Th_* before it.
TH = "TH_" if "TH_Trooper" in ids("unit") else "Th_"

# ------------------------------------------------------------------------------------------------ 1. Renegades in Thorvald colours
DESC = ("Corsairs flying under no banner but paid in Thorvald Solari. They hitch on the Spacing Guild ships and land wherever the "
        "Earl's ledgers say a profit can be made.")
U = ids("unit")

thr = clone("unit", "Renegades_Trooper", "ThR_Trooper")
thr["texts"] = {"name": "Iron Corsair", "plural": {"name": "Iron Corsairs"}, "desc": DESC}
thr["effects"]["models"] = [{"ref": "Th_Trooper", "flags": 0}]
put("unit", thr)

rng = clone("unit", "Renegades_Trooper", "ThR_Ranger")
rng["inherits"] = "Ranged"
rng["texts"] = {"name": "Iron Corsair Marksman", "plural": {"name": "Iron Corsair Marksmen"}, "desc": DESC}
rng["stats"] = [{"power": 14, "armor": 2, "health": 450, "speed": 4, "maxSupply": 200, "maxExpLevel": 0, "range": 35}]
rng["effects"]["models"] = [{"ref": "Th_Soldier", "flags": 0}]
put("unit", rng)

grd = clone("unit", "Renegades_Demo", "ThR_Guard")
grd["texts"] = {"name": "Iron Corsair Gunner", "plural": {"name": "Iron Corsair Gunners"}, "desc": DESC}
grd["effects"]["models"] = [{"ref": "Th_Special", "flags": 0}]
put("unit", grd)

shp = clone("unit", "Renegade_Ship", "ThR_Ship")
shp["texts"] = {"name": "Iron Corsair Raider", "plural": {"name": "Iron Corsair Raiders"}, "desc": DESC}
shp["effects"]["models"] = [{"ref": "Th_Ship", "flags": 0}]
shp["attacks"] = {"combos": [{"ref": "Th_Ship_Attack", "weight": 1}]}
put("unit", shp)

SWAP = {"Renegades_Trooper": "ThR_Trooper", "Renegades_Demo": "ThR_Guard", "Renegade_Ship": "ThR_Ship"}
R = ids("raid")
for rid in ("Renegade_Drop", "Renegade_Pillagers"):
    comp = R[rid]["armies"][0]["composition"]
    for n, e in enumerate(comp):
        if e.get("unit") in SWAP:
            e["unit"] = SWAP[e["unit"]]
        # every third trooper becomes a marksman so the drops are mixed
        if e.get("unit") == "ThR_Trooper" and n % 3 == 2:
            e["unit"] = "ThR_Ranger"
    log.append(f"raid {rid}: composition -> {[e['unit'] for e in comp]}")
for mil in ids("structure")["RenegadeBase"]["militia"]:
    for e in mil["composition"]:
        e["unit"] = SWAP.get(e["unit"], e["unit"])
log.append("structure RenegadeBase: militia -> ThR_*")

# Renegades unlock when EVERY player has Hegemony >= this (Raids.regularUpdate, closure f@29701 on resource row 7).
# 0 = unlocked from the first tick. The 60 s delay is the hlboot.dat patch 30_patch_hlboot_drop_timer.py (the first drop
# threshold -1.0 -> 2.0 days). Two data-only timers failed in the engine:
#  - resStockConditions crashes every game start ("Can't cast i32 to enum<Comparison>");
#  - Hegemony baseProduction never counts, because getResource(Hegemony) returns HegemonyData.getTotal(), not the stock.
ids("constant")["Raid_Renegades_HegemonyUnlock"]["value"] = 0
log.append("constant Raid_Renegades_HegemonyUnlock -> 0")
put("trait", {
    "id": "Th_RenegadePact", "name": "Renegade Pact", "type": 0, "displayed": True,
    "desc": "The Renegades are on the Thorvald payroll: their pillagers leave Thorvald villages alone.",
    "props": {"tip": {"allowed": True, "padExpand": True}},
    "attributes": [{"target": {"raid": "Renegade_Pillagers"}, "target2": {}, "ref": "TRaid_Block",
                    "desc": "Cannot be targeted by Renegade pillager raids"}],
    "gfx": {"file": "UI/icons/unitsTraits.png", "size": 64, "x": 42, "y": 0},
})
for fid, f in ids("faction").items():
    st = f.get("props", {}).get("startingTraits")
    if not st:
        continue
    if fid == "Thorvald" and not any(x.get("trait") == "Th_RenegadePact" for x in st):
        st.append({"trait": "Th_RenegadePact", "displayed": False})
        log.append("faction Thorvald: +Th_RenegadePact")

# ------------------------------------------------------------------------------------------------ 2. Renegade Strike
put("raid", {
    "id": "Th_RenegadeStrike", "name": "Renegade Strike",
    "armies": [{"weight": 0, "composition": [
        {"unit": "ThR_Trooper", "condition": {}}, {"unit": "ThR_Trooper", "condition": {}},
        {"unit": "ThR_Ranger", "condition": {}}, {"unit": "ThR_Guard", "condition": {}},
        {"unit": "ThR_Ship", "condition": {}},
        {"unit": "ThR_Trooper", "minGameDays": 150, "condition": {}},
        {"unit": "ThR_Guard", "minGameDays": 250, "condition": {}},
    ]}],
    "effects": [{"target": 0, "effect": {"action": 3, "actionDays": 3}, "startConditions": {"distance": 30}, "endConditions": {}}],
    "props": {"apparitionRadius": 20, "chaseTime": 5, "maxDistanceWaitingTime": 10, "victimAlerts": [{"alert": "IncomingRaid"}]},
    "gfx": {"file": "UI/Faction/unitsSmall.png", "size": 80, "x": 5, "y": 5},
    "flags": 1,  # ShuttleOrigin: each army arrives on a renegade shuttle
    "steps": [],
})
put("trait", {
    "id": "Th_RenegadeStrike_Signal", "name": "Renegade Strike", "type": 2, "displayed": True,
    "desc": "House Thorvald has sold this faction's coordinates to the Renegades. Their shuttles are inbound.",
    "props": {"duration": 35, "linkedAbility": "Th_RenegadeStrike", "tip": {"cat": "RegionalEffect"}},
    "attributes": [{"target": {"raid": "Th_RenegadeStrike"}, "target2": {}, "ref": "TRaid_HostileSpawn_DaysFrequency", "val": 0.01,
                    "desc": "Renegade shuttles land on one of this faction's structures"}],
    "gfx": {"file": "UI/icons/missionsTraits.png", "size": 32, "x": 2, "y": 0},
})
ab = clone("ability", "AdministrativeBurden", "Th_RenegadeStrike")
ab.pop("duration", None)
ab["name"] = "Renegade Strike"
ab["desc"] = ("Sell an enemy's coordinates to the Renegade fleet. Within a day their shuttles land on one of that faction's "
              "villages and pillage it.")
ab["traits"] = [{"trait": "Th_RenegadeStrike_Signal", "apply": 3, "comments": "", "props": {"hideApplyTarget": True}}]
ab["gfx"] = {"file": "UI/icons/skill_icons02.png", "size": 30, "x": 2, "y": 0}
put("ability", ab)

# ------------------------------------------------------------------------------------------------ 3. Iron Landfall
put("trait", {
    "id": "Th_IronLandfall", "name": "Iron Landfall", "type": 0, "displayed": False, "desc": "",
    "props": {"duration": 5, "linkedAbility": "Th_IronLandfall", "tip": {"allowed": False, "padExpand": False}},
    "attributes": [
        {"target": {"unit": TH + "Trooper"}, "target2": {}, "ref": "Operation_OnUsed_SpawnTUnit_Flat", "val": 2,
         "desc": f"::value:: [{TH}Trooper]s land in the target region"},
        {"target": {"unit": TH + "Soldier"}, "target2": {}, "ref": "Operation_OnUsed_SpawnTUnit_Flat", "val": 1,
         "desc": f"::value:: [{TH}Soldier] lands in the target region"},
        {"target": {"unit": TH + "Special"}, "target2": {}, "ref": "Operation_OnUsed_SpawnTUnit_Flat", "val": 1,
         "desc": f"::value:: [{TH}Special] lands in the target region"},
    ],
    "gfx": {"file": "UI/icons/missionsTraits.png", "size": 32, "x": 2, "y": 0},
})
ab = clone("ability", "SupplyDrop", "Th_IronLandfall")
ab.pop("duration", None)
ab["name"] = "Iron Landfall"
ab["desc"] = ("Renegade shuttles on the Thorvald payroll land a company of Thorvald troops in the chosen region: two Troopers, "
              "an Iron Ranger and an Iron Guard.")
ab["traits"] = [{"trait": "Th_IronLandfall", "apply": 1, "comments": "", "props": {"hideApplyTarget": True}}]
ab["gfx"] = {"file": "UI/icons/skill_icons02.png", "size": 30, "x": 34, "y": 0}
put("ability", ab)

# ------------------------------------------------------------------------------------------------ 4. Renegade Takeover
mdl = clone("model", "RenegadeBase", "Th_RenegadeBase")
mdl["scale"] = 2.2
put("model", mdl)
base = ids("structure")["RenegadeBase"]
put("structure", {
    "id": "Th_RenegadeBase",
    "texts": {"name": "Thorvald Renegade Base", "plural": {"name": "Thorvald Renegade Bases"},
              "desc": "A Renegade shuttle on the Thorvald payroll has set down here. While it stands, the [Renegades] hold the nearby "
                      "[Village] and nobody can attack it.\n\nSend a unit to dismantle it and loot its [Solari]."},
    "model": "Th_RenegadeBase",
    "props": {
        "worldEvent": {"spawnProba": 0, "maxPerRegion": 1, "group": 0, "actions": [
            {"type": 1, "desc": "Dismantle the Renegade Base",
             "props": {"duration": 2, "notForCreator": True},
             "reward": {"res": [{"res": "Solari", "minQty": 500, "maxQty": 700, "time": 0},
                                {"res": "Solari", "minQty": 900, "maxQty": 1200, "time": 500}]},
             "aiWeights": [{"value": 20, "aiType": "Military"}]},
        ]},
        "lootingValue": copy.deepcopy(base["props"]["lootingValue"]),
        "tip": {"allowed": True, "padExpand": True, "cat": "Discovery"},
    },
    "militia": [], "stats": [], "startUnits": [], "flags": 16,
})
gm = ids("ability")["GhostMarket"]
gm.update({
    "name": "Renegade Takeover",
    "desc": ("Pay a Renegade crew to set their shuttle down next to a village. While their base stands the village is under "
             "Renegade control and cannot be attacked or annexed by anyone."),
    "flags": 0, "implemented": True,
    "display": {"where": 4, "alignment": 1},
    "apply": {"need": 3, "needSelector": True, "alignment": 6, "hostileAction": "Mission_NonHostile_Detected"},
    "props": {"unlockedBy": 1, "tip": {"allowed": True, "padExpand": True, "cat": "Operation"}},
    "otherEffects": [{"props": {"structure": "Th_RenegadeBase"}, "id": "SWorldEvent",
                      "comments": "engine: GhostMarket spawns this world event in the target region, owned by the caster"}],
    "traits": [{"trait": "RenegadeControl", "apply": 0, "comments": "", "props": {"hideApplyTarget": True}}],
})
log.append("ability GhostMarket -> Renegade Takeover")

# ------------------------------------------------------------------------------------------------ the three missions
NO_AI = [{"ref": "Economy"}, {"ref": "Military"}, {"ref": "Statecraft"}, {"ref": "Expansion"}]
for mid, ope, cost, icon in (("Th_MRenegadeStrike", "Th_RenegadeStrike", [{"qty": 100, "res": "Intel"}, {"qty": 300, "res": "Solari"}], 2),
                             ("Th_MIronLandfall", "Th_IronLandfall", [{"qty": 100, "res": "Intel"}, {"qty": 200, "res": "Solari"}], 3),
                             ("Th_MRenegadeTakeover", "GhostMarket", [{"qty": 150, "res": "Intel"}, {"qty": 500, "res": "Solari"}], 4)):
    put("mission", {
        "id": mid, "texts": [], "effects": {"ope": ope}, "difficulty": 0, "requiredLevels": [], "cost": cost, "flags": 1,
        "props": {"onlyForFactions": [{"faction": "Thorvald"}], "aiProhibited": NO_AI, "tip": {"cat": "Mission"}},
        "canBeDetected": True, "aiWeights": [],
        "gfx": {"file": "UI/spying/missionIconsBW.png", "size": 114, "x": icon, "y": 0},
    })

spec = ids("specCategory")["Armies"]["props"]["extraFactions"][0]["raids"]
if not any(r["ref"] == "Th_RenegadeStrike" for r in spec):
    spec.append({"ref": "Th_RenegadeStrike"})

# ------------------------------------------------------------------------------------------------ placement
# Sheets with separators give each row a `group` by position (cdb.Index.initLines). The engine filters on it:
# MissionManager.isMissionAllowed rejects mission group 2 ("Deprecated"), which hid the first version of these
# operations. So every new row goes right after a vanilla sibling. GhostMarket (vanilla, in the ability sheet's
# "Deprecated" group) moves into the Spying group as well.
PLACE = [
    ("unit", "ThR_Trooper", "Renegades_Leader"), ("unit", "ThR_Ranger", "ThR_Trooper"),
    ("unit", "ThR_Guard", "ThR_Ranger"), ("unit", "ThR_Ship", "ThR_Guard"),
    ("trait", "Th_RenegadePact", "Thorvald"),
    ("trait", "Th_RenegadeStrike_Signal", "OrbitalStrike"), ("trait", "Th_IronLandfall", "Th_RenegadeStrike_Signal"),
    ("raid", "Th_RenegadeStrike", "Renegade_Pillagers"),
    ("model", "Th_RenegadeBase", "RenegadeBase"), ("structure", "Th_RenegadeBase", "RenegadeBase"),
    ("ability", "GhostMarket", "AdministrativeBurden"), ("ability", "Th_RenegadeStrike", "GhostMarket"),
    ("ability", "Th_IronLandfall", "Th_RenegadeStrike"),
    ("mission", "Th_MRenegadeStrike", "MOrbitalStrike"), ("mission", "Th_MIronLandfall", "Th_MRenegadeStrike"),
    ("mission", "Th_MRenegadeTakeover", "Th_MIronLandfall"),
]
for sheet, rid, anchor in PLACE:
    lines = S[sheet]["lines"]
    row = next(l for l in lines if l.get("id") == rid)
    lines.remove(row)
    at = next(i for i, l in enumerate(lines) if l.get("id") == anchor)
    lines.insert(at + 1, row)
    # a separator that started at the moved row must not be left pointing at it
    for sp in S[sheet].get("separators") or []:
        if isinstance(sp, dict) and sp.get("id") == rid:
            sys.exit(f"{sheet}.{rid} starts a separator group; refusing to move it")
log.append(f"placed {len(PLACE)} rows next to their vanilla siblings")

# ------------------------------------------------------------------------------------------------ write
if APPLY:
    if not os.path.exists(BEFORE):
        shutil.copy2(REAL, BEFORE)
        print("kept", BEFORE)
    print("backup:", C.backup(REAL, "before_renegades"))
with open(WORK, "wb") as f:
    f.write(C.dumps(data))
print("\n".join(log))
print("written:", WORK)
