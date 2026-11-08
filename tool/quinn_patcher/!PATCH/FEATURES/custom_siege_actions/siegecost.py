#!/usr/bin/env python3
"""An authored siege action's `cost` joins the game's own siege cost: checked, paid, refunded."""
from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, calls, field_by_name, function_named,
                          is_static, kind_named, lands_at, number, slot_global)
from tools.splice import insert
from framework import board, traps
from framework.parsed import a_new_place
from standalone import cdbwalk, onoff
from standalone.cdbwalk import COMPARE, LIST
from standalone.siegeactions import FACTION, ID, KEPT, PROPS, PUSH, _list, _text, _walk
from armoury_lib import str_ref                                    # noqa: E402

NAME = "siegecost"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("siegeactions",)

# every siege action's cost is asked of this one, which builds it fresh for the row it is handed
COSTS = "ent.comp.SiegeComponent.getOccupationActionCostDetails"
COST, QTY, RES, SRC, TITLE = "cost", "qty", "res", "src", "name"
ADDS = "an authored siege action's own cost, in place of the game's"
# both starts note the Authority paid on the village, which it gives back on a change of owner
RECORD, NO_REFUND = ("ent.FactionData.set_lastCaptureCost",
                     "ent.comp.SiegeComponent.getOccupationActionNoRefundCost")
EXISTS, LOOKUP = "haxe.ds.ObjectMap.exists", "haxe.ds.StringMap.get"
UNRECORDED = "an authored siege action's cost is not noted on the village"


def _dyn(bc):
    """The kind a cdb value is read as."""
    return argument_kinds(bc, COMPARE)[0]


def _made_list(bc, fn):
    """The cost list the function starts by making: its entries' kind, where it is, its place."""
    kinds = [i for i, o in enumerate(fn.ops) if o.op == "Type"]
    guard(len(kinds) == 1, "`%s` names %d kind(s), not the one of its list" % (COSTS, len(kinds)))
    wrap = next((i for i in range(kinds[0], len(fn.ops)) if fn.ops[i].op == "Call1"), None)
    guard(wrap is not None, "`%s` makes no list after naming its kind" % COSTS)
    listed = gv(fn.ops[wrap].df["dst"])
    guard(gv(fn.regs[listed]) == gv(kind_named(bc, LIST)), "`%s` makes no list" % COSTS)
    return gv(fn.ops[kinds[0]].df["ty"]), wrap + 1, listed


def _row_argument(bc, fn):
    """The function's own argument holding the siege action's row, found by not being a faction."""
    after_this = 0 if is_static(bc, fn) else 1
    at = [i + after_this for i, k in enumerate(argument_kinds(bc, COSTS))
          if gv(k) != gv(kind_named(bc, FACTION))]
    guard(len(at) == 1, "`%s` takes %d row(s), not one" % (COSTS, len(at)))
    return at[0]


def emit_cost(bc, fn):
    """For an authored row: its `cost` list, one entry per line, and the game adds nothing."""
    op = cdbwalk.op_of(bc)
    entry_kind, at, made = _made_list(bc, fn)
    row_arg = _row_argument(bc, fn)
    id_at, text_kind = field_by_name(bc, gv(fn.regs[row_arg]), ID, "a siege action row")
    res_at, res_kind = field_by_name(bc, entry_kind, RES, "a cost entry")
    qty_at, qty_kind = field_by_name(bc, entry_kind, QTY, "a cost entry")
    src_at, src_kind = field_by_name(bc, entry_kind, SRC, "a cost entry")
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, "length", "a list")
    k_back, back_kind = field_by_name(bc, array, "array", "a list")
    n, dyn = board.a_number(bc), _dyn(bc)
    wanted = (("rows", array), ("list", array), ("back", back_kind), ("row", dyn),
              ("props", dyn), ("entry", dyn), ("got", dyn), ("id", text_kind),
              ("text", text_kind), ("title", src_kind), ("res", res_kind), ("qty", qty_kind),
              ("item", entry_kind), ("i", n), ("j", n), ("many", n), ("pushed", n))
    r = {w: a_new_place(bc, fn, kind) for w, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0)})
    r.update({"s:" + w: str_ref(bc, w) for w in (ID, PROPS, COST, QTY, RES, TITLE)})
    out = [op("Field", dst=r["id"], obj=row_arg, field=id_at),
           (op("JNull", reg=r["id"]), "game's"),
           op("GetGlobal", **{"dst": r["rows"], "global": slot_global(bc, KEPT, array)}),
           (op("JNull", reg=r["rows"]), "game's")]
    out += _walk(op, r, "rows", "i", "row", "row", "game's")
    out += [(op("JNull", reg=r["row"]), "row")]
    out += _text(op, r, "row", ID, "row")
    out += [(op("JNotEq", a=r["text"], b=r["id"]), "row"),
            op("DynGet", dst=r["props"], obj=r["row"], field=r["s:" + PROPS]),
            (op("JNull", reg=r["props"]), "ours"),
            op("DynGet", dst=r["got"], obj=r["row"], field=r["s:" + TITLE]),
            op("UnsafeCast", dst=r["title"], src=r["got"])]
    out += _list(op, r, "props", COST, "ours")
    out += _walk(op, r, "list", "j", "entry", "line", "ours")
    out += [(op("JNull", reg=r["entry"]), "line"),
            op("DynGet", dst=r["got"], obj=r["entry"], field=r["s:" + RES]),
            op("UnsafeCast", dst=r["res"], src=r["got"]),
            (op("JNull", reg=r["res"]), "line"),
            op("DynGet", dst=r["qty"], obj=r["entry"], field=r["s:" + QTY]),
            op("New", dst=r["item"]),
            op("SetField", obj=r["item"], field=res_at, src=r["res"]),
            op("SetField", obj=r["item"], field=qty_at, src=r["qty"]),
            op("SetField", obj=r["item"], field=src_at, src=r["title"]),
            op("Call2", dst=r["pushed"], fun=gv(function_named(bc, PUSH).findex), arg0=made,
               arg1=r["item"]),
            (op("JAlways"), "line"),
            "ours:", op("Label"),
            op("Ret", ret=made),
            "game's:", op("Label")]
    return at, assemble(out)


