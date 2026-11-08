#!/usr/bin/env python3
"""What proves `OnEliminate`: both its events weigh a row against its number, and nothing else."""
from tools.project import gv, guard
from tools.hlcode import number
from tools.splice import site_of, where
from framework import triggermatch
from framework.triggers import on_eliminate as eliminate_word
from framework.raises import on_assassinate, on_destroy_faction, on_siege_action

RAISERS = (on_assassinate, on_destroy_faction)


def _asks_for(bc, raiser, ptr):
    """How many times the raiser's block loads the number it is asked about."""
    at, how_many = where(bc, raiser.SPLICE)
    fn = next(f for f in bc.functions if gv(f.findex) == site_of(bc, raiser.SPLICE))
    return sum(1 for o in fn.ops[at:at + how_many]
               if o.op == "Int" and gv(o.df["ptr"]) == ptr)


def check(bc):
    """Each of its two events names it in `ALSO`; the siege does not."""
    ptr = number(bc, triggermatch.number_of(eliminate_word.WORD))
    for raiser in RAISERS:
        guard(eliminate_word in getattr(raiser, "ALSO", ()),
              "%s does not raise %s" % (raiser.SPLICE, eliminate_word.WORD))
        guard(_asks_for(bc, raiser, ptr) >= 1,
              "%s never weighs a row against %s's number" % (raiser.SPLICE, eliminate_word.WORD))
    guard(eliminate_word not in getattr(on_siege_action, "ALSO", ()),
          "a siege action raises %s" % eliminate_word.WORD)
    return "raised where %s" % " and where ".join(r.SPLICE for r in RAISERS)
