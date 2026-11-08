#!/usr/bin/env python3
"""The cdb as the game keeps it after a load, walked BY NAME: a sheet, then one of its lists."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, field_by_name, function_named, kind_named, number,
                          template, text_object, written)
from framework import board
from framework.foreignwalk import the_global_of
from framework.parsed import a_new_place

# where the cdb is parsed and kept whole, and the parse that says what each part of it is
LOAD, PARSE, DATA = "$Data.load", "cdb.$Parser.parse", "$Data"
COMPARE, LIST = "String.__compare", "hl.types.ArrayObj"
HOW_MANY, BACKING = "length", "array"


def op_of(bc):
    return lambda what, **operands: written(template(bc, what), **operands)


def parsed_kind(bc, having):
    """The kind the parse reads a sheet, column or separator as: its one narrowing with `having`."""
    parse = function_named(bc, PARSE)
    found = set()
    for o in parse.ops:
        if o.op != "ToVirtual":
            continue
        kind = gv(parse.regs[gv(o.df["dst"])])
        try:
            field_by_name(bc, kind, having, "a parsed narrowing")
        except BaseException:
            continue
        found.add(kind)
    guard(len(found) == 1, "%s narrows %d kind(s) holding `%s`" % (PARSE, len(found), having))
    return found.pop()


def places(bc, fn, extra=()):
    """The walk's own places, and `extra` (name, kind) beside them; a list is `LIST`."""
    array = kind_named(bc, LIST)
    k_many, _ = field_by_name(bc, array, HOW_MANY, "a parsed list")
    k_back, back_kind = field_by_name(bc, array, BACKING, "a parsed list")
    root_kind = field_by_name(bc, kind_named(bc, DATA), "root", "the cdb class")[1]
    sheet_kind = parsed_kind(bc, "columns")
    text_kind = field_by_name(bc, sheet_kind, "name", "a parsed sheet")[1]
    number_kind = board.a_number(bc)
    wanted = (("data", kind_named(bc, DATA)), ("root", root_kind), ("sheets", array),
              ("back", back_kind), ("dyn", argument_kind(bc, COMPARE, 0)),
              ("sheet", sheet_kind), ("text", text_kind), ("minted", text_kind),
              ("zero", number_kind), ("many", number_kind),
              ("i", number_kind)) + tuple((n, array if k == LIST else k) for n, k in extra)
    r = {name: a_new_place(bc, fn, kind) for name, kind in wanted}
    r.update({"k_many": k_many, "k_back": k_back, "0": number(bc, 0)})
    return r


def same(bc, op, r, word, goes_to):
    """Jump to `goes_to` unless `r["text"]` is exactly `word`: text against text, never boxed."""
    return [
        (op("JNull", reg=r["text"]), goes_to),
        op("GetGlobal", **{"dst": r["minted"], "global": text_object(bc, word)}),
        (op("JNotEq", a=r["text"], b=r["minted"]), goes_to),
    ]


def each(op, r, listed, at, loop, done):
    """The head of a walk over one of the parse's lists: `dyn` is the next one, or we are done."""
    return [
        op("Int", dst=r[at], ptr=r["0"]),
        loop + ":", op("Label"),
        op("Field", dst=r["many"], obj=r[listed], field=r["k_many"]),
        (op("JSGte", a=r[at], b=r["many"]), done),
        op("Field", dst=r["back"], obj=r[listed], field=r["k_back"]),
        op("GetArray", dst=r["dyn"], array=r["back"], index=r[at]),
        op("Incr", dst=r[at]),
    ]


def to_sheet(bc, op, r, name, absent):
    """Past this, `r["sheet"]` is the sheet called `name`; `absent` when the cdb has none."""
    root_at, root_kind = field_by_name(bc, kind_named(bc, DATA), "root", "the cdb class")
    sheets_at, _ = field_by_name(bc, root_kind, "sheets", "the parsed cdb")
    name_at, _ = field_by_name(bc, parsed_kind(bc, "columns"), "name", "a parsed sheet")
    loop = "%s: the next sheet" % name
    return ([op("GetGlobal", **{"dst": r["data"], "global": the_global_of(bc, DATA)}),
             op("Field", dst=r["root"], obj=r["data"], field=root_at),
             (op("JNull", reg=r["root"]), absent),
             op("Field", dst=r["sheets"], obj=r["root"], field=sheets_at),
             (op("JNull", reg=r["sheets"]), absent)]
            + each(op, r, "sheets", "i", loop, absent)
            + [op("ToVirtual", dst=r["sheet"], src=r["dyn"]),
               (op("JNull", reg=r["sheet"]), loop),
               op("Field", dst=r["text"], obj=r["sheet"], field=name_at)]
            + same(bc, op, r, name, loop))


def load_end(bc):
    """The cdb load, and the one place it returns: where a block reads what was just loaded."""
    load = function_named(bc, LOAD)
    ends = [i for i, o in enumerate(load.ops) if o.op == "Ret"]
    guard(len(ends) == 1 and ends[0] == len(load.ops) - 1,
          "`%s` returns at %s, not once at its end" % (LOAD, ends))
    return load, ends[0]
