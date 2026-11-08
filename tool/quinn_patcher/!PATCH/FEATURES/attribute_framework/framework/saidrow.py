#!/usr/bin/env python3
"""Which authored rows the walk reaches, and on whom, said once per APPLICATION per game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, function_named, kind_named, register_like,
                          returns_type, slot_global, template, text_object, written)
from framework.sayonce import COMPLAIN, SAYING


def _naming():
    """Is the row naming wanted? `standalone/onoff.py` has its own switch (not `SAYING`)."""
    from standalone import onoff
    return SAYING or onoff.on("saidrownames")
from framework import board  # noqa: E402
from framework.loadguard import clear_site, emit_empty
from framework.oneshot import ASK, MAKE, MAP, TELL
from framework.parsed import READ, a_new_place

# what our own place for the map is called
SLOT = "rows already said"
# where the block leaves once this thing has a map of its own
MINE = "this thing has a map of its own"
# said in front of each pair, so one word counts them and one word finds them
TAG = "SPINE reached"
# where the block leaves when this application has said itself already
SAID = "this row has said itself"
# the two ends of asking the map, and where the marking leaves
OLD, ASKED, TOLD = "this row is not new", "the map has been asked", "this row is put away"


def make_slot(bc):
    """MAKE our own place for the map. Empty until the walk's opening puts one there."""
    return slot_global(bc, SLOT, kind_named(bc, MAP))


def slot(bc):
    """READ that place: the one this file already has. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(SLOT)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def check_what_we_borrow(bc):
    """The map takes our key, and the complaint channel takes the text we hand it."""
    kind = kind_named(bc, MAP)
    for what in (ASK, TELL, MAKE):
        guard(gv(list(function_named(bc, what).regs)[0]) == kind,
              "%s does not take one of our maps first" % what)
    guard(argument_kind(bc, ASK) == argument_kind(bc, TELL),
          "%s and %s disagree about what a key is" % (ASK, TELL))


def says_text(bc, kind, what):
    """Refuse a field that is not the text the complaint channel takes."""
    guard(kind == argument_kind(bc, COMPLAIN),
          "%s is a t@%s and %s says a t@%s"
          % (what, kind, COMPLAIN, argument_kind(bc, COMPLAIN)))
    return kind


def emit_ready(bc, fn):
    """ON FIRST USE: the map, read into a place of its own and made only when there is none."""
    made = slot(bc)
    guard(made is not None, "there is no place for the map yet -- install goes first")
    holds = a_new_place(bc, fn, kind_named(bc, MAP))
    return [
        _op(bc, "GetGlobal", **{"dst": holds, "global": made}),
        (_op(bc, "JNotNull", reg=holds), "there is a map of rows said"),
        _op(bc, "New", dst=holds),
        _op(bc, "Call1", dst=a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE)),
            fun=gv(function_named(bc, MAKE).findex), arg0=holds),
        _op(bc, "SetGlobal", **{"global": made, "src": holds}),
        "there is a map of rows said:",
        _op(bc, "Label"),
    ], holds


def emit_for_this_receiver(bc, fn, holds, receiver, key, flag):
    """Raise `flag` when this row is not yet counted for THIS RECEIVER this pass; tells at once."""
    mine = "this receiver has a counted map of its own"
    done = mine + ", and this row is not new to it"
    inner = a_new_place(bc, fn, kind_named(bc, MAP))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    asked = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    return [
        _op(bc, "Bool", dst=flag, value=False),
        (_op(bc, "JNull", reg=receiver), done),
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=holds, arg1=receiver),
        _op(bc, "SafeCast", dst=inner, src=got),
        (_op(bc, "JNotNull", reg=inner), mine),
        _op(bc, "New", dst=inner),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=inner),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=holds, arg1=receiver, arg2=inner),
        mine + ":",
        _op(bc, "Label"),
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, ASK).findex),
            arg0=inner, arg1=key),
        (_op(bc, "JTrue", cond=asked), done),
        _op(bc, "Bool", dst=flag, value=True),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=inner, arg1=key, arg2=key),
        done + ":",
        _op(bc, "Label"),
    ]


def emit_for_this_thing(bc, fn, holds, thing):
    """The map belonging to THIS thing (an application is shared by its reader's things)."""
    inner = a_new_place(bc, fn, kind_named(bc, MAP))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    return [
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=holds, arg1=thing),
        _op(bc, "SafeCast", dst=inner, src=got),
        (_op(bc, "JNotNull", reg=inner), MINE),
        # the first time this thing is walked, and only then: a map of its own, filed under it
        _op(bc, "New", dst=inner),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=inner),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=holds, arg1=thing, arg2=inner),
        MINE + ":",
        _op(bc, "Label"),
    ], inner


