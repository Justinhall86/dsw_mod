"""Audit data.cdb: which building rows / model folders can NOT be built in Skirmish.

    python audit_buildings.py [path/to/data.cdb]      # default: newest mod_files/data_vanilla_*.cdb

Run it on a VANILLA cdb, not the working mod_files/data.cdb (that one has our edits).
Heuristic, see SKILL.md for the rules and their caveats.
"""
import collections
import glob
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
if len(sys.argv) > 1:
    CDB = sys.argv[1]
else:
    CDB = sorted(glob.glob(os.path.join(REPO, "mod_files", "data_vanilla_*.cdb")))[-1]
BLD_DIR = os.path.join(REPO, "model_inputs", "Structure", "Buildings")
DEAD_SECTIONS = {"Dev", "Obsolete (keep for saves)", "TestArtist"}   # building-sheet separators

raw = open(CDB, encoding="utf-8").read()
data = json.loads(raw)
S = {s["name"]: s for s in data["sheets"]}
rows = S["building"]["lines"]
ids = [r["id"] for r in rows]
idset = set(ids)

# section (separator title) of every building row
section, cur = {}, None
seps = {s["id"]: s["title"] for s in S["building"].get("separators", [])}
for r in rows:
    cur = seps.get(r["id"], cur)
    section[r["id"]] = cur

# 1. every Unlock_TBuilding* attribute that targets a building: who grants it
GATE = re.compile(r"^Unlock_TBuilding")
gates = collections.defaultdict(list)          # building -> [(ref, sheet, owner)]


def walk_gates(o, sheet, owner):
    if isinstance(o, dict):
        ref = o.get("ref")
        if isinstance(ref, str) and GATE.match(ref):
            b = (o.get("target") or {}).get("building")
            if b:
                gates[b].append((ref, sheet, owner))
        for v in o.values():
            walk_gates(v, sheet, owner)
    elif isinstance(o, list):
        for v in o:
            walk_gates(v, sheet, owner)


# 2. generic reverse index of string values, to ask "who mentions this trait/region"
mentions = collections.defaultdict(list)       # string -> [(sheet, owner)]


APPLY = re.compile(r"Gain|Apply|SetTTrait|GiveTTrait")
appliers = collections.defaultdict(list)       # trait -> [(sheet, owner)] that really put it on something


def walk_str(o, sheet, owner):
    if isinstance(o, dict):
        t = (o.get("target") or {}).get("trait") if isinstance(o.get("target"), dict) else None
        if t and isinstance(o.get("ref"), str) and APPLY.search(o["ref"]):
            appliers[t].append((sheet, owner))
        for v in o.values():
            walk_str(v, sheet, owner)
    elif isinstance(o, list):
        for v in o:
            walk_str(v, sheet, owner)
    elif isinstance(o, str) and len(o) < 80:
        mentions[o].append((sheet, owner))


for s in data["sheets"]:
    if "@" in s["name"]:
        continue
    for l in s["lines"]:
        walk_gates(l, s["name"], l.get("id", "?"))
        walk_str(l, s["name"], l.get("id", "?"))

# regions placed by a Skirmish map type (anything that is not Conquest C_* or a tutorial map)
skirmish_regions = set()
for m in S["mapType"]["lines"]:
    if m["id"].startswith(("C_", "MapTuto")):
        continue
    skirmish_regions |= {x.get("region") for x in m.get("specialsList", [])}


def trait_reachable(trait):
    """Can this trait be applied in a Skirmish game? Returns (bool, why)."""
    if trait.startswith("CB_"):
        return False, "Conquest bonus"
    if trait.startswith("Tuto"):
        return False, "tutorial"
    if trait.startswith("General_HegemonyBonus"):
        return True, "hegemony (engine-applied, no cdb reference)"
    # a mention only counts when it applies the trait: a region/territory/structure/bonus/character row that
    # lists it, or an attribute with a Gain/Apply ref. Resolutions and conditions merely read it.
    users = [(sh, o) for sh, o in mentions.get(trait, []) if sh in ("region", "territory", "structure", "bonus", "character")]
    users += appliers.get(trait, [])
    if not users:
        return False, "nothing applies it"
    why = []
    for sh, o in users:
        if sh == "region":
            if o in skirmish_regions:
                return True, "region %s is on Skirmish maps" % o
            why.append("region %s not on any Skirmish map" % o)
        elif sh == "territory":
            why.append("territory %s is Conquest-only" % o)
        elif sh == "character":
            return True, "councillor %s (passiveTrait)" % o
        elif sh == "bonus":
            why.append("Conquest bonus %s" % o)
        else:
            return True, "%s %s" % (sh, o)
    return False, "; ".join(why)


def gate_reachable(g):
    ref, sheet, owner = g
    if sheet == "development":
        return True, "development " + owner
    if sheet == "trait":
        ok, why = trait_reachable(owner)
        return ok, "trait %s: %s" % (owner, why)
    return True, "%s %s" % (sheet, owner)


print("cdb:", CDB, "\n")
print("== building rows that cannot be built in Skirmish ==")
for r in rows:
    b = r["id"]
    has_model = bool(r.get("visuals", {}).get("model"))
    states = r.get("states") or []
    sect = section[b]
    reason = None
    if sect in DEAD_SECTIONS:
        reason = "separator '%s'" % sect
    elif not states:
        reason = "empty states (no cost/duration)"
    elif gates.get(b):
        res = [gate_reachable(g) for g in gates[b]]
        if not any(ok for ok, _ in res):
            reason = "gated, no reachable unlock: " + " | ".join(w for _, w in res)
    if reason:
        print("  %-28s model=%-3s %s" % (b, "yes" if has_model else "no", reason))

print("\n== Structure/Buildings folders with no building row ==")
building_models = set()
for r in rows:
    for m in r.get("visuals", {}).get("model", []):
        parts = m["path"].split("/")
        if parts[:2] == ["Structure", "Buildings"]:
            building_models.add(parts[2])
for d in sorted(os.listdir(BLD_DIR)):
    if not os.path.isdir(os.path.join(BLD_DIR, d)) or d in building_models:
        continue
    n = raw.count("Structure/Buildings/%s/" % d)
    print("  %-24s %s" % (d, "no cdb reference at all" if n == 0 else "only non-building rows (%d paths)" % n))
