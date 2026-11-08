#!/usr/bin/env python3
"""Any `siegeAction` row whose props name the place, besieger and target joins the siege menu."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, argument_kinds, assemble, enum_case, field_by_name,
                          function_named, is_static, kind_named, number, returns_type,
                          slot_global, written)
from tools.splice import insert
from framework import board, traps
from framework.foreignwalk import the_global_of
from framework.parsed import a_new_place
from standalone import cdbwalk, onoff
from standalone.cdbwalk import COMPARE, DATA, LIST, each, same
from armoury_lib import str_ref                                    # noqa: E402

NAME = "siegeactions"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the game's menu of siege actions, built fresh each time it is asked
MENU = "ent.comp.SiegeComponent.getAvailableOccupationActions"
COMPONENT, ENTITY, BESIEGED, FACTION = ("ent.comp.SiegeComponent", "entity", "ent.Structure",
                                        "ent.Faction")
OWNER, PUSH, KIND = "ent.Entity.get_owner", "hl.types.ArrayObj.push", "kind"
# the sheet, its rows, and the props a modder writes on a row, each read by name
SHEET, ROWS, ID, PROPS = "siegeAction", "all", "id", "props"
PLACES, PLACE = "places", "structure"
FACTIONS, ONE_FACTION = "factions", "faction"
HOLDER, NEUTRAL, ENEMY = "target", "Neutral", "Enemy"
# `target` is a choice; which position each word holds is read off its column when the cdb loads
PROPS_SHEET, KINDS, CHOICE = "siegeAction@props", "cdb.ColumnType", "TEnum"

ADDS = "the authored siege actions join the menu"
COLLECT, COPY = "the authored siege actions, set aside when the cdb loads", "hl.types.ArrayObj.copy"
# the rows carrying `places`, kept between a load and every menu; nothing until a load
KEPT = "the authored siege actions"
# each word's position in `target`'s choice, plus one; 0 until a load finds it
AT_NEUTRAL, AT_ENEMY = "the siege target Neutral", "the siege target Enemy"
# a besieger holding this unlock for a row is offered it whatever `factions` says
UNLOCK, ATTRIBUTES, INDEX = "Unlock_TSiegeAction", "attribute", "index"
HAS, TARGET_KINDS, SIEGE_TARGET = "ent.Object.hasAttribute", "ETargetKind", "ETSiegeAction"
# the unlock's position in the attribute sheet, plus one; 0 until a load finds it
AT_UNLOCK = "the attribute Unlock_TSiegeAction"
# the game's key for one target: every bit from 20 up set, the case at bit 3, the row's index at 9
KEY_HIGH, CASE_AT, ROW_AT = -(1 << 20), 3, 9
# a row's switches: locked until unlocked, and hidden rather than shown while locked or blocked
LOCKED_BY_DEFAULT, HIDE_LOCKED, HIDE_BLOCKED = "lockedByDefault", "hideLocked", "hideBlocked"
# both of the game's starts ask what the besieger lacks; for our rows the switches answer instead
STARTS = ("ent.comp.SiegeComponent.implStartOccupationAction",
          "ent.comp.SiegeComponent.implInlineStartOccupationAction")
MISSING = "ent.Entity.getMissingUnlocks"
LOCKS = ("an authored siege action's own lock", "an authored siege action's own lock, inline")
# the game's own verdict on starting one, asked without starting it
CHECK, REASONS = "ent.comp.SiegeComponent.checkStartOccupationAction", "EReason"
LOCKED, BLOCKED = "RequireUnlock", "BlockedBy"
# unticked, a row waits for the besieger's first village, as the game's Pillage does
NO_VILLAGE, STATE, FIRST = "noVillageNeeded", "stateData", "firstControl"


def _tail(fn):
    """The menu's last three: the list's holder, the list, and the return that hands it back."""
    end = max(i for i, o in enumerate(fn.ops) if o.op == "Ret")
    holder, listed, ret = fn.ops[end - 2:end + 1]
    guard(holder.op == "GetGlobal" and listed.op == "Field" and ret.op == "Ret"
          and gv(listed.df["obj"]) == gv(holder.df["dst"])
          and gv(ret.df["ret"]) == gv(listed.df["dst"]),
          "`%s` does not end by returning a list read off a global" % MENU)
    return end - 2


def _besieger(bc, fn):
    """The menu's own argument naming who besieges, found by its kind."""
    faction = kind_named(bc, FACTION)
    after_this = 0 if is_static(bc, fn) else 1
    at = [i + after_this for i, k in enumerate(argument_kinds(bc, MENU)) if gv(k) == faction]
    guard(len(at) == 1, "`%s` takes %d faction(s), not one" % (MENU, len(at)))
    guard(gv(fn.regs[at[0]]) == faction, "`%s`'s faction is not its register %d" % (MENU, at[0]))
    return at[0]


