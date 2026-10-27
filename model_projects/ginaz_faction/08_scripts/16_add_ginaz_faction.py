"""Add House Ginaz as a 9th playable faction by cloning everything House Atreides has (a first, "filled with Atreides" version).

    python 16_add_ginaz_faction.py            # DRY RUN: builds the result in a temp file, prints a report, real data.cdb untouched
    python 16_add_ginaz_faction.py --apply    # writes mod_files/data.cdb (backup first); then run repackage.py --quiet --no-launch

What it does (all in data.cdb, nothing else):
 1. Undo what we did to ATREIDES while modding: A_Elite (Warden) model + unit go back to vanilla, Arrakeen.startUnits back to [A_Ornithopter],
    The Landsraad Elite (A_LandsraadGuard) belongs to a SEPARATE project: this script neither moves, clones nor deletes it, and keeps its Arrakeen start entry.
 2. Clone every Atreides-only row into a Ginaz twin (ids A_x -> G_x, Atreides -> Ginaz, characters renamed): units, models, traits, abilities, combos,
    projectile, developments (tech), the Fremen-embassy building, infiltration resource, 7 characters, music, plus the faction row, its main-base
    region, city structure and territory.
 3. Everywhere a shared row lists Atreides or an Atreides unit inside a list (faction filters, general hegemony traits targeting A_Elite, agent needs,
    infiltration slots, ...) a Ginaz twin element is appended ("twin pass").  Other factions get Ginaz in their diplomacy lists (war).
 4. The Ginaz units: G_Elite = Ginaz Captain (Warden slot of the new faction),
    Ginaz Neophyte and Master of Ginaz (new units, models from CharMOD).  Arrival: the Ginaz HQ starts with Swordmasters and the Captain squad.
Conquest mode is NOT touched (the Ginaz faction reuses Atreides' conquest assets but is not in Conquest.playableFactions).
"""
import copy
import json
import os
import re
import shutil
import sys
import tempfile
import types

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
SOURCE = sys.argv[sys.argv.index("--source") + 1] if "--source" in sys.argv else REAL    # dry runs only
VANILLA = os.path.join(REPO, "mod_files", "data_vanilla_2026-10-22.cdb")
APPLY = "--apply" in sys.argv
WORK = REAL if APPLY else os.path.join(tempfile.mkdtemp(), "data_trial.cdb")
if not APPLY:
    shutil.copy2(SOURCE, WORK)

data, _ = C.load(WORK)
vanilla, _ = C.load(VANILLA)
S = C.sheets(data)
V = C.sheets(vanilla)
log = []


def ids(sheet):
    return C.by_id(S[sheet])


def replace_line(sheet, id_, new):
    lines = S[sheet]["lines"]
    lines[lines.index(ids(sheet)[id_])] = new


# ---------------------------------------------------------------------------------------------- 1. undo our changes to Atreides
mod_unit = copy.deepcopy(ids("unit")["A_Elite"])
mod_model = copy.deepcopy(ids("model")["A_Elite"])
replace_line("unit", "A_Elite", copy.deepcopy(C.by_id(V["unit"])["A_Elite"]))
replace_line("model", "A_Elite", copy.deepcopy(C.by_id(V["model"])["A_Elite"]))
# Arrakeen goes back to vanilla; a Landsraad Elite start entry (the separate project's) is left exactly as found.
landsraad_start = [x for x in ids("structure")["Arrakeen"].get("startUnits", []) if x.get("unit") == "A_LandsraadGuard"]
ids("structure")["Arrakeen"]["startUnits"] = copy.deepcopy(C.by_id(V["structure"])["Arrakeen"]["startUnits"]) + landsraad_start
log.append("Atreides restored: A_Elite (Warden) unit+model vanilla, Arrakeen.startUnits = %s (Landsraad project untouched)" % ids("structure")["Arrakeen"]["startUnits"])

# ---------------------------------------------------------------------------------------------- 2. what gets cloned
CHARS = {"Leto": "Severin", "Thufir": "Chirox", "Yueh": "Jool", "Jessica": "Aya", "Paul": "Ran", "Duncan": "Cassian", "Gurney": "Dorian"}
SKIP_TRAIT = re.compile(r"^(Conquest_|CB_|Q_)")


def new_id(old):
    if old == "Atreides":
        return "Ginaz"
    if old.startswith("A_"):
        return "G_" + old[2:]
    if "Atreides" in old:
        return old.replace("Atreides", "Ginaz")
    for k, v in CHARS.items():
        if old == k:
            return v
        if old.startswith(k) and old[len(k)].isupper():
            return v + old[len(k):]
    return old


