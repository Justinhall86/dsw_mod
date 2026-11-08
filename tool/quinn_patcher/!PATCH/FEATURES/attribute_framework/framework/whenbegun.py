#!/usr/bin/env python3
"""Was this row applied in this session, or did it come back out of a save? (`OnThis` pays once)"""
from tools.project import guard
from tools.hlcode import SLOTS_ON, argument_kind, slot_global, template, text_object, written
from framework.sayonce import COMPLAIN
from framework import mark
from framework.loadguard import emit_empty
from framework.parsed import a_new_place

# our own place for the answer, and the word put in it. Empty means restored, anything means made
SLOT = "this world was made"
MADE = "made"


def make_slot(bc):
    """MAKE the place that says a world was built rather than restored. Empty until it is."""
    return slot_global(bc, SLOT, argument_kind(bc, COMPLAIN))


def slot(bc):
    """READ that place: the one this file already has. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(SLOT)


def emit_it_was_made(bc, holds):
    """At the turning-on only a BUILT world reaches, say so; the caller allocates `holds`."""
    where = slot(bc)
    guard(where is not None, "there is no place for it yet -- make it before filling it")
    return [written(template(bc, "GetGlobal"),
                    **{"dst": holds, "global": text_object(bc, MADE)}),
            written(template(bc, "SetGlobal"), **{"global": where, "src": holds})]


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. A world begins knowing nothing about how the last one started."""
    return emit_empty(bc, fn, slot(bc), into)


def emit_forget_what_a_restore_raised(bc, fn, maps):
    """On a RESTORED world, drop every mark raised before now (⛔ never asked at the filing)."""
    where = slot(bc)
    guard(where is not None, "there is no place for it yet -- make it before reading it")
    made = a_new_place(bc, fn, argument_kind(bc, COMPLAIN))
    keep = "this world was made, so its marks stand"

    def op(what, **operands):
        return written(template(bc, what), **operands)

    return ([op("GetGlobal", **{"dst": made, "global": where}),
             (op("JNotNull", reg=made), keep)]
            + mark.emit_at_a_new_world(bc, fn, maps)
            + [keep + ":", op("Label")])
