#!/usr/bin/env python3
"""The carriers of rows a reach sent elsewhere, remembered so every road walks their stores too."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, function_named, kind_named, number, register_like,
                          returns_type, slot_global, template, written)
from framework.loadguard import clear_site, emit_empty
from framework.oneshot import ASK, MAKE, MAP, TELL
from framework.parsed import a_new_place
from framework.tray import ARRAY_OF_ENTRIES, PUSH

# the list itself, and the map saying what is already in it (so no carrier is pushed twice)
CARRIERS = "the things carrying a row a reach moved"
ALREADY = "the things already in that list"
# AND THE PLACE EACH CARRIER STANDS IN, for a SET reach: ⛔ remembered on its own pass, never read
STANDS = "the place each carrier stands in"
# what the road says when it remembers one, and when another thing walks one
REMEMBERED = "a carrier of a re-hosted row is remembered"
WALKED = "a re-hosted row is walked by another thing"


def make_slots(bc):
    """MAKE all three: the list, the map that says what is in it, and where each one stands."""
    return {CARRIERS: slot_global(bc, CARRIERS, kind_named(bc, ARRAY_OF_ENTRIES)),
            ALREADY: slot_global(bc, ALREADY, kind_named(bc, MAP)),
            STANDS: slot_global(bc, STANDS, kind_named(bc, MAP))}


def slot(bc, which=CARRIERS):
    """READ a place this file made. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(which)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def emit_ready(bc, fn, list_into, map_into, here, of_kind, stands_into=None):
    """Both places, made on first reach; the list ALLOCATED and wrapped, never a bare `New`."""
    from framework import tray
    recipe = tray.recipe(bc)
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    counted = a_new_place(bc, fn, recipe["of"]["counted"])
    typed = a_new_place(bc, fn, recipe["of"]["typed"])
    raw = a_new_place(bc, fn, recipe["of"]["raw"])
    backing = a_new_place(bc, fn, recipe["of"]["backing"])
    there, mapped = "%s: a list already" % here, "%s: a map already" % here
    return [
        _op(bc, "GetGlobal", **{"dst": list_into, "global": slot(bc, CARRIERS)}),
        (_op(bc, "JNotNull", reg=list_into), there),
        _op(bc, "Int", dst=counted, ptr=number(bc, 0)),
        _op(bc, "Type", dst=typed, ty=of_kind),
        _op(bc, "Call2", dst=raw, fun=recipe["alloc"], arg0=typed, arg1=counted),
        _op(bc, "UnsafeCast", dst=backing, src=raw),
        _op(bc, "Call1", dst=list_into, fun=recipe["wrap"], arg0=backing),
        _op(bc, "SetGlobal", **{"global": slot(bc, CARRIERS), "src": list_into}),
        there + ":",
        _op(bc, "Label"),
        _op(bc, "GetGlobal", **{"dst": map_into, "global": slot(bc, ALREADY)}),
        (_op(bc, "JNotNull", reg=map_into), mapped),
        _op(bc, "New", dst=map_into),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=map_into),
        _op(bc, "SetGlobal", **{"global": slot(bc, ALREADY), "src": map_into}),
        mapped + ":",
        _op(bc, "Label"),
    ] + ([] if stands_into is None else [
        # and the third, made the same way, or the remembering would write into nothing
        _op(bc, "GetGlobal", **{"dst": stands_into, "global": slot(bc, STANDS)}),
        (_op(bc, "JNotNull", reg=stands_into), "%s: places already" % here),
        _op(bc, "New", dst=stands_into),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=stands_into),
        _op(bc, "SetGlobal", **{"global": slot(bc, STANDS), "src": stands_into}),
        "%s: places already" % here + ":",
        _op(bc, "Label"),
    ])


def emit_remember(bc, fn, thing, holds, known, where, stands=None, standing=None):
    """PUT THIS THING IN THE LIST once; `standing` (its place) goes to `stands`, on its own pass."""
    asked = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, PUSH), PUSH))
    return [
        _op(bc, "Call2", dst=asked, fun=gv(function_named(bc, ASK).findex),
            arg0=known, arg1=thing),
        (_op(bc, "JTrue", cond=asked), where),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=known, arg1=thing, arg2=thing),
        _op(bc, "Call2", dst=pushed, fun=gv(function_named(bc, PUSH).findex),
            arg0=holds, arg1=thing),
    ] + ([] if stands is None or standing is None else [
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=stands, arg1=thing, arg2=standing),
    ])


def emit_how_many(bc, fn, holds, into, count_at, here):
    """How many carriers there are, which is how many passes a walk adds past the game's own."""
    none = "%s: no carriers yet" % here
    return [_op(bc, "Int", dst=into, ptr=number(bc, 0)),
            (_op(bc, "JNull", reg=holds), none),
            _op(bc, "Field", dst=into, obj=holds, field=count_at),
            none + ":",
            _op(bc, "Label")]


def emit_the_one_at(bc, fn, holds, which, into, backing_at, backing_kind):
    """The carrier at that place in the list, as a thing a store can be read off."""
    backing = a_new_place(bc, fn, backing_kind)
    got = a_new_place(bc, fn, kind_named(bc, "Dyn"))
    return [_op(bc, "Field", dst=backing, obj=holds, field=backing_at),
            _op(bc, "GetArray", dst=got, array=backing, index=which),
            _op(bc, "UnsafeCast", dst=into, src=got)]


def emit_at_a_new_world(bc, fn, list_into, map_into):
    """NOT A STAGE. The list and its map go at a new state, each through a place of its OWN kind."""
    return (emit_empty(bc, fn, slot(bc, CARRIERS), list_into)
            + emit_empty(bc, fn, slot(bc, ALREADY), map_into)
            # the third goes with them: a place in the world that was is worth less than nothing
            + emit_empty(bc, fn, slot(bc, STANDS), map_into))


def install(bc):
    """Make both places and empty them when a new world begins."""
    make_slots(bc)
    guard(slot(bc, CARRIERS) is not None, "the carriers' list was not made")
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, ARRAY_OF_ENTRIES))))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, MAP))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 2,
                                   len(beginning.regs) - 1)
    guard(slot(bc, STANDS) is not None, "the carriers' places were not made")
    return ("REHOSTED: `%s` is a %s of the things carrying a row a reach moved, with `%s` beside "
            "it saying what is already in it and `%s` saying where each one stands, and %d "
            "instruction(s) empty all three when a new world begins"
            % (CARRIERS, ARRAY_OF_ENTRIES, ALREADY, STANDS, len(emptying)))
