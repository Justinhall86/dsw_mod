"""Check a modded data.cdb against engine rules learned from hlboot.dat. These are things cdb_validate can't see.

    python engine_preflight.py [--cdb mod_files/data.cdb] [--vanilla mod_files/data_vanilla_<date>.cdb]

Exit code 1 if any FAIL. Each rule names the engine function it comes from.
  R1 faction unit ids: HUnit.getFactionUnitById resolves INITIALS.upper() + "_" + type. Every unit type all vanilla
     playable houses share must exist for every playable faction (otherwise null -> crash, e.g. OrniPanel at load).
  R2 row groups: rows a mod added must not sit in a separator group the engine skips (mission group "Deprecated" is
     rejected by MissionManager.isMissionAllowed) or in a dead group (Obsolete / Code / Classes / Test...).
  R3 resStockConditions: TraitsManager.getResBlockConditionFromData casts the raw int to enum<Comparison> and crashes.
  R4 Hegemony is not a stock: Faction.getResource(Hegemony) = HegemonyData total; baseProduction of it does nothing.
  R5 operations: each mission's effects.ope ability exists and is implemented; a mission must not be in group 2.
  R6 hard-coded row indexes: the attribute and constant sheets are read by row number (and resource rows 0-8 are used
     directly). Their rows must stay in vanilla order.
"""
import json
import os
import sys

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))


def arg(name, default):
    return sys.argv[sys.argv.index(name) + 1] if name in sys.argv else default


def newest_vanilla():
    d = os.path.join(REPO, "mod_files")
    v = sorted(f for f in os.listdir(d) if f.startswith("data_vanilla_") and f.endswith(".cdb"))
    return os.path.join(d, v[-1])


CDB = arg("--cdb", os.path.join(REPO, "mod_files", "data.cdb"))
VAN = arg("--vanilla", newest_vanilla())
mod = json.load(open(CDB, encoding="utf-8-sig"))
van = json.load(open(VAN, encoding="utf-8-sig"))
MS = {s["name"]: s for s in mod["sheets"]}
VS = {s["name"]: s for s in van["sheets"]}
fails, warns = [], []


def groups(sheet):
    """row id -> (group number, title), mirroring cdb.Index.initLines."""
    lines = sheet["lines"]
    seps = sheet.get("separators") or []
    pos = []
    for sp in seps:
        if isinstance(sp, dict):
            idx = sp.get("index")
            if idx is None and "id" in sp:
                idx = next((i for i, l in enumerate(lines) if l.get("id") == sp["id"]), None)
            if idx is not None:
                pos.append((idx, sp.get("title")))
        elif isinstance(sp, int):
            pos.append((sp, None))
    pos.sort(key=lambda x: x[0])
    g, title, out, si = -1, None, {}, 0
    while si < len(pos) and pos[si][0] == 0:
        if pos[si][1] is not None:
            g += 1; title = pos[si][1]
        si += 1
    g = max(g, 0)
    for i, l in enumerate(lines):
        while si < len(pos) and pos[si][0] == i:
            if pos[si][1] is not None:
                g += 1; title = pos[si][1]
            si += 1
        out[l.get("id")] = (g, title)
    return out


# R1 -------------------------------------------------------------------------------------------------
fac = [f for f in MS["faction"]["lines"] if f.get("props", {}).get("initials") and f.get("props", {}).get("startingTraits")]
vfac = {f["id"] for f in VS["faction"]["lines"]}
units = {u["id"] for u in MS["unit"]["lines"]}
types = None
for f in fac:
    if f["id"] not in vfac or f["id"] == "TEST":
        continue
    pre = f["props"]["initials"].upper() + "_"
    t = {u[len(pre):] for u in units if u.startswith(pre)}
    types = t if types is None else types & t
for f in fac:
    if f["id"] == "TEST":
        continue
    pre = f["props"]["initials"].upper() + "_"
    miss = sorted(t for t in (types or ()) if pre + t not in units)
    own = [u["id"] for u in MS["unit"]["lines"] if u.get("faction") == f["id"]]
    bad = [u for u in own if not u.startswith(pre)]
    if miss:
        fails.append(f"R1 {f['id']}: no unit {pre}<type> for {miss}")
    if bad and f["id"] not in vfac:
        warns.append(f"R1 {f['id']}: {len(bad)} own units don't use the {pre} prefix (only reachable by explicit id): {bad[:5]}")

