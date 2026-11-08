#!/usr/bin/env python3
"""What proves the treaty ending: one call past each drain, both reaching one shared function."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import on_treaty_end as ending_word
from framework.raises.on_treaty_end import DEFEAT, SPLICE, the_daily


def _one(bc, name, site, what):
    """The one call `name` spliced into `site`, right past its drain and the test of it."""
    found = where(bc, name)
    guard(found, "nothing is spliced where %s" % what)
    at, how_many = found
    guard(site_of(bc, name) == gv(site.findex), "the %s block went somewhere else" % what)
    drains = call_sites(site, function_named(bc, ending_word.DRAINS))
    guard(drains and drains[0] + 2 == at, "the %s block is at %d, and the drain at %s; it "
          "belongs right past the drain's test" % (what, at, drains))
    block = site.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call2" and gv(block[0].df["arg1"]) == 1,
          "the %s block is %s, and one call handed the record belongs there" % (
              what, [o.op for o in block]))
    return gv(block[0].df["fun"])


def check(bc):
    """Both drains call one function of ours, which walks once per side."""
    drained = _one(bc, SPLICE, function_named(bc, ending_word.SITE), "a treaty ends")
    dropped = _one(bc, DEFEAT, the_daily(bc), "a defeated faction's treaty drops")
    guard(drained == dropped, "the two drains call f@%d and f@%d, and one is shared"
          % (drained, dropped))
    both = next(f for f in bc.functions if gv(f.findex) == drained)
    walks = {gv(o.df["fun"]) for o in both.ops if o.op == "CallN"}
    calls = [o for o in both.ops if o.op == "CallN"]
    guard(len(calls) == 2 and len(walks) == 1,
          "the sides make %d call(s) to %d walk(s), and two calls to one belong" % (
              len(calls), len(walks)))
    return "2 drains calling f@%d, walking 2 sides in %d instruction(s)" % (drained, len(both.ops))
