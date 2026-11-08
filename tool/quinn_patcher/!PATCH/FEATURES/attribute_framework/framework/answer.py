#!/usr/bin/env python3
"""An array of our own for the engine to answer into, so nothing of ours walks its shared buffer."""
from tools.project import gv, guard
from tools.hlcode import SLOTS_ON, kind_named, number, slot_global, template, written
from framework.parsed import a_new_place
from framework.tray import ARRAY_OF_ENTRIES, recipe

# our own place for it, and what the engine puts in one: its own application objects
SLOT = "an array for the engine to answer into"
HOLDS = "logic.Application"


def make_slot(bc):
    """MAKE the place. Empty until a road puts an array there."""
    return slot_global(bc, SLOT, kind_named(bc, ARRAY_OF_ENTRIES))


def slot(bc):
    """READ that place. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(SLOT)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def emit_ready(bc, fn, into, here):
    """One array, made once from a type and a count (⛔ a bare `New` has no backing), kept."""
    made = recipe(bc)
    counted = a_new_place(bc, fn, made["of"]["counted"])
    typed = a_new_place(bc, fn, made["of"]["typed"])
    raw = a_new_place(bc, fn, made["of"]["raw"])
    backing = a_new_place(bc, fn, made["of"]["backing"])
    there = "%s: there is an array to answer into" % here
    return [
        _op(bc, "GetGlobal", **{"dst": into, "global": slot(bc)}),
        (_op(bc, "JNotNull", reg=into), there),
        _op(bc, "Int", dst=counted, ptr=number(bc, 0)),
        _op(bc, "Type", dst=typed, ty=kind_named(bc, HOLDS)),
        _op(bc, "Call2", dst=raw, fun=made["alloc"], arg0=typed, arg1=counted),
        _op(bc, "UnsafeCast", dst=backing, src=raw),
        _op(bc, "Call1", dst=into, fun=made["wrap"], arg0=backing),
        _op(bc, "SetGlobal", **{"global": slot(bc), "src": into}),
        there + ":",
        _op(bc, "Label"),
    ]


def install(bc):
    """Make the place. The road fills it once and the act hands it to the engine."""
    make_slot(bc)
    guard(slot(bc) is not None, "the answer array's place was not made")
    return ("ANSWER: `%s` is a %s of %s, made once and handed to the engine so its own shared "
            "buffer is never what we walk" % (SLOT, ARRAY_OF_ENTRIES, HOLDS))
