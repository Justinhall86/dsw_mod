#!/usr/bin/env python3
"""What proves `framework/loadguard.py`. Nothing here goes into the game -- including no slot."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import register_like
from framework.loadguard import (READY_ENTITY, clear_site, emit_empty, emit_fill, ready_site,
                             world_slot)


def a_copy_with_a_place(bc, fn, kind):
    """A copy of a function with one more place of that kind, so nothing real is changed."""
    copy = deepcopy(fn)
    copy.regs.append(deepcopy(register_like(bc, kind)))
    copy.nregs.value = len(copy.regs)
    return copy, len(copy.regs) - 1


def check(bc):
    """The cases: the slot is the world's own kind, filled once and emptied at a new world."""
    places = len(bc.global_types)
    slot = world_slot(bc)
    guard(slot is not None, "the world has no slot: the feature never ran")
    world_kind = gv(bc.global_types[slot])

    # the slot is the kind the game's own readiness moment is about, taken from the game
    guard(world_kind == gv(list(ready_site(bc).regs)[0]),
          "the world's slot is t@%s and the game's own state is t@%s"
          % (world_kind, gv(list(ready_site(bc).regs)[0])))

    # filling it is one instruction, and it publishes the state the moment is about
    filling = emit_fill(bc, slot)
    guard([op.op for op in filling] == ["SetGlobal"],
          "the world is marked ready by %s" % [op.op for op in filling])
    guard(gv(filling[0].df["global"]) == slot and gv(filling[0].df["src"]) == 0,
          "the mark writes the wrong thing into the wrong place")

    # AND A NEW WORLD EMPTIES IT FIRST -- otherwise the slot means "a world was real once"
    beginning, empty = a_copy_with_a_place(bc, clear_site(bc), world_kind)
    clearing = emit_empty(bc, beginning, slot, empty)
    guard([op.op for op in clearing] == ["Null", "SetGlobal"],
          "a new world empties the slot with %s" % [op.op for op in clearing])
    guard(gv(clearing[1].df["global"]) == slot and gv(clearing[1].df["src"]) == empty,
          "the emptying writes something else into the slot")

    # and none of this added a place to the game file
    guard(len(bc.global_types) == places,
          "the cases added %d place(s)" % (len(bc.global_types) - places))
    return "%s, emptied at every new world" % READY_ENTITY
