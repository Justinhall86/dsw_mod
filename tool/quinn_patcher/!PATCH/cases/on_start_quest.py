#!/usr/bin/env python3
"""What proves the quest raise: one call at the SPLICED site, a walk that changes nothing."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import on_start_quest as quest_word
from framework.raises.on_start_quest import SPLICE, owner_at
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """One call right before the quest is made; the walk it calls reads only the owner."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a quest is started")
    at, how_many = found
    site = function_named(bc, quest_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the quest block went somewhere other than the site the trigger names")
    after = call_sites(site, function_named(bc, quest_word.BEFORE))
    guard(after == [at + how_many], "the quest block ends at %d, and the quest is made at %s; "
          "it belongs right before" % (at + how_many, after))
    block = site.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call2",
          "the quest block is %s, and one call to the walk belongs there" % [o.op for o in block])
    walk = next(f for f in bc.functions if gv(f.findex) == gv(block[0].df["fun"]))
    read = {gv(o.df["field"]) for o in walk.ops if o.op == "GetThis"}
    guard(read == {owner_at(bc)[0]}, "the quest walk reads fields %s of the quests, and only "
          "their owner belongs" % sorted(read))
    _it_writes_nothing(walk.ops)
    return "1 call where a quest is started, to a walk of %d instruction(s)" % len(walk.ops)