def emit_ask(bc, fn, holds, key, flag, words):
    """Raise `flag` for an application not walked before; `emit_mark` tells the map later."""
    complain = function_named(bc, COMPLAIN)
    guard(words, "nothing was handed over to say, so this would latch and say nothing")
    asked = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    tag = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    return [
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, ASK).findex),
            arg0=holds, arg1=key),
        (_op(bc, "JTrue", cond=asked), OLD),
        _op(bc, "Bool", dst=flag, value=True),
        (_op(bc, "JAlways"), ASKED),
        OLD + ":",
        _op(bc, "Bool", dst=flag, value=False),
        ASKED + ":",
        _op(bc, "Label"),
    ] + ([] if not _naming() else board.said(bc, fn, "saidrownames", lambda:
         # an id that is not there is not a fault and is not a line either
         [(_op(bc, "JNull", reg=word), SAID) for word in words] + [
             (_op(bc, "JFalse", cond=flag), SAID),
             _op(bc, "GetGlobal", **{"dst": tag, "global": text_object(bc, TAG)}),
             _op(bc, "Call1", dst=discarded, fun=gv(complain.findex), arg0=tag),
         ] + [
             _op(bc, "Call1", dst=discarded, fun=gv(complain.findex), arg0=word)
             for word in words
         ] + [
             SAID + ":",
             _op(bc, "Label"),
         ]))


def emit_mark(bc, fn, holds, key, flag):
    """PAST THE WHOLE ROAD: this application has said itself now (the map is a SET)."""
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    return [
        (_op(bc, "JFalse", cond=flag), TOLD),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=holds, arg1=key, arg2=key),
        TOLD + ":",
        _op(bc, "Label"),
    ]


def emit_say(bc, fn, holds, key, words):
    """Say the tag, then each word (places holding text), the first time `key` is walked."""
    if not _naming():
        return []
    complain = function_named(bc, COMPLAIN)
    guard(words, "nothing was handed over to say, so this would latch and say nothing")
    asked = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    discarded = a_new_place(bc, fn, returns_type(complain, COMPLAIN))
    tag = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    return [
        # an id that is not there says nothing, tested BEFORE the map latches anything
        (_op(bc, "JNull", reg=word), SAID) for word in words
    ] + [
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, ASK).findex),
            arg0=holds, arg1=key),
        (_op(bc, "JTrue", cond=asked), SAID),
        _op(bc, "GetGlobal", **{"dst": tag, "global": text_object(bc, TAG)}),
        _op(bc, "Call1", dst=discarded, fun=gv(complain.findex), arg0=tag),
    ] + [
        _op(bc, "Call1", dst=discarded, fun=gv(complain.findex), arg0=word) for word in words
    ] + [
        # the map is a SET, so the key is its own value
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=holds, arg1=key, arg2=key),
        SAID + ":",
        _op(bc, "Label"),
    ]


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. The map goes when a new state begins, so a second game says the rows again."""
    made = slot(bc)
    guard(made is not None, "there is no place for the map yet -- install goes first")
    return emit_empty(bc, fn, made, into)


def install(bc):
    """Make the place for the map and mint the tag. The walk is what says anything with it."""
    make_slot(bc)
    text_object(bc, TAG)
    check_what_we_borrow(bc)
    # the emptying goes onto a COPY, as every other store's does, which checks it
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, MAP))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 1)
    return ("SAID ROW: `%s` is a slot of its own holding a %s, keyed by the application -- `%s` "
            "is minted, and %d instruction(s) empty it when a new world begins"
            % (SLOT, MAP, TAG, len(emptying)))
