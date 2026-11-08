#!/usr/bin/env python3
"""Nothing of ours runs before the world is real: a slot emptied at a new state, filled at ready."""
from crashlink import disasm

from tools.project import gv, guard
from copy import deepcopy

from tools.hlcode import (SLOTS_ON, field_by_name, function_named, kind_named,
                          register_like, slot_global, template, written)

# where the game makes its own state ready -- the moment after which the world is real
READY_AT = "logic.state.State.applyAttributesOnStart"
# what that function is about, checked by name the way a scope's site is
READY_ENTITY = "logic.state.State"
# where a NEW state begins, before its world is generated -- the slot is emptied here
CLEARED_AT = "logic.state.State.init"
# THE SECOND readiness, and the only one a load reaches. Its own kind is checked the same way
ALSO_READY_AT = "Game.onReady"
ALSO_READY_ENTITY = "Game"
# where the state hangs off the game -- BY NAME: the two shipped loaders number it differently
THE_STATE_ON = "state"
# what our slot for it is called
READY_SLOT = "the world is real"


def a_function_about(bc, name, entity):
    """The named function, checked to be ABOUT `entity` -- a name alone is never enough."""
    fn = function_named(bc, name)
    found = disasm.type_name(bc, list(fn.regs)[0].resolve(bc))
    guard(found == entity, "%s is about %s rather than %s" % (name, found, entity))
    return fn


def ready_site(bc):
    """The game's own moment of readiness: after this, the world is real."""
    return a_function_about(bc, READY_AT, READY_ENTITY)


def also_ready_site(bc):
    """The game's own ready step -- the one place a NEW game and a LOAD both reach."""
    return a_function_about(bc, ALSO_READY_AT, ALSO_READY_ENTITY)


def state_on_the_game(bc):
    """WHICH field of the game holds the state, found by name; its kind is checked, not returned."""
    at, holds = field_by_name(bc, kind_named(bc, ALSO_READY_ENTITY), THE_STATE_ON, "the game")
    slot = world_slot(bc)
    guard(slot is not None, "there is no slot for the world yet -- the load guard goes first")
    guard(holds == gv(bc.global_types[slot]),
          "the game's `%s` is a t@%s and the world's slot holds t@%s"
          % (THE_STATE_ON, holds, gv(bc.global_types[slot])))
    return at


def clear_site(bc):
    """Where a new state begins: before this has run again, no world of ours is real."""
    return a_function_about(bc, CLEARED_AT, READY_ENTITY)


def make_world_slot(bc):
    """MAKE our own place for the world's state, empty until the game fills it."""
    return slot_global(bc, READY_SLOT, gv(list(ready_site(bc).regs)[0]))


def world_slot(bc):
    """READ the world's slot: the one this file already has, or nothing. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(READY_SLOT)


def emit_fill(bc, slot):
    """At the game's own moment of readiness, the world's state goes into the slot."""
    return [written(template(bc, "SetGlobal"), **{"global": slot, "src": 0})]


def emit_empty(bc, fn, slot, into):
    """Empty the slot at a new state; `into` is CHECKED, since place zero there is the state."""
    place_for(bc, fn, slot, into, "the emptying")
    return [written(template(bc, "Null"), dst=into),
            written(template(bc, "SetGlobal"), **{"global": slot, "src": into})]


def place_for(bc, fn, slot, into, what):
    """Refuse a place not on `fn`, or not the slot's kind: the caller allocates, this checks."""
    places = list(fn.regs)
    guard(into < len(places),
          "%s was given place %d, and there are %d" % (what, into, len(places)))
    guard(gv(places[into]) == gv(bc.global_types[slot]),
          "%s was given a place of kind t@%s, and that slot holds t@%s"
          % (what, gv(places[into]), gv(bc.global_types[slot])))
    return into


def emit_wait(bc, fn, slot, into, skip_to):
    """What every driver opens with: read the slot into `into`, and skip everything if empty."""
    place_for(bc, fn, slot, into, "the guard")
    return [written(template(bc, "GetGlobal"), **{"dst": into, "global": slot}),
            (written(template(bc, "JNull"), reg=into), skip_to)]


def install(bc):
    """Make the world's slot, and produce the two blocks that fill and empty it. None is spliced."""
    slot = make_world_slot(bc)
    filling = emit_fill(bc, slot)
    # written onto a COPY with a place made on it: a block that is not spliced changes nothing
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, gv(bc.global_types[slot]))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_empty(bc, beginning, slot, len(beginning.regs) - 1)
    return ("LOAD GUARD: `%s` is a slot of its own -- %d instruction fills it at the game's own "
            "moment, %d empty it when a new world begins, and every driver waits on it"
            % (READY_SLOT, len(filling), len(emptying)))
