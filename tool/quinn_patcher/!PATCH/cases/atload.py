#!/usr/bin/env python3
"""What proves `framework/atload.py`, dormant with it; reads the SPLICED site, changes nothing."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import distances_in, site_of, where
from framework import boundary
from framework.sayonce import SAYING
from framework.atload import COMPLAIN, REGISTRAR, ROUTES, SITE, SPLICE, routes, site
from framework.rowreader import reader_for


def check(bc):
    """The block is there, it reads a raw row, and the site still runs all three routes."""
    fn = site(bc)
    spliced = where(bc, SPLICE)
    guard(spliced, "the load-time count never went in, so there is nothing here to read")
    at, how_many = spliced
    guard(site_of(bc, SPLICE) == gv(fn.findex),
          "the load-time count went into some other function than %s" % SITE)

    _the_route_is_still_whole(bc, fn)
    _it_sits_in_front_of_the_narrowing(bc, fn, at, how_many)
    _what_the_block_does(bc, fn, at, at + how_many)
    _everything_lands_inside(fn)
    return how_many


def _the_route_is_still_whole(bc, fn):
    """All three routes still hand their row to the registrar, and the site still returns."""
    guard(len(routes(bc, fn)) == ROUTES,
          "%s does not hand a row to %s %d times" % (SITE, REGISTRAR, ROUTES))
    guard([o for o in fn.ops if o.op == "Ret"], "%s returns nothing" % SITE)


def _it_sits_in_front_of_the_narrowing(bc, fn, at, how_many):
    """Our block opens by asking the boundary, and the displaced narrowing still follows it."""
    first = fn.ops[at]
    guard(first.op == "GetGlobal" and gv(first.df["global"]) == boundary.minted(bc),
          "the block opens with a %s, and it opens by reading the sentinel" % first.op)
    after = fn.ops[at + how_many]
    guard(after.op == "ToVirtual",
          "the instruction the block was put in front of is a %s, not the route's own narrowing"
          % after.op)
    # and the row our block reads is the one that narrowing is about to narrow
    raw = gv(after.df["src"])
    guard(gv(list(fn.regs)[raw]) == reader_for(bc).row_kind,
          "the row in front of the narrowing is not the untyped kind a column can be read off")
    # EVERY column read in the block is read off the RAW row; a narrowed copy answers nothing
    reading = [o for o in fn.ops[at:at + how_many]
               if o.op == "Call2" and gv(o.df["fun"]) == gv(reader_for(bc).reading.findex)]
    guard(len(reading) >= 2,
          "the block reads a column %d time(s): the row's own id, and one per column it finds"
          % len(reading))
    off = {gv(o.df["arg0"]) for o in reading}
    guard(off == {raw},
          "the block reads a column off %d place(s), and only the raw row answers" % len(off))


def _gate_part(bc, block, complain):
    """The block up to its first spoken line: everything that decides whether this row is ours."""
    for i, o in enumerate(block):
        if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == complain:
            return block[:i]
    guard(False, "the block never says anything, so there is no gate in front of anything")


def _what_the_block_does(bc, fn, at, ends):
    """The gate asks the boundary once and compares once; then it says what it found."""
    block = fn.ops[at:ends]
    lookup = gv(function_named(bc, boundary.LOOKUP).findex)
    complain = gv(function_named(bc, COMPLAIN).findex)
    gate = _gate_part(bc, block, complain)

    asked = [o for o in gate if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == lookup]
    guard(len(asked) == 2,
          "the gate asks the id lookup %d time(s): once for the sentinel, once for the row"
          % len(asked))
    guard(len([o for o in gate if o.op == "JSGte"]) == 1,
          "the gate compares against the boundary more than once, or not at all")
    # nothing the GATE decides on may be a number written into the code -- it is asked for
    guard(not [o for o in gate if o.op in boundary.CONSTANTS],
          "the gate loads a constant, and every number it decides on is asked for at run time")
    # its two words are kept apart, never one place working only by instruction order
    read = [gv(o.df["dst"]) for o in gate if o.op == "GetGlobal"]
    guard(len(read) == len(set(read)),
          "the gate reads %d word(s) into %d place(s), so one of them is written over"
          % (len(read), len(set(read))))

    said = [o for o in block if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == complain]
    # ⛔ WHILE NOTHING IS SAID, THE ONE SAYING HERE is the refusal when our word is not in the file
    if not SAYING:
        guard(len(said) == 1,
              "the block says %d thing(s) while nothing is meant to be said; only the refusal "
              "when our own word is missing belongs here" % len(said))
        return
    guard(len(said) >= 3,
          "the block says %d thing(s): the tag, the row's id, and one per column it finds"
          % len(said))


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))