def _recordings(bc):
    """Each start that notes the cost on the village: where it asks, and the action's id."""
    record, exists = function_named(bc, RECORD), function_named(bc, EXISTS)
    lookup, no_refund = function_named(bc, LOOKUP), function_named(bc, NO_REFUND)
    found = []
    for fn in bc.functions:
        if not any(calls(o, no_refund) for o in fn.ops):
            continue
        noted = [i for i, o in enumerate(fn.ops) if calls(o, record)]
        if not noted:
            continue
        guard(len(noted) == 1, "a siege start notes the cost %d time(s), not once" % len(noted))
        asked = [i for i in range(noted[0]) if calls(fn.ops[i], exists)]
        guard(asked, "a siege start notes the cost without asking whether the village keeps it")
        jump = asked[-1] + 1
        cond = gv(fn.ops[asked[-1]].df["dst"])
        guard(fn.ops[jump].op == "JFalse" and gv(fn.ops[jump].df["cond"]) == cond
              and lands_at(fn.ops[jump], jump) > noted[0],
              "a siege start does not step past the noting when the village keeps nothing")
        looked = [i for i in range(asked[-1]) if calls(fn.ops[i], lookup)]
        guard(looked, "a siege start notes the cost without looking its action up")
        named = gv(fn.ops[looked[-1]].df["arg1"])
        guard(not any(gv(o.df.get("dst", -1)) == named for o in fn.ops[looked[-1] + 1:jump]),
              "a siege start's action id is overwritten before the noting")
        found.append((fn, jump, cond, named))
    guard(found, "no siege start notes the cost on the village")
    return found


def emit_unrecorded(bc, fn, cond, named):
    """For an authored row, the village keeps nothing to note: the game's own step is skipped."""
    op = cdbwalk.op_of(bc)
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, "length", "a list")
    k_back, back_kind = field_by_name(bc, array, "array", "a list")
    n, dyn = board.a_number(bc), _dyn(bc)
    wanted = (("rows", array), ("back", back_kind), ("row", dyn), ("got", dyn),
              ("text", gv(fn.regs[named])), ("i", n), ("many", n))
    r = {w: a_new_place(bc, fn, kind) for w, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0), "s:" + ID: str_ref(bc, ID)})
    out = [op("GetGlobal", **{"dst": r["rows"], "global": slot_global(bc, KEPT, array)}),
           (op("JNull", reg=r["rows"]), "game's")]
    out += _walk(op, r, "rows", "i", "row", "row", "game's")
    out += [(op("JNull", reg=r["row"]), "row")]
    out += _text(op, r, "row", ID, "row")
    out += [(op("JNotEq", a=r["text"], b=named), "row"),
            op("Bool", dst=cond, value=False),
            "game's:", op("Label")]
    return assemble(out)


def install(bc):
    # off means the base already carries it; see `shared/onoff.py`
    if not onoff.on(NAME):
        return "siegecost: OFF -- the base this build starts from already carries it"
    fn = function_named(bc, COSTS)
    at, block = emit_cost(bc, fn)
    added = insert(bc, fn, at, block, ADDS, traps.IN_PLAY)
    skips = [insert(bc, start, jump, emit_unrecorded(bc, start, cond, named),
                    "%s, start %d" % (UNRECORDED, k + 1), traps.IN_PLAY)
             for k, (start, jump, cond, named) in enumerate(_recordings(bc))]
    return ("siegecost: %d instruction(s) hand an authored row's `%s` to the game's siege cost, "
            "%s keep it off the village's record" % (added, COST, "+".join(map(str, skips))))