def _walk(op, r, listed, at, item, loop, done):
    """The head of a walk over a list: `item` is the next one, or we are done."""
    return [
        op("Int", dst=r[at], ptr=r["0"]),
        loop + ":", op("Label"),
        op("Field", dst=r["many"], obj=r[listed], field=r["k_many"]),
        (op("JSGte", a=r[at], b=r["many"]), done),
        op("Field", dst=r["back"], obj=r[listed], field=r["k_back"]),
        op("GetArray", dst=r[item], array=r["back"], index=r[at]),
        op("Incr", dst=r[at]),
    ]


def _list(op, r, obj, name, missing):
    """`r["list"]` is the list prop `name` of `obj`; `missing` when it is absent."""
    return [op("DynGet", dst=r["got"], obj=r[obj], field=r["s:" + name]),
            (op("JNull", reg=r["got"]), missing),
            op("SafeCast", dst=r["list"], src=r["got"]),
            (op("JNull", reg=r["list"]), missing)]


def _text(op, r, obj, name, missing):
    """`r["text"]` is the text `name` of `obj`; `missing` when it is absent."""
    return [op("DynGet", dst=r["got"], obj=r[obj], field=r["s:" + name]),
            (op("JNull", reg=r["got"]), missing),
            op("UnsafeCast", dst=r["text"], src=r["got"]),
            (op("JNull", reg=r["text"]), missing)]


def _choice(bc, fn, op):
    """Each target word's position in the `target` column's choice, plus one, kept by name."""
    column_kind = cdbwalk.parsed_kind(bc, "typeStr")
    s_cols, _ = field_by_name(bc, cdbwalk.parsed_kind(bc, "columns"), "columns", "a parsed sheet")
    c_name, _ = field_by_name(bc, column_kind, "name", "a parsed column")
    c_type, type_kind = field_by_name(bc, column_kind, "type", "a parsed column")
    case = enum_case(bc, KINDS, CHOICE)
    n = board.a_number(bc)
    w = cdbwalk.places(bc, fn, (("cols", LIST), ("names", LIST), ("col", column_kind),
                                ("kind", type_kind), ("j", n), ("k", n)))
    kept = {word: slot_global(bc, at, n) for word, at in ((NEUTRAL, AT_NEUTRAL),
                                                          (ENEMY, AT_ENEMY))}
    out = [op("Int", dst=w["k"], ptr=w["0"])]
    out += [op("SetGlobal", **{"global": g, "src": w["k"]}) for g in kept.values()]
    out += cdbwalk.to_sheet(bc, op, w, PROPS_SHEET, "choice read")
    out += [op("Field", dst=w["cols"], obj=w["sheet"], field=s_cols),
            (op("JNull", reg=w["cols"]), "choice read")]
    out += each(op, w, "cols", "j", "choice column", "choice read")
    out += [op("ToVirtual", dst=w["col"], src=w["dyn"]),
            (op("JNull", reg=w["col"]), "choice column"),
            op("Field", dst=w["text"], obj=w["col"], field=c_name)]
    out += same(bc, op, w, HOLDER, "choice column")
    out += [op("Field", dst=w["kind"], obj=w["col"], field=c_type),
            (op("JNull", reg=w["kind"]), "choice read"),
            op("EnumIndex", dst=w["many"], value=w["kind"]),
            op("Int", dst=w["zero"], ptr=number(bc, case)),
            (op("JNotEq", a=w["many"], b=w["zero"]), "choice read"),
            op("EnumField", dst=w["names"], value=w["kind"], construct=case, field=0),
            (op("JNull", reg=w["names"]), "choice read")]
    # the walk has stepped past the word when it compares, so `k` is its position plus one
    out += each(op, w, "names", "k", "choice word", "choice read")
    out += [op("UnsafeCast", dst=w["text"], src=w["dyn"])]
    out += same(bc, op, w, NEUTRAL, "choice not neutral")
    out += [op("SetGlobal", **{"global": kept[NEUTRAL], "src": w["k"]}),
            (op("JAlways"), "choice word"),
            "choice not neutral:", op("Label")]
    out += same(bc, op, w, ENEMY, "choice word")
    out += [op("SetGlobal", **{"global": kept[ENEMY], "src": w["k"]}),
            (op("JAlways"), "choice word"),
            "choice read:", op("Label")]
    return out


