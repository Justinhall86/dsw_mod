#!/usr/bin/env python3
"""Say one word the first time a place is reached, and never again that game: the log is a PATH."""
from tools.project import gv
from tools.hlcode import (SLOTS_ON, argument_kind, assemble, function_named, returns_type,
                          slot_global, template, text_object, written)
from framework.loadguard import emit_empty
from framework.parsed import a_new_place

# the game's own complaint channel, which is the only way anything of ours reaches the log
COMPLAIN = "$HAttributes.logError"
# what each word's slot is called, and the prefix that picks ours out of the game's complaints
SLOT = "said already: %s"
PREFIX = "SPINE at "
# what every line of ours opens with however it was minted, so one name never takes two prefixes
MARK = "SPINE"

# ⛔ NOTHING IS SAID by default; the switch board holds the vocabulary, shout and bypass switches
def _board(name):
    """One switch, read as this file loads. `standalone/onoff.py` holds every one of them."""
    from standalone import onoff
    return onoff.on(name)


SAYING = _board("sayingwords")

# the VALUE a stage shouts (the resource paid): the bench's only way to know a row still pays
SAYING_THE_VALUE = _board("stageshout")

# what `even_when_quiet=True` is worth; off, a word asking for the bypass gets nothing
LOUD = _board("loudprints")

# the three doors by the names the board carries them under, so a gate can be keyed on one
VOCABULARY, VALUE, BYPASS = "sayingwords", "stageshout", "loudprints"
# every word slot the world's emptying was built to arm again; one made after it is not in here
_ARMED = []


def _gated(bc, fn, ops, door, word=None):
    """Those words behind the door they ride, or behind the READING that named them instead."""
    from framework import board
    return assemble(board.gated(bc, fn, ops, word=word or door))


def _wanted(fallback, word=None):
    """Do these words go in the file at all? A reading that named itself answers for itself."""
    from framework import board
    named = word or board.current()
    return board.in_this_build(named) if named else fallback


def word_for(name):
    """What a place called `name` says in the log; already marked, it takes one prefix not two."""
    plain = name[len(MARK):].lstrip() if name.startswith(MARK) else name
    return PREFIX + plain


def slot_for(bc, name):
    """MAKE the slot behind one word. It holds nothing until the word has been said."""
    return slot_global(bc, SLOT % name, argument_kind(bc, COMPLAIN))


def every_slot(bc):
    """Every slot this file has made, by the name each was made under."""
    made = getattr(bc, SLOTS_ON, None) or {}
    return {name: where for name, where in made.items() if name.startswith(SLOT % "")}


def emit(bc, fn, name, even_when_quiet=False, naming=None):
    """Say this place's word the first time control reaches here; `even_when_quiet` needs `LOUD`."""
    if not _wanted(SAYING or (even_when_quiet and LOUD), naming):
        return []
    complain = function_named(bc, COMPLAIN)
    slot = slot_for(bc, name)
    said = "already said %s" % name

    def op(what, **operands):
        return written(template(bc, what), **operands)

    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        op("GetGlobal", **{"dst": holds, "global": slot}),
        (op("JNotNull", reg=holds), said),
        # the word itself becomes the mark, so nothing has to invent a second thing to store
        op("GetGlobal", **{"dst": holds, "global": text_object(bc, word_for(name))}),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
        op("SetGlobal", **{"global": slot, "src": holds}),
        said + ":",
        op("Label"),
    ], BYPASS if even_when_quiet else VOCABULARY, word=naming)


def emit_saying(bc, fn, name, what):
    """Say what is IN `what` right now, once per game, latched on a slot of `name`'s own."""
    if not _wanted(SAYING):
        return []
    complain = function_named(bc, COMPLAIN)
    slot = slot_for(bc, name)
    said = "already said %s" % name

    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)

    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        (op("JNull", reg=what), said),
        op("GetGlobal", **{"dst": holds, "global": slot}),
        (op("JNotNull", reg=holds), said),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=what),
        op("SetGlobal", **{"global": slot, "src": what}),
        said + ":",
        op("Label"),
    ], VOCABULARY)


def emit_while(bc, fn, name, flag):
    """Say this place's word whenever `flag` is raised; the CALLER latches (one path per row)."""
    if not _wanted(SAYING):
        return []
    complain = function_named(bc, COMPLAIN)
    past = "past saying %s" % name

    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)

    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        (op("JFalse", cond=flag), past),
        op("GetGlobal", **{"dst": holds, "global": text_object(bc, word_for(name))}),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
        past + ":",
        op("Label"),
    ], VOCABULARY)


def emit_always(bc, fn, what, naming=None):
    """Say what is in `what` every time control passes; NO LATCH, so never on a per-tick path."""
    if not _wanted(SAYING_THE_VALUE, naming):
        return []
    complain = function_named(bc, COMPLAIN)
    # named after the place it reads, so two of these in one block cannot name one label twice
    past = "nothing to say at %d" % what

    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)

    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        (op("JNull", reg=what), past),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=what),
        past + ":",
        op("Label"),
    ], VALUE, word=naming)


def emit_word_now(bc, fn, name, naming=None, once=False):
    """Say this word whatever `SAYING` is, for a diagnosis a build carries; rides the bypass."""
    if once:
        return emit(bc, fn, name, even_when_quiet=True, naming=naming)
    if not _wanted(LOUD, naming):
        return []
    complain = function_named(bc, COMPLAIN)

    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)

    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        op("GetGlobal", **{"dst": holds, "global": text_object(bc, word_for(name))}),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
    ], BYPASS, word=naming)


def emit_word_always(bc, fn, name, even_when_quiet=False, naming=None):
    """Say this place's word EVERY time control passes (how many); no latch, no slot."""
    if not _wanted(SAYING or (even_when_quiet and LOUD), naming):
        return []
    complain = function_named(bc, COMPLAIN)

    def op(what_op, **operands):
        return written(template(bc, what_op), **operands)

    holds = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    return _gated(bc, fn, [
        op("GetGlobal", **{"dst": holds, "global": text_object(bc, word_for(name))}),
        op("Call1", dst=discarded, fun=gv(complain.findex), arg0=holds),
    ], BYPASS if even_when_quiet else VOCABULARY, word=naming)


def armed():
    """Every word slot the world's own emptying was built to arm again, as it was built."""
    return list(_ARMED)


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. Every word latched HERE is armed again at a new state (none is fine)."""
    _ARMED[:] = sorted(every_slot(bc).values())
    return [instruction for where in _ARMED
            for instruction in emit_empty(bc, fn, where, into)]
