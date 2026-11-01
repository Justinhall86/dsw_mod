"""Rename unit ids in a data.cdb dict, schema-aware.

    rename_units(data, {"Th_Trooper": "TH_Trooper", ...}) -> report dict

Only unit references are touched:
- the unit rows' own ids;
- every column the cdb schema types as a unit reference ("6:unit"), followed through nested list (8) and object (17)
  sub-sheets;
- [Old] / [!Old] / [Old-adjective] text markup.

Model, trait, ability and combo rows that share a name with a unit keep theirs, so meshes, buffs and attacks stay linked.

Why this exists: the engine resolves a faction's unit as initials.toUpperCase() + "_" + type (HUnit.getFactionUnitById),
so a faction's unit ids must follow that pattern. Thorvald's "Th_" crashed every game at load.
"""
import re


def rename_units(data, rename):
    sheets = {s["name"]: s for s in data["sheets"]}
    units = sheets["unit"]["lines"]
    existing = {u["id"] for u in units}
    clash = [n for o, n in rename.items() if n in existing and n != o]
    if clash:
        raise SystemExit(f"target unit ids already exist: {clash}")
    report = {"refs": 0, "text": 0, "left": {}}

    def walk(sheet_name, obj):
        sheet = sheets.get(sheet_name)
        if sheet is None or not isinstance(obj, dict):
            return
        for col in sheet["columns"]:
            name, ts = col["name"], col["typeStr"]
            v = obj.get(name)
            if v is None:
                continue
            if ts == "6:unit" and isinstance(v, str) and v in rename:
                obj[name] = rename[v]; report["refs"] += 1
            elif ts == "8" and isinstance(v, list):
                for item in v:
                    walk(f"{sheet_name}@{name}", item)
            elif ts == "17" and isinstance(v, dict):
                walk(f"{sheet_name}@{name}", v)

    for s in data["sheets"]:
        if "@" not in s["name"]:
            for line in s["lines"]:
                walk(s["name"], line)
    for u in units:
        if u["id"] in rename:
            u["id"] = rename[u["id"]]

    mark = re.compile(r"\[(!?)(" + "|".join(map(re.escape, sorted(rename, key=len, reverse=True))) + r")(?=[\]\-:])")

    def fix_text(o):
        items = o.items() if isinstance(o, dict) else enumerate(o) if isinstance(o, list) else ()
        for k, v in list(items):
            if isinstance(v, str):
                n = mark.sub(lambda m: "[" + m.group(1) + rename[m.group(2)], v)
                if n != v:
                    o[k] = n; report["text"] += 1
            else:
                fix_text(v)

    fix_text(data["sheets"])

    def scan(o, path):
        if isinstance(o, dict):
            for k, v in o.items():
                if isinstance(v, str) and v in rename:
                    report["left"].setdefault(f"{path}.{k}", set()).add(v)
                else:
                    scan(v, f"{path}.{k}")
        elif isinstance(o, list):
            for x in o:
                scan(x, path)

    for s in data["sheets"]:
        scan(s["lines"], s["name"])
    return report