def _unlock_number(bc, fn, op):
    """`Unlock_TSiegeAction`'s position in the attribute sheet, plus one, kept by name."""
    sheet_at, sheet_kind = field_by_name(bc, kind_named(bc, DATA), ATTRIBUTES, "the cdb class")
    rows_at, rows_kind = field_by_name(bc, sheet_kind, ROWS, "a sheet")
    w = cdbwalk.places(bc, fn, (("table", sheet_kind), ("all", rows_kind), ("rows", LIST),
                                ("got", argument_kind(bc, COMPARE, 0))))
    kept = slot_global(bc, AT_UNLOCK, board.a_number(bc))
    out = [op("Int", dst=w["i"], ptr=w["0"]),
           op("SetGlobal", **{"global": kept, "src": w["i"]}),
           op("GetGlobal", **{"dst": w["data"], "global": the_global_of(bc, DATA)}),
           op("Field", dst=w["table"], obj=w["data"], field=sheet_at),
           (op("JNull", reg=w["table"]), "unlock read"),
           op("Field", dst=w["all"], obj=w["table"], field=rows_at),
           op("SafeCast", dst=w["rows"], src=w["all"]),
           (op("JNull", reg=w["rows"]), "unlock read")]
    out += each(op, w, "rows", "i", "unlock row", "unlock read")
    out += [(op("JNull", reg=w["dyn"]), "unlock row"),
            op("DynGet", dst=w["got"], obj=w["dyn"], field=str_ref(bc, ID)),
            op("UnsafeCast", dst=w["text"], src=w["got"])]
    out += same(bc, op, w, UNLOCK, "unlock row")
    # the walk has stepped past the row when it compares, so `i` is its position plus one
    out += [op("SetGlobal", **{"global": kept, "src": w["i"]}),
            "unlock read:", op("Label")]
    return out


def _unlocked(bc, op, r, besieger, yes, no):
    """To `yes` when the besieger holds the unlock for this row, else to `no`."""
    case = enum_case(bc, TARGET_KINDS, SIEGE_TARGET)
    return [op("GetGlobal", **{"dst": r["attr"], "global": slot_global(bc, AT_UNLOCK,
                                                                      board.a_number(bc))}),
            op("Int", dst=r["j"], ptr=r["0"]),
            (op("JEq", a=r["attr"], b=r["j"]), no),
            op("Decr", dst=r["attr"]),
            op("DynGet", dst=r["j"], obj=r["row"], field=str_ref(bc, INDEX)),
            op("Int", dst=r["many"], ptr=number(bc, ROW_AT)),
            op("Shl", dst=r["j"], a=r["j"], b=r["many"]),
            op("Int", dst=r["many"], ptr=number(bc, case << CASE_AT)),
            op("Or", dst=r["j"], a=r["j"], b=r["many"]),
            op("Int", dst=r["many"], ptr=number(bc, -KEY_HIGH)),
            op("Neg", dst=r["many"], src=r["many"]),
            op("Or", dst=r["j"], a=r["j"], b=r["many"]),
            op("ToInt", dst=r["key"], src=r["j"]),
            op("Ref", dst=r["ref"], src=r["key"]),
            op("Call4", dst=r["has"], fun=gv(function_named(bc, HAS).findex), arg0=besieger,
               arg1=r["attr"], arg2=r["ref"], arg3=besieger),
            (op("JFalse", cond=r["has"]), no),
            (op("JAlways"), yes)]


