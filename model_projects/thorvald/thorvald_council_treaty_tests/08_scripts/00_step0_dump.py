"""Step 0 (READ ONLY) dump for the Council action / treaty feasibility handoff.
Reads mod_files/data.cdb (master) and a vanilla cdb; writes nothing but stdout.
Usage: python 00_step0_dump.py [section]   sections: res treaty faction refs schema"""
import json, sys, os
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", ".."))
def load(n): return json.load(open(os.path.join(ROOT, "mod_files", n), encoding="utf-8-sig"))
M = load("data.cdb"); V = load("data_vanilla_2026-11-09.cdb")
def sheet(db, n): return next(s for s in db["sheets"] if s["name"] == n)
def rows(db, n): return {r.get("id"): r for r in sheet(db, n)["lines"]}
def j(o): return json.dumps(o, ensure_ascii=False)
sec = sys.argv[1] if len(sys.argv) > 1 else "all"
if sec in ("schema", "all"):
    for n in ("resAction", "treaty"):
        for db, tag in ((M, "master"), (V, "vanilla1109")):
            s = sheet(db, n)
            print(f"== {n} [{tag}] rows={len(s['lines'])} ids={[r.get('id') for r in s['lines']]}")
        for c in sheet(M, n)["columns"]:
            print("   col", c["name"], "type", c["typeStr"], "opt" if c.get("opt") else "", c.get("kind", ""))
        for sub in [s for s in M["sheets"] if s["name"].startswith(n + "@")]:
            print("   sub", sub["name"], [(c["name"], c["typeStr"]) for c in sub["columns"]])
if sec in ("res", "all"):
    for i, r in rows(M, "resAction").items():
        print("resAction", i, "SAME" if rows(V, "resAction").get(i) == r else "DIFFERS-FROM-VANILLA"); print("  ", j(r))
if sec in ("treaty", "all"):
    for i, r in rows(M, "treaty").items():
        print("treaty", i, "SAME" if rows(V, "treaty").get(i) == r else "DIFFERS-FROM-VANILLA"); print("  ", j(r))
if sec in ("traits",):
    T = rows(M, "trait")
    for i in sys.argv[2:]:
        print("trait", i, j(T.get(i)))
if sec in ("refs", "all"):
    for s in M["sheets"]:
        for r in s["lines"]:
            t = j(r)
            for k in ("Unlock_TResAction", "Unlock_TTreaty"):
                if k in t and s["name"] != "attribute":
                    import re
                    for m in re.finditer(r'\{[^{}]*"%s"[^{}]*(\{[^{}]*\})?[^{}]*\}' % k, t):
                        print("ref", s["name"], r.get("id"), m.group(0)[:300])
if sec in ("faction", "all"):
    for i in ("Thorvald", "Corrino"):
        r = rows(M, "faction")[i]
        print("faction", i, {k: v for k, v in r.items() if k in ("id", "initials", "traits", "trait", "props", "group")})
        print("   keys", list(r.keys()))
