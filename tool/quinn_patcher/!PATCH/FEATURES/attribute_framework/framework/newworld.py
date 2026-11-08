#!/usr/bin/env python3
"""The only places anything of ours is turned on (two) or thrown away (a new state)."""
from tools.project import gv, guard
from tools.hlcode import argument_kind, assemble, kind_named, template, written
from tools.splice import insert
from framework import alongside, board, mark, parsed, passtray, rederive, saidrow, sayonce, tray
from framework import traps, userow
from framework import whenbegun
from framework.parsed import a_new_place
from framework.sayonce import COMPLAIN
from framework.loadguard import (ALSO_READY_AT, READY_AT, CLEARED_AT, also_ready_site,
                             clear_site, emit_empty, emit_fill, make_world_slot,
                             ready_site, state_on_the_game, world_slot)
from framework.oneshot import MAP

# what each splice is called, which is what its own record answers to
TURNED_ON = "turning the world on"
TURNED_ON_AGAIN = "turning the world on where a load reaches too"
THROWN_AWAY = "a new world begins"
# said only past the null check, so the log tells "reached here" from "and the state was there"
THE_STATE_WAS_THERE = "the state was in hand there"


def _a_place(bc, fn, kind):
    """One more place on `fn`, of a kind the game itself declares (`parsed.a_new_place`)."""
    return a_new_place(bc, fn, kind)


def emit_turning_on(bc, fn):
    """At the game's own moment of readiness, the world's state goes into the slot."""
    slot = world_slot(bc)
    guard(slot is not None, "there is no slot for the world yet -- the load guard goes first")
    # what goes in is place ZERO of that function, so place zero has to BE what the slot holds
    holds = gv(bc.global_types[slot])
    guard(gv(list(ready_site(bc).regs)[0]) == holds,
          "place zero of %s is a t@%s and the world's slot holds a t@%s"
          % (READY_AT, gv(list(ready_site(bc).regs)[0]), holds))
    # the word goes first, so it is said even if the filling is ever made conditional
    word = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    return (sayonce.emit_word_always(bc, fn, TURNED_ON) + emit_fill(bc, slot)
            # ONLY a built world reaches here, so this is where that fact is recorded
            + whenbegun.emit_it_was_made(bc, word))


def emit_turning_on_again(bc, fn):
    """At the game's ready step: the state comes off the game and, if there, fills the slot."""
    where_state = state_on_the_game(bc)
    slot = world_slot(bc)
    holds = _a_place(bc, fn, gv(bc.global_types[slot]))
    maps = _a_place(bc, fn, kind_named(bc, MAP))
    past = "past filling the world here"

    def op(what, **operands):
        return written(template(bc, what), **operands)
    # the jumps are written against named places, so `assemble` counts the distances, never us
    return assemble(sayonce.emit_word_always(bc, fn, TURNED_ON_AGAIN)
                    + [op("Field", dst=holds, obj=0, field=where_state),
                       (op("JNull", reg=holds), past)]
                    + sayonce.emit_word_always(bc, fn, THE_STATE_WAS_THERE)
                    + [op("SetGlobal", **{"global": slot, "src": holds}),
                       past + ":",
                       op("Label")]
                    # BOTH kinds of world reach here: a restored one drops what its restore raised
                    + whenbegun.emit_forget_what_a_restore_raised(bc, fn, maps))


def emit_throwing_away(bc, fn):
    """At the start of a new state: the world, then every store keyed to one, each its own way."""
    said = sayonce.emit_word_always(bc, fn, THROWN_AWAY)
    world = _a_place(bc, fn, gv(bc.global_types[world_slot(bc)]))
    maps = _a_place(bc, fn, kind_named(bc, MAP))
    # the words are text, not worlds and not maps, so their emptying gets a place of its own kind
    words = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    collected = _a_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    return (said
            + emit_empty(bc, fn, world_slot(bc), world)
            + mark.emit_at_a_new_world(bc, fn, maps)
            + parsed.emit_at_a_new_world(bc, fn, maps)
            # a LIST rather than a map: what waits there is one row's columns, not a store
            + userow.emit_at_a_new_world(bc, fn, collected)
            # the per-filtered-list line-ups; ⛔ never the STORED list's, filled once at the bake
            + alongside.emit_at_a_new_world(bc, fn, maps)
            + saidrow.emit_at_a_new_world(bc, fn, maps)
            # and which holders the road has swept, which is per world like everything else
            + rederive.emit_at_a_new_world(bc, fn, maps)
            # and every word the road says once is armed again, so a second game says the path
            + sayonce.emit_at_a_new_world(bc, fn, words)
            # and every board latch, so a word set to speak once a game speaks in the next one too
            + board.emit_at_a_new_world(bc, fn)
            + whenbegun.emit_at_a_new_world(bc, fn, words)
            # ⛔ BOTH TRAYS IN A FUNCTION OF OURS: the game's own start makes the one call
            + passtray.calling(bc, fn, "the trays emptied at a new world", world,
                               lambda made: _trays_emptied(bc, made)))


def _trays_emptied(bc, made):
    """Every tray's three places handed nothing, the row's and both of the pass's."""
    collected = _a_place(bc, made, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    forgotten = _a_place(bc, made, kind_named(bc, tray.ONE_PER_RESOURCE))
    # and the pass's trays keep a position, which the row's never does between events
    nowhere = _a_place(bc, made, tray.recipe(bc)["of"]["where"])
    return (tray.emit_at_a_new_world(bc, made, collected, forgotten)
            + passtray.emit_at_a_new_world(bc, made, collected, forgotten, nowhere))


def install(bc):
    """Splice both, each at its own function's entry -- the two moments, and nothing between."""
    make_world_slot(bc)
    whenbegun.make_slot(bc)
    # turning on and throwing away are opposites, so they may never be the same function
    guard(gv(ready_site(bc).findex) != gv(clear_site(bc).findex),
          "%s and %s are the same function, and one would undo the other" % (READY_AT, CLEARED_AT))
    ready = ready_site(bc)
    on = insert(bc, ready, 0, emit_turning_on(bc, ready), TURNED_ON,
                traps.AT_A_MOMENT)
    also = also_ready_site(bc)
    # the two turnings-on are different places doing one thing, so neither may be the other
    guard(gv(also.findex) != gv(ready.findex),
          "%s and %s are the same function" % (ALSO_READY_AT, READY_AT))
    again = insert(bc, also, 0, emit_turning_on_again(bc, also), TURNED_ON_AGAIN,
                   traps.AT_A_MOMENT)
    beginning = clear_site(bc)
    away = insert(bc, beginning, 0, emit_throwing_away(bc, beginning), THROWN_AWAY,
                  traps.AT_A_MOMENT)
    return ("NEW WORLD: %d instruction(s) at %s turn the world on, %d more at %s -- "
            "the one place a LOAD reaches too -- and %d at %s throw every store away"
            % (on, READY_AT, again, ALSO_READY_AT, away, CLEARED_AT))