def emit_collect(bc, fn):
    """At the end of the load: a copy of the sheet's rows, cut down to those carrying `places`."""
    op = cdbwalk.op_of(bc)
    sheet_at, sheet_kind = field_by_name(bc, kind_named(bc, DATA), SHEET, "the cdb class")
    rows_at, rows_kind = field_by_name(bc, sheet_kind, ROWS, "a sheet")
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, "length", "a list")
    k_back, back_kind = field_by_name(bc, array, "array", "a list")
    n = board.a_number(bc)
    dyn = argument_kind(bc, COMPARE, 0)
    wanted = (("data", kind_named(bc, DATA)), ("sheet", sheet_kind), ("all", rows_kind),
              ("rows", array), ("kept", array), ("back", back_kind), ("into", back_kind),
              ("row", dyn), ("props", dyn), ("got", dyn), ("i", n), ("k", n), ("many", n))
    r = {name: a_new_place(bc, fn, kind) for name, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0)})
    kept = slot_global(bc, KEPT, array)
    out = _choice(bc, fn, op) + _unlock_number(bc, fn, op)
    out += [op("GetGlobal", **{"dst": r["data"], "global": the_global_of(bc, DATA)}),
           op("Field", dst=r["sheet"], obj=r["data"], field=sheet_at),
           (op("JNull", reg=r["sheet"]), "absent"),
           op("Field", dst=r["all"], obj=r["sheet"], field=rows_at),
           op("SafeCast", dst=r["rows"], src=r["all"]),
           (op("JNull", reg=r["rows"]), "absent"),
           op("Call1", dst=r["kept"], fun=gv(function_named(bc, COPY).findex), arg0=r["rows"]),
           op("Field", dst=r["into"], obj=r["kept"], field=k_back),
           op("Int", dst=r["k"], ptr=r["0"])]
    out += _walk(op, r, "rows", "i", "row", "row", "collected")
    out += [(op("JNull", reg=r["row"]), "row"),
            op("DynGet", dst=r["props"], obj=r["row"], field=str_ref(bc, PROPS)),
            (op("JNull", reg=r["props"]), "row"),
            op("DynGet", dst=r["got"], obj=r["props"], field=str_ref(bc, PLACES)),
            (op("JNull", reg=r["got"]), "row"),
            op("SetArray", array=r["into"], index=r["k"], src=r["row"]),
            op("Incr", dst=r["k"]),
            (op("JAlways"), "row"),
            "collected:", op("Label"),
            op("SetField", obj=r["kept"], field=k_many, src=r["k"]),
            op("SetGlobal", **{"global": kept, "src": r["kept"]}),
            (op("JAlways"), "done"),
            "absent:", op("Label"),
            op("Null", dst=r["kept"]),
            op("SetGlobal", **{"global": kept, "src": r["kept"]}),
            "done:", op("Label")]
    return assemble(out)