CLONE = {"unit": [], "model": [], "trait": [], "ability": [], "combo": [], "projectile": [], "development": [], "building": [], "resource": [],
         "character": [], "music": [], "faction": ["Atreides"], "region": ["Arrakeen"], "structure": ["Arrakeen"], "territory": ["PlainsOfArrakeen"]}
for u in ids("unit"):
    if u.startswith("A_") and u != "A_LandsraadGuard":      # the Landsraad Elite is another project: never cloned into Ginaz
        CLONE["unit"].append(u)
for m in ids("model"):
    if m.startswith("A_"):
        CLONE["model"].append(m)
for t in ids("trait"):
    if SKIP_TRAIT.match(t):
        continue
    if t == "Atreides" or t.startswith(("Atreides_", "TAtreides", "A_", "AtreidesFremen")) or re.match(r"^(%s)(Pass|[A-Z_])" % "|".join(CHARS), t):
        CLONE["trait"].append(t)
CLONE["ability"] = [a for a in ids("ability") if a.startswith("A_")]
CLONE["combo"] = [a for a in ids("combo") if a.startswith("A_")]
CLONE["projectile"] = [a for a in ids("projectile") if a.startswith("A_")]
CLONE["development"] = [k for k, v in ids("development").items() if v.get("faction") == "Atreides"]
CLONE["building"] = ["AtreidesFremenEmbassy"]
CLONE["resource"] = ["Atreides_Infiltration"]
CLONE["character"] = list(CHARS)
CLONE["music"] = ["Atreides"]

M = {"Atreides": "Ginaz", "Arrakeen": "GinazKeep", "PlainsOfArrakeen": "PlainsOfGinaz"}   # exact-string id map
for sheet, lst in CLONE.items():
    for old in lst:
        if sheet in ("region", "structure", "territory"):
            continue
        M[old] = new_id(old) if not (sheet == "development" and "Atreides" not in old) else "Ginaz_" + old
region_new = "GinazBase"
for sheet, lst in CLONE.items():
    for old in lst:
        n = M.get(old, old) if sheet not in ("region",) else region_new
        existing = ids(sheet) if sheet in S else {}
        if n in existing and n != old:
            sys.exit("id collision: %s.%s already exists" % (sheet, n))

TEXTKEYS = {"desc", "name", "title", "shortName", "longName", "adjective", "cityInfo", "firstname", "lastname", "tip"}
BRACKET = re.compile(r"\[(!?)([A-Za-z0-9_]+)((?:-[a-z]+)?)\]")


def map_prose(s):
    s = BRACKET.sub(lambda m: "[%s%s%s]" % (m.group(1), M.get(m.group(2), m.group(2)), m.group(3)), s)
    if " " in s or "|" in s:
        s = re.sub(r"\bAtreides\b", "Ginaz", s)
        s = re.sub(r"\bAtreide\b", "Ginaz", s)
        for k, v in CHARS.items():
            s = re.sub(r"\b%s\b" % k, v, s)
    return s


NOREMAP = {("character", "model"), ("structure", "model"), ("model", "inherit"), ("unit", "inherits")}


def rewrite(o, sheet=None, key=None):
    if isinstance(o, dict):
        return {k: rewrite(v, sheet, k) for k, v in o.items()}
    if isinstance(o, list):
        return [rewrite(v, sheet, key) for v in o]
    if isinstance(o, str):
        if (sheet, key) in NOREMAP:
            return o
        if o in M:
            return M[o]
        if key in TEXTKEYS or "[" in o:
            return map_prose(o)
    return o


new_rows = {}
for sheet, lst in CLONE.items():
    for old in lst:
        base = ids(sheet)[old]
        row = rewrite(copy.deepcopy(base), sheet)
        row["id"] = region_new if sheet == "region" else M[old]
        new_rows[(sheet, row["id"])] = row
        lines = S[sheet]["lines"]
        lines.insert(lines.index(base) + 1, row)
log.append("cloned rows: " + ", ".join("%s %d" % (s, len(l)) for s, l in CLONE.items()))

# ---------------------------------------------------------------------------------------------- 3. twin pass on shared rows
TWIN_SHEETS = ("trait", "building", "development", "equipment", "ability", "baseAction", "domain", "hegemony", "infiltration", "agent", "mission",
               "treaty", "resource", "structure", "unit", "model")
cloned_keys = set(new_rows) | {(s, o) for s, l in CLONE.items() for o in l}       # clones AND their Atreides originals are left alone
# The Landsraad Elite project's rows (unit A_Landsraad*, model N_LR_Elite*) are never touched: the pass would append Ginaz traits / factions to them.
cloned_keys |= {("unit", u) for u in ids("unit") if u.startswith("A_Landsraad")} | {("model", m) for m in ids("model") if m.startswith("N_LR_Elite")}
SKIP_PREFIX = ("Tuto_", "CBattle_", "CB_", "Q_")
STRUCT_OK = ("CrashedShip", "CrashedShip_quest", "CrashedOrnithopter")
twins = {}


