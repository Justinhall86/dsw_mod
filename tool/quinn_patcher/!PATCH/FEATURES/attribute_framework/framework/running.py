#!/usr/bin/env python3
"""What one receiver is granted of one trait over one pass, keyed receiver then trait."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, function_named, kind_named, number, returns_type,
                          slot_global, template, text_object, written)
from framework.oneshot import MAKE, MAP, TELL
from framework.parsed import READ, a_new_place

# our own place: one map per receiver, and inside it one number per trait
SLOT = "what each receiver is being granted this pass"
# WHO THE GRANT COUNTS FOR, keyed as the totals and living as long; empty = the owner
CREDIT = "which faction each receiver's trait is being credited to this pass"
# A PASS BORROWS THE SLOT (a game string map by trait id), restoring it at every exit
from framework.boundary import BY_VALUE as GET
from framework.tray import A_NEW_ONE as PER_RECEIVER, ONE_PER_RESOURCE as INNER
SET = "haxe.ds.StringMap.set"
# where the two readers leave when there is nothing yet
NOTHING_YET = "this receiver has no total for that trait"
# ⛔ A STAMPED TOTAL IS KEPT APART: trait, this, the faction's number; without it, every stamp's
STAMPED_TO, JOINED_BY, AS_TEXT = " | stamped to ", "$String.__add__", "$Std.string"
FACTION, ITS_NUMBER = "ent.Faction", "__uid"


def make_slot(bc):
    """MAKE both places. Empty until a road puts a map there."""
    slot_global(bc, CREDIT, kind_named(bc, MAP))
    return slot_global(bc, SLOT, kind_named(bc, MAP))


def slot(bc, which=SLOT):
    """READ one of those places. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(which)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def emit_remember(bc, fn, saved):
    """WHAT WAS IN THE SLOT WHEN THIS PASS BEGAN; ⛔ goes where the road counts itself in."""
    return [_op(bc, "GetGlobal", **{"dst": saved, "global": slot(bc)})]


def emit_remember_credits(bc, fn, saved):
    """The same, for the credits beside them."""
    return [_op(bc, "GetGlobal", **{"dst": saved, "global": slot(bc, CREDIT)})]


def emit_take_it(bc, fn, into):
    """A FRESH MAP IN THE SLOT (and in `into`): the fresh map IS the emptying."""
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    return [
        _op(bc, "New", dst=into),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=into),
        _op(bc, "SetGlobal", **{"global": slot(bc), "src": into}),
    ]


def emit_take_credits(bc, fn, into):
    """A FRESH CREDIT MAP IN ITS SLOT, emptied the way the totals beside it are emptied."""
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    return [
        _op(bc, "New", dst=into),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=into),
        _op(bc, "SetGlobal", **{"global": slot(bc, CREDIT), "src": into}),
    ]


def emit_give_back_credits(bc, fn, saved):
    """The outer pass gets its credits back, at EVERY exit -- the totals' own rule."""
    return [_op(bc, "SetGlobal", **{"global": slot(bc, CREDIT), "src": saved})]


def emit_give_back(bc, fn, saved):
    """THE OUTER PASS GETS ITS MAP BACK at EVERY exit, where the road counts itself out."""
    return [_op(bc, "SetGlobal", **{"global": slot(bc), "src": saved})]


def emit_ready(bc, fn, into, held=False):
    """The outer map in hand, made on first reach; with `held`, a FRESH private map in `into`."""
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    there = "there is a map of running totals"
    if held:
        return [
            _op(bc, "New", dst=into),
            _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=into),
        ]
    return [
        _op(bc, "GetGlobal", **{"dst": into, "global": slot(bc)}),
        (_op(bc, "JNotNull", reg=into), there),
        _op(bc, "New", dst=into),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=into),
        _op(bc, "SetGlobal", **{"global": slot(bc), "src": into}),
        there + ":",
        _op(bc, "Label"),
    ]


def emit_forget(bc, fn, outer, receiver, here):
    """START THIS RECEIVER AT NOTHING, once per pass; `here` names the place."""
    fresh = a_new_place(bc, fn, kind_named(bc, INNER))
    built = a_new_place(bc, fn, returns_type(function_named(bc, PER_RECEIVER), PER_RECEIVER))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    past = "%s: nothing to forget" % here
    return [
        (_op(bc, "JNull", reg=receiver), past),
        _op(bc, "New", dst=fresh),
        _op(bc, "Call1", dst=built, fun=gv(function_named(bc, PER_RECEIVER).findex), arg0=fresh),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=outer, arg1=receiver, arg2=fresh),
        past + ":",
        _op(bc, "Label"),
    ]


def emit_forget_once(bc, fn, outer, receiver, knowns, here):
    """START *THIS* RECEIVER AT NOTHING on first reach (else traits double); reads the known-map."""
    from framework import reach
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    # THE ANSWER IS CAST BEFORE IT IS TESTED, `settle.emit_touch`'s own shape
    seen = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    past = "%s: this receiver already started at nothing" % here
    fresh = "%s: nothing has been reached yet this pass" % here
    return [
        (_op(bc, "JNull", reg=receiver), past),
        # no map yet means no receiver has been reached, so this one is certainly the first
        (_op(bc, "JNull", reg=knowns), fresh),
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=knowns, arg1=receiver),
        _op(bc, "SafeCast", dst=seen, src=got),
        # in the map already: this pass cleared it once and has been adding to it since
        (_op(bc, "JNotNull", reg=seen), past),
        fresh + ":",
        _op(bc, "Label"),
    ] + emit_forget(bc, fn, outer, receiver, here) + [
        past + ":",
        _op(bc, "Label"),
    ]