def _menu_places(bc, fn, holder, text_kind):
    """The menu's own places, the texts it compares by, and the list's two fields."""
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, "length", "a list")
    k_back, back_kind = field_by_name(bc, array, "array", "a list")
    n = board.a_number(bc)
    dyn = argument_kind(bc, COMPARE, 0)
    ref = argument_kind(bc, HAS, 1)
    wanted = (("holder", gv(fn.regs[gv(holder.df["dst"])])), ("menu", array),
              ("entity", field_by_name(bc, kind_named(bc, COMPONENT), ENTITY, "a siege")[1]),
              ("place", kind_named(bc, BESIEGED)),
              ("kind", text_kind), ("owner", kind_named(bc, FACTION)), ("by", text_kind),
              ("rows", array), ("list", array), ("back", back_kind),
              ("row", dyn), ("props", dyn), ("entry", dyn), ("got", dyn),
              ("text", text_kind), ("i", n), ("j", n), ("many", n), ("pushed", n),
              ("attr", n), ("ref", ref), ("key", gv(bc.types[ref].definition.type)),
              ("has", returns_type(function_named(bc, HAS), HAS)))
    r = {name: a_new_place(bc, fn, kind) for name, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0)})
    r.update({"s:" + w: str_ref(bc, w) for w in (ID, PROPS, PLACES, PLACE, FACTIONS,
                                                 ONE_FACTION, HOLDER, HIDE_LOCKED, HIDE_BLOCKED,
                                                 NO_VILLAGE)})
    flag = returns_type(function_named(bc, HAS), HAS)
    state_at, state_kind = field_by_name(bc, kind_named(bc, FACTION), STATE, "a faction")
    first_at, first_kind = field_by_name(bc, state_kind, FIRST, "a faction's state")
    r.update({"k_state": state_at, "k_first": first_at})
    hidden = (("hide locked", flag), ("hide blocked", flag), ("anytime", flag),
              ("state", state_kind), ("first", first_kind), ("none yet", first_kind),
              ("no ref", argument_kinds(bc, CHECK)[2]),
              ("reason", returns_type(function_named(bc, CHECK), CHECK)))
    r.update({name: a_new_place(bc, fn, kind) for name, kind in hidden})
    return r


def _hidden(bc, op, r, besieger, keep, drop):
    """To `drop` when the row hides itself while the game would refuse it as locked or blocked."""
    cases = {word: enum_case(bc, REASONS, word) for word in (LOCKED, BLOCKED)}
    out = []
    for name, flag in ((HIDE_LOCKED, "hide locked"), (HIDE_BLOCKED, "hide blocked")):
        out += [op("DynGet", dst=r[flag], obj=r["props"], field=r["s:" + name])]
    out += [(op("JTrue", cond=r["hide locked"]), "ask"),
            (op("JFalse", cond=r["hide blocked"]), keep),
            "ask:", op("Label"),
            op("Null", dst=r["no ref"]),
            op("Call4", dst=r["reason"], fun=gv(function_named(bc, CHECK).findex), arg0=0,
               arg1=r["text"], arg2=besieger, arg3=r["no ref"]),
            (op("JNull", reg=r["reason"]), keep),
            op("EnumIndex", dst=r["j"], value=r["reason"])]
    for word, flag in ((LOCKED, "hide locked"), (BLOCKED, "hide blocked")):
        out += [op("Int", dst=r["many"], ptr=number(bc, cases[word])),
                (op("JNotEq", a=r["j"], b=r["many"]), "not " + word),
                (op("JTrue", cond=r[flag]), drop),
                "not " + word + ":", op("Label")]
    return out + [(op("JAlways"), keep)]