# R2 / R5 --------------------------------------------------------------------------------------------
DEAD = ("deprecated", "obsolete", "code", "classes", "test", "debug")
for name, s in MS.items():
    if "@" in name or not (s.get("props") or {}).get("hasGroup") or name not in VS:
        continue
    vids = {l.get("id") for l in VS[name]["lines"]}
    vg = groups(VS[name])
    for rid, (g, title) in groups(s).items():
        if rid is None:
            continue
        moved_vanilla = rid in vids and vg.get(rid, (g, title))[1] != title
        if (rid not in vids or moved_vanilla) and title and title.lower().startswith(DEAD):
            (fails if name in ("mission", "ability") else warns).append(f"R2 {name}.{rid} is in group '{title}'")
for m in MS["mission"]["lines"]:
    ope = (m.get("effects") or {}).get("ope")
    if not ope:
        continue
    ab = next((a for a in MS["ability"]["lines"] if a["id"] == ope), None)
    if ab is None:
        fails.append(f"R5 mission {m['id']}: ability {ope} missing")
    elif not ab.get("implemented") and not (m.get("props") or {}).get("disabled"):
        fails.append(f"R5 mission {m['id']}: ability {ope} has implemented=false")
ag = groups(MS["ability"])
for m in MS["mission"]["lines"]:
    ope = (m.get("effects") or {}).get("ope")
    title = ag.get(ope, (0, None))[1] if ope else None
    if ope and not (m.get("props") or {}).get("disabled") and title and title.lower().startswith(DEAD):
        fails.append(f"R5 mission {m['id']}: its ability {ope} is in group '{title}'")
mg = groups(MS["mission"])
for m in MS["mission"]["lines"]:
    if mg[m["id"]][0] == 2 and not (m.get("props") or {}).get("disabled") and m["id"] not in {l["id"] for l in VS["mission"]["lines"]}:
        fails.append(f"R5 mission {m['id']} is in group 2 (hidden by isMissionAllowed)")

# R3 / R4 --------------------------------------------------------------------------------------------
for t in MS["trait"]["lines"]:
    if (t.get("props") or {}).get("resStockConditions"):
        fails.append(f"R3 trait {t['id']} uses resStockConditions (crashes every game start)")
for f in MS["faction"]["lines"]:
    if any(p.get("res") == "Hegemony" for p in f.get("baseProduction", [])):
        warns.append(f"R4 faction {f['id']}: Hegemony baseProduction has no effect")

# R7: Renegades enable when unlock < Hegemony (strict, Raids.hx:812); games start at 0 Hegemony -------
unlock = next((c.get("value") for c in MS["constant"]["lines"] if c.get("id") == "Raid_Renegades_HegemonyUnlock"), None)
if unlock == 0:
    warns.append("R7 Raid_Renegades_HegemonyUnlock = 0 waits for every player to earn Hegemony; use -1 for drops from the start")

# R6 -------------------------------------------------------------------------------------------------
for name in ("attribute", "constant"):
    a = [l.get("id") for l in MS[name]["lines"]]; b = [l.get("id") for l in VS[name]["lines"]]
    if a[:len(b)] != b:
        i = next(i for i, (x, y) in enumerate(zip(a, b)) if x != y)
        fails.append(f"R6 {name} rows shifted from index {i} ({b[i]} -> {a[i]}); the engine reads these by row number")
a = [l.get("id") for l in MS["resource"]["lines"]][:9]; b = [l.get("id") for l in VS["resource"]["lines"]][:9]
if a != b:
    fails.append(f"R6 resource rows 0-8 changed: {b} -> {a}")

print(f"engine preflight: {CDB}\n  vanilla: {VAN}")
for w in warns:
    print("  warn ", w)
for f in fails:
    print("  FAIL ", f)
print(f"  {len(fails)} fail, {len(warns)} warn")
sys.exit(1 if fails else 0)
