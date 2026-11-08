#!/usr/bin/env python3
"""What proves `framework/parsed.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import assemble, calls, function_named, lands_at, register_like
from framework.oneshot import MAP, TELL
from framework.parsed import (KEPT, MAPPED, NAMES, READ, RECORD, RECORDED, STORES, Kept,
                              emit_at_a_new_world, emit_reading, emit_ready, emit_writing,
                              places_for, slot_named, slots, WORDLY)
from framework.rowreader import reader_for


def a_function_and_places(bc):
    """A copy of a real function, the application, and TWO places of its own kind per kept thing."""
    reader = reader_for(bc)
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    fn = deepcopy(min(real, key=lambda f: len(f.ops)))
    application = reader.borrow_register(bc, fn, "row_kind")
    found = {name: reader.borrow_register(bc, fn, kind) for name, kind in KEPT}
    return fn, application, found, places_for(bc, fn, reader)


def check(bc):
    """The cases: a place per store, made once, written under the application and read back."""
    _every_thing_has_its_own_place(bc)
    fn, application, found, into = a_function_and_places(bc)
    opening, maps = emit_ready(bc, fn)
    _made_only_when_there_is_none(bc, assemble(opening), maps)
    kept = Kept(bc, fn, reader_for(bc))
    written = assemble(emit_writing(bc, fn, application, found, maps, kept))
    read = assemble(emit_reading(bc, fn, application, into, maps))
    _written_under_the_application(bc, written, application, maps, found)
    _read_back_into_the_road(bc, read, application, maps, into)
    _every_whole_number_rides_the_record(written, read, found, into)
    _a_caller_that_forgets_one_is_refused(bc, fn, application, found, maps, kept)
    _a_place_of_the_wrong_sort_is_refused(bc, fn, application, found, maps, kept)
    _nothing_is_kept_that_nothing_produces()
    _every_map_goes_at_a_new_world(bc)
    return len(opening) + len(written) + len(read)


def _every_thing_has_its_own_place(bc):
    """ONE MAP PER STORE, no two sharing a place, and every kept thing in exactly one store."""
    made = slots(bc)
    guard(len(made) == len(STORES), "%d of the %d have a place" % (len(made), len(STORES)))
    guard(len(set(made.values())) == len(STORES), "two of them share one place: %s" % made)
    guard(len({slot_named(name) for name in STORES}) == len(STORES),
          "two of them are called the same thing: %s" % (STORES,))
    guard(RECORD not in NAMES and sorted(MAPPED + RECORDED) == sorted(NAMES),
          "a kept thing is in no store, or in two")
    guard("scope" in MAPPED, "`scope` rides the record, and a restored row is marked in its map")


def _made_only_when_there_is_none(bc, ops, maps):
    """THE OPENING: every map is made, and each is left alone when it is already there."""
    making = [i for i, op in enumerate(ops) if op.op == "New"]
    guard(len(making) == len(STORES),
          "%d map(s) are made and %d are kept" % (len(making), len(STORES)))
    over = [i for i, op in enumerate(ops) if op.op == "JNotNull"]
    guard(len(over) == len(STORES),
          "%d of them are stepped over when they already exist" % len(over))
    for at, made in zip(over, making):
        guard(lands_at(ops[at], at) > made,
              "one that already exists would be made again: the step lands at %d and it is made "
              "at %d" % (lands_at(ops[at], at), made))
    guard(len(set(maps.values())) == len(STORES), "two maps came back in one place: %s" % maps)


def _is_a_number(kind):
    """The one question this file asks about a kept thing, and the parse asks the same one."""
    from framework.parsed import _is_a_number as asked
    return asked(kind)


def _written_under_the_application(bc, ops, application, maps, found):
    """AT THE BAKE: one telling per store, keyed on the application, and numbers go in wrapped."""
    telling = [i for i, op in enumerate(ops) if calls(op, function_named(bc, TELL))]
    guard(len(telling) == len(STORES), "it tells %d time(s) for %d store(s)"
          % (len(telling), len(STORES)))
    kinds = dict(KEPT)
    for name, at in zip(STORES, telling):
        guard(gv(ops[at].df["arg0"]) == maps[name], "`%s` is written into another's map" % name)
        if name == RECORD:
            guard(gv(ops[at].df["arg1"]) == application, "the record is keyed on something else")
            continue
        kind = kinds[name]
        guard(gv(ops[at].df["arg1"]) == application, "`%s` is keyed on something else" % name)
        if not _is_a_number(kind):
            # ⛔ A POINTER GOES IN AS ITSELF, never boxed and checked back out
            guard(gv(ops[at].df["arg2"]) == found[name],
                  "`%s` is a pointer and goes in as something other than itself" % name)
            continue
        wrapped = [i for i, op in enumerate(ops)
                   if op.op == "ToDyn" and gv(op.df["dst"]) == gv(ops[at].df["arg2"])]
        guard(wrapped and wrapped[0] < at, "`%s` is a number and goes into the map unwrapped"
              % name)
        guard(gv(ops[wrapped[0]].df["src"]) == found[name],
              "`%s` wraps a place other than the one it was handed" % name)


def _read_back_into_the_road(bc, ops, application, maps, into):
    """AT THE ROAD: one reading per store, out of its own map, cast into the road's own place."""
    reading = [i for i, op in enumerate(ops) if calls(op, function_named(bc, READ))]
    guard(len(reading) == len(STORES), "it reads %d time(s) for %d store(s)"
          % (len(reading), len(STORES)))
    kinds = dict(KEPT)
    for name, at in zip(STORES, reading):
        guard(gv(ops[at].df["arg0"]) == maps[name], "`%s` is read out of another's map" % name)
        if name == RECORD:
            guard(gv(ops[at].df["arg1"]) == application, "the record is keyed on something else")
            continue
        kind = kinds[name]
        guard(gv(ops[at].df["arg1"]) == application, "`%s` is keyed on something else" % name)
        # coming back, a boxed number is checked out of its box and a pointer reinterpreted
        taking = "SafeCast" if _is_a_number(kind) else "UnsafeCast"
        cast = [i for i, op in enumerate(ops)
                if op.op == taking and gv(op.df["src"]) == gv(ops[at].df["dst"])]
        guard(cast and cast[0] > at, "`%s` comes back unread, or is taken before it is read" % name)
        guard(gv(ops[cast[0]].df["dst"]) == into[name],
              "`%s` comes back into a place other than the one it was handed" % name)


