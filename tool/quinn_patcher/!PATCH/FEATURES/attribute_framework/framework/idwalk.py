#!/usr/bin/env python3
"""Read an authored id into its pieces in the game, once per application, one piece at a time."""
from tools.project import gv, guard
from tools.hlcode import minted_text, template, text_object, written
from framework.rowreader import reader_for

# what the pieces of an id are joined with; the same `_` S3 splits on when it reads one here
JOIN = "_"
# this walk's registers, typed off borrowed signatures; `next` is the join INSIDE `tail`, or < 0
WANTED = (("at", "count_kind"),
          ("next", "count_kind"),
          ("zero", "count_kind"),
          ("one", "count_kind"),
          ("join", "text_kind"),
          ("tail", "text_kind"),
          ("piece", "text_kind"),
          ("nothing", "optional_kind"),
          ("boxed", "optional_kind"))


def registers(bc, fn, reader=None):
    """Every register this walk needs, on `fn`, each typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in WANTED}


def emit_walk(bc, *, fn, id_reg, regs, reader=None, body=(), places="an id"):
    """The walk; `body` runs with each piece, `places` names its labels so walks can nest."""
    r = regs
    reader = reader or reader_for(bc)
    joined = minted_text(bc, JOIN)
    guard(joined is not None, "`%s` is not in this file yet -- install the id walk first" % JOIN)
    # the id has to BE text: ask loose letters for their length and the game comes apart
    guard(gv(list(fn.regs)[id_reg]) == reader.text_kind,
          "register %d holds t@%s, not the text an id is"
          % (id_reg, gv(list(fn.regs)[id_reg])))

    def op(name, **operands):
        return written(template(bc, name), **operands)

    def to(place):
        return "%s %s" % (places, place)

    return [
        # start at the front of the id, with the numbers and the join the round below needs
        op("Int", dst=r["at"], ptr=reader.zero),
        op("Int", dst=r["zero"], ptr=reader.zero),
        op("Int", dst=r["one"], ptr=reader.one),
        op("Null", dst=r["nothing"]),
        op("GetGlobal", **{"dst": r["join"], "global": joined}),
        to("TOP") + ":",
        op("Label"),
        # the tail from here, then the join found in THAT, so every round moves `at` along
        op("Call3", dst=r["tail"], fun=gv(reader.tailing.findex),
           arg0=id_reg, arg1=r["at"], arg2=r["nothing"]),
        (op("JNull", reg=r["tail"]), to("DONE")),
        op("Call3", dst=r["next"], fun=gv(reader.finding.findex),
           arg0=r["tail"], arg1=r["join"], arg2=r["nothing"]),
        # below zero means no join is left, so this piece is the whole of the tail
        (op("JSLt", a=r["next"], b=r["zero"]), to("LAST")),
        op("ToDyn", dst=r["boxed"], src=r["next"]),
        op("Call3", dst=r["piece"], fun=gv(reader.tailing.findex),
           arg0=r["tail"], arg1=r["zero"], arg2=r["boxed"]),
        (op("JAlways"), to("HAVE")),
        to("LAST") + ":",
        op("Mov", dst=r["piece"], src=r["tail"]),
        to("HAVE") + ":",
        op("Label"),
        (op("JNull", reg=r["piece"]), to("DONE")),
    ] + list(body) + [
        # that was the last piece when no join was left in the tail
        (op("JSLt", a=r["next"], b=r["zero"]), to("DONE")),
        # otherwise the next one starts just past the join, which is at least one further on
        op("Add", dst=r["at"], a=r["at"], b=r["next"]),
        op("Add", dst=r["at"], a=r["at"], b=r["one"]),
        (op("JAlways"), to("TOP")),
        to("DONE") + ":",
    ]


def install(bc):
    """Put the join into the game file. ✅ THE BAKE READS AN ID THROUGH THIS (`BUILD = 53`)."""
    text_object(bc, JOIN)
    return ("ID WALK: `%s` minted, and an id is read piece by piece with the game's own text "
            "helpers -- %d register(s), no list kept" % (JOIN, len(WANTED)))
