"""Validate a DSW data.cdb against its own CastleDB schema, and diff it against a vanilla copy.

  python cdb_validate.py [--cdb mod_files/data.cdb] [--vanilla mod_files/data_safe_extr.cdb]

Reports, for the modded file only what is NEW compared with vanilla:
  * references (column type 6:<sheet>) whose target id does not exist
  * file paths (column type 13 = file, 7 = image) that exist neither in the extracted vanilla assets nor in the
    editor's staged res tree (what goes into our pak)
  * duplicate ids
and lists every entry that was added, removed or changed vs vanilla (sheet, id, changed top-level fields).
Why: the game refuses to start (no game.log line at all) when data.cdb has a dangling reference or a broken file
path - so every edit must point only at things that exist.
"""
import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cdb_path  # noqa: E402

EXTR = r"C:\dsw_mod\extr"
STAGED = r"C:\dsw_mod\D4XEditor\res\res"


def load(p):
    return json.load(open(p, encoding="utf-8-sig"))


def index(data):
    sheets = {s["name"]: s for s in data["sheets"]}
    ids = {}
    for s in data["sheets"]:
        idcol = next((c["name"] for c in s["columns"] if str(c["typeStr"]).split(":")[0] == "0"), None)
        if idcol and "@" not in s["name"]:
            ids[s["name"]] = {}
            for ln in s["lines"]:
                if idcol in ln:
                    ids[s["name"]].setdefault(ln[idcol], 0)
                    ids[s["name"]][ln[idcol]] += 1
    return sheets, ids


def file_exists(path):
    if not path or not isinstance(path, str):
        return True
    rel = path.replace("/", os.sep)
    return os.path.exists(os.path.join(EXTR, rel)) or os.path.exists(os.path.join(STAGED, rel))


def walk(sheets, ids, sname, obj, where, out):
    sheet = sheets.get(sname)
    if not sheet or not isinstance(obj, dict):
        return
    for col in sheet["columns"]:
        name, ts = col["name"], str(col["typeStr"])
        if name not in obj:
            continue
        v = obj[name]
        kind, _, arg = ts.partition(":")
        if kind == "6" and arg in ids:                       # reference
            if v not in ("", None) and v not in ids[arg]:
                out.add(("dangling ref", where + "." + name, "%s -> %s" % (v, arg)))
        elif kind in ("13", "7") and isinstance(v, str):    # file / image path
            path = v.split("@")[0] if kind == "7" else v
            if path and "." in path and not file_exists(path):
                out.add(("missing file", where + "." + name, path))
        elif kind == "8" and isinstance(v, list):           # sub-list
            for i, it in enumerate(v):
                walk(sheets, ids, sname + "@" + name, it, "%s.%s[%d]" % (where, name, i), out)
        elif kind == "17" and isinstance(v, dict):          # properties object
            walk(sheets, ids, sname + "@" + name, v, where + "." + name, out)


def problems(data):
    sheets, ids = index(data)
    out = set()
    for sname, s in sheets.items():
        if "@" in sname:
            continue
        idcol = next((c["name"] for c in s["columns"] if str(c["typeStr"]).split(":")[0] == "0"), None)
        for i, ln in enumerate(s["lines"]):
            walk(sheets, ids, sname, ln, "%s[%s]" % (sname, ln.get(idcol, i) if idcol else i), out)
    for sname, d in ids.items():
        for k, n in d.items():
            if n > 1 and k != "":
                out.add(("duplicate id", sname, "%s x%d" % (k, n)))
    return out


def entry_diff(van, mod):
    vs, ms = {s["name"]: s for s in van["sheets"]}, {s["name"]: s for s in mod["sheets"]}
    rows = []
    for name in sorted(set(vs) | set(ms)):
        if name not in vs or name not in ms:
            rows.append((name, "SHEET " + ("added" if name in ms else "removed"), ""))
            continue
        a, b = vs[name], ms[name]
        if a["columns"] != b["columns"]:
            rows.append((name, "COLUMNS changed", ""))
        idcol = next((c["name"] for c in b["columns"] if str(c["typeStr"]).split(":")[0] == "0"), None)
        if not idcol:
            if a["lines"] != b["lines"]:
                rows.append((name, "lines changed (no id column)", "%d -> %d" % (len(a["lines"]), len(b["lines"]))))
            continue
        la = {l.get(idcol): l for l in a["lines"]}
        lb = {l.get(idcol): l for l in b["lines"]}
        for k in lb:
            if k not in la:
                rows.append((name, "added", k))
            elif la[k] != lb[k]:
                fields = sorted(f for f in set(la[k]) | set(lb[k]) if la[k].get(f) != lb[k].get(f))
                rows.append((name, "changed", "%s: %s" % (k, ", ".join(fields))))
        for k in la:
            if k not in lb:
                rows.append((name, "removed", k))
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--cdb", default=cdb_path())
    ap.add_argument("--vanilla", default=os.path.join(os.path.dirname(cdb_path()), "data_safe_extr.cdb"))
    a = ap.parse_args()
    van, mod = load(a.vanilla), load(a.cdb)
    pv, pm = problems(van), problems(mod)
    new = sorted(pm - pv)
    print("== problems in vanilla: %d (baseline, ignored) | NEW in modded: %d" % (len(pv), len(new)))
    for p in new:
        print("  %-13s %-70s %s" % p)
    print("\n== entries differing from vanilla")
    for r in entry_diff(van, mod):
        print("  %-28s %-22s %s" % r)
    sys.exit(1 if new else 0)


if __name__ == "__main__":
    main()