def has_direct(e):
    if isinstance(e, str):
        return e in M and e not in ("Arrakeen", "PlainsOfArrakeen")
    if isinstance(e, dict):
        return any(has_direct(v) for v in e.values() if not isinstance(v, list))
    return False


def twin(o, sheet, lid):
    if isinstance(o, dict):
        for v in list(o.values()):
            twin(v, sheet, lid)
    elif isinstance(o, list):
        for e in o:
            twin(e, sheet, lid)
        add = []
        for e in o:
            if isinstance(e, (dict, str)) and has_direct(e):
                t = rewrite(copy.deepcopy(e), sheet)
                if t != e and t not in o and t not in add:
                    add.append(t)
        if add:
            o.extend(add)
            twins[(sheet, lid)] = twins.get((sheet, lid), 0) + len(add)


for sheet in TWIN_SHEETS:
    for row in S[sheet]["lines"]:
        lid = row.get("id")
        if (sheet, lid) in cloned_keys or (isinstance(lid, str) and lid.startswith(SKIP_PREFIX)):
            continue
        if sheet == "structure" and lid not in STRUCT_OK:
            continue
        twin(row, sheet, lid)
log.append("twin pass: %d rows got Ginaz twins (%d elements)" % (len(twins), sum(twins.values())))

# diplomacy: everyone is at war with Ginaz by default, Ginaz with everyone
for f in ids("faction").values():
    dd = (f.get("props") or {}).get("defaultDiplomaticStatus")
    if dd is None or f["id"] == "Ginaz":
        continue
    if not any(e.get("faction") == "Ginaz" for e in dd):
        dd.append({"faction": "Ginaz", "diplomacy": "War"})
gz = ids("faction")["Ginaz"]
dd = gz["props"]["defaultDiplomaticStatus"]
dd[:] = [e for e in dd if e.get("faction") != "Ginaz"]
if not any(e.get("faction") == "Atreides" for e in dd):
    dd.append({"faction": "Atreides", "diplomacy": "War"})

# ---------------------------------------------------------------------------------------------- 4. Ginaz specifics
gz["color"] = 0x7A1F3D
gz["texts"].update({
    "desc": "Having risen to become a storied Great House, House Ginaz comes to Arrakis to prove the supremacy of its martial school. Its sword-masters are the most feared "
            "duelling force in the galaxy, bound by ancient honor and intense rivalries.",
    "cityInfo": "Fortified school and seat of the Ginaz sword-masters on Arrakis"})
gz["props"]["initials"] = "G"
gz["landmarks"].update({"region": region_new, "territory": "PlainsOfGinaz", "city": "GinazKeep"})

keep = ids("structure")["GinazKeep"]
keep["texts"]["name"] = "Ginaz Enclave"
keep["texts"]["plural"] = {"name": "Ginaz Enclave"}
keep["texts"]["desc"] = ("The fortified school of House Ginaz on Arrakis: training yards, duelling courts and the quarters of the sword-masters, "
                         "behind the same bedrock walls that once guarded a city.")
reg = ids("region")[region_new]
reg["name"] = "Ginaz Enclave"
reg["props"]["faction"] = "Ginaz"
ter = ids("territory")["PlainsOfGinaz"]
ter["texts"] = {"name": "Plains of Ginaz", "desc": "The Ginaz sword-school holds these plains with steel and discipline."}
ter["props"]["mainBasePresent"] = "GinazKeep"
ter["props"]["signatureRegion"] = region_new

NAMES = {
    "Severin": dict(firstname="Severin", lastname="Ginaz", title="Lord",
                    desc="Lord Severin Ginaz, Grandmaster of the Sword-School, brought the full weight of the Ginaz schools to Arrakis. His presence instils a discipline that rejects fear and demands perfection and honour."),
    "Chirox": dict(firstname="Chirox", lastname="", title="Master", desc="Master Chirox, Sword Master Tactician: a grey-haired veteran of a hundred duels who teaches the school's discipline to every squad."),
    "Jool": dict(firstname="Jool", lastname="", title="Commander", desc="Commander Jool, Battlefield Warden: the school's arbiter in disputes of honour, quick to challenge and slow to forgive."),
    "Aya": dict(firstname="Aya", lastname="", title="Lady", desc="Lady Aya, Diplomat of Honor: she keeps the Code Duel and turns every feud into a ledger of standing."),
    "Ran": dict(firstname="Ran", lastname="", title="Adjutant", desc="Adjutant Ran, logistics and intelligence: he keeps swordmasters supplied in the deep desert and scouts ahead of them."),
    "Cassian": dict(firstname="Cassian", lastname="Vos", title="Master", desc="Cassian Vos, the Unyielding Blade: a living embodiment of Ginaz doctrine who has survived countless duels and slips past defences that would stop a lasgun bolt."),
    "Dorian": dict(firstname="Dorian", lastname="Vale", title="Warmaster", desc="Dorian Vale, a seasoned warmaster of the Ginaz schools and a loyal blade of the House. (placeholder hero, replace)"),
}
for cid, nm in NAMES.items():
    ids("character")[cid].update(nm)
