#!/usr/bin/env python3
"""NoLoseAt100: a plot whose `flags` carry it does not end the Conquest when its bar fills."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, assemble, call_sites, enum_case, field_by_name,
                          function_named, kind_named, number, slot_global)
from tools.splice import insert
from framework import board, traps
from framework.foreignwalk import the_global_of
from framework.parsed import a_new_place
from standalone import cdbwalk, onoff
from standalone.cdbwalk import COMPARE, DATA, LIST, each, same
from armoury_lib import str_ref                                    # noqa: E402

NAME = "noloseat100"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the flag, the sheet and the column it is authored in, all read by name when the cdb loads
FLAG, SHEET, COLUMN = "NoLoseAt100", "plot", "flags"
KINDS, FLAGS_CASE = "cdb.ColumnType", "TFlags"
# the bar-full question, and the only two places that ask it: both end the Conquest in defeat
GATE = "Conquest.isPlotComplete"
ASKED_BY = ("Conquest.checkVictory", "Conquest.onPlotProgress")
LOOK_UP, SHEET_KIND = "haxe.ds.StringMap.get", "cdb.IndexId"

WALK = "the NoLoseAt100 bit, read when the cdb loads"
SKIP = "a NoLoseAt100 plot does not fill"
# the place the bit is kept in between; 0 until a load finds the flag, and 0 changes nothing
KEPT = "the NoLoseAt100 bit"


def emit_walk(bc, fn):
    """At the end of the load: the flag's position in `plot`'s `flags`, kept as its bit."""
    op = cdbwalk.op_of(bc)
    sheet_kind, column_kind = cdbwalk.parsed_kind(bc, "columns"), cdbwalk.parsed_kind(bc, "typeStr")
    s_cols, _ = field_by_name(bc, sheet_kind, "columns", "a parsed sheet")
    c_name, _ = field_by_name(bc, column_kind, "name", "a parsed column")
    c_type, type_kind = field_by_name(bc, column_kind, "type", "a parsed column")
    case = enum_case(bc, KINDS, FLAGS_CASE)
    params = bc.types[type_kind].definition.constructs[case].params
    guard(len(params) == 1, "`%s` carries %d thing(s), not one list" % (FLAGS_CASE, len(params)))
    number_kind = board.a_number(bc)
    r = cdbwalk.places(bc, fn, (("cols", LIST), ("names", LIST), ("col", column_kind),
                                ("kind", type_kind), ("j", number_kind), ("k", number_kind),
                                ("bit", number_kind), ("one", number_kind)))
    kept = slot_global(bc, KEPT, number_kind)
    out = [op("Int", dst=r["bit"], ptr=r["0"])] + cdbwalk.to_sheet(bc, op, r, SHEET, "absent")
    out += [op("Field", dst=r["cols"], obj=r["sheet"], field=s_cols),
            (op("JNull", reg=r["cols"]), "absent")]
    out += each(op, r, "cols", "j", "column", "absent")
    out += [op("ToVirtual", dst=r["col"], src=r["dyn"]),
            (op("JNull", reg=r["col"]), "column"),
            op("Field", dst=r["text"], obj=r["col"], field=c_name)]
    out += same(bc, op, r, COLUMN, "column")
    out += [op("Field", dst=r["kind"], obj=r["col"], field=c_type),
            (op("JNull", reg=r["kind"]), "absent"),
            op("EnumIndex", dst=r["many"], value=r["kind"]),
            op("Int", dst=r["zero"], ptr=number(bc, case)),
            (op("JNotEq", a=r["many"], b=r["zero"]), "absent"),
            op("EnumField", dst=r["names"], value=r["kind"], construct=case, field=0),
            (op("JNull", reg=r["names"]), "absent")]
    out += each(op, r, "names", "k", "flag", "absent")
    out += [op("UnsafeCast", dst=r["text"], src=r["dyn"])]
    out += same(bc, op, r, FLAG, "flag")
    # the walk stepped past the flag before comparing it, so its position is one back
    out += [op("Int", dst=r["one"], ptr=number(bc, 1)),
            op("Sub", dst=r["k"], a=r["k"], b=r["one"]),
            op("Shl", dst=r["bit"], a=r["one"], b=r["k"]),
            op("SetGlobal", **{"global": kept, "src": r["bit"]}),
            (op("JAlways"), "done"),
            "absent:", op("Label"),
            op("SetGlobal", **{"global": kept, "src": r["bit"]})]
    return assemble(out + ["done:", op("Label")])


def emit_gate(bc, fn, ret):
    """Past a full bar: a plot whose flags carry the kept bit answers `not full`, and returns."""
    op = cdbwalk.op_of(bc)
    data_at, data_kind = field_by_name(bc, kind_named(bc, "Conquest"), "data", "a Conquest")
    plot_at, id_kind = field_by_name(bc, data_kind, SHEET, "a Conquest's data")
    sheet_at, sheet_kind = field_by_name(bc, kind_named(bc, DATA), SHEET, "the cdb class")
    by_id_at, map_kind = field_by_name(bc, kind_named(bc, SHEET_KIND), "byId", "a sheet")
    number_kind = board.a_number(bc)
    wanted = (("data", data_kind), ("id", id_kind), ("cdb", kind_named(bc, DATA)),
              ("sheet", sheet_kind), ("map", map_kind),
              ("row", argument_kind(bc, COMPARE, 0)),
              ("bit", number_kind), ("flags", number_kind), ("zero", number_kind))
    r = {name: a_new_place(bc, fn, kind) for name, kind in wanted}
    return assemble([
        op("GetGlobal", **{"dst": r["bit"], "global": slot_global(bc, KEPT, number_kind)}),
        op("Int", dst=r["zero"], ptr=number(bc, 0)),
        (op("JEq", a=r["bit"], b=r["zero"]), "full"),
        op("GetThis", dst=r["data"], field=data_at),
        (op("JNull", reg=r["data"]), "full"),
        op("Field", dst=r["id"], obj=r["data"], field=plot_at),
        (op("JNull", reg=r["id"]), "full"),
        op("GetGlobal", **{"dst": r["cdb"], "global": the_global_of(bc, DATA)}),
        op("Field", dst=r["sheet"], obj=r["cdb"], field=sheet_at),
        (op("JNull", reg=r["sheet"]), "full"),
        op("Field", dst=r["map"], obj=r["sheet"], field=by_id_at),
        (op("JNull", reg=r["map"]), "full"),
        op("Call2", dst=r["row"], fun=gv(function_named(bc, LOOK_UP).findex), arg0=r["map"],
           arg1=r["id"]),
        (op("JNull", reg=r["row"]), "full"),
        op("DynGet", dst=r["flags"], obj=r["row"], field=str_ref(bc, COLUMN)),
        op("And", dst=r["flags"], a=r["flags"], b=r["bit"]),
        (op("JEq", a=r["flags"], b=r["zero"]), "full"),
        op("Bool", dst=ret, value=False),
        op("Ret", ret=ret),
        "full:", op("Label"),
    ])


def install(bc):
    if not onoff.on(NAME):
        return "noloseat100: OFF"
    gate = function_named(bc, GATE)
    # both callers end the Conquest in defeat, so gating the question gates both
    asking = sorted(gv(f.findex) for f in bc.functions if call_sites(f, gate))
    guard(asking == sorted(gv(function_named(bc, n).findex) for n in ASKED_BY),
          "`%s` is asked by f@%s, not by %s alone" % (GATE, asking, " and ".join(ASKED_BY)))
    load, end = cdbwalk.load_end(bc)
    walked = insert(bc, load, end, emit_walk(bc, load), WALK, traps.AT_AUTHORED_DATA)
    # the one place a full bar answers: the instruction that sets `true` on the way out
    full = [i for i, o in enumerate(gate.ops) if o.op == "Bool" and gv(o.df["value"]) is True]
    guard(len(full) == 1, "`%s` answers `true` %d time(s), not once" % (GATE, len(full)))
    gated = insert(bc, gate, full[0], emit_gate(bc, gate, gv(gate.ops[full[0]].df["dst"])),
                   SKIP, traps.IN_PLAY)
    return ("noloseat100: %d instruction(s) find the flag by name when the cdb loads, %d keep a "
            "plot carrying it from filling" % (walked, gated))
