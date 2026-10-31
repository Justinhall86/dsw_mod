"""Add House Thorvald as a playable faction by cloning House Corrino, then swapping in the Thorvald units we have built.

    python 53_add_thorvald_faction.py            # DRY RUN: builds the result in a temp file and reports; real data.cdb untouched
    python 53_add_thorvald_faction.py --apply    # writes mod_files/data.cdb (backup first); then run repackage.py --quiet --no-launch

Same recipe as model_projects/ginaz_faction/08_scripts/16_add_ginaz_faction.py (Atreides -> Ginaz), adapted for Corrino:
 1. clone every Corrino-only row (units, models, traits, abilities, combos, projectiles, developments, base preview, infiltration resource,
    characters, music, the faction row, its HQ structure, main-base region and territory). Ids: C_x -> Th_x, Corrino -> Thorvald.
 2. twin pass: every shared row that lists Corrino (or a Corrino unit) in a list gets a Thorvald twin element; every other faction gets Thorvald
    in its diplomacy (war), Thorvald is at war with Corrino.
 3. Thorvald specifics: name/colour/texts, HQ + region + territory names, leader/hero/councillor names from house_thorvald/*.md.
 4. unit swaps (only where we have built the equivalent): Trooper, Ranged, heavy weapon, Elite, Frigate take the LIVE Thorvald models of the
    Atreides-slot units A_Trooper / A_Soldier / A_Demo / A_Elite / A_Frigate. Stats, traits, combos and costs stay Corrino's.
Conquest mode is not touched.
"""
import copy
import json
import os
import re
import shutil
import sys
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

REAL = os.path.join(REPO, "mod_files", "data.cdb")
APPLY = "--apply" in sys.argv
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


# ---------------------------------------------------------------------------------------------- what gets cloned
CHARS = {"Shaddam": "Memnon", "Wensicia": "Karlin", "Aramsham": "Vane",
         "Zum": "ThJool", "Mohiam": "Silva", "Fenring": "Haruka", "Irulan": "Nobru"}
SKIP_TRAIT = re.compile(r"^(Conquest_|CB_|Q_)")
EXTRA_ID = {"Nuke_Area": "Th_Nuke_Area", "CDroneInstall": "TDroneInstall", "CDroneLeave": "TDroneLeave",
            "CFrigateDeploy": "TFrigateDeploy", "CFrigateLeave": "TFrigateLeave"}


def new_id(old):
    if old == "Corrino":
        return "Thorvald"
    if old in EXTRA_ID:
        return EXTRA_ID[old]
    if old.startswith("C_"):
        return "Th_" + old[2:]
    if "Corrino" in old:
        return old.replace("Corrino", "Thorvald")
    for k, v in CHARS.items():
        if old == k:
            return v
        if old.startswith(k) and len(old) > len(k) and (old[len(k)].isupper() or old[len(k)] == "_"):
            return v + old[len(k):]
    return old


CLONE = {s: [] for s in ("unit", "model", "trait", "ability", "combo", "projectile", "development", "building", "resource",
                         "character", "music", "faction", "region", "structure", "territory")}
CLONE["unit"] = [u for u, r in ids("unit").items() if r.get("faction") == "Corrino"]
CLONE["model"] = [m for m in ids("model") if m.startswith("C_")]
CLONE["trait"] = [t for t in ids("trait")
                  if not SKIP_TRAIT.match(t) and (t == "Corrino" or t in EXTRA_ID or t.startswith(("Corrino_", "TCorrino", "C_"))
                                                  or re.match(r"^(%s)(Passive|_|[A-Z])" % "|".join(CHARS), t))]
