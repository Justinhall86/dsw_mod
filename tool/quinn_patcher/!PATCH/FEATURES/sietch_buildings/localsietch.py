#!/usr/bin/env python3
"""A Local Sietch accepts the buildings under its own `building` separator, found by title."""
from tools.project import gv, guard
from tools.hlcode import assemble, fields_of, field_by_name, function_named, number, slot_global
from tools.splice import insert
from framework import board, traps
from framework.parsed import a_new_place
from standalone import cdbwalk, onoff
from standalone.cdbwalk import LIST, each, same

NAME = "localsietch"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

SHEET, TITLE = "building", "LocalSietch"
# where the game decides what a Local Sietch may hold: the closure it files under this name
FILES, FILED_AS = "$HBuilding.reload", "localSietch"
# what a building row says of its own section, and the game's own section it accepts
GROUP = "group"

WALK = "the LocalSietch group, read when the cdb loads"
ASK = "a building of the LocalSietch section is accepted"
# its section's group plus one; 0 until a load finds the separator, and 0 changes nothing
KEPT = "the LocalSietch group"


def emit_walk(bc, fn):
    """The group the game gives the rows under `LocalSietch`, counted the way `initLines` does."""
    op = cdbwalk.op_of(bc)
    sep_kind = cdbwalk.parsed_kind(bc, "title")
    seps_at, _ = field_by_name(bc, cdbwalk.parsed_kind(bc, "columns"), "separators", "a sheet")
    index_at, index_kind = field_by_name(bc, sep_kind, "index", "a separator")
    title_at, _ = field_by_name(bc, sep_kind, "title", "a separator")
    n = board.a_number(bc)
    r = cdbwalk.places(bc, fn, (("seps", LIST), ("sep", sep_kind), ("index", index_kind),
                                ("j", n), ("g", n), ("lead", n), ("at", n), ("one", n)))
    kept = slot_global(bc, KEPT, n)
    # the count opens at minus one, made as 0 - 1: the file's numbers are kept unsigned
    out = [op("Int", dst=r["lead"], ptr=number(bc, 1)),
           op("Int", dst=r["one"], ptr=number(bc, 1)),
           op("Int", dst=r["g"], ptr=r["0"]),
           op("Sub", dst=r["g"], a=r["g"], b=r["one"])]
    out += cdbwalk.to_sheet(bc, op, r, SHEET, "absent")
    out += [op("Field", dst=r["seps"], obj=r["sheet"], field=seps_at),
            (op("JNull", reg=r["seps"]), "absent")]
    out += each(op, r, "seps", "j", "separator", "absent")
    # separators at the first row open the count; the first one past it starts the rest at 0
    out += [op("ToVirtual", dst=r["sep"], src=r["dyn"]),
            (op("JNull", reg=r["sep"]), "separator"),
            op("Int", dst=r["zero"], ptr=r["0"]),
            (op("JEq", a=r["lead"], b=r["zero"]), "counted"),
            op("Field", dst=r["index"], obj=r["sep"], field=index_at),
            (op("JNull", reg=r["index"]), "lead over"),
            op("SafeCast", dst=r["at"], src=r["index"]),
            (op("JEq", a=r["at"], b=r["zero"]), "counted"),
            "lead over:", op("Label"),
            op("Int", dst=r["lead"], ptr=r["0"]),
            (op("JSGte", a=r["g"], b=r["zero"]), "counted"),
            op("Int", dst=r["g"], ptr=r["0"]),
            "counted:", op("Label"),
            op("Field", dst=r["text"], obj=r["sep"], field=title_at),
            (op("JNull", reg=r["text"]), "separator"),
            op("Incr", dst=r["g"])]
    out += same(bc, op, r, TITLE, "separator")
    out += [op("Add", dst=r["at"], a=r["g"], b=r["one"]),
            op("SetGlobal", **{"global": kept, "src": r["at"]}),
            (op("JAlways"), "done"),
            "absent:", op("Label"),
            op("Int", dst=r["at"], ptr=r["0"]),
            op("SetGlobal", **{"global": kept, "src": r["at"]})]
    return assemble(out + ["done:", op("Label")])


def the_predicate(bc):
    """The closure `$HBuilding.reload` files as `localSietch`, found by the field's name."""
    files = function_named(bc, FILES)
    found = []
    for i, o in enumerate(files.ops):
        if o.op != "SetField":
            continue
        names, _ = fields_of(bc, gv(files.regs[gv(o.df["obj"])]), "what reload fills")
        if names[gv(o.df["field"])] != FILED_AS:
            continue
        made = [p for p in files.ops[:i] if p.op == "StaticClosure"]
        guard(made, "`%s` files `%s` with no closure made before it" % (FILES, FILED_AS))
        found.append(gv(made[-1].df["fun"]))
    guard(len(found) == 1, "`%s` files `%s` %d time(s)" % (FILES, FILED_AS, len(found)))
    return next(f for f in bc.functions if gv(f.findex) == found[0])


def emit_ask(bc, fn, group, zero, past):
    """Before the game's `group is 0` refusal: a row of the kept group goes on to be accepted."""
    op = cdbwalk.op_of(bc)
    n = board.a_number(bc)
    w, nothing, one = (a_new_place(bc, fn, n) for _ in range(3))
    block = assemble([
        (op("JEq", a=group, b=zero), "the game's own"),
        op("GetGlobal", **{"dst": w, "global": slot_global(bc, KEPT, n)}),
        op("Int", dst=nothing, ptr=number(bc, 0)),
        (op("JEq", a=w, b=nothing), "the game's own"),
        op("Int", dst=one, ptr=number(bc, 1)),
        op("Sub", dst=w, a=w, b=one),
        (op("JNotEq", a=group, b=w), "the game's own"),
        (op("JAlways"), "the game's own"),
        "the game's own:", op("Label"),
    ])
    # the one jump past the refusal: it lands `past` instructions beyond the block's end
    accept = len(block) - 2
    block[accept].df["offset"].value = len(block) + past - (accept + 1)
    return block


def install(bc):
    if not onoff.on(NAME):
        return "localsietch: OFF"
    load, end = cdbwalk.load_end(bc)
    walked = insert(bc, load, end, emit_walk(bc, load), WALK, traps.AT_AUTHORED_DATA)
    fn = the_predicate(bc)
    reads = [i for i, o in enumerate(fn.ops) if o.op == "Field" and fields_of(
        bc, gv(fn.regs[gv(o.df["obj"])]), "a building row")[0][gv(o.df["field"])] == GROUP]
    guard(len(reads) == 1, "the predicate reads `%s` %d time(s)" % (GROUP, len(reads)))
    at = reads[0]
    load_zero, refuse = fn.ops[at + 1], fn.ops[at + 2]
    group = gv(fn.ops[at].df["dst"])
    guard(load_zero.op == "Int" and refuse.op == "JNotEq"
          and gv(refuse.df["a"]) == group and gv(refuse.df["b"]) == gv(load_zero.df["dst"]),
          "the predicate does not refuse a group that is not 0 right after reading it")
    asked = insert(bc, fn, at + 2, emit_ask(bc, fn, group, gv(load_zero.df["dst"]), 1),
                   ASK, traps.AT_AUTHORED_DATA)
    return ("localsietch: %d instruction(s) find the `LocalSietch` group by title when the cdb "
            "loads, %d let a building of that group in" % (walked, asked))
