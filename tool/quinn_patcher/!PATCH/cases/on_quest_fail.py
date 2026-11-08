#!/usr/bin/env python3
"""What proves the failure raise: one call right past the running list's own test."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import where
from framework.triggers import on_quest_fail as fail_word
from framework.raises.on_quest_fail import SPLICE, owner_at


def check(bc):
    """One call where an ended quest has just left the list; the walk reads only the owner."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a quest leaves the running list")
    at, how_many = found
    site = function_named(bc, fail_word.SITE)
    taken = call_sites(site, function_named(bc, fail_word.AFTER))
    guard(taken == [at - 2], "the failure block sits at %d and the list is asked at %s; it "
          "belongs right past the test of that answer" % (at, taken))
    guard(site.ops[at - 1].op == "JFalse", "the failure block is not right past a test")
    block = site.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call2",
          "the failure block is %s, and one call to the walk belongs there" % [o.op for o in block])
    walk = next(f for f in bc.functions if gv(f.findex) == gv(block[0].df["fun"]))
    read = {gv(o.df["field"]) for o in walk.ops if o.op == "GetThis"}
    guard(read == {owner_at(bc)[0]}, "the failure walk reads fields %s of the quests, and "
          "only their owner belongs" % sorted(read))
    return "1 call where an unfinished quest leaves the list, to a walk of %d instruction(s)" % (
        len(walk.ops))
