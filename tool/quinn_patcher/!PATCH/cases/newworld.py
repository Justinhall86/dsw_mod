#!/usr/bin/env python3
"""What proves `framework/newworld.py`. It reads the SPLICED sites and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import distances_in, site_of, where
from framework import board
from framework.sayonce import SAYING, COMPLAIN
from framework.loadguard import (also_ready_site, clear_site, ready_site,
                             state_on_the_game, world_slot)
from framework.newworld import THE_STATE_WAS_THERE, THROWN_AWAY, TURNED_ON, TURNED_ON_AGAIN
from framework.mark import every_slot as every_map, slot as owed_slot
from framework.parsed import slots as parsed_slots
from framework.saidrow import slot as saidrow_slot
from framework.rederive import slot as swept_slot
from framework.sayonce import SLOT as WORD_SLOT
from framework.sayonce import armed as sayonce_armed
from framework.sayonce import every_slot as every_word
from framework.userow import slot as userow_slot
from framework.alongside import PER_FILTERED, slot as alongside_slot
from framework.tray import ALREADY as TRAY_ALREADY
from framework.tray import ENTRIES as TRAY_ENTRIES
from framework.tray import slots as tray_slots
from framework.passtray import EVENTS as PASS_EVENTS, slots as pass_slots
from framework.whenbegun import slot as was_made_slot


def check(bc):
    """Both blocks are there, on the right functions, and everything they touch is a slot."""
    on, again = where(bc, TURNED_ON), where(bc, TURNED_ON_AGAIN)
    away = where(bc, THROWN_AWAY)
    guard(on, "nothing turns the world on, so no driver of ours can ever run")
    guard(again, "nothing turns the world on where a LOAD reaches, so a loaded game runs nothing")
    guard(away, "nothing throws a store away, so a second game keeps the first's")

    ready, also, beginning = ready_site(bc), also_ready_site(bc), clear_site(bc)
    guard(site_of(bc, TURNED_ON) == gv(ready.findex), "the world is turned on somewhere else")
    guard(site_of(bc, TURNED_ON_AGAIN) == gv(also.findex),
          "the load's turning-on is somewhere else")
    guard(site_of(bc, THROWN_AWAY) == gv(beginning.findex),
          "the stores are thrown away somewhere else")

    _it_turns_the_world_on(bc, ready, on)
    _it_turns_the_world_on_again(bc, also, again)
    _it_throws_every_store_away(bc, beginning, away)
    for fn in (ready, also, beginning):
        _everything_lands_inside(fn)
    return on[1] + again[1] + away[1]


def _stores_written(bc, block):
    """Every store this block fills. A gate's own latch is not a store, so the board is left out."""
    latches = set(board.every_latch(bc).values()) | set(board.emptied(bc))
    return [o for o in block if o.op == "SetGlobal" and gv(o.df["global"]) not in latches]


def _it_turns_the_world_on_again(bc, fn, again):
    """Its two words, the state taken off the game by its NAMED field, and two writes."""
    at, how_many = again
    guard(at == 0, "the load's turning-on is at %d, and it belongs at the entry" % at)
    block = fn.ops[at:at + how_many]
    for name in (TURNED_ON_AGAIN, THE_STATE_WAS_THERE):
        guard((WORD_SLOT % name) not in every_word(bc),
              "%s's word is latched, so a second reaching would say nothing" % name)
    complain = gv(function_named(bc, COMPLAIN).findex)
    said = [o for o in block if o.op == "Call1" and gv(o.df["fun"]) == complain]
    # the two words tell the two moments apart, only while something is said
    if SAYING:
        guard(len(said) == 2,
              "the load's turning-on says %d word(s); it says one on arriving and one past the "
              "check, which is what tells the two apart" % len(said))
    else:
        guard(not said, "the load's turning-on says a word while nothing is meant to be said")
    # the state is READ off the game at the field the type itself names, never at a counted one
    where_state = state_on_the_game(bc)
    reads = [o for o in block if o.op == "Field" and gv(o.df["field"]) == where_state
             and gv(o.df["obj"]) == 0]
    guard(len(reads) == 1,
          "the state is taken off the game %d time(s) at its named field" % len(reads))
    filling = _stores_written(bc, block)
    wrote = {gv(o.df["global"]) for o in filling}
    keyed_by_row = {owed_slot(bc, name) for name in every_map(bc)}
    guard(wrote == {world_slot(bc)} | keyed_by_row,
          "the load's turning-on writes %d slot(s); it fills the world, and it empties each of "
          "the %d maps keyed by the application when this world was restored rather than made"
          % (len(wrote), len(keyed_by_row)))
    fills_the_world = [o for o in filling if gv(o.df["global"]) == world_slot(bc)]
    guard(len(fills_the_world) == 1,
          "the world's slot is written %d time(s) here" % len(fills_the_world))
    guard(gv(fills_the_world[0].df["src"]) == gv(reads[0].df["dst"]),
          "the world's slot is filled from something other than the state just read")
    # and it is guarded: a null state skips the write rather than faulting the game
    guard([o for o in block if o.op == "JNull"],
          "nothing checks the state before the world is turned on there")


