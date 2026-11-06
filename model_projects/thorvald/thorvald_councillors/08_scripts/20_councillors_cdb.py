"""Set up House Thorvald's four councillors (perks + portraits) and the Thorvald agent portraits in data.cdb.

    python 20_councillors_cdb.py            # DRY RUN on a temp copy, prints what changes
    python 20_councillors_cdb.py --apply    # edit mod_files/data.cdb (backup first)
    python 20_councillors_cdb.py --revert   # put the old rows back from 07_data_cdb/before_rows.json

Run 10_make_portraits.py first: it makes the PNG atlases these rows point at (new files, no vanilla atlas is touched).

What changes (Thorvald only; no other faction's row is edited except that Thorvald is dropped from the Corrino agent pool C1..C10):
  character Nobru, ThEin, Silva, Haruka   portraits (gfx, menuGfx, tutoGfx), description, AI domain, Silva's gender
  trait NobruPassive, ThEinPassive, SilvaPassive, HarukaPassive   the perks; every attribute is one vanilla traits already use
  agent Th1..Th7   new, inserted after C10, 5 male + 2 female, no trait overlays; Corrino's C1..C10 no longer list Thorvald

Council order, portrait cell index: Nobru 0, Ein 1, Silva 2, Haruka 3.
"""
import copy
import json
import os
import shutil
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(os.path.dirname(PROJ)))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
SNAP = os.path.join(PROJ, "07_data_cdb", "before_rows.json")
APPLY = "--apply" in sys.argv or "--revert" in sys.argv
REVERT = "--revert" in sys.argv
WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(REAL, WORK)
data, exact = C.load(WORK)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte through cdb_tools; refusing")
S = C.sheets(data)
chars, traits, agents = C.by_id(S["character"]), C.by_id(S["trait"]), C.by_id(S["agent"])

ICON_FILE = "UI/Faction/councillors_thorvald.png"
MENU_FILE = "UI/Faction/Menu/menuCouncilorsThorvald.png"
TUTO_FILE = "UI/Faction/Menu/councillorsThorvald.png"
AG_SMALL, AG_BIG = "UI/spying/agents/agents_thorvald.png", "UI/spying/agents/agents_thorvald_big.png"
RESOURCE = lambda r: {"resource": r}  # noqa: E731


def attr(ref, val=None, desc=None, target=None, scope=None, displayed=None):
    a = {"target": target or {}, "target2": {}, "ref": ref}
    if val is not None:
        a["val"] = val
    if desc is not None:
        a["desc"] = desc
    if scope is not None:
        a["scope"] = scope
    if displayed is not None:
        a["displayed"] = displayed
    return a


# id -> (portrait cell, character edits, trait name, attributes)
COUNCIL = {
    "Nobru": dict(
        cell=0, title="Adjutant", gender=0, ai="Statecraft",
        desc="Adjutant Nobru, Earl Memnon's man on the Landsraad floor: he trades alloy contracts for votes and buys CHOAM shares cheaper than anyone.",
        trait="Market Patronage",
        attrs=[
            attr("FreeVotes_Resolution_Flat", 20, "The first ::value:: votes placed on each resolution are free."),
            attr("CMarket_Share_BuyPrice_MRatio", 0.85, "::s_percent:: [CHOAMShare] buying price"),
        ]),
    "ThEin": dict(
        cell=1, title="Envoy", gender=0, ai="Military",
        desc="Envoy Theodoric Ein, the War Academy-trained field envoy who speaks for the house on the ground: leaner payrolls, "
             "veteran recruits and armour where an operation is running.",
        trait="Academy Doctrine",
        attrs=[
            attr("Army_TResUpkeep_MRatio", 0.9, "::percent:: Military Unit [Solari] [!Upkeep]", RESOURCE("Solari")),
            attr("Army_SpawnExperienceLevel_Flat", 1, "Military Units start with ::value:: more [Experience] level"),
            attr("FactionArmy_InZoneWithOperation_Armor_Flat", 1,
                 "Units in a region with an active [Thorvald-adjective] operation gain ::s_value:: [Armor]"),
        ]),
    "Silva": dict(
        cell=2, title="Master", gender=0, ai="Economy",
        desc="Master Silva, who ran the smelting decks of Heighforge: village buildings cost less Plascrete, go up faster and cost less Solari to keep.",
        trait="Supply Line Optimization",
        attrs=[
            attr("Building_Village_TResCost_MRatio", 0.85, "::s_percent:: [Plascrete] construction costs", RESOURCE("Plascrete")),
            attr("Building_ConstructionSpeed_ARatio", 0.2, "[!Building_Village]s are constructed ::percent_value:: faster"),
            attr("Building_TRes_Upkeep_MRatio", 0.8, "::percent:: [Solari] [!Upkeep]", RESOURCE("Solari")),
        ]),
    "Haruka": dict(
        cell=3, title="Lady", gender=1, ai=None,  # keeps its own aiTypes / aiDisabled
        desc="Lady Haruka, spymaster: every infiltration level pays in Influence and Intel, and operations are cheaper and ready sooner.",
        trait="Corporate Espionage",
        attrs=[
            attr("TRes_ProdPerInfiltrationLevels_Flat", 1, "Produces ::s_value:: [Influence] per [!Infiltration] level in another faction",
                 RESOURCE("Influence")),
            attr("TRes_ProdPerInfiltrationLevels_Flat", 1, "Produces ::s_value:: [Intel] per [!Infiltration] level in another faction",
                 RESOURCE("Intel")),
            attr("Mission_PreparationTime_MRatio", 0.75, "::s_percent:: mission preparation time"),
            attr("Mission_Cost_MRatio", 0.85, "::s_percent:: spying mission costs", scope=2),
        ]),
}

