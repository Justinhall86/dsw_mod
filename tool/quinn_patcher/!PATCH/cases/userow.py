#!/usr/bin/env python3
"""What proves `framework/userow.py`. It reads the SPLICED site and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import distances_in, site_of, where
from framework.userow import MAKES_ONE, SITES, SPLICE, slot


def check(bc):
    """A block past the call in EVERY filing place, each writing our place on what it filed."""
    from framework import widen
    there, _h = widen.on_the_filed_thing(bc)
    went = 0
    for name in SITES:
        fn = function_named(bc, name)
        named = "%s at %s" % (SPLICE, name)
        spliced = where(bc, named)
        guard(spliced, "the authored row never went into %s" % name)
        at, how_many = spliced
        guard(site_of(bc, named) == gv(fn.findex),
              "the authored row for %s went into some other function" % name)
        _it_sits_past_the_call_and_its_test(bc, fn, at)
        block = fn.ops[at:at + how_many]
        wrote = [o for o in block if o.op == "SetField" and gv(o.df["field"]) == there]
        guard(len(wrote) == 1,
              "the block in %s writes our place %d time(s)" % (name, len(wrote)))
        application = gv(fn.ops[at - 1].df["reg"])
        guard(gv(wrote[0].df["obj"]) == application,
              "the block in %s writes onto something other than what the game just filed" % name)
        # ⛔ AND IT TAKES WHAT IT WRITES OUT OF A LIST, never off the registration
        guard([o for o in block if o.op == "GetArray"],
              "the block in %s takes what it writes from something other than a list" % name)
        _everything_lands_inside(fn)
        went += how_many
    guard(slot(bc) is not None, "there is no place for a row's columns to wait in")
    return went


def _it_sits_past_the_call_and_its_test(bc, fn, at):
    """Two instructions of the game's own stand in front of ours: the call, then its test."""
    makes = gv(function_named(bc, MAKES_ONE).findex)
    call, test = fn.ops[at - 2], fn.ops[at - 1]
    guard(call.op.startswith("Call") and gv(call.df.get("fun", -1)) == makes,
          "the instruction two before our block is a %s, not the call that makes one" % call.op)
    guard(test.op == "JNull" and gv(test.df["reg"]) == gv(call.df["dst"]),
          "the game's own test of what it made is not in front of our block")


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))
