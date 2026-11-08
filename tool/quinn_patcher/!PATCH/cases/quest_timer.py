#!/usr/bin/env python3
"""What proves the quest timers: a call past every limit read, one on the calendar, one switch."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import where
from framework.acts.start_quest import skip_slot
from framework.questtimer import (AVAILABLE, CALENDAR, DURATION_READS, IN_USE, READ_SITES,
                                  SPLICES, VALID, duration_reads, in_use_slot, lift_slot)


def _switched_first(bc, fun):
    """Does our function `fun` answer at once, its first step the switch a row raises?"""
    found = [f for f in bc.functions if gv(f.findex) == fun]
    first = found[0].ops[:2] if found else []
    slots = {in_use_slot(bc, word)[0] for word in IN_USE}
    return (len(first) == 2 and first[0].op == "GetGlobal" and gv(first[0].df["global"]) in slots
            and first[1].op == "JFalse")


def _steps(bc, name, slot, asks):
    """Our steps in one game function: each call into a switched one of ours, each test's."""
    fn = function_named(bc, name)
    calls = sum(1 for o in fn.ops if o.op == "Call2" and _switched_first(bc, gv(o.df["fun"])))
    return calls + 2 * sum(1 for o in fn.ops if (o.op == "GetGlobal" and gv(o.df["global"]) == slot)
                           or (o.op == "Call0" and gv(o.df["fun"]) in asks))


def check(bc):
    """Each limit read is followed by our call into its own register; the calendar ends in ours."""
    reads = 0
    for name in DURATION_READS:
        fn = function_named(bc, name)
        for i in duration_reads(bc, fn):
            after = fn.ops[i + 1]
            guard(after.op == "Call2" and gv(after.df["dst"]) == gv(fn.ops[i].df["dst"])
                  and gv(after.df["arg1"]) == gv(fn.ops[i].df["dst"]),
                  "%s reads a quest's limit at %d and does not hand it to ours" % (name, i))
            reads += 1
    calendar = function_named(bc, CALENDAR)
    guard(calendar.ops[-2].op == "Call2"
          and gv(calendar.ops[-2].df["dst"]) == gv(calendar.ops[-1].df["ret"]),
          "%s answers without asking ours" % CALENDAR)
    for what in SPLICES[1:]:
        guard(where(bc, what), "nothing is spliced as `%s`" % what)
    slot, _ = lift_slot(bc)
    switch = function_named(bc, AVAILABLE)
    guard(any(o.op == "GetGlobal" and gv(o.df["global"]) == slot for o in switch.ops),
          "%s never reads our weight switch" % AVAILABLE)
    skipped, _ = skip_slot(bc)
    asks = {gv(f.findex) for f in bc.functions if f.ops and f.ops[0].op == "GetGlobal"
            and gv(f.ops[0].df["global"]) == skipped}
    guard(any(o.op == "Call0" and gv(o.df["fun"]) in asks for o in function_named(bc, VALID).ops),
          "%s never asks ours about our conditions switch" % VALID)
    for word, spots in READ_SITES.items():
        for name, steps in spots.items():
            got = _steps(bc, name, slot, asks)
            guard(got == steps, "`%s` claims %d step(s) in %s, and %d of ours sit there"
                  % (word, steps, name, got))
    return ("%d limit read(s) through ours, the calendar through ours, weight 0 and conditions "
            "behind a switch, "
            "each call ours answering at once while no row spells its word" % reads)
