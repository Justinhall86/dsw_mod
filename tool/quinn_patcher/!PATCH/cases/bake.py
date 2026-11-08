#!/usr/bin/env python3
"""What proves `framework/bake.py`. It reads the SPLICED site, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import SHARED_ON, SLOTS_ON, call_sites, function_named
from tools.splice import distances_in, where
from framework import boundary
from framework.bake import SITE, SPLICE, site
from framework.oneshot import TELL
from framework.parsed import STORES, slot_named


def check(bc):
    """The cases: our block is there, everything reaches it, and the site still does its job."""
    fn = site(bc)
    spliced = where(bc, SPLICE)
    guard(spliced, "the bake never went in, so there is nothing here to read")
    at, how_many = spliced

    shared = _the_shared_bake(bc, fn.ops[at:at + how_many])
    _where_our_block_starts(bc, shared)
    _the_site_still_does_its_own_work(bc, fn, at)
    _everything_lands_inside(fn)
    _everything_lands_inside(shared)
    _what_the_block_does(bc, fn, at, at + how_many, shared)
    return how_many


def _the_shared_bake(bc, block):
    """The one shared function of ours the block calls: the bake every road's restore calls too."""
    shared = {gv(f.findex): f for f in (getattr(bc, SHARED_ON, None) or {}).values()}
    called = [shared[gv(o.df["fun"])] for o in block
              if o.op.startswith("Call") and gv(o.df.get("fun", -1)) in shared]
    guard(len(called) == 1, "the block calls %d shared function(s) of ours, and the bake is one"
          % len(called))
    return called[0]


def _where_our_block_starts(bc, shared):
    """The shared bake opens by reading a slot the parse keeps things in."""
    made = getattr(bc, SLOTS_ON, None) or {}
    wanted = [made[slot_named(name)] for name in STORES]
    first = shared.ops[0]
    guard(first.op == "GetGlobal",
          "the shared bake opens with a %s, and it opens by reading a slot" % first.op)
    guard(gv(first.df["global"]) in wanted,
          "the slot the shared bake reads first is not one the parse keeps things in")


def _the_site_still_does_its_own_work(bc, fn, at):
    """Its own question still sits straight in front of our block (ours asks it too)."""
    asked = call_sites(fn, function_named(bc, boundary.LOOKUP))
    guard(at - 1 in asked,
          "the game's own question is not in front of our block: it asks at %s" % (asked,))
    guard([o for o in fn.ops if o.op == "Ret"], "%s returns nothing" % SITE)


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            # on an instruction, never one past the last -- the same rule the splice holds
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))


def _what_the_block_does(bc, fn, at, ends, shared):
    """It asks where the sentinel sits, and the shared bake keeps what it found."""
    block = fn.ops[at:ends]
    lookup = gv(function_named(bc, boundary.LOOKUP).findex)

    def calls(ops, fun):
        return [o for o in ops if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == fun]
    # the sentinel is asked for INSIDE our block as well, because there is no `once` here
    guard(calls(block, lookup), "the block never asks the game where the sentinel sits")
    # a map per store in the shared bake, and ONE in the block: the `OnThis` mark, raised here only
    telling = gv(function_named(bc, TELL).findex)
    kept, raised = len(calls(shared.ops, telling)), len(calls(block, telling))
    guard((kept, raised) == (len(STORES), 1),
          "%d thing(s) are written to a map in the shared bake and %d beside it; the parse has "
          "%d store(s) and the `OnThis` mark is one more" % (kept, raised, len(STORES)))