def emit_menu(bc, fn, at):
    """Walk the rows set aside; offer each whose `places` holds this place and whose props allow."""
    op = cdbwalk.op_of(bc)
    holder, listed = fn.ops[at], fn.ops[at + 1]
    besieger = _besieger(bc, fn)
    entity_at, _ = field_by_name(bc, kind_named(bc, COMPONENT), ENTITY, "a siege component")
    kind_at, text_kind = field_by_name(bc, kind_named(bc, BESIEGED), KIND, "a structure")
    faction_kind_at, _ = field_by_name(bc, kind_named(bc, FACTION), KIND, "a faction")
    r = _menu_places(bc, fn, holder, text_kind)
    array, n = kind_named(bc, LIST), board.a_number(bc)
    out = [written(holder, dst=r["holder"]),
           written(listed, dst=r["menu"], obj=r["holder"]),
           (op("JNull", reg=r["menu"]), "done"),
           (op("JNull", reg=besieger), "done"),
           op("GetThis", dst=r["entity"], field=entity_at),
           op("UnsafeCast", dst=r["place"], src=r["entity"]),
           (op("JNull", reg=r["place"]), "done"),
           op("Field", dst=r["kind"], obj=r["place"], field=kind_at),
           (op("JNull", reg=r["kind"]), "done"),
           op("Call1", dst=r["owner"], fun=gv(function_named(bc, OWNER).findex),
              arg0=r["place"]),
           op("Field", dst=r["by"], obj=besieger, field=faction_kind_at),
           op("GetGlobal", **{"dst": r["rows"], "global": slot_global(bc, KEPT, array)}),
           (op("JNull", reg=r["rows"]), "done")]
    out += _walk(op, r, "rows", "i", "row", "row", "done")
    out += [(op("JNull", reg=r["row"]), "row"),
            op("DynGet", dst=r["props"], obj=r["row"], field=r["s:" + PROPS]),
            (op("JNull", reg=r["props"]), "row")]
    # the place: required, and any one of the listed structures will do
    out += _list(op, r, "props", PLACES, "row")
    out += _walk(op, r, "list", "j", "entry", "place", "row")
    out += _text(op, r, "entry", PLACE, "place")
    out += [(op("JNotEq", a=r["text"], b=r["kind"]), "place")]
    # the besieger: no list, or an empty one, is every faction
    out += _list(op, r, "props", FACTIONS, "holder")
    out += [op("Field", dst=r["many"], obj=r["list"], field=r["k_many"]),
            op("Int", dst=r["j"], ptr=r["0"]),
            (op("JEq", a=r["many"], b=r["j"]), "holder")]
    out += _walk(op, r, "list", "j", "entry", "faction", "unlock")
    out += _text(op, r, "entry", ONE_FACTION, "faction")
    out += [(op("JNotEq", a=r["text"], b=r["by"]), "faction"),
            (op("JAlways"), "holder"),
            "unlock:", op("Label")]
    out += _unlocked(bc, op, r, besieger, "holder", "row")
    # the target: none is any holder; a choice the load did not find offers nothing
    out += ["holder:", op("Label"),
            op("DynGet", dst=r["got"], obj=r["props"], field=r["s:" + HOLDER]),
            (op("JNull", reg=r["got"]), "offer"),
            op("SafeCast", dst=r["j"], src=r["got"]),
            op("Incr", dst=r["j"]),
            op("GetGlobal", **{"dst": r["many"], "global": slot_global(bc, AT_NEUTRAL, n)}),
            (op("JNotEq", a=r["j"], b=r["many"]), "not neutral"),
            (op("JNotNull", reg=r["owner"]), "row"),
            (op("JAlways"), "offer"),
            "not neutral:", op("Label"),
            op("GetGlobal", **{"dst": r["many"], "global": slot_global(bc, AT_ENEMY, n)}),
            (op("JNotEq", a=r["j"], b=r["many"]), "row"),
            (op("JNull", reg=r["owner"]), "row"),
            "offer:", op("Label"),
            op("DynGet", dst=r["anytime"], obj=r["props"], field=r["s:" + NO_VILLAGE]),
            (op("JTrue", cond=r["anytime"]), "village"),
            op("Field", dst=r["state"], obj=besieger, field=r["k_state"]),
            (op("JNull", reg=r["state"]), "row"),
            op("Field", dst=r["first"], obj=r["state"], field=r["k_first"]),
            op("Int", dst=r["j"], ptr=r["0"]),
            op("ToSFloat", dst=r["none yet"], src=r["j"]),
            (op("JNotGte", a=r["first"], b=r["none yet"]), "row"),
            "village:", op("Label")]
    out += _text(op, r, "row", ID, "row")
    out += _hidden(bc, op, r, besieger, "push", "row")
    out += ["push:", op("Label"),
            op("Call2", dst=r["pushed"], fun=gv(function_named(bc, PUSH).findex),
               arg0=r["menu"], arg1=r["text"]),
            (op("JAlways"), "row"),
            "done:", op("Label")]
    return assemble(out)


def _asked(bc, fn, name):
    """Where the start asks what the besieger lacks, and the game's own refusal right after."""
    asks = [i for i, o in enumerate(fn.ops) if o.op == "Call3"
            and gv(o.df["fun"]) == gv(function_named(bc, MISSING).findex)]
    guard(len(asks) == 1, "`%s` asks `%s` %d time(s), not once" % (name, MISSING, len(asks)))
    lacking = gv(fn.ops[asks[0]].df["dst"])
    refusals = [o for o in fn.ops[asks[0]:asks[0] + 8] if o.op == "MakeEnum"
                and gv(o.df["construct"]) == enum_case(bc, REASONS, LOCKED)]
    guard(len(refusals) == 1, "`%s` does not refuse as `%s` right after asking" % (name, LOCKED))
    return asks[0], lacking, refusals[0]


