"""Renegade operations v2 (2026-11-09): the three operations rebuilt on what the engine really does (see SPEC.md, "v2").

    python 40_operations_v2.py            # dry run: parsed diff
    python 40_operations_v2.py --apply    # backup to 07_data_cdb/data_BEFORE_operations_v2.cdb, then write
    python 40_operations_v2.py --revert   # restore that backup

Why v1 did nothing (read from hlboot.dat):
 * An ability's traits are applied to the ability's TARGET ENTITY (AbilityManager.getApplyTarget: zone, struct, unit ...);
   `apply` only picks the faction the trait counts for. So:
   - Renegade Strike (need MainBase) put its signal on the enemy main-base BUILDING, but TRaid_HostileSpawn_DaysFrequency
     is read only on the faction (Faction.dailyUpdate): no raid ever came.
   - Iron Landfall (need Zone) put its spawn trait on the REGION, but Operation_OnUsed_SpawnTUnit_Flat is read only on the
     caster faction (MissionManager.onOperationUsed): nothing spawned.
 * Renegade Takeover (GhostMarket) made a world-event "base": not the game's RenegadeBase, so no pillager raids, nothing the AI
   attacks, and RenegadeControl made the village untargetable (shielding even an enemy's village).

v2:
 * Strike: the main base gets Th_RenegadeStrike_Mark (35 s), whose Entity_FactionOwner_GainTTrait gives the OWNER FACTION
   Th_RenegadeStrike_Signal while it lasts (Entity.updateAttributes; the vanilla hero passives use it). The signal's
   TRaid_HostileSpawn_DaysFrequency then drops raid Th_RenegadeStrike on one of their villages at the next daily tick.
   Raid flags 1 -> 65 (ShuttleOrigin + StickTarget, like vanilla LandsraadSoldiers).
 * Takeover: new ability Th_RenegadeTakeover (target a neutral village). The hlboot tick thorvald_sworn/thsw_ops.py turns its
   use into Raids.spawnRaid("Renegade_Drop", null, village, null): the game's own drop (shuttles, InstallHub, a real
   RenegadeBase with militia and pillager raids, Dismantle siege action).
 * Landfall: the GhostMarket ability (the only data path that puts something where you click) now lands a Renegade shuttle,
   Th_LandfallShuttle, in any region. Its creator-only actions: "Disembark the company" (TH_Trooper x2, TH_Soldier,
   TH_Special recruited at the shuttle for you, the vanilla MaraudersCamp reward path) and, experimental, "Send the crew
   raiding" (reward raid: true = the hard-coded Marauders raid owned by you, from the shuttle; no vanilla event uses it).
   Other houses can dismantle the shuttle (2 days, loot), with a higher AI weight.
"""
import copy
import json
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
CDB = os.path.join(REPO, "mod_files", "data.cdb")
BACKUP = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_operations_v2.cdb")

if "--revert" in sys.argv:
    shutil.copy2(BACKUP, CDB)
    print("reverted from", BACKUP)
    raise SystemExit

raw = open(CDB, encoding="utf-8", newline="").read()
NL = "\r\n" if "\r\n" in raw else "\n"
d = json.loads(raw)
before = copy.deepcopy(d)
S = {s["name"]: s for s in d["sheets"]}


def row(sheet, rid):
    return next(r for r in S[sheet]["lines"] if r.get("id") == rid)


def insert_after(sheet, after_id, new):
    lines = S[sheet]["lines"]
    assert not any(r.get("id") == new["id"] for r in lines), "%s.%s exists already" % (sheet, new["id"])
    i = next(i for i, r in enumerate(lines) if r.get("id") == after_id)
    lines.insert(i + 1, new)
    for sep in S[sheet].get("separators", []) or []:          # keep groups: separators after the insert move down one
        if isinstance(sep, dict) and "index" in sep and sep["index"] > i + 1:
            sep["index"] += 1


# ---------------------------------------------------------------- Strike
sig = row("trait", "Th_RenegadeStrike_Signal")
mark = {"id": "Th_RenegadeStrike_Mark", "name": "Renegade Strike", "type": 2, "displayed": True,
        "desc": "House Thorvald has sold these coordinates to the Renegades. Their shuttles are inbound.",
        "props": {"duration": 35, "linkedAbility": "Th_RenegadeStrike", "tip": {"cat": "RegionalEffect"}},
        "attributes": [{"target": {"trait": "Th_RenegadeStrike_Signal"}, "target2": {}, "ref": "Entity_FactionOwner_GainTTrait",
                        "displayed": False}],
        "gfx": copy.deepcopy(sig["gfx"])}
insert_after("trait", "Th_RenegadeStrike_Signal", mark)
ab = row("ability", "Th_RenegadeStrike")
ab["traits"] = [{"trait": "Th_RenegadeStrike_Mark", "apply": 3, "comments": "on the target main base; it gives the owner faction "
                 "Th_RenegadeStrike_Signal (Entity_FactionOwner_GainTTrait)", "props": {"hideApplyTarget": True}}]
