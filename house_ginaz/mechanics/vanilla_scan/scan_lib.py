"""Shared helpers for scanning the vanilla game data (mod_files/data.cdb). Read-only.

Usage from another script in this folder:
    import scan_lib as L
    d = L.load(); S = L.sheets(d); A = L.by_id(S["attribute"]); T = L.by_id(S["trait"])
"""
import json
import os
import re

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
CDB = os.path.join(ROOT, "mod_files", "data.cdb")


def load():
    return json.load(open(CDB, encoding="utf-8"))


def sheets(d):
    return {s["name"]: s for s in d["sheets"]}


def by_id(sheet):
    return {x["id"]: x for x in sheet.get("lines", []) if "id" in x}


def clean(text):
    """Turn game placeholders into readable text: ::percent:: -> N%, [Term] -> Term."""
    if not isinstance(text, str):
        return ""
    t = re.sub(r"::(s_|inv_)?percent_value::", "X%", text)
    t = re.sub(r"::(s_|inv_)?percent::", "X%", t)
    t = re.sub(r"::s?_?value::", "X", t)
    t = re.sub(r"::[a-zA-Z_\-\(\)\$\[\]\.0-9!=]+::", "X", t)
    t = re.sub(r"\[(!?)([^\]]+)\]", r"\2", t)
    t = t.replace("\n", " ")
    return re.sub(r"\s+", " ", t).strip()


def name_of(x):
    """Best display name for a record: texts.name, name, or the id."""
    if not isinstance(x, dict):
        return ""
    texts = x.get("texts") if isinstance(x.get("texts"), dict) else {}
    n = x.get("name") or texts.get("name") or x.get("id", "")
    return clean(n) if isinstance(n, str) else x.get("id", "")


def desc_of(x):
    if not isinstance(x, dict):
        return ""
    texts = x.get("texts") if isinstance(x.get("texts"), dict) else {}
    desc = x.get("desc") or texts.get("desc") or ""
    return clean(desc)


def attr_lines(trait, A):
    """Readable lines for a trait's attributes, using each attribute's own description."""
    out = []
    for a in trait.get("attributes", []) or []:
        ref = a.get("ref", "")
        a_desc = clean(A.get(ref, {}).get("desc", "")) if ref in A else "(missing attribute)"
        val = a.get("val")
        tgt = a.get("target") or {}
        tgt_s = ""
        if tgt:
            tgt_s = " [target: " + ", ".join("%s=%s" % (k, v) for k, v in tgt.items()) + "]"
        out.append("%s = %s%s  -- %s" % (ref, val if val is not None else "-", tgt_s, a_desc))
    return out


def trait_refs(trait):
    """Names of other traits a trait applies (target fields that look like trait ids)."""
    refs = set()
    for a in trait.get("attributes", []) or []:
        for k in ("target", "target2"):
            v = a.get(k)
            if isinstance(v, dict) and "trait" in v:
                refs.add(v["trait"])
    return refs
