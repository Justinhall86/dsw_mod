#!/usr/bin/env python3
"""What proves the kill: one call at the top of the game's own kill, reaching one walk per side."""
from tools.project import gv, guard
from tools.splice import site_of, where
from framework.raises.on_kill import KILLER, SIDES, SPLICE, VICTIM, site


def check(bc):
    """The game's kill opens with one call of ours, which calls each side's walk once."""
    fn = site(bc)
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a thing kills another")
    at, how_many = found
    guard(site_of(bc, SPLICE) == gv(fn.findex) and at == 0,
          "the kill block is at %d of f@%s, and it belongs at the top of the game's kill"
          % (at, site_of(bc, SPLICE)))
    block = fn.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call2"
          and [gv(block[0].df[a]) for a in ("arg0", "arg1")] == [KILLER, VICTIM],
          "the kill block is %s, and one call handed the killer and the one killed belongs there"
          % [o.op for o in block])
    bridge = next(f for f in bc.functions if gv(f.findex) == gv(block[0].df["fun"]))
    calls = [o for o in bridge.ops if o.op == "Call2"]
    walks = {gv(o.df["fun"]) for o in calls}
    guard(len(calls) == len(SIDES) == len(walks),
          "the kill calls %d walk(s) %d time(s), and one call per side belongs" % (
              len(walks), len(calls)))
    return "1 call at f@%d, walking %d sides" % (gv(fn.findex), len(walks))
