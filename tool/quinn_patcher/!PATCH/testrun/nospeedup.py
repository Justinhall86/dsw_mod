#!/usr/bin/env python3
"""Stop the game's own switch forcing every run to four times speed."""
from tools.project import gv, guard
from tools.hlcode import call_sites, calls, function_named, make_nop
# the switch, and the one way in to the base speed, each named where it was already named
from testrun.cmdsfile import FROM as SWITCH
from testrun.loadspeed import SETS


def _made_by(fn):
    """Every function this one makes a closure of."""
    out = []
    for o in fn.ops or []:
        at = o.df.get("fun")
        if at is not None and o.op.endswith("Closure"):
            out.append(gv(at))
    return out


def install(bc):
    """Take the base-speed write out of the one callback the switch hands every game."""
    switch, sets = function_named(bc, SWITCH), function_named(bc, SETS)
    made = set(_made_by(switch))
    handed = [fn for fn in bc.functions
              if gv(fn.findex) in made and any(calls(o, sets) for o in fn.ops or [])]
    guard(len(handed) == 1,
          "the switch hands %d callback(s) that write the base speed, and this expects one"
          % len(handed))
    sites = call_sites(handed[0], sets)
    guard(len(sites) == 1,
          "that callback writes the base speed %d time(s), and this expects one" % len(sites))
    make_nop(handed[0].ops[sites[0]])
    return ("SPEED: the switch makes %d callback(s); the one that writes the base speed writes it "
            "once, at op %d -- stopped, so the run keeps the speed it was given"
            % (len(made), sites[0]))