CLONE["ability"] = [a for a in ids("ability") if a.startswith("C_") or a in EXTRA_ID]
CLONE["combo"] = [a for a in ids("combo") if a.startswith("C_") or a in EXTRA_ID]
CLONE["projectile"] = [a for a in ids("projectile") if a.startswith("C_")]
CLONE["development"] = [k for k, v in ids("development").items() if v.get("faction") == "Corrino"]
CLONE["building"] = ["CorrinoBasePreview"]
CLONE["resource"] = ["Corrino_Infiltration"]
CLONE["character"] = list(CHARS)
CLONE["music"] = ["Corrino"]
CLONE["faction"] = ["Corrino"]
CLONE["region"] = ["ImperialBase"]
CLONE["structure"] = ["ImpBase"]
CLONE["territory"] = ["EmperorsLanding"]

REGION_NEW, CITY_NEW, TERRITORY_NEW = "ThorvaldBase", "ThorvaldCitadel", "ReachOfThorvald"
M = {"Corrino": "Thorvald", "ImpBase": CITY_NEW, "ImperialBase": REGION_NEW, "EmperorsLanding": TERRITORY_NEW}   # exact-string id map
for sheet, lst in CLONE.items():
    for old in lst:
        if sheet in ("region", "structure", "territory", "faction"):
            continue
        n = new_id(old)
        if sheet == "development" and "Corrino" not in old:
            n = "Thorvald_" + old
        M[old] = n
for sheet, lst in CLONE.items():
    for old in lst:
        n = {"region": REGION_NEW, "structure": CITY_NEW, "territory": TERRITORY_NEW}.get(sheet, M.get(old, old))
        if n in ids(sheet) and n != old:
            sys.exit("id collision: %s.%s already exists" % (sheet, n))
# the same new id must not be produced by two different old ids
inv = {}
for o, n in M.items():
    if n in inv and inv[n] != o:
        sys.exit("two ids map to %s: %s and %s" % (n, inv[n], o))
    inv[n] = o

TEXTKEYS = {"desc", "name", "title", "shortName", "longName", "adjective", "cityInfo", "firstname", "lastname", "tip"}
BRACKET = re.compile(r"\[(!?)([A-Za-z0-9_]+)((?:-[a-z]+)?)\]")


def map_prose(s):
    s = BRACKET.sub(lambda m: "[%s%s%s]" % (m.group(1), M.get(m.group(2), m.group(2)), m.group(3)), s)
    if " " in s or "|" in s:
        s = re.sub(r"\bCorrino\b", "Thorvald", s)
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
        row["id"] = {"region": REGION_NEW, "structure": CITY_NEW, "territory": TERRITORY_NEW}.get(sheet, M.get(old, old))
        new_rows[(sheet, row["id"])] = row
        lines = S[sheet]["lines"]
        lines.insert(lines.index(base) + 1, row)
log.append("cloned rows: " + ", ".join("%s %d" % (s, len(l)) for s, l in CLONE.items()))

# ---------------------------------------------------------------------------------------------- twin pass on shared rows
TWIN_SHEETS = ("trait", "building", "development", "equipment", "ability", "baseAction", "domain", "hegemony", "infiltration", "agent", "mission",
               "treaty", "resource", "structure", "unit", "model")
cloned_keys = set(new_rows) | {(s, o) for s, l in CLONE.items() for o in l}
SKIP_PREFIX = ("Tuto_", "CBattle_", "CB_", "Q_")
STRUCT_OK = ("CrashedShip", "CrashedShip_quest", "CrashedOrnithopter")
KEEP_OUT = ("Corrino", "ImpBase", "ImperialBase", "EmperorsLanding")           # the faction's own anchors are not "twinned" as ids
twins = {}


def has_direct(e):
    if isinstance(e, str):
        return e in M and e not in ("ImpBase", "ImperialBase", "EmperorsLanding")
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
        # the Ginaz faction (cloned earlier) is a different house: never twin its rows with Thorvald elements
        if isinstance(lid, str) and (lid.startswith("G_") or "Ginaz" in lid):
            continue
        twin(row, sheet, lid)
log.append("twin pass: %d rows got Thorvald twins (%d elements)" % (len(twins), sum(twins.values())))

