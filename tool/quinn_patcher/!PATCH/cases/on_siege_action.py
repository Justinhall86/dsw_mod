#!/usr/bin/env python3
"""What proves `framework/raises/on_siege_action.py`: it reads the SPLICED site, changes nothing."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import site_of, where
from framework.triggers import on_siege_action as siege_word
from framework.raises.on_siege_action import SPLICE, the_action_finishing, what_is_in_hand


def check(bc):
    """The block is at the site the trigger's own file names, and reads only what is there."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a siege action finishes")
    at, how_many = found
    site = function_named(bc, siege_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the siege block went somewhere other than the site the trigger names")
    guard(at == 0, "the siege block is at %d, and it belongs at the entry" % at)
    block = site.ops[at:at + how_many]
    _it_reads_the_two_things_by_name(bc, site, block)
    _it_writes_nothing(block)
    return "%d instruction(s) where a siege action finishes" % how_many


def _it_reads_the_two_things_by_name(bc, site, block):
    """Everything it reads comes off the component at fields ITS OWN TYPE names."""
    faction, thing = what_is_in_hand(bc)
    action = the_action_finishing(bc)[0]
    wanted = {"the besieging faction": faction, "the besieged thing": thing,
              "the action finishing": action}
    read = {gv(o.df["field"]) for o in block if o.op == "GetThis"}
    for what, at in wanted.items():
        guard(at in read, "the siege block never reads %s" % what)
    spare = read - set(wanted.values())
    guard(not spare, "the siege block reads %d field(s) besides those three" % len(spare))


def _it_writes_nothing(block):
    """This step changes nothing OF THE GAME'S; it writes only into what a `New` here made."""
    ours = set()
    for op in block:
        if op.op == "New":
            ours.add(gv(op.df["dst"]))
        if op.op in ("SetField", "SetArray"):
            whose = gv(op.df["obj" if op.op == "SetField" else "array"])
            guard(whose in ours,
                  "the siege block writes with a %s into place %d, which it did not make -- this "
                  "step changes nothing of the game's" % (op.op, whose))