ids("character")["Severin"]["model"] = "Leto"       # shared portrait/model references stay on the Atreides assets for now
for cid, orig in (("Chirox", "Thufir"), ("Jool", "Yueh"), ("Aya", "Jessica"), ("Ran", "Paul"), ("Cassian", "Duncan"), ("Dorian", "Gurney")):
    ids("character")[cid]["model"] = C.by_id(V["character"])[orig].get("model", ids("character")[cid].get("model"))

# --- G_Elite = Ginaz Captain (the takeover that used to live on Atreides' A_Elite)
ge = ids("unit")["G_Elite"]
gm = ids("model")["G_Elite"]
for k in ("inherit", "scale", "rigName"):
    gm[k] = mod_model[k]
gm["mesh"] = copy.deepcopy(mod_model["mesh"])
ge["props"]["squadSize"] = mod_unit["props"]["squadSize"]
ge["effects"]["sound"] = copy.deepcopy(mod_unit["effects"]["sound"])
ge["effects"]["events"] = copy.deepcopy(mod_unit["effects"]["events"])
ge["texts"]["name"] = "Ginaz Captain"
ge["texts"]["plural"] = {"name": "Ginaz Captains"}
ge["texts"]["desc"] = ("Captains of House Ginaz, trained in the way of the blade. They fight in long wine-red coats with a tall rapier, "
                       "and the House holds a small company of them at its enclave from the first day.")

# (The Landsraad Elite is a separate project and has no place in House Ginaz.)

# --- new units: Neophyte and Master of Ginaz (additive, cloned from Ginaz twins)
C.add_model(data, "N_Ginaz_Neophyte", "G_Trooper", "CharMOD/Male01_GinazNeophyte/Prefab_GinazNeophyte.prefab", "Ginaz", 1.0, "MilitaryCommon")
C.add_model(data, "N_Ginaz_Master", "G_Hero_1", "CharMOD/Male01_GinazMaster/Prefab_GinazMaster.prefab", "Ginaz", 1.15, "MilitaryCommon")
for mid in ("N_Ginaz_Neophyte", "N_Ginaz_Master"):
    pr = ids("model")[mid].get("props", {})
    pr.pop("dynObjects", None)
    pr.get("preload", {}).pop("excludableFx", None)
    pr.pop("animFxScale", None)
A = lambda **k: types.SimpleNamespace(**{**dict(clone_from=None, keep_flags=False, wheel_group=1, wheel_pos=None, name=None, plural=None, desc=None, free=False, train=0.1,
                                                 health=None, power=None, armor=None, squad_size=None, squad_spacing=None, range=None, equipment_from=None, add_trait=None), **k})
C.add_unit(data, A(id="G_GinazNeophyte", faction="Ginaz", model="N_Ginaz_Neophyte", clone_from="G_Trooper", name="Ginaz Neophyte", plural="Ginaz Neophytes",
                   squad_size=5, health=250, power=8, armor=2, equipment_from="G_Trooper", wheel_pos=11,
                   desc="Novices of the Ginaz Sword-School: lightly dressed, unarmed trainees who fight with fast footwork while they earn the right to carry a blade."))
C.add_unit(data, A(id="G_GinazMaster", faction="Ginaz", model="N_Ginaz_Master", clone_from="G_Hero_1", name="Master of Ginaz",
                   squad_size=1, health=900, power=28, armor=6, wheel_group=0, wheel_pos=0,
                   desc="A grey-streaked master of the Ginaz Sword-School in a gold-embroidered wine coat and cape, wielding a tall rapier."))
mu = ids("unit")["G_GinazMaster"]
mu["props"].pop("character", None)          # a plain elite unit, not Duncan's hero character

# --- start of game: Ornithopter + Swordmaster squad + Captain squad
keep["startUnits"] = [{"unit": "G_Ornithopter"}, {"unit": "G_Trooper"}, {"unit": "G_Elite"}]
log.append("Ginaz HQ startUnits = %s" % keep["startUnits"])

if APPLY:
    print("backup:", C.backup(REAL, "before_ginaz_faction"))
with open(WORK, "wb") as f:
    f.write(C.dumps(data))
if APPLY:
    print("applied to", WORK)
print("\n".join(log))
print("units for Ginaz:", [u for u, v in ids("unit").items() if v.get("faction") == "Ginaz"])
print("work file:", WORK)