# diplomacy: everyone is at war with Thorvald by default, Thorvald with everyone; Thorvald vs its parent house is war too
for f in ids("faction").values():
    dd = (f.get("props") or {}).get("defaultDiplomaticStatus")
    if dd is None or f["id"] == "Thorvald":
        continue
    if not any(e.get("faction") == "Thorvald" for e in dd):
        dd.append({"faction": "Thorvald", "diplomacy": "War"})
th = ids("faction")["Thorvald"]
dd = th["props"]["defaultDiplomaticStatus"]
dd[:] = [e for e in dd if e.get("faction") != "Thorvald"]
if not any(e.get("faction") == "Corrino" for e in dd):
    dd.append({"faction": "Corrino", "diplomacy": "War"})

# ---------------------------------------------------------------------------------------------- Thorvald specifics
th["color"] = 0xB26E3C                                    # copper, the house colour
th["texts"].update({
    "name": "House Thorvald", "longName": "House|Thorvald", "shortName": "Thorvald", "adjective": "Thorvald",
    "plural": {"name": "House Thorvald", "longName": "House|Thorvald", "shortName": "Thorvald"},
    "desc": "House Thorvald is an economic power that buys its wars. It mints its own money, hires mercenaries and works the markets of the Landsraad, "
            "and it comes to Arrakis to turn the spice war into a profitable contract.",
    "cityInfo": "Fortified industrial citadel of the Thorvald syndicate"})
th["props"]["initials"] = "T"
th["landmarks"].update({"region": REGION_NEW, "territory": TERRITORY_NEW, "city": CITY_NEW})

hq = ids("structure")[CITY_NEW]
hq["texts"]["name"] = "Thorvald Citadel"
hq["texts"]["plural"] = {"name": "Thorvald Citadels"}
hq["texts"]["desc"] = ("The mobile citadel of House Thorvald: a lighter-borne foundry, mint and war room that lets the syndicate run an army "
                       "from a single armoured base.")
ids("building")["ThorvaldBasePreview"]["texts"]["name"] = "Thorvald Base Preview"
reg = ids("region")[REGION_NEW]
reg["name"] = "Thorvald Citadel"
reg["props"]["faction"] = "Thorvald"
ter = ids("territory")[TERRITORY_NEW]
ter["texts"] = {"name": "Reach of Thorvald", "desc": "House Thorvald has settled its citadel here, behind contract guards bought with its own coin."}
ter["props"]["mainBasePresent"] = CITY_NEW

NAMES = {
    "Memnon": dict(firstname="Memnon", lastname="Thorvald", title="Earl", gender=0,
                   desc="Earl Memnon Thorvald, head of the Thorvald syndicate: a grey-streaked industrialist in a long black coat who treats every war as a contract to be won."),
    "Karlin": dict(firstname="Karlin", lastname="Mallenor", title="Commander", gender=0,
                   desc="Karlin Mallenor, a buff-and-support commander whose presence hardens the ranks around him. (working name)"),
    "Vane": dict(firstname="Vane", lastname="Torrver", title="Captain", gender=0,
                 desc="Vane Torrver, a rocket specialist who opens fights from camouflage. (working name)"),
    "ThJool": dict(firstname="Jool", lastname="", title="Overseer", gender=0,
                   desc="Overseer Jool, the syndicate's military overseer: forces fighting near Thorvald territory gain Power and Armor."),
    "Silva": dict(firstname="Silva", lastname="", title="Master", desc="Master Silva, infrastructure and logistics: cheaper, faster village buildings and lighter upkeep on infrastructure."),
    "Haruka": dict(firstname="Haruka", lastname="", title="Lady", gender=1,
                   desc="Lady Haruka, spymaster: agents working Arrakis or CHOAM bring in Intel and Influence."),
    "Nobru": dict(firstname="Nobru", lastname="", title="Adjutant", gender=0,
                  desc="Adjutant Nobru, political and market manipulator: Landsraad patronage and cheaper CHOAM shares."),
}
for cid, nm in NAMES.items():
    ids("character")[cid].update(nm)