def _it_says_its_word(bc, block, name):
    """The moment says its word once, and nothing latches it: the question is *how many times*."""
    complain = gv(function_named(bc, COMPLAIN).findex)
    said = [o for o in block if o.op == "Call1" and gv(o.df["fun"]) == complain]
    # ⛔ WHILE NOTHING IS SAID, THE CASE IS ITS MIRROR: not said once, said not at all
    if not SAYING:
        guard(not said, "%s says a word while nothing is meant to be said" % name)
        return
    guard(len(said) == 1,
          "%s says its word %d time(s), and it belongs said exactly once" % (name, len(said)))
    guard((WORD_SLOT % name) not in every_word(bc),
          "%s's word is latched, so being reached a second time would say nothing" % name)


def _it_turns_the_world_on(bc, fn, on):
    """Its word, the state into the world's slot, and the note that this world was MADE."""
    at, how_many = on
    guard(at == 0, "the world is turned on at %d, and it belongs at the entry" % at)
    block = fn.ops[at:at + how_many]
    _it_says_its_word(bc, block, TURNED_ON)
    filling = _stores_written(bc, block)
    wrote = {gv(o.df["global"]) for o in filling}
    guard(wrote == {world_slot(bc), was_made_slot(bc)},
          "turning the world on writes %d slot(s); it fills the world and records that this "
          "world was MADE, which is the one thing a load can never say" % len(wrote))
    fills_the_world = [o for o in filling if gv(o.df["global"]) == world_slot(bc)]
    guard(len(fills_the_world) == 1,
          "the world's slot is written %d time(s) here" % len(fills_the_world))
    # place zero of that function is the state itself, which is what "the world" means here
    guard(gv(fills_the_world[0].df["src"]) == 0,
          "the world's slot is filled from something other than the state")


def _it_throws_every_store_away(bc, fn, away):
    """Every slot we keep is emptied there, and nothing else is."""
    at, how_many = away
    guard(at == 0, "the stores are thrown away at %d, and it belongs at the entry" % at)
    from cases.storewalk import _with_what_it_shares
    block = fn.ops[at:at + how_many]
    _it_says_its_word(bc, block, THROWN_AWAY)
    # ⛔ THROUGH THE CALLS OF OURS: the trays are emptied in a function of their own
    emptied = {gv(o.df["global"]) for o in _with_what_it_shares(bc, block) if o.op == "SetGlobal"}
    ours = ({world_slot(bc), userow_slot(bc), saidrow_slot(bc), swept_slot(bc),
             alongside_slot(bc, PER_FILTERED),
             was_made_slot(bc), tray_slots(bc)[TRAY_ENTRIES],
             tray_slots(bc)[TRAY_ALREADY]}
            # and the pass's own tray, position included: a position may not cross a world
            | set(pass_slots(bc).values()) | set(tray_slots(bc, PASS_EVENTS).values())
            # every map keyed by the application: what each is owed, and where each is drawn
            | {owed_slot(bc, name) for name in every_map(bc)}
            | set(parsed_slots(bc).values())
            # and one per word a road says once, so a second game says the path again
            | set(sayonce_armed())
            # and the board's own latches; a word's STATE is not among them and must not be
            | set(board.armed()))
    guard(not ({board.slot(bc, board.STATE, w) for w in board.words()} & emptied),
          "a word's own on-or-off is emptied at a new world, so `mod say` forgets what was typed")
    named = {at: name for name, at in every_word(bc).items()}
    named.update({at: name for name, at in board.every_latch(bc).items()})
    guard(not (ours - emptied), "%d slot(s) of ours are never emptied: %s" % (
        len(ours - emptied),
        "; ".join(sorted(named.get(at, str(at)) for at in ours - emptied)[:4])))
    guard(not (emptied - ours),
          "%d thing(s) other than a slot of ours are emptied there" % len(emptied - ours))
    # every one is emptied by being handed nothing first, never by a value written into the code
    guard(len([o for o in block if o.op == "Null"]) >= 1,
          "nothing in the block is emptied by being handed nothing")


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))