# agent id -> (cell col, row, genderIndex, pickRatio)
AGENTS = [
    ("Th1", 0, 0, 1, 1), ("Th2", 1, 0, 1, 1), ("Th3", 2, 0, 1, 1), ("Th4", 3, 0, 1, 1), ("Th5", 4, 0, 1, 0.1),
    ("Th6", 0, 1, 2, 1), ("Th7", 1, 1, 2, 1),
]
POOL = ["C%d" % i for i in range(1, 11)]


def snapshot():
    if os.path.exists(SNAP):
        return json.load(open(SNAP, encoding="utf-8"))
    snap = {
        "characters": {k: chars[k] for k in COUNCIL},
        "traits": {k + "Passive": traits[k + "Passive"] for k in COUNCIL},
        "agent_needs": {a: agents[a]["need"] for a in POOL},
    }
    os.makedirs(os.path.dirname(SNAP), exist_ok=True)
    json.dump(copy.deepcopy(snap), open(SNAP, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    return snap


if REVERT:
    snap = json.load(open(SNAP, encoding="utf-8"))
    for k, row in snap["characters"].items():
        chars[k].clear(); chars[k].update(row)
    for k, row in snap["traits"].items():
        traits[k].clear(); traits[k].update(row)
    for a, need in snap["agent_needs"].items():
        agents[a]["need"] = need
    lines = S["agent"]["lines"]
    lines[:] = [r for r in lines if r["id"] not in {a[0] for a in AGENTS}]
    print("reverted councillors, passive traits, Corrino agent pool; removed", [a[0] for a in AGENTS])
else:
    snapshot()
    for cid, spec in COUNCIL.items():
        c = chars[cid]
        i = spec["cell"]
        c["gfx"] = {"file": ICON_FILE, "size": 128, "x": i, "y": 0}
        c["images"] = {
            "menuGfx": {"file": MENU_FILE, "size": 1, "x": i * 336, "y": 0, "width": 336, "height": 624},
            "tutoGfx": {"file": TUTO_FILE, "size": 1, "x": i * 180, "y": 0, "width": 180, "height": 320},
        }
        c["title"], c["gender"], c["desc"] = spec["title"], spec["gender"], spec["desc"]
        if spec["ai"]:
            c["aiTypes"] = [{"domain": spec["ai"]}]
        t = traits[cid + "Passive"]
        t["name"] = spec["trait"]
        t["gfx"] = {"file": ICON_FILE, "size": 128, "x": i, "y": 0}
        t["attributes"] = copy.deepcopy(spec["attrs"])
        t["displayed"] = False
        t["desc"] = ""
        t["props"] = {"tip": {"cat": "Councillor"}}
    # agents: new rows after C10, Thorvald leaves Corrino's pool
    for a in POOL:
        for need in agents[a]["need"]:
            need["factions"] = [f for f in need.get("factions", []) if f["ref"] != "Thorvald"]
    lines = S["agent"]["lines"]
    lines[:] = [r for r in lines if r["id"] not in {a[0] for a in AGENTS}]
    at = max(i for i, r in enumerate(lines) if r["id"] in POOL) + 1
    for n, (aid, col, row, gender, pick) in enumerate(AGENTS):
        lines.insert(at + n, {
            "id": aid,
            "gfx": {"file": AG_SMALL, "size": 80, "x": col, "y": row},
            "largeGfx": {"file": AG_BIG, "size": 240, "x": col, "y": row},
            "overlays": [],
            "need": [{"factions": [{"ref": "Thorvald"}], "traits": [], "priority": 0, "genderIndex": gender}],
            "pickRatio": pick,
        })
    print("councillors:", {k: (chars[k]["title"], traits[k + "Passive"]["name"], len(traits[k + "Passive"]["attributes"])) for k in COUNCIL})
    print("agents added:", [a[0] for a in AGENTS], "| pool C1..C10 factions:", {a: [f["ref"] for n in agents[a]["need"] for f in n["factions"]] for a in POOL[:2]})

if APPLY:
    print("backup:", C.backup(REAL, "before_thorvald_councillors" if not REVERT else "before_thorvald_councillors_revert"))
    keep = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_thorvald_councillors.cdb")
    if not REVERT and not os.path.exists(keep):
        shutil.copy2(REAL, keep)
open(WORK, "wb").write(C.dumps(data))
print(("wrote " if APPLY else "dry run, wrote ") + WORK)
