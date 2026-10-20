#!/usr/bin/env python3
"""Safe editing of the game's CastleDB file (data.cdb) for the common modding jobs.

Why this exists: data.cdb is a 7 MB JSON file that the HIDE/CastleDB editor also writes. These
helpers (1) refuse to touch it unless a load/save round trip reproduces it byte for byte, so a
diff only ever contains the lines we meant to change; (2) back it up before every write; and
(3) encode what we learned about the data model (see references/game-data.md).

Usage (default --cdb is the working copy, <project>/mod_files/data.cdb - see dsw_common.cdb_path):
  python cdb_tools.py verify
  python cdb_tools.py show unit A_Trooper
  python cdb_tools.py add-model --id N_My_Model --clone-from C_Elite \
        --mesh CharMOD/Male01_My/Prefab_My.prefab --preload-faction Atreides
  python cdb_tools.py add-unit --id A_My --faction Atreides --model N_My_Model --name "My Unit" --free
  python cdb_tools.py start-unit --faction Atreides --unit A_My          # appears next to the HQ at game start
  python cdb_tools.py start-unit --faction Atreides --unit A_My --remove
  python cdb_tools.py remove --sheet unit --id C_Old

Close/reload the editor first: if it still has an older data.cdb open, its next save overwrites this.
"""
import argparse
import copy
import datetime
import json
import os
import shutil
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cdb_path  # noqa: E402


# ----------------------------------------------------------------------------- io
def dumps(data):
    return json.dumps(data, indent="\t", ensure_ascii=False).encode("utf-8")


def load(path):
    """-> (data, exact). exact is True when re-serialising reproduces the file byte for byte."""
    raw = open(path, "rb").read()
    data = json.loads(raw.decode("utf-8-sig"))
    return data, dumps(data) == raw


def backup(path, label):
    folder = os.path.join(os.path.dirname(path), "backups")
    os.makedirs(folder, exist_ok=True)
    dest = os.path.join(folder, f"data_{label}_{datetime.datetime.now():%Y%m%d_%H%M%S}.cdb")
    shutil.copy2(path, dest)
    return dest


def save(path, data, label, allow_inexact=False):
    _, exact = load(path)
    if not exact and not allow_inexact:
        sys.exit("REFUSING to edit: re-serialising data.cdb does not reproduce it byte for byte, so the "
                 "diff would be noisy. Run `verify` to investigate, or pass --allow-inexact.")
    b = backup(path, label)
    with open(path, "wb") as f:
        f.write(dumps(data))
    print(f"backup: {b}")


def sheets(data):
    return {s["name"]: s for s in data["sheets"]}


def by_id(sheet):
    return {l["id"]: l for l in sheet["lines"] if "id" in l}


# ----------------------------------------------------------------------------- operations
def flag_names(data, sheet, column):
    col = next(c for c in sheets(data)[sheet]["columns"] if c["name"] == column)
    return col["typeStr"].split(":", 1)[1].split(",")


def default_clone_unit(data, faction):
    """The faction's basic infantry unit: build-wheel group 1, pos 4 (A_Trooper, C_Trooper, ...)."""
    for u in sheets(data)["unit"]["lines"]:
        wp = (u.get("props") or {}).get("wheelPosition") or {}
        if u.get("faction") == faction and wp.get("group") == 1 and wp.get("pos") == 4:
            return u["id"]
    sys.exit(f"no default clone unit found for faction {faction!r}; pass --clone-from")


def resolved_wheel(units, u):
    """wheelPosition including inheritance (A_Drone/A_Ship get theirs from Drone/Ship)."""
    while u:
        wp = (u.get("props") or {}).get("wheelPosition")
        if wp:
            return wp
        u = units.get(u.get("inherits"))
    return None


def next_wheel_pos(data, faction, group=1):
    """First free gamepad-wheel sector for the faction (12 sectors: 0-11).

    Inherited slots count: Ornithopter 0, Harvester 1, Hero 2, Elite 3, Drone 7, Ship 8, Frigate 9,
    so for Atreides the free ones are 10 and 11."""
    units = by_id(sheets(data)["unit"])
    used = set()
    for u in units.values():
        if u.get("faction") == faction:
            wp = resolved_wheel(units, u) or {}
            if wp.get("group", group) == group:
                used.add(wp.get("pos"))
    pos = 0
    while pos in used:
        pos += 1
    return pos