def emit_stamped_keys(place, trait, faction, key, every):
    """`key`: the trait's total stamped to `faction`; `every`: its total of every stamp."""
    sep, as_faction = place.scratch_like(trait), place.scratch_of(FACTION)
    at, uid = place.field_of(FACTION, ITS_NUMBER)
    boxed, said = place.scratch_arg(AS_TEXT, 0), place.scratch_return(AS_TEXT)
    return [
        place.op("GetGlobal", **{"dst": sep, "global": place.text_object(STAMPED_TO)}),
        place.op("Call2", dst=every, fun=place.named_function(JOINED_BY), arg0=trait, arg1=sep),
        place.op("UnsafeCast", dst=as_faction, src=faction),
        place.op("Field", dst=uid, obj=as_faction, field=at),
        place.op("ToDyn", dst=boxed, src=uid),
        place.op("Call1", dst=said, fun=place.named_function(AS_TEXT), arg0=boxed),
        place.op("Call2", dst=key, fun=place.named_function(JOINED_BY), arg0=every, arg1=said),
    ]


def emit_add(place, receiver, trait, value, into):
    """ADD this row's value to this receiver's running total of the trait; `into` gets the TOTAL."""
    outer = place.scratch_of(MAP)
    inner = place.scratch_of(INNER)
    fresh = place.scratch_return(PER_RECEIVER)
    got = place.scratch_return(READ)
    had = place.scratch_return(GET)
    boxed = place.scratch_return(READ)
    told = place.scratch_return(TELL)
    put = place.scratch_return(SET)
    # labelled by the trait's own place: one act adds under up to three keys
    mine = place.here("%d: this receiver has a map of its own" % trait)
    none = place.here("%d: %s" % (trait, NOTHING_YET))
    return [
        # THE SLOT, where the road has already put this pass's own map
        place.op("GetGlobal", **{"dst": outer, "global": place.slot(SLOT)}),
        (place.op("JNull", reg=outer), none),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=outer, arg1=receiver),
        place.op("SafeCast", dst=inner, src=got),
        (place.op("JNotNull", reg=inner), mine),
        # no pass has opened for this receiver, so one is opened here rather than drop the row
        place.op("New", dst=inner),
        place.op("Call1", dst=fresh, fun=place.named_function(PER_RECEIVER), arg0=inner),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=outer, arg1=receiver, arg2=inner),
        mine + ":",
        place.op("Label"),
        # ⛔ ONE PATH TO THE WRITE: nothing yet reads as zero and is ADDED to, never skipped
        place.op("Int", dst=into, ptr=place.number(0)),
        place.op("Call2", dst=had, fun=place.named_function(GET), arg0=inner, arg1=trait),
        (place.op("JNull", reg=had), none),
        place.op("SafeCast", dst=into, src=had),
        none + ":",
        place.op("Label"),
        place.op("Add", dst=into, a=into, b=value),
        place.op("ToDyn", dst=boxed, src=into),
        place.op("Call3", dst=put, fun=place.named_function(SET),
                 arg0=inner, arg1=trait, arg2=boxed),
    ]


def emit_credit(place, receiver, trait, value, tag, plain):
    """WHO THIS RECEIVER'S TRAIT IS CREDITED TO; ⛔ called only where a rider was spelled."""
    outer = place.scratch_of(MAP)
    inner = place.scratch_of(INNER)
    fresh = place.scratch_return(PER_RECEIVER)
    got = place.scratch_return(READ)
    boxed = place.scratch_return(READ)
    told = place.scratch_return(TELL)
    put = place.scratch_return(SET)
    # `tag` names the caller: one act writes a credit twice, and labels must differ
    mine = place.here("%s: this receiver has a credit map of its own" % tag)
    none = place.here("%s: there is nowhere to write a credit" % tag)
    return [
        place.op("GetGlobal", **{"dst": outer, "global": place.slot(CREDIT)}),
        (place.op("JNull", reg=outer), none),
        (place.op("JNull", reg=receiver), none),
        (place.op("JNull", reg=trait), none),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=outer, arg1=receiver),
        place.op("SafeCast", dst=inner, src=got),
        (place.op("JNotNull", reg=inner), mine),
        place.op("New", dst=inner),
        place.op("Call1", dst=fresh, fun=place.named_function(PER_RECEIVER), arg0=inner),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=outer, arg1=receiver, arg2=inner),
        mine + ":",
        place.op("Label"),
        # ⛔ `ToDyn` FOR A PLAIN NUMBER, `UnsafeCast` FOR A THING WITH ITS OWN KIND (never box it)
        place.op("ToDyn" if plain else "UnsafeCast", dst=boxed, src=value),
        place.op("Call3", dst=put, fun=place.named_function(SET),
                 arg0=inner, arg1=trait, arg2=boxed),
        none + ":",
        place.op("Label"),
    ]


def check_what_we_borrow(bc):
    """The string-keyed map takes a text key, and the outer map takes one of ours first."""
    for what in (GET, SET):
        guard(gv(list(function_named(bc, what).regs)[0]) == kind_named(bc, INNER),
              "%s does not take a %s first" % (what, INNER))
    guard(gv(list(function_named(bc, PER_RECEIVER).regs)[0]) == kind_named(bc, INNER),
          "%s does not build a %s" % (PER_RECEIVER, INNER))


def install(bc):
    """Make both places and check what this borrows."""
    make_slot(bc)
    check_what_we_borrow(bc)
    text_object(bc, STAMPED_TO)
    return ("RUNNING: `%s` is a slot holding a %s per receiver of a %s per trait -- the total a "
            "pass has granted so far, which is what the engine is handed instead of one row's "
            "own number -- and `%s` beside it holds who that total counts for, written only "
            "where a rider said" % (SLOT, MAP, INNER, CREDIT))
