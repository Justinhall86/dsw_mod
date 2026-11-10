"""Helpers shared by the thorvald_sworn tick (names are prefixed so they cannot clash with Quinn's modules)."""
import json
import os
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import register_like, template, written, number

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))


def cdb_path():
    return os.environ.get("DSW_CDB") or os.path.join(REPO, "mod_files", "data.cdb")


def attribute_index(name):
    """Row position of an attribute in the cdb's `attribute` sheet, which is the number the engine compares against."""
    with open(cdb_path(), encoding="utf-8") as f:
        data = json.load(f)
    for sheet in data["sheets"]:
        if sheet["name"] == "attribute":
            ids = [r["id"] for r in sheet["lines"]]
            return ids.index(name) if name in ids else None
    return None


def new_reg(bc, fn, kind):
    """One more register of that kind on `fn`."""
    fn.regs.append(deepcopy(register_like(bc, kind)))
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1


def op(bc, what, **operands):
    return written(template(bc, what), **operands)


def int_op(bc, dst, n):
    return op(bc, "Int", dst=dst, ptr=number(bc, n))


def float_pool(bc, value):
    """Where `value` sits in the file's list of floats, appended when missing."""
    for at, held in enumerate(bc.floats):
        if gv(held) == value:
            return at
    bc.floats.append(deepcopy(bc.floats[0]))
    bc.floats[-1].value = value
    if getattr(bc, "nfloats", None) is not None:
        bc.nfloats.value = len(bc.floats)
    return len(bc.floats) - 1


def float_op(bc, dst, value):
    return op(bc, "Float", dst=dst, ptr=float_pool(bc, value))


def int_value(bc, o):
    """The number an `Int` instruction loads."""
    pool = bc.ints.value if hasattr(bc.ints, "value") else bc.ints
    return gv(pool[gv(o.df["ptr"])])


def call(bc, dst, findex, *args):
    if len(args) <= 4:
        operands = {"dst": dst, "fun": findex}
        operands.update({"arg%d" % i: a for i, a in enumerate(args)})
        return op(bc, "Call%d" % len(args), **operands)
    return op(bc, "CallN", dst=dst, fun=findex, args=list(args))


def the_game_chain(bc, fn, *fields):
    """Instructions that walk Game.inst -> .state -> ... ; returns (ops, [regs per step], kinds). Each step may be null."""
    from tools.hlcode import kind_named, field_by_name
    from framework.foreignwalk import the_global_of
    cls_kind, game_kind = kind_named(bc, "$Game"), kind_named(bc, "Game")
    cls, game = new_reg(bc, fn, cls_kind), new_reg(bc, fn, game_kind)
    out = [op(bc, "GetGlobal", **{"dst": cls, "global": the_global_of(bc, "$Game")})]
    at, _ = field_by_name(bc, cls_kind, "inst", "the game class")
    out.append(op(bc, "Field", dst=game, obj=cls, field=at))
    regs, cur_kind, cur = [game], game_kind, game
    for name in fields:
        at, kind = field_by_name(bc, cur_kind, name, name)
        reg = new_reg(bc, fn, kind)
        out.append(op(bc, "Field", dst=reg, obj=cur, field=at))
        regs.append(reg)
        cur, cur_kind = reg, kind
    return out, regs