def add_model(data, new_id, clone_from, mesh, preload_faction=None, scale=None, inherit=None):
    lines = sheets(data)["model"]["lines"]
    ids = by_id(sheets(data)["model"])
    if new_id in ids:
        sys.exit(f"model {new_id} already exists")
    if clone_from not in ids:
        sys.exit(f"model {clone_from} not found")
    m = copy.deepcopy(ids[clone_from])
    m["id"] = new_id
    m["mesh"] = [{"path": mesh}]
    if preload_faction:
        m.setdefault("props", {}).setdefault("preload", {})["factions"] = [{"faction": preload_faction}]
    if scale is not None:
        m["scale"] = scale
    if inherit:                               # animation set (stance): e.g. Duncan, MilitarySardaukar
        if inherit not in ids:
            sys.exit(f"inherit model {inherit} not found")
        m["inherit"] = inherit
    lines.insert(lines.index(ids[clone_from]) + 1, m)
    return m


def add_unit(data, a):
    S = sheets(data)
    ul = S["unit"]["lines"]
    units = by_id(S["unit"])
    if a.id in units:
        sys.exit(f"unit {a.id} already exists")
    if a.model not in by_id(S["model"]):
        sys.exit(f"model {a.model} not found; run add-model first")
    clone_id = a.clone_from or default_clone_unit(data, a.faction)
    base = units[clone_id]
    u = copy.deepcopy(base)
    u["id"] = a.id
    u["faction"] = a.faction
    if not a.keep_flags:
        u.pop("flags", None)                      # buildable + controllable (flags like NotBuyable/NoControl come from clones)
    pos = next_wheel_pos(data, a.faction, a.wheel_group) if a.wheel_pos is None else a.wheel_pos
    u.setdefault("props", {})["wheelPosition"] = {"group": a.wheel_group, "pos": pos}
    u.setdefault("effects", {})["models"] = [{"ref": a.model, "flags": 0}]
    tx = u.setdefault("texts", {})
    tx["name"] = a.name or a.id
    tx["plural"] = {"name": a.plural or (a.name or a.id) + "s"}
    if a.desc:
        tx["desc"] = a.desc
    st = copy.deepcopy(u.get("stats") or [{}])
    s0 = st[0]
    for k in ("health", "power", "armor"):
        v = getattr(a, k)
        if v is not None:
            s0[k] = v
    s0["trainingTime"] = a.train
    u["stats"] = st
    if a.free:
        u["costs"] = {"recruit": [{"qty": 0, "res": "Manpower"}],
                      "upkeep": [{"qty": 0, "res": "Solari"}, {"qty": 0, "res": "CommandPoint"}]}
    if a.squad_size is not None:              # Trooper parent = 5 men per squad, Hero = 1
        u["props"]["squadSize"] = a.squad_size
        if a.squad_size == 1:
            u["props"]["squadSpacing"] = 1
    if a.squad_spacing is not None:
        u["props"]["squadSpacing"] = a.squad_spacing
    if a.range is not None:
        u["stats"][0]["range"] = a.range
    if a.equipment_from:                      # armory upgrades are just unit.equipment
        if a.equipment_from not in units:
            sys.exit(f"--equipment-from unit {a.equipment_from} not found")
        u["equipment"] = copy.deepcopy(units[a.equipment_from].get("equipment") or [])
    for t in a.add_trait or []:
        if t not in by_id(S["trait"]):
            sys.exit(f"trait {t} not found")
        if {"ref": t} not in u.setdefault("traits", []):
            u["traits"].append({"ref": t})
    ul.insert(ul.index(base) + 1, u)
    return u, clone_id, pos


def hq_structure(data, faction):
    f = by_id(sheets(data)["faction"]).get(faction)
    if not f:
        sys.exit(f"faction {faction} not found")
    city = (f.get("landmarks") or {}).get("city")
    st = by_id(sheets(data)["structure"])
    if city not in st:
        sys.exit(f"HQ structure {city!r} for {faction} not found in the structure sheet")
    return st[city]


def set_start_unit(data, faction, unit_id, remove=False):
    hq = hq_structure(data, faction)
    if unit_id not in by_id(sheets(data)["unit"]):
        sys.exit(f"unit {unit_id} not found")
    entry = {"unit": unit_id}
    su = hq.setdefault("startUnits", [])
    if remove:
        if entry in su:
            su.remove(entry)
    elif entry not in su:
        su.append(entry)
    return hq["id"], su


