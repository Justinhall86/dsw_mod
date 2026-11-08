#!/usr/bin/env python3
"""What proves the new day: one call ahead of the game writing the day down, walking each one."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import each_day as day_word
from framework.raises.each_day import SPLICE


def check(bc):
    """The tick calls one function of ours right before the new day is written, handed that day."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a day begins")
    at, how_many = found
    tick = function_named(bc, day_word.SITE)
    guard(site_of(bc, SPLICE) == gv(tick.findex), "the new day's block went somewhere else")
    marks = call_sites(tick, function_named(bc, day_word.MARKS))
    guard(marks == [at + how_many], "the new day's block is at %d, and the day is written at %s; "
          "it belongs right ahead of that" % (at, marks))
    block = tick.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call1"
          and gv(block[0].df["arg0"]) == gv(tick.ops[marks[0]].df["arg1"]),
          "the new day's block is %s, and one call handed the day belongs there"
          % [o.op for o in block])
    bridge = next(f for f in bc.functions if gv(f.findex) == gv(block[0].df["fun"]))
    walks = [o for o in bridge.ops if o.op == "Call2"]
    guard(len(walks) == 1, "the day makes %d walk call(s), and one per faction in a loop belongs"
          % len(walks))
    return "1 call at the day's turn, f@%d walking each faction in %d instruction(s)" % (
        gv(bridge.findex), len(bridge.ops))