def _every_whole_number_rides_the_record(written, read, found, into):
    """THE RECORD: each copied number is skipped at 0 and pushed boxed; read back, unboxed."""
    for name in RECORDED:
        skipped = [i for i, op in enumerate(written)
                   if op.op == "JEq" and found[name] in (gv(op.df["a"]), gv(op.df["b"]))]
        boxed = [i for i, op in enumerate(written)
                 if op.op == "ToDyn" and gv(op.df["src"]) == found[name]]
        # ⛔ A WORD'S NUMBER IS NEVER COPIED: it was folded onto the list as the id was read
        if name in WORDLY:
            guard(not skipped and not boxed, "`%s` is a word's number, copied at the end" % name)
            continue
        guard(skipped and boxed and skipped[0] < boxed[0],
              "`%s` is not skipped at 0 before it goes into the record" % name)
        emptied = [i for i, op in enumerate(read)
                   if op.op == "Int" and gv(op.df["dst"]) == into[name]]
        taken = [i for i, op in enumerate(read)
                 if op.op == "SafeCast" and gv(op.df["dst"]) == into[name]]
        guard(emptied and taken and emptied[0] < taken[0],
              "`%s` is not emptied, then taken out of the record" % name)


def _a_caller_that_forgets_one_is_refused(bc, fn, application, found, maps, kept):
    """A HOLE IS REFUSED, NOT STORED: forgetting one of them stops the build."""
    short = {name: found[name] for name in NAMES[1:]}
    try:
        emit_writing(bc, fn, application, short, maps, kept)
    except RuntimeError as no:
        guard("was not handed over" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "a caller left one out and it was stored as a hole")


def _a_place_of_the_wrong_sort_is_refused(bc, fn, application, found, maps, kept):
    """THE STORE CARRIES A TYPED THING, so a place of the wrong sort stops the build."""
    text = [name for name, kind in KEPT if kind == "text_kind"]
    number = next(name for name, kind in KEPT if kind == "count_kind")
    guard(text, "nothing kept is text, so this case has nothing to cross over")
    crossed = dict(found, **{text[0]: found[number]})
    try:
        emit_writing(bc, fn, application, crossed, maps, kept)
    except RuntimeError as no:
        guard("it carries a t@" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "a number was written where text is kept")


def _nothing_is_kept_that_nothing_produces():
    """EVERY KEPT THING COMES FROM THE FILE THAT WORKS IT OUT, with the kind it wants."""
    from framework.columns import FOUND as FROM_THE_COLUMNS
    from framework.effectdata import CARRIES
    from framework.triggermatch import FOUND as FROM_THE_HOOK
    from framework.pieceword import FOUND as FROM_THE_SPELLING
    from framework.scopematch import FOUND as FROM_THE_SCOPE
    from framework.ownermatch import FOUND as FROM_THE_OWNER
    from framework.ridermatch import FOUND as FROM_THE_RIDER
    from framework.narrowmatch import FOUND as FROM_THE_NARROWING
    from framework.multmatch import FOUND as FROM_THE_MULTIPLIER
    from framework.parammatch import FOUND as FROM_THE_PARAMETER
    worked_out = (tuple((name, kind) for name, kind, _ in CARRIES)
                  + FROM_THE_SPELLING + FROM_THE_SCOPE + FROM_THE_HOOK + FROM_THE_COLUMNS
                  + FROM_THE_OWNER + FROM_THE_RIDER + FROM_THE_NARROWING
                  + FROM_THE_MULTIPLIER + FROM_THE_PARAMETER)
    guard(KEPT == worked_out,
          "what is kept is %s, and the files that work it out say %s" % (KEPT, worked_out))
    guard(sorted(NAMES) == sorted(name for name, _ in worked_out),
          "the names the store keeps are not the names those files work out")


def _every_map_goes_at_a_new_world(bc):
    """THE OTHER END: all of them go when a new state begins, not one of them."""
    from framework.loadguard import clear_site
    from tools.hlcode import kind_named
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, MAP))))
    beginning.nregs.value = len(beginning.regs)
    ops = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 1)
    emptied = {gv(op.df["global"]) for op in ops if op.op == "SetGlobal"}
    guard(emptied == set(slots(bc).values()),
          "%d map(s) are emptied and %d are kept" % (len(emptied), len(STORES)))