def remove_entry(data, sheet, id_):
    S = sheets(data)[sheet]
    ln = by_id(S).get(id_)
    if not ln:
        sys.exit(f"{sheet}.{id_} not found")
    S["lines"].remove(ln)


# ----------------------------------------------------------------------------- cli
def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--cdb", default=cdb_path())
    p.add_argument("--allow-inexact", action="store_true")
    sub = p.add_subparsers(dest="cmd", required=True)
    sub.add_parser("verify")
    s = sub.add_parser("show"); s.add_argument("sheet"); s.add_argument("id")
    s = sub.add_parser("add-model")
    s.add_argument("--id", required=True); s.add_argument("--clone-from", required=True)
    s.add_argument("--mesh", required=True, help="resource path of the prefab, e.g. CharMOD/Male01_X/Prefab_X.prefab")
    s.add_argument("--preload-faction"); s.add_argument("--scale", type=float)
    s.add_argument("--inherit", help="animation-set model, e.g. Duncan (hero stance) or MilitarySardaukar")
    s = sub.add_parser("add-unit")
    s.add_argument("--id", required=True); s.add_argument("--faction", required=True); s.add_argument("--model", required=True)
    s.add_argument("--clone-from", help="default: the faction's basic infantry (wheel group 1 pos 4)")
    s.add_argument("--name"); s.add_argument("--plural"); s.add_argument("--desc")
    s.add_argument("--free", action="store_true", help="0 Manpower, 0 Solari upkeep, 0 CommandPoint upkeep")
    s.add_argument("--train", type=float, default=0.1, help="trainingTime seconds (0.1 = near instant)")
    s.add_argument("--health", type=int); s.add_argument("--power", type=int); s.add_argument("--armor", type=int)
    s.add_argument("--wheel-pos", type=int, help="default: first free slot in group 1")
    s.add_argument("--squad-size", type=int, help="men per squad (1 = single unit, like heroes)")
    s.add_argument("--squad-spacing", type=float); s.add_argument("--range", type=int, help="attack range (ranged units)")
    s.add_argument("--wheel-group", type=int, default=1, help="1 = faction sectors (default), 0 = common sectors")
    s.add_argument("--equipment-from", help="copy the armory upgrades (unit.equipment) of this unit, e.g. A_Trooper")
    s.add_argument("--add-trait", action="append", help="add a trait ref (repeatable), e.g. A_Trooper_Trait")
    s.add_argument("--keep-flags", action="store_true")
    s = sub.add_parser("start-unit", help="spawn the unit beside the faction HQ at game start")
    s.add_argument("--faction", required=True); s.add_argument("--unit", required=True); s.add_argument("--remove", action="store_true")
    s = sub.add_parser("remove"); s.add_argument("--sheet", required=True); s.add_argument("--id", required=True)
    a = p.parse_args()

    data, exact = load(a.cdb)
    if a.cmd == "verify":
        print(f"{a.cdb}: {'round-trips byte for byte (safe to edit)' if exact else 'DOES NOT round-trip exactly'}")
        sys.exit(0 if exact else 1)
    if a.cmd == "show":
        print(json.dumps(by_id(sheets(data)[a.sheet])[a.id], indent=2, ensure_ascii=False))
        return
    if a.cmd == "add-model":
        m = add_model(data, a.id, a.clone_from, a.mesh, a.preload_faction, a.scale, a.inherit)
        label = "add_model_" + a.id
        print("model:", json.dumps({k: m.get(k) for k in ("id", "inherit", "mesh", "rigName", "scale", "props")}, ensure_ascii=False))
    elif a.cmd == "add-unit":
        u, clone, pos = add_unit(data, a)
        label = "add_unit_" + a.id
        print(f"unit {u['id']} ({u['faction']}) cloned from {clone}; wheel slot group 1 / pos {pos}; "
              f"model {a.model}; recruit {u['costs'].get('recruit')}; upkeep {u['costs'].get('upkeep')}; "
              f"stats {u['stats']}; traits {[t.get('ref') for t in u.get('traits', [])]}")
    elif a.cmd == "start-unit":
        sid, su = set_start_unit(data, a.faction, a.unit, a.remove)
        label = ("remove_start_" if a.remove else "start_unit_") + a.unit
        print(f"structure {sid}.startUnits = {su}")
    elif a.cmd == "remove":
        remove_entry(data, a.sheet, a.id)
        label = "remove_" + a.id
        print(f"removed {a.sheet}.{a.id}")
    save(a.cdb, data, label, a.allow_inexact)


if __name__ == "__main__":
    main()