ids("unit")["Th_Hero_1"]["texts"]["name"] = "Karlin Mallenor"
ids("unit")["Th_Hero_2"]["texts"]["name"] = "Vane Torrver"

# ---------------------------------------------------------------------------------------------- unit swaps: the Thorvald models we built
UM, MM = ids("unit"), ids("model")


def faction_fix(o):
    """Atreides -> Thorvald inside a copied model `props` (preload factions)."""
    if isinstance(o, dict):
        return {k: faction_fix(v) for k, v in o.items()}
    if isinstance(o, list):
        return [faction_fix(v) for v in o]
    return "Thorvald" if o == "Atreides" else o


def swap_model(new_mid, src_mid, also=()):
    src = MM[src_mid]
    for mid in (new_mid,) + tuple(also):
        m = MM[mid]
        m["mesh"] = copy.deepcopy(src["mesh"])
        for k in ("inherit", "scale", "rigName"):
            if k in src:
                m[k] = src[k]
        if "props" in src:
            m["props"] = faction_fix(copy.deepcopy(src["props"]))
        if "anim" in src:
            m["anim"] = copy.deepcopy(src["anim"])
    log.append("model %s <- live Thorvald model %s (mesh %s, inherit %s, rig %s, scale %s)"
               % (new_mid, src_mid, src["mesh"][0]["path"], src.get("inherit"), src.get("rigName"), src.get("scale")))


swap_model("Th_Trooper", "A_Trooper")
swap_model("Th_Soldier", "A_Soldier")
swap_model("Th_Special", "A_Demo")
swap_model("Th_Elite", "A_Elite", also=("Th_Elite2", "Th_Elite3", "Th_Elite_Blood1", "Th_Elite_Blood2"))
swap_model("Th_Frigate", "A_Frigate")
# the Corrino elite takes its model list from the parent unit (Sardaukar variants); give it exactly our model
UM["Th_Elite"].setdefault("effects", {})["models"] = [{"ref": "Th_Elite", "flags": 0}]

NAMES_U = {
    "Th_Trooper": ("Thorvald Trooper", "Thorvald Troopers",
                  "Contract swordsmen of House Thorvald: dark long coats, a wide kasa hat and a katana, bought and paid for in Solari."),
    "Th_Soldier": ("Iron Ranger", "Iron Rangers",
                  "Thorvald marksmen with a long rifle, hired for their patience and kept on the payroll for their aim."),
    "Th_Special": ("Iron Guard", "Iron Guards",
                  "Heavy weapon troopers of House Thorvald armed with a shoulder-fired launcher. (Attack logic is still the Corrino flamer.)"),
    "Th_Elite": ("Heavy Vanguard", "Heavy Vanguards",
                "Armoured Thorvald shock troops with a layered shield and a halberd, the syndicate's answer to elite infantry."),
    "Th_Frigate": ("Thorvald Frigate", "Thorvald Frigates",
                  "A black and copper gunship of House Thorvald: wide armoured hull, small rear jets and a heavy forward battery."),
}
for uid, (name, plural, desc) in NAMES_U.items():
    UM[uid]["texts"]["name"] = name
    UM[uid]["texts"]["plural"] = {"name": plural}
    UM[uid]["texts"]["desc"] = desc
for uid in ("Th_Trooper_Aramsham",):
    UM[uid]["texts"]["name"] = "Thorvald Trooper"
for uid in ("Th_Soldier_Aramsham", "Th_Soldier_Conquest"):
    UM[uid]["texts"]["name"] = "Iron Ranger"
UM["Th_Frigate_Deployed"]["texts"]["name"] = "Thorvald Frigate"

if APPLY:
    print("backup:", C.backup(REAL, "before_thorvald_faction"))
with open(WORK, "wb") as f:
    f.write(C.dumps(data))
if APPLY:
    print("applied to", WORK)
print("\n".join(log))
print("units for Thorvald:", [u for u, v in ids("unit").items() if v.get("faction") == "Thorvald"])
print("HQ startUnits:", hq.get("startUnits"))
print("work file:", WORK)