def emit_lock(bc, fn, name):
    """For an authored row, the switches decide: free unless locked by default and not unlocked."""
    op = cdbwalk.op_of(bc)
    at, lacking, refusal = _asked(bc, fn, name)
    texts = [i + (0 if is_static(bc, fn) else 1) for i, k in enumerate(argument_kinds(bc, name))
             if gv(k) == gv(argument_kinds(bc, CHECK)[0])]
    guard(len(texts) == 1, "`%s` takes %d text(s), not the one id" % (name, len(texts)))
    besieger = gv(fn.ops[at].df["arg0"])
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, "length", "a list")
    k_back, back_kind = field_by_name(bc, array, "array", "a list")
    n, dyn = board.a_number(bc), argument_kind(bc, COMPARE, 0)
    ref = argument_kind(bc, HAS, 1)
    wanted = (("rows", array), ("back", back_kind), ("row", dyn), ("props", dyn), ("got", dyn),
              ("text", gv(fn.regs[texts[0]])), ("i", n), ("j", n), ("many", n), ("attr", n),
              ("ref", ref), ("key", gv(bc.types[ref].definition.type)),
              ("has", returns_type(function_named(bc, HAS), HAS)),
              ("locked", returns_type(function_named(bc, HAS), HAS)),
              ("reason", returns_type(fn, name)))
    r = {w: a_new_place(bc, fn, kind) for w, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0)})
    out = [op("GetGlobal", **{"dst": r["rows"], "global": slot_global(bc, KEPT, array)}),
           (op("JNull", reg=r["rows"]), "game's")]
    out += _walk(op, r, "rows", "i", "row", "row", "game's")
    out += [(op("JNull", reg=r["row"]), "row"),
            op("DynGet", dst=r["got"], obj=r["row"], field=str_ref(bc, ID)),
            op("UnsafeCast", dst=r["text"], src=r["got"]),
            (op("JNull", reg=r["text"]), "row"),
            (op("JNotEq", a=r["text"], b=texts[0]), "row"),
            op("DynGet", dst=r["props"], obj=r["row"], field=str_ref(bc, PROPS)),
            (op("JNull", reg=r["props"]), "free"),
            op("DynGet", dst=r["locked"], obj=r["props"], field=str_ref(bc, LOCKED_BY_DEFAULT)),
            (op("JFalse", cond=r["locked"]), "free")]
    out += _unlocked(bc, op, r, besieger, "free", "locked")
    out += ["locked:", op("Label"),
            written(refusal, dst=r["reason"], args=[lacking]),
            op("Ret", ret=r["reason"]),
            "free:", op("Label"),
            op("Int", dst=r["j"], ptr=r["0"]),
            op("SetField", obj=lacking, field=k_many, src=r["j"]),
            "game's:", op("Label")]
    return at + 1, assemble(out)


def install(bc):
    # off means the base already carries it; see `standalone/onoff.py`
    if not onoff.on(NAME):
        return "siegeactions: OFF -- the base this build starts from already carries it"
    load, end = cdbwalk.load_end(bc)
    kept = insert(bc, load, end, emit_collect(bc, load), COLLECT, traps.AT_AUTHORED_DATA)
    fn = function_named(bc, MENU)
    at = _tail(fn)
    added = insert(bc, fn, at, emit_menu(bc, fn, at), ADDS, traps.IN_PLAY)
    locks = []
    for name, what in zip(STARTS, LOCKS):
        start = function_named(bc, name)
        at, block = emit_lock(bc, start, name)
        locks.append(insert(bc, start, at, block, what, traps.IN_PLAY))
    return ("siegeactions: %d instruction(s) set aside the `%s` rows carrying `%s` when the cdb "
            "loads, %d offer each one whose props allow it, %s lock them by their switches"
            % (kept, SHEET, PLACES, added, "+".join(map(str, locks))))