row("raid", "Th_RenegadeStrike")["flags"] = 65

# ---------------------------------------------------------------- Takeover (engine hook spawns the drop)
gm = row("ability", "GhostMarket")
take = copy.deepcopy(gm)
take.update({"id": "Th_RenegadeTakeover", "otherEffects": [], "traits": [],
             "apply": {"need": 3, "needSelector": True, "alignment": 2, "hostileAction": "Mission_NonHostile_Detected"},
             "name": "Renegade Takeover",
             "desc": "Sell a neutral village's location to the Renegade fleet. Their shuttles land on it and the Renegades take it: "
                     "a Renegade Base, its militia and its raiders, until someone dismantles the base."})
insert_after("ability", "GhostMarket", take)
row("mission", "Th_MRenegadeTakeover")["effects"]["ope"] = "Th_RenegadeTakeover"

# ---------------------------------------------------------------- Landfall (GhostMarket shuttle)
base = row("structure", "Th_RenegadeBase")
shuttle = copy.deepcopy(base)
dismantle = copy.deepcopy(base["props"]["worldEvent"]["actions"][0])
dismantle["aiWeights"] = [{"value": 40, "aiType": "Military"}]
cost = [{"qty": 1, "res": "Solari", "time": 0}]
shuttle["id"] = "Th_LandfallShuttle"
shuttle["texts"] = {"name": "Thorvald Landing Shuttle", "plural": {"name": "Thorvald Landing Shuttles"},
                    "desc": "A Renegade shuttle on the Thorvald payroll has set down here with a company aboard.\n\n"
                            "House Thorvald can disembark the company or send the crew raiding. Anyone else can dismantle it."}
shuttle["props"]["worldEvent"]["actions"] = [
    {"type": 0, "desc": "Disembark the company", "props": {"cost": copy.deepcopy(cost), "onlyForCreator": True},
     "reward": {"units": [{"unit": "TH_Trooper", "nb": 2, "factionUnit": False}, {"unit": "TH_Soldier", "nb": 1, "factionUnit": False},
                          {"unit": "TH_Special", "nb": 1, "factionUnit": False}]}, "aiWeights": [{"value": 50, "aiType": "Military"}]},
    {"type": 0, "desc": "Send the crew raiding (experimental)", "props": {"cost": copy.deepcopy(cost), "onlyForCreator": True},
     "reward": {"raid": True}, "aiWeights": []},
    dismantle]
insert_after("structure", "Th_RenegadeBase", shuttle)
gm.update({"name": "Iron Landfall", "otherEffects": [{"props": {"structure": "Th_LandfallShuttle"}, "id": "SWorldEvent",
                                                     "comments": "engine: GhostMarket spawns this world event in the target region, owned by the caster"}],
           "traits": [], "apply": {"need": 0, "needSelector": True, "hostileAction": "Mission_NonHostile_Detected"},
           "gfx": copy.deepcopy(row("ability", "Th_IronLandfall")["gfx"]),
           "desc": "A Renegade shuttle on the Thorvald payroll lands in the chosen region. Disembark its company of Thorvald troops "
                   "(two Troopers, an Iron Ranger and an Iron Guard) there, or send its crew raiding."})
row("mission", "Th_MIronLandfall")["effects"]["ope"] = "GhostMarket"

# ---------------------------------------------------------------- check + write
out = json.dumps(d, indent="\t", ensure_ascii=False).replace("\n", NL)
a, b = json.loads(raw), json.loads(out)
changed = []
for sa, sb in zip(a["sheets"], b["sheets"]):
    ia = {r.get("id"): r for r in sa.get("lines", [])}
    ib = {r.get("id"): r for r in sb.get("lines", [])}
    for k in ib:
        if k not in ia:
            changed.append((sa["name"], k, "added"))
        elif ia[k] != ib[k]:
            changed.append((sa["name"], k, "changed"))
    assert sa.get("columns") == sb.get("columns")
for c in changed:
    print("  %-10s %-26s %s" % c)
want = {("trait", "Th_RenegadeStrike_Mark", "added"), ("ability", "Th_RenegadeStrike", "changed"),
        ("raid", "Th_RenegadeStrike", "changed"), ("ability", "Th_RenegadeTakeover", "added"),
        ("mission", "Th_MRenegadeTakeover", "changed"), ("structure", "Th_LandfallShuttle", "added"),
        ("ability", "GhostMarket", "changed"), ("mission", "Th_MIronLandfall", "changed")}
assert set(changed) == want, set(changed) ^ want
if "--apply" not in sys.argv:
    print("dry run; --apply to write")
    raise SystemExit
os.makedirs(os.path.dirname(BACKUP), exist_ok=True)
if not os.path.exists(BACKUP):
    shutil.copy2(CDB, BACKUP)
open(CDB, "w", encoding="utf-8", newline="").write(out)
print("written", CDB, "| backup", BACKUP)
